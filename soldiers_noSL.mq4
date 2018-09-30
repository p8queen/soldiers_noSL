//+------------------------------------------------------------------+
//|                                                     soldiers.mq4 |
//|                                  Copyright 2018, Gustavo Carmona |
//|                                          https://www.awtt.com.ar |
//+------------------------------------------------------------------+


#property copyright "Copyright 2018, Gustavo Carmona"
#property link      "https://www.awtt.com.ar"
#property version   "1.00"
#property strict
//#include "soldiers.mqh"

string currency = "USDJPY";
double deltaTips = 400*Point;
double level;
int magicNumber = 1500;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
         
   level = Bid;

  return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick(){

   
   if((Bid-level)>=deltaTips){
      OrderSend(currency,OP_BUY,0.01,Ask,10,0,0,NULL,magicNumber);
      level = Bid;
      Print("Equity: ",AccountEquity());
      }
      
   if((level-Bid)>=deltaTips){
      OrderSend(currency,OP_SELL,0.01,Bid,10,0,0,NULL,magicNumber);
      level = Bid;
      Print("Equity: ",AccountEquity());
      }
         
}  
