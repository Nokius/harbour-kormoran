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
import "../models"
import "../utils/SettingsDatabase.js" as SettingsDatabase

Dialog {
    id: authorizationPage

    property Settings settings
    property Python python

    allowedOrientations: defaultAllowedOrientations
    acceptDestinationAction: PageStackAction.Pop
    //canAccept: true

    function acceptSettings() {
        settings.authToken = ocUrlTF.text;
        settings.authTokenSecret = ocUsernameTF.text;

        SettingsDatabase.transaction(function(tx) {
            SettingsDatabase.transactionSet(tx, "authToken", settings.authToken);
            SettingsDatabase.transactionSet(tx, "authTokenSecret", settings.authTokenSecret);
        });
    }

    onAccepted: {
        acceptSettings()
    }

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height + dlgheader.height

        Column
        {
            id: column
            anchors.top: parent.top
            width: parent.width

            DialogHeader
            {
                id: dlgheader
                acceptText: qsTr("Save Settings")
            }

            Button {
                text: qsTr("Authorize")
                onClicked: {
                    python.call('kormoran.getAuthorizationUrl', [], function(url) {
                        Qt.openUrlExternally(url);
                    });
                }
            }
        }
    }
}
