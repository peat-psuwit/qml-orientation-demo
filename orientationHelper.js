/****************************************************************************
**
** This code is modified from Qt 4 example, which has the following license:
**
** Copyright (C) 2015 The Qt Company Ltd.
** Contact: http://www.qt.io/licensing/
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** You may use this file under the terms of the BSD license as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
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
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

.pragma library

.import QtSensors 5.9 as QtSensors

var OrientationReading = QtSensors.OrientationReading;

function getOrientationStr(orientation) {
    var orientationString;
    if (orientation === Qt.PortraitOrientation) {
        orientationString = "Portrait";
    } else if (orientation === Qt.LandscapeOrientation) {
        orientationString = "Landscape";
    } else if (orientation === Qt.InvertedPortraitOrientation) {
        orientationString = "Portrait inverted";
    } else if (orientation === Qt.InvertedLandscapeOrientation) {
        orientationString = "Landscape inverted";
    } else {
        orientationString = "UnknownOrientation";
    }
    return orientationString;
}

function getOrientationSensorReadingStr(orientation) {
    switch (orientation) {
    case OrientationReading.Undefined:
        return 'Undefined';
    case OrientationReading.TopUp:
        return 'TopUp';
    case OrientationReading.TopDown:
        return 'TopDown';
    case OrientationReading.LeftUp:
        return 'LeftUp';
    case OrientationReading.RightUp:
        return 'RightUp';
    case OrientationReading.FaceUp:
        return 'FaceUp';
    case OrientationReading.FaceDown:
        return 'FaceDown';
    default:
        return '???';
    }
}


