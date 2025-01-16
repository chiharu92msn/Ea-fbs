

int Gi_76 = 1;
bool Gi_80 = FALSE;
bool Gi_84 = TRUE;
extern double LotExp = 1.357;
double G_slippage_96 = 1.0;
extern double Lots = 0.01;
double Gd_112 = 2.0;
extern double TakeProfit = 10.0;
double G_pips_128 = 500.0;
double Gd_136 = 10.0;
double Gd_144 = 10.0;
extern double PipStep = 25.0;
extern int MaxTrades = 10;
bool Gi_164 = FALSE;
double Gd_168 = 20.0;
bool Gi_176 = FALSE;
bool Gi_180 = FALSE;
double Gd_184 = 48.0;
int G_magic_192 = 543210;
double G_price_196;
double Gd_204;
double Gd_unused_212;
double G_price_220;
double G_bid_228;
double Gd_236;
double Gd_244;
bool Gi_252;
string Gs_sell_256 = "sell";
datetime G_time_264 = 0;
int Gi_268;
int Gi_272 = 0;
double Gd_276;
int G_pos_284 = 0;
int Gi_288;
double Gd_292 = 0.0;
bool Gi_300 = FALSE;
bool Gi_unused_304 = FALSE;
bool Gi_308 = FALSE;
int Gi_312;
bool Gi_316 = FALSE;
int G_datetime_320 = 0;
double Gd_324;
double Gd_332;

int init() {
   Gd_244 = MarketInfo(Symbol(), MODE_SPREAD) * Point;
   if (IsTesting() == TRUE) f0_7();
   if (IsTesting() == FALSE) f0_7();
   return (0);
}

int deinit() {
   return (0);
}

