#property copyright "JOINME"
#property link      "joinme@yandex.ru"

extern int dDayBuy = 0, dDaySell = 0;

int init()
  {
      return(0);
  }

int deinit()
  {
      return(0);
  }

int start()
  {
      int total,cnt;
  
      if(OrdersTotal() != 0)
      {
         if((Hour() == 15) && (dDayBuy != Day()))
         {
            total = OrdersTotal();
            for(cnt=0;cnt<total;cnt++)
            {  
               OrderSelect(cnt, SELECT_BY_POS, MODE_TRADES);         
               if(OrderType()==OP_BUY)
               {
                  OrderClose(OrderTicket(), OrderLots(), Bid, 3, Yellow);   
               }
               if(OrderType()==OP_SELL)
               {
                  OrderClose(OrderTicket(), OrderLots(), Ask, 3, Red);
               }
            }
            if(OrdersTotal() == 0) OrderSend(Symbol(),OP_BUY,0.1,Ask,3,0,Ask+0.0080,"",2,0,Blue);      
            dDayBuy = Day();
         }
         if((Hour() == 8) && (dDaySell != Day()))
         {
            total = OrdersTotal();
            for(cnt=0;cnt<total;cnt++)
            {  
               OrderSelect(cnt, SELECT_BY_POS, MODE_TRADES);         
               if(OrderType()==OP_BUY)
               {
                  OrderClose(OrderTicket(), OrderLots(), Bid, 3, Yellow);   
               }
               if(OrderType()==OP_SELL)
               {
                  OrderClose(OrderTicket(), OrderLots(), Ask, 3, Red);
               }
            }
            if(OrdersTotal() == 0) OrderSend(Symbol(),OP_SELL,0.1,Bid,3,0,Bid-0.0080,"",2,0,Red);
            dDaySell = Day();
         }
      }
      
      if(OrdersTotal() == 0)
      {
         if((Hour() == 15) && (dDayBuy != Day()))
         {
            OrderSend(Symbol(),OP_BUY,0.1,Ask,3,0,Ask+0.0080,"",2,0,Blue);      
            dDayBuy = Day();
         }
         if((Hour() == 8) && (dDaySell != Day()))
         {
            OrderSend(Symbol(),OP_SELL,0.1,Bid,3,0,Bid-0.0080,"",2,0,Red);
            dDaySell = Day();
         }
      }

      return(0);
  }


