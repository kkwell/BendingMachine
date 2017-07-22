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
#include <QAbstractListModel>

class BendingProgram : public QAbstractListModel
{
    Q_OBJECT
    //Q_PROPERTY(BendingSqlModel m_model READ getmodel WRITE setmodel NOTIFY modelChanged)
    Q_PROPERTY(QString idData READ getidData WRITE setidData NOTIFY idDataChanged)

public:
    explicit BendingProgram(QObject *parent = 0);
    ~BendingProgram()
    {
        closesql();
    }
    enum Roles{
        JsonRole = Qt::UserRole + 1,
        NameRole,            // name
        EdittimeRole,                                // age
        //ModelDataRole,                          // modelData
    };

    QHash<int, QByteArray> roleNames() const;
    int rowCount(const QModelIndex &parent) const;
    QVariant data(const QModelIndex &index, int role) const;
    QJsonObject JsonData[8];
    //update company set address='',salary=20;
    //update data set id=id-1 where id>currentCount;
    //set seek
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
    //const char* COLUMN_NAMES[];
    //BendingSqlModel *m_model;
};
#endif // PLUGIN

