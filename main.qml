import QtQuick
import QtQuick.Window
import QtQuick.Controls 2.2
import QtQuick.VirtualKeyboard

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
            onAccepted: uiProperties.magnitude = text
            onFocusChanged: {
                if (!focus) {
                    uiProperties.magnitude = text
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
            onAccepted: uiProperties.lifeSpan = text
            onFocusChanged: {
                if (!focus) {
                    uiProperties.lifeSpan = text
                }
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

    InputPanel {
        id: inputPanel
        z: 99
        x: 0
        y: window.height
        width: window.width

        states: State {
            name: "visible"
            when: inputPanel.active
            PropertyChanges {
                target: inputPanel
                y: window.height - inputPanel.height
            }
        }
        transitions: Transition {
            from: ""
            to: "visible"
            reversible: true
            ParallelAnimation {
                NumberAnimation {
                    properties: "y"
                    duration: 250
                    easing.type: Easing.InOutQuad
                }
            }
        }
        onActiveChanged: {
            if (!active) {
                uiProperties.lifeSpan = parseInt(lifespanEntry.text)
                uiProperties.magnitude = parseInt(magnitudeEntry.text)
            }
        }
    }
    Component.onCompleted: {
        uiProperties.screenHeight = Screen.height
        uiProperties.screenWidth = Screen.width
    }
}
