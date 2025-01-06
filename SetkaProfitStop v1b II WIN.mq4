/*
   Generated by EX4-TO-MQ4 decompiler V4.0.392.1g [-]
   Website: http://purebeam.biz
   E-mail : purebeam@gmail.com
*/
#property copyright "Copyright � 2011, http://cmillion.narod.ru"
#property link      "cmillion@narod.ru"

//------- Input Parameters ----------------------------------------------------

extern int Orders = 2;
extern double lot1 = 0.01;
extern double MinusLot = -0.01;
extern int FirstStep = 30;
extern int Step = 0;
extern int StepPlus = 1;
extern int SLoss = 100;
extern int TProfit = 110;
extern double ProfitClose = 0.5;
extern double TrailingPercent = 5.0;
extern int SleepTime = 0;
extern int magic = 1000;
extern double Diapazon = 0.1;
extern bool CloseEndWeek = TRUE;
extern int HourClose = 18;
extern int Key = 0;
extern bool RestoreOrder = TRUE;
extern bool LOKOrdersDEL = FALSE;
extern bool DrawInfo = TRUE;
extern bool SendMailInfo = TRUE;
string gs_176 = "SetkaProfitStop v1b ";
string g_str_concat_184;
bool gi_unused_192 = TRUE;
bool g_bool_196;
bool gi_200 = TRUE;
bool gi_204;
bool gi_208;
int gia_212[100];
int gia_216[100];
int gi_220 = 3256;
int g_stoplevel_224;
int g_acc_number_228;
double gda_232[100];
double gda_236[100];
double gda_240[100];
double gd_244;
double gd_252;
string g_str_concat_260;

int init() {
   g_str_concat_260 = StringConcatenate(" ", AccountCurrency());
   if (TrailingPercent != 0.0) gd_252 = ProfitClose / 100.0 * TrailingPercent;
   gd_244 = ProfitClose;
   if (Orders > 99) Orders = 99;
   double ld_0 = MarketInfo(Symbol(), MODE_MINLOT);
   if (lot1 < ld_0) {
      lot1 = ld_0;
      Alert("����������� ��� ������� �� ", ld_0);
   }
   double ld_8 = MarketInfo(Symbol(), MODE_LOTSTEP);
   if (MathAbs(MinusLot) < ld_8 && MinusLot != 0.0) {
      MinusLot = ld_8;
      Alert("������� ���� �������� �� ", ld_8);
   }
   for (int li_16 = 1; li_16 <= Orders; li_16++) {
      gia_212[li_16] = SLoss;
      gia_216[li_16] = TProfit;
      gda_232[li_16] = lot1 - MinusLot * (li_16 - 1);
      if (gda_232[li_16] < ld_0) Orders = li_16 - 1;
   }
   ObjectCreate("Balance", OBJ_LABEL, 0, 0, 0);
   ObjectSet("Balance", OBJPROP_CORNER, 1);
   ObjectSet("Balance", OBJPROP_XDISTANCE, 5);
   ObjectSet("Balance", OBJPROP_YDISTANCE, 15);
   ObjectCreate("Equity", OBJ_LABEL, 0, 0, 0);
   ObjectSet("Equity", OBJPROP_CORNER, 1);
   ObjectSet("Equity", OBJPROP_XDISTANCE, 5);
   ObjectSet("Equity", OBJPROP_YDISTANCE, 30);
   ObjectCreate("FreeMargin", OBJ_LABEL, 0, 0, 0);
   ObjectSet("FreeMargin", OBJPROP_CORNER, 1);
   ObjectSet("FreeMargin", OBJPROP_XDISTANCE, 5);
   ObjectSet("FreeMargin", OBJPROP_YDISTANCE, 45);
   if (!f0_0()) {
      Comment("������ ���������, ������ �������������");
      Sleep(5000);
      if (!f0_0()) Alert("������ ���������, ������������� �������� �������");
   }
   g_bool_196 = (!IsDemo()) && !IsTesting();
   ObjectCreate("Profit", OBJ_LABEL, 0, 0, 0);
   ObjectSet("Profit", OBJPROP_CORNER, 1);
   ObjectSet("Profit", OBJPROP_XDISTANCE, 5);
   ObjectSet("Profit", OBJPROP_YDISTANCE, 60);
   ObjectCreate("ProfitClose", OBJ_LABEL, 0, 0, 0);
   ObjectSet("ProfitClose", OBJPROP_CORNER, 1);
   ObjectSet("ProfitClose", OBJPROP_XDISTANCE, 5);
   ObjectSet("ProfitClose", OBJPROP_YDISTANCE, 75);
   ObjectCreate("Copyright", OBJ_LABEL, 0, 0, 0);
   ObjectSet("Copyright", OBJPROP_CORNER, 3);
   ObjectSet("Copyright", OBJPROP_XDISTANCE, 5);
   ObjectSet("Copyright", OBJPROP_YDISTANCE, 5);
   ObjectSetText("Copyright", "Copyright � 2011, http://cmillion.narod.ru\n", 8, "Arial", Gold);
   return (0);
}

