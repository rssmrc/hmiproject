import QtQuick 2.8
import QtQuick.Window 2.2
import QtQuick.Controls 2.0


Window {
    visible: true
    width: 800
    height: 600
    title: qsTr("PVSystem")
    color: "#282828"

    Rectangle{
        height: 170
        width: 700
        color: "red"
        anchors.centerIn: parent
        Image{
            source: "images/bar.png"
        }
    }


}
