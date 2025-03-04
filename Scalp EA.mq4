/*
   Generated by EX4-TO-MQ4 decompiler FREEWARE V4.0.451.1 [-]
   Website: http://www.metaquotes.net
   E-mail : support@metaquotes.net
*/
extern string EURUSD = "---------- EURUSD (Any Pair)";
extern int MagicNumber = 88888882;
extern int Hour_Start_Trade = 0;
extern int Hour_Stop_Trade = 1;
int gi_96 = 50;
extern string Lots_Parameters = "---------- Lots - Parameters ----------";
extern double Lots = 0.01;
extern bool LotsOptimized = TRUE;
extern int Risk = 5;
extern int Maximum_Lots = 100;
extern string Order_Parameters = "---------- Order - Parameters ----------";
extern double StopLoss = 800.0;
extern double TakeProfit = 70.0;
extern bool Virtual_TP = FALSE;
extern int slippage = 4;
extern int slippage_close = 4;
extern double MaxSpread = 5.0;
extern bool Time_Opened_Protection = TRUE;
int gi_176 = 60;
int gi_180 = 3;
int gi_184 = 140;
int gi_188 = 2;
int gi_192 = 170;
int gi_196 = 0;
int gi_200 = 200;
int gi_204 = 1;
int gi_208 = 240;
int gi_212 = 4;
extern string Volatility_Parameters = "---------- Volatility - Parameters ----------";
extern bool Volatility_Filter = FALSE;
extern double sec = 0.001;
extern double se2c = 0.001;
extern double se3c = 0.0012;
int g_period_252 = 8;
double g_period_256 = 6.0;
double g_timeframe_264 = 15.0;
double gd_272 = 30.0;
double gd_280 = 70.0;
double gd_288 = 40.0;
double gd_296 = 60.0;
bool gi_304 = TRUE;
bool gi_308 = TRUE;
double g_minlot_312 = 0.0;
double g_maxlot_320 = 0.0;
int gi_328 = 0;
int g_leverage_332 = 0;
double g_lots_336;
int g_ticket_344;
int g_count_348;

// E37F0136AA3FFAF149B351F6A4C948E9
int init() {
   return (0);
}

// 52D46093050F38C27267BCE42543EF60
int deinit() {
   return (0);
}

