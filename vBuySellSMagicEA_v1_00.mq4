/*
   EA by Niktesla
   
   -๐เ๑๗๗่๒เํเ ๕็ ํเ ๊เ๊๓ ๏เ๐๓ ่ ๕็ ํเ ๊เ๊๎้ ๒เ้์๔๐ๅ้์... (๗่๒เ้ - ํเ ๋แ๓)
   -๐เแ๎๒เๅ๒ ๏๎ ๎๒๊๐๛๒่ แเ๐เ.
   -๏๐่ ๒๐เ๋ๅ ์๎ใ๓๒ โ๎็ํ่๊เ๒ ่ํ๎ใไเ ๊๎๑๗๊่, ํ๎ ํๅ๗เ๑๒๎. ๒เ๊ ๗๒๎ ๎แ๙ๅๅ ๎โ๎็์๎ๆํ๎๑๒๕ ่ํไ๊เ ๑๎โเ ไเๅ๒.
   
*/
#property copyright "Niktesla, 2013"
#property link      ""


extern string __________________________ = "EA Settings";
extern int MagicNumber = 0;
extern double PosLot = 0.01;

extern int TP = 50; // ๅ๑๋่ 3 ่๋่ 5 ็ํเ๊๎โ, ๒๎ ๑๗่๒เๅ์ ๗๒๎ ๒๎ ๏่๏๑๛. ศํเ๗ๅ - ๒๎ ๒่๊่(๏๎่ํ๒๛).
extern int SL = 20; 

//๏ๅ๐ๅ์ๅํํ๛ๅ ๒่๏เ 1/0
extern int Trail = 0; // ๒๐เ๋่๒ ๋่ ๎๐ไๅ๐. 
extern int UseSL = 0; // โ๛๑๒เโ๋๒ ๋่ ัห ๏๎ เ๋ใ๎๐่๒์๓ ๏๐่ ๎๒๊๐๛๒่่ ๎๐ไๅ๐เ
extern int UseTP = 0; // โ๛๑๒เโ๋๒ ๋่ าะ

int SlippageClose = 100; // โ ๒่๊เ๕
int SlippageOpen = 10;


double Lot = 0.1;
datetime g_ZeroBar_OpenTime = 0;
//int _maxPositions = 999;
int MaxTry = 2; // ๊๎๋่๗ๅ๑๒โ๎ ๏๎๏๛๒๎๊ ็เ๊๐๛๒่ ๎๐ไๅ๐เ...

int gi_132 = 0;

double gd_152;

double g_ibuf_0[6];
double g_ibuf_1[6];
double g_ibuf_2[6];
double g_ibuf_3[6];
double g_ibuf_4[6];
double g_ibuf_5[6];


			 	 		     		  	 	 		    	   			 		 		     	 	 			  	   				  	  		      		  	  		     	 	 			   	 				 	 	 								   		 		 	 		 			  	 	 	 		
int init() {
   int ai_0;
   int ai_4;
   double ld_24;
   double ld_16;
   double ld_32;
   double ld_40;
   double ld_48;
   double ld_56;

   Lot = PosLot;
   //if (ั๒๐เ๒เัาฯ && ั๒๐เ๒เมๅ็าฯ) Lot = PosLot/2;

  
   //if (ั๒๐เ๒เัาฯ && ั๒๐เ๒เมๅ็าฯ) _maxPositions = MaxPositions*2;   

   if (Digits == 3 || Digits == 5) gd_152 = 10.0 * Point;
   else gd_152 = Point;

   if (MaxTry < 1) MaxTry  = 1;
   
   return (0);
}
				 	  	  		  			  	  		   			  	   	  	  		 	 			 		 		 	   		     				    		 	 	 						  	   	   	     		 	   		   						  	 				   			  	 	  
int deinit() {
   return (0);
}
			  	 		   	   		 		   	  					 	 	 	 		   	 								  	 		  	    	 		 	  	 				 					 		 		  		  		  	  	  	 	 			  	 			   					     		 		 		 
