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
#include "../protocols/remoteserver.h"
#include "updatethread.h"
#include <thread>
#include <QTimer>
#include <QObject>
#include <QQuickView>
#include <QQuickItem>
#include <QGuiApplication>
#include <QQmlApplicationEngine>

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
#if 0
    vars.inverterPower =  r.getFromOnline("https://emoncms.org/feed/aget.json?id=173379&apikey=4ea47aab75a01a5d00dcf609dea72a97", "value");
    vars.panelsAmount =  r.getFromOnline("https://emoncms.org/feed/aget.json?id=173378&apikey=4ea47aab75a01a5d00dcf609dea72a97", "value");
    vars.wattPeak =  r.getFromOnline("https://emoncms.org/feed/aget.json?id=173385&apikey=4ea47aab75a01a5d00dcf609dea72a97", "value");
    vars.tiltAngle =  r.getFromOnline("https://emoncms.org/feed/aget.json?id=173383&apikey=4ea47aab75a01a5d00dcf609dea72a97", "value");
    vars.irradiation =  r.getFromOnline("https://emoncms.org/feed/aget.json?id=173386&apikey=4ea47aab75a01a5d00dcf609dea72a97", "value");
    vars.panelYield =  r.getFromOnline("https://emoncms.org/feed/aget.json?id=173382&apikey=4ea47aab75a01a5d00dcf609dea72a97", "value");
    vars.azimuthAngle =  r.getFromOnline("https://emoncms.org/feed/aget.json?id=173387&apikey=4ea47aab75a01a5d00dcf609dea72a97", "value");
    vars.percentage =  r.getFromOnline("https://emoncms.org/feed/aget.json?id=173381&apikey=4ea47aab75a01a5d00dcf609dea72a97", "value");
    vars.currentEnergy =  r.getFromOnline("https://emoncms.org/feed/aget.json?id=173380&apikey=4ea47aab75a01a5d00dcf609dea72a97", "value");
#endif
}

/**
    Updates the local vars in the structure from qml textfield content

    @param i Index of the var to edit.
    @param val Input value
*/
void varmanager::updateLocal(int i, QString val)
{
    switch(i)
    {
    //code 1: panels amount
    case 1:
        vars.panelsAmount = val;
        break;
    //code 2: tilt angle
    case 2:
        vars.tiltAngle = val;
        break;
    //code 3: azimuth angle
    case 3:
        vars.azimuthAngle = val;
        break;
    //code 4: watt peak
    case 4:
        vars.wattPeak = val;
        break;
    }

}

/**
    Synchronizes online and local variables
    IMPORTANT: Do not call this function outside a thread. GUI might freeze due to slow replies
*/
void varmanager::updateVars()
{
    RemoteServer r;
    //check for discrepancies between the emoncms DB and the user settings
    QByteArray status;

#if 0
    QString p = r.getFromOnline("https://emoncms.org/feed/aget.json?id=173378&apikey=4ea47aab75a01a5d00dcf609dea72a97", "value");
    QString t = r.getFromOnline("https://emoncms.org/feed/aget.json?id=173383&apikey=4ea47aab75a01a5d00dcf609dea72a97", "value");
    QString a = r.getFromOnline("https://emoncms.org/feed/aget.json?id=173387&apikey=4ea47aab75a01a5d00dcf609dea72a97", "value");
    QString w = r.getFromOnline("https://emoncms.org/feed/aget.json?id=173385&apikey=4ea47aab75a01a5d00dcf609dea72a97", "value");


    if(p != vars.panelsAmount)
    {
        status = r.getResponse(QUrl("https://emoncms.org/input/post?json={panels:" + vars.panelsAmount + "}&apikey=1b15eb3ce081a80829e78acb83c5004a"));
    }
    else if(t != vars.tiltAngle)
    {
        status = r.getResponse(QUrl("https://emoncms.org/input/post?json={t_angle:" + vars.tiltAngle + "}&apikey=1b15eb3ce081a80829e78acb83c5004a"));
    }
    else if(a != vars.azimuthAngle)
    {
        status = r.getResponse(QUrl("https://emoncms.org/input/post?json={azimuth:" + vars.azimuthAngle + "}&apikey=1b15eb3ce081a80829e78acb83c5004a"));
    }
    else if(w != vars.wattPeak)
    {
        status = r.getResponse(QUrl("https://emoncms.org/input/post?json={peak:" + vars.wattPeak + "}&apikey=1b15eb3ce081a80829e78acb83c5004a"));
    }
#endif
}



