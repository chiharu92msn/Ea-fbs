/*
   Generated by EX4-TO-MQ4 decompiler FREEWARE V4.0.451.1 [-]
   Website: http://www.metaquotes.net
   E-mail : support@metaquotes.net
*/
#property copyright "Copyright 2012, Ramben"
#property link      "forexsovetniki.ru"

extern double lot = 0.1;
extern int Stoploss = 100;
extern int Takeprofit = 500;
extern int TrailingStop = 100;
extern int TrailingStart = 10;
extern int StepTrall = 2;
int gi_104 = 0;
int gi_108 = 0;
extern int Magic = 346;
extern int Step = 13;
int gi_120 = 60;
extern int slippage = 3;
int g_stoplevel_128;
int g_datetime_132;
int g_datetime_136;
/*
// F7BD616B6C841D2538735F76D1E02B57
void f0_9654(string as_0, int a_window_8) {
   string text_12 = "Protected";
   string name_20 = WindowExpertName() + "_" + as_0;
   if (ObjectFind(name_20) == -1) ObjectCreate(name_20, OBJ_LABEL, a_window_8, 0, 0);
   ObjectSetText(name_20, text_12, 7, "Tahoma", Red);
   ObjectSet(name_20, OBJPROP_CORNER, 3);
   ObjectSet(name_20, OBJPROP_BACK, FALSE);
   ObjectSet(name_20, OBJPROP_XDISTANCE, 5);
   ObjectSet(name_20, OBJPROP_YDISTANCE, 5);
   ObjectSet(name_20, OBJPROP_COLOR, Red);
   f0_3063();
}
*/
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
   double price_0;
   double price_8;
   double price_16;
   double price_24;
   double price_32;
   double price_40;
   double price_48;
   int li_56;
   int li_60;
   int ticket_64;
   int ticket_68;
   int cmd_72;