bool f0_0() {
   double ihigh_8;
   double ilow_16;
   double ld_28;
   double ld_36;
   double ld_44;
   double ld_0 = 0;
   if (Step == 0) {
      for (int li_24 = 0; li_24 < 30; li_24++) {
         ihigh_8 = iHigh(NULL, PERIOD_D1, li_24);
         ilow_16 = iLow(NULL, PERIOD_D1, li_24);
         if (ihigh_8 == 0.0 || ilow_16 == 0.0) continue;
         if (ld_0 < (ihigh_8 - ilow_16) / Orders) ld_0 = (ihigh_8 - ilow_16) / Orders * Diapazon;
      }
   } else ld_0 = Step * Point;
   if (ld_0 == 0.0) return (FALSE);
   if (FirstStep < MarketInfo(Symbol(), MODE_STOPLEVEL)) {
      ld_28 = Ask + ld_0;
      ld_36 = Bid - ld_0;
   } else {
      ld_28 = Ask + FirstStep * Point;
      ld_36 = Bid - FirstStep * Point;
   }
   int li_52 = 1;
   if (StepPlus > 0) {
      for (li_24 = 2; li_24 <= Orders; li_24++) li_52 += StepPlus;
      ld_0 = ld_0 * (Orders - 2) / li_52;
   }
   gda_236[1] = NormalizeDouble(ld_36, Digits);
   gda_240[1] = NormalizeDouble(ld_28, Digits);
   li_52 = 1;
   for (li_24 = 2; li_24 <= Orders; li_24++) {
      if (StepPlus > 0) {
         ld_44 = li_52 * ld_0;
         li_52 += StepPlus;
      } else ld_44 = ld_0;
      gda_236[li_24] = NormalizeDouble(gda_236[li_24 - 1] - ld_44, Digits);
      gda_240[li_24] = NormalizeDouble(gda_240[li_24 - 1] + ld_44, Digits);
   }
   g_acc_number_228 = AccountNumber();
   g_str_concat_184 = StringConcatenate("������������� ��������� ", gs_176, " ���� ", g_acc_number_228, 
   "\n");
   if (SLoss != 0) {
      g_str_concat_184 = StringConcatenate(g_str_concat_184, "��������         ", SLoss, 
      "\n");
   }
   if (TProfit != 0) {
      g_str_concat_184 = StringConcatenate(g_str_concat_184, "����������     ", TProfit, 
      "\n");
   }
   g_str_concat_184 = StringConcatenate(g_str_concat_184, "����� ������� ���� ", DoubleToStr(gda_232[1], 2), 
      "\n", "���������� ����. ���� ", DoubleToStr(MinusLot, 2), 
   "\n");
   if (StepPlus == 0) g_str_concat_184 = StringConcatenate(g_str_concat_184, "�����  ", DoubleToStr(ld_0 / Point, 0), " � ", Orders, " �.\n");
   else g_str_concat_184 = StringConcatenate(g_str_concat_184, "��� ����� � ����������� ", DoubleToStr(ld_0 / Point, 0), " � ", StepPlus, " � ", Orders, " �.\n");
   if (Diapazon > 1.0) g_str_concat_184 = StringConcatenate(g_str_concat_184, "���������� ��������� ����� � ", Diapazon, " ����\n");
   if (Diapazon < 1.0 && Diapazon != 0.0) {
      g_str_concat_184 = StringConcatenate(g_str_concat_184, "������� ��������� ����� �� ", Diapazon, 
      "\n");
   }
   if (CloseEndWeek) g_str_concat_184 = StringConcatenate(g_str_concat_184, "��������� ������ � ������� � ", HourClose, ":00\n");
   if (ProfitClose != 0.0) {
      if (gd_252 == 0.0) {
         g_str_concat_184 = StringConcatenate(g_str_concat_184, "������ ��� �������� " + DoubleToStr(ProfitClose, 2), g_str_concat_260, 
         "\n");
      } else {
         g_str_concat_184 = StringConcatenate(g_str_concat_184, "�������� ����� = " + DoubleToStr(ProfitClose, 2), g_str_concat_260, 
            "\n       ", TrailingPercent, "% ����� = " + DoubleToStr(gd_252, 2), g_str_concat_260, 
         "\n");
      }
   }
   g_str_concat_184 = StringConcatenate(g_str_concat_184, "������� ����� ������� ", SleepTime, " ���.\n");
   return (TRUE);
}

