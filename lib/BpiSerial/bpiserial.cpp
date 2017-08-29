#include "bpiserial.h"
#include <QDebug>


BpiSerial::BpiSerial(int baud):mOpen(false){
    kserialOpen(baud);
    qDebug()<<"BpiSerial called"<<baud;

}
//BpiSerial *getBpiSerial(){
//    return new BpiSerial();
//}

bool BpiSerial::kserialOpen(int baud){
//    if ((fd = serialOpen ("/dev/ttyAMA0", baud)) < 0){
//        fprintf (stderr, "Unable to open serial device: %s\n", strerror (errno)) ;
//    }
//    else{
//        qDebug()<<"serialOpen Success";
//        if (wiringPiSetup () == -1){
//            fprintf (stdout, "Unable to start wiringPi: %s\n", strerror (errno)) ;
//        }
//        else{
//            mOpen = true;
//            qDebug()<<"wiringPiSetup Success";
//        }
//    }
    qDebug()<<"call lib success";
    return mOpen;
}

bool BpiSerial::kisOpen(){
    qDebug()<<"kisOpen is called";
    return mOpen;
}
