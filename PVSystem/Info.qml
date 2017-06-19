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

    function updateValues(){
        irradiation.text = emonvars.getValue(3)
        wattpeak.text = emonvars.getValue(8)
        tilt.text = emonvars.getValue(7)
        azimuth.text = emonvars.getValue(0)
        energy.text = emonvars.getValue(1)
        power.text = emonvars.getValue(2)
        battery.text = emonvars.getValue(6)
        panels.text = emonvars.getValue(4)
        yield.text = emonvars.getValue(5)
    }

    Rectangle{
        anchors.fill: parent

        Rectangle{



            width: w
            color: "#101010"
            anchors.top: parent.top

            Label{
                font.pixelSize: 25
                anchors.horizontalCenter: parent.horizontalCenter
                text: "General"
                color: "#FFFFFF"
                y: 10
            }
            //current time
            Label{
                font.pixelSize: 15
                text: "Irradiation: "
                color: "#FFFFFF"
                y: 46
                x: 21
            }
            Label{
                id: irradiation
                font.pixelSize: 15
                text: emonvars.getValue(3)
                color: "#FFFFFF"
                y: 46
                x: 177
            }
            Label{
                font.pixelSize: 15
                text: "Watt Peak: "
                color: "#FFFFFF"
                y: 80
                x: 21
            }
            Label{
                id: wattpeak
                font.pixelSize: 15
                text: emonvars.getValue(8)
                color: "#FFFFFF"
                y: 80
                x: 177
            }

            Label {
                x: 21
                y: 113
                color: "#ffffff"
                text: "Tilt Angle: "
                font.pixelSize: 15
            }

            Label {
                id: tilt
                x: 177
                y: 113
                color: "#ffffff"
                text: emonvars.getValue(7)
                font.pixelSize: 15
            }

            Label {
                x: 21
                y: 145
                color: "#ffffff"
                text: "Azimuth Angle: "
                font.pixelSize: 15
            }

            Label {
                id: azimuth
                x: 177
                y: 145
                color: "#ffffff"
                text: emonvars.getValue(0)
                font.pixelSize: 15
            }

            Label {
                x: 21
                y: 179
                color: "#ffffff"
                text: "Current Energy: "
                font.pixelSize: 15
            }

            Label {
                id: energy
                x: 177
                y: 179
                color: "#ffffff"
                text: emonvars.getValue(1)
                font.pixelSize: 15
            }

            Label {
                x: 21
                y: 212
                color: "#ffffff"
                text: "Inverter Power: "
                font.pixelSize: 15
            }

            Label {
                id: power
                x: 177
                y: 212
                color: "#ffffff"
                text: emonvars.getValue(2)
                font.pixelSize: 15
            }

            Label {
                x: 22
                y: 243
                color: "#ffffff"
                text: "Battery Percentage: "
                font.pixelSize: 15
            }

            Label {
                id: battery
                x: 177
                y: 243
                color: "#ffffff"
                text: emonvars.getValue(6) + "%"
                font.pixelSize: 15
            }

            Label {
                x: 22
                y: 277
                color: "#ffffff"
                text: "Panels Amount: "
                font.pixelSize: 15
            }

            Label {
                id: panels
                x: 177
                y: 277
                color: "#ffffff"
                text: emonvars.getValue(4)
                font.pixelSize: 15
            }

            Label {
                x: 22
                y: 310
                color: "#ffffff"
                text: "Panels Yield: "
                font.pixelSize: 15
            }

            Label {
                id: yield
                x: 177
                y: 310
                color: "#ffffff"
                text: emonvars.getValue(5)
                font.pixelSize: 15
            }


        }

        Rectangle{
            id: graph
            color: "#101010"
            height: window.height/2
            width: window.width/6 * 3
            y: 80
            x: window.width/2 - window.width/10
            border.width: 1
            border.color: "#2d2d2d"


        }
    }



}



