// Copyright 2018 The Authors. All rights reserved.
// Use of this source code is governed by a MIT-style
// license that can be found in the LICENSE file.

import QtQuick 2.0
import Sailfish.Silica 1.0

CoverBackground {
    Label {
        id: label
        anchors.centerIn: parent
        text: qsTr("Nukifish")
    }

    CoverActionList {
        id: coverAction

        CoverAction {
            iconSource: "image://theme/icon-cover-refresh"
        }
    }
}
