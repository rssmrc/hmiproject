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


RemoteServer::RemoteServer()
{

}

QNetworkReply *RemoteServer::sendRequest()
{
    QNetworkAccessManager *manager = new QNetworkAccessManager();
    QByteArray someData = "q=neriinformatica";
    QNetworkRequest request(QUrl("http://google.com/search"));
    QNetworkReply *reply = manager->put(request, someData);

    return reply;
}

QString output()
{

    return "";
}

