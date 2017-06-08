import QtQuick 2.0
import QtQuick.Controls 2.1
import "basics.js" as Basics

Item {

    property int w
    property int h

    Rectangle{
        anchors.fill: parent
        Rectangle{
            width: parent.width
            height: parent.height/3
            color: "#101010"
            anchors.top: parent.top

        }
    }



}
