/*******************************************************
 * Copyright (C) 2017-2018 Marco Rossi marco.rossi1337@gmail.com
 *
 * This file is part of PVSystem.
 *
 * PVSystem can not be copied and/or distributed without the express
 * permission of Marco Rossi
 *******************************************************/

#include "remoteserver.h"
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

QByteArray RemoteServer::sendRequest()
{

    QEventLoop eventLoop;
    QNetworkAccessManager mgr;
    QObject::connect(&mgr, SIGNAL(finished(QNetworkReply*)), &eventLoop, SLOT(quit()));

    QNetworkRequest req( QUrl( QString("http://date.jsontest.com/")));
    QNetworkReply *reply = mgr.get(req);
    eventLoop.exec();

    QByteArray rep = reply->readAll();

    return rep;

}

QString RemoteServer::JSONParser(QByteArray r, QString lookfor)
{
    //converting the QByteArray to JSON Document
    QJsonParseError err;
    QJsonDocument document = QJsonDocument::fromJson(r, &err);

    //if everything went correctly
    if(document.isObject())
    {
        //declaring a new json object
        QJsonObject obj = document.object();
        //looking for specified value
        QJsonObject::iterator itr = obj.find(lookfor);

        if(itr == obj.end())
        {
            //empty object
        }
        else
        {
           //returning its value
           return itr.value().toString();
        }


    }
    //if the key doesn't exist then return null
    return NULL;
}

QString RemoteServer::output()
{
    //getting reply from the server
    QByteArray reply = sendRequest();
    //returning the time value from the json document
    return JSONParser(reply, "time");
}

