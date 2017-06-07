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
