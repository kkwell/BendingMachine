#ifndef BENDINGSQLMODEL
#define BENDINGSQLMODEL

#include <QSqlQueryModel>
#include <QSqlDatabase>
#include <QSqlError>
#include <QSqlQuery>

class BendingSqlModel : public QSqlQueryModel
{
    Q_OBJECT

public:
    explicit BendingSqlModel(QObject *parent = 0);

    void setQuery(const QString &query, const QSqlDatabase &db = QSqlDatabase());
    void setQuery(const QSqlQuery &query);
    QVariant data(const QModelIndex &index, int role) const;
    QHash<int, QByteArray> roleNames() const {	return m_roleNames;	}

private:
    void generateRoleNames();
    QHash<int, QByteArray> m_roleNames;

};

#endif // BENDINGSQLMODEL

