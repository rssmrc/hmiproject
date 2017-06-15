import QtQuick 2.0
import QtQuick.Controls 2.1

Item {


    property int h
    property int w

    Button{
        id: n1
        anchors.top: parent.top
        text: "1"
        width: w/12
        height: h/4
        onClicked:{
            vkboard.press();
        }
    }
    Button{
        id: n2
        anchors.top: parent.top
        text: "2"
        width: w/12
        height: h/4
        x: n1.x+n1.width
    }

}