int start() {

/*
   updateBuffs2();
   string l_CommentStr  = 
  
        "\n 0: " + DoubleToStr( g_ibuf_0[0], 5) + "; " + DoubleToStr( g_ibuf_0[1], 5) + "; " + DoubleToStr( g_ibuf_0[2], 5) + "; " + DoubleToStr( g_ibuf_0[3], 5) + "; " + DoubleToStr( g_ibuf_0[4], 5) + "; "
      + "\n 1: " + DoubleToStr( g_ibuf_1[0], 5) + "; " + DoubleToStr( g_ibuf_1[1], 5) + "; " + DoubleToStr( g_ibuf_1[2], 5) + "; " + DoubleToStr( g_ibuf_1[3], 5) + "; " + DoubleToStr( g_ibuf_1[4], 5) + "; "
      + "\n 2: " + DoubleToStr( g_ibuf_2[0], 5) + "; " + DoubleToStr( g_ibuf_2[1], 5) + "; " + DoubleToStr( g_ibuf_2[2], 5) + "; " + DoubleToStr( g_ibuf_2[3], 5) + "; " + DoubleToStr( g_ibuf_2[4], 5) + "; "
      + "\n 3: " + DoubleToStr( g_ibuf_3[0], 5) + "; " + DoubleToStr( g_ibuf_3[1], 5) + "; " + DoubleToStr( g_ibuf_3[2], 5) + "; " + DoubleToStr( g_ibuf_3[3], 5) + "; " + DoubleToStr( g_ibuf_3[4], 5) + "; "
      + "\n 4: " + DoubleToStr( g_ibuf_4[0], 5) + "; " + DoubleToStr( g_ibuf_4[1], 5) + "; " + DoubleToStr( g_ibuf_4[2], 5) + "; " + DoubleToStr( g_ibuf_4[3], 5) + "; " + DoubleToStr( g_ibuf_4[4], 5) + "; "
      + "\n 5: " + DoubleToStr( g_ibuf_5[0], 5) + "; " + DoubleToStr( g_ibuf_5[1], 5) + "; " + DoubleToStr( g_ibuf_5[2], 5) + "; " + DoubleToStr( g_ibuf_5[3], 5) + "; " + DoubleToStr( g_ibuf_5[4], 5) + "; ";

   Comment (l_CommentStr);
*/

    if (g_ZeroBar_OpenTime != Time[0]){     
       g_ZeroBar_OpenTime = Time[0];   
   

    
      TrailOrders();
      
      double sl1= 0;
      double tp1= 0; 
               
      if (BuySignal()){
         CloseAllSellTrades();

         if (UseSL)
           sl1 = GetBuyStopInitial();
        // else
        //   sl1 = GetTrailedBuyStop();
           
         if (UseTP) tp1 = Ask + TP*gd_152;
                    
         //OrderSend(Symbol(), OP_BUY , Lot, Ask, SlippageOpen, sl1, tp1, "BS buy", MagicNumber, 0, Blue);                   
      }
            
      if (SellSignal()) {       
         CloseAllBuyTrades();

         if (UseSL)
           sl1 = GetSellStopInitial();
         //else
         //  sl1 = GetTrailedSellStop();         
           if (UseTP) tp1 = Bid - TP*gd_152;
         //OrderSend(Symbol(), OP_SELL , Lot, Bid, SlippageOpen, sl1, tp1, "BS Sell", MagicNumber, 0, Red);                 
         
      }
   }
   return (0);
}
		 	 	    			  	 		 	  	  	 			 			  	    			 	  	  		 	      			 	  			  	  		     				 		 	     	 	   	  	 	  		    		 	 	  	  	 	   	 		 	 	 	
