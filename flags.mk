#These flags control build parameters and can be changed. They are used for host
#targeted builds. For AVR related flags, see avr.mk
#These flags are also used for 

CXXFLAGS= -O2 -Wno-unused-result
CFLAGS= -Wall
LDFLAGS=
ARFLAGS= rc

CLEANFILES+=*.o *~ *.a
