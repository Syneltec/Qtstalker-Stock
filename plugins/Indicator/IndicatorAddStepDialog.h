/*
 *  Qtstalker stock charter
 *
 *  Copyright (C) 2001-2010 Stefan S. Stratigakos
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307,
 *  USA.
 */

#ifndef PLUGIN_INDICATOR_ADD_STEP_DIALOG_HPP
#define PLUGIN_INDICATOR_ADD_STEP_DIALOG_HPP

#include <QtGui>
#include <QtWidgets>

#include "Dialog.h"

class IndicatorAddStepDialog : public Dialog
{
  Q_OBJECT
  
  public:
    IndicatorAddStepDialog (QStringList objects);
    ~IndicatorAddStepDialog ();
    void createTab ();
    void setSettings (QStringList);
    void settings (QString &name, QString &plugin);

  public slots:
    void done ();
    void loadSettings ();
    void saveSettings ();
    void modified ();

  protected:
    QComboBox *_indicator;
    QLineEdit *_name;
    QStringList _objects;
};

#endif
