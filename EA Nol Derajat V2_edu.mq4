/*
   Generated by EX4-TO-MQ4 decompiler V4.0.438.4 [-]
   Website: https://purebeam.biz
   E-mail : purebeam@gmail.com
   
   edu by 4words (WWI)
*/
#property copyright "Copyright 2012, NatheaFX"
#property link      "NatheaFX@yahoo.com"

//#include <stdlib.mqh>
#import "stdlib.ex4"
   string ErrorDescription(int a0);
#import

extern string EA = "--------------- EA NOL DERAJAT V2 - DEMO ---------------";
int gi_84 = 20;
int gi_88 = 100;
int gi_92 = 15;
int gi_unused_96 = 1;
int gi_unused_100 = 15;
double g_lots_104 = 1.0;
extern int Magic = 114765;
string gs_116 = "Nol Derajat";
double gd_124;
bool gi_132 = FALSE;
int g_ticket_136 = 0;
double gd_140 = 1.0;
bool gi_148 = FALSE;
string gs_unused_152 = "\n";
int g_digits_160 = 4;
int gi_unused_164 = 0;
int gi_unused_168 = 0;

int init() {
   string lsa_0[256];
   for (int index_4 = 0; index_4 < 256; index_4++) lsa_0[index_4] = CharToStr(index_4);
   int str2int_8 = StrToInteger(lsa_0[67] + lsa_0[111] + lsa_0[112] + lsa_0[121] + lsa_0[32] + lsa_0[82] + lsa_0[105] + lsa_0[103] + lsa_0[104] + lsa_0[116] + lsa_0[32] +
      lsa_0[169] + lsa_0[32] + lsa_0[75] + lsa_0[97] + lsa_0[122] + lsa_0[97] + lsa_0[111] + lsa_0[111] + lsa_0[32] + lsa_0[50] + lsa_0[48] + lsa_0[49] + lsa_0[49] + lsa_0[32]);
   g_digits_160 = Digits;
   Comment("");
   return (0);
}

int start() {
  /* if (AccountName() != gs_116) {
      Alert("Nama akun salah....");
      return (0);
   }*/
   if (gi_132) {
      if (gi_84 > 0 || gi_88 > 0 || gi_92 > 0) g_ticket_136 = OrderSend(Symbol(), OP_BUY, g_lots_104, Ask, 3, Ask - gi_84 * gd_124, Ask + gi_88 * gd_124, "", Magic, 0, Blue);
      else g_ticket_136 = OrderSend(Symbol(), OP_BUY, g_lots_104, Ask, 3, 0, 0, "", Magic, 0, Blue);
   }
   if (Bars < 10) {
      Comment("Not enough bars");
      return (0);
   }
   if (gi_148 == TRUE) {
      Comment("EA Terminated.");
      return (0);
   }
   f0_5();
   return (0);
}

void f0_5() {
   if (g_digits_160 == 3 || g_digits_160 == 5 && 1) gd_140 = 10;
   f0_4();
   f0_10();
   f0_3();
   f0_9();
}

void f0_4() {
   bool li_20;
   bool li_24;
   double lots_0 = 0;
   double price_8 = 0;
   for (int pos_16 = OrdersTotal() - 1; pos_16 >= 0; pos_16--) {
      if (OrderSelect(pos_16, SELECT_BY_POS, MODE_TRADES)) {
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == 1) {
            if (OrderType() == OP_BUY && Ask - OrderOpenPrice() > 15.0 * gd_140 * Point && OrderStopLoss() < Ask - 30.0 * gd_140 * Point) {
               lots_0 = OrderLots() / 2.0 / 100.0;
               lots_0 = NormalizeDouble(lots_0, g_digits_160);
               if (lots_0 < MarketInfo(Symbol(), MODE_MINLOT)) lots_0 = MarketInfo(Symbol(), MODE_MINLOT);
               price_8 = Ask + 0.0 * gd_140 * Point;
               price_8 = OrderTakeProfit();
               li_20 = OrderModify(OrderTicket(), OrderOpenPrice(), Ask - 15.0 * gd_140 * Point, price_8, OrderExpiration(), White);
               if (li_20 == FALSE) Print("OrderModify() error - ", ErrorDescription(GetLastError()));
               else {
                  if (OrderLots() >= 0.2) {
                     li_20 = OrderClose(OrderTicket(), lots_0, OrderClosePrice(), 4, White);
                     if (li_20 == FALSE) Print("OrderModify() error - ", ErrorDescription(GetLastError()));
                  }
               }
            }
            if (OrderType() == OP_SELL && OrderOpenPrice() - Bid > 15.0 * gd_140 * Point && OrderStopLoss() > Bid + 30.0 * gd_140 * Point) {
               lots_0 = OrderLots() / 2.0 / 100.0;
               lots_0 = NormalizeDouble(lots_0, g_digits_160);
               if (lots_0 < MarketInfo(Symbol(), MODE_MINLOT)) lots_0 = MarketInfo(Symbol(), MODE_MINLOT);
               price_8 = Bid - 0.0 * gd_140 * Point;
               price_8 = OrderTakeProfit();
               li_24 = OrderModify(OrderTicket(), OrderOpenPrice(), Bid + 15.0 * gd_140 * Point, price_8, OrderExpiration(), White);
               if (li_24 == FALSE) {
                  Print("OrderModify() error - ", ErrorDescription(GetLastError()));
                  continue;
               }
               if (OrderLots() >= 0.2) {
                  li_24 = OrderClose(OrderTicket(), lots_0, OrderClosePrice(), 4, White);
                  if (li_24 == FALSE) Print("OrderModify() error - ", ErrorDescription(GetLastError()));
               }
            }
         }
      } else Print("OrderSelect() error - ", ErrorDescription(GetLastError()));
   }
}

