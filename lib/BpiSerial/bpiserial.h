#ifndef BPISERIAL_H
#define BPISERIAL_H

#include "bpiserial_global.h"
#include <stdio.h>
#include <string.h>
#include <errno.h>
//#include <wiringPi.h>
//#include <wiringSerial.h>

class BPISERIALSHARED_EXPORT BpiSerial
{

public:
    explicit BpiSerial(int baud=115200);
    bool kserialOpen(int baud);
    bool kisOpen();
    BpiSerial *getBpiSerial();
private:
    bool mOpen;
    int fd;
};

#endif // BPISERIAL_H
