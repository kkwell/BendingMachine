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
    m_pagenum = 1;
    m_databasenum = -1;
    pagedatanum = 0;
    listviewpagenum = 8;
    m_selectIndex = 0;
    m_type = 0;
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
    Q_UNUSED(value)
    Q_UNUSED(role)
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
    return pagedatanum;
}

QVariant BendingProgram::data(const QModelIndex &index, int role) const
{
    Q_UNUSED(role);
    if (!index.isValid() || index.row() < 0)
        return QVariant();

    if (index.row() >= pagedatanum) {
        qWarning() << "SatelliteModel: Index out of bound";
        return QVariant();
    }

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
    QString create_sql = "create table IF NOT EXISTS BendingData (id integer,\
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
        sql_query.addBindValue(0);
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
void BendingProgram::getsqlnum()
{
    QString select_all_sql = "select * from "+databasepagename;
    if(!database.isOpen())
    {
        opensql(databasename);
    }
    if(database.isOpen())
    {
        QSqlQuery sql_query;
        sql_query.prepare(select_all_sql);

        if(!sql_query.exec())
        {
            qDebug()<<sql_query.lastError();
        }
        else
        {
            sql_query.last();
            m_databasenum = sql_query.at()+1;
            int num = ceil(double(m_databasenum)/listviewpagenum);
            if(m_pagenum==num)
            {
                pagedatanum = m_databasenum - (num-1)*listviewpagenum;
            }
            else if(m_pagenum<num)
            {
                pagedatanum = listviewpagenum;
            }
            else
            {
                qDebug()<<"m_pagenum:"<<m_pagenum<<"sum_num:"<<num;
            }
            setDatabasenum(m_databasenum);
            setPagenum(m_pagenum);
            qDebug()<<"总数:"<<m_databasenum<<"页码:"<<m_pagenum<<"当前页面数据个数:"<<pagedatanum;
        }
    }
}
void BendingProgram::id_changeup(int startId)//数据库id
{
//    QString updateId;// = QString("update %1 set id=id+1 where id=%2").arg(databasepagename).arg(startId);
//    if(database.isOpen())
//    {
//        int index = m_databasenum-1;
//        QSqlQuery *sql_query = new QSqlQuery;
//        while(index>startId)
//        {
//            updateId = QString("update %1 set id=id+1 where id=%2").arg(databasepagename).arg(index);
//            sql_query->prepare(updateId);
//            if(!sql_query->exec())
//            {
//                qDebug()<<sql_query->lastError();
//                break;
//                //return false;
//            }
//            else
//            {
//                qDebug()<<"id_changeup success";
//            }
//            index--;
//        }
//    }
//    else
//    {
//        qDebug() << "Error: Failed to connect database." << database.lastError();
//        //return false;
//    }
    QString updateId = QString("update %1 set id=id+1 where id>%2").arg(databasepagename).arg(startId);
    if(database.isOpen())
    {
        QSqlQuery *sql_query = new QSqlQuery;

        sql_query->prepare(updateId);
        if(!sql_query->exec())
        {
            qDebug()<<sql_query->lastError();
            //return false;
        }
        else
        {
            qDebug()<<"id_changeup success";
        }

    }
    else
    {
        qDebug() << "Error: Failed to connect database." << database.lastError();
        //return false;
    }
}
void BendingProgram::id_changedown(int startId)//数据库id
{
    QString updateId = QString("update %1 set id=id-1 where id>%2").arg(databasepagename).arg(startId);
    if(database.isOpen())
    {
        QSqlQuery *sql_query = new QSqlQuery;

        sql_query->prepare(updateId);
        if(!sql_query->exec())
        {
            qDebug()<<sql_query->lastError();
            //return false;
        }
        else
        {
            qDebug()<<"id_changedown success";
        }

    }
    else
    {
        qDebug() << "Error: Failed to connect database." << database.lastError();
        //return false;
    }
}
void BendingProgram::minsert(int index)//数据库id
{
    if(index<0)
        return;
    QString insert_sql = "insert into BendingData values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    const char* COLUMN_NAMES[] = {
        //"id",
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
    id_changeup(index);
    if(database.isOpen())
    {
        QSqlQuery *sql_query = new QSqlQuery;
        sql_query->prepare(insert_sql);

        sql_query->addBindValue(index+1);

        int n=0;
        //QString name;
        while(COLUMN_NAMES[n])
        {
            sql_query->addBindValue(JsonData[index-(m_pagenum-1)*listviewpagenum].take(COLUMN_NAMES[n]));
            //JsonData[0].insert(COLUMN_NAMES[n],sql_query.value(n).toString());
            n++;
        }
        if(!sql_query->exec())
        {
            qDebug()<<sql_query->lastError();
            //return false;
        }
        else
        {
            qDebug()<<"insertsql success";
            settype(0);
        }
    }
    else
    {
        qDebug() << "Error: Failed to connect database." << database.lastError();
        //return false;
    }
//    beginResetModel();
//    for(int i=0;i<8;i++){
//    JsonData[i].insert("name","what's that");
//    }
    //endInsertRows();
//beginResetModel();
//selectsql(0,databasepagename,);
//endResetModel();
}

bool BendingProgram::selectsql(int &seeknum,QString &pagename,int &maxnum)
{
    QString select_all_sql = QString("select * from %1 order by id").arg(pagename);
    // order by id";//"select *from BendingData%1 where data between '%2' and '%4'";
    //QString time = QDate::currentDate().toString("yyyy-MM-dd HH:mm:ss");
    //qDebug()<<time;
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
    if(!database.isOpen())
    {
        opensql(databasename);
    }
    if(database.isOpen())
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
            if(m_databasenum<0)
            {
                sql_query.last();
                m_databasenum = sql_query.at()+1;
                qDebug()<<"databasenum:"<<m_databasenum;
            }

            sql_query.seek(seeknum);
            int i=0,n=0;
            beginResetModel();
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
            endResetModel();
            return true;
        }
    }
    return false;
}
void BendingProgram::deletesql(int index)//id号
{
    if(index<0)
        return;
    QString delete_sql = QString("delete from BendingData where id=%1").arg(index);

    if(database.isOpen())
    {
        QSqlQuery *sql_query = new QSqlQuery;
        sql_query->prepare(delete_sql);

        if(!sql_query->exec())
        {
            qDebug()<<sql_query->lastError();
            //return false;
        }
        else
        {
            qDebug()<<"deletesql success";
            id_changedown(index);
            settype(0);
        }
    }
    else
    {
        qDebug() << "Error: Failed to connect database." << database.lastError();
        //return false;
    }
}

