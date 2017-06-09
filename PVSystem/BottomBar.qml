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

Item{

    property int w
    property int h

    Rectangle{
        //base black bar
        color: "#000000"
        width: w
        height: h
        anchors.bottom: parent.bottom
        //info button
        Button{
            id: infoBtn
            anchors.left: parent.left
            height: h
            width: w/3
            background: Rectangle{
                color:{
                    if(infoBtn.down){
                        "#252525"
                    }
                    else{
                        "#303030"
                    }
                }
                border.width: 1
                border.color: "#404040"
            }

            Image{
                source: "images/info.png"
                anchors.centerIn: parent
                height: parent.height/2
                width: height
            }

            onClicked:{
                Basics.drawerOpen(1)
            }

        }

        //menu button
        Button{
            id: menuBtn
            anchors.horizontalCenter : parent.horizontalCenter
            height: h
            width: w/3
            background: Rectangle{
                color:{
                    if(menuBtn.down){
                        "#252525"
                    }
                    else{
                        "#303030"
                    }
                }
                border.width: 1
                border.color: "#404040"
            }

            Image{
                source: "images/menu.png"
                anchors.centerIn: parent
                height: parent.height/2
                width: height
            }
        }

        //settings button that will open the settings drawer
        Button{
            id: settingsBtn
            anchors.right: parent.right
            height: h
            width: w/3
            background: Rectangle{
                color:{
                    if(settingsBtn.down){
                        "#252525"
                    }
                    else{
                        "#303030"
                    }
                }
                border.width: 1
                border.color: "#404040"
            }

            Image{
                source: "images/settings.png"
                anchors.centerIn: parent
                height: parent.height/2
                width: height
            }

            onClicked:{
                Basics.drawerOpen(0)
            }
        }
    }

}


