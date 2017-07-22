/****************************************************************************
**
** Copyright (C) 2015 The Qt Company Ltd.
** Contact: http://www.qt.io/licensing/
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** You may use this file under the terms of the BSD license as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

#include "plugin.h"
#include <QJsonObject>
#include <QtDebug>

CppListModel::CppListModel(QObject *parent):
    QAbstractListModel(parent)
{  }

QHash<int, QByteArray> CppListModel::roleNames() const
{
    QHash<int, QByteArray> roleNames;
    roleNames.insert(NameRole, "name");
    roleNames.insert(AgeRole, "age");
    roleNames.insert(ModelDataRole, "modelData");
    return roleNames;
}

int CppListModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    // 返回固定
    return 5;
}

QVariant CppListModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid() || index.row() < 0)
        return QVariant();

    if (index.row() >= 5) {
        qWarning() << "SatelliteModel: Index out of bound";
        return QVariant();
    }

    switch (role)
    {
    case NameRole:
        return QString("this name from cpp");
    case AgeRole:
        return 551;
    case ModelDataRole:
        return QJsonObject {
            { "name", "this name from cpp"},
            { "age", 551 }
        };
    default:
        break;
    }
    return QVariant();
}
//![plugin]
class QExampleQmlPlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID QQmlExtensionInterface_iid)

public:
    void registerTypes(const char *uri)
    {
        Q_ASSERT(uri == QLatin1String("Startplugins"));
        qmlRegisterType<CppListModel>(uri, 1, 0, "Start");
        //qmlRegisterType<StartBending>("Mstartplugins", 1, 0, "xxy");
    }
};
//![plugin]
//#include "datasql.moc"
#include "plugin.moc"
