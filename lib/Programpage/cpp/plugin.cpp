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

#include <QtQml/QQmlExtensionPlugin>
#include <QtQml/qqml.h>
#include <qdebug.h>
#include <qdatetime.h>
#include <qbasictimer.h>
#include <qcoreapplication.h>

//#include <QSql>
#include <QSqlDatabase>
#include <QSqlError>
#include <QSqlQuery>

// Implements a "TimeModel" class with hour and minute properties
// that change on-the-minute yet efficiently sleep the rest
// of the time.

class BendingProgram : public QObject
{
    Q_OBJECT
public:
    BendingProgram(QObject *parent=0) : QObject(parent)
    {
        //opensql();
    }
    ~BendingProgram()
    {
        //stopsql();
    }
    void opensql()
    {

            database = QSqlDatabase::addDatabase("QSQLITE");
            database.setDatabaseName("BendingDataBase.db");
            //database.setUserName("Bending");
            //database.setPassword("Bending");
            if(database.open())
            {
                qDebug()<<"Database Opened";
            }
            else
            {
                qDebug() << "Error: Failed to connect database." << database.lastError();
                return;
            }

            QSqlQuery msql_query;
            sql_query = &msql_query;
                QString create_sql = "create table BendingData (id int primary key, type varchar(30), name varchar(30),stepnum int,thickness float,mould varchar(30))";
                QString create_user = "create table user (id int primary key,name varchar(30),passward varchar(30)";
                QString insert_sql = "insert into BendingData values(?,?,?,?,?,?,?)";

                QString select_all_sql = "select * from BendingData";

//                sql_query.prepare(create_sql); //创建表
//                if(!sql_query.exec()) //查看创建表是否成功
//                {
//                    qDebug()<<QObject::tr("Table Create failed");
//                    qDebug()<<sql_query.lastError();
//                }
//                else
//                {
                    qDebug()<< "Table Created" ;

                    //插入数据
//                    sql_query.prepare(insert_sql);
//                    sql_query.addBindValue(3);
//                    sql_query.addBindValue("Wang");
//                    sql_query.addBindValue(3.14);
//                    sql_query.addBindValue(5.65778);

//                    if(!sql_query.exec())//execBatch
//                    {
//                        qDebug()<<sql_query.lastError();
//                    }
//                    else
//                    {
//                        qDebug()<<"插入记录成功";
//                    }

                    //查询所有记录
                    sql_query->prepare(select_all_sql);
                    if(!sql_query->exec())
                    {
                        qDebug()<<sql_query->lastError();
                    }
                    else
                    {
                        while(sql_query->next())
                        {
                            int id = sql_query->value(0).toInt();
                            QString type = sql_query->value(1).toString();
                            QString name = sql_query->value(2).toString();
                            int stepnum = sql_query->value(3).toInt();
                            QString codetype = sql_query->value(4).toString();
                            float thickness = sql_query->value(5).toFloat();
                            QString mould = sql_query->value(6).toString();
                            qDebug()<<QString("ID:%1 type:%2 Name:%3  stepnum:%4 codetype:%5 thickness:%6 mould:%7").arg(id).arg(type).arg(name).arg(stepnum).arg(codetype)\
                                      .arg(thickness).arg(mould);
                        }
                    }
               // }

    }

    void stopsql()
    {
        database.close();
        qDebug()<<"stopclose";
    }

//signals:


//protected:


private:
    QSqlDatabase database;
    QSqlQuery *sql_query;

};
//![plugin]
class QprogrampageQmlPlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID QQmlExtensionInterface_iid)

public:
    void registerTypes(const char *uri)
    {
        Q_ASSERT(uri == QLatin1String("Programpages"));
        qmlRegisterType<BendingProgram>(uri, 1, 0, "Sqlpages");
    }
};
//![plugin]

#include "plugin.moc"
