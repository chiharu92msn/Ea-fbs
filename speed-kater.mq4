//+------------------------------------------------------------------+
//|                          FX_SPEED_KATER_V1.0 - based on KATER EA |
//|                        M1 eurusd, usdchf, gbpusd, eurjpy, usdjpy |
//|                                       mod by Monty666 2012-11-22 |
//|                                         www.worldwide-invest.org |
//+------------------------------------------------------------------+
//
// added one order per bar only
// optimized settings

#property show_inputs
#include <stdlib.mqh>
extern double Lots = 0.01;
extern double Ddep = 0.2;
extern double Dmargin =1;
extern int TF =5;
extern string Configuration = "================ Configuration";
extern bool Mode_HighSpeed = TRUE;
extern bool Long = TRUE;
extern bool Short = TRUE;
extern int Magic = 9999;
extern string OrderCmt = "speedkater";
extern double TakeProfit = 20.0;
extern double StopLoss = 60.0;
extern double distance = 20.0;
extern double Canal = 150;
double lot = 0.01;
bool MM = TRUE;
double gd_172 = 0.0;
string gs_unused_180 = "---------------- Scalping Factors";
double gd = 40;
double gd_228 = 0.3333333333;
double gd_236 = 0.0;
extern int PmaH =22;
extern int PmaL =22;
extern string SL_TP_Trailing = "---------------- SL / TP / Trailing";
extern double Trailing_Resolution = 0.0;
double gd_260 = 0.0;
double gd_268 = 20.0;
extern bool Trailing_Stop = TRUE;
bool gi_280 = TRUE;
int gi_312 = 0;
double gd_316 = 0.0;
int slippage = 3;
double gda328;//[0];
double gda_332;//[0];
int gia_336;//[0];
double gd_340 = 1.0;



bool gi_368 = FALSE;
double gd_372 = 1.0;
double gd_380 = 0.0;
int gi_388 = 0;
int g_time_392 = 0;
int g_count_396 = 0;
double gda_400;
int gi_404 = 0;
bool gi_408 = TRUE;
double gd_412 = 5.0;
double gd_420 = 10.0;
double gd_428 = 40.0;
bool gi_436 = FALSE;
double gd_440 = 5.0;
double gd_448 = 10.0;
double gd_456 = 40.0;
bool gi_464 = FALSE;
string gs_472 = "Valid user";
int gia_492 = 0;
int K;


///
datetime PreviousBarTime1;
bool NewBar()
{
   if(PreviousBarTime1<Time[0])
   {
      PreviousBarTime1=Time[0];
      return(true);
   }
   return(false);
}
//

int init() {
   gi_312 = Digits;
   gd_316 = 0.00001;
   if (Digits < 5) slippage = 0;
   else gi_388 = -1;
   gia_492=1;
   start();
   return (0);
}

int start()
 {
   if (Digits == 4)K=1;
   if (Digits == 5)K=10; 
   if (gi_312 == 0) {
      init();
      return;
   }
   if (gia_492 == TRUE) {
         f0_2(gda328, gda_332, gia_336, gd_340);
         f0_0(TF);//Period()
   }
   return (0);
}

