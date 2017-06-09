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

        Rectangle{
            width: w
            height: h/3
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
                text: "Time: "
                color: "#FFFFFF"
                y: 46
                x: 22
            }
            Label{
                font.pixelSize: 15
                //c++ function in the RemoteServer Object
                text: qmlobj.getFromOnline("https://emoncms.org/feed/aget.json?id=173201&apikey=4ea47aab75a01a5d00dcf609dea72a97", "value")
                color: "#FFFFFF"
                y: 46
                x: 71
            }
            //current date
            Label{
                font.pixelSize: 15
                text: "Date: "
                color: "#FFFFFF"
                y: 70
                x: 23
            }
            Label{
                font.pixelSize: 15
                //c++ function in the RemoteServer Object
                text: qmlobj.getFromOnline("http://date.jsontest.com/", "date")
                color: "#FFFFFF"
                y: 70
                x: 71
            }


        }
    }



}
