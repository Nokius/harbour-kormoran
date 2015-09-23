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
        spacing: 10

        Row
        {
            anchors {
                left: parent.left
                right: parent.right
                margins: Theme.paddingLarge
            }
            spacing: 15

            Image {
                id: profileImage
                sourceSize { width: parent.width; height: parent.height }
                width: 80
                height: 80
                asynchronous: true
            }

            Binding {
                id: imageSourceBinding
                target: profileImage
                property: "source"
                value: profile_image_url
            }
            Column
            {
                Label {
                    id: itemUserName
                    text: username
                    font.pixelSize: Theme.fontSizeSmall
                    font.bold: true
                    truncationMode: TruncationMode.Fade
                }

                Label {
                    id: itemScreenName
                    text: '@' + screen_name
                    font.pixelSize: Theme.fontSizeTiny
                    font.italic: true
                    truncationMode: TruncationMode.Fade
                }
            }
        }

        Label {
            id: itemContent
            text: content
            font.pixelSize: Theme.fontSizeSmall
            wrapMode: Text.WordWrap
            maximumLineCount: 8
            truncationMode: TruncationMode.Fade
            anchors {
                left: parent.left
                right: parent.right
                margins: Theme.paddingLarge
            }
        }

        Label {
            id: itemSource
            text: source
            font.pixelSize: Theme.fontSizeTiny
            truncationMode: TruncationMode.Fade
            anchors {
                left: parent.left
                right: parent.right
                margins: Theme.paddingLarge
            }
        }
    }
}