void f0_0(int timeframe) {
   int ticket;
   double ld_28;
   double ld_30;
   double ld_92;
   bool li_116;
   double ld_120;
   double ld_136;
   //double ld_220;
   int date;
   int li_240;
   double ld_244;
   double order_stoploss_260;
   double order_takeprofit_268;
   double ld_276;
   int li_292;
   int li_296;
   string ls_300;
   bool li_308;
   if (g_time_392 < Time[0]) {
      g_time_392 = Time[0];
      g_count_396 = 0;
   } else g_count_396++;
   double H = iHigh(Symbol(), timeframe, 0);
   double L = iLow(Symbol(), timeframe, 0);
   double ML =  iMA(NULL, timeframe, PmaL, 0, MODE_LWMA, PRICE_LOW, 0);//
   double MH =  iMA(NULL, timeframe, PmaH, 0, MODE_LWMA, PRICE_HIGH, 0);
   double ld_80 =  MH-ML ;
   double ld_81 =  MH-ML ;
   //bool li88 = Bid >= MH + ld_80 / 2.0;
   bool li88 =false ;
   bool li89 =false ;
   if (Bid >= MH - ld_80/2 )li88=true;//B
   if (Bid >= MH - ld_81/2 )li89=true;//S
   double ld_100 = MarketInfo(Symbol(), MODE_STOPLEVEL) * Point;
   double spred = Ask - Bid;//ld_108
   if (MarketInfo(Symbol(), MODE_STOPLEVEL)==0)ld_100 = spred;
   double ld_128 = 0.5;
   if (ld_128 < ld_100 - 5.0 * gd_316) {
      li_116 = gi_436;
      ld_120 = gd_428 * gd_316;
      ld_128 = gd_420 * gd_316;
      ld_136 = gd_412 * gd_316;
   } else {
      if (!Mode_HighSpeed) {
         li_116 = gi_464;
         ld_120 = gd_456 * gd_316;
         ld_128 = gd_448 * gd_316;
         ld_136 = gd_440 * gd_316;
      } else {
         li_116 = gi_280;
         ld_120 = gd_268 * gd_316;
         ld_128 = gd_260 * gd_316;
         ld_136 = Trailing_Resolution * gd_316;
      }
   }
   ld_120 = MathMax(ld_120, ld_100);
   if (li_116) ld_128 = MathMax(ld_128, ld_100);
   double ld_unused_144 = gda_400;//[0];
   gda_400 = spred ;
   if (gi_404 < 30) gi_404++;
   double ld_152 = 0;
   double ld_160 = ld_152 / gi_404;
   if (!gi_368 && ld_160 < 15.0 * gd_316) gd_380 = 15.0 * gd_316 - ld_160;
   double ld_168 = f0_5(Ask + gd_380);
   double ld_176 = f0_5(Bid - gd_380);
   double ld_184 = ld_160 + gd_380;
   double ld_208 = H - L;
   double limitTe=0;
   limitTe=Canal*Point;
   if(ld_208>limitTe) { 
   if (Bid < MH)   int li_216=-1; //B
   else if (Ask > ML) li_216=1;//S
 }   
     
    //........................................................................................
        int m;
        double MG;
        if (MM) {
        if(AccountFreeMargin()>Dmargin*AccountMargin()&&Lots>0)
        {
        MG=AccountFreeMargin();
        double Min = MarketInfo(Symbol(), MODE_LOTSTEP);
              
        if(Ddep>0)
        {
        m=MG/MarketInfo (Symbol(), MODE_MARGINREQUIRED)*Ddep/Min;
        lot = m*Min;
        if(lot > MarketInfo (Symbol(), MODE_MAXLOT))
        lot = MarketInfo (Symbol(), MODE_MAXLOT);             
        if(lot< Lots)
        lot = Lots; 
        if(lot< MarketInfo(Symbol(), MODE_MINLOT)) 
        lot =  MarketInfo(Symbol(), MODE_MINLOT);    
        }
        }
        }
        if(Ddep==0)lot= Lots;

 //......................................................................................, 

   int count_252 = 0;
   int count_256 = 0;
   for (int pos_4 = 0; pos_4 < OrdersTotal(); pos_4++) {
      OrderSelect(pos_4, SELECT_BY_POS, MODE_TRADES);
      if (OrderMagicNumber() == Magic && OrderCloseTime() == 0) {
         if (OrderSymbol() != Symbol()) {
            count_256++;
            continue;
         }
         switch (OrderType()) 
         {
         case OP_BUY:
            while (Trailing_Stop) {
               order_stoploss_260 = OrderStopLoss();
               order_takeprofit_268 = OrderTakeProfit();
               if (!(order_takeprofit_268 < f0_5(ld_168 + ld_120) && ld_168 + ld_120 - order_takeprofit_268 > ld_136)) break;
               order_stoploss_260 = f0_5(Bid - ld_120);
               order_takeprofit_268 = f0_5(ld_168 + ld_120);
               OrderModify(OrderTicket(), 0, order_stoploss_260, order_takeprofit_268, date, CLR_NONE);
               break;
               }
            count_252++;
            break;
         case OP_SELL:
            while (Trailing_Stop) {
               order_stoploss_260 = OrderStopLoss();
               order_takeprofit_268 = OrderTakeProfit();
               if (!(order_takeprofit_268 > f0_5(ld_176 - ld_120) && order_takeprofit_268 - ld_176 + ld_120 > ld_136)) break;
               order_stoploss_260 = f0_5(Ask + ld_120);
               order_takeprofit_268 = f0_5(ld_176 - ld_120);
               OrderModify(OrderTicket(), 0, order_stoploss_260, order_takeprofit_268, date, CLR_NONE);
               break;
               }
            count_252++;
            break;
         case OP_BUYSTOP:
            if (!li88) {
               ld_276 = OrderTakeProfit() - OrderOpenPrice() - gd_380;
               while (true) {
                  if (!(f0_5(Ask + ld_128) < OrderOpenPrice() && OrderOpenPrice() - Ask - ld_128 > ld_136)) break;
                  OrderModify(OrderTicket(), f0_5(Ask + ld_128), f0_5(Bid + ld_128 - ld_276), f0_5(ld_168 + ld_128 + ld_276), 0, Green);
                  break;
                  }
               count_252++;
            } else OrderDelete(OrderTicket());
            break;
         case OP_SELLSTOP:
            if (li89) {
               ld_276 = OrderOpenPrice() - OrderTakeProfit() - gd_380;
               while (true) {
                  if (!(f0_5(Bid - ld_128) > OrderOpenPrice() && Bid - ld_128 - OrderOpenPrice() > ld_136)) break;
                  OrderModify(OrderTicket(), f0_5(Bid - ld_128), f0_5(Ask - ld_128 + ld_276), f0_5(ld_176 - ld_128 - ld_276), 0, Red);
                  break;
                  }
               count_252++;
            } else OrderDelete(OrderTicket());
         }
      }
   }
   bool li_288 = FALSE;
   if (gi_388 >= 0 || gi_388 == -2) {
      li_292 = NormalizeDouble(Bid / gd_316, 0);
      li_296 = NormalizeDouble(Ask / gd_316, 0);
      if (li_292 % 10 != 0 || li_296 % 10 != 0) gi_388 = -1;
      else {
         if (gi_388 >= 0 && gi_388 < 10) gi_388++;/////
         else gi_388 = -2;
      }
   }
   
   if (count_252 == 0 && li_216 != 0 && f0_5(ld_184) <= f0_5(gd * gd_316) && gi_388 == -1) {
      if (li_216 < 0) {
         if (li_116) {
         ld_28 = Ask + distance * Point;
            if (Long==TRUE && NewBar())OrderSend(Symbol(), OP_BUYSTOP, lot, ld_28, slippage, ld_28 - StopLoss * Point, ld_28 + TakeProfit * Point, OrderCmt, Magic, date, Lime);
            PlaySound("stops.wav");
            } 
 
      } else {
         if (li_216 > 0) {
            if (li_116) {
            ld_30 =Bid - distance * Point;
               if (Short==TRUE && NewBar())OrderSend(Symbol(), OP_SELLSTOP, lot, ld_30, slippage, ld_30 + StopLoss * Point, ld_30 - TakeProfit * Point, OrderCmt, Magic, date, Orange);
               PlaySound("stops.wav");
               }

         }
      }
   }

}



