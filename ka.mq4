// Copyright by maloma //
//#include <b-Orders.mqh>

extern double Lots       = 0.1;
extern int    TP         = 60;
extern int    Filtr      = 9;
extern int    SL         = 23;
       int    magic      =49467987;

       double HiPrice, LoPrice;
       int    CBars;
       int    SellDone=-1, BuyDone=-1;
/*
int deinit()
{
 //WriteOrdersInfo();
}
*/
void GetLevels()
{
 HiPrice=0;
 LoPrice=0;
 int i=0;
 //----Up and Down Fractals
//----5 bars Fractal
   if(High[i+3]>High[i+3+1] && High[i+3]>High[i+3+2] && High[i+3]>High[i+3-1] && High[i+3]>High[i+3-2] && HiPrice==0)
     {
      HiPrice=Open[i];
     }
   if(Low[i+3]<Low[i+3+1] && Low[i+3]<Low[i+3+2] && Low[i+3]<Low[i+3-1] && Low[i+3]<Low[i+3-2] && LoPrice==0)
     {
      LoPrice=Open[i];
     }
//----6 bars Fractal
   if(High[i+3]==High[i+3+1] && High[i+3]>High[i+3+2] && High[i+3]>High[i+3+3] && High[i+3]>High[i+3-1] && High[i+3]>High[i+3-2] && HiPrice==0)
     {
      HiPrice=Open[i];
     }
   if(Low[i+3]==Low[i+3+1] && Low[i+3]<Low[i+3+2] && Low[i+3]<Low[i+3+3] && Low[i+3]<Low[i+3-1] && Low[i+3]<Low[i+3-2] && LoPrice==0)
     {
      LoPrice=Open[i];
     }                      
//----7 bars Fractal
   if(High[i+3]>=High[i+3+1] && High[i+3]==High[i+3+2] && High[i+3]>High[i+3+3] && High[i+3]>High[i+3+4] && High[i+3]>High[i+3-1] && 
      High[i+3]>High[i+3-2] && HiPrice==0)
     {
      HiPrice=Open[i];
     }
   if(Low[i+3]<=Low[i+3+1] && Low[i+3]==Low[i+3+2] && Low[i+3]<Low[i+3+3] && Low[i+3]<Low[i+3+4] && Low[i+3]<Low[i+3-1] && 
      Low[i+3]<Low[i+3-2] && LoPrice==0)
     { 
      LoPrice=Open[i];
     }                  
 //----8 bars Fractal                          
   if(High[i+3]>=High[i+3+1] && High[i+3]==High[i+3+2] && High[i+3]==High[i+3+3] && High[i+3]>High[i+3+4] && High[i+3]>High[i+3+5] && 
      High[i+3]>High[i+3-1] && High[i+3]>High[i+3-2] && HiPrice==0)
     {
      HiPrice=Open[i];
     }
   if(Low[i+3]<=Low[i+3+1] && Low[i+3]==Low[i+3+2] && Low[i+3]==Low[i+3+3] && Low[i+3]<Low[i+3+4] && Low[i+3]<Low[i+3+5] && 
      Low[i+3]<Low[i+3-1] && Low[i+3]<Low[i+3-2] && LoPrice==0)
     {
      LoPrice=Open[i];
     }                              
//----9 bars Fractal                                        
   if(High[i+3]>=High[i+3+1] && High[i+3]==High[i+3+2] && High[i+3]>=High[i+3+3] && High[i+3]==High[i+3+4] && High[i+3]>High[i+3+5] && 
      High[i+3]>High[i+3+6] && High[i+3]>High[i+3-1] && High[i+3]>High[i+3-2] && HiPrice==0)
     {
      HiPrice=Open[i];
     }
   if(Low[i+3]<=Low[i+3+1] && Low[i+3]==Low[i+3+2] && Low[i+3]<=Low[i+3+3] && Low[i+3]==Low[i+3+4] && Low[i+3]<Low[i+3+5] && 
      Low[i+3]<Low[i+3+6] && Low[i+3]<Low[i+3-1] && Low[i+3]<Low[i+3-2] && LoPrice==0)
     {
      LoPrice=Open[i];
     }                        
}

void SetOrders()
{
 if (LoPrice!=0)
   {
    BuyDone=OrderSend(Symbol(),OP_BUYSTOP,Lots,LoPrice+(MarketInfo(Symbol(),MODE_SPREAD)+Filtr)*Point,3,LoPrice-(SL-MarketInfo(Symbol(),MODE_SPREAD)-Filtr)*Point,LoPrice+(TP+MarketInfo(Symbol(),MODE_SPREAD)+Filtr)*Point,"KA4",magic,0,Teal);
    SellDone=OrderSend(Symbol(),OP_SELLSTOP,Lots,LoPrice-Filtr*Point,3,LoPrice-(Filtr-SL)*Point,LoPrice-(Filtr+TP)*Point,"KA4",magic,0,Magenta);
   } else 
 if (HiPrice!=0)
   {
    BuyDone=OrderSend(Symbol(),OP_BUYSTOP,Lots,HiPrice+(MarketInfo(Symbol(),MODE_SPREAD)+Filtr)*Point,3,HiPrice-(SL-MarketInfo(Symbol(),MODE_SPREAD)-Filtr)*Point,HiPrice+(TP+MarketInfo(Symbol(),MODE_SPREAD)+Filtr)*Point,"KA4",magic,0,Teal);
    SellDone=OrderSend(Symbol(),OP_SELLSTOP,Lots,HiPrice-Filtr*Point,3,HiPrice-(Filtr-SL)*Point,HiPrice-(Filtr+TP)*Point,"KA4",magic,0,Magenta);
   }
}

void start()
{
 if (CBars==Bars) {return(0);} 
// if (Hour()==StartHour) 
  {
   GetLevels();
//   Print("HiPrice=",HiPrice, "  LoPrice=",LoPrice);
   SetOrders();
  }
 CBars=Bars;
}