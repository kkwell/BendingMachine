#ifndef PLUGIN
#define PLUGIN

#include <QtQml/QQmlExtensionPlugin>
#include <QtQml/qqml.h>
#include <qdebug.h>
#include <qdatetime.h>
#include <qbasictimer.h>
#include <qcoreapplication.h>

#include <QAbstractListModel>



class CppListModel : public QAbstractListModel
{
    Q_OBJECT
public:
    explicit CppListModel(QObject *parent = 0);

    enum Roles{
        NameRole = Qt::UserRole + 1,            // name
        AgeRole,                                // age
        ModelDataRole,                          // modelData
    };

    QHash<int, QByteArray> roleNames() const;
    int rowCount(const QModelIndex &parent) const;
    QVariant data(const QModelIndex &index, int role) const;
};

class StartBending : public QObject
{
    Q_OBJECT


public:

    StartBending(QObject *parent=0) : QObject(parent)
    {

    }

    ~StartBending()
    {

    }


signals:



private:
    QString m_idData;

};
#endif // PLUGIN