int deinit() {
   ObjectDelete("Balance");
   ObjectDelete("Equity");
   ObjectDelete("Profit");
   ObjectDelete("FreeMargin");
   ObjectDelete("Copyright");
   ObjectDelete("ProfitClose");
   return (0);
}

void start() {
bool   fm;
  double pBid, pAsk, pp;
  int    id, nd, o=OrdersTotal();
  string comm="";
Comment("________________________________"
         + "\n"
         + "*** Etrade24.tripod.com"
         + "\n"
         + "*** BigGame24.tripod.com"
         + "\n"
         + "________________________________"
         + "\n"
         + "Expert-Moving to WL" 
         + "\n" 
         + "________________________________"  
         + "\n" 
         + "Broker:         " + AccountCompany()
         + "\n"
         + "Time Local:    " + TimeToStr(TimeCurrent(), TIME_DATE|TIME_SECONDS)
         + "\n"        
         + "________________________________"  
         + "\n" 
         + "Name:             " + AccountName() 
         + "\n" 
         + "Account Number:        " + AccountNumber()
         + "\n" 
         + "Account Currency:      " + AccountCurrency()   
         + "\n"
         + "Account Leverage:      " + DoubleToStr(AccountLeverage(), 0) 
         + "\n"
         + "________________________________"
         + "\n"           
         + "Account BALANCE:     " + DoubleToStr(AccountBalance(), 2)          
         + "\n" 
         + "Account EQUITY:       " + DoubleToStr(AccountEquity(), 2)
         + "\n" 
         + "Used MARGIN:             " + DoubleToStr(AccountMargin(), 2) 
         + "\n" 
         + "________________________________"
         + "\n" 
         + "PROFIT:                   " + DoubleToStr(AccountEquity() - AccountBalance(), 2) 
         + "\n"
         + "PROFIT %:               " + DoubleToStr(100.0 * (AccountEquity() / AccountBalance() - 1.0), 3) + " %" 
         + "\n" 
         + "________________________________" 
         + "\n"

         + "\n"

         + "\n" 
         + "________________________________");

   double ld_0;
   double ld_8;
   double ld_16;
   double ld_24;
   double price_32;
   double price_40;
   double ld_48;
   double ld_56;
   double order_lots_64;
   int li_80;
   int li_84;
   int cmd_88;
   int magic_92;
   double ld_100;
   double ld_120;
   int ticket_128;
   double price_140;
   double price_148;
   g_stoplevel_224 = MarketInfo(Symbol(), MODE_STOPLEVEL);
   for (int pos_96 = OrdersTotal() - 1; pos_96 >= 0; pos_96--) {
      if (OrderSelect(pos_96, SELECT_BY_POS, MODE_TRADES)) {
         magic_92 = OrderMagicNumber();
         if (OrderSymbol() == Symbol() && magic_92 > magic && magic_92 <= magic + Orders) {
            cmd_88 = OrderType();
            order_lots_64 = OrderLots();
            ld_8 = NormalizeDouble(OrderOpenPrice(), Digits);
            if (cmd_88 == OP_BUY) {
               ld_48 += ld_8 * order_lots_64;
               li_80++;
               ld_16 += order_lots_64;
               ld_0 += OrderProfit();
            }
            if (cmd_88 == OP_SELL) {
               ld_56 += ld_8 * order_lots_64;
               li_84++;
               ld_24 += order_lots_64;
               ld_0 += OrderProfit();
            }
            if (RestoreOrder) {
               if (cmd_88 == OP_BUYSTOP) gda_240[magic_92 - magic] = ld_8;
               if (cmd_88 == OP_SELLSTOP) gda_236[magic_92 - magic] = ld_8;
            }
         }
      }
   }
   ObjectDelete("SLb");
   ObjectDelete("SLs");
   if (li_80 > 0) {
      price_32 = ld_48 / ld_16;
      ObjectCreate("SLb", OBJ_ARROW, 0, Time[0], price_32, 0, 0, 0, 0);
      ObjectSet("SLb", OBJPROP_ARROWCODE, SYMBOL_RIGHTPRICE);
      ObjectSet("SLb", OBJPROP_COLOR, Blue);
   }
   if (li_84 > 0) {
      price_40 = ld_56 / ld_24;
      ObjectCreate("SLs", OBJ_ARROW, 0, Time[0], price_40, 0, 0, 0, 0);
      ObjectSet("SLs", OBJPROP_ARROWCODE, SYMBOL_RIGHTPRICE);
      ObjectSet("SLs", OBJPROP_COLOR, Red);
   }
   if (li_80 + li_84 > 0) ld_100 = ProfitClose / (li_80 + li_84);
   else ld_100 = ProfitClose;
   if (g_bool_196 && Key != 0) {
      Comment("���� ������,\n��� ��������� ����� ���������� cmillion@narod.ru, �������� ", g_acc_number_228);
      return;
   }
   double tradeallowed_108 = MarketInfo(Symbol(), MODE_TRADEALLOWED);
   if (tradeallowed_108 == 1.0 || (!g_bool_196)) {
      Comment(g_str_concat_184, 
         "\nBuy ", li_80, 
      "\nSell ", li_84);
   } else Comment("����� �� ������� ����������� ��������� ", tradeallowed_108);
   if (DayOfWeek() != 5) {
      if (!gi_200) {
         f0_0();
         gi_200 = TRUE;
      }
   } else {
      if (li_80 + li_84 == 0 && CloseEndWeek && Hour() >= HourClose) {
         if (gi_200) {
            Alert(Symbol(), " ����� ������ ��������� ������");
            gi_200 = FALSE;
            if (DrawInfo) {
               ObjectCreate(TimeToStr(TimeCurrent(), TIME_DATE|TIME_MINUTES), OBJ_VLINE, 0, Time[0], 0, 0, 0, 0, 0);
               ObjectSet(TimeToStr(TimeCurrent(), TIME_DATE|TIME_MINUTES), OBJPROP_COLOR, Red);
            }
         }
         f0_4();
         Comment("����� ������, �� ������� ����� ", HourClose);
         return;
      }
   }
   int li_116 = TimeCurrent() + 60 * SleepTime;
   if (gd_252 == 0.0) {
      if (ld_0 >= ld_100 && ProfitClose != 0.0) {
         Alert(Symbol(), " ��������� ������� ������� = ", DoubleToStr(ld_0, 2));
         f0_6(Green, StringConcatenate("������� ", DoubleToStr(ld_0, 2)), 1);
         f0_3();
         if (SendMailInfo) {
            SendMail(StringConcatenate(gs_176, " ", AccountCompany(), " ", AccountNumber()), StringConcatenate("Profit ", Symbol(), " = ", DoubleToStr(ld_0, 2), 
               "\nBuy ", li_80, "  Lot = ", DoubleToStr(ld_16, 2), 
               "\nSell ", li_84, "  Lot = ", DoubleToStr(ld_24, 2), 
               "\nOrders ", OrdersTotal(), 
               "\nEquity ", DoubleToStr(AccountEquity(), 2), 
               "\nFreeMargin ", DoubleToStr(AccountFreeMargin(), 2), 
            "\nBalance ", DoubleToStr(AccountBalance(), 2)));
         }
         if (SleepTime > 0) {
            while (TimeCurrent() < li_116) {
               Comment("��������� ������� �������, ����� ����� ��������� ����� ", TimeToStr(li_116 - TimeCurrent(), TIME_SECONDS));
               Sleep(1000);
            }
         }
      }
   } else {
      if (ld_0 >= gd_244) {
         if (!gi_204) {
            Alert(Symbol(), " ", AccountCompany(), " ������ ���������, ������� = ", DoubleToStr(ld_0, 2));
            f0_6(Red, StringConcatenate("������ ��������� ", DoubleToStr(ld_0, 2)), -1);
         } else {
            Print(Symbol(), " ", AccountCompany(), " ������ ���������, ������� = ", DoubleToStr(ld_0, 2));
            if (ld_0 > gd_244) {
               Alert(Symbol(), "  ����� �������� Profit = ", DoubleToStr(ld_0, 2), " �������� ��� ", DoubleToStr(ld_0 - gd_252, 2));
               f0_6(Yellow, DoubleToStr(ld_0, 2), -1);
            }
         }
         gi_204 = TRUE;
         gd_244 = ld_0;
         f0_4();
      }
      ld_120 = gd_244 - gd_252;
      if (gi_204 && ld_0 <= ld_120) {
         Alert(Symbol(), " ", AccountCompany(), " ��������� ������� ������ �� ���������, ������� = ", DoubleToStr(ld_0, 2));
         f0_6(f0_5(ld_0 < 0.0, 255, 32768), StringConcatenate("������� ", DoubleToStr(ld_0, 2)), 1);
         f0_3();
         gi_204 = FALSE;
         if (SendMailInfo) {
            SendMail(StringConcatenate(gs_176, " ", AccountCompany(), " ", AccountNumber()), StringConcatenate("Profit ", Symbol(), " = ", DoubleToStr(ld_0, 2), 
               "\nBuy ", li_80, "  Lot = ", DoubleToStr(ld_16, 2), 
               "\nSell ", li_84, "  Lot = ", DoubleToStr(ld_24, 2), 
               "\nTrailing ", DoubleToStr(ProfitClose, 2), "  ", DoubleToStr(gd_244, 2), 
               "\nOrders ", OrdersTotal(), 
               "\nEquity ", DoubleToStr(AccountEquity(), 2), 
               "\nFreeMargin ", DoubleToStr(AccountFreeMargin(), 2), 
            "\nBalance ", DoubleToStr(AccountBalance(), 2)));
         }
         gd_244 = ProfitClose;
         while (TimeCurrent() < li_116) {
            Comment("��������� ������� ������ �� ���������, ����� ����� ��������� ����� ", TimeToStr(li_116 - TimeCurrent(), TIME_SECONDS));
            Sleep(1000);
         }
      }
   }
   if (li_80 == Orders && li_84 == Orders && (!gi_208)) {
      Alert(Symbol(), " ������� ��� ", Orders, " ������� � ������ �����������");
      if (SendMailInfo) {
         SendMail(StringConcatenate(gs_176, " ", AccountCompany(), " ", AccountNumber()), StringConcatenate("All orders open\nProfit ", Symbol(), " = ", DoubleToStr(ld_0, 2), 
            "\nBuy ", li_80, "  Lot = ", DoubleToStr(ld_16, 2), 
            "\nSell ", li_84, "  Lot = ", DoubleToStr(ld_24, 2), 
            "\nOrders ", OrdersTotal(), 
            "\nEquity ", DoubleToStr(AccountEquity(), 2), 
            "\nFreeMargin ", DoubleToStr(AccountFreeMargin(), 2), 
         "\nBalance ", DoubleToStr(AccountBalance(), 2)));
      }
      gi_208 = TRUE;
      if (LOKOrdersDEL) {
         f0_6(f0_5(ld_0 < 0.0, 255, 32768), StringConcatenate("LOK ", DoubleToStr(ld_0, 2)), 1);
         f0_3();
      }
   } else gi_208 = FALSE;
   if (!gi_204) {
      for (pos_96 = Orders; pos_96 > 0; pos_96--) {
         ticket_128 = f0_1(1, magic + pos_96);
         if (ticket_128 == 0) f0_2(1, pos_96);
         else {
            if (!(OrderSelect(ticket_128, SELECT_BY_TICKET))) continue;
            ld_8 = NormalizeDouble(OrderOpenPrice(), Digits);
            if (OrderType() > OP_SELL) {
               if (ld_8 != gda_236[pos_96]) {
                  if (SLoss != 0) price_140 = NormalizeDouble(gda_236[pos_96] + gia_212[pos_96] * Point, Digits);
                  else price_140 = 0;
                  if (TProfit != 0) price_148 = NormalizeDouble(gda_236[pos_96] - gia_216[pos_96] * Point, Digits);
                  else price_148 = 0;
                  if (!OrderModify(ticket_128, gda_236[pos_96], price_140, price_148, 0, Green)) Print("OrderModify SellSTOP Error ", GetLastError());
               }
            }
         }
         ticket_128 = f0_1(0, magic + pos_96);
         if (ticket_128 == 0) f0_2(0, pos_96);
         else {
            if (OrderSelect(ticket_128, SELECT_BY_TICKET)) {
               ld_8 = NormalizeDouble(OrderOpenPrice(), Digits);
               if (OrderType() > OP_SELL) {
                  if (ld_8 != gda_240[pos_96]) {
                     if (SLoss != 0) price_140 = NormalizeDouble(gda_240[pos_96] - gia_212[pos_96] * Point, Digits);
                     else price_140 = 0;
                     if (TProfit != 0) price_148 = NormalizeDouble(gda_240[pos_96] + gia_216[pos_96] * Point, Digits);
                     else price_148 = 0;
                     if (!OrderModify(ticket_128, gda_240[pos_96], price_140, price_148, 0, Green)) Print("OrderModify BuySTOP Error ", GetLastError());
                  }
               }
            }
         }
      }
   }
   ObjectSetText("Balance", StringConcatenate("Balance ", DoubleToStr(AccountBalance(), 2)), 12, "Arial", Green);
   ObjectSetText("Equity", StringConcatenate("Equity ", DoubleToStr(AccountEquity(), 2)), 12, "Arial", Green);
   ObjectSetText("FreeMargin", StringConcatenate("Free Margin ", DoubleToStr(AccountFreeMargin(), 2)), 12, "Arial", Green);
   string str_concat_156 = "";
   if (ld_16 > 0.0 || ld_24 > 0.0) str_concat_156 = StringConcatenate("Profit ", DoubleToStr(ld_0, 2));
   if (ld_16 > 0.0) str_concat_156 = StringConcatenate(str_concat_156, "  Lot Buy = ", DoubleToStr(ld_16, 2));
   if (ld_24 > 0.0) str_concat_156 = StringConcatenate(str_concat_156, "  Lot Sell = ", DoubleToStr(ld_24, 2));
   if (ld_0 >= 0.0) ObjectSetText("Profit", str_concat_156, 12, "Arial", Green);
   else ObjectSetText("Profit", str_concat_156, 12, "Arial", Red);
   if (gi_204) {
      ObjectSetText("ProfitClose", StringConcatenate("Profit Close ", DoubleToStr(gd_244 - gd_252, 2)), 10, "Arial", Gold);
      return;
   }
   ObjectSetText("ProfitClose", StringConcatenate("Profit Close ", DoubleToStr(ProfitClose, 2)), 10, "Arial", f0_5(gd_252 != 0.0, 8421504, 32768));
}

