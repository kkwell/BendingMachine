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
    Q_PROPERTY(int databasenum READ databasenum WRITE setDatabasenum NOTIFY databasenumChanged)
    Q_PROPERTY(int pagenum READ pagenum WRITE setPagenum NOTIFY pagenumChanged)
    Q_PROPERTY(int selectindex READ selectindex WRITE setselectIndex NOTIFY selectIndexChanged)
    Q_PROPERTY(int type READ type WRITE settype NOTIFY typeChanged)
    //keyboard
    Q_PROPERTY(QString editname READ editname WRITE seteditname NOTIFY editnameChanged)
    Q_PROPERTY(QString editvalue READ editvalue WRITE seteditvalue NOTIFY editvalueChanged)
    Q_PROPERTY(QString myvalue READ myvalue WRITE setmyvalue NOTIFY myvalueChanged)
    Q_PROPERTY(QString symble READ symble WRITE setsymble NOTIFY symbleChanged)
    Q_PROPERTY(QString sqltitlename READ sqltitlename WRITE setsqltitlename NOTIFY sqltitlenameChanged)
public:
    explicit BendingProgram(QObject *parent = 0);
    ~BendingProgram()
    {
        closesql();
    }

    Qt::ItemFlags  flags(const QModelIndex &index) const;
    bool setData(const QModelIndex &index, const QVariant &value,int role = Qt::EditRole);

    Q_INVOKABLE void pushdata(const QString& data1, const QString& data2);
    Q_INVOKABLE void  minsert(int index);
    Q_INVOKABLE void  mremove(int index);
    Q_INVOKABLE void pagedown();
    Q_INVOKABLE void deletesql(int index);
    void id_changeup(int startId);
    void id_changedown(int startId);
    Q_INVOKABLE void pageup();

    enum Roles{
        JsonRole = Qt::UserRole + 1,
        NameRole,            // name
        EdittimeRole,                                // age
    };

    QHash<int, QByteArray> roleNames() const;
    int rowCount(const QModelIndex &parent) const;
    QVariant data(const QModelIndex &index, int role) const;
    QJsonObject JsonData[8];
    //update company set address='',salary=20;
    //update data set id=id-1 where id>currentCount;
    //set seek
    //insert into tablename(字段名1,...) select 字段名1... from tablename where id=...
    int mathod_sql(QString str);
    Q_INVOKABLE void test();
    bool opensql(QString &str);
    void closesql();
    bool createsql();
    bool insertsql();
    bool selectsql(int &seeknum,QString &pagename,int &maxnum);
    void getsqlnum();//获得数据库总数:m_databasenum

    QString getidData();
    void setidData(QString str);
    int databasenum();
    void setDatabasenum(int n);
    int pagenum();
    void setPagenum(int n);
    int selectindex();
    void setselectIndex(int n);

    int type();
    void settype(int n);

    QString editname();
    void seteditname(QString str);
    QString editvalue();
    void seteditvalue(QString str);
    QString myvalue();
    void setmyvalue(QString str);
    QString symble();
    void setsymble(QString str);
    QString sqltitlename();
    void setsqltitlename(QString str);

signals:
    //void typeChanged();
    void idDataChanged();
    void databasenumChanged();
    void pagenumChanged();
    void selectIndexChanged();
    void typeChanged();

    void editnameChanged();
    void editvalueChanged();
    void myvalueChanged();
    void symbleChanged();
    void sqltitlenameChanged();
    //protected:

private:
    int xnum;
    int pagedatanum;//当前页面数据个数
    int m_pagenum;//当前页面数
    int listviewpagenum;//listview显示数据行数
    int m_databasenum;//数据库总数

    int m_selectIndex;//当前选中行数
    int m_type;
    QString m_idData;
    QString databasename;
    QString databasepagename;
    QSqlDatabase database;
    QSqlQuery *sql_query;

    QString m_editname;
    QString m_editvalue;
    QString m_myvalue;
    QString m_symble;
    QString m_sqltitlename;
};
#endif // PLUGIN

