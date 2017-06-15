import QtQuick 2.0
import QtQuick.Controls 2.1

Item {


    property int h
    property int w
    property string form

    //number keys
    Button{id: n1;anchors.top: parent.top;text: "1";width: w/12;height: h/6;onClicked:{vkboard.press("1", form);}}
    Button{id: n2;anchors.top: parent.top;text: "2";width: w/12;height: h/6;x:n1.x + width;onClicked:{vkboard.press("2", form);}}
    Button{id: n3;anchors.top: parent.top;text: "3";width: w/12;height: h/6;x:n2.x + width;onClicked:{vkboard.press("3", form);}}
    Button{id: n4;anchors.top: parent.top;text: "4";width: w/12;height: h/6;x:n3.x + width;onClicked:{vkboard.press("4", form);}}
    Button{id: n5;anchors.top: parent.top;text: "5";width: w/12;height: h/6;x:n4.x + width;onClicked:{vkboard.press("5", form);}}
    Button{id: n6;anchors.top: parent.top;text: "6";width: w/12;height: h/6;x:n5.x + width;onClicked:{vkboard.press("6", form);}}
    Button{id: n7;anchors.top: parent.top;text: "7";width: w/12;height: h/6;x:n6.x + width;onClicked:{vkboard.press("7", form);}}
    Button{id: n8;anchors.top: parent.top;text: "8";width: w/12;height: h/6;x:n7.x + width;onClicked:{vkboard.press("8", form);}}
    Button{id: n9;anchors.top: parent.top;text: "9";width: w/12;height: h/6;x:n8.x + width;onClicked:{vkboard.press("9", form);}}
    Button{id: n0;anchors.top: parent.top;text: "0";width: w/12;height: h/6;x:n9.x + width;onClicked:{vkboard.press("0", form);}}
    Button{id: nbar;anchors.top: parent.top;text: "/";width: w/12;height: h/6;x:n0.x + width;onClicked:{vkboard.press("/", form);}}
    Button{id: nquestion;anchors.top: parent.top;text: "?";width: w/12;height: h/6;x:nbar.x + width;onClicked:{vkboard.press("?", form);}}
    //letter keys
    Button{id: q_key;y:height;text: "Q";width: w/12;height: h/6;onClicked:{vkboard.press("q", form);}}
    Button{id: w_key;y:height;text: "W";width: w/12;height: h/6;x:q_key.x + width;onClicked:{vkboard.press("w", form);}}
    Button{id: e_key;y:height;text: "E";width: w/12;height: h/6;x:w_key.x + width;onClicked:{vkboard.press("e", form);}}
    Button{id: r_key;y:height;text: "R";width: w/12;height: h/6;x:e_key.x + width;onClicked:{vkboard.press("r", form);}}
    Button{id: t_key;y:height;text: "T";width: w/12;height: h/6;x:r_key.x + width;onClicked:{vkboard.press("t", form);}}
    Button{id: y_key;y:height;text: "Y";width: w/12;height: h/6;x:t_key.x + width;onClicked:{vkboard.press("y", form);}}
    Button{id: u_key;y:height;text: "U";width: w/12;height: h/6;x:y_key.x + width;onClicked:{vkboard.press("u", form);}}
    Button{id: i_key;y:height;text: "I";width: w/12;height: h/6;x:u_key.x + width;onClicked:{vkboard.press("i", form);}}
    Button{id: o_key;y:height;text: "O";width: w/12;height: h/6;x:i_key.x + width;onClicked:{vkboard.press("o", form);}}
    Button{id: p_key;y:height;text: "P";width: w/12;height: h/6;x:o_key.x + width;onClicked:{vkboard.press("p", form);}}
    Button{id: plus_key;y:height;text: "+";width: w/12;height: h/6;x:p_key.x + width;onClicked:{vkboard.press("+", form);}}
    Button{id: minus_key;y:height;text: "-";width: w/12;height: h/6;x:plus_key.x + width;onClicked:{vkboard.press("-", form);}}

    Button{id: a_key;y:height*2;text: "A";width: w/12;height: h/6;onClicked:{vkboard.press("a", form);}}
    Button{id: s_key;y:height*2;text: "S";width: w/12;height: h/6;x:a_key.x + width;onClicked:{vkboard.press("s", form);}}
    Button{id: d_key;y:height*2;text: "D";width: w/12;height: h/6;x:s_key.x + width;onClicked:{vkboard.press("d", form);}}
    Button{id: f_key;y:height*2;text: "F";width: w/12;height: h/6;x:d_key.x + width;onClicked:{vkboard.press("f", form);}}
    Button{id: g_key;y:height*2;text: "G";width: w/12;height: h/6;x:f_key.x + width;onClicked:{vkboard.press("g", form);}}
    Button{id: h_key;y:height*2;text: "H";width: w/12;height: h/6;x:g_key.x + width;onClicked:{vkboard.press("h", form);}}
    Button{id: j_key;y:height*2;text: "J";width: w/12;height: h/6;x:h_key.x + width;onClicked:{vkboard.press("j", form);}}
    Button{id: k_key;y:height*2;text: "K";width: w/12;height: h/6;x:j_key.x + width;onClicked:{vkboard.press("k", form);}}
    Button{id: l_key;y:height*2;text: "L";width: w/12;height: h/6;x:k_key.x + width;onClicked:{vkboard.press("l", form);}}
    Button{id: ast_key;y:height*2;text: "*";width: w/12;height: h/6;x:l_key.x + width;onClicked:{vkboard.press("*", form);}}
    Button{id: del_key;y:height*2;text: "DEL";width: w/12*2;height: h/6;x:ast_key.x + width/2;onClicked:{vkboard.deletechar(form);}}

}
