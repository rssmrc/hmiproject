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

QHash<QString, QString> hash_a;
QHash<QString, QString> hash_b;
RemoteServer r;
//mutex 0 = reading mode
//mutex 1 = writing mode
int mutex = 0;

//structure containing all the important values
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
    hash_a = r.generateHash("http://emoncms.org/feed/list.json?apikey=4ea47aab75a01a5d00dcf609dea72a97", "id", "name");
    hash_b = r.generateHash("http://emoncms.org/feed/list.json?apikey=4ea47aab75a01a5d00dcf609dea72a97", "name", "id");
}

void varmanager::run()
{
    //continuously getting online vars
    while(true)
    {
        //if no new values were added thread will stay in reading mode
        if(mutex == 0)
        {
            vars.inverterPower = r.getValue("4ea47aab75a01a5d00dcf609dea72a97", hash_b["power"]);
            vars.panelsAmount = r.getValue("4ea47aab75a01a5d00dcf609dea72a97", hash_b["panels"]);
            vars.wattPeak = r.getValue("4ea47aab75a01a5d00dcf609dea72a97", hash_b["peak"]);
            vars.tiltAngle = r.getValue("4ea47aab75a01a5d00dcf609dea72a97", hash_b["t_angle"]);
            vars.irradiation = r.getValue("4ea47aab75a01a5d00dcf609dea72a97", hash_b["irradiation"]);
            vars.panelYield = r.getValue("4ea47aab75a01a5d00dcf609dea72a97", hash_b["yield"]);
            vars.azimuthAngle = r.getValue("4ea47aab75a01a5d00dcf609dea72a97", hash_b["azimuth"]);
            vars.percentage = r.getValue("4ea47aab75a01a5d00dcf609dea72a97", hash_b["percentage"]);
            vars.currentEnergy = r.getValue("4ea47aab75a01a5d00dcf609dea72a97", hash_b["energy"]);
            qDebug() << vars.panelsAmount << endl;
        }
        //if the user values were updated thread will go into writing mode
        else
        {
            QString ret = r.getResponse((QUrl("https://emoncms.org/input/post?json={panels:" + vars.panelsAmount + ",azimuth:" + vars.azimuthAngle + ",t_angle:" + vars.tiltAngle + ",peak:" + vars.wattPeak + "}&apikey=1b15eb3ce081a80829e78acb83c5004a")));
            mutex = 0;
        }

        sleep(2);
    }

}

/**
    Notifies the user changes by setting the mutex to 1

    @param id ID of the changed parameter.
    @param newval New value
*/
void varmanager::notifyChange(int id, QString newval)
{
    switch(id)
    {
        case 0:
            vars.panelsAmount = newval;
            break;
        case 1:
            vars.tiltAngle = newval;
            break;
        case 2:
            vars.azimuthAngle = newval;
            break;
        case 3:
            vars.wattPeak = newval;
            break;
        default:
            break;
    }

    mutex = 1;
}







