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
    PVSystem, updatethread.cpp
    Purpose: Thread class that updates the online vars

    @author Marco Rossi
    @version 1.0 09/05/17
*/


#include "updatethread.h"
#include "varmanager.h"
#include "../protocols/remoteserver.h"
#include <QThread>
#include <QObject>
#include <QtCore>
#include <QDebug>
#include <QHash>

QHash<QString, QString> hash_a;
QHash<QString, QString> hash_b;

updatethread::updatethread()
{
    RemoteServer r;
    //generating hash tables
    hash_a = r.generateHash("http://emoncms.org/feed/list.json?apikey=4ea47aab75a01a5d00dcf609dea72a97", "id", "name");
    hash_b = r.generateHash("http://emoncms.org/feed/list.json?apikey=4ea47aab75a01a5d00dcf609dea72a97", "name", "id");

}

/**
    instances a new varmanager and updates the vars with it
*/
void updatethread::run()
{
    RemoteServer r;
    //infinite thread loop
    while(true)
    {
        qDebug() << r.getValue("4ea47aab75a01a5d00dcf609dea72a97", hash_b["batteries"]) << endl;
        sleep(2);
    }
}

