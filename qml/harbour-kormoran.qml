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
import "pages"
import "models"

ApplicationWindow
{
    id: mainwindow
    allowedOrientations: defaultAllowedOrientations

    initialPage: Component { MainPage {} }
    cover: Qt.resolvedUrl("cover/CoverPage.qml")

    property alias settings: settings

    Settings
    {
        id: settings
    }

    Rectangle {
        id: infoBanner

        width: parent.width
        height: infoText.height + 2 * Theme.paddingMedium

        color: Theme.highlightBackgroundColor
        opacity: 0.0
        // On top of everything
        z: 1
        visible: opacity > 0.0

        function showText(text) {
            infoText.text = text
            opacity = 0.9
            console.log("INFO: " + text)
            closeTimer.restart()
        }

        Label {
            id: infoText
            anchors.top: parent.top
            anchors.topMargin: Theme.paddingMedium
            x: Theme.paddingMedium
            width: parent.width - 2 * Theme.paddingMedium
            color: Theme.highlightColor
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.Wrap
        }

        Behavior on opacity { FadeAnimation {} }

        Timer {
            id: closeTimer
            interval: 3000
            onTriggered: infoBanner.opacity = 0.0
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                closeTimer.stop()
                infoBanner.opacity = 0.0
            }
        }
    }
}