/*   if ((!IsDemo()) && !IsTesting()) {
      MessageBox("�� ����������� ����-������. ���������� �� ��������� �� info@forexanalytics.org");
      return (0);
   }*/
   g_stoplevel_128 = MarketInfo(Symbol(), MODE_STOPLEVEL);
   for (int pos_76 = 0; pos_76 < OrdersTotal(); pos_76++) {
      if (OrderSelect(pos_76, SELECT_BY_POS, MODE_TRADES)) {
         if (OrderSymbol() == Symbol() && Magic == OrderMagicNumber()) {
            cmd_72 = OrderType();
            price_0 = NormalizeDouble(OrderStopLoss(), Digits);
            price_32 = NormalizeDouble(OrderOpenPrice(), Digits);
            price_40 = price_0;
            if (cmd_72 == OP_BUY) {
               li_56++;
               if (price_0 < price_32 && gi_104 != 0) {
                  price_8 = NormalizeDouble(price_32 + gi_108 * Point, Digits);
                  if (price_8 > price_0 && price_8 <= NormalizeDouble(Bid - g_stoplevel_128 * Point, Digits)) price_40 = price_8;
               }
               if (TrailingStop >= g_stoplevel_128 && TrailingStop != 0 && (Bid - price_32) / Point >= TrailingStart) {
                  price_8 = NormalizeDouble(Bid - TrailingStop * Point, Digits);
                  if (price_8 >= price_32 && price_8 > price_0 + StepTrall * Point) price_40 = price_8;
               }
               if (price_40 > price_0) {
                  if (!OrderModify(OrderTicket(), price_32, price_40, price_48, 0, White)) Print("Error ", GetLastError(), "   Order Modify Buy   SL ", price_0, "->", price_40);
                  else Print("Order Buy Modify   SL ", price_0, "->", price_40);
               }
            }
            if (cmd_72 == OP_SELL) {
               li_60++;
               if (price_0 > price_32 || price_0 == 0.0 && gi_104 != 0) {
                  price_8 = NormalizeDouble(price_32 - gi_108 * Point, Digits);
                  if (price_8 < price_0 || price_0 == 0.0 && price_8 >= NormalizeDouble(Ask + g_stoplevel_128 * Point, Digits)) price_40 = price_8;
               }
               if (TrailingStop >= g_stoplevel_128 && TrailingStop != 0 && (price_32 - Ask) / Point >= TrailingStart) {
                  price_8 = NormalizeDouble(Ask + TrailingStop * Point, Digits);
                  if (price_8 <= price_32 && price_8 < price_0 - StepTrall * Point || price_0 == 0.0) price_40 = price_8;
               }
               if (price_40 < price_0 || price_0 == 0.0 && price_40 != 0.0) {
                  if (!OrderModify(OrderTicket(), price_32, price_40, price_48, 0, White)) Print("Error ", GetLastError(), "   Order Modify Sell   SL ", price_0, "->", price_40);
                  else Print("Order Sell Modify   SL ", price_0, "->", price_40);
               }
            }
            if (cmd_72 == OP_BUYSTOP) {
               price_16 = price_32;
               ticket_64 = OrderTicket();
            }
            if (cmd_72 == OP_SELLSTOP) {
               price_24 = price_32;
               ticket_68 = OrderTicket();
            }
         }
      }
   }
   if (li_56 + ticket_64 == 0) {
      if (Stoploss >= g_stoplevel_128 && Stoploss != 0) price_40 = NormalizeDouble(Bid - Stoploss * Point, Digits);
      else price_40 = 0;
      if (Takeprofit >= g_stoplevel_128 && Takeprofit != 0) price_48 = NormalizeDouble(Ask + Takeprofit * Point, Digits);
      else price_48 = 0;
      if (OrderSend(Symbol(), OP_BUYSTOP, lot, NormalizeDouble(Ask + Step * Point, Digits), slippage, price_40, price_48, "news", Magic, 0, CLR_NONE) != -1) g_datetime_132 = TimeCurrent();
   }
   if (li_60 + ticket_68 == 0) {
      if (Stoploss >= g_stoplevel_128 && Stoploss != 0) price_40 = NormalizeDouble(Ask + Stoploss * Point, Digits);
      else price_40 = 0;
      if (Takeprofit >= g_stoplevel_128 && Takeprofit != 0) price_48 = NormalizeDouble(Bid - Takeprofit * Point, Digits);
      else price_48 = 0;
      if (OrderSend(Symbol(), OP_SELLSTOP, lot, NormalizeDouble(Bid - Step * Point, Digits), slippage, price_40, price_48, "news", Magic, 0, CLR_NONE) != -1) g_datetime_136 = TimeCurrent();
   }
   if (ticket_64 != 0) {
      if (g_datetime_132 < TimeCurrent() - gi_120 && MathAbs(NormalizeDouble(Ask + Step * Point, Digits) - price_16) / Point > StepTrall) {
         if (Stoploss >= g_stoplevel_128 && Stoploss != 0) price_40 = NormalizeDouble(Bid - Stoploss * Point, Digits);
         else price_40 = 0;
         if (Takeprofit >= g_stoplevel_128 && Takeprofit != 0) price_48 = NormalizeDouble(Ask + Takeprofit * Point, Digits);
         else price_48 = 0;
         if (OrderModify(ticket_64, NormalizeDouble(Ask + Step * Point, Digits), price_40, price_48, 0, CLR_NONE)) g_datetime_132 = TimeCurrent();
      }
   }
   if (ticket_68 != 0) {
      if (g_datetime_136 < TimeCurrent() - gi_120 && MathAbs(NormalizeDouble(Bid - Step * Point, Digits) - price_24) / Point > StepTrall) {
         if (Stoploss >= g_stoplevel_128 && Stoploss != 0) price_40 = NormalizeDouble(Ask + Stoploss * Point, Digits);
         else price_40 = 0;
         if (Takeprofit >= g_stoplevel_128 && Takeprofit != 0) price_48 = NormalizeDouble(Bid - Takeprofit * Point, Digits);
         else price_48 = 0;
         if (OrderModify(ticket_68, NormalizeDouble(Bid - Step * Point, Digits), price_40, price_48, 0, CLR_NONE)) g_datetime_136 = TimeCurrent();
      }
   }
//   f0_9654("protected", 0);
   return (0);
}