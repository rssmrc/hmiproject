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

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <emoncms/remoteserver.h>
#include <emoncms/varmanager.h>
#include <iostream>
#include <QQmlContext>
#include <QTimer>

using namespace std;

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    //REMOTE SERVER
    RemoteServer s;
    varmanager v;
    //testing c++ and qml implementation
    QQmlApplicationEngine engine;
    //new qmlcontext property linked to the remoteserver object
    engine.rootContext()->setContextProperty("qmlobj", &s);
    engine.rootContext()->setContextProperty("emonvars", &v);
    //cache disabled
    qputenv("QML_DISABLE_DISK_CACHE", "true");
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));



    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}


