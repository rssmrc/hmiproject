/****************************************************************************
 *
 *   Copyright (C) 2017 Marco Rossi. All rights reserved.
 *   Author: Marco Rossi <info@nerinformatica.it>
 *   Contributor: Luciano Neri <l.neri@nerinformatica.it>
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted under the LGPL v3 license
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 * COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
 * OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED
 * AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
 * ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 *
 ****************************************************************************/

import QtQuick 2.0
import QtQuick.Controls 2.1
import "basics.js" as Basics

Item {

    property int w
    property int h

    Rectangle{
        anchors.fill: parent

        TextField {
            id: apiKey
            objectName: "apiKey"
            x: w/2 - width/2
            y: height*0.5

            width: window.width - window.width*0.1
            height: window.height*0.1
            font.pixelSize: 12
            placeholderText: "API Key"
            onAccepted:{
                emonvars.buildHash(text);
            }
            MouseArea{
                anchors.fill: parent
                onClicked:{
                    apiKey.focus = true
                    Basics.keyboardToggle(parent.objectName)
                }
            }
        }

        TextField {
            id: panelsAmount
            objectName: "panelsAmount"
            x: w/2 - width/2
            y: apiKey.y + apiKey.height*1.5

            width: window.width - window.width*0.1
            height: window.height*0.1
            font.pixelSize: 12
            placeholderText: qsTr("Panels Amount")
            onAccepted:{
                emonvars.notifyChange(0,panelsAmount.text)

            }
            MouseArea{
                anchors.fill: parent
                onClicked:{
                    panelsAmount.focus = true
                    Basics.keyboardToggle(parent.objectName)
                }
            }
        }

        TextField {
            id: tiltAngle
            objectName: "tiltAngle"
            x: w/2 - width/2
            y: panelsAmount.y + panelsAmount.height*1.5

            width: window.width - window.width*0.1
            height: window.height*0.1
            font.pixelSize: 12
            placeholderText: qsTr("Tilt Angle")
            onAccepted: emonvars.notifyChange(1,tiltAngle.text)
            MouseArea{
                anchors.fill: parent
                onClicked:{
                    tiltAngle.focus = true
                    Basics.keyboardToggle(parent.objectName)
                }
            }
        }

        TextField {
            id: azimuthAngle
            objectName: "azimuthAngle"
            x: w/2 - width/2
            y: tiltAngle.y + tiltAngle.height*1.5

            width: window.width - window.width*0.1
            height: window.height*0.1
            font.pixelSize: 12
            placeholderText: qsTr("Azimuth Angle")
            onAccepted: emonvars.notifyChange(2,azimuthAngle.text)
            MouseArea{
                anchors.fill: azimuthAngle
                onClicked:{
                    panelsAmount.focus = true
                    Basics.keyboardToggle(parent.objectName)
                }
            }
        }

        TextField {
            id: wattPeak
            objectName: "wattPeak"
            x: w/2 - width/2
            y: azimuthAngle.y + azimuthAngle.height*1.5

            width: window.width - window.width*0.1
            height: window.height*0.1
            font.pixelSize: 12
            placeholderText: qsTr("Watt Peak")
            onEditingFinished: emonvars.notifyChange(3,wattPeak.text)
            MouseArea{
                anchors.fill: parent
                onClicked:{
                    wattPeak.focus = true
                    Basics.keyboardToggle(parent.objectName)
                }
            }
        }

    }

}
