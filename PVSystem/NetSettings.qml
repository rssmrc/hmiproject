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
            id: serverAddress
            objectName: "sAddress"
            x: w/2 - width/2
            y: height*0.5

            width: window.width - window.width*0.1
            height: window.height*0.1
            font.pixelSize: 12
            text: networkvars.get(1)
            onEditingFinished:{
                networkvars.set(1, text)
            }
        }

        TextField {
            id: ipAddress
            objectName: "ipAddress"
            x: w/2 - width/2
            y: serverAddress.y + serverAddress.height*1.5

            width: window.width - window.width*0.1
            height: window.height*0.1
            font.pixelSize: 12
            text: networkvars.get(0)
            onEditingFinished:{
                networkvars.set(0, text)
            }
        }

        TextField {
            id: defaultGateway
            objectName: "dGateway"
            x: w/2 - width/2
            y: ipAddress.y + ipAddress.height*1.5

            width: window.width - window.width*0.1
            height: window.height*0.1
            font.pixelSize: 12
            text: networkvars.get(2)
            onEditingFinished:{
                networkvars.set(2,text)
            }

        }

        TextField {
            id: subnetMask
            objectName: "sMask"
            x: w/2 - width/2
            y: defaultGateway.y + defaultGateway.height*1.5

            width: window.width - window.width*0.1
            height: window.height*0.1
            font.pixelSize: 12
            text: networkvars.get(3)
            onEditingFinished:{
                networkvars.set(3,text)
            }


        }

    }

}
