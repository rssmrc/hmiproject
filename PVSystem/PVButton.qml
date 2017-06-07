import QtQuick 2.0
import QtQuick.Controls 2.1

Item {

    Button{
        anchors.left : parent.left
        width: parent.width/3
        height: parent.height
        background: Rectangle{
        color:{
                            if(btn1.down){
                                "#252525"
                            }
                            else{
                                "#303030"
                            }
                        }
                        border.width: 1
                        border.color: "#404040"
                    }

                    Image{
                        source: "images/info.png"
                        anchors.centerIn: parent
                        height: parent.height/2
                        width: height
                    }

                }

}
