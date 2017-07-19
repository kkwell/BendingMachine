#ifndef PLUGIN
#define PLUGIN

#include <QtQml/QQmlExtensionPlugin>
#include <QtQml/qqml.h>
#include <qdebug.h>
#include <qdatetime.h>
#include <qbasictimer.h>
#include <qcoreapplication.h>


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