int start() {
   double order_lots_0;
   int Li_unused_8 = 377313;
   if (Gi_176) f0_12(Gd_136, Gd_144, G_price_220);
   if (Gi_180) {
      if (TimeCurrent() >= Gi_268) {
         f0_2();
         Print("Closed All due to TimeOut");
      }
   }
   if (G_time_264 == Time[0]) return (0);
   G_time_264 = Time[0];
   double Ld_12 = f0_4();
   if (Gi_164) {
      if (Ld_12 < 0.0 && MathAbs(Ld_12) > Gd_168 / 100.0 * f0_6()) {
         f0_2();
         Print("Closed All due to Stop Out");
         Gi_316 = FALSE;
      }
   }
   Gi_288 = f0_11();
   if (Gi_288 == 0) Gi_252 = FALSE;
   for (G_pos_284 = OrdersTotal() - 1; G_pos_284 >= 0; G_pos_284--) {
      int status=OrderSelect(G_pos_284, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != G_magic_192) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == G_magic_192) {
         if (OrderType() == OP_SELL) {
            Gi_308 = TRUE;
            order_lots_0 = OrderLots();
            break;
         }
      }
   }
   if (Gi_288 > 0 && Gi_288 <= MaxTrades) {
      RefreshRates();
      Gd_236 = f0_5();
      if (Gi_308 && Bid - Gd_236 >= PipStep * Point) Gi_300 = TRUE;
   }
   if (Gi_288 < 1) {
      Gi_308 = FALSE;
      Gi_300 = TRUE;
      Gd_204 = AccountEquity();
   }
   if (Gi_300) {
      Gd_236 = f0_5();
      if (Gi_308) {
         if (Gi_80) {
            f0_1(1, 0);
            Gd_276 = NormalizeDouble(LotExp * order_lots_0, Gd_112);
         } else Gd_276 = f0_9(OP_SELL);
         if (Gi_84) {
            Gi_272 = Gi_288;
            if (Gd_276 > 0.0) {
               Gi_312 = f0_10(1, Gd_276, Bid, G_slippage_96, Ask, 0, 0, Gs_sell_256 + "-" + Gi_272, G_magic_192, 0, HotPink);
               if (Gi_312 < 0) {
                  Print("Error: ", GetLastError());
                  return (0);
               }
               Gd_236 = f0_5();
               Gi_300 = FALSE;
               Gi_316 = TRUE;
            }
         }
      }
   }
   if (Gi_300 && Gi_288 < 1) {
      G_bid_228 = Bid;
      if (!Gi_308) {
         Gi_272 = Gi_288;
         Gd_276 = f0_9(OP_SELL);
         if (Gd_276 > 0.0) {
            Gi_312 = f0_10(1, Gd_276, G_bid_228, G_slippage_96, G_bid_228, 0, 0, Gs_sell_256 + "-" + Gi_272, G_magic_192, 0, HotPink);
            if (Gi_312 < 0) {
               Print(Gd_276, "Error: ", GetLastError());
               return (0);
            }
            Gi_316 = TRUE;
         }
      }
      if (Gi_312 > 0) Gi_268 = TimeCurrent() + 60.0 * (60.0 * Gd_184);
      Gi_300 = FALSE;
   }
   Gi_288 = f0_11();
   G_price_220 = 0;
   double Ld_20 = 0;
   for (G_pos_284 = OrdersTotal() - 1; G_pos_284 >= 0; G_pos_284--) {
      status=OrderSelect(G_pos_284, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != G_magic_192) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == G_magic_192) {
         if (OrderType() == OP_SELL) {
            G_price_220 += OrderOpenPrice() * OrderLots();
            Ld_20 += OrderLots();
         }
      }
   }
   if (Gi_288 > 0) G_price_220 = NormalizeDouble(G_price_220 / Ld_20, Digits);
   if (Gi_316) {
      for (G_pos_284 = OrdersTotal() - 1; G_pos_284 >= 0; G_pos_284--) {
         status=OrderSelect(G_pos_284, SELECT_BY_POS, MODE_TRADES);
         if (OrderSymbol() != Symbol() || OrderMagicNumber() != G_magic_192) continue;
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == G_magic_192) {
            if (OrderType() == OP_SELL) {
               G_price_196 = G_price_220 - TakeProfit * Point;
               Gd_unused_212 = G_price_196;
               Gd_292 = G_price_220 + G_pips_128 * Point;
               Gi_252 = TRUE;
            }
         }
      }
   }
   if (Gi_316) {
      if (Gi_252 == TRUE) {
         for (G_pos_284 = OrdersTotal() - 1; G_pos_284 >= 0; G_pos_284--) {
            status=OrderSelect(G_pos_284, SELECT_BY_POS, MODE_TRADES);
            if (OrderSymbol() != Symbol() || OrderMagicNumber() != G_magic_192) continue;
            if (OrderSymbol() == Symbol() && OrderMagicNumber() == G_magic_192) status=OrderModify(OrderTicket(), G_price_220, OrderStopLoss(), G_price_196, 0, Yellow);
            Gi_316 = FALSE;
         }
      }
   }
   return (0);
}

double f0_8(double Ad_0) {
   return (NormalizeDouble(Ad_0, Digits));
}

int f0_1(bool Ai_unused_0 = TRUE, bool Ai_4 = TRUE) {
   int Li_ret_8 = 0;
   for (int pos_12 = OrdersTotal() - 1; pos_12 >= 0; pos_12--) {
      if (OrderSelect(pos_12, SELECT_BY_POS, MODE_TRADES)) {
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == G_magic_192) {
            if (OrderType() == OP_SELL && Ai_4) {
               RefreshRates();
               if (!IsTradeContextBusy()) {
                  if (!(!OrderClose(OrderTicket(), OrderLots(), f0_8(Ask), 5, CLR_NONE))) continue;
                  Print("Error close SELL " + OrderTicket());
                  Li_ret_8 = -1;
                  continue;
               }
               if (G_datetime_320 == iTime(NULL, 0, 0)) return (-2);
               G_datetime_320 = iTime(NULL, 0, 0);
               Print("Need close SELL " + OrderTicket() + ". Trade Context Busy");
               return (-2);
            }
         }
      }
   }
   return (Li_ret_8);
}

