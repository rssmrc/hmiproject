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
    PVSystem, remoteserver.cpp
    Purpose: Sends HTTPS GET Requests to remote servers

    @author Marco Rossi
    @version 1.0 09/05/17
*/

#include "remoteserver.h"
#include "../utilities/jsonparser.h"
#include <QNetworkAccessManager>
#include <QObject>
#include <QCoreApplication>
#include <QDebug>
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QUrl>
#include <QUrlQuery>
#include <QJsonParseError>
#include <QJsonObject>
#include <QJsonDocument>

RemoteServer::RemoteServer()
{

}

/**
    Sends a HTTP Get requests to server and returns the response

    @param url Crafted url containing all the parameters.
    @return QByteArray containing the server JSON reply
*/
QByteArray RemoteServer::getResponse(QUrl url)
{

    QEventLoop eventLoop;
    QNetworkAccessManager mgr;
    QObject::connect(&mgr, SIGNAL(finished(QNetworkReply*)), &eventLoop, SLOT(quit()));

    QNetworkRequest req(url);

    QSslConfiguration config = req.sslConfiguration();
    config.setPeerVerifyMode(QSslSocket::VerifyNone);
    req.setSslConfiguration(config);

    req.setRawHeader("Content-Type", "application/x-www-form-urlencoded");

    QNetworkReply *reply = mgr.get(req);
    eventLoop.exec();

    QByteArray rep = reply->readAll();

    return rep;

}

/**
    Sends a HTTP Get request and automatically extracts the required value

    @param url Crafted url containing all the parameters.
    @param p Key name of the target value.
    @return JSON Parsed value
*/
QString RemoteServer::getFromOnline(QString url, QString key)
{

    QByteArray reply = getResponse(QUrl(url));
    JsonParser jp;
    QString o = jp.Parse(reply, key);

    return o;
}

/**
    Generates a hash table containing all the id and value name correspondences

    @param url JSON Response URL
    @param param1 key name
    @param param2 value to associate

    @return Correspondences hash table
*/

QHash<QString, QString> RemoteServer::generateHash(QString url, QString param1, QString param2)
{
    //hash map and json parser declaration
    QHash<QString, QString> hashm;
    JsonParser jp;
    int i;

    //getting the list response
    QString reply = getResponse(QUrl(url));
    reply.replace('[',"");
    reply.replace(']',"");

    //generates a list containing all the lines
    QStringList list_1 = reply.split("},");

    //encoding in JSON format
    for(i = 0; i<list_1.count(); i++)
    {
        list_1[i].insert(list_1[i].length(), "}");
    }
    //removing end extra bracket
    list_1[list_1.count()-1].chop(1);

    //generating hash table
    for(i = 0; i<list_1.count(); i++)
    {
        hashm.insert(jp.Parse(list_1[i].toUtf8(), param1), jp.Parse(list_1[i].toUtf8(), param2));
    }

    return hashm;
}



