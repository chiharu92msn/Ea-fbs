/*
   Generated by EX4-TO-MQ4 decompiler V4.0.469.1 [-]
   Website: https://purebeam.biz
   E-mail : purebeam@gmail.com
*/
#property copyright "VryzaFx.co"
#property link      ""

int gi_unused_76 = 0;
int gi_unused_80 = 0;
int gi_unused_84 = 1;
int gi_unused_88 = 1;
int g_count_104;
int g_count_108;
int gi_112;
int gi_116;
int gi_120;
double g_order_open_price_124;
double g_order_open_price_132;
extern double Lots = 0.01;
extern double MinLots = 0.01;
extern int magic = 2323;
extern int TakeProfit = 1200;
extern int StopLoss = 60;
extern int MaxBuyPos = 2;
extern int MaxSellPos = 2;
extern int Distance = 12;
extern int Near = 5;
extern int Far = 12;
extern string Note = "Alhamdulillah tetap profit";
//------- ������� ��������� ------------------------------------------
extern bool   ProfitTrailing = True;  // ������� ������ ������
extern int    TrailingStop   = 12;     // ������������� ������ �����
extern int    TrailingStep   = 2;     // ��� �����
extern bool   UseSound       = True;  // ������������ �������� ������
extern string NameFileSound  = "expert.wav";  // ������������ ��������� �����

int init() {
   return (0);
}
	 	 			  	    		   	  		 	 	 	  	  				  	        		 			 				  			 			 	 	 			   			 	 	   	  	  	 	  	 			 			 	 			  	  	 	     	 	 		   	    	
int deinit() {
   return (0);
}
	     		 		 			   					  				  		 		  		 		 		 	   		 	  	 	 	  				     			   	 	 		     						 									    			  	 	       	 	     		   				 		
int start() {


   int ticket_8;
   int ticket_12;
   int is_closed_16;
   bool bool_20;
   int li_24 = MaxBuyPos + MaxSellPos;
   f0_0();
   RefreshRates();
   if (gi_112 + g_count_104 < MaxBuyPos && g_count_108 == 0) {
      ticket_8 = OrderSend(Symbol(), OP_BUYSTOP, Lots, Ask + Distance * Point, 1, 0, 0, "Galau EA", magic, 0, Green);
      if (ticket_8 > 0) {
         if (OrderSelect(ticket_8, SELECT_BY_TICKET, MODE_TRADES)) Print("BUY Stop order sent : ", OrderOpenPrice());
      } else {
         Print("Error sending BUY Stop order : ", GetLastError());
         return (0);
      }
      return (0);
   }
   if (gi_116 + g_count_108 < MaxSellPos && g_count_104 == 0) {
      ticket_12 = OrderSend(Symbol(), OP_SELLSTOP, Lots, Bid - Distance * Point, 1, 0, 0, "Galau EA", magic, 0, Red);
      if (ticket_12 > 0) {
         if (OrderSelect(ticket_12, SELECT_BY_TICKET, MODE_TRADES)) Print("SELL Stop order sent : ", OrderOpenPrice());
      } else {
         Print("Error sending SELL Stop order : ", GetLastError());
         return (0);
      }
      return (0);
   }
   int order_total_4 = OrdersTotal();
   for (int pos_0 = order_total_4 - 1; pos_0 >= 0; pos_0--) {
      OrderSelect(pos_0, SELECT_BY_POS, MODE_TRADES);
      if (OrderMagicNumber() != magic) break;
      if (OrderType() == OP_BUYSTOP && g_count_108 != 0 && OrderSymbol() == Symbol()) OrderDelete(OrderTicket());
      if (OrderType() == OP_SELLSTOP && g_count_104 != 0 && OrderSymbol() == Symbol()) OrderDelete(OrderTicket());
      RefreshRates();
      if (OrderType() == OP_BUY && OrderSymbol() == Symbol()) {
         if (Ask >= OrderOpenPrice() + TakeProfit * Point || Bid <= OrderOpenPrice() - StopLoss * Point) is_closed_16 = OrderClose(OrderTicket(), OrderLots(), Bid, 3, Violet);
         if (is_closed_16 <= 0) Print("Error closing order : ", GetLastError());
      }
      RefreshRates();
      if (OrderType() == OP_SELL && OrderSymbol() == Symbol()) {
         if (Bid <= OrderOpenPrice() - TakeProfit * Point || Ask >= OrderOpenPrice() + StopLoss * Point) is_closed_16 = OrderClose(OrderTicket(), OrderLots(), Ask, 3, Violet);
         if (is_closed_16 <= 0) Print("Error closing order : ", GetLastError());
      }
   }
   RefreshRates();
   order_total_4 = OrdersTotal();
   for (pos_0 = order_total_4 - 1; pos_0 >= 0; pos_0--) {
      OrderSelect(pos_0, SELECT_BY_POS, MODE_TRADES);
      if (OrderMagicNumber() != magic) break;
      if (OrderType() == OP_BUYSTOP && OrderSymbol() == Symbol()) {
         if (OrderOpenPrice() - Ask <= Point * Near || OrderOpenPrice() - Ask >= Point * Far) {
            bool_20 = OrderModify(OrderTicket(), Ask + Distance * Point, 0, 0, 0, CLR_NONE);
            if (bool_20 <= FALSE) Print("Error modify order : ", GetLastError());
         }
      }
      if (OrderType() == OP_SELLSTOP && OrderSymbol() == Symbol()) {
         if (Bid - OrderOpenPrice() <= Point * Near || Bid - OrderOpenPrice() >= Point * Far) {
            bool_20 = OrderModify(OrderTicket(), Bid - Distance * Point, 0, 0, 0, CLR_NONE);
            if (bool_20 <= FALSE) Print("Error modify order : ", GetLastError());
         }
      }
   }
     for (int i=0; i<OrdersTotal(); i++) {
    if (OrderSelect(i, SELECT_BY_POS, MODE_TRADES)) {
      TrailingPositions();
    }
  }
   return (0);
}
		     	  	 		   					    			 						   	  	 				 	 		      	 		 	 		  	   		  		   		 	  					 	  				 		      			 	 		  	   			 	   	   								
