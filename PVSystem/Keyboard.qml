/****************************************************************************
 *
 *   Copyright (C) 2017 Marco Rossi. All rights reserved.
 *   Author: Marco Rossi <info@nerinformatica.it>
 *   Contributor: Luciano Neri <l.neri@nerinformatica.it>
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted under the LGPL v3 license
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 * COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
 * OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED
 * AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
 * ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 *
 ****************************************************************************/

import QtQuick 2.0
import QtQuick.Controls 2.1

Item {


    property int h
    property int w
    property string form
    property int caps: 0

    //number keys
    Button{id: n1;anchors.top: parent.top;font.pixelSize: 15;text: "1";width: w/12;height: h/8;onClicked:{vkboard.press("1", form, caps);} background:Rectangle{color:{if(n1.down){"#aaaaaa"}else{"#eeeeee"}}border.width: 1;border.color: "#909090"}}
    Button{id: n2;anchors.top: parent.top;text: "2";width: w/12;height: h/8;x:n1.x + width;onClicked:{vkboard.press("2", form, caps);}background:Rectangle{color:{if(n2.down){"#aaaaaa"}else{"#eeeeee"}}border.width: 1;border.color: "#909090"}}
    Button{id: n3;anchors.top: parent.top;text: "3";width: w/12;height: h/8;x:n2.x + width;onClicked:{vkboard.press("3", form, caps);}background:Rectangle{color:{if(n3.down){"#aaaaaa"}else{"#eeeeee"}}border.width: 1;border.color: "#909090"}}
    Button{id: n4;anchors.top: parent.top;text: "4";width: w/12;height: h/8;x:n3.x + width;onClicked:{vkboard.press("4", form, caps);}background:Rectangle{color:{if(n4.down){"#aaaaaa"}else{"#eeeeee"}}border.width: 1;border.color: "#909090"}}
    Button{id: n5;anchors.top: parent.top;text: "5";width: w/12;height: h/8;x:n4.x + width;onClicked:{vkboard.press("5", form, caps);}background:Rectangle{color:{if(n5.down){"#aaaaaa"}else{"#eeeeee"}}border.width: 1;border.color: "#909090"}}
    Button{id: n6;anchors.top: parent.top;text: "6";width: w/12;height: h/8;x:n5.x + width;onClicked:{vkboard.press("6", form, caps);}background:Rectangle{color:{if(n6.down){"#aaaaaa"}else{"#eeeeee"}}border.width: 1;border.color: "#909090"}}
    Button{id: n7;anchors.top: parent.top;text: "7";width: w/12;height: h/8;x:n6.x + width;onClicked:{vkboard.press("7", form, caps);}background:Rectangle{color:{if(n7.down){"#aaaaaa"}else{"#eeeeee"}}border.width: 1;border.color: "#909090"}}
    Button{id: n8;anchors.top: parent.top;text: "8";width: w/12;height: h/8;x:n7.x + width;onClicked:{vkboard.press("8", form, caps);}background:Rectangle{color:{if(n8.down){"#aaaaaa"}else{"#eeeeee"}}border.width: 1;border.color: "#909090"}}
    Button{id: n9;anchors.top: parent.top;text: "9";width: w/12;height: h/8;x:n8.x + width;onClicked:{vkboard.press("9", form, caps);}background:Rectangle{color:{if(n9.down){"#aaaaaa"}else{"#eeeeee"}}border.width: 1;border.color: "#909090"}}
    Button{id: n0;anchors.top: parent.top;text: "0";width: w/12;height: h/8;x:n9.x + width;onClicked:{vkboard.press("0", form, caps);}background:Rectangle{color:{if(n0.down){"#aaaaaa"}else{"#eeeeee"}}border.width: 1;border.color: "#909090"}}
    Button{id: nbar;anchors.top: parent.top;text: "/";width: w/12;height: h/8;x:n0.x + width;onClicked:{vkboard.press("/", form, caps);}background:Rectangle{color:{if(nbar.down){"#aaaaaa"}else{"#eeeeee"}}border.width: 1;border.color: "#909090"}}
    Button{
        id: capslock;
        anchors.top: parent.top;
        text: "CAPS";
        width: w/12;
        height: h/8;
        x:nbar.x + width;
        onClicked:{
            if(parent.caps == 0){
                parent.caps = 1;


            }
            else{
                parent.caps = 0;
            }

        }

        background:Rectangle{
            color:{
                if(caps == 1)
                    "#84b7e5"
                else
                    "#eeeeee"

            }

            border.width: 1;
            border.color: "#909090"
        }

    }
    //letter keys
    Button{id: q_key;y:height;text: "Q";width: w/12;height: h/8;onClicked:{vkboard.press("q", form, caps);}background:Rectangle{color:{if(q_key.down){"#aaaaaa"}else{"#eeeeee"}}border.width: 1;border.color: "#909090"}}
    Button{id: w_key;y:height;text: "W";width: w/12;height: h/8;x:q_key.x + width;onClicked:{vkboard.press("w", form, caps);}background:Rectangle{color:{if(w_key.down){"#aaaaaa"}else{"#eeeeee"}}border.width: 1;border.color: "#909090"}}
    Button{id: e_key;y:height;text: "E";width: w/12;height: h/8;x:w_key.x + width;onClicked:{vkboard.press("e", form, caps);}background:Rectangle{color:{if(e_key.down){"#aaaaaa"}else{"#eeeeee"}}border.width: 1;border.color: "#909090"}}
    Button{id: r_key;y:height;text: "R";width: w/12;height: h/8;x:e_key.x + width;onClicked:{vkboard.press("r", form, caps);}background:Rectangle{color:{if(r_key.down){"#aaaaaa"}else{"#eeeeee"}}border.width: 1;border.color: "#909090"}}
    Button{id: t_key;y:height;text: "T";width: w/12;height: h/8;x:r_key.x + width;onClicked:{vkboard.press("t", form, caps);}background:Rectangle{color:{if(t_key.down){"#aaaaaa"}else{"#eeeeee"}}border.width: 1;border.color: "#909090"}}
    Button{id: y_key;y:height;text: "Y";width: w/12;height: h/8;x:t_key.x + width;onClicked:{vkboard.press("y", form, caps);}background:Rectangle{color:{if(y_key.down){"#aaaaaa"}else{"#eeeeee"}}border.width: 1;border.color: "#909090"}}
    Button{id: u_key;y:height;text: "U";width: w/12;height: h/8;x:y_key.x + width;onClicked:{vkboard.press("u", form, caps);}background:Rectangle{color:{if(u_key.down){"#aaaaaa"}else{"#eeeeee"}}border.width: 1;border.color: "#909090"}}
    Button{id: i_key;y:height;text: "I";width: w/12;height: h/8;x:u_key.x + width;onClicked:{vkboard.press("i", form, caps);}background:Rectangle{color:{if(i_key.down){"#aaaaaa"}else{"#eeeeee"}}border.width: 1;border.color: "#909090"}}
    Button{id: o_key;y:height;text: "O";width: w/12;height: h/8;x:i_key.x + width;onClicked:{vkboard.press("o", form, caps);}background:Rectangle{color:{if(o_key.down){"#aaaaaa"}else{"#eeeeee"}}border.width: 1;border.color: "#909090"}}
    Button{id: p_key;y:height;text: "P";width: w/12;height: h/8;x:o_key.x + width;onClicked:{vkboard.press("p", form, caps);}background:Rectangle{color:{if(p_key.down){"#aaaaaa"}else{"#eeeeee"}}border.width: 1;border.color: "#909090"}}
    Button{id: plus_key;y:height;text: "+";width: w/12;height: h/8;x:p_key.x + width;onClicked:{vkboard.press("+", form, caps);}background:Rectangle{color:{if(plus_key.down){"#aaaaaa"}else{"#eeeeee"}}border.width: 1;border.color: "#909090"}}
    Button{id: minus_key;y:height;text: "-";width: w/12;height: h/8;x:plus_key.x + width;onClicked:{vkboard.press("-", form, caps);}background:Rectangle{color:{if(minus_key.down){"#aaaaaa"}else{"#eeeeee"}}border.width: 1;border.color: "#909090"}}

    Button{id: a_key;y:height*2;text: "A";width: w/12;height: h/8;onClicked:{vkboard.press("a", form, caps);}background:Rectangle{color:{if(a_key.down){"#aaaaaa"}else{"#eeeeee"}}border.width: 1;border.color: "#909090"}}
    Button{id: s_key;y:height*2;text: "S";width: w/12;height: h/8;x:a_key.x + width;onClicked:{vkboard.press("s", form, caps);}background:Rectangle{color:{if(s_key.down){"#aaaaaa"}else{"#eeeeee"}}border.width: 1;border.color: "#909090"}}
    Button{id: d_key;y:height*2;text: "D";width: w/12;height: h/8;x:s_key.x + width;onClicked:{vkboard.press("d", form, caps);}background:Rectangle{color:{if(d_key.down){"#aaaaaa"}else{"#eeeeee"}}border.width: 1;border.color: "#909090"}}
    Button{id: f_key;y:height*2;text: "F";width: w/12;height: h/8;x:d_key.x + width;onClicked:{vkboard.press("f", form, caps);}background:Rectangle{color:{if(f_key.down){"#aaaaaa"}else{"#eeeeee"}}border.width: 1;border.color: "#909090"}}
    Button{id: g_key;y:height*2;text: "G";width: w/12;height: h/8;x:f_key.x + width;onClicked:{vkboard.press("g", form, caps);}background:Rectangle{color:{if(g_key.down){"#aaaaaa"}else{"#eeeeee"}}border.width: 1;border.color: "#909090"}}
    Button{id: h_key;y:height*2;text: "H";width: w/12;height: h/8;x:g_key.x + width;onClicked:{vkboard.press("h", form, caps);}background:Rectangle{color:{if(h_key.down){"#aaaaaa"}else{"#eeeeee"}}border.width: 1;border.color: "#909090"}}
    Button{id: j_key;y:height*2;text: "J";width: w/12;height: h/8;x:h_key.x + width;onClicked:{vkboard.press("j", form, caps);}background:Rectangle{color:{if(j_key.down){"#aaaaaa"}else{"#eeeeee"}}border.width: 1;border.color: "#909090"}}
    Button{id: k_key;y:height*2;text: "K";width: w/12;height: h/8;x:j_key.x + width;onClicked:{vkboard.press("k", form, caps);}background:Rectangle{color:{if(k_key.down){"#aaaaaa"}else{"#eeeeee"}}border.width: 1;border.color: "#909090"}}
    Button{id: l_key;y:height*2;text: "L";width: w/12;height: h/8;x:k_key.x + width;onClicked:{vkboard.press("l", form, caps);}background:Rectangle{color:{if(l_key.down){"#aaaaaa"}else{"#eeeeee"}}border.width: 1;border.color: "#909090"}}
    Button{id: ast_key;y:height*2;text: "*";width: w/12;height: h/8;x:l_key.x + width;onClicked:{vkboard.press("*", form, caps);}background:Rectangle{color:{if(ast_key.down){"#aaaaaa"}else{"#eeeeee"}}border.width: 1;border.color: "#909090"}}
    Button{id: del_key;y:height*2;text: "DEL";width: w/12*2;height: h/8;x:ast_key.x + width/2;onClicked:{vkboard.deletechar(form, caps);}background:Rectangle{color:{if(del_key.down){"#aaaaaa"}else{"#eeeeee"}}border.width: 1;border.color: "#909090"}}

    Button{id: z_key;y:height*3;text: "Z";width: w/12;height: h/8;onClicked:{vkboard.press("z", form, caps);}background:Rectangle{color:{if(z_key.down){"#aaaaaa"}else{"#eeeeee"}}border.width: 1;border.color: "#909090"}}
    Button{id: x_key;y:height*3;text: "X";width: w/12;height: h/8;x:z_key.x + width;onClicked:{vkboard.press("x", form, caps);}background:Rectangle{color:{if(x_key.down){"#aaaaaa"}else{"#eeeeee"}}border.width: 1;border.color: "#909090"}}
    Button{id: c_key;y:height*3;text: "C";width: w/12;height: h/8;x:x_key.x + width;onClicked:{vkboard.press("c", form, caps);}background:Rectangle{color:{if(c_key.down){"#aaaaaa"}else{"#eeeeee"}}border.width: 1;border.color: "#909090"}}
    Button{id: v_key;y:height*3;text: "V";width: w/12;height: h/8;x:c_key.x + width;onClicked:{vkboard.press("v", form, caps);}background:Rectangle{color:{if(v_key.down){"#aaaaaa"}else{"#eeeeee"}}border.width: 1;border.color: "#909090"}}
    Button{id: b_key;y:height*3;text: "B";width: w/12;height: h/8;x:v_key.x + width;onClicked:{vkboard.press("b", form, caps);}background:Rectangle{color:{if(b_key.down){"#aaaaaa"}else{"#eeeeee"}}border.width: 1;border.color: "#909090"}}
    Button{id: n_key;y:height*3;text: "N";width: w/12;height: h/8;x:b_key.x + width;onClicked:{vkboard.press("n", form, caps);}background:Rectangle{color:{if(n_key.down){"#aaaaaa"}else{"#eeeeee"}}border.width: 1;border.color: "#909090"}}
    Button{id: m_key;y:height*3;text: "M";width: w/12;height: h/8;x:n_key.x + width;onClicked:{vkboard.press("m", form, caps);}background:Rectangle{color:{if(m_key.down){"#aaaaaa"}else{"#eeeeee"}}border.width: 1;border.color: "#909090"}}
    Button{id: comma_key;y:height*3;text: ",";width: w/12;height: h/8;x:m_key.x + width;onClicked:{vkboard.press(",", form, caps);}background:Rectangle{color:{if(comma_key.down){"#aaaaaa"}else{"#eeeeee"}}border.width: 1;border.color: "#909090"}}
    Button{id: dot_key;y:height*3;text: ".";width: w/12;height: h/8;x:comma_key.x + width;onClicked:{vkboard.press(".", form, caps);}background:Rectangle{color:{if(dot_key.down){"#aaaaaa"}else{"#eeeeee"}}border.width: 1;border.color: "#909090"}}
    Button{id: score_key;y:height*3;text: "_";width: w/12;height: h/8;x:dot_key.x + width;onClicked:{vkboard.press("_", form, caps);}background:Rectangle{color:{if(score_key.down){"#aaaaaa"}else{"#eeeeee"}}border.width: 1;border.color: "#909090"}}
    Button{id: done_key;y:height*3;text: "DONE";width: w/12;height: h/8;x:ddots_key.x + width;onClicked:{vkboard.confirm(form);}background:Rectangle{color:{if(done_key.down){"#29a329"}else{"#33cc33"}}border.width: 1;border.color: "#909090"}}
    Button{id: ddots_key;y:height*3;text: ":";width: w/12;height: h/8;x:score_key.x + width;onClicked:{vkboard.press(":", form, caps);}background:Rectangle{color:{if(ddots_key.down){"#aaaaaa"}else{"#eeeeee"}}border.width: 1;border.color: "#909090"}}

}