double f0_9(int A_cmd_0) {
   double lots_4;
   int datetime_12;
   switch (Gi_76) {
   case 0:
      lots_4 = Lots;
      break;
   case 1:
      lots_4 = NormalizeDouble(Lots * MathPow(LotExp, Gi_272), Gd_112);
      break;
   case 2:
      datetime_12 = 0;
      lots_4 = Lots;
      for (int pos_20 = OrdersHistoryTotal() - 1; pos_20 >= 0; pos_20--) {
         if (OrderSelect(pos_20, SELECT_BY_POS, MODE_HISTORY)) {
            if (OrderSymbol() == Symbol() && OrderMagicNumber() == G_magic_192) {
               if (datetime_12 < OrderCloseTime()) {
                  datetime_12 = OrderCloseTime();
                  if (OrderProfit() < 0.0) {
                     lots_4 = NormalizeDouble(OrderLots() * LotExp, Gd_112);
                     continue;
                  }
                  lots_4 = Lots;
               }
            }
         } else return (-3);
      }
   }
   if (AccountFreeMarginCheck(Symbol(), A_cmd_0, lots_4) <= 0.0) return (-1);
   if (GetLastError() == 134/* NOT_ENOUGH_MONEY */) return (-2);
   return (lots_4);
}

int f0_11() {
   int count_0 = 0;
   for (int pos_4 = OrdersTotal() - 1; pos_4 >= 0; pos_4--) {
      int status=OrderSelect(pos_4, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != G_magic_192) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == G_magic_192)
         if (OrderType() == OP_SELL) count_0++;
   }
   return (count_0);
}

void f0_2() {
   for (int pos_0 = OrdersTotal() - 1; pos_0 >= 0; pos_0--) {
      int status=OrderSelect(pos_0, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() == Symbol()) {
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == G_magic_192)
            if (OrderType() == OP_SELL) status=OrderClose(OrderTicket(), OrderLots(), Ask, G_slippage_96, Red);
         Sleep(1000);
      }
   }
}

int f0_10(int Ai_0, double A_lots_4, double A_price_12, int A_slippage_20, double Ad_24, int Ai_32, int Ai_36, string A_comment_40, int A_magic_48, int A_datetime_52, color A_color_56) {
   int ticket_60 = 0;
   int error_64 = 0;
   int count_68 = 0;
   int Li_72 = 100;
   switch (Ai_0) {
   case 3:
      for (count_68 = 0; count_68 < Li_72; count_68++) {
         ticket_60 = OrderSend(Symbol(), OP_SELLLIMIT, A_lots_4, A_price_12, A_slippage_20, f0_0(Ad_24, Ai_32), f0_3(A_price_12, Ai_36), A_comment_40, A_magic_48, A_datetime_52,
            A_color_56);
         error_64 = GetLastError();
         if (error_64 == 0/* NO_ERROR */) break;
         if (!((error_64 == 4/* SERVER_BUSY */ || error_64 == 137/* BROKER_BUSY */ || error_64 == 146/* TRADE_CONTEXT_BUSY */ || error_64 == 136/* OFF_QUOTES */))) break;
         Sleep(1000);
      }
      break;
   case 5:
      for (count_68 = 0; count_68 < Li_72; count_68++) {
         ticket_60 = OrderSend(Symbol(), OP_SELLSTOP, A_lots_4, A_price_12, A_slippage_20, f0_0(Ad_24, Ai_32), f0_3(A_price_12, Ai_36), A_comment_40, A_magic_48, A_datetime_52,
            A_color_56);
         error_64 = GetLastError();
         if (error_64 == 0/* NO_ERROR */) break;
         if (!((error_64 == 4/* SERVER_BUSY */ || error_64 == 137/* BROKER_BUSY */ || error_64 == 146/* TRADE_CONTEXT_BUSY */ || error_64 == 136/* OFF_QUOTES */))) break;
         Sleep(5000);
      }
      break;
   case 1:
      for (count_68 = 0; count_68 < Li_72; count_68++) {
         RefreshRates();
         ticket_60 = OrderSend(Symbol(), OP_SELL, A_lots_4, Bid, A_slippage_20, f0_0(Ask, Ai_32), f0_3(Bid, Ai_36), A_comment_40, A_magic_48, A_datetime_52, A_color_56);
         error_64 = GetLastError();
         if (error_64 == 0/* NO_ERROR */) break;
         if (!((error_64 == 4/* SERVER_BUSY */ || error_64 == 137/* BROKER_BUSY */ || error_64 == 146/* TRADE_CONTEXT_BUSY */ || error_64 == 136/* OFF_QUOTES */))) break;
         Sleep(5000);
      }
   }
   return (ticket_60);
}

