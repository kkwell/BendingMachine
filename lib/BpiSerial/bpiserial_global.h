#ifndef BPISERIAL_GLOBAL_H
#define BPISERIAL_GLOBAL_H

#include <QtCore/qglobal.h>

#if defined(BPISERIAL_LIBRARY)
#  define BPISERIALSHARED_EXPORT Q_DECL_EXPORT
#else
#  define BPISERIALSHARED_EXPORT Q_DECL_IMPORT
#endif

#endif // BPISERIAL_GLOBAL_H
