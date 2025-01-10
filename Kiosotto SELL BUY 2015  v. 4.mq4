//+------------------------------------------------------------------+
//|                                                kiosotto SELL.mq4 |
//|                                   Copyright 2014, Masakazu Corp. |
//|                                          http://www.masakazu.com |
//+------------------------------------------------------------------+
#property indicator_separate_window
#property indicator_buffers 2
#property indicator_color1 clrRed
#property indicator_color2 clrGreen

extern int       dev_period = 150;
extern int       bars = 10000;

double ExtMapBuffer1[];
double ExtMapBuffer2[];


int init()
  {
   SetIndexStyle(0,DRAW_LINE);
   SetIndexBuffer(0,ExtMapBuffer1);

   SetIndexStyle(1,DRAW_LINE);
   SetIndexBuffer(1,ExtMapBuffer2);
   return(0);
  }

int start()
  {
  { 
   int counted_bars=IndicatorCounted();
   int i,j,limit;
   double hpres, lpres, TSBUL, TSBER, sbl, sbr;
   limit=Bars-counted_bars;
   j=0;
   if (limit> bars)  limit=bars;
   for(i = limit; i >= 0; i--) {
      j = 0;
      TSBUL = 0;
      TSBER = 0;
      hpres =0;
      lpres = 9999999;
      while (j<dev_period)   
      {
          sbl = 0;
          sbr = 0;
         {
            int shift=i+j; 
            datetime date = iTime(Symbol(), 0, shift); 
            int bsht = iBarShift(Symbol(), Period(), date, false);
            int kolichestvo = bsht-MathRound(Period()/Period());
            if (kolichestvo < 0 ) {kolichestvo=0;}
            for (int n=bsht;n>=kolichestvo;n--) 
            {
               double ii = iRSI(Symbol(),0,dev_period,PRICE_CLOSE,n);
               double hnw = iHigh(Symbol(), Period(), n);
               double lnw = iLow(Symbol(), Period(), n);
               double cle = iClose(Symbol(), Period(), n);
                             
                             
               if (hnw> hpres)
               {
                  hpres = hnw;
                  sbl = sbl + ii*cle;
               }
               if (lpres> lnw)
               {
                  lpres = lnw;
                  sbr = sbr + ii*cle;
               }               
              }            
             }
                 TSBUL = TSBUL + sbl ;
                 TSBER = TSBER + sbr ;
         
               j++;
           }

          ExtMapBuffer1[i] = TSBER/TSBUL;
          ExtMapBuffer2[i] = TSBUL/TSBER;
          
       }
 }
    return(0);
}