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
    height: itemContent.height + profileImage.height + itemTimeAndSource.height + Theme.paddingSmall

    Image {
        id: profileImage
        sourceSize { width: parent.width; height: parent.height }
        width: 75
        height: 75
        asynchronous: true
        anchors {
            top: parent.top
            left: parent.left
        }
    }

    Binding {
        id: imageSourceBinding
        target: profileImage
        property: "source"
        value: profile_image_url
    }

    Label {
        id: itemUserName
        text: username
        font.pixelSize: Theme.fontSizeSmall
        font.bold: true
        truncationMode: TruncationMode.Fade
        anchors {
            top: parent.top
            left: profileImage.right
            leftMargin: Theme.paddingMedium
        }
    }

    Label {
        id: itemCreatedAt
        text: created_at
        font.pixelSize: Theme.fontSizeTiny
        truncationMode: TruncationMode.Fade
        horizontalAlignment: Text.AlignRight
        anchors {
            top: parent.top
            left: itemUserName.right
            right: parent.right
            leftMargin: Theme.paddingTiny
            rightMargin: Theme.paddingSmall
        }
    }

    Label {
        id: itemScreenName
        text: '@' + screen_name
        font.pixelSize: Theme.fontSizeTiny
        font.italic: true
        truncationMode: TruncationMode.Fade
        anchors {
            top: itemUserName.bottom
            left: profileImage.right
            right: parent.right
            leftMargin: Theme.paddingMedium
        }
    }

    Text {
        id: itemContent
        text: content
        textFormat: Text.StyledText
        width: parent.width
        height: this.contentHeight + 20
        font.pixelSize: Theme.fontSizeSmall
        color: Theme.primaryColor
        wrapMode: Text.WordWrap
        maximumLineCount: 20
        anchors {
            top: profileImage.bottom
            left: parent.left
            right: parent.right
            margins: Theme.paddingSmall
        }
    }

    Label {
        id: itemTimeAndSource
        text: source
        font.pixelSize: Theme.fontSizeTiny
        anchors {
            top: itemContent.bottom
            left: parent.left
            topMargin: Theme.paddingTiny
            bottomMargin: Theme.paddingMedium
            leftMargin: Theme.paddingSmall
        }
    }

    Label {
        id: itemRetweeter
        text: {
            retweeter_screen_name.length > 0 ? ' | RT by @' + retweeter_screen_name : "";
        }
        font.pixelSize: Theme.fontSizeTiny
        anchors {
            top: itemContent.bottom
            left: itemTimeAndSource.right
            topMargin: Theme.paddingTiny
            rightMargin: Theme.paddingSmall
        }
    }
}