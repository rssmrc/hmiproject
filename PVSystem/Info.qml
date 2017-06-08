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
                text: qmlobj.getFromOnline("http://date.jsontest.com/", "time")
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