int f0_1(int ai_0, int a_magic_4) {
   int cmd_8;
   for (int pos_12 = 0; pos_12 < OrdersTotal(); pos_12++) {
      if (OrderSelect(pos_12, SELECT_BY_POS, MODE_TRADES)) {
         if (OrderSymbol() == Symbol()) {
            if (OrderMagicNumber() == a_magic_4) {
               cmd_8 = OrderType();
               if (cmd_8 == OP_BUYSTOP || cmd_8 == OP_BUY && ai_0 == 0) return (OrderTicket());
               if (cmd_8 == OP_SELLSTOP || cmd_8 == OP_SELL && ai_0 == 1) return (OrderTicket());
            }
         }
      }
   }
   return (0);
}

void f0_2(int ai_0, int ai_4) {
   double price_8;
   double price_16;
   if (ai_0 == 1 && Bid >= NormalizeDouble(gda_236[ai_4] + g_stoplevel_224 * Point, Digits)) {
      if (SLoss != 0) price_8 = NormalizeDouble(gda_236[ai_4] + gia_212[ai_4] * Point, Digits);
      else price_8 = 0;
      if (TProfit != 0) price_16 = NormalizeDouble(gda_236[ai_4] - gia_216[ai_4] * Point, Digits);
      else price_16 = 0;
      if (OrderSend(Symbol(), OP_SELLSTOP, gda_232[ai_4], gda_236[ai_4], 1, price_8, price_16, gs_176 + DoubleToStr(ai_4, 0), ai_4 + magic, 0, Red) == -1) Print("OrderSend SELLSTOP Error ", GetLastError(), " Bid ", DoubleToStr(Bid, Digits), " price ", DoubleToStr(gda_236[ai_4 - magic], Digits), " Lot ", ai_4, " = ", gda_232[ai_4]);
   }
   if (ai_0 == 0 && Ask <= NormalizeDouble(gda_240[ai_4] - g_stoplevel_224 * Point, Digits)) {
      if (SLoss != 0) price_8 = NormalizeDouble(gda_240[ai_4] - gia_212[ai_4] * Point, Digits);
      else price_8 = 0;
      if (TProfit != 0) price_16 = NormalizeDouble(gda_240[ai_4] + gia_216[ai_4] * Point, Digits);
      else price_16 = 0;
      if (OrderSend(Symbol(), OP_BUYSTOP, gda_232[ai_4], gda_240[ai_4], 1, price_8, price_16, gs_176 + DoubleToStr(ai_4, 0), ai_4 + magic, 0, Blue) == -1) Print("OrderSend BUYSTOP Error ", GetLastError(), " Ask ", DoubleToStr(Ask, Digits), " price ", DoubleToStr(gda_240[ai_4], Digits), " Lot ", ai_4, " = ", gda_232[ai_4]);
   }
}