void f0_2(double a0, double a4, int a8, double a12) {
   double ld5=0;
   double gd_348;
   int gi_356;
   if (a8 == 0 || MathAbs(Bid - a0) >= a12 * gd_316) {
      a0 = Bid;
      a4 = Ask;
   }
   gd_348 = 0;
   gi_356 = 0;
   double ld2 = 0;
   int li3 = 0;
   double ld3 = 0;
   int li4 = 0;
   for (int li2 = 1; li2 < 30; li2++) {
      if (a8 == 0) break;
      if (ld5 < ld2) {
         ld2 = ld5;
      }
      if (ld5 > ld3) {
         ld3 = ld5;
      }
      if (ld2 < 0.0 && ld3 > 0.0 && ld2 < 3.0 * ((-a12) * gd_316) || ld3 > 3.0 * (a12 * gd_316)) {
         if ((-ld2) / ld3 < 0.5) {
            gd_348 = ld3;
            gi_356 = li4;
            break;
         }
         if ((-ld3) / ld2 < 0.5) {
            gd_348 = ld2;
            gi_356 = li3;
         }
      } else {
         if (ld3 > 5.0 * (a12 * gd_316)) {
            gd_348 = ld3;
            gi_356 = li4;
         } else {
            if (ld2 < 5.0 * ((-a12) * gd_316)) {
               gd_348 = ld2;
               gi_356 = li3;
               break;
            }
         }
      }
   }

}

double f0_5(double ad_0) {
   return (NormalizeDouble(ad_0, gi_312));
}

