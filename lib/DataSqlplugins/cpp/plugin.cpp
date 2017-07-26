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

BendingProgram::BendingProgram(QObject *parent):
    QAbstractListModel(parent)
{
    databasename = "BendingDataBase.db";
    databasepagename = "BendingData";
    databasenum = -1;
    pagedatanum = 8;
    //opensql(databasename);
    //createsql();
    //deletesql();
    //insertsql();
//    selectsql();
}

QHash<int, QByteArray> BendingProgram::roleNames() const
{
    QHash<int, QByteArray> roleNames;
//    const char* COLUMN_NAMES[] = {
//        "id",
//        "draw",
//        "name",
//        "stepnum",
//        "widthness",
//        "thickness",
//        "material",
//        "topmould",
//        "bottommould",
//        "workednum",
//        "edittime",
//        "shangsidian",
//        "zhuansudian",
//        "jiajindian",
//        "enable",
//        NULL
//    };
//    int i = 0;
//    while(COLUMN_NAMES[i])
//    {

        roleNames.insert(JsonRole, "json");

//        roleNames.insert(NameRole, "name");
//        roleNames.insert(EdittimeRole, "edittime");
        //i++;

    //}
    return roleNames;
}

Qt::ItemFlags  BendingProgram::flags(const QModelIndex &index) const
{
    if (!index.isValid())
        return Qt::ItemIsEnabled;

    return QAbstractItemModel::flags(index) | Qt::ItemIsEditable;
}

bool BendingProgram::setData(const QModelIndex &index,const QVariant &value, int role)
{
    if (index.isValid()) {
        JsonData[1].remove("id");
        //JsonData[1].insert("id",55);
        JsonData[index.row()].insert("name","what's that");
        qDebug()<<JsonData[0];
        emit  dataChanged(index, index);
        return true;
    }
    return false;
}

int BendingProgram::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
//    QString select_all_sql = "select * from BendingData order by id";
//    //int R_num = mathod_sql(select_all_sql);
//    QSqlDatabase database;
//    if(QSqlDatabase::contains("qt_sql_default_connection"))
//        database = QSqlDatabase::database("qt_sql_default_connection");
//    else
//        database = QSqlDatabase::addDatabase("QSQLITE");

//    database.setDatabaseName("BendingDataBase.db");
//    if(database.open())
//    {
//        qDebug()<<"Database Opened";
//        QSqlQuery sql_query;
//        sql_query.prepare(select_all_sql);

//        if(!sql_query.exec())
//        {
//            qDebug()<<sql_query.lastError();
//            //closesql();
//            return 0;
//        }
//        else
//        {
//            return 5;

//        }
//    }
//    else
//    {
//        qDebug() << "Error: Failed to connect database." << database.lastError();
//        //return false;
//    }

    //qDebug()<<"opensql faile";
    return 6;
}

QVariant BendingProgram::data(const QModelIndex &index, int role) const
{
    //Q_UNUSED(role);
    if (!index.isValid() || index.row() < 0)
        return QVariant();

    if (index.row() >= 8) {
        qWarning() << "SatelliteModel: Index out of bound";
        return QVariant();
    }

    qDebug()<<index.row()<<"-"<<index<<"-"<<role<<"-"<<index.column();
    //index.row()
//        switch (index.row())
//        {
//        case JsonRole:
//            return JsonData;//sql_query->value("id").toString();//QString("this name from cpp");
//        case NameRole:
//            return "55x";//sql_query->value("name").toString();
//        case EdittimeRole:
//            return JsonData;//sql_query->value("edittime").toString();
//        default:
//            break;
//        }
    return JsonData[index.row()];
        //return QVariant();
}

