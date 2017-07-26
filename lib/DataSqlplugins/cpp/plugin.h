#ifndef PLUGIN
#define PLUGIN
#include <QtQml/QQmlExtensionPlugin>
#include <QtQml/qqml.h>
#include <qdebug.h>
#include <qdatetime.h>
#include <qbasictimer.h>
#include <qcoreapplication.h>
#include <QVariant>
#include <QString>
#include <QSqlDatabase>
#include <QSqlError>
#include <QSqlQuery>
#include <QSqlTableModel>
#include <QAbstractListModel>

class BendingProgram : public QAbstractListModel
{
    Q_OBJECT
    //Q_PROPERTY(BendingSqlModel m_model READ getmodel WRITE setmodel NOTIFY modelChanged)
    Q_PROPERTY(QString idData READ getidData WRITE setidData NOTIFY idDataChanged)
    Q_PROPERTY(int type WRITE type)

public:
    explicit BendingProgram(QObject *parent = 0);
    ~BendingProgram()
    {
        closesql();
    }

    Qt::ItemFlags  flags(const QModelIndex &index) const;
    bool setData(const QModelIndex &index, const QVariant &value,int role = Qt::EditRole);

    //外部接口 QML调用 添加数据
       Q_INVOKABLE void pushdata(const QString& data1, const QString& data2);
       //外部接口 QML调用 添加数据在指定行
       Q_INVOKABLE void  minsert(int index);
       //外部接口 删除指定行
       Q_INVOKABLE void  mremove(int index);
    enum Roles{
        JsonRole = Qt::UserRole + 1,
        NameRole,            // name
        EdittimeRole,                                // age
        //ModelDataRole,                          // modelData
    };
//int rowCount(const QModelIndex &parent = QModelIndex()) const ;
    QHash<int, QByteArray> roleNames() const;
    int rowCount(const QModelIndex &parent) const;
    QVariant data(const QModelIndex &index, int role) const;
    QJsonObject JsonData[8];
    //update company set address='',salary=20;
    //update data set id=id-1 where id>currentCount;
    //set seek
    int mathod_sql(QString str);
    void test();
    bool opensql(QString &str);
    void closesql();
    bool createsql();
    bool insertsql();
    bool selectsql(int &seeknum,QString &pagename,int &maxnum);
    //void mopensql();
    bool deletesql();
    int xxy;
    //int type();
    void type(int n);
    QString getidData();
    void setidData(QString str);

signals:
    //void typeChanged();
    void idDataChanged();
//protected:


private:
    int xnum;
    int pagedatanum;
    int databasenum;
    QString m_idData;
    QString databasename;
    QString databasepagename;
    QSqlDatabase database;
    QSqlQuery *sql_query;

    //const char* COLUMN_NAMES[];
    //BendingSqlModel *m_model;
};
#endif // PLUGIN

