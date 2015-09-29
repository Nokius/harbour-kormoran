/*
    Kormoran
    Copyright (C) 2015 Hauke Wesselmann
    Contact: Hauke Wesselmann <hauke@h-dawg.de>

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.
*/

import QtQuick 2.1
import Sailfish.Silica 1.0
import io.thp.pyotherside 1.4
import "../components"
import "../models"

Page {
    id: mainpage

    property TweetListModel tweetListModel: TweetListModel {}

    SilicaListView {
        id: timelineView
        anchors.fill: parent
        spacing: Theme.paddingLarge
        opacity: busyIndicator.running ? 0.5 : 1.0
        quickScroll: true

        Behavior on opacity {
            NumberAnimation { duration: 300 }
        }

        PullDownMenu {
            MenuItem {
                text: qsTr("Authorize")
                onClicked: {
                    var dialogResult = pageStack.push(Qt.resolvedUrl("AuthorizePage.qml"), {"python": python});
                    if (dialogResult.done === DialogResult.Accepted) {
                        refreshList();
                    }
                }
            }
            MenuItem {
                text: qsTr("Refresh")
                onClicked: refreshList();
            }
            MenuItem {
                text: qsTr("New Tweet")
                onClicked: newTweet();
            }
        }

        header: PageHeader {
            title: qsTr("Kormoran")
        }

        model: tweetListModel

        VerticalScrollDecorator {}

        delegate: TweetDelegate {}
    }

    BusyIndicator {
        id: busyIndicator
        anchors.centerIn: parent
        running: false
        size: BusyIndicatorSize.Large
    }

    Python {
        id: python

        Component.onCompleted: {
            var pythonPath = Qt.resolvedUrl('../../').substr('file://'.length);
            addImportPath(pythonPath);

            var tweepyPath = Qt.resolvedUrl('../../third-party/tweepy').substr('file://'.length);
            addImportPath(tweepyPath);

            var requestsPath = Qt.resolvedUrl('../../third-party/requests').substr('file://'.length);
            addImportPath(requestsPath);

            var requestsOauthlibPath = Qt.resolvedUrl('../../third-party/requests-oauthlib').substr('file://'.length);
            addImportPath(requestsOauthlibPath);

            var oauthlibPath = Qt.resolvedUrl('../../third-party/oauthlib').substr('file://'.length);
            addImportPath(oauthlibPath);

            var sixPath = Qt.resolvedUrl('../../third-party/six').substr('file://'.length);
            addImportPath(sixPath);

            importModule('kormoran', function () {});

            call('kormoran.initializeAPI', [StandardPaths.data], function(response) {});
        }

        onError: {
            console.log('python error: ' + traceback);
        }

        onReceived: {
            console.log('got message from python: ' + data);
        }
    }

    function refreshList() {
        busyIndicator.running = true
        busyIndicator.visible = true
        python.call('kormoran.loadTimeline', [], function(response){
            var resp = JSON.parse(response)
            tweetListModel.populate(resp)
            busyIndicator.running = false
            busyIndicator.visible = false
            });
    }

    function newTweet() {
        var dialogResult = pageStack.push(Qt.resolvedUrl("NewTweetPage.qml"), {"python": python});
        refreshList();
    }
}