int IsUpBar(int ai_0) {
   if (Close[ai_0] > Open[ai_0]) return (1);
   return (0);
}
	    			 		 	 	   			 	  					 		 		 			 		 	  	   				  	 	    				 	   			 	 	 	 			    			 		 				 				   				  	           	      	   			  		
int IsDownBar(int ai_0) {
   if (Close[ai_0] < Open[ai_0]) return (1);
   return (0);
}
	

//=============================
// วเ๊๐๛โเๅ๒ โ๑ๅ แเ้ ๎๐ไๅ๐เ ๑ MagicNumber ๏๎ ๒ๅ๊๓๙ๅ์๓ ่ํ๑๒๐๓์ๅํ๒๓
void CloseAllBuyTrades() {
   for (int i = OrdersTotal() - 1; i >= 0; i--) {
      OrderSelect(i, SELECT_BY_POS, MODE_TRADES);   
     if (OrderSymbol() == Symbol() && (OrderMagicNumber() == MagicNumber))
         if (OrderType() == OP_BUY)                  
         //OrderClose( OrderTicket(), OrderLots(), Bid, SlippageClose);
         {
           RefreshRates();         
           for(int try = 1; try <= MaxTry; try++)                               
           if (!OrderClose( OrderTicket(), OrderLots(), Bid, SlippageClose))
            {  Print("ฮ๘่แ๊เ ", GetLastError());
               Print("อๅ ๓ไเ๋๎๑ ็เ๊๐๛๒ ๎๐ไๅ๐, ๏๎๏๛๒๊เ ", try);
               Sleep(1000);
               RefreshRates();
            } 
            else            
               break;                              
         }
   } 
    
}

//=============================
// วเ๊๐๛โเๅ๒ โ๑ๅ ๏๐๎ไเๆํ๛ๅ ๎๐ไๅ๐เ ๑ MagicNumber ๏๎ ๒ๅ๊๓๙ๅ์๓ ่ํ๑๒๐๓์ๅํ๒๓
void CloseAllSellTrades() {
    for (int i = OrdersTotal() - 1; i >= 0; i--) {
      OrderSelect(i, SELECT_BY_POS, MODE_TRADES);   
      if (OrderSymbol() == Symbol() && (OrderMagicNumber() == MagicNumber))
         if (OrderType() == OP_SELL) 
           // OrderClose( OrderTicket(), OrderLots(), Ask, SlippageClose);
           {
           RefreshRates();         
           for(int try = 1; try <= MaxTry; try++)                               
           if (!OrderClose( OrderTicket(), OrderLots(), Ask, SlippageClose))
            {  Print("ฮ๘่แ๊เ ", GetLastError());
               Print("อๅ ๓ไเ๋๎๑ ็เ๊๐๛๒ ๎๐ไๅ๐, ๏๎๏๛๒๊เ ", try);
               Sleep(1000);
               RefreshRates();
            } 
            else            
               break;                              
         }
   } 
   
}


//=============================
// ั๗่๒เๅ๒ ๎๒๊๐๛๒๛ๅ ๎๐ไๅ๐เ ๑ MagicNumber ๏๎ ๒ๅ๊๓๙ๅ์๓ ่ํ๑๒๐๓์ๅํ๒๓, โ ๘๒๓๊เ๕.
int CountTrades() {
   int Result = 0;
   for (int i = OrdersTotal() - 1; i >= 0; i--) {
      OrderSelect(i, SELECT_BY_POS, MODE_TRADES);      
      if (OrderSymbol() == Symbol() && (OrderMagicNumber() == MagicNumber))
         if (OrderType() == OP_SELL || OrderType() == OP_BUY) Result++;
   } 
   return (Result);
}


//=============================

