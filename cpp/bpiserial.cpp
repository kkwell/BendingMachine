//#define _GNU_SOURCE
#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <sched.h>
#include "bpiserial.h"
#include <QtDebug>

#include "../wiringPi/wiringPi/wiringPi.h"
#include "../wiringPi/wiringPi/wiringSerial.h"

BpiSerial::BpiSerial(QObject *parent,int baud) : QObject(parent),mOpen(false)
{
    kserialOpen(baud);
}

void BpiSerial::get_hight_pri(){
    cpu_set_t mask;
    CPU_ZERO(&mask);
    CPU_SET(2,&mask);
    if(sched_setaffinity(0,sizeof(mask),&mask)==-1)
        printf("affinity set fail!");
    piHiPri(99);
}

void *readfunc(void *arg){
    //Q_UNUSED(arg)
    int fd = *(int*)arg;
    int i=0;
    while (1) {
        i++;
        //	delayMicroseconds(1000);
        delay(1);
        while (serialDataAvail (fd))
        {
            printf ("0x%02x -%d", serialGetchar (fd),i) ;
            fflush (stdout) ;
            i=0;
        }
//        if(i>300){
//            serialPutchar(fd,i-301);
//            printf("put:%3d:\n",i-301);
//        }
    }
    return 0;
}

//BpiSerial *getBpiSerial(){
//    return new BpiSerial();
//}

bool BpiSerial::kserialOpen(int baud){
    get_hight_pri();
    if ((fd = serialOpen ("/dev/ttyAMA0", baud)) < 0)
    {
        fprintf (stderr, "Unable to open serial device: %s\n", strerror (errno)) ;
        return 1 ;
    }

    if (wiringPiSetup () == -1)
    {
        fprintf (stdout, "Unable to start wiringPi: %s\n", strerror (errno)) ;
        return 1 ;
    }

    if(pthread_create(&thr_read,NULL,readfunc,&fd)!=0){
        printf("create thread failed!\n");
        return 1;
    }

    mOpen = true;
    qDebug()<<"Open serial ttyAMA0 success";
    printf("test!!!!!!!!!\n");
    return mOpen;
}

bool BpiSerial::kisOpen(){
    return mOpen;
}