void f0_0() {
   g_count_104 = 0;
   g_count_108 = 0;
   gi_112 = 1;
   gi_116 = 1;
   for (int pos_0 = 0; pos_0 < OrdersTotal(); pos_0++) {
      if (OrderSelect(pos_0, SELECT_BY_POS, MODE_TRADES) == FALSE || OrderMagicNumber() != magic) break;
      if (OrderType() == OP_BUY && OrderSymbol() == Symbol() && OrderMagicNumber() == magic) g_count_104++;
      else {
         if (OrderType() == OP_SELL && OrderSymbol() == Symbol() && OrderMagicNumber() == magic) g_count_108++;
         else {
            if (OrderType() == OP_BUYSTOP && OrderSymbol() == Symbol() && OrderMagicNumber() == magic) {
               gi_112++;
               g_order_open_price_124 = OrderOpenPrice();
            } else {
               if (OrderType() == OP_SELLSTOP && OrderSymbol() == Symbol() && OrderMagicNumber() == magic) {
                  gi_116++;
                  g_order_open_price_132 = OrderOpenPrice();
               }
            }
         }
      }
   }
   gi_120 = g_count_104 + g_count_108 + gi_112 + gi_116;
}


//+------------------------------------------------------------------+
//| ������������� ������� ������� ������                             |
//+------------------------------------------------------------------+
void TrailingPositions() {
  double pBid, pAsk, pp;

  pp = MarketInfo(OrderSymbol(), MODE_POINT);
  if (OrderType()==OP_BUY) {
    pBid = MarketInfo(OrderSymbol(), MODE_BID);
    if (!ProfitTrailing || (pBid-OrderOpenPrice())>TrailingStop*pp) {
      if (OrderStopLoss()<pBid-(TrailingStop+TrailingStep-1)*pp) {
        ModifyStopLoss(pBid-TrailingStop*pp);
        return;
      }
    }
  }
  if (OrderType()==OP_SELL) {
    pAsk = MarketInfo(OrderSymbol(), MODE_ASK);
    if (!ProfitTrailing || OrderOpenPrice()-pAsk>TrailingStop*pp) {
      if (OrderStopLoss()>pAsk+(TrailingStop+TrailingStep-1)*pp || OrderStopLoss()==0) {
        ModifyStopLoss(pAsk+TrailingStop*pp);
        return;
      }
    }
  }
}

//+------------------------------------------------------------------+
//| ������� ������ StopLoss                                          |
//| ���������:                                                       |
//|   ldStopLoss - ������� StopLoss                                  |
//+------------------------------------------------------------------+
void ModifyStopLoss(double ldStopLoss) {
  bool fm;

  fm=OrderModify(OrderTicket(),OrderOpenPrice(),ldStopLoss,OrderTakeProfit(),0,CLR_NONE);
  if (fm && UseSound) PlaySound(NameFileSound);
}
//+------------------------------------------------------------------+
