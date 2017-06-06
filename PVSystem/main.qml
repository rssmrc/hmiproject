import QtQuick 2.8
import QtQuick.Window 2.2
import QtQuick.Controls 2.0

Window {
    id: window
    visible: true
    width: 800
    height: 480
    title: qsTr("PVSystem")
    color: "#282828"
    //status bar creation
    Rectangle{
        id: statBar
        x: 0
        y: 0
        width: parent.width
        height: parent.height / 20
        color: "black"
        //label control indicating current time
        Label{
            anchors.centerIn: parent
            text: Qt.formatDateTime(new Date(), "HH:mm:ss a")
            color: "white"
            font.pixelSize: parent.height - 5*2
        }
    }
    //rectangle containing all controls
    Rectangle{
        id: controlsContainer
        y: statBar.height
        x: 0
        color: "#282828"
        height: window.height - statBar.height
        width: window.width
        Rectangle{
            id: currentPV
            width: window.width - (window.width/10)*2
            height: window.height/2 - (window.height/15)*2
            anchors.centerIn: parent
            //load the gradient image
            Image{
                source: "images/bar.png"
                anchors.fill: parent
            }
        }

        //slider to test moving indicator
        Slider{
            id: testSlider
            width: currentPV.width
            y: parent.y + parent.y/10
            anchors.horizontalCenter: parent.horizontalCenter
        }

        //allowed interval slider
        RangeSlider{

            width: currentPV.width
            x: currentPV.x
            y: currentPV.y + currentPV.height + currentPV.height/10

        }



    }
}
