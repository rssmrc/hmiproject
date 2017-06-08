/*******************************************************
 * Copyright (C) 2017-2018 Marco Rossi marco.rossi1337@gmail.com
 *
 * This file is part of PVSystem.
 *
 * PVSystem can not be copied and/or distributed without the express
 * permission of Marco Rossi
 *******************************************************/

#ifndef REMOTESERVER_H
#define REMOTESERVER_H

#include <QObject>
#include <QNetworkAccessManager>

class RemoteServer : public QObject
{
    Q_OBJECT

public:
    RemoteServer();
    QByteArray getResponse(QUrl url);
    QString sendRequest(QUrl url);
    QString output();

public slots:
    void qmlprinttest();
    QString printJson();
    QString getFromOnline(QString url, QString p);
};

#endif // REMOTESERVER_H
