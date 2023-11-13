#include "AutoPLC.h"

void setup()
{
   USART_init();
   DOUT = 0;
}

void loop()
{
   DOUT = ~DOUT;
   wait_for(50);
}

void time_tarks()
{
   USART_TX(DIN);
}

