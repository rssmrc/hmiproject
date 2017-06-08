/*******************************************************
 * Copyright (C) 2017-2018 Marco Rossi marco.rossi1337@gmail.com
 *
 * This file is part of PVSystem.
 *
 * PVSystem can not be copied and/or distributed without the express
 * permission of Marco Rossi
 *******************************************************/

import QtQuick 2.8
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import "basics.js" as Basics

Window {

    id: window
    visible: true
    width: 800
    height: 480
    title: qsTr("PVSystem")
    color: "#585858"

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

        //gradient status bar indicating current PV status
        PVStatusBar{
            id: pvstatus
            xpos: 0
            ypos: window.height/5
            w: window.width - (window.width/10)*2
            h: window.height/2 - (window.height/15)*2
            indicatorw: w/7
            indicatorpos: pvstatus.w * testSlider.value - pvstatus.indicatorw/2
            anchors.horizontalCenter: parent.horizontalCenter
        }

        //slider to test moving indicator
        Slider{
            id: testSlider
            width: pvstatus.w - pvstatus.w/2
            y: pvstatus.ypos - pvstatus.h/3
            anchors.horizontalCenter: parent.horizontalCenter
            value: 0.50
        }

        //slider to adjust the acceptable bounds
        RangeSlider{
            id: rSlider
            width: pvstatus.w
            anchors.horizontalCenter: parent.horizontalCenter
            y: pvstatus.ypos + pvstatus.h + pvstatus.h/10
        }

        //bottom bar with button controls
        BottomBar{
            id: botBar
            w: window.width
            h: parent.height/5
            anchors.bottom: parent.bottom
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

    }
}
