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
    PVSystem, jsonparser.cpp
    Purpose: Provides set of functions to operate with JSON outputs

    @author Marco Rossi
    @version 1.0 09/05/17
*/

#include "jsonparser.h"
#include <QObject>
#include <QJsonParseError>
#include <QJsonObject>
#include <QJsonDocument>

JsonParser::JsonParser()
{


}

/**
    Parses the JSON Output and returns the user specified value

    @param r The HTTP/HTTPS Response QByteArray containing the JSON Response.
    @param lookfor Key name of the value to return.
    @return a QString with the value of the specified key
*/
QString JsonParser::Parse(QByteArray r, QString lookfor)
{
    //converting the QByteArray to JSON Document
    QJsonParseError err;
    QJsonDocument document = QJsonDocument::fromJson(r, &err);
    QJsonObject ret;
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
           ret = itr.value().toString();
        }


    }
    //if the key doesn't exist then return null
    return ret;
}