void f0_10() {
   bool li_20;
   bool li_24;
   double lots_0 = 0;
   double price_8 = 0;
   for (int pos_16 = OrdersTotal() - 1; pos_16 >= 0; pos_16--) {
      if (OrderSelect(pos_16, SELECT_BY_POS, MODE_TRADES)) {
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == 2) {
            if (OrderType() == OP_BUY && Ask - OrderOpenPrice() > 15.0 * gd_140 * Point && OrderStopLoss() < Ask - 30.0 * gd_140 * Point) {
               lots_0 = OrderLots() / 2.0 / 100.0;
               lots_0 = NormalizeDouble(lots_0, g_digits_160);
               if (lots_0 < MarketInfo(Symbol(), MODE_MINLOT)) lots_0 = MarketInfo(Symbol(), MODE_MINLOT);
               price_8 = Ask + 0.0 * gd_140 * Point;
               price_8 = OrderTakeProfit();
               li_20 = OrderModify(OrderTicket(), OrderOpenPrice(), Ask - 15.0 * gd_140 * Point, price_8, OrderExpiration(), White);
               if (li_20 == FALSE) Print("OrderModify() error - ", ErrorDescription(GetLastError()));
               else {
                  if (OrderLots() >= 0.2) {
                     li_20 = OrderClose(OrderTicket(), lots_0, OrderClosePrice(), 4, White);
                     if (li_20 == FALSE) Print("OrderModify() error - ", ErrorDescription(GetLastError()));
                  }
               }
            }
            if (OrderType() == OP_SELL && OrderOpenPrice() - Bid > 15.0 * gd_140 * Point && OrderStopLoss() > Bid + 30.0 * gd_140 * Point) {
               lots_0 = OrderLots() / 2.0 / 100.0;
               lots_0 = NormalizeDouble(lots_0, g_digits_160);
               if (lots_0 < MarketInfo(Symbol(), MODE_MINLOT)) lots_0 = MarketInfo(Symbol(), MODE_MINLOT);
               price_8 = Bid - 0.0 * gd_140 * Point;
               price_8 = OrderTakeProfit();
               li_24 = OrderModify(OrderTicket(), OrderOpenPrice(), Bid + 15.0 * gd_140 * Point, price_8, OrderExpiration(), White);
               if (li_24 == FALSE) {
                  Print("OrderModify() error - ", ErrorDescription(GetLastError()));
                  continue;
               }
               if (OrderLots() >= 0.2) {
                  li_24 = OrderClose(OrderTicket(), lots_0, OrderClosePrice(), 4, White);
                  if (li_24 == FALSE) Print("OrderModify() error - ", ErrorDescription(GetLastError()));
               }
            }
         }
      } else Print("OrderSelect() error - ", ErrorDescription(GetLastError()));
   }
}

void f0_3() {
   if (Ask > Open[0] + 15.0 * Point && Ask < Open[0] + 200.0 * Point) {
      f0_6();
      f0_1();
   }
}

