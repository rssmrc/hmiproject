import QtQuick 2.8
import QtQuick.Window 2.2
import QtQuick.Controls 2.0

Window {
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
        Label{
            anchors.centerIn: parent
            text: Qt.formatDateTime(new Date(), "HH:mm:ss a")
            color: "white"
            font.pixelSize: parent.height - 5*2
        }
    }

    Rectangle{

    }
}
