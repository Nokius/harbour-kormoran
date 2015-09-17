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

Page {
    id: mainpage

    SilicaListView {
        id: timelineView
        anchors.fill: parent
        spacing: Theme.paddingLarge
        opacity: busyIndicator.running ? 0.5 : 1.0
        quickScroll: true

        Behavior on opacity {
            NumberAnimation { duration: 300 }
        }

        ViewPlaceholder {
            enabled: (mainwindow.settings.authToken.length === 0) && (busyIndicator.running === false)
            text: qsTr("Start by authorizing the application to access your twitter content!")
        }

        header: PageHeader {
            title: qsTr("Kormoran")
        }

        VerticalScrollDecorator {}

        delegate: ListItem {}
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
            
            importModule('kormoran', function () {});

        }

        onError: {
            console.log('python error: ' + traceback);
        }

        onReceived: {
            console.log('got message from python: ' + data);
        }
    }
}