// 0D578CA46072792DE50D5B9F5F5F8784
double f0_0(double Ad_0, int Ai_8) {
   if (Ai_8 == 0) return (0);
   return (Ad_0 + Ai_8 * Point);
}

// 4347D7B92E8469B198EAA742F66BBE62
double f0_3(double Ad_0, int Ai_8) {
   if (Ai_8 == 0) return (0);
   return (Ad_0 - Ai_8 * Point);
}


double f0_4() {
   double Ld_ret_0 = 0;
   for (G_pos_284 = OrdersTotal() - 1; G_pos_284 >= 0; G_pos_284--) {
      int status=OrderSelect(G_pos_284, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != G_magic_192) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == G_magic_192)
         if (OrderType() == OP_SELL) Ld_ret_0 += OrderProfit();
   }
   return (Ld_ret_0);
}

// FDD5E0C68EEEAC73C07299767285F173
void f0_12(int Ai_0, int Ai_4, double A_price_8) {
   int Li_16;
   double order_stoploss_20;
   double price_28;
   if (Ai_4 != 0) {
      for (int pos_36 = OrdersTotal() - 1; pos_36 >= 0; pos_36--) {
         if (OrderSelect(pos_36, SELECT_BY_POS, MODE_TRADES)) {
            if (OrderSymbol() != Symbol() || OrderMagicNumber() != G_magic_192) continue;
            if (OrderSymbol() == Symbol() || OrderMagicNumber() == G_magic_192) {
               if (OrderType() == OP_SELL) {
                  Li_16 = NormalizeDouble((A_price_8 - Ask) / Point, 0);
                  if (Li_16 < Ai_0) continue;
                  order_stoploss_20 = OrderStopLoss();
                  price_28 = Ask + Ai_4 * Point;
                  if (order_stoploss_20 == 0.0 || (order_stoploss_20 != 0.0 && price_28 > order_stoploss_20)) int status=OrderModify(OrderTicket(), A_price_8, price_28, OrderTakeProfit(), 0, Red);
               }
            }
            Sleep(1000);
         }
      }
   }
}

double f0_6() {
   if (f0_11() == 0) Gd_324 = AccountEquity();
   if (Gd_324 < Gd_332) Gd_324 = Gd_332;
   else Gd_324 = AccountEquity();
   Gd_332 = AccountEquity();
   return (Gd_324);
}

double f0_5() {
   double order_open_price_0;
   int ticket_8;
   double Ld_unused_12 = 0;
   int ticket_20 = 0;
   for (int pos_24 = OrdersTotal() - 1; pos_24 >= 0; pos_24--) {
      int status=OrderSelect(pos_24, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != G_magic_192) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == G_magic_192 && OrderType() == OP_SELL) {
         ticket_8 = OrderTicket();
         if (ticket_8 > ticket_20) {
            order_open_price_0 = OrderOpenPrice();
            Ld_unused_12 = order_open_price_0;
            ticket_20 = ticket_8;
         }
      }
   }
   return (order_open_price_0);
}

void f0_7() {
   Comment("", "Forex Account Server:", AccountServer(), 
      "\n", "___________________________________", 
      "\n", "AccountName:  ", AccountName(), 
      "\n", "Lots:  ", Lots, 
      "\n", "LotExp:  ", LotExp, 
      "\n", "Step: ", PipStep, 
      "\n", "TakeProfit: ", TakeProfit, 
      "\n", "Symbol: ", Symbol(), 
      "\n", "Price:  ", NormalizeDouble(Bid, 4), 
      "\n", "Date: ", Month(), "-", Day(), "-", Year(), " Server Time: ", Hour(), ":", Minute(), ":", Seconds(), 
      "\n", "___________________________________", 
   "\n");
}
