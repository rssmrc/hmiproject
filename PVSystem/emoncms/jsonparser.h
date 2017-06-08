/*******************************************************
 * Copyright (C) 2017-2018 Marco Rossi marco.rossi1337@gmail.com
 *
 * This file is part of PVSystem.
 *
 * PVSystem can not be copied and/or distributed without the express
 * permission of Marco Rossi
 *******************************************************/

#include <QObject>

#ifndef JSONPARSER_H
#define JSONPARSER_H


class JsonParser
{

public:
    JsonParser();
    QString Parse(QByteArray r, QString lookfor);

};


#endif // JSONPARSER_H
