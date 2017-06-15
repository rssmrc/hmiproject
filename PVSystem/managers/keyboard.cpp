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
    PVSystem, keyboard.cpp
    Purpose: On-Screen Keyboard handler

    @author Marco Rossi
    @version 1.0 15/06/17
*/

#include "keyboard.h"
#include <QObject>
#include <QGuiApplication>
#include <QQmlApplicationEngine>

QObject *root;

Keyboard::Keyboard(QObject *o)
{
    root = o;
}

void Keyboard::press(QString k, QString name)
{
    QObject *qmlObject = root->findChild<QObject*>(name);
    QString input = qmlObject->property("text").toString() + k;
    qmlObject->setProperty("text",input);
}

void Keyboard::deletechar(QString name)
{
    QObject *qmlObject = root->findChild<QObject*>(name);
    QString input = qmlObject->property("text").toString();
    QString output = input.mid(0, input.length()-1);
    qmlObject->setProperty("text",output);
}
