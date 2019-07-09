/****************************************************************************
**
** Copyright (C) 2019 Ratchanan Srirattanamet. All rights reserved.
**
** Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of the copyright holder nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
**
****************************************************************************/

import QtQuick 2.2
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.1
import QtSensors 5.9

import "../orientationHelper.js" as OrientationHelper

Page {
    id: root

    header: ToolBar {
        Label {
            text: "QML Orientation Demo"
            font.pixelSize: 20

            anchors.centerIn: parent
        }
    }

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
                text: "" // Will be updated in updateOrientationText()
            }
        }

        RowLayout {
            Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter

            Text {
                id: primaryOrientationIntroText
                text: "Current primaryOrientation: "
                font.bold: true
            }

            Text {
                id: primaryOrientationText
                text: OrientationHelper.getOrientationStr(Screen.primaryOrientation) + " (" + Screen.primaryOrientation.toString(10) + ")";
            }
        }

        RowLayout {
            Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter

            Text {
                text: "QScreen nativeOrientation: "
                font.bold: true
            }

            Text {
                text: OrientationHelper.getOrientationStr(orientationDemoNativeOrientation);
            }
        }

        RowLayout {
            Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter

            Text {
                text: "OrientationSensor reading: "
                font.bold: true
            }

            Text {
                id: orientationSensorText
                text: 'Unavailable'
            }
        }

        Text {
            id: instructionText
            text: "Rotate the screen to see difference"

            Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
            Layout.topMargin: 30
        }

        Button {
            id: manualUpdateButton
            text: "Manually update orientation text"

            Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter

            onClicked: {
                updateOrientationText();
            }
        }

        Button {
            id: licenseButton
            text: "License"

            Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
            Layout.topMargin: 30

            onClicked: {
                root.StackView.view.push("qrc:/pages/LicensePage.qml");
            }
        }
    }

    OrientationSensor {
        id: orientationSensor
        active: true

        onReadingChanged: {
            orientationSensorText.text = OrientationHelper.getOrientationSensorReadingStr(reading.orientation) + " (" + reading.orientation.toString(10) + ")"
        }
    }

    function updateOrientationText() {
        console.log("updateOrientationText() called.");
        orientationText.text = OrientationHelper.getOrientationStr(Screen.orientation) + " (" + Screen.orientation.toString(10) + ")";
    }

    Component.onCompleted: {
        Screen.orientationChanged.connect(updateOrientationText);
        updateOrientationText();
    }
}
