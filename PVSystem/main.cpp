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
#include <protocols/remoteserver.h>
#include <managers/varmanager.h>
#include <managers/parameters.h>
#include <managers/keyboard.h>
#include <managers/varstorage.h>
#include <utilities/jsonparser.h>
#include "pvemu.h"
#include <iostream>
#include <QQmlContext>
#include <QTimer>
#include <QQuickItem>

using namespace std;

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    //initializes the varmanager, parameters manager and remote server
    varmanager v;
    parameters p;
    RemoteServer r;
    VarStorage s;
    JsonParser jp;
    //emulator
    PVEmu pvemu;

    QQmlApplicationEngine engine;
    //new qmlcontext property linked to the var manager object
    engine.rootContext()->setContextProperty("emonvars", &v);
    engine.rootContext()->setContextProperty("networkvars", &p);
    engine.rootContext()->setContextProperty("storage", &s);
    engine.rootContext()->setContextProperty("pvemu", &pvemu);

    //cache disabled
    qputenv("QML_DISABLE_DISK_CACHE", "true");
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    QObject *rootObject = engine.rootObjects().first();

    //new keyboard object
    Keyboard kboard(rootObject);
    engine.rootContext()->setContextProperty("vkboard", &kboard);


    //Starts the variables management thread
    v.start();
    //Starts the emulator
    pvemu.start();

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}



