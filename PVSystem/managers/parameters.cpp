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
    PVSystem, parameters.cpp
    Purpose: Reads/Writes Parameters from QML

    @author Marco Rossi
    @version 1.0 14/06/17
*/

#include "parameters.h"
#include <QObject>

struct params{
    QString ipaddr;
    QString server;
    QString d_gateway;
    QString subnet;
}params;

parameters::parameters()
{
    params.ipaddr = "0.0.0.0";
    params.server = "https://emoncms.org";
    params.d_gateway = "0.0.0.0";
    params.subnet = "0.0.0.0";
}

/**
    Gets the parameter value

    @param id 0 = IP Address, 1 = Server Address, 2 = Default Gateway, 3 = Subnet Mask
    @return Requested value
*/
QString parameters::get(int id)
{
    switch(id)
    {
    case 0:
        return params.ipaddr;
        break;
    case 1:
        return params.server;
        break;
    case 2:
        return params.d_gateway;
        break;
    case 3:
        return params.subnet;
        break;
    default:
        return "";
        break;

    }
}

/**
    Sets the parameter value

    @param id 0 = IP Address, 1 = Server Address, 2 = Default Gateway, 3 = Subnet Mask
    @param val New value
*/
void parameters::set(int id, QString val)
{
    switch(id)
    {
    case 0:
        params.ipaddr = val;
        break;
    case 1:
        params.server = val;
        break;
    case 2:
        params.d_gateway = val;
        break;
    case 3:
        params.subnet = val;
        break;
    default:
        break;

    }
}
