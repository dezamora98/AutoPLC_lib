#include "AutoPLC_config.h"

#ifndef AutoPLC
#define AutoPLC

//-----------Tipos de datos--------------
#define bool    uint8_t
#define byte    uint8_t
#define word    uint16_t
#define word24  uint24_t
#define dword   uint32_t
//---------------------------------------

/*------------------------------------USB_HID---------------------------------
------------------------------------------------------------------------------*/
extern uint8_t HID_RT_sel __at(ADDR_HID_RT);
extern uint8_t HID_BUFFER_RX[64] __at(ADDR_HID_BUFFER_OUT);
extern uint8_t HID_BUFFER_TX[64] __at(ADDR_HID_BUFFER_IN);

inline void HID_tx(void); 
inline void HID_rx(void);
/*-----------------------------------EUSART-----------------------------------
------------------------------------------------------------------------------*/

inline void USART_ON(void);
inline void USART_OFF(void);
void USART_init(void);

#ifdef EN_PARITY_BIT    // si la macro es definida como 0 indica que la paridad es par, en caso contrario es impar
    void USART_TX(uint8_t dat);
    #define USART_RX() RCREG
#else
    #define USART_TX(val) TXREG=val
#endif

#define USART_RXIF PIR1bits.RCIF
#define USART_TXIF PIR1bits.TXIF

#define USART_RX() RCREG
#define USART_RX_9bit RCSTAbits.RX9D

/*---------------------------Temporizador de E/S------------------------------
------------------------------------------------------------------------------*/

/*  
    Para activar la temporización de las E/S se debe definir la macro T_IO_REF
    con el valor del tiempo de refrescamiento en milisegundos (tiempo mínimo = 1 ms,
    tiempo maximo = 1000 ms). De esta forma se definirá la interrupción por el TMR0
    como alta prioridad donde se realizan todas las tareas de refrescamiento de las E/S.
    se puede definir manualmente la el valor de recarga del TMR0 al crear la macro RTMR0 en
    AutoPLC_config.h. Si se decea reallizar tareas temporizadas, debe crear la macro T_tasks
    con el valor de la cantidad de ciclos T_IO_REF entre cada tarea temporizada y definir la
    función time_tasks en main.c. 
*/

#ifdef T_IO_REF

    #ifndef RTMR0
        #define RTMR0  0x10000 - ( T_IO_REF * _XTAL_FREQ/1024000)  
    #endif

    extern uint16_t delay_IO __at(ADDR_delay); // posescalador para esperas por ciclos de E/S

    inline void wait_for(uint16_t time);

    #ifdef T_tasks
        uint16_t delay_tasks __at(ADDR_tasks);  // posescalador para esperas por ciclos de E/S en tareas temporizadas
        void time_tasks(void); 
    #endif

    #ifdef INT_HP
        void int_hp(void);
    #endif

   void __interrupt(high_priority) INT_HP(void);

#endif

/*----------------------------Puertos de E/S_SPI------------------------------
------------------------------------------------------------------------------*/

/*-----------------E/S digitales--------------*/
extern uint8_t DOUT __at(ADDR_DOUT);       // registro de salidas digitales
typedef struct
{
   uint8_t DI1:1;
   uint8_t DI2:1;
   uint8_t DI3:1;
   uint8_t DI4:1;
   uint8_t DI5:1;
   uint8_t DI6:1;
   uint8_t DI7:1;
   uint8_t DI8:1;   
}DOUTbits_t;
extern volatile DOUTbits_t DOUTbits __at(ADDR_DOUT);

extern uint8_t DIN __at(ADDR_DIN);        // registro de entradas digitales
typedef struct
{
   uint8_t DO1:1;
   uint8_t DO2:1;
   uint8_t DO3:1;
   uint8_t DO4:1;
   uint8_t DO5:1;
   uint8_t DO6:1;
   uint8_t DO7:1;
   uint8_t DO8:1;   
}DINbits_t;
extern volatile DINbits_t DINbits __at(ADDR_DIN);

void REF_DIO(void);     // lectura y escritura en E/S
inline void Write_DOUT(uint8_t data);   // escritura en salidas digitales
inline uint8_t Read_DIN(void);  // lectura de entradas digitales 

