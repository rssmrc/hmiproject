/*******************************************************
 * Copyright (C) 2017-2018 Marco Rossi marco.rossi1337@gmail.com
 *
 * This file is part of PVSystem.
 *
 * PVSystem can not be copied and/or distributed without the express
 * permission of Marco Rossi
 *******************************************************/

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

QString RemoteServer::sendRequest(QUrl url)
{
    QEventLoop eventLoop;
    QNetworkAccessManager mgr;
    QObject::connect(&mgr, SIGNAL(finished(QNetworkReply*)), &eventLoop, SLOT(quit()));

    QNetworkRequest req(url);
    QNetworkReply *reply = mgr.get(req);
    eventLoop.exec();

    QString rep = reply->readLine();

    return rep;
}


QString RemoteServer::output()
{

    //getting reply from the server
    QByteArray reply = getResponse(QUrl( QString("http://date.jsontest.com/")));
    //new json parser
    JsonParser jp;
    //returning the time value from the json document
    return jp.Parse(reply, "date");
}

QString RemoteServer::getFromOnline(QString url, QString p)
{
    QByteArray reply = getResponse(QUrl(url));
    JsonParser jp;
    QString o = jp.Parse(reply, p);

    return o;

}

QString RemoteServer::printJson()
{
    return output();
}

void RemoteServer::qmlprinttest()
{
    qDebug("C++ Function called!");
}

