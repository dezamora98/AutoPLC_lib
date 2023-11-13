#include "AutoPLC.h"

/*----------------------------------USB_HID-----------------------------------
------------------------------------------------------------------------------*/
#ifdef EN_HID_AutoUSB

    inline void HID_tx(void)
    {   
        HID_RT_sel = tx;
        asm("CALL 0x69FF");
    }

    inline void HID_rx(void)
    {
        HID_RT_sel = rx;
        asm("CALL 0x69FF");             
    }

#endif

/*-----------------------------------EUSART-----------------------------------
------------------------------------------------------------------------------*/
#ifdef EN_PARITY_BIT   
    void USART_TX(uint8_t dat)
    {
        uint8_t i;
        uint8_t C = 0;
        for(i=0;i<8;++i)
        {
            if((dat & 0x01<<i)!=0) ++C; // contando bits en 1
        }
        if((C & 0x01)==0) TXSTAbits.TX9D = EN_PARITY_BIT;   // activando el bit de paridad según la macro EN_PARITY_BIT
        else TXSTAbits.TX9D = !EN_PARITY_BIT;
        TXREG = dat;
    }
#endif

inline void USART_ON(void)
{
    RXbit = 1;          // bit RX como entrada
    EN_RX = 0;          // activando RX en Hardware externo
    RCSTAbits.SPEN = 1; // activando buffer TX/RX USART
}
inline void USART_OFF(void)
{
    RCSTAbits.SPEN = 0; // desactivando buffer TX/RX USART
    RXbit = 0;          // desactivando RX en Hardware externo
    EN_RX = 1;          // bit RX como salida (SDO)
}

void USART_init(void)
{
    /*-----Configurando baud rate-----*/
    BAUDCONbits.BRG16 = 1;      //  Modo 16bits en registro generador de baud rate
    TXSTAbits.SYNC = 0;         //  USART Asíncrono  
    TXSTAbits.BRGH = 0;         //  baja velocidad en USART
    SPBRG  =  R_BAUD_L;          //  cargando registro generador de baud rate
    SPBRGH =  R_BAUD_H;          //  cargando registro generador de baud rate
    
    /*----configurando de bit de paridad o doble bit de parada----*/
    #ifdef EN_DOUBLE_STOP_BIT
        TXSTAbits.TX9   =  1;         //  Transmisión de 9bits
        TXSTAbits.TX9D  =  0;         //  bit 9 en 0 -> doble stop
        RCSTAbits.RX9   =  1;         //  Recepción de 9bits
    #endif

    #ifdef EN_PARITY_BIT
        TXSTAbits.TX9   =  1;         //  Transmisión de 9bits
        RCSTAbits.RX9   =  1;         //  Recepción de 9bits
    #endif

    /*----configurando transmisión/recepción EUSART----*/
    TXbit = 0;                  //  Bit TX como salida 
    TXSTAbits.TXEN = 1;         //  Activa la transmisión
    RCSTAbits.CREN = 1;         //  Activa la recepción
    USART_ON();                 //  Activando USART en AutoPLC
}

/*-------------------------Temporizador de E/S--------------------------------
------------------------------------------------------------------------------*/
#ifdef T_IO_REF

inline void wait_for(uint16_t time)
{
    delay_IO = time;
    while(delay_IO>0);
}

void __interrupt(high_priority) INT_HP(void)
{
    if(INTCONbits.TMR0IF)
    {   
        USART_OFF();                // desactivar recepción USART en hardware para usar el SPI
        REF_DIO();                  // refrescar E/S digitales
	    REF_SAIN();                 // refrescar configuración de entradas analógicas 
        DAOUT();                    // actualizar salidas analógicas
        USART_ON;                   // activar recepción UART en hardware

        ADIN();                     // leer entradas analógicas

        if(delay_IO>0)              // si se está procesando una espera, decrementar el posescalador delay_IO
        {
            --delay_IO;
        }

        #ifdef T_tasks              // si están activadas las tareas temporizadas decrementar el posescalador delay_tasks 
            if(--delay_tasks==0)    //ejecutar tareas temporizadas cuando el posescalador delay_tasks sea 0
            {
                delay_tasks = T_tasks;
                time_tasks();
            }
        #endif

        INTCONbits.TMR0IF = 0;   // deasctivando bandera del temporizador 0                    
	    TMR0 = RTMR0;            // recargando temporizador 0
    }

    #ifdef INT_HP
    int_hp();
    #endif
}

#endif

/*-----------------------------------E/S--------------------------------------
------------------------------------------------------------------------------*/

/*-----------------E/S digitales--------------*/
void REF_DIO(void)
{
    #ifndef T_IO_REF
        USART_OFF();                // desactivar recepción USART en hardware para usar el SPI
        SSPSTAT = 0b11000000;       // captar al final
        SSPCON1 = 0b00100000;       // SPI master activo ; SCK = os/4
    #endif

    LD = 1; //
    LD = 0; // carga paralelo
    LD = 1; //

    SS_IO1 = 0; // activar esclavo IO

    SSPBUF = DOUT;  // envío y resepción de datos
    while (!SSPIF); // espera de SPI
    SSPIF = 0; // desactivar bandera

    
    SS_IO1 = 1; // desactivar esclavo IO

    DIN = SSPBUF;

    #ifndef T_IO_REF
        SSPSTAT = 0x00;       // captar al final
        SSPCON1 = 0x00;       // SPI master activo ; SCK = os/4
        USART_ON();           // activar recepción USART en hardware
    #endif
}

inline void Write_DOUT(uint8_t data)
{
    DOUT = data;
    REF_DIO();
}
inline uint8_t Read_DIN(void)
{
    REF_DIO();
    return DIN;
}

