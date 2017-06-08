/*******************************************************
 * Copyright (C) 2017-2018 Marco Rossi marco.rossi1337@gmail.com
 *
 * This file is part of PVSystem.
 *
 * PVSystem can not be copied and/or distributed without the express
 * permission of Marco Rossi
 *******************************************************/

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <emoncms/remoteserver.h>
#include <iostream>


using namespace std;

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    RemoteServer s;
    QString a = s.output();
    qInfo() << a;
    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
