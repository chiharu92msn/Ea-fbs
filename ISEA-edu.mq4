/*
   2012-09-18 by Capella at http://www.worldwide-invest.org
	- Cleaned program code
	- Adapted to 5-digit brokers
	- Moved some internals to externals
*/

#property copyright "Copyright © 2009, INVESTIVA"
#property link      "www.investiva.net"

extern double TakeProfit = 50;
extern double StopLoss = 29;
extern double AddPriceGap = 20;
extern int ImaPeriod = 16;
extern double PriceToClose = 2;
extern int TradeVolume = 1;
extern bool UseHourTrade = FALSE;
extern int FromHourTrade = 6;
extern int ToHourTrade = 18;
int orderticket1;
int orderticket2;
int totalorders;
int buylimits = 0;
int selllimits = 0;
int buyclose = 0;
int sellclose = 0;
double orderprice;
double stoplevel;
double buymodifyprice;
double sellmodifyprice;
double ima;
double spread;
double lotsize;

void init() 
{
   stoplevel = MarketInfo(Symbol(), MODE_STOPLEVEL);
   stoplevel = (stoplevel + 1.0) * Point;
   StopLoss = StopLoss * Point;
   TakeProfit = TakeProfit * Point;
   AddPriceGap = AddPriceGap * Point;
   PriceToClose = PriceToClose * Point;
   spread = Ask - Bid;
}

int start() 
{
   if (UseHourTrade) 
	{
      if (!(Hour() >= FromHourTrade && Hour() <= ToHourTrade)) 
		{
         Comment("This is not trading time.");
         return (0);
      }
   }
   totalorders = OrdersTotal();
   buylimits = FALSE;
   selllimits = FALSE;
   buyclose = FALSE;
   sellclose = FALSE;
   for (int l_ord_total_12 = totalorders; l_ord_total_12 >= 0; l_ord_total_12--) 
	{
      if (OrderSelect(l_ord_total_12, SELECT_BY_POS) == TRUE && OrderSymbol() == Symbol()) 
		{
         if (OrderType() == OP_BUY) 
			{
            buyclose = TRUE;
            Close_B(OrderTicket(), OrderLots());
         }
         if (OrderType() == OP_SELL) 
			{
            sellclose = TRUE;
            Close_S(OrderTicket(), OrderLots());
         }
         if (OrderType() == OP_BUYLIMIT) 
			{
            buymodifyprice = NormalizeDouble(OrderOpenPrice(), Digits);
            orderticket1 = OrderTicket();
            buylimits = TRUE;
         }
         if (OrderType() == OP_SELLLIMIT) 
			{
            sellmodifyprice = NormalizeDouble(OrderOpenPrice(), Digits);
            orderticket2 = OrderTicket();
            selllimits = TRUE;
         }
      }
   }
   ima = iMA(NULL, 0, ImaPeriod, 0, MODE_LWMA, PRICE_TYPICAL, 0);
   Modify_order();
   Open_order();
   return/*(WARN)*/;
}

void Close_B(int a_ticket_0, double a_lots_4) 
{
   if (NormalizeDouble(Bid - OrderOpenPrice(), Digits) >= PriceToClose) 
	{
      OrderClose(a_ticket_0, a_lots_4, Bid, 1, Yellow);
      buyclose = FALSE;
   }
}

void Close_S(int a_ticket_0, double a_lots_4) 
{
   if (NormalizeDouble(OrderOpenPrice() - Ask, Digits) >= PriceToClose) 
	{
      OrderClose(a_ticket_0, a_lots_4, Ask, 1, Yellow);
      sellclose = FALSE;
   }
}

void Modify_order() 
{
   if (buylimits == TRUE) 
	{
      orderprice = ima - AddPriceGap;
      if (MathAbs(buymodifyprice - orderprice) > Point / 2.0) 
			OrderModify(orderticket1, orderprice, orderprice - StopLoss, orderprice + TakeProfit, 0, DeepSkyBlue);
   }
   if (selllimits == TRUE) 
	{
      orderprice = ima + spread + AddPriceGap;
      if (MathAbs(sellmodifyprice - orderprice) > Point / 2.0) 
			OrderModify(orderticket2, orderprice, orderprice + StopLoss, orderprice - TakeProfit, 0, Pink);
   }
}

void Open_order() 
{
   if (buyclose == FALSE && buylimits == FALSE) 
	{
      orderprice = ima - AddPriceGap;
      if (orderprice > Ask - stoplevel) 
			orderprice = Ask - stoplevel;
      orderprice = NormalizeDouble(orderprice, Digits);
      OrderSend(Symbol(), OP_BUYLIMIT, Lots(), orderprice, 3, orderprice - StopLoss, orderprice + TakeProfit, "", 0, 0, Blue);
      buylimits = TRUE;
   }
   if (sellclose == FALSE && selllimits == FALSE) 
	{
      orderprice = ima + spread + AddPriceGap;
      if (orderprice < Bid + stoplevel) 
			orderprice = Bid + stoplevel;
      orderprice = NormalizeDouble(orderprice, Digits);
      OrderSend(Symbol(), OP_SELLLIMIT, Lots(), orderprice, 3, orderprice + StopLoss, orderprice - TakeProfit, "", 0, 0, Red);
      selllimits = TRUE;
   }
}

double Lots() 
{
   lotsize = NormalizeDouble(AccountEquity() * TradeVolume / 100.0 / 1000.0, 1);
   double l_minlot_0 = MarketInfo(Symbol(), MODE_MINLOT);
   if (lotsize == 0.0) 
		lotsize = l_minlot_0;
   return (lotsize);
}