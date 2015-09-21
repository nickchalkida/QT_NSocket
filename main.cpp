//******************************************************************************
//
// Copyright (c) 2014-2015 by  Intralot  S.A. All Rights Reserved. The software,
// data, and  information  contained  herein  are  proprietary  to, and comprise
// valuable  trade  secrets  of,  Intralot  S.A.  which  intends  to  keep  them
// confidential  and  to  preserve them as trade secrets. Copies are provided in
// confidence by Intralot S.A., pursuant to a written license agreement, and may
// be used, copied, transmitted, and stored only in accordance with the terms of
// such a license. No title of such a license is transferable.
//
//                                       Intralot S.A.
//                                       64, Kifissias Ave. & 3, Premetis Str.
//                                       Athens, 15125 Greece
//                                       Phone : (+30) 210 615 6000
//                                       Fax: (+30) 210 610 6800
//                                       E-mail:info@intralot.com
//
// Unit name: main.cpp
// Description:
//
// Modification history:
// Kechris Nikolaos 24/04/2015: Initial design.
//
//******************************************************************************

#include <QApplication>
#include <QtGui>

#include <QObject>
#include <QQuickView>
#include <QQuickItem>
#include <QQmlContext>
#include "qtquick2applicationviewer.h"

#include "N_SOCKET.h"

QObject *rootObject;
NSOCKET *neasocket;
Message *neomessage;

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    neasocket = new NSOCKET;
    neomessage = new Message;

    QtQuick2ApplicationViewer viewer;
    viewer.setMainQmlFile(QStringLiteral("qml/NSocket/main.qml"));

    rootObject = dynamic_cast<QObject *>(viewer.rootObject());
    viewer.rootContext()->setContextProperty("MyMessage", neomessage);
    viewer.rootContext()->setContextProperty("myNeaSocket", neasocket);

    // Connect a C++ signal to a Javascript function of the main form
    QObject::connect(
                neomessage,
                SIGNAL(addListViewData(QVariant)),
                rootObject,
                SLOT(myListAddData(QVariant))
                );

    viewer.showExpanded();
    return app.exec();
}
