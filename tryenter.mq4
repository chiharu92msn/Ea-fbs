//+------------------------------------------------------------------+
//|                                                    try_enter.mq4 |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2006, maloma"
#include <stdlib.mqh>
#include <stderror.mqh>

//------- Глобальные переменные --------------------------------------

//------- Внешние параметры -------------------------------
extern double Lots=0.1;
extern int    Porog=20;
extern int    FastEMA=12;
extern int    SlowEMA=26;
extern int    SignalSMA=9;
extern int    SL=0;
extern int    TP=20;
extern int    MagicNumber  = 8833747;

//------- Параметры -------------------------------
int        Slippage     = 3;
double     MacdBuffer[5000];
double     SignalBuffer[2];
double     HistoBuffer[2];
int        Sig, CBars;

int OpenOrder(string S, int OP)
{
 int cnt=10;
 int res=0;
 if (OP==OP_BUY)
  {
   double Price=MarketInfo(S,MODE_ASK);
   double CTP=Price+TP*Point;
   if (SL!=0) double CSL=Price-SL*Point;
  }
 if (OP==OP_SELL)
  {
   Price=MarketInfo(S,MODE_BID);
   CTP=Price-TP*Point;
   if (SL!=0) CSL=Price+SL*Point;
  }
 while (res==0 && cnt>0)
  {
   res=OrderSend(S,OP,Lots,Price,Slippage,CSL,CTP," try_enter © maloma ",MagicNumber,0,CLR_NONE);
   if (res>0) 
     {
      Comment("                                                                               ");
      Sleep(2000);
     } 
    else 
     {
      int le=GetLastError();
      Comment("                                                                               ");
      Comment("Ошибка открытия ордера #",le," - ",ErrorDescription(le));
      Sleep(6000);
      cnt--;
     }
  }
 if (res==-1) res=0;
 return(res);
}

void start() {
   int limit;
   int counted_bars=IndicatorCounted();
   if(counted_bars>0) counted_bars--;
   limit=Bars-counted_bars;
   for(int i=0; i<limit; i++)
      {MacdBuffer[i]=iMA(NULL,0,FastEMA,0,MODE_EMA,PRICE_CLOSE,i)-iMA(NULL,0,SlowEMA,0,MODE_EMA,PRICE_CLOSE,i);/*Print(MacdBuffer[i]);*/}
   SignalBuffer[0]=iMAOnArray(MacdBuffer,Bars,SignalSMA,0,MODE_SMA,0);
   SignalBuffer[1]=iMAOnArray(MacdBuffer,Bars,SignalSMA,0,MODE_SMA,1);
   HistoBuffer[0]=(MacdBuffer[0]-SignalBuffer[0])*10/Point;
   HistoBuffer[1]=(MacdBuffer[1]-SignalBuffer[1])*10/Point;
   if (HistoBuffer[1]<Porog && HistoBuffer[0]>=Porog && CBars!=Bars) {Sig=1; CBars=Bars;}
   if (HistoBuffer[1]>-Porog && HistoBuffer[0]<=-Porog && CBars!=Bars) {Sig=-1; CBars=Bars;}
   if (Sig==1)
    {
     OpenOrder(Symbol(), OP_BUY);
     Sig=0;
    }
   if (Sig==-1)
    {
     OpenOrder(Symbol(), OP_SELL);
     Sig=0;
    }

}
//+------------------------------------------------------------------+