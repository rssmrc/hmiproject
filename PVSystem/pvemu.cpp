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

/**
    PVSystem, pvemu.cpp
    Purpose: Emulate connected PV

    @author Marco Rossi
    @version 1.0 20/06/17
*/

#include "pvemu.h"
#include "protocols/remoteserver.h"
#include <QObject>
#include <QString>
#include <QNetworkAccessManager>
#include <stdlib.h>

//default values
QString api = "1b15eb3ce081a80829e78acb83c5004a";
int p_max = 1200;
int p_min = 240;
int e_max = 1000;
int e_min = 100;

RemoteServer rem;

PVEmu::PVEmu()
{

}

/**
    Runs the thread

*/

void PVEmu::run()
{
    QString url;
    QString ret;

    while(true)
    {
        //generating a random power and energy value within the user defined range
        int p_output = p_min + (rand() % static_cast<int>(p_max - p_min + 1));
        int e_output = e_min + (rand() % static_cast<int>(e_max - e_min + 1));
        //casting ints to strings
        QString p = QString::number(p_output);
        QString e = QString::number(e_output);

        //sending a request to the input page (as a real PV System would do)

        url = "https://emoncms.org/input/post?json={power:" + p + "}&apikey=" + api;
        ret = rem.getResponse(url);
        url = "https://emoncms.org/input/post?json={energy:" + e + "}&apikey=" + api;
        ret = rem.getResponse(url);

        //wait 3 seconds
        sleep(3);
    }

}
