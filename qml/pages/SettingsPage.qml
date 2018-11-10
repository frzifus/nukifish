// Copyright 2018 The Authors. All rights reserved.
// Use of this source code is governed by a MIT-style
// license that can be found in the LICENSE file.

import QtQuick 2.0
import Sailfish.Silica 1.0


Page {
    id: page

    Column {
        id: column
        width: page.width
        spacing: Theme.paddingLarge

        PageHeader {
            title: qsTr("Settings")
        }

        Label {
            x: Theme.paddingLarge
            text: qsTr("Work in progress")
            color: Theme.secondaryHighlightColor
            font.pixelSize: Theme.fontSizeExtraLarge
        }

        SectionHeader {
            text: qsTr("General")
        }

        Row {
            width: parent.width -2 *x
            x: Theme.horizontalPageMargin
            Label {
                wrapMode: Text.WordWrap
                font.pixelSize: Theme.fontSizeSmall
                color: Theme.secondaryColor
                text: qsTr("Connection")
            }
        }

        TextField {
            id: addressField
            placeholderText: qsTr("Address")
            label: qsTr("Bridgte Address:")
            text: NukiConfig.stringValue("ip")
            width: parent.width
            EnterKey.iconSource: "image://theme/icon-m-enter-next"
            EnterKey.onClicked: portField.focus = true
        }

        TextField {
            id: portField
            placeholderText: qsTr("Port")
            label: qsTr("port")
            text: NukiConfig.stringValue("port")
            width: parent.width
            inputMethodHints: Qt.ImhDigitsOnly
            EnterKey.iconSource: "image://theme/icon-m-enter-next"
            EnterKey.onClicked: tokenField.focus = true
        }

        TextField {
            id: tokenField
            placeholderText: qsTr("Token")
            label: qsTr("token")
            text: NukiConfig.stringValue("token")
            width: parent.width
            EnterKey.iconSource: "image://theme/icon-m-enter-next"
        }

        Button {
            id:logoutButton
            text:qsTr("Save")
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                NukiConfig.stringSet("ip", addressField.text.trim())
                NukiConfig.stringSet("port", portField.text.trim())
                NukiConfig.stringSet("token", tokenField.text.trim())
                NukiConfig.save()
                pageStack.replaceAbove(null,Qt.resolvedUrl("MainPage.qml"));
            }
        }

    }
}
