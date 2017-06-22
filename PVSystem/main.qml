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

import QtQuick 2.8
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import "basics.js" as Basics

ApplicationWindow {

    id: window
    visible: true
    width: 800
    height: 480
    title: qsTr("PVSystem")
    color: "#585858"

    onClosing:{
        //terminating the varmanager and emu thread before closing the main window
        emonvars.terminate()
        pvemu.terminate()
    }

    //top black status bar
    StatusBar{
        id: statBar
        xpos: 0
        ypos: 0
        w: window.width
        h: window.height / 16
    }




    //rectangle container containing all the items
    Rectangle{
        id: controlsContainer
        x: 0
        y: statBar.h
        width: window.width
        height: window.height - statBar.h
        color: "#282828"

        ComboBox{
            id: indicatorMode
            anchors.horizontalCenter: parent.horizontalCenter
            y: 40
            width: window.width/3
            model:["Current Inverter Power", "Consume Status"]
        }

        //gradient status bar indicating current PV status
        PVStatusBar{
            id: pvstatus
            xpos: 0
            ypos: window.height/4
            w: window.width - (window.width/10)*2
            h: window.height/2 - (window.height/15)*2
            indicatorw: w/7
            //standard position
            initpos: pvstatus.w * 0.5 - pvstatus.indicatorw/2
            pastpos: initpos
            indicatorpos: initpos
            anchors.horizontalCenter: parent.horizontalCenter

            //updating the indicator every 2 seconds
            Timer{
                id: updatebar
                repeat: true
                interval: 2000
                running: true
                //will get the past position and new position
                onTriggered:{
                    if(indicatorMode.currentText == "Current Inverter Power"){
                        parent.pastpos = pvstatus.indicatorpos
                        parent.indicatorpos = pvstatus.w * emonvars.getPosition() - pvstatus.indicatorw/2
                    }
                    else if(indicatorMode.currentText == "Consume Status"){
                        parent.pastpos = 0
                        parent.indicatorpos = pvstatus.w * emonvars.getConsumePosition(pvemu.generateCurrentPower()) - pvstatus.indicatorw/2
                    }

                    //updating info values and graph
                    infoPage.updateValues()
                    infoPage.updateGraph()

                }
            }
        }

        //slider to adjust the acceptable bounds
        RangeSlider{
            id: rSlider
            width: pvstatus.w
            anchors.horizontalCenter: parent.horizontalCenter
            y: pvstatus.ypos + pvstatus.h + pvstatus.h/10
        }



        Drawer{
            id: drawer
            width: parent.width
            height: parent.height - botBar.h
            edge: Qt.TopEdge
            background: Rectangle{
                color: "#202020"
            }
            Settings{
                id: settingsPage
                w: window.width
                h: window.height
            }
        }

       Drawer{
           id: infoDrawer
           width: parent.width
           height: parent.height - botBar.h
           edge: Qt.TopEdge
           background: Rectangle{
               color: "#202020"
           }
           Info{
               id: infoPage
               w: window.width
               h: window.height
           }
       }

       Drawer{
           id: netDrawer
           width: parent.width
           height: parent.height - botBar.h
           edge: Qt.TopEdge
           background: Rectangle{
               color: "#202020"
           }
           NetSettings{
               id: netPage
               w: window.width
               h: window.height
           }
       }

       Drawer{
           property int pHeight: parent.height/8

           interactive: false
           id: keyboard
           width: parent.width
           height: parent.height/2 + parent.height/8
           edge: Qt.BottomEdge
           background: Rectangle{
               color: "#202020"
           }
           Label{
               id: tempInput
               font.pixelSize: 20
               color: "white"
               text: ""
               y: height
               anchors.horizontalCenter: parent.horizontalCenter

           }

           Keyboard{
               span: parent.pHeight
               id: vkeyboard
               w: window.width
               h: window.height
           }
       }

       Drawer{
           id: bottomBarMenu
           width: parent.width
           height: controlsContainer.height/5
           edge: Qt.BottomEdge
           //bottom bar with button controls
           BottomBar{
               id: botBar
               w: window.width
               h: controlsContainer.height/5
               anchors.bottom: parent.bottom
           }
       }

    }
}
