#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QSettings>
#include <QQuickStyle>
#include <QFile>
#include <QDebug>
#include <stdio.h>

//#define RASPBERRY

int main(int argc, char *argv[])
{
    //qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));
    QGuiApplication::setApplicationName("BendingMachine");
    QGuiApplication::setOrganizationName("raspberry-Project");
    QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QSettings settings;
    //QString style = QQuickStyle::name();
    //if (!style.isEmpty())
    //settings.setValue("style", style);
    //else
    //QQuickStyle::setStyle(settings.value("style").toString());
    QQuickStyle::setStyle("Material");
    QQmlApplicationEngine engine;
    //engine.addImportPath("/root/BendingMachine/export/lib/qmllib");
    QString path=QCoreApplication::applicationDirPath();

    qDebug()<<path;
#ifdef Q_OS_MACOS
    qDebug()<<"system:MACOS";
    engine.addImportPath("../../../lib/DataSqlplugins/imports/");
    engine.addImportPath("../../../lib/Startplugins/imports/");
#elif defined(Q_OS_LINUX)
    qDebug()<<"system:LINUX";
    engine.addImportPath("./lib/DataSqlplugins/imports/");
    engine.addImportPath("./lib/Startplugins/imports/");
#elif defined(Q_OS_WIN)
    qDebug()<<"system:WIN";
    engine.addImportPath("./lib/DataSqlplugins/imports/");
    engine.addImportPath("./lib/Startplugins/imports/");
#endif

    engine.load(QUrl("qrc:/main.qml"));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}

