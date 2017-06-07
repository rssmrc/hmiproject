/*******************************************************
 * Copyright (C) 2017-2018 Marco Rossi marco.rossi1337@gmail.com
 *
 * This file is part of PVSystem.
 *
 * PVSystem can not be copied and/or distributed without the express
 * permission of Marco Rossi
 *******************************************************/

import QtQuick 2.0

Item {

    property int xpos
    property int ypos
    property int w
    property int h
    property int indicatorpos
    property int indicatorw

    Rectangle{
        id: currentPV
        y: ypos
        width: w
        height: h
        anchors.horizontalCenter: parent.horizontalCenter
        color: "#282828"
        //load the gradient bar
        Image{
            source: "images/bar.png"
            anchors.fill: parent
            //load indicator on gradient bar
            Image{
                id: indicator
                source: "images/indicator.png"
                width: indicatorw
                height: width - width/15
                anchors.bottom: parent.bottom
                x: indicatorpos
            }
        }
    }

}
