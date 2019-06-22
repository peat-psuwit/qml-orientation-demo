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
import QtQuick.Controls 2.1

Page {
    id: root

    property string licenseText: "Loading..."

    header: ToolBar {
        ToolButton {
            text: "Back"
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            onClicked: root.StackView.view.pop()
        }

        Label {
            id: pageTitle
            text: "License"
            font.pixelSize: 20
            anchors.centerIn: parent
        }
    }

    Flickable {
        clip: true
        anchors.centerIn: parent
        width: parent.width - 30
        height: parent.height - 30
        contentWidth: width
        contentHeight: text.height

        Text {
            id: text

            anchors.left: parent.left
            anchors.right: parent.right
            wrapMode: Text.WordWrap

            text: root.licenseText
        }
    }

    Component.onCompleted: {
        var request = new XMLHttpRequest()
        request.open('GET','qrc:/LICENSE')
        request.onreadystatechange = function(event) {
            if (request.readyState === XMLHttpRequest.DONE) {
                licenseText = request.responseText;
            }
        }
        request.send()
    }
}
