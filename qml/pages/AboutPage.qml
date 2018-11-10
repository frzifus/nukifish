// Copyright 2018 The Authors. All rights reserved.
// Use of this source code is governed by a MIT-style
// license that can be found in the LICENSE file.

import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    allowedOrientations: defaultAllowedOrientations

    Image {
        id: logo
        source: "../img/nukifish.png"
        anchors.horizontalCenter: parent.horizontalCenter
        y: page.isPortrait ? 200 : 100
    }

    Label {
        id: appName
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: logo.bottom
        anchors.topMargin: 20
        font.bold: true
        text: "Nukifish"
    }
    Text {
        id: desc
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: appName.bottom
        anchors.topMargin: 20
        text: "Simple application to interact with the nuki bridge"
        color: "grey"
    }
    Text {
        id: copyright
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: desc.bottom
        anchors.topMargin: 20
        text: "Copyright: Benedikt Bongartz <br />License: MIT License"
        color: "grey"
    }
    Button {
        id: homepage
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: copyright.bottom
        anchors.topMargin: 20
        text: "<a href=\"https://github.com/frzifus/nukifish\">https://github.com/frzifus/nukifish</a>"
        onClicked: {
            Qt.openUrlExternally("https://github.com/frzifus/nukifish")
        }
    }

}
