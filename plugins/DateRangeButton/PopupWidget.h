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

#ifndef PLUGIN_DATE_RANGE_BUTTON_POPUP_WIDGET_HPP
#define PLUGIN_DATE_RANGE_BUTTON_POPUP_WIDGET_HPP

#include <QtGui>
#include <QtWidgets>
#include "Object.h"

class PopupWidget : public QMenu
{
  Q_OBJECT
  
  public:
    PopupWidget (QWidget *);
    void createGUI ();
    void setSettings (QStringList l, QString range, QDateTime sd, QDateTime ed, bool cus);
    QString range ();
    QDateTime startDate ();
    QDateTime endDate ();
    bool custom ();
    bool modified ();

  public slots:
    void setModified ();
    void clear ();
    void customChanged (bool);

  protected:
    QDateTimeEdit *_startDate;
    QDateTimeEdit *_endDate;
    QGroupBox *_custom;
    QComboBox *_range;
    bool _modified;
};

#endif
