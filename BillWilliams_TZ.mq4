//+------------------------------------------------------------------+
//| BillWilliams_TZ.mq4 
//| Copyright © Pointzero-trading.com
//+------------------------------------------------------------------+
#property copyright "Copyright © Pointzero-trading.com"
#property link      "http://www.pointzero-trading.com"

#property indicator_chart_window
#property indicator_buffers 2
#property indicator_color1 DodgerBlue
#property indicator_color2 Red
#property indicator_width1 2
#property indicator_width2 2

//---- MACD
#define MACD_a         5
#define MACD_b         34
#define MACD_c         5

//---- Buffers
double ExtMapBuffer1[];
double ExtMapBuffer2[];

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int init()
{
   // Buffers and style
    SetIndexStyle(0, DRAW_ARROW);
    SetIndexArrow(0, 233);
    SetIndexBuffer(0, ExtMapBuffer1);
    SetIndexStyle(1, DRAW_ARROW);
    SetIndexArrow(1, 234);
    SetIndexBuffer(1, ExtMapBuffer2);

    // Data window
    IndicatorShortName("Bill Williams TZ"); 
    Comment("Copyright © http://www.pointzero-trading.com");
    return(0);
}
//+------------------------------------------------------------------+
//| Custor indicator deinitialization function                       |
//+------------------------------------------------------------------+
int deinit()
{
    return(0);
}
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int start()
{
      // More vars here too...
     int start = 1;
     int limit;
     int counted_bars = IndicatorCounted();

     // check for possible errors
     if(counted_bars < 0) 
        return(-1);
        
     // Only check these
     limit = Bars - 1 - counted_bars;
     
     // Check the signal foreach bar
     for(int i = limit; i >= start; i--)
     {           
        // Indicate the trend
        int ma_trend = EMPTY_VALUE;
        int a_trend = EMPTY_VALUE;
        
        // Bill williams zonetrade indicators to point detect early strenght
        int tz = tradezone(i);
        int tz1 = tradezone(i+1);
        
        // Open and close of the current candle to filter tz signals
        double CLOSE = iClose(Symbol(),0, i);
        double OPEN = iOpen(Symbol(),0, i);
        
        // Macd present and past
        double MACD_main         = iMACD(NULL,0, MACD_a, MACD_b, MACD_c, PRICE_CLOSE, MODE_MAIN, i);
        double MACD_signal       = iMACD(NULL,0, MACD_a, MACD_b, MACD_c, PRICE_CLOSE, MODE_SIGNAL, i);
        double MACD_main_last    = iMACD(NULL,0, MACD_a, MACD_b, MACD_c, PRICE_CLOSE, MODE_MAIN, i+1);
        double MACD_signal_last  = iMACD(NULL,0, MACD_a, MACD_b, MACD_c, PRICE_CLOSE, MODE_SIGNAL, i+1);
        
        // Alligator
        double a_jaw = iAlligator(Symbol(), 0, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORJAW, i);
        double a_teeth = iAlligator(Symbol(), 0, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, i);
        double a_lips = iAlligator(Symbol(), 0, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORLIPS, i);
        
        // Calculate alligator trend
        if(a_lips > a_teeth && a_teeth > a_jaw)
        {
            a_trend = OP_BUY;
        } else if(a_lips < a_teeth && a_teeth < a_jaw) {
            a_trend = OP_SELL;
        }
        
        // Evaluate if going long or short is dangerous now
        bool long_dangerous = false;
        bool short_dangerous = false;
        if(CLOSE > a_lips && MACD_main < MACD_signal) long_dangerous = true;
        if(CLOSE < a_lips && MACD_main > MACD_signal) short_dangerous = true;
         
        // Long signal 
        if((tz == OP_BUY && tz1 != OP_BUY && a_trend == OP_BUY && CLOSE > OPEN && long_dangerous == false))
             ExtMapBuffer1[i] = Low[i];
        
        // Short signal
        if(tz == OP_SELL && tz1 != OP_SELL && a_trend == OP_SELL && CLOSE < OPEN && short_dangerous == false)
            ExtMapBuffer2[i] = High[i];
    }
    return(0);
}

/**
* Returns bill williams trade zone
* @param    int   shift
* @return   int
*/
int tradezone(int shift = 1)
{
   double AC = iAC(Symbol(), 0, shift);
   double AC_last = iAC(Symbol(), 0, shift+1);
   double AO = iAO(Symbol(), 0, shift);
   double AO_last = iAO(Symbol(), 0, shift+1);
   if(AO < AO_last && AC < AC_last) return(OP_SELL);
   if(AO > AO_last && AC > AC_last) return(OP_BUY);
   return(EMPTY_VALUE);
}

