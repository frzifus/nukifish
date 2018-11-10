// Copyright 2018 The Authors. All rights reserved.
// Use of this source code is governed by a MIT-style
// license that can be found in the LICENSE file.

import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    property QtObject nukiClient: null
    property string doorTitle: null

    Column {
        id: column
        width: page.width
        spacing: Theme.paddingLarge

        PageHeader {
            title: qsTr(doorTitle)
        }

        Text {
            id: desc
            anchors.horizontalCenter: parent.horizontalCenter
            y: page.isPortrait ? 200 : 100
            anchors.topMargin: 20
            text: "Status: unknown <br />Battery: unknown"
            color: "grey"
        }

        // TODO: load this buttons from the given action map
        Button {
            id: unlock
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: desc.bottom
            anchors.topMargin: 20
            text: "unlock"
            onClicked: {
                console.log("unlock " + doorTitle)
            }
        }

        Button {
            id: lock
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: unlock.bottom
            anchors.topMargin: 20
            text: "lock"
            onClicked: {
                console.log("lock " + doorTitle)
            }
        }

        Button {
            id: unlatch
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: lock.bottom
            anchors.topMargin: 20
            text: "unlatch"
            onClicked: {
                console.log("unlatch " + doorTitle)
            }
        }
    }
}
