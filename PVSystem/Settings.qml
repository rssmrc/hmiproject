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
        //disable-enable testing slider
        Label{
            id: sliderLabel
            color: "#FFFFFF"
            text: "Testing Slider"
            x: w/2 - width/2
            y: h/20
        }

        Switch{
            id: sliderSwitch
            x: w/2 - width/2
            y: h/12
            checked: true

            onCheckedChanged:{
                Basics.testVisible()

            }
        }

        TextField {
            id: panelsAmount
            objectName: "panelsAmount"
            x: w/2 - width/2
            y: sliderSwitch.y + sliderSwitch.height*1.5
            width: 144
            height: 30
            font.pixelSize: 12
            placeholderText: qsTr("Panels Amount")
            onEditingFinished: emonvars.updateLocal(0,objectName,text)
        }

        TextField {
            id: tiltAngle
            objectName: "tiltAngle"
            x: w/2 - width/2
            y: panelsAmount.y + panelsAmount.height*1.5
            width: 144
            height: 30
            font.pixelSize: 12
            placeholderText: qsTr("Tilt Angle")

        }

    }

}
