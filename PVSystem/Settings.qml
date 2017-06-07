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
    }

}