/*-------selector de entradas analógicas------*/
extern uint8_t SAIN __at(ADDR_SAIN);
typedef struct
{
   uint8_t SAI1:1;
   uint8_t SAI2:1;
   uint8_t SAI3:1;
   uint8_t SAI4:1;
   uint8_t SAI5:1;
   uint8_t SAI6:1;
   uint8_t SAI7:1;
   uint8_t SAI8:1;   
}SAINbits_t;
extern volatile SAINbits_t SAINbits __at(ADDR_SAIN);

void REF_SAIN(void); //función de elector de tipo de entradas analógicas;

/*----------------------------------------------------------------------------
-----------------------------Entradas analógicas------------------------------
------------------------------------------------------------------------------*/

/*----Entradas analógicas----*/
extern uint8_t AIN[16] __at(ADDR_AIN);
typedef struct
{
   uint8_t AL1:8;
   uint8_t AH1:8;
   uint8_t AL2:8;
   uint8_t AH2:8;
   uint8_t AL3:8;
   uint8_t AH3:8;
   uint8_t AL4:8;
   uint8_t AH4:8;
   uint8_t AL5:8;
   uint8_t AH5:8;
   uint8_t AL6:8;
   uint8_t AH6:8;
   uint8_t AL7:8;
   uint8_t AH7:8;
   uint8_t AL8:8;
   uint8_t AH8:8;    
}AINreg_t;

typedef struct
{
   uint16_t A1:16;
   uint16_t A2:16;
   uint16_t A3:16;
   uint16_t A4:16;
   uint16_t A5:16;
   uint16_t A6:16;
   uint16_t A7:16;
   uint16_t A8:16;    
}AIN10reg_t;
extern volatile AINreg_t AINreg __at(ADDR_AIN);
extern volatile AIN10reg_t AIN10reg __at(ADDR_AIN);

/*-----activador de entrada analógicas----*/
extern uint16_t EAIN __at(ADDR_EAIN);
typedef struct
{
   uint8_t EAI1:1;
   uint8_t EAI2:1;
   uint8_t EAI3:1;
   uint8_t      :1;
   uint8_t EAI4:1;
   uint8_t EAI5:1;
   uint8_t EAI6:1;
   uint8_t EAI7:1;
   uint8_t      :1;
   uint8_t EAI8:1;   
}EAINbits_t;
extern volatile EAINbits_t EAINbits __at(ADDR_EAIN);

void ADIN(void);        // función de lectura de entradas analógicas

/*----------------------------Salidas analógicas------------------------------
------------------------------------------------------------------------------*/

extern uint16_t AOUT[4] __at(ADDR_AOUT);
typedef struct
{
    uint8_t AO1:16;
    uint8_t AO2:16;
    uint8_t AO3:16;
    uint8_t AO4:16;  
}AOUTreg_t;
extern volatile AOUTreg_t AOUTreg __at(ADDR_AOUT);

void DAOUT(void);       // función de escritura de salidas analógicas

/*----------------------------MMODBUS-RTU MASTER------------------------------
------------------------------------------------------------------------------*/

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


#define Rt15L (uint8_t)((0x10000 - ( t15 * _XTAL_FREQ/1024000))&0x00FF)
#define Rt15H (uint8_t)((0x10000 - ( t15 * _XTAL_FREQ/1024000))>>8)
#define Rt35L (uint8_t)((0x10000 - ( t35 * _XTAL_FREQ/1024000))&0x00FF)
#define Rt35H (uint8_t)((0x10000 - ( t35 * _XTAL_FREQ/1024000))>>8)
#define RtrsL (uint8_t)((0x10000 - ( trs * _XTAL_FREQ/1024000))&0x00FF)
#define RtrsH (uint8_t)((0x10000 - ( trs * _XTAL_FREQ/1024000))>>8)


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


/*-------------------------------Configuración--------------------------------
------------------------------------------------------------------------------*/
inline void GPIO_CONFIG(void);  // función de configuración de GPIOs
inline void REG_CONFIG(void);   // función de configuración de registros

/*----------------------------------Main PLC----------------------------------
------------------------------------------------------------------------------*/
void setup(void);
void loop(void);

void main(void);

#endif