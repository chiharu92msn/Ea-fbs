//+------------------------------------------------------------------+
//|                                      Indraws Volume Analysis.mq4 |
//+------------------------------------------------------------------+

#property copyright "Copyright © 2007, Ryan Klefas"
#property link      "http://www.metaquotes.com"

#property indicator_separate_window
#property indicator_buffers 7
#property indicator_color1 DodgerBlue
#property indicator_color2 Red
#property indicator_color3 Aqua
#property indicator_color4 NULL
#property indicator_color5 NULL
#property indicator_color6 NULL
#property indicator_color7 NULL

double directionUpBuffer[];
double directionDownBuffer[];
double SlowCrossUp[];
double SlowCrossDown[];
double sumBuffer[];
double Med_Buffer[];
double Slow_Buffer[];

extern int SwingPoint_Periods=50;
extern bool Backtesting=false;
extern bool ShowArrows=false;


int accumVol=0;
int candleCount=0;
double referenceLevel=0;
double refDiff=0;

int reset=-1;


//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int init()
  {
//---- indicators
   SetIndexStyle(0, DRAW_ARROW, EMPTY, 2);
   SetIndexArrow(0, 233);
   SetIndexBuffer(0, directionUpBuffer);
   SetIndexStyle(1, DRAW_ARROW, EMPTY, 2);
   SetIndexArrow(1, 234);
   SetIndexBuffer(1, directionDownBuffer);
   
   SetIndexStyle(2,DRAW_HISTOGRAM);
   SetIndexBuffer(2,sumBuffer);
   SetIndexStyle(3,DRAW_LINE);
   SetIndexBuffer(3,Med_Buffer);
   SetIndexStyle(4,DRAW_LINE);    
   SetIndexBuffer(4,Slow_Buffer);
   
   
   SetIndexStyle(5, DRAW_ARROW, EMPTY, 2);
   SetIndexArrow(5, 233);
   SetIndexBuffer(5, SlowCrossUp);
   SetIndexStyle(6, DRAW_ARROW, EMPTY, 2);
   SetIndexArrow(6, 234);
   SetIndexBuffer(6, SlowCrossDown);

//----
   return(0);
  }
//+------------------------------------------------------------------+
//| Custom indicator deinitialization function                       |
//+------------------------------------------------------------------+
int deinit()
  {
//---- 
   Comment(" ");
//----
   return(0);
  }
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int start() 
{

//+------------------------------------------------------------------+

   int i, counter, limiter;

   int counted_bars=IndicatorCounted();
   if(counted_bars<0) return(-1);
   if(counted_bars>0) counted_bars--;

   int limit=Bars-counted_bars;

   
   // Backtesting selection is to save the computer some processing time
   // Useful for more intensive indicators 
   // Enabled by default
   
   
   if (Backtesting)  
   {
      limiter = limit; 
      Comment("Backtesting Mode Enabled");
   }
   else              
   {
      limiter = 1000;
   }
      
      
      
   
   for(i = limiter; i > 0; i--) 
   {
      if (highPoint(i)) 
      {
         if (ShowArrows)
            directionDownBuffer[i] = 0;
            
         accumVol=0;
         candleCount=reset;
         referenceLevel=High[i];
      }
      
         
      if (lowPoint(i)) 
      {
         if (ShowArrows)
            directionUpBuffer[i] = 0;
            
         accumVol=0;
         candleCount=reset;
         referenceLevel=Low[i];
      }

         
         refDiff=referenceLevel-Close[i];
         accumVol+=Volume[i];
         candleCount++;
         sumBuffer[i]=accumVol;
         Slow_Buffer[i]=refDiff;
         Med_Buffer[i]=referenceLevel;
         

   }
   
//+------------------------------------------------------------------+
  
   return(0);
}

//+------------------------------------------------------------------+
//| indicator functions                                              |
//+------------------------------------------------------------------+

double swingPoint(int shift)
{
   double val = iCustom(NULL, 0, "Swing_Point", SwingPoint_Periods, 0, shift);
   
   if (val < 99999999)     return (val);
   else                    return (-10);
}

//+------------------------------------------------------------------+

bool highPoint(int shift)
{  return (High[shift]==swingPoint(shift));  }

//+------------------------------------------------------------------+

bool lowPoint(int shift)
{  return (Low[shift]==swingPoint(shift));  }

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+


