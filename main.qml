import QtQuick 2.2
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3

import "orientationHelper.js" as OrientationHelper

Window {
    visible: true
    width: 640
    height: 480
    title: "QML orientation demo"

    ColumnLayout {
        anchors.centerIn: parent

        RowLayout {
            Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter

            Text {
                id: orientationIntroText
                text: "Current orientation: "
                font.bold: true
            }

            Text {
                id: orientationText
                text: OrientationHelper.getOrientationStr(Screen.orientation) + " (" + Screen.orientation.toString(10) + ")";
            }
        }

        Text {
            id: instructionText
            text: "Rotate the screen to see difference"

            Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
        }
    }

    Component.onCompleted: {
        // Set orientationUpdateMask to accept any orientation update
        Screen.orientationUpdateMask =
            Qt.PortraitOrientation |
            Qt.LandscapeOrientation |
            Qt.InvertedPortraitOrientation |
            Qt.InvertedLandscapeOrientation;
    }
}
