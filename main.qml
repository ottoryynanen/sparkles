// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause

import QtQuick
import QtQuick.Window
import QtQuick.Controls 2.2

Pane {
    id: window
    width: Screen.width
    height: Screen.height
    visible: true
    Row {
        id: propertiesRow
        spacing: 20
        height: magnitudeEntry.height
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        Label {
            id: magnitudeQuery
            text: "Magnitude (" + uiProperties.minimum + "-" + uiProperties.maximum + "):"
            anchors.verticalCenter: parent.verticalCenter
        }
        TextField {
            id: magnitudeEntry
            width: 200
            height: 50
            placeholderText: uiProperties.magnitude
            verticalAlignment: Text.AlignVCenter
            inputMethodHints: Qt.ImhDigitsOnly
            onAccepted: uiProperties.magnitude = parseInt(magnitudeEntry.text)
            onFocusChanged: {
                if (!focus) {
                    uiProperties.magnitude = parseInt(magnitudeEntry.text)
                }
            }
        }
        Label {
            text: "Lifespan (1000 - 5000):"
            anchors.verticalCenter: parent.verticalCenter
        }
        TextField {
            id: lifespanEntry
            width: 200
            height: 50
            placeholderText: uiProperties.lifeSpan
            verticalAlignment: Text.AlignVCenter
            inputMethodHints: Qt.ImhDigitsOnly
            onAccepted: uiProperties.lifeSpan = parseInt(lifespanEntry.text)
            onFocusChanged: {
                if (!focus) {
                    uiProperties.lifeSpan = parseInt(lifespanEntry.text)
                }
            }
        }
        Button {
            text: "Crash"
            onClicked: {
                uiProperties.crash()
            }
        }
    }
    Particles {
        anchors.topMargin: 5
        anchors.top: propertiesRow.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
    }
    Component.onCompleted: {
        uiProperties.screenHeight = Screen.height
        uiProperties.screenWidth = Screen.width
    }
}