// EA2B2676C28C0DB26D39331A336C6B92
int start() {
   int order_total_0;
   double price_60;
   Comment("  ---   Server Time = ", TimeToStr(TimeCurrent(), TIME_MINUTES));
   double price_4 = TakeProfit;
   if (Virtual_TP == TRUE) {
      for (int pos_12 = 0; pos_12 < OrdersTotal(); pos_12++) {
         OrderSelect(pos_12, SELECT_BY_POS, MODE_TRADES);
         if (OrderType() == OP_BUY && OrderMagicNumber() == MagicNumber) {
            if (Bid >= OrderOpenPrice() + TakeProfit * Point) {
               RefreshRates();
               OrderClose(OrderTicket(), OrderLots(), Bid, slippage_close, Orange);
               Print("Virtual TP - Close Price :" + DoubleToStr(OrderClosePrice(), 4) + " Lots : " + DoubleToStr(OrderLots(), 2) + " Order Number : " + DoubleToStr(OrderTicket(),
                  0) + " Profit : $ " + DoubleToStr(OrderProfit(), 2));
            }
         }
         if (OrderType() == OP_SELL && OrderMagicNumber() == MagicNumber) {
            if (Ask <= OrderOpenPrice() - TakeProfit * Point) {
               RefreshRates();
               OrderClose(OrderTicket(), OrderLots(), Ask, slippage_close, Orange);
               Print("Prot. Level 1 - Close Price :" + DoubleToStr(OrderClosePrice(), 4) + " Lots : " + DoubleToStr(OrderLots(), 2) + " Order Number : " + DoubleToStr(OrderTicket(),
                  0) + " Profit : $ " + DoubleToStr(OrderProfit(), 2));
            }
         }
      }
   }
   if (Time_Opened_Protection == TRUE) {
      for (int pos_16 = 0; pos_16 < OrdersTotal(); pos_16++) {
         OrderSelect(pos_16, SELECT_BY_POS, MODE_TRADES);
         if (OrderType() == OP_BUY && OrderMagicNumber() == MagicNumber) {
            if (TimeCurrent() - OrderOpenTime() > 60 * gi_176 && TimeCurrent() - OrderOpenTime() < 60 * gi_184 && Bid >= OrderOpenPrice() + gi_180 * Point) {
               RefreshRates();
               OrderClose(OrderTicket(), OrderLots(), Bid, slippage_close, Orange);
               Print("Prot. Level 1 - Close Price :" + DoubleToStr(OrderClosePrice(), 4) + " Lots : " + DoubleToStr(OrderLots(), 2) + " Order Number : " + DoubleToStr(OrderTicket(),
                  0) + " Profit : $ " + DoubleToStr(OrderProfit(), 2));
            }
            if (TimeCurrent() - OrderOpenTime() > 60 * gi_184 && TimeCurrent() - OrderOpenTime() < 60 * gi_192 && Bid >= OrderOpenPrice() + gi_188 * Point) {
               RefreshRates();
               OrderClose(OrderTicket(), OrderLots(), Bid, slippage_close, Orange);
               Print("Prot. Level 2 - Close Price :" + DoubleToStr(OrderClosePrice(), 4) + " Lots : " + DoubleToStr(OrderLots(), 2) + " Order Number : " + DoubleToStr(OrderTicket(),
                  0) + " Profit : $ " + DoubleToStr(OrderProfit(), 2));
            }
            if (TimeCurrent() - OrderOpenTime() > 60 * gi_192 && TimeCurrent() - OrderOpenTime() < 60 * gi_200 && Bid >= OrderOpenPrice() - gi_196 * Point) {
               RefreshRates();
               OrderClose(OrderTicket(), OrderLots(), Bid, slippage_close, Orange);
               Print("Prot. Level 3 - Close Price :" + DoubleToStr(OrderClosePrice(), 4) + " Lots : " + DoubleToStr(OrderLots(), 2) + " Order Number : " + DoubleToStr(OrderTicket(),
                  0) + " Profit : $ " + DoubleToStr(OrderProfit(), 2));
            }
            if (TimeCurrent() - OrderOpenTime() > 60 * gi_200 && TimeCurrent() - OrderOpenTime() < 60 * gi_208 && Bid >= OrderOpenPrice() - gi_204 * Point) {
               RefreshRates();
               OrderClose(OrderTicket(), OrderLots(), Bid, slippage_close, Orange);
               Print("Prot. Level 4 - Close Price :" + DoubleToStr(OrderClosePrice(), 4) + " Lots : " + DoubleToStr(OrderLots(), 2) + " Order Number : " + DoubleToStr(OrderTicket(),
                  0) + " Profit : $ " + DoubleToStr(OrderProfit(), 2));
            }
            if (TimeCurrent() - OrderOpenTime() > 60 * gi_208 && Bid >= OrderOpenPrice() - gi_212 * Point) {
               RefreshRates();
               OrderClose(OrderTicket(), OrderLots(), Bid, slippage_close, Orange);
               Print("Prot. Level 5 - Close Price :" + DoubleToStr(OrderClosePrice(), 4) + " Lots : " + DoubleToStr(OrderLots(), 2) + " Order Number : " + DoubleToStr(OrderTicket(),
                  0) + " Profit : $ " + DoubleToStr(OrderProfit(), 2));
            }
         }
         if (OrderType() == OP_SELL && OrderMagicNumber() == MagicNumber) {
            if (TimeCurrent() - OrderOpenTime() > 60 * gi_176 && TimeCurrent() - OrderOpenTime() < 60 * gi_184 && Ask <= OrderOpenPrice() - gi_180 * Point) {
               RefreshRates();
               OrderClose(OrderTicket(), OrderLots(), Ask, slippage_close, Orange);
               Print("Prot. Level 1 - Close Price :" + DoubleToStr(OrderClosePrice(), 4) + " Lots : " + DoubleToStr(OrderLots(), 2) + " Order Number : " + DoubleToStr(OrderTicket(),
                  0) + " Profit : $ " + DoubleToStr(OrderProfit(), 2));
            }
            if (TimeCurrent() - OrderOpenTime() > 60 * gi_184 && TimeCurrent() - OrderOpenTime() < 60 * gi_192 && Ask <= OrderOpenPrice() - gi_188 * Point) {
               RefreshRates();
               OrderClose(OrderTicket(), OrderLots(), Ask, slippage_close, Orange);
               Print("Prot. Level 2 - Close Price :" + DoubleToStr(OrderClosePrice(), 4) + " Lots : " + DoubleToStr(OrderLots(), 2) + " Order Number : " + DoubleToStr(OrderTicket(),
                  0) + " Profit : $ " + DoubleToStr(OrderProfit(), 2));
            }
            if (TimeCurrent() - OrderOpenTime() > 60 * gi_192 && TimeCurrent() - OrderOpenTime() < 60 * gi_200 && Ask <= OrderOpenPrice() + gi_196 * Point) {
               RefreshRates();
               OrderClose(OrderTicket(), OrderLots(), Ask, slippage_close, Orange);
               Print("Prot. Level 3 - Close Price :" + DoubleToStr(OrderClosePrice(), 4) + " Lots : " + DoubleToStr(OrderLots(), 2) + " Order Number : " + DoubleToStr(OrderTicket(),
                  0) + " Profit : $ " + DoubleToStr(OrderProfit(), 2));
            }
            if (TimeCurrent() - OrderOpenTime() > 60 * gi_200 && TimeCurrent() - OrderOpenTime() < 60 * gi_208 && Ask <= OrderOpenPrice() + gi_204 * Point) {
               RefreshRates();
               OrderClose(OrderTicket(), OrderLots(), Ask, slippage_close, Orange);
               Print("Prot. Level 4 - Close Price :" + DoubleToStr(OrderClosePrice(), 4) + " Lots : " + DoubleToStr(OrderLots(), 2) + " Order Number : " + DoubleToStr(OrderTicket(),
                  0) + " Profit : $ " + DoubleToStr(OrderProfit(), 2));
            }
            if (TimeCurrent() - OrderOpenTime() > 60 * gi_208 && Ask <= OrderOpenPrice() + gi_212 * Point) {
               RefreshRates();
               OrderClose(OrderTicket(), OrderLots(), Ask, slippage_close, Orange);
               Print("Prot. Level 5 - Close Price :" + DoubleToStr(OrderClosePrice(), 4) + " Lots : " + DoubleToStr(OrderLots(), 2) + " Order Number : " + DoubleToStr(OrderTicket(),
                  0) + " Profit : $ " + DoubleToStr(OrderProfit(), 2));
            }
         }
      }
   }
   if (Volatility_Filter == TRUE) {
      if (iOpen(Symbol(), PERIOD_M5, 0) >= Ask + sec) return;
      if (iOpen(Symbol(), PERIOD_M5, 0) <= Bid - sec) return;
      if (iOpen(Symbol(), PERIOD_M5, 1) >= Ask + se2c) return;
      if (iOpen(Symbol(), PERIOD_M5, 1) <= Bid - se2c) return;
      if (iOpen(Symbol(), PERIOD_M5, 2) >= Ask + se3c) return;
      if (iOpen(Symbol(), PERIOD_M5, 2) <= Bid - se3c) return;
   }
   if (Ask - Bid > MaxSpread / 10000.0) return (0);
   g_minlot_312 = MarketInfo(Symbol(), MODE_MINLOT);
   g_maxlot_320 = MarketInfo(Symbol(), MODE_MAXLOT);
   g_leverage_332 = AccountLeverage();
   gi_328 = MarketInfo(Symbol(), MODE_LOTSIZE);
   g_lots_336 = MathMin(g_maxlot_320, MathMax(g_minlot_312, Lots));
   if (LotsOptimized && Risk > 0.0) g_lots_336 = MathMax(g_minlot_312, MathMin(g_maxlot_320, NormalizeDouble(Risk / 100.0 * AccountFreeMargin() / g_minlot_312 / (gi_328 / 100), 0) * g_minlot_312));
   g_lots_336 = MathMax(g_minlot_312, MathMin(g_maxlot_320, NormalizeDouble(g_lots_336 / g_minlot_312, 0) * g_minlot_312));
   g_lots_336 = NormalizeDouble(g_lots_336, 2);
   if (AccountFreeMargin() < Ask * g_lots_336 * gi_328 / g_leverage_332) {
      Print("Low Account Balance. Lots = ", g_lots_336, " , Free Margin = ", AccountFreeMargin());
      Comment("Low Account Balance. Lots = ", g_lots_336, " , Free Margin = ", AccountFreeMargin());
      return;
   }
   if (g_lots_336 > Maximum_Lots) g_lots_336 = Maximum_Lots;
   double irsi_20 = iRSI(NULL, g_timeframe_264, g_period_256, PRICE_CLOSE, 0);
   double irsi_28 = iRSI(NULL, PERIOD_M1, 20, PRICE_CLOSE, 0);
   double ima_36 = iMA(NULL, 0, g_period_252, 0, MODE_SMA, PRICE_MEDIAN, 1);
   double ima_44 = iMA(NULL, 0, g_period_252, 0, MODE_SMA, PRICE_MEDIAN, 1);
   int count_52 = 0;
   for (int pos_56 = OrdersTotal() - 1; pos_56 >= 0; pos_56--) {
      OrderSelect(pos_56, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber) count_52++;
   }
   if (count_52 == 0 && f0_1()) {
      order_total_0 = OrdersTotal();
      price_60 = Ask - StopLoss * Point;
      if (DayOfWeek() == 0 || DayOfWeek() == 5) return (0);
      if (DayOfWeek() == 1 && Hour() < Hour_Start_Trade) return (0);
      if (!f0_0() && irsi_20 < gd_272 || irsi_28 < 36.0 && ima_36 >= Ask + 0.0002) {
         if (gi_304) {
            if (!Virtual_TP && TakeProfit > 0.0) price_4 = Ask + TakeProfit * Point;
            else price_4 = 0;
            if (StopLoss > 0.0) price_60 = Ask - StopLoss * Point;
            else price_60 = 0;
            g_ticket_344 = -1;
            g_count_348 = 0;
            while (g_ticket_344 < 0) {
               if (g_count_348 > 0) Sleep(180000);
               g_count_348++;
               while (!IsTradeAllowed() || IsTradeContextBusy()) Sleep(5000);
               RefreshRates();
               g_ticket_344 = OrderSend(Symbol(), OP_BUY, g_lots_336, Ask, slippage, 0, 0, "Forex Robot", MagicNumber, 0, Green);
               if (g_count_348 == 10) {
                  Print("10 attempts to Open Buy trade have failed");
                  break;
               }
            }
            if (g_ticket_344 > 0) {
               if (OrderSelect(g_ticket_344, SELECT_BY_TICKET, MODE_TRADES)) Print("BUY order opened : ", OrderOpenPrice());
            } else Print("Error opening BUY order : ", GetLastError());
            order_total_0 = OrdersTotal();
            for (pos_12 = 0; pos_12 < order_total_0; pos_12++) {
               OrderSelect(pos_12, SELECT_BY_POS, MODE_TRADES);
               if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber) {
                  if (IsTradeContextBusy() || (!IsTradeAllowed())) {
                     Print("Trade context is busy! The expert cannot modify Buy position!");
                     return (-1);
                  }
                  OrderModify(OrderTicket(), OrderOpenPrice(), price_60, price_4, 0, GreenYellow);
               }
            }
            gi_304 = FALSE;
            gi_308 = TRUE;
         }
      } else {
         if (!f0_0() && irsi_20 > gd_280 || irsi_28 > 64.0 && ima_44 <= Bid - 0.0002) {
            if (gi_308) {
               if (!Virtual_TP && TakeProfit > 0.0) price_4 = Bid - TakeProfit * Point;
               else price_4 = 0;
               if (StopLoss > 0.0) price_60 = Bid + StopLoss * Point;
               else price_60 = 0;
               g_ticket_344 = -1;
               g_count_348 = 0;
               while (g_ticket_344 < 0) {
                  if (g_count_348 > 0) Sleep(180000);
                  g_count_348++;
                  while (!IsTradeAllowed() || IsTradeContextBusy()) Sleep(5000);
                  RefreshRates();
                  g_ticket_344 = OrderSend(Symbol(), OP_SELL, g_lots_336, Bid, slippage, 0, 0, "Forex Robot", MagicNumber, 0, Red);
                  if (g_count_348 == 10) {
                     Print("10 attempts to open Sell trade have failed");
                     break;
                  }
               }
               if (g_ticket_344 > 0) {
                  if (OrderSelect(g_ticket_344, SELECT_BY_TICKET, MODE_TRADES)) Print("SELL order opened : ", OrderOpenPrice());
               } else Print("Error opening SELL order : ", GetLastError());
               pos_56 = OrdersTotal();
               for (pos_12 = 0; pos_12 < pos_56; pos_12++) {
                  OrderSelect(pos_12, SELECT_BY_POS, MODE_TRADES);
                  if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber) {
                     if (IsTradeContextBusy() || (!IsTradeAllowed())) {
                        Print("Trade context is busy! The expert cannot modify Sell position!");
                        return (-1);
                     }
                     OrderModify(OrderTicket(), OrderOpenPrice(), price_60, price_4, 0, GreenYellow);
                  }
               }
               gi_308 = FALSE;
               gi_304 = TRUE;
            }
         }
         if (irsi_20 < gd_296 && irsi_20 > gd_288) {
            gi_308 = TRUE;
            gi_304 = TRUE;
         }
      }
   }
   return (0);
}

// A88FE8FAEB651132C0CA6446B53FDF9B
int f0_1() {
   if (Hour_Start_Trade < Hour_Stop_Trade && TimeHour(TimeCurrent()) < Hour_Start_Trade || TimeHour(TimeCurrent()) >= Hour_Stop_Trade) return (0);
   if (Hour_Start_Trade > Hour_Stop_Trade && (TimeHour(TimeCurrent()) < Hour_Start_Trade && TimeHour(TimeCurrent()) >= Hour_Stop_Trade)) return (0);
   if (Hour_Stop_Trade == 0) Hour_Stop_Trade = 24;
   if (Hour() == Hour_Stop_Trade - 1 && Minute() >= gi_96) return (0);
   return (1);
}

// 3070E883A104FCC047A1A6B240434873
bool f0_0() {
   bool li_ret_0 = FALSE;
   for (int pos_4 = 0; pos_4 < OrdersTotal(); pos_4++) {
      if (OrderSelect(pos_4, SELECT_BY_POS, MODE_TRADES)) {
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber) {
            if (OrderType() == OP_BUY || OrderType() == OP_SELL) {
               li_ret_0 = TRUE;
               break;
            }
         }
      }
   }
   return (li_ret_0);
}