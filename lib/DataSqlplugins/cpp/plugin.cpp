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


bool BendingProgram::opensql()
{
    //database = QSqlDatabase::addDatabase("QSQLITE");
    if(QSqlDatabase::contains("qt_sql_default_connection"))
        database = QSqlDatabase::database("qt_sql_default_connection");
    else
        database = QSqlDatabase::addDatabase("QSQLITE");

    database.setDatabaseName("BendingDataBase.db");
    if(database.open())
    {
        qDebug()<<"Database Opened";
        return true;
    }
    else
    {
        qDebug() << "Error: Failed to connect database." << database.lastError();
        return false;
    }
}

int BendingProgram::mathod_sql(QString str)
{
    database = QSqlDatabase::addDatabase("QSQLITE");
    database.setDatabaseName("BendingDataBase.db");
    if(database.open())
    {
        qDebug()<<"Database Opened";
        QSqlQuery msql_query;
        sql_query = &msql_query;
        sql_query->prepare(str);
        if(!sql_query->exec())
        {
            qDebug()<<sql_query->lastError();
            closesql();
            return 1;
        }
        else
        {
            return 0;

        }
    }
    else
    {
        qDebug() << "Error: Failed to connect database." << database.lastError();
        return 2;
    }
}

bool BendingProgram::createsql()
{
    QString create_sql = "create table BendingData (id int primary key,\
            name varchar(30),\
            stepnum int,\
            widthness float,\
            thickness float,\
            material varchar(20),\
            topmould varchar(10),\
            bottommould varchar(10),\
            workednum int,\
            edittime varchar(20),\
            shangsidian float,\
            zhuansudian float,\
            jiajindian float,\
            enable int)";
            database = QSqlDatabase::addDatabase("QSQLITE");
    database.setDatabaseName("BendingDataBase.db");
    if(database.open())
    {
        qDebug()<<"Database Opened";
    }
    else
    {
        qDebug() << "Error: Failed to connect database." << database.lastError();
        return false;
    }

    //QSqlQuery msql_query;
    QSqlQuery sql_query;//= &msql_query;

    QString insert_sql = "insert into BendingData values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    sql_query.prepare(create_sql);
    if(!sql_query.exec())
    {
        qDebug()<<QObject::tr("Table Create failed");
        qDebug()<<sql_query.lastError();
        closesql();
        return false;
    }
    else
    {
        qDebug()<< "Table Created" ;

        sql_query.prepare(insert_sql);
        sql_query.addBindValue(1);
        sql_query.addBindValue("BendingProgram");
        sql_query.addBindValue(3);
        sql_query.addBindValue(3.14);
        sql_query.addBindValue(5.6577);
        sql_query.addBindValue("铝制");
        sql_query.addBindValue("bv-Top");
        sql_query.addBindValue("xx-Bottom");
        sql_query.addBindValue(50);
        sql_query.addBindValue("2017-7-18 10:00");
        sql_query.addBindValue(100);
        sql_query.addBindValue(200);
        sql_query.addBindValue(300);
        sql_query.addBindValue(1);

        if(!sql_query.exec())//execBatch
        {
            qDebug()<<sql_query.lastError();
            closesql();
            return false;
        }
        else
        {
            qDebug()<<"first insert success";
            closesql();
            return true;
        }
    }
}
bool BendingProgram::insertsql()
{
    QString insert_sql = "insert into BendingData values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    if(opensql())
    {
        QSqlQuery *sql_query = new QSqlQuery;
        sql_query->prepare(insert_sql);
        sql_query->addBindValue(2);
        sql_query->addBindValue("BendingProgram");
        sql_query->addBindValue(3);
        sql_query->addBindValue(3.14);
        sql_query->addBindValue(5.6577);
        sql_query->addBindValue("铝制");
        sql_query->addBindValue("bv-Top");
        sql_query->addBindValue("xx-Bottom");
        sql_query->addBindValue(50);
        sql_query->addBindValue("2017-7-18 10:00");
        sql_query->addBindValue(100);
        sql_query->addBindValue(200);
        sql_query->addBindValue(300);
        sql_query->addBindValue(1);
        if(!sql_query->exec())
        {
            qDebug()<<sql_query->lastError();
            closesql();
            return false;
        }
        else
        {
            qDebug()<<"insertsql success";
            closesql();
            return true;
        }
    }
    else
    {
        qDebug() << "Error: Failed to connect database." << database.lastError();
        return false;
    }

    //    if(R_num>0)
    //    {
    //        qDebug()<<"insertsql faile";
    //        if(R_num==1)
    //            closesql();
    //        return false;
    //    }
    //    else
    //    {

    //        qDebug()<<"insertsql success";
    //        closesql();
    //        return true;
    //    }
}

bool BendingProgram::selectsql()
{
    QString select_all_sql = "select * from BendingData order by id";
    //int R_num = mathod_sql(select_all_sql);
    if(opensql())
    {
        QSqlQuery sql_query;
        sql_query.prepare(select_all_sql);

        if(!sql_query.exec())
        {
            qDebug()<<sql_query.lastError();
            closesql();
            return false;
        }
        else
        {
            while(sql_query.next())
            {
                int id = sql_query.value(0).toInt();
//                QString type = sql_query->value(1).toString();
//                QString name = sql_query->value(2).toString();
//                int stepnum = sql_query->value(3).toInt();
//                QString codetype = sql_query->value(4).toString();
//                float thickness = sql_query->value(5).toFloat();
//                QString mould = sql_query->value(6).toString();
                m_idData+=QString("ID:%1").arg(id);
                qDebug()<<QString("ID:%1").arg(id);
            }

            closesql();
            return true;
        }
    }

   return false;

}
bool BendingProgram::deletesql()
{
    QString delete_sql = "delete from BendingData where id=2";
    int R_num = mathod_sql(delete_sql);
    if(R_num>0)
    {
        qDebug()<<"BendingData delete failed";
        return false;
    }
    else
    {
        qDebug()<<"BendingData delete success";
        closesql();
        return true;
    }
}

void BendingProgram::closesql()
{
    database.close();
    qDebug()<<"stopclose";
}

QString BendingProgram::getidData()
{
    return m_idData;
}
void BendingProgram::setidData(QString str)
{
    m_idData = str;
    emit idDataChanged();
}

//signals:


//protected:

//![plugin]
class QExampleQmlPlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID QQmlExtensionInterface_iid)

public:
    void registerTypes(const char *uri)
    {
        Q_ASSERT(uri == QLatin1String("Dataplugins"));
        qmlRegisterType<BendingProgram>(uri, 1, 0, "Data");
    }
};
//![plugin]
//#include "datasql.moc"
#include "plugin.moc"
