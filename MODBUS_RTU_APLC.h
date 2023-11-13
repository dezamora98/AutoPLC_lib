#include "AutoPLC.h"

#ifndef MODBUS_RTU_APLC
#define MODBUS_RTU_APLC

/*-------temporización---*/
#ifndef t15
    #ifdef EN_DOUBLE_STOP_BIT
        #define t15 (11/BAUD)*15/10      // tiempo máximo entre tramas UART para tramas de 11 bits
    #endif

    #ifndef EN_PARITY_BIT EVEN
        #define t15 (11/BAUD)*15/10   // tiempo máximo entre tramas UART para tramas de 11 bits
    #endif

    #define t15 (10/BAUD)*15/10  // tiempo máximo entre tramas UART para tramas de 10 bits
#endif

#ifndef t35
    #ifdef EN_DOUBLE_STOP_BIT
        #define t35 (11/BAUD)*35/10      // tiempo máximo entre tramas MODBUS para tramas UART de 11 bits
    #endif
   
    #ifndef EN_PARITY_BIT EVEN
        #define t35 (11/BAUD)*35/10   // tiempo máximo entre tramas MODBUS para tramas UART de 11 bits
    #endif

    #define t35 (10/BAUD)*35/10  // tiempo máximo entre tramas MODBUS para tramas UART de 10 bits
#endif

#ifndef trs
    #define trs 5/10              // tiempo máximo de respuesta del esclavo (por defecto 500ms)
#endif

#define Rt15L (uint8_t)((0x10000 - ( t15 * _XTAL_FREQ/1024000000))&0x00FF)
#define Rt15H (uint8_t)((0x10000 - ( t15 * _XTAL_FREQ/1024000000))>>8)
#define Rt35L (uint8_t)((0x10000 - ( t35 * _XTAL_FREQ/1024000000))&0x00FF)
#define Rt35H (uint8_t)((0x10000 - ( t35 * _XTAL_FREQ/1024000000))>>8)
#define RtrsL (uint8_t)((0x10000 - ( trs * _XTAL_FREQ/1024000000))&0x00FF)
#define RtrsH (uint8_t)((0x10000 - ( trs * _XTAL_FREQ/1024000000))>>8)

#ifndef ADDR_ADU
#define ADDR_ADU 0x20
#endif

#ifndef ADU_size
#define ADU_size 20
#endif

extern uint8_t M_ADU[ADU_size] __at(ADDR_ADU);

#define MODBUS_init() USART_init();
uint16_t CRC_calc(uint8_t size);
void MODBUS_TX(uint8_t M_size);
uint8_t MODBUS_RX(void);
uint16_t MODBUS_RW(uint8_t slave,uint8_t FC,uint16_t ADDR,uint16_t N);

#define Read_DOUT(slave,ADDR,N) MODBUS_RW(slave,0x01,ADDR,N)
#define Read_DIN(slave,ADDR,N) MODBUS_RW(slave,0x02,ADDR,N)
#define Read_HREG(slave,ADDR,N) MODBUS_RW(slave,0x03,ADDR,N)
#define Read_IREG(slave,ADDR,N) MODBUS_RW(slave,0x04,ADDR,N)

#define SET_SDOUT(slave,ADDR) MODBUS_RW(slave,0x05,ADDR,0xFF00)
#define CLR_SDOUT(slave,ADDR) MODBUS_RW(slave,0x05,ADDR,0x0000)
#define Write_SREG(slave,ADDR,DATA) MODBUS_RW(slave,0x06,ADDR,DATA)

#endif