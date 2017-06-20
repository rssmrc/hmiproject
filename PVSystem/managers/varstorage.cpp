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
    PVSystem, varstorage.cpp
    Purpose: Stores the latest emoncms values and exposes them to QML

    @author Marco Rossi
    @version 1.0 19/05/17
*/


#include "varstorage.h"

int power[10];
int energy[10];

int index = 0;

VarStorage::VarStorage()
{

}

/**
    Adds the power value to the array

    @param p New power value
    @param e New power value
*/
void VarStorage::addValue(int p, int e)
{
    //cleaning up the array
    if(index == 0)
    {
        int i;
        for(i = 0; i<10; i++)
        {
            power[i] = 0;
            energy[i] = 0;
        }
    }
    //adding the requested value
    power[index] =  p;
    energy[index] = e;

    index = (index+1)%10;
}

/**
    Returns the value at the 'pos' position

    @return Value at requested position
*/
int VarStorage::getPower(int pos)
{
    return power[pos];
}

/**
    Returns the value at the 'pos' position

    @return Value at requested position
*/
int VarStorage::getEnergy(int pos)
{
    return energy[pos];
}

