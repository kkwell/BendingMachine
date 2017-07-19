#ifndef PLUGIN
#define PLUGIN
#include <QtQml/QQmlExtensionPlugin>
#include <QtQml/qqml.h>
#include <qdebug.h>
#include <qdatetime.h>
#include <qbasictimer.h>
#include <qcoreapplication.h>

#include <QSqlDatabase>
#include <QSqlError>
#include <QSqlQuery>


class BendingProgram : public QObject
{
    Q_OBJECT
//    Q_PROPERTY(QString receivedata READ receivedata WRITE setreceivedata NOTIFY receivedataChanged)
    Q_PROPERTY(QString idData READ getidData WRITE setidData NOTIFY idDataChanged)

public:

    BendingProgram(QObject *parent=0) : QObject(parent)
    {
        //opensql();
        //createsql();
        //deletesql();
        //insertsql();
        selectsql();
    }

    ~BendingProgram()
    {
        //stopsql();
    }
    //update company set address='',salary=20;
    //update data set id=id-1 where id>currentCount;
    int mathod_sql(QString str);
    bool opensql();
    void closesql();
    bool createsql();
    bool insertsql();
    bool selectsql();
    //void mopensql();
    bool deletesql();


    QString getidData();
    void setidData(QString str);

signals:

    void idDataChanged();
//protected:


private:
    QString m_idData;
    QSqlDatabase database;
    QSqlQuery *sql_query;
};
#endif // PLUGIN

