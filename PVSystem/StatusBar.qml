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
    property int xpos
    property int ypos
    property bool visibleAlert: Basics.checkBounds()

    Timer{
        id: clock
        repeat: true
        interval: 1000
        running: true

        onTriggered:{
            Basics.updateTime()
        }
    }

    Rectangle{

            id: statBar
            x: xpos
            y: ypos
            width: w
            height: h
            color: "black"

            Label{
                id: currentTime
                anchors.centerIn: parent
                text: Qt.formatDateTime(new Date(), "HH:mm:ss a")
                color: "white"
                font.pixelSize: parent.height - 5*2
            }

            Image{

                id: alertIcon
                source: "images/danger.png"
                height: parent.height
                width: height
                visible: visibleAlert
            }
        }

}
