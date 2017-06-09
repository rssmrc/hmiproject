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
    PVSystem, varmanager.cpp
    Purpose: Manages and updates QML Variables asynchronously

    @author Marco Rossi
    @version 1.0 09/05/17
*/

#include "varmanager.h"
#include "remoteserver.h"

#include <QObject>
#include <QQuickView>
#include <QQuickItem>

//structure containing all the variables
struct vars{
    QString inverterPower;
    QString panelsAmount;
    QString wattPeak;
    QString tiltAngle;
    QString irradiation;
    QString panelYield;
    QString azimuthAngle;
    QString percentage;
    QString currentEnergy;
}vars;

varmanager::varmanager()
{
    //initializing all the vars in the structure
    RemoteServer r;
    vars.inverterPower =  r.getFromOnline("https://emoncms.org/feed/aget.json?id=173379&apikey=4ea47aab75a01a5d00dcf609dea72a97", "value");
    vars.panelsAmount =  r.getFromOnline("https://emoncms.org/feed/aget.json?id=173378&apikey=4ea47aab75a01a5d00dcf609dea72a97", "value");
    vars.wattPeak =  r.getFromOnline("https://emoncms.org/feed/aget.json?id=173385&apikey=4ea47aab75a01a5d00dcf609dea72a97", "value");
    vars.tiltAngle =  r.getFromOnline("https://emoncms.org/feed/aget.json?id=173383&apikey=4ea47aab75a01a5d00dcf609dea72a97", "value");
    vars.irradiation =  r.getFromOnline("https://emoncms.org/feed/aget.json?id=173386&apikey=4ea47aab75a01a5d00dcf609dea72a97", "value");
    vars.panelYield =  r.getFromOnline("https://emoncms.org/feed/aget.json?id=173382&apikey=4ea47aab75a01a5d00dcf609dea72a97", "value");
    vars.azimuthAngle =  r.getFromOnline("https://emoncms.org/feed/aget.json?id=173387&apikey=4ea47aab75a01a5d00dcf609dea72a97", "value");
    vars.percentage =  r.getFromOnline("https://emoncms.org/feed/aget.json?id=173381&apikey=4ea47aab75a01a5d00dcf609dea72a97", "value");
    vars.currentEnergy =  r.getFromOnline("https://emoncms.org/feed/aget.json?id=173380&apikey=4ea47aab75a01a5d00dcf609dea72a97", "value");
}

void varmanager::updateLocal(int i, QString oname, QString val)
{


}

//thread executed function
//need to sync local changes and online changes
void varmanager::updateVars()
{
    RemoteServer r;

}


