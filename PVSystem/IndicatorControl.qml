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
import "basics.js" as Basics

Item {

    property int w
    property int mode: 0

    Image{
        id: powerToggle
        source:{

            if(mode == 0){
                "/images/power_pressed.png"
            }
            else{
                "/images/power.png"
            }

        }

        width: w
        height: width
        x: w*1.5/2 - width/2
        MouseArea{
            anchors.fill: parent
            onPressed:{
                mode = 0
            }
        }
    }
    Image{
        id: energyToggle
        source:{

            if(mode == 1){
                "/images/energy_pressed.png"
            }
            else{
                "/images/energy.png"
            }

        }
        width: w
        height: width
        y: powerToggle.y + w
        x: w*1.5/2 - width/2

        MouseArea{
            anchors.fill: parent
            onPressed:{
                mode = 1
            }
        }

    }
    Image{
        id: refreshButton
        source: "images/refresh.png"
        width: w
        height: width
        y: energyToggle.y + w
        x: w*1.5/2 - width/2

    }

    MouseArea{
        anchors.fill: parent
        onPressed:{
            infoPage.updateValues()
            infoPage.updateGraph()
        }
    }



}