void BendingProgram::closesql()
{
    database.close();
    qDebug()<<"stopclose";
}

void BendingProgram::settype(int n)//数据库界面初始化
{
    m_type = n;
    int num;
    switch(n)
    {
    case 0:
        //createsql();
        getsqlnum();
        num = (m_pagenum-1)*listviewpagenum;
        selectsql(num,databasepagename,pagedatanum);//从首页开始
        break;
    case 1:
        break;
    default:break;

    }
    emit typeChanged();
}
int BendingProgram::type()
{
    return m_type;
}

void BendingProgram::test()
{
    //beginResetModel();
    setselectIndex(0);
    //endResetModel();
//    beginResetModel();
//    JsonData[0].insert("name","yes 1");
//    JsonData[1].insert("name","yes 2");
//    JsonData[2].insert("name","yes 3");
//    JsonData[3].insert("name","yes 4");
//    JsonData[4].insert("name","yes 5");
//    JsonData[5].insert("name","yes 6");
//    endResetModel();
    //beginRemoveRows/endRemoveRows
    //beginInsertRows/endInsertRows
}
void BendingProgram::pagedown()
{
    int num = ceil(double(m_databasenum)/listviewpagenum);
    if(m_pagenum<num)
    {
        m_pagenum++;
        if(m_pagenum==num)
        {
            pagedatanum = m_databasenum - (num-1)*listviewpagenum;
        }
        else if(m_pagenum<num)
        {
            pagedatanum = listviewpagenum;
        }
        else
        {
            qDebug()<<"m_pagenum:"<<m_pagenum<<"sum_num:"<<num;
        }
        num = (m_pagenum-1)*listviewpagenum;
        selectsql(num,databasepagename,pagedatanum);
        setPagenum(m_pagenum);

    }
}
void BendingProgram::pageup()
{
    int num = ceil(double(m_databasenum)/listviewpagenum);
    if(m_pagenum>1)
    {
        m_pagenum--;
        if(m_pagenum==num)
        {
            pagedatanum = m_databasenum - (num-1)*listviewpagenum;
        }
        else if(m_pagenum<num)
        {
            pagedatanum = listviewpagenum;
        }
        else
        {
            qDebug()<<"m_pagenum:"<<m_pagenum<<"sum_num:"<<num;
        }
        num = (m_pagenum-1)*listviewpagenum;
        selectsql(num,databasepagename,pagedatanum);
        setPagenum(m_pagenum);
        setselectIndex(0);
    }
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
int BendingProgram::databasenum()
{
    return m_databasenum;
}
void BendingProgram::setDatabasenum(int n)
{
    m_databasenum = n;
    emit databasenumChanged();
}
int BendingProgram::pagenum()
{
    return m_pagenum;
}
void BendingProgram::setPagenum(int n)
{
    m_pagenum = n;
    emit pagenumChanged();
}
int BendingProgram::selectindex()
{
    return m_selectIndex;
}
void BendingProgram::setselectIndex(int n)
{
    m_selectIndex = n;
    emit selectIndexChanged();
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
