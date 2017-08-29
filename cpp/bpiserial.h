#ifndef BPISERIAL_H
#define BPISERIAL_H

#include <QObject>

class BpiSerial : public QObject
{
    Q_OBJECT
    //Q_PROPERTY(QString receivedata READ receivedata WRITE setreceivedata NOTIFY receivedataChanged)
public:
    explicit BpiSerial(QObject *parent = 0,int baud=115200);
    bool kserialOpen(int baud);
    Q_INVOKABLE bool kisOpen();
    void get_hight_pri();
signals:

public slots:


private:
    pthread_t thr_read;
    bool mOpen;
    int fd;
};

#endif // BPISERIAL_H
