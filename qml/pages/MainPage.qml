// Copyright 2018 The Authors. All rights reserved.
// Use of this source code is governed by a MIT-style
// license that can be found in the LICENSE file.

import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent

        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable,
        // SilicaListView or SilicaGridView
        PullDownMenu {
            MenuItem {
                text: qsTr("About")
                onClicked: pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
            }
            MenuItem {
                text: qsTr("Settings")
                onClicked: pageStack.push(Qt.resolvedUrl("SettingsPage.qml"))
            }
            MenuItem {
                text: qsTr("Refresh")
                onClicked: {
                    console.log("update list")
                }
            }
        }

        SilicaListView {
            id: listView
            model: 2
            anchors.fill: parent
            header: PageHeader {
                title: qsTr("Smart Locks")
            }
            delegate: BackgroundItem {
                id: delegate

                Label {
                    x: Theme.paddingLarge
                    text: qsTr("Office Door") + " " + index
                    anchors.verticalCenter: parent.verticalCenter
                    color: delegate.highlighted ?
                        Theme.highlightColor : Theme.primaryColor
                }
                onClicked: pageStack.push(Qt.resolvedUrl("DoorPage.qml"),
                                          {doorTitle: "Office Door " + index})
            }
            VerticalScrollDecorator {}
        }
    }
}
