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
import "basics.js" as Basics

Item {
    id: pvsystem
    property int xpos
    property int ypos
    property int w
    property int h
    property int indicatorpos
    property int pastpos
    property int indicatorw
    property int initpos
    property int newpos

    Rectangle{
        id: currentPV
        y: ypos
        width: w
        height: h
        anchors.horizontalCenter: parent.horizontalCenter
        color: "#282828"
        //load the gradient bar
        Image{
            id: bar
            source: "images/bar_dark.png"
            anchors.fill: parent
            //load indicator on gradient bar
            Image{
                id: indicator
                source: "images/indicator_dark.png"
                width: indicatorw
                height: width - width/15

                anchors.bottom: parent.bottom

                state: "init"

                states: [

                    State {
                        name: "init"
                        PropertyChanges { target: indicator; x: initpos }
                    },

                    State {
                        name: "current"
                        PropertyChanges {target: indicator; x: indicatorpos}
                    },

                    State {
                        name: "new"
                        PropertyChanges {target: indicator; x:indicatorpos}
                    }

                ]

                transitions: Transition {
                    NumberAnimation { properties: "x"; easing.type: Easing.OutCirc; duration: 100 }
                }

                //timer constantly updating status
                Timer{
                    id: update
                    repeat: true
                    interval: 1000
                    running: true
                    //will get the past position and new position
                    onTriggered:{

                        //if indicator is on its initial state
                        if(indicator.state == "init")
                            indicator.state = "current"

                    }
                }
            }
        }
    }

}