int f0_3() {
   int error_4;
   int li_8;
   int cmd_12;
   int magic_16;
   int count_24;
   bool is_closed_0 = TRUE;
   while (!g_bool_196 || Key == 0) {
      for (int pos_20 = OrdersTotal() - 1; pos_20 >= 0; pos_20--) {
         if (OrderSelect(pos_20, SELECT_BY_POS)) {
            magic_16 = OrderMagicNumber();
            if (OrderSymbol() == Symbol() && magic_16 > magic && magic_16 <= magic + Orders) {
               cmd_12 = OrderType();
               if (cmd_12 == OP_BUY) {
                  is_closed_0 = OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Bid, Digits), 3, Blue);
                  if (is_closed_0) Comment("������ ����� N ", OrderTicket(), "  ������� ", OrderProfit(), "     ", TimeToStr(TimeCurrent(), TIME_SECONDS));
               }
               if (cmd_12 == OP_SELL) {
                  is_closed_0 = OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Ask, Digits), 3, Red);
                  if (is_closed_0) Comment("������ ����� N ", OrderTicket(), "  ������� ", OrderProfit(), "     ", TimeToStr(TimeCurrent(), TIME_SECONDS));
               }
               if (!is_closed_0) {
                  error_4 = GetLastError();
                  if (error_4 >= 2/* COMMON_ERROR */) {
                     if (error_4 == 129/* INVALID_PRICE */) {
                        Comment("������������ ���� ", TimeToStr(TimeCurrent(), TIME_SECONDS));
                        RefreshRates();
                        continue;
                     }
                     if (error_4 == 146/* TRADE_CONTEXT_BUSY */) {
                        if (!(IsTradeContextBusy())) continue;
                        Sleep(2000);
                        continue;
                     }
                     Comment("������ ", error_4, " �������� ������ N ", OrderTicket(), "     ", TimeToStr(TimeCurrent(), TIME_SECONDS));
                  }
               }
            }
         }
      }
      count_24 = 0;
      for (pos_20 = 0; pos_20 < OrdersTotal(); pos_20++) {
         if (OrderSelect(pos_20, SELECT_BY_POS)) {
            magic_16 = OrderMagicNumber();
            if (OrderSymbol() == Symbol() && magic_16 > magic && magic_16 <= magic + Orders) {
               cmd_12 = OrderType();
               if (cmd_12 == OP_BUY || cmd_12 == OP_SELL) count_24++;
            }
         }
      }
      if (count_24 == 0) break;
      li_8++;
      if (li_8 > 10) {
         Alert(Symbol(), " �� ������� ������� ��� ������, �������� ��� ", count_24);
         return (0);
      }
      Sleep(1000);
      RefreshRates();
   }
   f0_0();
   return (1);
}