void f0_6() {
   bool li_0 = FALSE;
   for (int pos_4 = OrdersTotal() - 1; pos_4 >= 0; pos_4--) {
      if (OrderSelect(pos_4, SELECT_BY_POS, MODE_TRADES)) {
         if (OrderType() == OP_BUY && OrderSymbol() == Symbol() && OrderMagicNumber() == 1) li_0 = TRUE;
      } else Print("OrderSelect() error - ", ErrorDescription(GetLastError()));
   }
   if (li_0 == FALSE) f0_13();
}

void f0_13() {
   bool li_0 = FALSE;
   for (int pos_4 = OrdersTotal() - 1; pos_4 >= 0; pos_4--) {
      if (OrderSelect(pos_4, SELECT_BY_POS, MODE_TRADES)) {
         if (OrderType() == OP_SELL && OrderSymbol() == Symbol() && OrderMagicNumber() == 2) li_0 = TRUE;
      } else Print("OrderSelect() error - ", ErrorDescription(GetLastError()));
   }
   if (li_0 == FALSE) f0_11();
}

void f0_11() {
   bool bool_72;
   double ld_0 = MarketInfo(Symbol(), MODE_LOTSIZE) / AccountLeverage();
   double ld_8 = 10;
   double ld_16 = 2.0 * (AccountBalance() / 100.0) / ld_0 * ld_8;
   double ld_24 = 10.0 * (ld_16 / 20.0);
   double lots_32 = 0.001;
   double ld_40 = MarketInfo(Symbol(), MODE_MINLOT);
   for (int li_48 = 0; ld_40 < 1.0; li_48++) ld_40 *= MathPow(10, li_48);
   lots_32 = NormalizeDouble(ld_24, li_48 - 1);
   if (lots_32 < MarketInfo(Symbol(), MODE_MINLOT)) lots_32 = MarketInfo(Symbol(), MODE_MINLOT);
   if (lots_32 > MarketInfo(Symbol(), MODE_MAXLOT)) lots_32 = MarketInfo(Symbol(), MODE_MAXLOT);
   double price_52 = Ask - 20.0 * gd_140 * Point;
   double price_60 = Ask + 100.0 * gd_140 * Point;
   int ticket_68 = -1;
   ticket_68 = OrderSend(Symbol(), OP_BUY, lots_32, Ask, 4, 0, 0, "My Expert", 1, 0, Blue);
   if (ticket_68 > -1) {
      OrderSelect(ticket_68, SELECT_BY_TICKET);
      bool_72 = OrderModify(OrderTicket(), OrderOpenPrice(), price_52, price_60, 0, Blue);
      if (bool_72 == FALSE) Print("OrderModify() error - ", ErrorDescription(GetLastError()));
   } else Print("OrderSend() error - ", ErrorDescription(GetLastError()));
}

void f0_1() {
   bool li_0 = FALSE;
   for (int pos_4 = OrdersTotal() - 1; pos_4 >= 0; pos_4--) {
      if (OrderSelect(pos_4, SELECT_BY_POS, MODE_TRADES)) {
         if (OrderType() == OP_SELL && OrderSymbol() == Symbol() && OrderMagicNumber() == 2) li_0 = TRUE;
      } else Print("OrderSelect() error - ", ErrorDescription(GetLastError()));
   }
   if (li_0) f0_7();
}

void f0_7() {
   int lia_8[30][2];
   int is_closed_16;
   int order_total_0 = OrdersTotal();
   int li_4 = 0;
   for (int pos_12 = 0; pos_12 < order_total_0; pos_12++) {
      OrderSelect(pos_12, SELECT_BY_POS, MODE_TRADES);
      if (OrderType() != OP_SELL || OrderSymbol() != Symbol() || OrderMagicNumber() != 2) continue;
      lia_8[li_4][0] = OrderOpenTime();
      lia_8[li_4][1] = OrderTicket();
      li_4++;
   }
   if (li_4 > 1) {
      ArrayResize(lia_8, li_4);
      ArraySort(lia_8);
   }
   for (pos_12 = 0; pos_12 < li_4; pos_12++) {
      if (OrderSelect(lia_8[pos_12][1], SELECT_BY_TICKET) == TRUE) {
         is_closed_16 = OrderClose(OrderTicket(), OrderLots(), OrderClosePrice(), 4, Red);
         if (is_closed_16 == 0) Print("OrderClose() error - ", ErrorDescription(GetLastError()));
      }
   }
}

void f0_9() {
   if (Bid < Open[0] - 15.0 * Point && Bid > Open[0] - 200.0 * Point) {
      f0_8();
      f0_2();
   }
}

