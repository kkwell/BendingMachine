#include "bendingsqlmodel.h"

#include <QSqlRecord>
#include <QSqlField>
#include <QDebug>

//const char* BendingSqlModel::COLUMN_NAMES[] = {
//    "id",
//    "name",
//    "edittime",
//    NULL
//};

//const char* BendingSqlModel::SQL_SELECT =
//        "select * from BendingData order by id";
//    "SELECT artists.artist, albums.title, albums.year"
//    " FROM albums"
//    " JOIN artists ON albums.artistid = artists.id";

BendingSqlModel::BendingSqlModel(QObject *parent) :
    QSqlQueryModel(parent)
{
//    if(QSqlDatabase::contains("qt_sql_default_connection"))
//        database = QSqlDatabase::database("qt_sql_default_connection");
//    else
//        database = QSqlDatabase::addDatabase("QSQLITE");

//    database.setDatabaseName("BendingDataBase.db");
//    if(database.open())
//    {
//        qDebug()<<"Database Opened";
//        QString select_all_sql = "select * from BendingData order by id";
//        //int R_num = mathod_sql(select_all_sql);

//            m_model = new BendingSqlModel();
//            m_model->setQuery(select_all_sql);
//        //return true;
//    }
//    else
//    {
//        qDebug() << "Error: Failed to connect database." << database.lastError();
//        //return false;
//    }

}

//QVariant BendingSqlModel::data(const QModelIndex &index, int role) const
//{
//    QVariant value = QSqlQueryModel::data(index, role);
//    if(role < Qt::UserRole)
//    {
//        value = QSqlQueryModel::data(index, role);
//    }
//    else
//    {
//        int columnIdx = role - Qt::UserRole - 1;
//        QModelIndex modelIndex = this->index(index.row(), columnIdx);
//        value = QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
//    }
//    return value;
//}

//void BendingSqlModel::refresh()
//{
//    this->setQuery(SQL_SELECT);
//}

void BendingSqlModel::setQuery(const QString &query, const QSqlDatabase &db)
{
    QSqlQueryModel::setQuery(query,db);
    generateRoleNames();
}

void BendingSqlModel::setQuery(const QSqlQuery & query)
{
   QSqlQueryModel::setQuery(query);
   generateRoleNames();
}

void BendingSqlModel::generateRoleNames()
{
    m_roleNames.clear();
    //QHash<int, QByteArray> roleNames;
    for( int i = 0; i < record().count(); i++) {
        //roleNames[Qt::UserRole + i + 1] = record().fieldName(i).toUtf8();
         m_roleNames.insert(Qt::UserRole + i + 1, record().fieldName(i).toUtf8());
    }
    //setRoleNames(roleNames);
}
QVariant BendingSqlModel::data(const QModelIndex &index, int role) const
{
    QVariant value;

    if(role < Qt::UserRole) {
        value = QSqlQueryModel::data(index, role);
    }
    else {
        int columnIdx = role - Qt::UserRole - 1;
        QModelIndex modelIndex = this->index(index.row(), columnIdx);
        value = QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
    }
    return value;
}
