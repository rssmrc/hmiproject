import QtQuick 2.8
import QtQuick.Window 2.2
import QtQuick.Controls 2.0


Window {
    id: window
    visible: true
    width: 800
    height: 480
    title: qsTr("PVSystem")
    color: "#585858"

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

        Image{
            id: alertIcon
            source: "images/danger.png"
            height: parent.height
            width: height
            //the DANGER ICON will be visible only if the indicator exits the imposed bounds
            visible: {
                if(testSlider.value > rslider.first.value && testSlider.value < rslider.second.value){
                    false
                }
                else{
                    true
                }
            }

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
            y: window.height/5
            width: window.width - (window.width/10)*2
            height: window.height/2 - (window.height/15)*2
            anchors.horizontalCenter: parent.horizontalCenter

            //load the gradient bar
            Image{
                source: "images/bar.png"
                anchors.fill: parent
                //load indicator on gradient bar
                Image{
                    source: "images/indicator.png"
                    width: currentPV.width/7
                    height: width - width/15
                    anchors.bottom: parent.bottom
                    x: currentPV.width * testSlider.value - width/2

                }
            }
        }

        //slider to test moving indicator
        Slider{
            id: testSlider
            width: currentPV.width - currentPV.width/2
            y: currentPV.y - currentPV.height/3
            anchors.horizontalCenter: parent.horizontalCenter
            value: 0.5
        }

        //allowed interval slider
        RangeSlider{
            id: rslider
            width: currentPV.width
            x: currentPV.x
            y: currentPV.y + currentPV.height + currentPV.height/10

        }

        //bottom bar with controls
        Rectangle{
            anchors.bottom : parent.bottom
            color: "black"
            width: parent.width
            height: parent.height/5
            //TODO: ADD BUTTONS
        }

    }
}
