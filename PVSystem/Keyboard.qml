import QtQuick 2.0
import QtQuick.Controls 2.1

Item {


    property int h
    property int w
    property string form
    Button{
        id: n1
        anchors.top: parent.top
        text: "1"
        width: w/12
        height: h/6
        onClicked:{
            vkboard.press("1", form);
        }
    }
    Button{
        id: n2
        anchors.top: parent.top
        text: "2"
        width: w/12
        height: h/6
        x: n1.x+n1.width
        onClicked:{
            vkboard.press("2", form);
        }
    }
    Button{
        id: n3
        anchors.top: parent.top
        text: "3"
        width: w/12
        height: h/6
        x: n2.x+n2.width
        onClicked:{
            vkboard.press("3", form);
        }
    }
    Button{
        id: n4
        anchors.top: parent.top
        text: "4"
        width: w/12
        height: h/6
        x: n3.x+n3.width
        onClicked:{
            vkboard.press("4", form);
        }
    }
    Button{
        id: n5
        anchors.top: parent.top
        text: "5"
        width: w/12
        height: h/6
        x: n4.x+n1.width
        onClicked:{
            vkboard.press("5", form);
        }
    }
    Button{
        id: n6
        anchors.top: parent.top
        text: "6"
        width: w/12
        height: h/6
        x: n5.x+n1.width
        onClicked:{
            vkboard.press("6", form);
        }
    }
    Button{
        id: n7
        anchors.top: parent.top
        text: "7"
        width: w/12
        height: h/6
        x: n6.x+n1.width
        onClicked:{
            vkboard.press("7", form);
        }
    }
    Button{
        id: n8
        anchors.top: parent.top
        text: "8"
        width: w/12
        height: h/6
        x: n7.x+n1.width
        onClicked:{
            vkboard.press("8", form);
        }
    }
    Button{
        id: n9
        anchors.top: parent.top
        text: "9"
        width: w/12
        height: h/6
        x: n8.x+n1.width
        onClicked:{
            vkboard.press("9", form);
        }
    }
    Button{
        id: n0
        anchors.top: parent.top
        text: "0"
        width: w/12
        height: h/6
        x: n9.x+n1.width
        onClicked:{
            vkboard.press("0", form);
        }
    }
    Button{
        id: bar
        anchors.top: parent.top
        text: "/"
        width: w/12
        height: h/6
        x: n0.x+n1.width
        onClicked:{
            vkboard.press("/", form);
        }
    }
    Button{
        id: questionMark
        anchors.top: parent.top
        text: "?"
        width: w/12
        height: h/6
        x: bar.x+n1.width
        onClicked:{
            vkboard.press("?", form);
        }
    }

}