bool BendingProgram::opensql(QString &str)
{
    //database = QSqlDatabase::addDatabase("QSQLITE");
    if(QSqlDatabase::contains("qt_sql_default_connection"))
        database = QSqlDatabase::database("qt_sql_default_connection");
    else
        database = QSqlDatabase::addDatabase("QSQLITE");

    database.setDatabaseName(str);
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
            //closesql();
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
    QString create_sql = "create table IF NOT EXISTS BendingData (id integer primary key autoincrement,\
            draw integer,\
            name varchar(30),\
            stepnum integer,\
            widthness float,\
            thickness float,\
            material varchar(20),\
            topmould varchar(10),\
            bottommould varchar(10),\
            workednum integer,\
            edittime varchar(20),\
            shangsidian float,\
            zhuansudian float,\
            jiajindian float,\
            enable integer)";
//            query.exec("create table IF NOT EXISTS lista (id integer primary key autoincrement,
//                        qta varchar(30), item INTEGER, FOREIGN KEY (item) REFERENCES items(id))");
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

    QString insert_sql = "insert into BendingData values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    sql_query.prepare(create_sql);
    if(!sql_query.exec())
    {
        qDebug()<<QObject::tr("Table Create failed");
        qDebug()<<sql_query.lastError();
        //closesql();
        return false;
    }
    else
    {
        qDebug()<< "Table Created" ;

        sql_query.prepare(insert_sql);
        sql_query.addBindValue(1);
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
            //closesql();
            return false;
        }
        else
        {
            qDebug()<<"first insert success";
            //closesql();
            return true;
        }
    }
}
void BendingProgram::minsert(int index)
{
    QString insert_sql = "insert into BendingData values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    if(opensql(databasename))
    {
        QSqlQuery *sql_query = new QSqlQuery;
        sql_query->prepare(insert_sql);
        sql_query->addBindValue(index);
        sql_query->addBindValue(0);
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
            //return false;
        }
        else
        {
            qDebug()<<"insertsql success";
            //return true;
        }
    }
    else
    {
        qDebug() << "Error: Failed to connect database." << database.lastError();
        //return false;
    }
//    deletesql();
//    selectsql();
//    dataChanged(createIndex(0, 0), createIndex(7, 0), QVector<int>() << 3);
}

bool BendingProgram::selectsql(int &seeknum,QString &pagename,int &maxnum)
{
    QString select_all_sql = "select * from "+pagename;// order by id";//"select *from BendingData%1 where data between '%2' and '%4'";
    QString time = QDate::currentDate().toString("yyyy-MM-dd HH:mm:ss");
    qDebug()<<time;
    const char* COLUMN_NAMES[] = {
        "id",
        "draw",
        "name",
        "stepnum",
        "widthness",
        "thickness",
        "material",
        "topmould",
        "bottommould",
        "workednum",
        "edittime",
        "shangsidian",
        "zhuansudian",
        "jiajindian",
        "enable",
        NULL
    };
    if(opensql(databasename))
    {
        QSqlQuery sql_query;
        sql_query.prepare(select_all_sql);

        if(!sql_query.exec())
        {
            qDebug()<<sql_query.lastError();
            return false;
        }
        else
        {
            if(databasenum<0)
            {
                sql_query.last();
                databasenum = sql_query.at()+1;
                qDebug()<<"databasenum:"<<databasenum;
            }

            sql_query.seek(seeknum);
            int i=0,n=0;
            while(COLUMN_NAMES[n])
            {
                JsonData[0].insert(COLUMN_NAMES[n],sql_query.value(n).toString());
                n++;
            }
            n=0;
            i++;
            while(sql_query.next()&&i<maxnum)
            {
                while(COLUMN_NAMES[n])
                {
                    JsonData[i].insert(COLUMN_NAMES[n],sql_query.value(n).toString());
                    n++;
                }
                n=0;
                i++;
            }
            while(i<maxnum)
            {
                while(COLUMN_NAMES[n])
                {
                    JsonData[i].insert(COLUMN_NAMES[n],"");
                    n++;
                }
                n=0;
                i++;
            }

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
        //closesql();
        return true;
    }
}

void BendingProgram::closesql()
{
    database.close();
    qDebug()<<"stopclose";
}

//int BendingProgram::type()
//{
//    qDebug()<<xnum;
//    selectsql();
//    return xnum;
//}

void BendingProgram::type(int n)
{
    switch(n)
    {
    case 0:
        selectsql(n,databasepagename,pagedatanum);//从首页开始
        break;
    case 1:
        break;
    default:break;

    }
}
void BendingProgram::test()
{
    qDebug()<<xnum;
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
