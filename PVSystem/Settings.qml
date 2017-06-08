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
        //disable-enable testing slider
        Label{
            id: sliderLabel
            color: "#FFFFFF"
            text: "Testing Slider"
            x: w/2 - width/2
            y: h/20
        }

        Switch{
            id: sliderSwitch
            x: w/2 - width/2
            y: h/12
            checked: true

            onCheckedChanged:{
                Basics.testVisible()

            }
        }

        //testing purposes controls
        Label{
            id: jsonOutput
            x: w/2 - width/2
            y: h/2 + 50
            //text property will be the json parsed date in c++
            text: qmlobj.printJson()
            color: "#FFFFFF"

        }

        Button{
            id: testFunction
            text: "Call C++ Function"
            x: w/2 - width/2
            y: h/2

            onClicked:{
                qmlobj.qmlprinttest()
            }
        }
    }

}