void f0_8() {
   bool li_0 = FALSE;
   for (int pos_4 = OrdersTotal() - 1; pos_4 >= 0; pos_4--) {
      if (OrderSelect(pos_4, SELECT_BY_POS, MODE_TRADES)) {
         if (OrderType() == OP_SELL && OrderSymbol() == Symbol() && OrderMagicNumber() == 2) li_0 = TRUE;
      } else Print("OrderSelect() error - ", ErrorDescription(GetLastError()));
   }
   if (li_0 == FALSE) f0_14();
}

void f0_14() {
   bool li_0 = FALSE;
   for (int pos_4 = OrdersTotal() - 1; pos_4 >= 0; pos_4--) {
      if (OrderSelect(pos_4, SELECT_BY_POS, MODE_TRADES)) {
         if (OrderType() == OP_BUY && OrderSymbol() == Symbol() && OrderMagicNumber() == 1) li_0 = TRUE;
      } else Print("OrderSelect() error - ", ErrorDescription(GetLastError()));
   }
   if (li_0 == FALSE) f0_12();
}

void f0_12() {
   bool bool_72;
   double ld_0 = MarketInfo(Symbol(), MODE_LOTSIZE) / AccountLeverage();
   double ld_8 = 10;
   double ld_16 = 2.0 * (AccountBalance() / 100.0) / ld_0 * ld_8;
   double ld_24 = 10.0 * (ld_16 / 20.0);
   double lots_32 = 0.001;
   double ld_40 = MarketInfo(Symbol(), MODE_MINLOT);
   for (int li_48 = 0; ld_40 < 1.0; li_48++) ld_40 *= MathPow(10, li_48);
   lots_32 = NormalizeDouble(ld_24, li_48 - 1);
   if (lots_32 < MarketInfo(Symbol(), MODE_MINLOT)) lots_32 = MarketInfo(Symbol(), MODE_MINLOT);
   if (lots_32 > MarketInfo(Symbol(), MODE_MAXLOT)) lots_32 = MarketInfo(Symbol(), MODE_MAXLOT);
   double price_52 = Bid + 20.0 * gd_140 * Point;
   double price_60 = Bid - 100.0 * gd_140 * Point;
   int ticket_68 = -1;
   ticket_68 = OrderSend(Symbol(), OP_SELL, lots_32, Bid, 4, 0, 0, "My Expert", 2, 0, Red);
   if (ticket_68 > -1) {
      OrderSelect(ticket_68, SELECT_BY_TICKET);
      bool_72 = OrderModify(OrderTicket(), OrderOpenPrice(), price_52, price_60, 0, Red);
      if (bool_72 == FALSE) Print("OrderModify() error - ", ErrorDescription(GetLastError()));
   } else Print("OrderSend() error - ", ErrorDescription(GetLastError()));
}

void f0_2() {
   bool li_0 = FALSE;
   for (int pos_4 = OrdersTotal() - 1; pos_4 >= 0; pos_4--) {
      if (OrderSelect(pos_4, SELECT_BY_POS, MODE_TRADES)) {
         if (OrderType() == OP_BUY && OrderSymbol() == Symbol() && OrderMagicNumber() == 1) li_0 = TRUE;
      } else Print("OrderSelect() error - ", ErrorDescription(GetLastError()));
   }
   if (li_0) f0_0();
}

void f0_0() {
   int lia_8[30][2];
   int is_closed_16;
   int order_total_0 = OrdersTotal();
   int li_4 = 0;
   for (int pos_12 = 0; pos_12 < order_total_0; pos_12++) {
      OrderSelect(pos_12, SELECT_BY_POS, MODE_TRADES);
      if (OrderType() != OP_BUY || OrderSymbol() != Symbol() || OrderMagicNumber() != 1) continue;
      lia_8[li_4][0] = OrderOpenTime();
      lia_8[li_4][1] = OrderTicket();
      li_4++;
   }
   if (li_4 > 1) {
      ArrayResize(lia_8, li_4);
      ArraySort(lia_8);
   }
   for (pos_12 = 0; pos_12 < li_4; pos_12++) {
      if (OrderSelect(lia_8[pos_12][1], SELECT_BY_TICKET) == TRUE) {
         is_closed_16 = OrderClose(OrderTicket(), OrderLots(), OrderClosePrice(), 4, Red);
         if (is_closed_16 == 0) Print("OrderClose() error - ", ErrorDescription(GetLastError()));
      }
   }
}

int deinit() {
   return (0);
}