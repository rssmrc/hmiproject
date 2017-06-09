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
#include "jsonparser.h"
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
    QNetworkReply *reply = mgr.get(req);
    eventLoop.exec();

    QByteArray rep = reply->readAll();

    return rep;

}

/**
    Temporary testing purposes only function

    @return JSON Parsed value
*/
QString RemoteServer::output()
{

    //getting reply from the server
    QByteArray reply = getResponse(QUrl( QString("http://date.jsontest.com/")));
    //new json parser
    JsonParser jp;
    //returning the time value from the json document
    return jp.Parse(reply, "date");
}

/**
    Sends a HTTP Get request and automatically extracts the required value

    @param url Crafted url containing all the parameters.
    @param p Key name of the target value.
    @return JSON Parsed value
*/
QString RemoteServer::getFromOnline(QString url, QString p)
{
    QByteArray reply = getResponse(QUrl(url));
    JsonParser jp;
    QString o = jp.Parse(reply, p);

    return o;

}