int f0_4() {
   int cmd_12;
   int magic_16;
   int li_unused_0 = 1;
   if (!g_bool_196 || Key == 0) {
      for (int pos_20 = OrdersTotal() - 1; pos_20 >= 0; pos_20--) {
         if (OrderSelect(pos_20, SELECT_BY_POS)) {
            magic_16 = OrderMagicNumber();
            if (OrderSymbol() == Symbol() && magic_16 > magic && magic_16 <= magic + Orders) {
               cmd_12 = OrderType();
               if (cmd_12 > OP_SELL) OrderDelete(OrderTicket());
            }
         }
      }
   }
   return (1);
}

int f0_5(bool ai_0, int ai_4, int ai_8) {
   if (ai_0) return (ai_4);
   return (ai_8);
}

void f0_6(color a_color_0, string a_text_4, int ai_12) {
   string str_concat_16;
   if (DrawInfo) {
      str_concat_16 = StringConcatenate(TimeToStr(TimeCurrent(), TIME_SECONDS), " ", a_text_4);
      ObjectDelete(str_concat_16);
      if (ai_12 == 1) ObjectCreate(str_concat_16, OBJ_TEXT, 0, Time[0], Bid, 0, 0, 0, 0);
      if (ai_12 == -1) ObjectCreate(str_concat_16, OBJ_TEXT, 0, Time[0], Bid, 0, 0, 0, 0);
      ObjectSetText(str_concat_16, a_text_4, 10, "Times New Roman", a_color_0);
   }
}