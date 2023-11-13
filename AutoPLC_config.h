#include <xc.h>
#include <stdint.h>

#include "fuses.h"
/*-----------configuración de temporizado----------*/
//#define T_IO_REF 10   // 10ms
//#define T_tasks 5   // tarea temporizada cada 5 ciclos -> 50ms

/*-----------Oscilador---------*/
#ifndef _XTAL_FREQ
    #define _XTAL_FREQ  48000000
#endif

/*--------------GPIOs-------------*/
#define GPIO1 LATAbits.LATA4
#define GPIO2 LATBbits.LATB4
#define GPIO3 LATBbits.LATB5
#define GPIO4 LATBbits.LATB5
#define GPIO5 LATBbits.LATB7

/*----------Señales SPI-----------*/
#define LD     LATDbits.LATD1
#define SS_IO1 LATDbits.LATD0
#define SS_IO2 LATDbits.LATD3
#define SS_DA1 LATCbits.LATC0
#define SS_DA2 LATCbits.LATC1
#define SS_ET  LATDbits.LATD2

/*--------------EUSART------------*/
#define EVEN 1
#define ODD 0

//#define EN_DOUBLE_STOP_BIT
//#define EN_PARITY_BIT EVEN

#ifndef BAUD
    #define BAUD 9600
#endif

#define R_BAUD (((_XTAL_FREQ/BAUD)/16)-1)
#define ERROR ((_XTAL_FREQ/(16*(R_BAUD+1)) - BAUD)/BAUD)

#if (ERROR > 5)
    #warning BAUDRATE_ERROR > 5%
#endif

#define R_BAUD_L (uint8_t)(R_BAUD & 0x00FF)
#define R_BAUD_H (uint8_t)(R_BAUD >> 8)

#define RXbit TRISCbits.RC7
#define TXbit TRISCbits.RC6
#define EN_RX LATDbits.LATD4

/*--------direcciones de registros del módulo PLC-------*/
#define PLC_R 0x200
#define ADDR_AIN    (PLC_R-16)
#define ADDR_AOUT   (ADDR_AIN-8)
#define ADDR_EAIN   (ADDR_AOUT-2)
#define ADDR_delay  (ADDR_EAIN-2)
#define ADDR_tasks  (ADDR_delay-2)
#define ADDR_SAIN   (ADDR_tasks-1)
#define ADDR_DOUT   (ADDR_SAIN-1)
#define ADDR_DIN    (ADDR_DOUT-1)

/*--USB--*/
#define ADDR_HID_RT (ADDR_DOUT-1)
#define ADDR_HID_BUFFER_OUT 0x500
#define ADDR_HID_BUFFER_IN 0x540
#define tx 0
#define rx 1

/*----macros auxiliares---*/
#define HIGH 1  // macro para nivel alto
#define LOW 0   // macro para nivel bajo
#define I 1     // macro para entrada de corriente
#define V 0     // macro para entrada de tensión