/*-------selector de entradas analógicas------*/
void REF_SAIN(void)
{
    #ifndef T_IO_REF
        USART_OFF();                // desactivar recepción USART en hardware para usar el SPI
        SSPSTAT = 0b11000000;       // captar al final
        SSPCON1 = 0b00100000;       // SPI master activo ; SCK = os/4
    #endif

    SS_IO2 = 0;          // activar esclavo O2

    SSPBUF = SAIN;       // envío de datos
    while (!SSPIF);      // espera de SPI
    SSPIF = 0;           // desactivar bandera

    SS_IO2 = 1; // desactivar esclavo O2
    
    #ifndef T_IO_REF
        SSPSTAT = 0x00;       // captar al final
        SSPCON1 = 0x00;       // SPI master activo ; SCK = os/4
        USART_ON();           // activar recepción USART en hardware
    #endif
}

/*-----lectura de entradas analógicas---------*/
void ADIN(void)
{
    ADCON0 = 0;     //  RST a AD
    uint8_t i = 0;  //  contador de datos
    uint8_t j = 0;  //  contador de entradas

    while (i < 16)
    {
        if (EAIN & 1 << j)   //  la entrada j está activa?
        {
            ADCON0bits.CHS = j;             //  seleccionando entrdada
            ADCON0bits.ADON = 1;            //  activando AD
            ADCON0bits.GO_DONE = 1;         //  inciando conversión
            while (ADCON0bits.GO_DONE);     //  espera AD

            AIN[i++] = ADRESL;              //  carga de datos
            AIN[i++] = ADRESH;              //  carga de datos
            __delay_us(100);                //  espera por especificación  
        }
        else
        {
            i += 2; // incrementando contador para los proximos 2 bytes
        }
        ++j;    // incrementando contador de entrada
    }
}

/*-----Escritura de salidas analógicas--------*/
void DAOUT(void)
{
    uint8_t i;
    uint16_t A_pack;
    
    #ifndef T_IO_REF
        USART_OFF();                // desactivar recepción USART en hardware para usar el SPI
        SSPSTAT = 0b11000000;       // captar al final
        SSPCON1 = 0b00100000;       // SPI master activo ; SCK = os/4
    #endif

    SS_DA1 = 1;                         // asegurando que el esclavo 1 esté desactivado. 
    SS_DA2 = 1;                         // asegurando que el esclavo 2 esté desactivado.
    LD = 1;                             // asegurando que el bit de carga esté desactivado.

    for (i = 0; i < 4; ++i)
    {
        A_pack = 0;
        A_pack |= (i & 0x01) << 15;     // activando DA 0 o 1 del esclavo i
        A_pack |= AOUT[i];              // cargando datos

        if (i & 0x10) SS_DA2 = 0;       // activando el esclavo i
        else SS_DA1 = 0;

        SSPBUF = (A_pack) >> 8;         // enviando primera parte del paquete 
        while (!SSPIF);                 // espera SPI
        SSPIF = 0;                      
        SSPBUF = (A_pack & 0x00FF);     // enviando segunda parte del paquete
        while (!SSPIF);                 // espera SPI
        SSPIF = 0;

        if (i & 0x10) SS_DA2 = 1;       // desactivando esclavo i
        else SS_DA1 = 1;
    }

    LD=0;          //
    asm("nop");    //   Pulso de carga para todas las salidas analógicas
    asm("nop");    //
    LD=1;          //

    #ifndef T_IO_REF
        SSPSTAT = 0x00;       // captar al final
        SSPCON1 = 0x00;       // SPI master activo ; SCK = os/4
        USART_ON();           // activar recepción USART en hardware
    #endif
}
/*----------------------------MMODBUS-RTU MASTER------------------------------
------------------------------------------------------------------------------*/
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

/*-------------------------------Configuración--------------------------------
------------------------------------------------------------------------------*/
inline void GPIO_CONFIG(void)
{
    LATA = 0xFF;
    LATB = 0b00011101;
    LATC = 0xF3;
    LATD = 0x0F;
    LATE = 0xFF;
    
    TRISA = 0b11111111; // todo el puerto A como entrada
    TRISB = 0b00011100; // SDI,SCK,P_GPIOs  como salidas y el resto de GPIOS como entradas
    TRISC = 0b00111000; // puerto como salida menos los bits del USB(D+,D-)
    TRISD = 0b00000000; // todo el puerto como salida
    TRISE = 0b11111111; // puerto E como entrada (Entradas analógicas y RST)
}
inline void REG_CONFIG(void)
{
    ADCON1 = 0b00010101;               // las 10 primeras entradas analógicas y referencia en +Vref GND
    ADCON2 = 0b10000000;               // frecuencia del oscilador/2 y lectura de isquierda a derecha

    EAIN = 0b00000001011110111;        // activando todas las entradas analógicas del PLC
    SAIN = 0x00;                       // entradas analógicas como entradas de tensión
    DOUT = 0x00;                       // salidas en 0;
    DIN  = 0x00;                       // entradas en 0;

    #ifdef T_IO_REF
        #ifdef T_tasks
            delay_tasks = T_tasks;
        #endif
        delay_IO = 0;
        INTCONbits.TMR0IF = 0;                       
	    TMR0 = RTMR0;
        T0CON = 0b10000111;
        INTCONbits.TMR0IE = 1;    
        INTCONbits.GIE = 1;
    #endif
}

/*----------------------------------Main PLC----------------------------------
------------------------------------------------------------------------------*/

void main(void)
{
    GPIO_CONFIG();  // configurando GPIOs
    REG_CONFIG();   // Configurando registros internos 

    setup();

    while(1)
    {
        loop();
    }
}
