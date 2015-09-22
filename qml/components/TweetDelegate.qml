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

ListItem {
    id: tweetDelegate
    contentHeight: delegateColumn.height

    Column
    {
        id: delegateColumn
        width: parent.width
        spacing: 5

        Label {
            id: itemScreenName
            text: '@' + screen_name
            font.pixelSize: Theme.fontSizeSmall
            truncationMode: TruncationMode.Fade
            anchors {
                left: parent.left
                right: parent.right
                margins: Theme.paddingLarge
            }
        }

        Label {
            id: itemUserName
            text: username
            font.pixelSize: Theme.fontSizeTiny
            font.italic: true
            truncationMode: TruncationMode.Fade
            anchors {
                left: parent.left
                right: parent.right
                 margins: Theme.paddingLarge
            }
        }

        Label {
            id: itemContent
            text: content
            font.pixelSize: Theme.fontSizeMedium
            wrapMode: Text.WordWrap
            maximumLineCount: 3
            truncationMode: TruncationMode.Fade
            anchors {
                left: parent.left
                right: parent.right
                margins: Theme.paddingLarge
            }
        }
    }
}