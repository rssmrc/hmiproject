/*******************************************************
 * Copyright (C) 2017-2018 Marco Rossi marco.rossi1337@gmail.com
 *
 * This file is part of PVSystem.
 *
 * PVSystem can not be copied and/or distributed without the express
 * permission of Marco Rossi
 *******************************************************/

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
                Basics.drawerOpen()
            }
        }
    }

}


