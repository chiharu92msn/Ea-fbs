/* mikmas - forum.goodservice.su */

extern int maperiod = 5.5;
extern int abweichung = 3.0;
extern int abstd = 2.0;

extern int stoploss1 = 40;
extern int stoploss2 = 40;

extern int takeprofit1 = 0;
extern int takeprofit2 = 0;

extern double lot = 0.01;

extern int signalwidth = 2.0; // bars
extern int signalheight = 9.0; // points

extern bool  ProfitTrailing = True;
extern int TrailingStop = 10.0;
extern int TrailingStep = 2;     
extern bool   UseSound       = True;  // Использовать звуковой сигнал
extern string NameFileSound  = "expert.wav";  // Наименование звукового файла

extern int SessionStart = 0;
extern int SessionEnd = 23;

int slippage = 3;
int magic1 = 11;
int magic2 = 22;
int magic3 = 33;
int magic4 = 44;

int beideB = 0;
int beideS = 0;

int init(){
   return(0);
}

int deinit(){
   return(0);
}
int start(){
for (int l=0; l<OrdersTotal(); l++) {
    if (OrderSelect(l, SELECT_BY_POS, MODE_TRADES)) {
      TrailingPositions();
    }
  }
   double sloptp[3]; // SL, Open, TP
   
   switch(OrdersTotal()){
      case 0:  // 0 Orders geoeffnet
         if(IsTradingTime()==1){ // && (iRSI(Symbol(),15,13,PRICE_CLOSE,2) > 80 || iRSI(Symbol(),15,13,PRICE_CLOSE,2) < 20)
            setOrders(sloptp); // vier Stop-Orders setzen
         }
      break;
      case 1:  // 1 Order geoeffnet
         //TrailingPositions();
         deletePending();
      break;
      case 2:  // 2 Orders geoeffnet
         beideB = 0;
         beideS = 0;
         for (int i=0; i<OrdersTotal(); i++) {
            if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES)){
                if (OrderType() == OP_BUYSTOP) {
                  beideB++;
                }
                if (OrderType() == OP_SELLSTOP) {
                  beideS++;
                }
            }
         }
         if(beideB == 2 || beideS == 2){
            deletePending();
         }else{
           // TrailingPositions();
            //deletePending();
         }
         
      break;
      case 3:  // 3 Orders geoeffnet
        // TrailingPositions();
         //deletePending();
      break;
      case 4:  // 4 Orders geoeffnet
         
      break;
   }

   return(0);
}

//+--------------------------------------------------------------


void setOrders(double& sloptp[]){
   
   int abst = getAbstand();
   //Print(abst);
   if(abst > 0){
      paramsOf(abst, 1, sloptp);
      if(sloptp[0] > 0){
         OrderSend(Symbol(),OP_BUYSTOP,lot,sloptp[1],slippage,sloptp[0],sloptp[2],"11",magic1,0,Blue);
      }
      paramsOf(abst, 2, sloptp);
      if(sloptp[0] > 0){
         OrderSend(Symbol(),OP_BUYSTOP,lot,sloptp[1],slippage,sloptp[0],sloptp[2],"22",magic2,0,Blue);
      }
      paramsOf(abst, 3, sloptp);
      if(sloptp[0] > 0){
         OrderSend(Symbol(),OP_SELLSTOP,lot,sloptp[1],slippage,sloptp[0],sloptp[2],"33",magic3,0,Red);
      }
      paramsOf(abst, 4, sloptp);
      if(sloptp[0] > 0){
         OrderSend(Symbol(),OP_SELLSTOP,lot,sloptp[1],slippage,sloptp[0],sloptp[2],"44",magic4,0,Red);
      }
   }
}

void paramsOf(int abs, int order, double& sloptp[]){
   //double sloptp[3]; // SL, Open, TP
   
      sloptp[0] = 0;
      sloptp[1] = 0;
      sloptp[2] = 0;
   
   if(order == 1){ // first buy
      sloptp[0] = Ask + (abs/2)*Point; // SL
      sloptp[1] = sloptp[0] + stoploss1*Point; // Open
      sloptp[2] = 0; // TP
   }
   if(order == 2){ // second buy
      sloptp[0] = Ask + (abs/2)*Point + stoploss1*Point; // SL
      sloptp[1] = sloptp[0] + stoploss2*Point; // Open
      sloptp[2] = 0; // TP
   }
   
   if(order == 3){ // first sell
      sloptp[0] = Bid - (abs/2)*Point; // SL
      sloptp[1] = sloptp[0] - stoploss1*Point; // Open
      sloptp[2] = 0; // TP
   }
   if(order == 4){ // second sell
      sloptp[0] = Bid - (abs/2)*Point - stoploss1*Point; // SL
      sloptp[1] = sloptp[0] - stoploss2*Point; // Open
      sloptp[2] = 0; // TP
   }
   
   //return(sloptp);
   
}

double getAbstand(){
   double abstand = 0;
   /*
   double max = 0;
   double min = 999;
   double bereich;
   for(int i=1;i<signalwidth;i++){
      if(iHigh(Symbol(),0,i) > max){
         max = iHigh(Symbol(),0,i);
      }
      if(iLow(Symbol(),0,i) < min){
         min = iLow(Symbol(),0,i);
      }
   }
   bereich = max/Point - min/Point;
   
   if(bereich <= signalheight && MathRound(iOpen(Symbol(),0,0)  - (bereich*Point/2)) == MathRound(min)){
      abstand = bereich / 2;
   }else{
      abstand = 0;
   }
   */
   
   double ma = iMA(Symbol(),0,maperiod,0,MODE_SMA,PRICE_CLOSE,0);
   if((Ask - ma) >= abweichung*10*Point || (ma - Bid) >= abweichung*10*Point){
      abstand = abstd;
   }else{
      abstand = 0;
   }
   
   return(abstand);
}

void deletePending(){
   for(int i=0; i<OrdersTotal(); i++){
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES)){
         if(OrderType()!=OP_BUY && OrderType()!=OP_SELL){
            OrderDelete(OrderTicket());
         }
      }
   }
}

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
void ModifyStopLoss(double ldStopLoss) {
  bool fm;

  fm=OrderModify(OrderTicket(),OrderOpenPrice(),ldStopLoss,OrderTakeProfit(),0,CLR_NONE);
  if (fm && UseSound) PlaySound(NameFileSound);
}
int IsTradingTime() {
   if (Hour() >= SessionStart && Hour() <= SessionEnd && SessionStart < SessionEnd) return (1);
   if (Hour() <= SessionEnd || Hour() >= SessionStart && SessionStart > SessionEnd) return (1);
   return (0);
}





