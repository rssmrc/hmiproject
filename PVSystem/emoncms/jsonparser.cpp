/*******************************************************
 * Copyright (C) 2017-2018 Marco Rossi marco.rossi1337@gmail.com
 *
 * This file is part of PVSystem.
 *
 * PVSystem can not be copied and/or distributed without the express
 * permission of Marco Rossi
 *******************************************************/

#include "jsonparser.h"
#include <QObject>
#include <QJsonParseError>
#include <QJsonObject>
#include <QJsonDocument>

JsonParser::JsonParser()
{


}

QString JsonParser::Parse(QByteArray r, QString lookfor)
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