// ั๗่๒เๅ๒ ๎๒๊๐๛๒๛ๅ ๎๐ไๅ๐เ ๑ MagicNumber ๏๎ ๒ๅ๊๓๙ๅ์๓ ่ํ๑๒๐๓์ๅํ๒๓, โ ๘๒๓๊เ๕.
void TrailOrders() {
   if (Trail)
   for (int i = OrdersTotal() - 1; i >= 0; i--) {
      OrderSelect(i, SELECT_BY_POS, MODE_TRADES);      
      if (OrderSymbol() == Symbol() && (OrderMagicNumber() == MagicNumber))
         if (OrderType() == OP_SELL )
         {
           if (NormalizeDouble(OrderStopLoss(), Digits) != NormalizeDouble(GetTrailedSellStop(),Digits)){
             Print( "SELL SL =" + GetTrailedSellStop()); 
             OrderModify(OrderTicket(),OrderOpenPrice(),GetTrailedSellStop(),OrderTakeProfit(),0,Red);        
           }
         };
         if (OrderType() == OP_BUY) 
         {
           if (NormalizeDouble(OrderStopLoss(), Digits)!= NormalizeDouble(GetTrailedBuyStop(),Digits)){
             Print( "BUY SL =" + GetTrailedBuyStop()); 
             OrderModify(OrderTicket(),OrderOpenPrice(),GetTrailedBuyStop(),OrderTakeProfit(),0,Blue);        
           }
         };
   } 
}



void updateBuffs(){
 for (int i = 5; i > 0; i--) {
   g_ibuf_0[i] = g_ibuf_0[i-1];
   g_ibuf_1[i] = g_ibuf_1[i-1]; 
   g_ibuf_2[i] = g_ibuf_2[i-1];
   g_ibuf_3[i] = g_ibuf_3[i-1]; 
   g_ibuf_4[i] = g_ibuf_4[i-1];
   g_ibuf_5[i] = g_ibuf_5[i-1];    
 }
   g_ibuf_0[0] = iCustom(NULL, 0, "indicator02",0,1);
   g_ibuf_1[0] = iCustom(NULL, 0, "indicator02",1,1);
   g_ibuf_2[0] = iCustom(NULL, 0, "indicator02",2,1);
   g_ibuf_3[0] = iCustom(NULL, 0, "indicator02",3,1); 
   g_ibuf_4[0] = iCustom(NULL, 0, "indicator02",4,1);
   g_ibuf_5[0] = iCustom(NULL, 0, "indicator02",5,1);    
}


void updateBuffs2(){
 for (int i = 5; i >= 0; i--) {
   g_ibuf_0[i] = iCustom(NULL, 0, "indicator02",0,i);
   g_ibuf_1[i] = iCustom(NULL, 0, "indicator02",1,i);
   g_ibuf_2[i] = iCustom(NULL, 0, "indicator02",2,i);
   g_ibuf_3[i] = iCustom(NULL, 0, "indicator02",3,i); 
   g_ibuf_4[i] = iCustom(NULL, 0, "indicator02",4,i);
   g_ibuf_5[i]= iCustom(NULL, 0, "indicator02",5,i);    
 }
}


//++buy sell magic ea
///////================== 
int BuySignal(){
   double Result = iCustom(NULL, 0, "indicator02",3,1);
   if ((Result == EMPTY_VALUE)||(Result == -1))
   return (0);
   return (1);
   //if return (Result);
}

int SellSignal(){
   double Result = iCustom(NULL, 0, "indicator02",2,1);
   if ((Result == EMPTY_VALUE)||(Result == -1))
   return (0);
   return (1);
}

double GetBuyStopInitial(){
    return (NormalizeDouble(Low[2] - SL * gd_152, Digits));
}

double GetSellStopInitial(){
    return (NormalizeDouble(High[2] + SL * gd_152, Digits));
}

double GetTrailedBuyStop(){
    double d = iCustom(NULL, 0, "indicator02",0,1);
    return (NormalizeDouble( d, Digits));
}

double GetTrailedSellStop(){
    double d = iCustom(NULL, 0, "indicator02",1,1);
    return (NormalizeDouble( d, Digits));
}


