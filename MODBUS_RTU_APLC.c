#include "MODBUS_RTU_APLC.h"


void MODBUS_TX(uint8_t M_size)
{
    uint8_t i;  // variable de recorrido de la ADU

    T0CON = 0b00000111;
    INTCONbits.TMR0IF = 0;
    TMR0L = RtrsL;
    TMR0H = RtrsH;               //  Recargar timer0 con espera de tiempo de respuesta de esclavo
    T0CONbits.TMR0ON = 1;
    while(INTCONbits.TMR0IF==0);
    INTCONbits.TMR0IF = 0; 
    T0CONbits.TMR0ON  = 0;

    for(i=0;i<M_size;++i)  
    {
        USART_TX(M_ADU[i]);         // transmitiendo byte "i" de la trama
	    while(USART_TXIF == 0);     // espera de fin de transmisión 
	    USART_TXIF = 0;
    }
}

uint8_t MODBUS_RX(void)
{
    uint8_t i=0;    //  contador de bytes

    #ifdef T_IO_REF
        uint16_t TMR0_S = TMR0;
    #else
        T0CON = 0b00000111;
    #endif
    
    INTCONbits.TMR0IF = 0;
    TMR0L = RtrsL;
    TMR0H = RtrsH;               //  Recargar timer0 con espera de tiempo de respuesta de esclavo
    T0CONbits.TMR0ON = 1;

    while(INTCONbits.TMR0IF == 0 && i < ADU_size)   
    {
        /* 
            Se mantiene en el ciclo de recepción mientras que la trama entrante sea
            de menor tamaño que el tamaño de buffer definido en el microcontrolador
            y no se supere el tiempo entre tramas USART(t35) o el tiempo de espera
            de trama MODBUS del esclavo.
        */
        if(USART_RXIF == 1) // trama USART entrante?
        {
            M_ADU[i++]=USART_RX();   // guardar byte e incrementar contador 
            USART_RXIF = 0;  
            INTCONbits.TMR0IF = 0; 
            TMR0L = Rt35L;
            TMR0H = Rt35H;           
        }
    }

    #ifdef T_IO_REF
        TMR0 = TMR0_S;    
    #endif
    T0CONbits.TMR0ON = 0;
    return i;
}

uint16_t MODBUS_RW(uint8_t slave,uint8_t FC,uint16_t ADDR,uint16_t N)
{
    uint16_t CRC;           // CRC de trama master 
    uint16_t CRC_s;         // CRC de trama de esclavo
    uint16_t C_byte = 0;    // contador de bytes de ADU

    M_ADU[0] = slave;           // cargando dirección de esclavo 
    M_ADU[1] = FC;              // cargando código de función 
    M_ADU[2] = ADDR>>8;         // cargando parte baja de dirección de acceso
    M_ADU[3] = ADDR & 0x00FF;   // cargando parte alta de dirección de acceso
    M_ADU[4] = N>>8;            // cargando parte baja de contador de accesos
    M_ADU[5] = N & 0x00FF;      // cargando parte alta de contador de accesos
    
    CRC = CRC_calc(6);          // calculando CRC de trama master

    M_ADU[6] = CRC & 0x00FF;    // cargando parte alta de CRC de trama master
    M_ADU[7] = CRC >> 8;        // cargando parte baja de CRC de trama master

    MODBUS_TX(8);               // enviando trama master
    C_byte = MODBUS_RX();       // recibiendo respuesta de esclavo

    if(C_byte == 0)             // cuando C_byte es 0 indica que no hubo respuesta del esclavo
    {
        return 0x0400;          // tiempo máximo de respuesta superado
    }
    CRC_s = CRC_calc(C_byte-2); // calculando CRC de trama de esclavo

    if(CRC_s != ( (M_ADU[C_byte-1] <<8) | (M_ADU[C_byte-2]) ) )  // comparando CRC calculado con el CRC de la trama de esclavo
    {
        return 0x0100;          // error de trama corrupta por CRC
    }
    if( M_ADU[0] != slave || M_ADU[1] == FC )                // validando campos de dirección y FC en trama de esclavo 
    {
        return 0x0200;   // error en respuesta del esclavo
    }
    if(FC == 0x05 || FC == 0x06)    // si el FC es de escritura las tramas deben ser iguales
    {
        if(CRC != CRC_s)        // comprobando que los CRC son iguales 
        {
            return 0x0300;  // error en respuesta del esclavo 
        }
    }

    return C_byte; // retornando tamaño de la trama de respuesta del esclavo
}

uint16_t CRC_calc(uint8_t size)
{
    uint16_t CRC = 0xFFFF;
    uint8_t i,j;

    for(i = 0; i < size ;++i)
    {
       CRC = (CRC & 0xFF00) | ( (CRC  ^ M_ADU[i]) & 0x00FF); // primer XOR
        for(j = 0; j<8; ++j)
        {
            if(CRC & 0x0001)
            {
                CRC = (CRC>>1)^ 0xA001; // segundo XOR con polinomio MODBUS-RTU
            }
	    else CRC>>=1;
        }
    }
    return CRC;

}