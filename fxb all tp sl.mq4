extern double RiskInPercent=0;  
extern double LotsFix=0.01;    
extern string ForexBillions="if(Risk = 0)  ------>  Money Management = OFF"  ;  
extern string SYMBOL_1="EURUSD M30";
extern string SYMBOL_2="EURUSD M60";
extern string SYMBOL_3="USDJPY M15";
extern string SYMBOL_4="EURGBP M60";
extern string SYMBOL_5="GBPUSD M30";


 int  Magic;
 long      zon_lo_1 = D'2217.08.17';
 int       zon_in_2 = 0;
 int       zon_in_3[20];
 double    zon_do_4 = 0.0;
 double    zon_do_5 = 0.0;
 bool      zon_bo_6 = false;
 bool      zon_bo_7 = false;
 double    zon_do_8 = 0.0;
 double    zon_do_9 = 0.0;
 double    zon_do_10 = 0.0;
 double    zon_do_11 = 0.0;
 double    zon_do_12 = 0.0;
 double    zon_do_13 = 0.0;
 double    zon_do_14 = 0.0;
 double    zon_do_15 = 0.0;
 double    zon_do_16 = 0.0;
 double    zon_do_17 = 0.0;
 int       zon_in_18 = 0;
 string    zon_st_19 = "-----  SL/TP Parameters  ----------------------";
 double    zon_do_20 = 22.0;
 double    zon_do_21 = 99.0;
 double    zon_do_22 = 22.0;
 double    zon_do_23 = 99.0;
 double    zon_do_24 = 22.0;
 double    zon_do_25 = 99.0;
 double    zon_do_26 = 22.0;
 double    zon_do_27 = 99.0;
 double    zon_do_28 = 22.0;
 double    zon_do_29 = 99.0;
 bool      zon_bo_30 = true;
 string    zon_st_31 = "-----  Money Management Parameters  -----------";
 bool      zon_bo_32 = false;
 int       zon_in_33 = 2;
 bool      zon_bo_34 = false;
 double    zon_do_35 = 100000.0;
 bool      zon_bo_36 = false;
 double    zon_do_37 = 100.0;
 string    zon_st_38 = "-----  Trading Logic Settings  ----------------";
 int       zon_in_39 = 0;
 bool      zon_bo_40 = false;
 bool      zon_bo_41 = false;
 string    zon_st_42 = "08:00";
 string    zon_st_43 = "22:00";
 bool      zon_bo_44 = false;
 bool      zon_bo_45 = false;
 string    zon_st_46 = "22:00";
 bool      zon_bo_47 = false;
 string    zon_st_48 = "00:00";
 bool      zon_bo_49 = true;
 bool      zon_bo_50 = true;
 string    zon_st_51 = "-----  Trading Date Parameters  ---------------";
 bool      zon_bo_52 = true;
 bool      zon_bo_53 = true;
 bool      zon_bo_54 = true;
 bool      zon_bo_55 = true;
 bool      zon_bo_56 = true;
 bool      zon_bo_57 = true;
 bool      zon_bo_58 = true;
 string    zon_st_59 = "-----  Other Parameters  ----------------------";
 int       zon_in_60 = 3;
 string    zon_st_61 = "凡所有相，皆是虚妄。";
 bool      zon_bo_63 = false;
 bool      zon_bo_64 = false;
 double    zon_do_65 = 0.0;
 double    zon_do_66 = 0.0;
 double    zon_do_67 = 0.0;
 double    zon_do_68 = 3.0;
 double    zon_do_69 = 0.0;
 string    zon_st_70 = "";
 double    zon_do_71 = 0.0;
 int       zon_in_72 = 0;
 int       zon_in_73 = 0;
 string    zon_st_74 = "";
 string    zon_st_75 = "";
 bool      zon_bo_76 = false;
 string    zon_st_77;
 bool      zon_bo_78 = false;
 int       zon_in_79 = 1;
 int       zon_in_80 = 5;
 int       zon_in_81 = 20;
 uint      zon_ui_82 = White;
 int       zon_in_83 = -1;
 bool      zon_bo_84 = false;
 string    zon_st_85 = "Nant_";
 int       zon_in_86 = 0;
 long      zon_lo_87 = 0;
 double    zon_do_88 = 0.0;
 string symb;
 bool EURUSD_30,EURUSD_60,USDJPY,EURGBP,GBPUSD;

//----------------------------

 int init ()
 {
  EURUSD_30=EURUSD_60=USDJPY=EURGBP=GBPUSD=false;
  
  symb=Symbol();
   if ( StringFind(symb,"EURUSD",0) >= 0 && Period() == 60 )  { Magic=1111;EURUSD_60=true;}
   if ( StringFind(symb,"EURUSD",0) >= 0 && Period() == 30 )  { Magic=2222;EURUSD_30=true;}
   if ( StringFind(symb,"USDJPY",0) >= 0 && Period() == 15 )  { Magic=3333;USDJPY=true;}
   if ( StringFind(symb,"EURGBP",0) >= 0 && Period() == 60 )  { Magic=4444;EURGBP=true;}
   if ( StringFind(symb,"GBPUSD",0) >= 0 && Period() == 30 )  { Magic=5555;GBPUSD=true;}
 
   
 int         zi_in_1;
 double      zi_do_2;
 double      zi_do_3;
 string      zi_st_4;
 string      zi_st_5;

//----------------------------

 if ( RiskInPercent>0.0 )
  {
  zon_bo_32 = true ;
  }
 if ( zon_bo_30 )
  {
  HideTestIndicators(true); 
  }
 for (zon_in_2 = ArraySize(zon_in_3) ; zi_in_1 < zon_in_2 ; zi_in_1 = zi_in_1 + 1)
  {
  zon_in_3[zi_in_1] = zi_in_1;
  }
 Print(TimeToString(TimeCurrent(),5)," ","--------------------------------------------------------","","","","","","","","","","",""); 
 Print(TimeToString(TimeCurrent(),5)," ","Starting the ForexBillions","","","","","","","","","","",""); 
 zi_do_2 = 0.0 ;
 if ( Digits() <  2 )
  {
  zi_do_2 = 0.0 ;
  }
 else
  {
  if ( Digits() <  4 )
   {
   zi_do_2 = 2.0 ;
   }
  else
   {
   zi_do_2 = 4.0 ;
  }}
 zon_do_66 = MathPow(10.0,zi_do_2) ;
 zon_do_67 = 1.0 / zon_do_66 ;
 zi_do_3 = MarketInfo(Symbol(),14) / MathPow(10.0,Digits()) ;
 zon_do_69 = zi_do_3 * zon_do_66 ;
 zon_do_71 = zon_do_65 / zon_do_66 ;
 zon_st_70 = DoubleToString(zon_do_65,2) ;
 if ( DoubleToString(zon_do_69,2)  !=  zon_st_70 && zon_do_71<zi_do_3 )
  {
  zon_do_71 = zi_do_3 ;
  }
 zi_st_4 = DoubleToString((Ask - Bid) * zon_do_66,2) ;
 zi_st_5 = DoubleToString(zon_do_68,2) ;
 if ( StringToTime(zon_st_43) <  StringToTime(zon_st_42) )
  {
  zon_bo_76 = true ;
  }
 else
  {
  zon_bo_76 = false ;
  }
 Print(TimeToString(TimeCurrent(),5)," ","--------------------------------------------------------","","","","","","","","","","",""); 
 if ( zon_bo_64 )
  {
  ObjectCreate("line1",OBJ_LABEL,0,0,0.0,0,0.0,0,0.0); 
  ObjectSet("line1",OBJPROP_CORNER,zon_in_79); 
  ObjectSet("line1",OBJPROP_YDISTANCE,zon_in_81); 
  ObjectSet("line1",OBJPROP_XDISTANCE,zon_in_80); 
  ObjectSetText("line1","XQ",9,"Tahoma",zon_ui_82); 
  ObjectCreate("linec",OBJ_LABEL,0,0,0.0,0,0.0,0,0.0); 
  ObjectSet("linec",OBJPROP_CORNER,zon_in_79); 
  ObjectSet("linec",OBJPROP_YDISTANCE,zon_in_81 + 16); 
  ObjectSet("linec",OBJPROP_XDISTANCE,zon_in_80); 
  ObjectSetText("linec","XOX_IR",8,"Tahoma",zon_ui_82); 
  ObjectCreate("line2",OBJ_LABEL,0,0,0.0,0,0.0,0,0.0); 
  ObjectSet("line2",OBJPROP_CORNER,zon_in_79); 
  ObjectSet("line2",OBJPROP_YDISTANCE,zon_in_81 + 28); 
  ObjectSet("line2",OBJPROP_XDISTANCE,zon_in_80); 
  ObjectSetText("line2","------------------------------------------",8,"Tahoma",zon_ui_82); 
  ObjectCreate("lines",OBJ_LABEL,0,0,0.0,0,0.0,0,0.0); 
  ObjectSet("lines",OBJPROP_CORNER,zon_in_79); 
  ObjectSet("lines",OBJPROP_YDISTANCE,zon_in_81 + 44); 
  ObjectSet("lines",OBJPROP_XDISTANCE,zon_in_80); 
  ObjectSetText("lines","Last Signal:  -",9,"Tahoma",zon_ui_82); 
  ObjectCreate("lineopl",OBJ_LABEL,0,0,0.0,0,0.0,0,0.0); 
  ObjectSet("lineopl",OBJPROP_CORNER,zon_in_79); 
  ObjectSet("lineopl",OBJPROP_YDISTANCE,zon_in_81 + 60); 
  ObjectSet("lineopl",OBJPROP_XDISTANCE,zon_in_80); 
  ObjectSetText("lineopl","Open P/L: -",8,"Tahoma",zon_ui_82); 
  ObjectCreate("linea",OBJ_LABEL,0,0,0.0,0,0.0,0,0.0); 
  ObjectSet("linea",OBJPROP_CORNER,zon_in_79); 
  ObjectSet("linea",OBJPROP_YDISTANCE,zon_in_81 + 76); 
  ObjectSet("linea",OBJPROP_XDISTANCE,zon_in_80); 
  ObjectSetText("linea","Account Balance: -",8,"Tahoma",zon_ui_82); 
  ObjectCreate("lineto",OBJ_LABEL,0,0,0.0,0,0.0,0,0.0); 
  ObjectSet("lineto",OBJPROP_CORNER,zon_in_79); 
  ObjectSet("lineto",OBJPROP_YDISTANCE,zon_in_81 + 92); 
  ObjectSet("lineto",OBJPROP_XDISTANCE,zon_in_80); 
  ObjectSetText("lineto","Total profits/losses so far: -/-",8,"Tahoma",zon_ui_82); 
  ObjectCreate("linetp",OBJ_LABEL,0,0,0.0,0,0.0,0,0.0); 
  ObjectSet("linetp",OBJPROP_CORNER,zon_in_79); 
  ObjectSet("linetp",OBJPROP_YDISTANCE,zon_in_81 + 108); 
  ObjectSet("linetp",OBJPROP_XDISTANCE,zon_in_80); 
  ObjectSetText("linetp","Total P/L so far: -",8,"Tahoma",zon_ui_82); 
  }
 return(0); 
 }
//init
//---------------------  ----------------------------------------

 int start ()
 {
 int         zi_in_1;
Comment("净值: ",NormalizeDouble(AccountEquity(),2));

//----------------------------
 bool       lin_bo_1;
 double     lin_do_3;
 int        lin_in_5;
 double     lin_do_11;
 long       lin_lo_12;
 string     lin_st_13;
 int        lin_in_18;
 int        lin_in_19;

 if ( zon_bo_30 )
  {
  HideTestIndicators(true); 
  }
 if ( Bars <  30 )
  {
  Print("NOT ENOUGH DATA"); 
  return(0); 
  }
 if ( TimeCurrent() > zon_lo_1 )
  {
  Alert(" Expired\n Please Contact:\n billionsforex@gmail.com\n www.ForexBillions.com"); 
  lin_bo_1 = false;
  }
 else
  {
  lin_bo_1 = true;
  }
 if ( !(lin_bo_1) )
  {
  return(0); 
  }
 zon_do_4 = Ask ;
 zon_do_5 = Bid ;
 if ( zon_lo_87  !=  Time[0] )
  {
  zon_lo_87 = Time[0] ;
  zon_do_88 = Open[0] ;
  zon_bo_78 = true ;
  }
 else
  {
  zon_bo_78 = false ;
  }
 lin_do_3 = 0.0;
 for (lin_in_5 = OrdersTotal() - 1 ; lin_in_5 >= 0 ; lin_in_5=lin_in_5 - 1)
  {
  if ( OrderSelect(lin_in_5,SELECT_BY_POS,MODE_TRADES) && ( OrderType() == 0 || OrderType() == 1 ) && OrderSymbol() == Symbol() && OrderMagicNumber() == Magic )
   {
   lin_do_3 = OrderProfit() + OrderCommission() + OrderSwap() + lin_do_3;
   }
  }
 ObjectSetText("lineopl","Open P/L: " + DoubleToString(lin_do_3,2),8,"Tahoma",zon_ui_82); 
 ObjectSetText("linea","Account Balance: " + DoubleToString(AccountBalance(),2),8,"Tahoma",zon_ui_82); 

 if ( zon_bo_78 )
  {
  lizong_16(); 
  }
 
 if ( zon_bo_78 )
  {
  if ( TimeDayOfWeek(Time[0]) == 2 && TimeDayOfWeek(Time[0])  !=  TimeDayOfWeek(Time[1]) )
   {
   lin_do_11 = iATR(NULL,0,2,0) * 0.8 + iHigh(NULL,0,1);
   lin_lo_12 = Time[1];
   lin_st_13 = "";
   zon_in_86=zon_in_86 + 1;
   if ( ObjectFind(zon_st_85 + string(zon_in_86))  !=  -1 )
    {
    ObjectDelete(zon_st_85 + string(zon_in_86)); 
    }
   ObjectCreate(zon_st_85 + string(zon_in_86),OBJ_TEXT,0,0,0.0,0,0.0,0,0.0); 
   ObjectSet(zon_st_85 + string(zon_in_86),OBJPROP_TIME1,lin_lo_12); 
   ObjectSet(zon_st_85 + string(zon_in_86),OBJPROP_PRICE1,lin_do_11); 
   ObjectSet(zon_st_85 + string(zon_in_86),OBJPROP_ANGLE,45.0); 
   ObjectSetText(zon_st_85 + string(zon_in_86),lin_st_13,16,"Arial Bold",Yellow); 
   }
  for (zi_in_1 = 1 ; zi_in_1 <= zon_in_2 ; zi_in_1 = zi_in_1 + 1)
   {
   Magic = zon_in_3[zi_in_1 - 1] ;
   lizong_8(); 
   lizong_6(zi_in_1); 
   if ( lizong_7() )
    {
    if ( TimeCurrent() > zon_lo_1 )
     {
     Alert(" Expired\n Please Contact:\n billionsforex@gmail.com\n www.ForexBillions.com"); 
     }
    else
     {
     
     if ( zon_bo_49 && zon_bo_6 == true )
      {
      lizong_9(1,zi_in_1); 
      }
     if ( zon_bo_50 && zon_bo_7 == true )
      {
      lizong_9(-1,zi_in_1); 
    }
  
    }}
    
      lin_in_19 = 0;
   for (lin_in_18 = 0 ; lin_in_18 < OrdersTotal() ; lin_in_18=lin_in_18 + 1)
    {
    if ( OrderSelect(lin_in_18,SELECT_BY_POS,MODE_TRADES) == true && OrderMagicNumber() == Magic && OrderSymbol() == Symbol() )
     {
     if ( OrderType() == 0 )
      {
      lin_in_19 = 1;
      break;
      }
     if ( OrderType() == 1 )
      {
      lin_in_19 = -1;
      break;
     }}
    } 
   if ( lin_in_19 != 0 )
    {
    lizong_11(); 
   
    }
   }
  }
 return(0); 
 }
//start
//---------------------  ----------------------------------------

 int deinit ()
 {

//----------------------------

 if ( zon_bo_30 )
  {
  HideTestIndicators(true); 
  }
 ObjectDelete("line1"); 
 ObjectDelete("linec"); 
 ObjectDelete("line2"); 
 ObjectDelete("lines"); 
 ObjectDelete("lineopl"); 
 ObjectDelete("linea"); 
 ObjectDelete("lineto"); 
 ObjectDelete("linetp"); 
 return(0); 
 }
//deinit
//---------------------  ----------------------------------------


//----------------------------


//----------------------------

 void lizong_6 (int mu_0)
 {
 string      zi_st_1;
 string      zi_st_2;

//----------------------------
 bool       lin_bo_184;
 int        lin_in_492;
 int        lin_in_508;
 double     lin_do_563;

 zi_st_1 = Symbol() ;
 zi_st_2 = StringSubstr(zi_st_1,0,6) ;

/* if ( StringFind(zi_st_1,"AUDJPY",0) >= 0 && Period() == 60 )
  {
  if ( mu_0 == 1 )
   {
   zon_bo_6 = iBands(NULL,0,95,1.0,0,0,2,1)>Close[1] && iBands(NULL,0,95,1.0,0,0,2,2)<=Close[2] ;
   zon_bo_7 = iBands(NULL,0,95,1.0,0,0,1,1)<=Close[1] && iBands(NULL,0,95,1.0,0,0,1,2)>Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=zon_do_67 * 170.0;
   zon_do_13 = zon_do_12 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=zon_do_67 * 70.0;
   zon_do_15 = 0.0 ;
   zon_do_26 = 60.0 ;
   zon_do_27 = 160.0 ;
   zon_do_24 = 60.0 ;
   zon_do_25 = 160.0 ;
   zon_do_28 = 60.0 ;
   zon_do_29 = 160.0 ;
   zon_do_20 = 60.0 ;
   zon_do_21 = 160.0 ;
   zon_do_22 = 60.0 ;
   zon_do_23 = 160.0 ;
   return;
   }
  if ( mu_0 == 2 )
   {
   zon_bo_6 = iMACD(NULL,0,20,40,1,PRICE_CLOSE,0,1)>0.0 && iMACD(NULL,0,20,40,1,PRICE_CLOSE,0,2)<=0.0 ;
   zon_bo_7 = iMACD(NULL,0,20,40,1,PRICE_CLOSE,0,1)<=0.0 && iMACD(NULL,0,20,40,1,PRICE_CLOSE,0,2)>0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iMA(NULL,0,170,0,MODE_SMA,PRICE_CLOSE,1) - zon_do_67 * 60.0;
   zon_do_11=iMA(NULL,0,170,0,MODE_SMA,PRICE_CLOSE,1) + zon_do_67 * 60.0;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=zon_do_67 * 165.0;
   zon_do_17 = zon_do_16 ;
   zon_do_14=zon_do_67 * 100.0;
   zon_do_15=zon_do_67 * 190.0;
   zon_do_26 = 110.0 ;
   zon_do_27 = 195.0 ;
   zon_do_24 = 110.0 ;
   zon_do_25 = 195.0 ;
   zon_do_28 = 110.0 ;
   zon_do_29 = 195.0 ;
   zon_do_20 = 110.0 ;
   zon_do_21 = 195.0 ;
   zon_do_22 = 110.0 ;
   zon_do_23 = 195.0 ;
   return;
   }
  if ( mu_0 == 3 )
   {
   zon_bo_6 = iRSI(NULL,0,95,0,1)>50.0 && iRSI(NULL,0,95,0,2)<=50.0 ;
   zon_bo_7 = iRSI(NULL,0,95,0,1)<=50.0 && iRSI(NULL,0,95,0,2)>50.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=zon_do_67 * 50.0;
   zon_do_17 = zon_do_16 ;
   zon_do_14=iATR(NULL,0,35,1) * 4.0;
   zon_do_15=iATR(NULL,0,30,1) * 19.0;
   zon_do_26 = 30.0 ;
   zon_do_27 = 150.0 ;
   zon_do_24 = 30.0 ;
   zon_do_25 = 150.0 ;
   zon_do_28 = 30.0 ;
   zon_do_29 = 150.0 ;
   zon_do_20 = 30.0 ;
   zon_do_21 = 150.0 ;
   zon_do_22 = 30.0 ;
   zon_do_23 = 150.0 ;
   return;
   }
  if ( mu_0 == 4 )
   {
   zon_bo_6 = iMACD(NULL,0,15,35,1,PRICE_CLOSE,0,1)>0.0 && iMACD(NULL,0,15,35,1,PRICE_CLOSE,0,2)<=0.0 ;
   zon_bo_7 = iMACD(NULL,0,15,35,1,PRICE_CLOSE,0,1)<=0.0 && iMACD(NULL,0,15,35,1,PRICE_CLOSE,0,2)>0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iMA(NULL,0,15,0,MODE_SMA,PRICE_CLOSE,1) - zon_do_67 * 85.0;
   zon_do_11=iMA(NULL,0,15,0,MODE_SMA,PRICE_CLOSE,1) + zon_do_67 * 85.0;
   zon_do_12=iATR(NULL,0,15,1) * 17.5;
   zon_do_13=iATR(NULL,0,15,1) * 17.5;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=zon_do_67 * 145.0;
   zon_do_15=zon_do_67 * 55.0;
   zon_do_26 = 75.0 ;
   zon_do_27 = 170.0 ;
   zon_do_24 = 75.0 ;
   zon_do_25 = 170.0 ;
   zon_do_28 = 75.0 ;
   zon_do_29 = 170.0 ;
   zon_do_20 = 75.0 ;
   zon_do_21 = 170.0 ;
   zon_do_22 = 75.0 ;
   zon_do_23 = 170.0 ;
   return;
   }
  if ( mu_0 == 5 )
   {
   zon_bo_6 = iRSI(NULL,0,80,0,1)>50.0 && iRSI(NULL,0,80,0,2)<=50.0 ;
   zon_bo_7 = iRSI(NULL,0,80,0,1)<=50.0 && iRSI(NULL,0,80,0,2)>50.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=zon_do_67 * 125.0;
   zon_do_13 = zon_do_12 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=zon_do_67 * 190.0;
   zon_do_15=iATR(NULL,0,70,1) * 22.0;
   zon_do_26 = 40.0 ;
   zon_do_27 = 195.0 ;
   zon_do_24 = 40.0 ;
   zon_do_25 = 195.0 ;
   zon_do_28 = 40.0 ;
   zon_do_29 = 195.0 ;
   zon_do_20 = 40.0 ;
   zon_do_21 = 195.0 ;
   zon_do_22 = 40.0 ;
   zon_do_23 = 195.0 ;
   return;
   }
  if ( mu_0 == 6 )
   {
   zon_bo_6 = iBands(NULL,0,40,2.0,0,0,2,1)<=Close[1] && iBands(NULL,0,40,2.0,0,0,2,2)>Close[2] ;
   zon_bo_7 = iBands(NULL,0,40,2.0,0,0,1,1)>Close[1] && iBands(NULL,0,40,2.0,0,0,1,2)<=Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=Open[1] - zon_do_67 * 115.0;
   zon_do_11=Open[1] + zon_do_67 * 115.0;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=iATR(NULL,0,200,1) * 24.0;
   zon_do_15 = 0.0 ;
   zon_do_26 = 10.0 ;
   zon_do_27 = 195.0 ;
   zon_do_24 = 10.0 ;
   zon_do_25 = 195.0 ;
   zon_do_28 = 10.0 ;
   zon_do_29 = 195.0 ;
   zon_do_20 = 10.0 ;
   zon_do_21 = 195.0 ;
   zon_do_22 = 10.0 ;
   zon_do_23 = 195.0 ;
   return;
   }
  if ( mu_0 == 7 )
   {
   zon_bo_6 = iStochastic(NULL,0,40,1,3,0,0,1,1)<=30.0 && iStochastic(NULL,0,40,1,3,0,0,1,2)>30.0 ;
   zon_bo_7 = iStochastic(NULL,0,40,1,3,0,0,1,1)>70.0 && iStochastic(NULL,0,40,1,3,0,0,1,2)<=70.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iMA(NULL,0,80,0,MODE_EMA,PRICE_CLOSE,1) - iATR(NULL,0,130,1) * 15.5;
   zon_do_11=iMA(NULL,0,80,0,MODE_EMA,PRICE_CLOSE,1) + iATR(NULL,0,130,1) * 15.5;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=zon_do_67 * 150.0;
   zon_do_17 = zon_do_16 ;
   zon_do_14=zon_do_67 * 105.0;
   zon_do_15=iATR(NULL,0,120,1) * 12.0;
   zon_do_26 = 100.0 ;
   zon_do_27 = 185.0 ;
   zon_do_24 = 100.0 ;
   zon_do_25 = 185.0 ;
   zon_do_28 = 100.0 ;
   zon_do_29 = 185.0 ;
   zon_do_20 = 100.0 ;
   zon_do_21 = 185.0 ;
   zon_do_22 = 100.0 ;
   zon_do_23 = 185.0 ;
   return;
   }
  if ( mu_0 == 8 )
   {
   zon_bo_6 = iBands(NULL,0,15,2.0,0,0,2,1)<=Close[1] && iBands(NULL,0,15,2.0,0,0,2,2)>Close[2] ;
   zon_bo_7 = iBands(NULL,0,15,2.0,0,0,1,1)>Close[1] && iBands(NULL,0,15,2.0,0,0,1,2)<=Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=iATR(NULL,0,180,1) * 25.0;
   zon_do_13=iATR(NULL,0,180,1) * 25.0;
   zon_do_16=iATR(NULL,0,55,1) * 9.5;
   zon_do_17=iATR(NULL,0,55,1) * 9.5;
   zon_do_14=zon_do_67 * 115.0;
   zon_do_15 = 0.0 ;
   zon_do_26 = 120.0 ;
   zon_do_27 = 185.0 ;
   zon_do_24 = 120.0 ;
   zon_do_25 = 185.0 ;
   zon_do_28 = 120.0 ;
   zon_do_29 = 185.0 ;
   zon_do_20 = 120.0 ;
   zon_do_21 = 185.0 ;
   zon_do_22 = 120.0 ;
   zon_do_23 = 185.0 ;
   return;
   }
  if ( mu_0 == 9 )
   {
   zon_bo_6 = iRSI(NULL,0,80,0,1)>50.0 && iRSI(NULL,0,80,0,2)<=50.0 ;
   zon_bo_7 = iRSI(NULL,0,80,0,1)<=50.0 && iRSI(NULL,0,80,0,2)>50.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=zon_do_67 * 125.0;
   zon_do_13 = zon_do_12 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=zon_do_67 * 190.0;
   zon_do_15=iATR(NULL,0,70,1) * 22.0;
   zon_do_26 = 40.0 ;
   zon_do_27 = 195.0 ;
   zon_do_24 = 40.0 ;
   zon_do_25 = 195.0 ;
   zon_do_28 = 40.0 ;
   zon_do_29 = 195.0 ;
   zon_do_20 = 40.0 ;
   zon_do_21 = 195.0 ;
   zon_do_22 = 40.0 ;
   zon_do_23 = 195.0 ;
   return;
   }
  if ( mu_0 == 10 )
   {
   zon_bo_6 = iMACD(NULL,0,15,60,1,PRICE_CLOSE,0,1)>0.0 && iMACD(NULL,0,15,60,1,PRICE_CLOSE,0,2)<=0.0 ;
   zon_bo_7 = iMACD(NULL,0,15,60,1,PRICE_CLOSE,0,1)<=0.0 && iMACD(NULL,0,15,60,1,PRICE_CLOSE,0,2)>0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=iATR(NULL,0,60,1) * 10.0;
   zon_do_13=iATR(NULL,0,60,1) * 10.0;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=iATR(NULL,0,150,1) * 0.5;
   zon_do_15=iATR(NULL,0,30,1) * 11.0;
   zon_do_26 = 55.0 ;
   zon_do_27 = 195.0 ;
   zon_do_24 = 55.0 ;
   zon_do_25 = 195.0 ;
   zon_do_28 = 55.0 ;
   zon_do_29 = 195.0 ;
   zon_do_20 = 55.0 ;
   zon_do_21 = 195.0 ;
   zon_do_22 = 55.0 ;
   zon_do_23 = 195.0 ;
   return;
   }
  if ( mu_0 == 11 )
   {
   zon_bo_6 = iMACD(NULL,0,20,40,1,PRICE_CLOSE,0,1)>0.0 && iMACD(NULL,0,20,40,1,PRICE_CLOSE,0,2)<=0.0 ;
   zon_bo_7 = iMACD(NULL,0,20,40,1,PRICE_CLOSE,0,1)<=0.0 && iMACD(NULL,0,20,40,1,PRICE_CLOSE,0,2)>0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iMA(NULL,0,170,0,MODE_SMA,PRICE_CLOSE,1) - zon_do_67 * 60.0;
   zon_do_11=iMA(NULL,0,170,0,MODE_SMA,PRICE_CLOSE,1) + zon_do_67 * 60.0;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=zon_do_67 * 165.0;
   zon_do_17 = zon_do_16 ;
   zon_do_14=zon_do_67 * 100.0;
   zon_do_15=zon_do_67 * 190.0;
   zon_do_26 = 110.0 ;
   zon_do_27 = 195.0 ;
   zon_do_24 = 110.0 ;
   zon_do_25 = 195.0 ;
   zon_do_28 = 110.0 ;
   zon_do_29 = 195.0 ;
   zon_do_20 = 110.0 ;
   zon_do_21 = 195.0 ;
   zon_do_22 = 110.0 ;
   zon_do_23 = 195.0 ;
   return;
   }
  if ( mu_0 == 12 )
   {
   zon_bo_6 = iRSI(NULL,0,105,0,1)>50.0 && iRSI(NULL,0,105,0,2)<=50.0 ;
   zon_bo_7 = iRSI(NULL,0,105,0,1)<=50.0 && iRSI(NULL,0,105,0,2)>50.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=iATR(NULL,0,15,1) * 6.0;
   zon_do_17=iATR(NULL,0,15,1) * 6.0;
   zon_do_14=iATR(NULL,0,45,1) * 7.5;
   zon_do_15 = iATR(NULL,0,85,1) ;
   zon_do_26 = 50.0 ;
   zon_do_27 = 165.0 ;
   zon_do_24 = 50.0 ;
   zon_do_25 = 165.0 ;
   zon_do_28 = 50.0 ;
   zon_do_29 = 165.0 ;
   zon_do_20 = 50.0 ;
   zon_do_21 = 165.0 ;
   zon_do_22 = 50.0 ;
   zon_do_23 = 165.0 ;
   return;
   }
  if ( mu_0 == 13 )
   {
   zon_bo_6 = iBands(NULL,0,15,2.0,0,0,2,1)<=Close[1] && iBands(NULL,0,15,2.0,0,0,2,2)>Close[2] ;
   zon_bo_7 = iBands(NULL,0,15,2.0,0,0,1,1)>Close[1] && iBands(NULL,0,15,2.0,0,0,1,2)<=Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=iATR(NULL,0,180,1) * 25.0;
   zon_do_13=iATR(NULL,0,180,1) * 25.0;
   zon_do_16=iATR(NULL,0,55,1) * 9.5;
   zon_do_17=iATR(NULL,0,55,1) * 9.5;
   zon_do_14=zon_do_67 * 115.0;
   zon_do_15 = 0.0 ;
   zon_do_26 = 120.0 ;
   zon_do_27 = 185.0 ;
   zon_do_24 = 120.0 ;
   zon_do_25 = 185.0 ;
   zon_do_28 = 120.0 ;
   zon_do_29 = 185.0 ;
   zon_do_20 = 120.0 ;
   zon_do_21 = 185.0 ;
   zon_do_22 = 120.0 ;
   zon_do_23 = 185.0 ;
   return;
   }
  if ( mu_0 == 14 )
   {
   zon_bo_6 = iCCI(NULL,0,30,0,1)>0.0 && iCCI(NULL,0,30,0,2)<=0.0 ;
   zon_bo_7 = iCCI(NULL,0,30,0,1)<=0.0 && iCCI(NULL,0,30,0,2)>0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=iATR(NULL,0,85,1) * 5.0;
   zon_do_13=iATR(NULL,0,85,1) * 5.0;
   zon_do_16=iATR(NULL,0,80,1) * 22.5;
   zon_do_17=iATR(NULL,0,80,1) * 22.5;
   zon_do_14=zon_do_67 * 50.0;
   zon_do_15 = 0.0 ;
   zon_do_26 = 65.0 ;
   zon_do_27 = 185.0 ;
   zon_do_24 = 65.0 ;
   zon_do_25 = 185.0 ;
   zon_do_28 = 65.0 ;
   zon_do_29 = 185.0 ;
   zon_do_20 = 65.0 ;
   zon_do_21 = 185.0 ;
   zon_do_22 = 65.0 ;
   zon_do_23 = 185.0 ;
   return;
   }
  if ( mu_0 == 15 )
   {
   zon_bo_6 = iStochastic(NULL,0,40,1,3,0,0,1,1)<=30.0 && iStochastic(NULL,0,40,1,3,0,0,1,2)>30.0 ;
   zon_bo_7 = iStochastic(NULL,0,40,1,3,0,0,1,1)>70.0 && iStochastic(NULL,0,40,1,3,0,0,1,2)<=70.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iMA(NULL,0,80,0,MODE_EMA,PRICE_CLOSE,1) - iATR(NULL,0,130,1) * 15.5;
   zon_do_11=iMA(NULL,0,80,0,MODE_EMA,PRICE_CLOSE,1) + iATR(NULL,0,130,1) * 15.5;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=zon_do_67 * 150.0;
   zon_do_17 = zon_do_16 ;
   zon_do_14=zon_do_67 * 105.0;
   zon_do_15=iATR(NULL,0,120,1) * 12.0;
   zon_do_26 = 100.0 ;
   zon_do_27 = 185.0 ;
   zon_do_24 = 100.0 ;
   zon_do_25 = 185.0 ;
   zon_do_28 = 100.0 ;
   zon_do_29 = 185.0 ;
   zon_do_20 = 100.0 ;
   zon_do_21 = 185.0 ;
   zon_do_22 = 100.0 ;
   zon_do_23 = 185.0 ;
   return;
   }
  if ( mu_0 == 16 )
   {
   zon_bo_6 = iBands(NULL,0,45,1.0,0,0,2,1)>Close[1] && iBands(NULL,0,45,1.0,0,0,2,2)<=Close[2] ;
   zon_bo_7 = iBands(NULL,0,45,1.0,0,0,1,1)<=Close[1] && iBands(NULL,0,45,1.0,0,0,1,2)>Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=iATR(NULL,0,20,1) * 13.5;
   zon_do_17=iATR(NULL,0,20,1) * 13.5;
   zon_do_14=iATR(NULL,0,190,1) * 17.5;
   zon_do_15=iATR(NULL,0,180,1) * 4.5;
   zon_do_26 = 65.0 ;
   zon_do_27 = 180.0 ;
   zon_do_24 = 65.0 ;
   zon_do_25 = 180.0 ;
   zon_do_28 = 65.0 ;
   zon_do_29 = 180.0 ;
   zon_do_20 = 65.0 ;
   zon_do_21 = 180.0 ;
   zon_do_22 = 65.0 ;
   zon_do_23 = 180.0 ;
   return;
   }
  if ( mu_0 == 17 )
   {
   zon_bo_6 = iStochastic(NULL,0,40,1,3,0,0,1,1)<=50.0 && iStochastic(NULL,0,40,1,3,0,0,1,2)>50.0 ;
   zon_bo_7 = iStochastic(NULL,0,40,1,3,0,0,1,1)>50.0 && iStochastic(NULL,0,40,1,3,0,0,1,2)<=50.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iMA(NULL,0,170,0,MODE_EMA,PRICE_CLOSE,1) - zon_do_67 * 110.0;
   zon_do_11=iMA(NULL,0,170,0,MODE_EMA,PRICE_CLOSE,1) + zon_do_67 * 110.0;
   zon_do_12=iATR(NULL,0,25,1) * 23.0;
   zon_do_13=iATR(NULL,0,25,1) * 23.0;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=iATR(NULL,0,80,1) * 6.0;
   zon_do_15=zon_do_67 * 175.0;
   zon_do_26 = 150.0 ;
   zon_do_27 = 200.0 ;
   zon_do_24 = 150.0 ;
   zon_do_25 = 200.0 ;
   zon_do_28 = 150.0 ;
   zon_do_29 = 200.0 ;
   zon_do_20 = 150.0 ;
   zon_do_21 = 200.0 ;
   zon_do_22 = 150.0 ;
   zon_do_23 = 200.0 ;
   return;
   }
  if ( mu_0 == 18 )
   {
   zon_bo_6 = iCCI(NULL,0,25,0,1)>0.0 && iCCI(NULL,0,25,0,2)<=0.0 ;
   zon_bo_7 = iCCI(NULL,0,25,0,1)<=0.0 && iCCI(NULL,0,25,0,2)>0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=zon_do_67 * 185.0;
   zon_do_13 = zon_do_12 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=zon_do_67 * 30.0;
   zon_do_15 = 0.0 ;
   zon_do_26 = 110.0 ;
   zon_do_27 = 140.0 ;
   zon_do_24 = 110.0 ;
   zon_do_25 = 140.0 ;
   zon_do_28 = 110.0 ;
   zon_do_29 = 140.0 ;
   zon_do_20 = 110.0 ;
   zon_do_21 = 140.0 ;
   zon_do_22 = 110.0 ;
   zon_do_23 = 140.0 ;
   return;
   }
  if ( mu_0 == 19 )
   {
   zon_bo_6 = iBands(NULL,0,15,2.0,0,0,2,1)<=Close[1] && iBands(NULL,0,15,2.0,0,0,2,2)>Close[2] ;
   zon_bo_7 = iBands(NULL,0,15,2.0,0,0,1,1)>Close[1] && iBands(NULL,0,15,2.0,0,0,1,2)<=Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=iATR(NULL,0,180,1) * 25.0;
   zon_do_13=iATR(NULL,0,180,1) * 25.0;
   zon_do_16=iATR(NULL,0,55,1) * 9.5;
   zon_do_17=iATR(NULL,0,55,1) * 9.5;
   zon_do_14=zon_do_67 * 115.0;
   zon_do_15 = 0.0 ;
   zon_do_26 = 120.0 ;
   zon_do_27 = 185.0 ;
   zon_do_24 = 120.0 ;
   zon_do_25 = 185.0 ;
   zon_do_28 = 120.0 ;
   zon_do_29 = 185.0 ;
   zon_do_20 = 120.0 ;
   zon_do_21 = 185.0 ;
   zon_do_22 = 120.0 ;
   zon_do_23 = 185.0 ;
   return;
   }
  if (mu_0 != 20)  return;
  zon_bo_6 = iStochastic(NULL,0,40,1,3,0,0,1,1)<=50.0 && iStochastic(NULL,0,40,1,3,0,0,1,2)>50.0 ;
  zon_bo_7 = iStochastic(NULL,0,40,1,3,0,0,1,1)>50.0 && iStochastic(NULL,0,40,1,3,0,0,1,2)<=50.0 ;
  zon_in_18 = 0 ;
  zon_do_8 = 0.0 ;
  zon_do_9 = 0.0 ;
  zon_do_10=iMA(NULL,0,170,0,MODE_EMA,PRICE_CLOSE,1) - zon_do_67 * 110.0;
  zon_do_11=iMA(NULL,0,170,0,MODE_EMA,PRICE_CLOSE,1) + zon_do_67 * 110.0;
  zon_do_12=iATR(NULL,0,25,1) * 23.0;
  zon_do_13=iATR(NULL,0,25,1) * 23.0;
  zon_do_16 = 0.0 ;
  zon_do_17 = 0.0 ;
  zon_do_14=iATR(NULL,0,80,1) * 6.0;
  zon_do_15=zon_do_67 * 175.0;
  zon_do_26 = 150.0 ;
  zon_do_27 = 200.0 ;
  zon_do_24 = 150.0 ;
  zon_do_25 = 200.0 ;
  zon_do_28 = 150.0 ;
  zon_do_29 = 200.0 ;
  zon_do_20 = 150.0 ;
  zon_do_21 = 200.0 ;
  zon_do_22 = 150.0 ;
  zon_do_23 = 200.0 ;
  return;
  }
 */ 
// if ( StringFind(zi_st_1,"EURGBP",0) >= 0 && Period() == 60 )
if (EURGBP)
  {
  if ( mu_0 == 1 )
   {
   zon_bo_6 = iStochastic(NULL,0,15,1,3,0,0,1,1)>80.0 && iStochastic(NULL,0,15,1,3,0,0,1,2)<=80.0 ;
   zon_bo_7 = iStochastic(NULL,0,15,1,3,0,0,1,1)<=20.0 && iStochastic(NULL,0,15,1,3,0,0,1,2)>20.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=zon_do_67 * 55.0;
   zon_do_17 = zon_do_16 ;
   zon_do_14=iATR(NULL,0,90,1) * 22.0;
   zon_do_15=zon_do_67 * 95.0;
   zon_do_26 = 60.0 ;
   zon_do_27 = 110.0 ;
   zon_do_24 = 60.0 ;
   zon_do_25 = 110.0 ;
   zon_do_28 = 60.0 ;
   zon_do_29 = 110.0 ;
   zon_do_20 = 60.0 ;
   zon_do_21 = 110.0 ;
   zon_do_22 = 60.0 ;
   zon_do_23 = 110.0 ;
   return;
   }
  if ( mu_0 == 2 )
   {
   zon_bo_6 = iMACD(NULL,0,55,100,1,PRICE_CLOSE,0,1)>0.0 && iMACD(NULL,0,55,100,1,PRICE_CLOSE,0,2)<=0.0 ;
   zon_bo_7 = iMACD(NULL,0,55,100,1,PRICE_CLOSE,0,1)<=0.0 && iMACD(NULL,0,55,100,1,PRICE_CLOSE,0,2)>0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=iATR(NULL,0,110,1) * 5.5;
   zon_do_13=iATR(NULL,0,110,1) * 5.5;
   zon_do_16=iATR(NULL,0,5,1) * 6.0;
   zon_do_17=iATR(NULL,0,5,1) * 6.0;
   zon_do_14 = iATR(NULL,0,30,1) ;
   zon_do_15=iATR(NULL,0,50,1) * 6.0;
   zon_do_26 = 45.0 ;
   zon_do_27 = 170.0 ;
   zon_do_24 = 45.0 ;
   zon_do_25 = 170.0 ;
   zon_do_28 = 45.0 ;
   zon_do_29 = 170.0 ;
   zon_do_20 = 45.0 ;
   zon_do_21 = 170.0 ;
   zon_do_22 = 45.0 ;
   zon_do_23 = 170.0 ;
   return;
   }
  if ( mu_0 == 3 )
   {
   zon_bo_6 = iMACD(NULL,0,5,35,1,PRICE_CLOSE,0,1)>0.0 && iMACD(NULL,0,5,35,1,PRICE_CLOSE,0,2)<=0.0 ;
   zon_bo_7 = iMACD(NULL,0,5,35,1,PRICE_CLOSE,0,1)<=0.0 && iMACD(NULL,0,5,35,1,PRICE_CLOSE,0,2)>0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iBands(NULL,0,60,1.0,0,0,1,1) - iATR(NULL,0,80,1) * 17.0;
   zon_do_11=iBands(NULL,0,60,1.0,0,0,2,1) + iATR(NULL,0,80,1) * 17.0;
   zon_do_12=iATR(NULL,0,85,1) * 5.5;
   zon_do_13=iATR(NULL,0,85,1) * 5.5;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=zon_do_67 * 10.0;
   zon_do_15 = 0.0 ;
   zon_do_26 = 80.0 ;
   zon_do_27 = 190.0 ;
   zon_do_24 = 80.0 ;
   zon_do_25 = 190.0 ;
   zon_do_28 = 80.0 ;
   zon_do_29 = 190.0 ;
   zon_do_20 = 80.0 ;
   zon_do_21 = 190.0 ;
   zon_do_22 = 80.0 ;
   zon_do_23 = 190.0 ;
   return;
   }
  if ( mu_0 == 4 )
   {
   zon_bo_6 = iCCI(NULL,0,70,0,1)>0.0 && iCCI(NULL,0,70,0,2)<=0.0 ;
   zon_bo_7 = iCCI(NULL,0,70,0,1)<=0.0 && iCCI(NULL,0,70,0,2)>0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=iATR(NULL,0,40,1) * 6.0;
   zon_do_13=iATR(NULL,0,40,1) * 6.0;
   zon_do_16=iATR(NULL,0,30,1) * 20.0;
   zon_do_17=iATR(NULL,0,30,1) * 20.0;
   zon_do_14=zon_do_67 * 200.0;
   zon_do_15 = 0.0 ;
   zon_do_26 = 80.0 ;
   zon_do_27 = 95.0 ;
   zon_do_24 = 80.0 ;
   zon_do_25 = 95.0 ;
   zon_do_28 = 80.0 ;
   zon_do_29 = 95.0 ;
   zon_do_20 = 80.0 ;
   zon_do_21 = 95.0 ;
   zon_do_22 = 80.0 ;
   zon_do_23 = 95.0 ;
   return;
   }
  if ( mu_0 == 5 )
   {
   zon_bo_6 = iCCI(NULL,0,80,0,1)>0.0 && iCCI(NULL,0,80,0,2)<=0.0 ;
   zon_bo_7 = iCCI(NULL,0,80,0,1)<=0.0 && iCCI(NULL,0,80,0,2)>0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iMA(NULL,0,130,0,MODE_EMA,PRICE_CLOSE,1) - iATR(NULL,0,120,1) * 24.0;
   zon_do_11=iMA(NULL,0,130,0,MODE_EMA,PRICE_CLOSE,1) + iATR(NULL,0,120,1) * 24.0;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=zon_do_67 * 115.0;
   zon_do_17 = zon_do_16 ;
   zon_do_14=zon_do_67 * 40.0;
   zon_do_15=iATR(NULL,0,65,1) * 7.5;
   zon_do_26 = 10.0 ;
   zon_do_27 = 125.0 ;
   zon_do_24 = 10.0 ;
   zon_do_25 = 125.0 ;
   zon_do_28 = 10.0 ;
   zon_do_29 = 125.0 ;
   zon_do_20 = 10.0 ;
   zon_do_21 = 125.0 ;
   zon_do_22 = 10.0 ;
   zon_do_23 = 125.0 ;
   return;
   }
  if ( mu_0 == 6 )
   {
   zon_bo_6 = iStochastic(NULL,0,105,1,3,0,0,1,1)>70.0 && iStochastic(NULL,0,105,1,3,0,0,1,2)<=70.0 ;
   zon_bo_7 = iStochastic(NULL,0,105,1,3,0,0,1,1)<=30.0 && iStochastic(NULL,0,105,1,3,0,0,1,2)>30.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=zon_do_67 * 130.0;
   zon_do_13 = zon_do_12 ;
   zon_do_16=iATR(NULL,0,120,1) * 20.5;
   zon_do_17=iATR(NULL,0,120,1) * 20.5;
   zon_do_14=iATR(NULL,0,190,1) * 23.5;
   zon_do_15=zon_do_67 * 40.0;
   zon_do_26 = 40.0 ;
   zon_do_27 = 160.0 ;
   zon_do_24 = 40.0 ;
   zon_do_25 = 160.0 ;
   zon_do_28 = 40.0 ;
   zon_do_29 = 160.0 ;
   zon_do_20 = 40.0 ;
   zon_do_21 = 160.0 ;
   zon_do_22 = 40.0 ;
   zon_do_23 = 160.0 ;
   return;
   }
  if ( mu_0 == 7 )
   {
   zon_bo_6 = iBands(NULL,0,45,2.0,0,0,2,1)<=Close[1] && iBands(NULL,0,45,2.0,0,0,2,2)>Close[2] ;
   zon_bo_7 = iBands(NULL,0,45,2.0,0,0,1,1)>Close[1] && iBands(NULL,0,45,2.0,0,0,1,2)<=Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iMA(NULL,0,110,0,MODE_SMA,PRICE_CLOSE,1) + zon_do_67 * 75.0;
   zon_do_11=iMA(NULL,0,110,0,MODE_SMA,PRICE_CLOSE,1) - zon_do_67 * 75.0;
   zon_do_12=zon_do_67 * 100.0;
   zon_do_13 = zon_do_12 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=iATR(NULL,0,90,1) * 7.0;
   zon_do_15=zon_do_67 * 50.0;
   zon_do_26 = 85.0 ;
   zon_do_27 = 145.0 ;
   zon_do_24 = 85.0 ;
   zon_do_25 = 145.0 ;
   zon_do_28 = 85.0 ;
   zon_do_29 = 145.0 ;
   zon_do_20 = 85.0 ;
   zon_do_21 = 145.0 ;
   zon_do_22 = 85.0 ;
   zon_do_23 = 145.0 ;
   return;
   }
  if ( mu_0 == 8 )
   {
   zon_bo_6 = iStochastic(NULL,0,30,1,3,0,0,1,1)<=20.0 && iStochastic(NULL,0,30,1,3,0,0,1,2)>20.0 ;
   zon_bo_7 = iStochastic(NULL,0,30,1,3,0,0,1,1)>80.0 && iStochastic(NULL,0,30,1,3,0,0,1,2)<=80.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iBands(NULL,0,145,2.0,0,0,2,1) + iATR(NULL,0,70,1) * 14.5;
   zon_do_11=iBands(NULL,0,145,2.0,0,0,1,1) - iATR(NULL,0,70,1) * 14.5;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=zon_do_67 * 10.0;
   zon_do_15 = 0.0 ;
   zon_do_26 = 55.0 ;
   zon_do_27 = 75.0 ;
   zon_do_24 = 55.0 ;
   zon_do_25 = 75.0 ;
   zon_do_28 = 55.0 ;
   zon_do_29 = 75.0 ;
   zon_do_20 = 55.0 ;
   zon_do_21 = 75.0 ;
   zon_do_22 = 55.0 ;
   zon_do_23 = 75.0 ;
   return;
   }
  if ( mu_0 == 9 )
   {
   zon_bo_6 = iRSI(NULL,0,100,0,1)>50.0 && iRSI(NULL,0,100,0,2)<=50.0 ;
   zon_bo_7 = iRSI(NULL,0,100,0,1)<=50.0 && iRSI(NULL,0,100,0,2)>50.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iMA(NULL,0,190,0,MODE_SMA,PRICE_CLOSE,1) - iATR(NULL,0,150,1) * 11.0;
   zon_do_11=iMA(NULL,0,190,0,MODE_SMA,PRICE_CLOSE,1) + iATR(NULL,0,150,1) * 11.0;
   zon_do_12=iATR(NULL,0,85,1) * 22.5;
   zon_do_13=iATR(NULL,0,85,1) * 22.5;
   zon_do_16=zon_do_67 * 25.0;
   zon_do_17 = zon_do_16 ;
   zon_do_14=iATR(NULL,0,55,1) * 3.0;
   zon_do_15=zon_do_67 * 110.0;
   zon_do_26 = 25.0 ;
   zon_do_27 = 110.0 ;
   zon_do_24 = 25.0 ;
   zon_do_25 = 110.0 ;
   zon_do_28 = 25.0 ;
   zon_do_29 = 110.0 ;
   zon_do_20 = 25.0 ;
   zon_do_21 = 110.0 ;
   zon_do_22 = 25.0 ;
   zon_do_23 = 110.0 ;
   return;
   }
  if ( mu_0 == 10 )
   {
   zon_bo_6 = iMACD(NULL,0,5,35,1,PRICE_CLOSE,0,1)>0.0 && iMACD(NULL,0,5,35,1,PRICE_CLOSE,0,2)<=0.0 ;
   zon_bo_7 = iMACD(NULL,0,5,35,1,PRICE_CLOSE,0,1)<=0.0 && iMACD(NULL,0,5,35,1,PRICE_CLOSE,0,2)>0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iBands(NULL,0,60,1.0,0,0,1,1) - iATR(NULL,0,80,1) * 17.0;
   zon_do_11=iBands(NULL,0,60,1.0,0,0,2,1) + iATR(NULL,0,80,1) * 17.0;
   zon_do_12=iATR(NULL,0,85,1) * 5.5;
   zon_do_13=iATR(NULL,0,85,1) * 5.5;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=zon_do_67 * 10.0;
   zon_do_15 = 0.0 ;
   zon_do_26 = 80.0 ;
   zon_do_27 = 190.0 ;
   zon_do_24 = 80.0 ;
   zon_do_25 = 190.0 ;
   zon_do_28 = 80.0 ;
   zon_do_29 = 190.0 ;
   zon_do_20 = 80.0 ;
   zon_do_21 = 190.0 ;
   zon_do_22 = 80.0 ;
   zon_do_23 = 190.0 ;
   return;
   }
  if ( mu_0 == 11 )
   {
   zon_bo_6 = iMACD(NULL,0,5,25,1,PRICE_CLOSE,0,1)>0.0 && iMACD(NULL,0,5,25,1,PRICE_CLOSE,0,2)<=0.0 ;
   zon_bo_7 = iMACD(NULL,0,5,25,1,PRICE_CLOSE,0,1)<=0.0 && iMACD(NULL,0,5,25,1,PRICE_CLOSE,0,2)>0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=iATR(NULL,0,5,1) * 6.0;
   zon_do_13=iATR(NULL,0,5,1) * 6.0;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14 = iATR(NULL,0,5,1) ;
   zon_do_15 = 0.0 ;
   zon_do_26 = 75.0 ;
   zon_do_27 = 80.0 ;
   zon_do_24 = 75.0 ;
   zon_do_25 = 80.0 ;
   zon_do_28 = 75.0 ;
   zon_do_29 = 80.0 ;
   zon_do_20 = 75.0 ;
   zon_do_21 = 80.0 ;
   zon_do_22 = 75.0 ;
   zon_do_23 = 80.0 ;
   return;
   }
  if ( mu_0 == 12 )
   {
   zon_bo_6 = iCCI(NULL,0,35,0,1)>0.0 && iCCI(NULL,0,35,0,2)<=0.0 ;
   zon_bo_7 = iCCI(NULL,0,35,0,1)<=0.0 && iCCI(NULL,0,35,0,2)>0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=iATR(NULL,0,65,1) * 6.5;
   zon_do_13=iATR(NULL,0,65,1) * 6.5;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=iATR(NULL,0,200,1) * 25.0;
   zon_do_15=iATR(NULL,0,5,1) * 7.5;
   zon_do_26 = 60.0 ;
   zon_do_27 = 190.0 ;
   zon_do_24 = 60.0 ;
   zon_do_25 = 190.0 ;
   zon_do_28 = 60.0 ;
   zon_do_29 = 190.0 ;
   zon_do_20 = 60.0 ;
   zon_do_21 = 190.0 ;
   zon_do_22 = 60.0 ;
   zon_do_23 = 190.0 ;
   return;
   }
  if ( mu_0 == 13 )
   {
   zon_bo_6 = iBands(NULL,0,40,2.0,0,0,2,1)>Close[1] && iBands(NULL,0,40,2.0,0,0,2,2)<=Close[2] ;
   zon_bo_7 = iBands(NULL,0,40,2.0,0,0,1,1)<=Close[1] && iBands(NULL,0,40,2.0,0,0,1,2)>Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=zon_do_67 * 185.0;
   zon_do_13 = zon_do_12 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=iATR(NULL,0,120,1) * 21.5;
   zon_do_15=zon_do_67 * 85.0;
   zon_do_26 = 90.0 ;
   zon_do_27 = 100.0 ;
   zon_do_24 = 90.0 ;
   zon_do_25 = 100.0 ;
   zon_do_28 = 90.0 ;
   zon_do_29 = 100.0 ;
   zon_do_20 = 90.0 ;
   zon_do_21 = 100.0 ;
   zon_do_22 = 90.0 ;
   zon_do_23 = 100.0 ;
   return;
   }
  if ( mu_0 == 14 )
   {
   zon_bo_6 = iStochastic(NULL,0,20,1,3,0,0,1,1)>70.0 && iStochastic(NULL,0,20,1,3,0,0,1,2)<=70.0 ;
   zon_bo_7 = iStochastic(NULL,0,20,1,3,0,0,1,1)<=30.0 && iStochastic(NULL,0,20,1,3,0,0,1,2)>30.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iBands(NULL,0,35,1.0,0,0,1,1) - iATR(NULL,0,160,1) * 20.0;
   zon_do_11=iBands(NULL,0,35,1.0,0,0,2,1) + iATR(NULL,0,160,1) * 20.0;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=iATR(NULL,0,80,1) * 22.0;
   zon_do_15=iATR(NULL,0,150,1) * 4.0;
   zon_do_26 = 55.0 ;
   zon_do_27 = 120.0 ;
   zon_do_24 = 55.0 ;
   zon_do_25 = 120.0 ;
   zon_do_28 = 55.0 ;
   zon_do_29 = 120.0 ;
   zon_do_20 = 55.0 ;
   zon_do_21 = 120.0 ;
   zon_do_22 = 55.0 ;
   zon_do_23 = 120.0 ;
   return;
   }
  if ( mu_0 == 15 )
   {
   zon_bo_6 = iRSI(NULL,0,115,0,1)>50.0 && iRSI(NULL,0,115,0,2)<=50.0 ;
   zon_bo_7 = iRSI(NULL,0,115,0,1)<=50.0 && iRSI(NULL,0,115,0,2)>50.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iMA(NULL,0,160,0,MODE_SMA,PRICE_CLOSE,1) - zon_do_67 * 10.0;
   zon_do_11=iMA(NULL,0,160,0,MODE_SMA,PRICE_CLOSE,1) + zon_do_67 * 10.0;
   zon_do_12=iATR(NULL,0,80,1) * 9.0;
   zon_do_13=iATR(NULL,0,80,1) * 9.0;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=zon_do_67 * 100.0;
   zon_do_15=iATR(NULL,0,15,1) * 1.5;
   zon_do_26 = 20.0 ;
   zon_do_27 = 135.0 ;
   zon_do_24 = 20.0 ;
   zon_do_25 = 135.0 ;
   zon_do_28 = 20.0 ;
   zon_do_29 = 135.0 ;
   zon_do_20 = 20.0 ;
   zon_do_21 = 135.0 ;
   zon_do_22 = 20.0 ;
   zon_do_23 = 135.0 ;
   return;
   }
  if ( mu_0 == 16 )
   {
   zon_bo_6 = iCCI(NULL,0,15,0,1)<=0.0 && iCCI(NULL,0,15,0,2)>0.0 ;
   zon_bo_7 = iCCI(NULL,0,15,0,1)>0.0 && iCCI(NULL,0,15,0,2)<=0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=zon_do_67 * 50.0;
   zon_do_17 = zon_do_16 ;
   zon_do_14=iATR(NULL,0,35,1) * 9.5;
   zon_do_15 = iATR(NULL,0,45,1) ;
   zon_do_26 = 100.0 ;
   zon_do_27 = 105.0 ;
   zon_do_24 = 100.0 ;
   zon_do_25 = 105.0 ;
   zon_do_28 = 100.0 ;
   zon_do_29 = 105.0 ;
   zon_do_20 = 100.0 ;
   zon_do_21 = 105.0 ;
   zon_do_22 = 100.0 ;
   zon_do_23 = 105.0 ;
   return;
   }
  if ( mu_0 == 17 )
   {
   zon_bo_6 = iMACD(NULL,0,40,160,1,PRICE_CLOSE,0,1)>0.0 && iMACD(NULL,0,40,160,1,PRICE_CLOSE,0,2)<=0.0 ;
   zon_bo_7 = iMACD(NULL,0,40,160,1,PRICE_CLOSE,0,1)<=0.0 && iMACD(NULL,0,40,160,1,PRICE_CLOSE,0,2)>0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=zon_do_67 * 185.0;
   zon_do_13 = zon_do_12 ;
   zon_do_16=zon_do_67 * 190.0;
   zon_do_17 = zon_do_16 ;
   zon_do_14=iATR(NULL,0,60,1) * 4.0;
   zon_do_15=zon_do_67 * 35.0;
   zon_do_26 = 30.0 ;
   zon_do_27 = 190.0 ;
   zon_do_24 = 30.0 ;
   zon_do_25 = 190.0 ;
   zon_do_28 = 30.0 ;
   zon_do_29 = 190.0 ;
   zon_do_20 = 30.0 ;
   zon_do_21 = 190.0 ;
   zon_do_22 = 30.0 ;
   zon_do_23 = 190.0 ;
   return;
   }
  if ( mu_0 == 18 )
   {
   zon_bo_6 = iStochastic(NULL,0,25,1,3,0,0,1,1)<=30.0 && iStochastic(NULL,0,25,1,3,0,0,1,2)>30.0 ;
   zon_bo_7 = iStochastic(NULL,0,25,1,3,0,0,1,1)>70.0 && iStochastic(NULL,0,25,1,3,0,0,1,2)<=70.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=zon_do_67 * 115.0;
   zon_do_13 = zon_do_12 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=iATR(NULL,0,25,1) * 9.5;
   zon_do_15=zon_do_67 * 60.0;
   zon_do_26 = 25.0 ;
   zon_do_27 = 145.0 ;
   zon_do_24 = 25.0 ;
   zon_do_25 = 145.0 ;
   zon_do_28 = 25.0 ;
   zon_do_29 = 145.0 ;
   zon_do_20 = 25.0 ;
   zon_do_21 = 145.0 ;
   zon_do_22 = 25.0 ;
   zon_do_23 = 145.0 ;
   return;
   }
  if ( mu_0 == 19 )
   {
   zon_bo_6 = iStochastic(NULL,0,85,1,3,0,0,1,1)>70.0 && iStochastic(NULL,0,85,1,3,0,0,1,2)<=70.0 ;
   zon_bo_7 = iStochastic(NULL,0,85,1,3,0,0,1,1)<=30.0 && iStochastic(NULL,0,85,1,3,0,0,1,2)>30.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=zon_do_67 * 100.0;
   zon_do_17 = zon_do_16 ;
   zon_do_14=iATR(NULL,0,95,1) * 19.5;
   zon_do_15=iATR(NULL,0,120,1) * 0.5;
   zon_do_26 = 35.0 ;
   zon_do_27 = 145.0 ;
   zon_do_24 = 35.0 ;
   zon_do_25 = 145.0 ;
   zon_do_28 = 35.0 ;
   zon_do_29 = 145.0 ;
   zon_do_20 = 35.0 ;
   zon_do_21 = 145.0 ;
   zon_do_22 = 35.0 ;
   zon_do_23 = 145.0 ;
   return;
   }
  if (mu_0 != 20)  return;
  zon_bo_6 = iStochastic(NULL,0,25,1,3,0,0,1,1)>50.0 && iStochastic(NULL,0,25,1,3,0,0,1,2)<=50.0 ;
  zon_bo_7 = iStochastic(NULL,0,25,1,3,0,0,1,1)<=50.0 && iStochastic(NULL,0,25,1,3,0,0,1,2)>50.0 ;
  zon_in_18 = 0 ;
  zon_do_8 = 0.0 ;
  zon_do_9 = 0.0 ;
  zon_do_10 = 0.0 ;
  zon_do_11 = 0.0 ;
  zon_do_12 = 0.0 ;
  zon_do_13 = 0.0 ;
  zon_do_16=zon_do_67 * 165.0;
  zon_do_17 = zon_do_16 ;
  zon_do_14=iATR(NULL,0,85,1) * 13.0;
  zon_do_15=iATR(NULL,0,100,1) * 3.0;
  zon_do_26 = 40.0 ;
  zon_do_27 = 170.0 ;
  zon_do_24 = 40.0 ;
  zon_do_25 = 170.0 ;
  zon_do_28 = 40.0 ;
  zon_do_29 = 170.0 ;
  zon_do_20 = 40.0 ;
  zon_do_21 = 170.0 ;
  zon_do_22 = 40.0 ;
  zon_do_23 = 170.0 ;
  return;
  }
/* if ( StringFind(zi_st_1,"NZDUSD",0) >= 0 && Period() == 60 )
  {
  if ( mu_0 == 1 )
   {
   zon_bo_6 = iMACD(NULL,0,55,160,1,PRICE_CLOSE,0,1)>0.0 && iMACD(NULL,0,55,160,1,PRICE_CLOSE,0,2)<=0.0 ;
   zon_bo_7 = iMACD(NULL,0,55,160,1,PRICE_CLOSE,0,1)<=0.0 && iMACD(NULL,0,55,160,1,PRICE_CLOSE,0,2)>0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iMA(NULL,0,160,0,MODE_SMA,PRICE_CLOSE,1) - iATR(NULL,0,95,1) * 8.5;
   zon_do_11=iMA(NULL,0,160,0,MODE_SMA,PRICE_CLOSE,1) + iATR(NULL,0,95,1) * 8.5;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=zon_do_67 * 20.0;
   zon_do_15 = 0.0 ;
   zon_do_26 = 30.0 ;
   zon_do_27 = 125.0 ;
   zon_do_24 = 30.0 ;
   zon_do_25 = 125.0 ;
   zon_do_28 = 30.0 ;
   zon_do_29 = 125.0 ;
   zon_do_20 = 30.0 ;
   zon_do_21 = 125.0 ;
   zon_do_22 = 30.0 ;
   zon_do_23 = 125.0 ;
   return;
   }
  if ( mu_0 == 2 )
   {
   zon_bo_6 = iBands(NULL,0,50,2.0,0,0,2,1)<=Close[1] && iBands(NULL,0,50,2.0,0,0,2,2)>Close[2] ;
   zon_bo_7 = iBands(NULL,0,50,2.0,0,0,1,1)>Close[1] && iBands(NULL,0,50,2.0,0,0,1,2)<=Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=iATR(NULL,0,30,1) * 5.0;
   zon_do_17=iATR(NULL,0,30,1) * 5.0;
   zon_do_14=zon_do_67 * 175.0;
   zon_do_15=iATR(NULL,0,15,1) * 6.0;
   zon_do_26 = 20.0 ;
   zon_do_27 = 145.0 ;
   zon_do_24 = 20.0 ;
   zon_do_25 = 145.0 ;
   zon_do_28 = 20.0 ;
   zon_do_29 = 145.0 ;
   zon_do_20 = 20.0 ;
   zon_do_21 = 145.0 ;
   zon_do_22 = 20.0 ;
   zon_do_23 = 145.0 ;
   return;
   }
  if ( mu_0 == 3 )
   {
   zon_bo_6 = iRSI(NULL,0,55,0,1)<=50.0 && iRSI(NULL,0,55,0,2)>50.0 ;
   zon_bo_7 = iRSI(NULL,0,55,0,1)>50.0 && iRSI(NULL,0,55,0,2)<=50.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=iATR(NULL,0,5,1) * 13.5;
   zon_do_13=iATR(NULL,0,5,1) * 13.5;
   zon_do_16=iATR(NULL,0,15,1) * 7.5;
   zon_do_17=iATR(NULL,0,15,1) * 7.5;
   zon_do_14=zon_do_67 * 185.0;
   zon_do_15=zon_do_67 * 80.0;
   zon_do_26 = 100.0 ;
   zon_do_27 = 145.0 ;
   zon_do_24 = 100.0 ;
   zon_do_25 = 145.0 ;
   zon_do_28 = 100.0 ;
   zon_do_29 = 145.0 ;
   zon_do_20 = 100.0 ;
   zon_do_21 = 145.0 ;
   zon_do_22 = 100.0 ;
   zon_do_23 = 145.0 ;
   return;
   }
  if ( mu_0 == 4 )
   {
   zon_bo_6 = iMACD(NULL,0,10,220,1,PRICE_CLOSE,0,1)>0.0 && iMACD(NULL,0,10,220,1,PRICE_CLOSE,0,2)<=0.0 ;
   zon_bo_7 = iMACD(NULL,0,10,220,1,PRICE_CLOSE,0,1)<=0.0 && iMACD(NULL,0,10,220,1,PRICE_CLOSE,0,2)>0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iMA(NULL,0,100,0,MODE_EMA,PRICE_CLOSE,1) - iATR(NULL,0,85,1) * 23.0;
   zon_do_11=iMA(NULL,0,100,0,MODE_EMA,PRICE_CLOSE,1) + iATR(NULL,0,85,1) * 23.0;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=zon_do_67 * 90.0;
   zon_do_17 = zon_do_16 ;
   zon_do_14=zon_do_67 * 20.0;
   zon_do_15=zon_do_67 * 180.0;
   zon_do_26 = 30.0 ;
   zon_do_27 = 185.0 ;
   zon_do_24 = 30.0 ;
   zon_do_25 = 185.0 ;
   zon_do_28 = 30.0 ;
   zon_do_29 = 185.0 ;
   zon_do_20 = 30.0 ;
   zon_do_21 = 185.0 ;
   zon_do_22 = 30.0 ;
   zon_do_23 = 185.0 ;
   return;
   }
  if ( mu_0 == 5 )
   {
   zon_bo_6 = iStochastic(NULL,0,30,1,3,0,0,1,1)<=20.0 && iStochastic(NULL,0,30,1,3,0,0,1,2)>20.0 ;
   zon_bo_7 = iStochastic(NULL,0,30,1,3,0,0,1,1)>80.0 && iStochastic(NULL,0,30,1,3,0,0,1,2)<=80.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=zon_do_67 * 40.0;
   zon_do_17 = zon_do_16 ;
   zon_do_14=iATR(NULL,0,160,1) * 7.5;
   zon_do_15=zon_do_67 * 85.0;
   zon_do_26 = 70.0 ;
   zon_do_27 = 195.0 ;
   zon_do_24 = 70.0 ;
   zon_do_25 = 195.0 ;
   zon_do_28 = 70.0 ;
   zon_do_29 = 195.0 ;
   zon_do_20 = 70.0 ;
   zon_do_21 = 195.0 ;
   zon_do_22 = 70.0 ;
   zon_do_23 = 195.0 ;
   return;
   }
  if ( mu_0 == 6 )
   {
   zon_bo_6 = iRSI(NULL,0,30,0,1)<=50.0 && iRSI(NULL,0,30,0,2)>50.0 ;
   zon_bo_7 = iRSI(NULL,0,30,0,1)>50.0 && iRSI(NULL,0,30,0,2)<=50.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=iATR(NULL,0,160,1) * 19.0;
   zon_do_17=iATR(NULL,0,160,1) * 19.0;
   zon_do_14=iATR(NULL,0,35,1) * 6.5;
   zon_do_15=iATR(NULL,0,70,1) * 7.0;
   zon_do_26 = 50.0 ;
   zon_do_27 = 140.0 ;
   zon_do_24 = 50.0 ;
   zon_do_25 = 140.0 ;
   zon_do_28 = 50.0 ;
   zon_do_29 = 140.0 ;
   zon_do_20 = 50.0 ;
   zon_do_21 = 140.0 ;
   zon_do_22 = 50.0 ;
   zon_do_23 = 140.0 ;
   return;
   }
  if ( mu_0 == 7 )
   {
   zon_bo_6 = iBands(NULL,0,75,2.0,0,0,1,1)>Close[1] && iBands(NULL,0,75,2.0,0,0,1,2)<=Close[2] ;
   zon_bo_7 = iBands(NULL,0,75,2.0,0,0,2,1)<=Close[1] && iBands(NULL,0,75,2.0,0,0,2,2)>Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=iATR(NULL,0,55,1) * 14.0;
   zon_do_15=zon_do_67 * 85.0;
   zon_do_26 = 35.0 ;
   zon_do_27 = 170.0 ;
   zon_do_24 = 35.0 ;
   zon_do_25 = 170.0 ;
   zon_do_28 = 35.0 ;
   zon_do_29 = 170.0 ;
   zon_do_20 = 35.0 ;
   zon_do_21 = 170.0 ;
   zon_do_22 = 35.0 ;
   zon_do_23 = 170.0 ;
   return;
   }
  if ( mu_0 == 8 )
   {
   zon_bo_6 = iCCI(NULL,0,20,0,1)<=0.0 && iCCI(NULL,0,20,0,2)>0.0 ;
   zon_bo_7 = iCCI(NULL,0,20,0,1)>0.0 && iCCI(NULL,0,20,0,2)<=0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=zon_do_67 * 20.0;
   zon_do_15=iATR(NULL,0,35,1) * 13.5;
   zon_do_26 = 85.0 ;
   zon_do_27 = 195.0 ;
   zon_do_24 = 85.0 ;
   zon_do_25 = 195.0 ;
   zon_do_28 = 85.0 ;
   zon_do_29 = 195.0 ;
   zon_do_20 = 85.0 ;
   zon_do_21 = 195.0 ;
   zon_do_22 = 85.0 ;
   zon_do_23 = 195.0 ;
   return;
   }
  if ( mu_0 == 9 )
   {
   zon_bo_6 = iStochastic(NULL,0,25,1,3,0,0,1,1)<=30.0 && iStochastic(NULL,0,25,1,3,0,0,1,2)>30.0 ;
   zon_bo_7 = iStochastic(NULL,0,25,1,3,0,0,1,1)>70.0 && iStochastic(NULL,0,25,1,3,0,0,1,2)<=70.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=zon_do_67 * 40.0;
   zon_do_13 = zon_do_12 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=iATR(NULL,0,110,1) * 7.0;
   zon_do_15=zon_do_67 * 165.0;
   zon_do_26 = 95.0 ;
   zon_do_27 = 190.0 ;
   zon_do_24 = 95.0 ;
   zon_do_25 = 190.0 ;
   zon_do_28 = 95.0 ;
   zon_do_29 = 190.0 ;
   zon_do_20 = 95.0 ;
   zon_do_21 = 190.0 ;
   zon_do_22 = 95.0 ;
   zon_do_23 = 190.0 ;
   return;
   }
  if ( mu_0 == 10 )
   {
   zon_bo_6 = iCCI(NULL,0,20,0,1)<=0.0 && iCCI(NULL,0,20,0,2)>0.0 ;
   zon_bo_7 = iCCI(NULL,0,20,0,1)>0.0 && iCCI(NULL,0,20,0,2)<=0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=zon_do_67 * 20.0;
   zon_do_15=iATR(NULL,0,35,1) * 13.5;
   zon_do_26 = 85.0 ;
   zon_do_27 = 195.0 ;
   zon_do_24 = 85.0 ;
   zon_do_25 = 195.0 ;
   zon_do_28 = 85.0 ;
   zon_do_29 = 195.0 ;
   zon_do_20 = 85.0 ;
   zon_do_21 = 195.0 ;
   zon_do_22 = 85.0 ;
   zon_do_23 = 195.0 ;
   return;
   }
  if ( mu_0 == 11 )
   {
   zon_bo_6 = iStochastic(NULL,0,25,1,3,0,0,1,1)<=20.0 && iStochastic(NULL,0,25,1,3,0,0,1,2)>20.0 ;
   zon_bo_7 = iStochastic(NULL,0,25,1,3,0,0,1,1)>80.0 && iStochastic(NULL,0,25,1,3,0,0,1,2)<=80.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=iATR(NULL,0,75,1) * 9.0;
   zon_do_15=zon_do_67 * 85.0;
   zon_do_26 = 95.0 ;
   zon_do_27 = 170.0 ;
   zon_do_24 = 95.0 ;
   zon_do_25 = 170.0 ;
   zon_do_28 = 95.0 ;
   zon_do_29 = 170.0 ;
   zon_do_20 = 95.0 ;
   zon_do_21 = 170.0 ;
   zon_do_22 = 95.0 ;
   zon_do_23 = 170.0 ;
   return;
   }
  if ( mu_0 == 12 )
   {
   zon_bo_6 = iRSI(NULL,0,25,0,1)<=50.0 && iRSI(NULL,0,25,0,2)>50.0 ;
   zon_bo_7 = iRSI(NULL,0,25,0,1)>50.0 && iRSI(NULL,0,25,0,2)<=50.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iMA(NULL,0,160,0,MODE_SMA,PRICE_CLOSE,1) + iATR(NULL,0,190,1) * 14.5;
   zon_do_11=iMA(NULL,0,160,0,MODE_SMA,PRICE_CLOSE,1) - iATR(NULL,0,190,1) * 14.5;
   zon_do_12=zon_do_67 * 135.0;
   zon_do_13 = zon_do_12 ;
   zon_do_16=iATR(NULL,0,190,1) * 7.5;
   zon_do_17=iATR(NULL,0,190,1) * 7.5;
   zon_do_14=zon_do_67 * 160.0;
   zon_do_15=iATR(NULL,0,160,1) * 4.5;
   zon_do_26 = 150.0 ;
   zon_do_27 = 195.0 ;
   zon_do_24 = 150.0 ;
   zon_do_25 = 195.0 ;
   zon_do_28 = 150.0 ;
   zon_do_29 = 195.0 ;
   zon_do_20 = 150.0 ;
   zon_do_21 = 195.0 ;
   zon_do_22 = 150.0 ;
   zon_do_23 = 195.0 ;
   return;
   }
  if ( mu_0 == 13 )
   {
   zon_bo_6 = iStochastic(NULL,0,15,1,3,0,0,1,1)<=30.0 && iStochastic(NULL,0,15,1,3,0,0,1,2)>30.0 ;
   zon_bo_7 = iStochastic(NULL,0,15,1,3,0,0,1,1)>70.0 && iStochastic(NULL,0,15,1,3,0,0,1,2)<=70.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=zon_do_67 * 60.0;
   zon_do_17 = zon_do_16 ;
   zon_do_14=zon_do_67 * 190.0;
   zon_do_15=zon_do_67 * 135.0;
   zon_do_26 = 85.0 ;
   zon_do_27 = 155.0 ;
   zon_do_24 = 85.0 ;
   zon_do_25 = 155.0 ;
   zon_do_28 = 85.0 ;
   zon_do_29 = 155.0 ;
   zon_do_20 = 85.0 ;
   zon_do_21 = 155.0 ;
   zon_do_22 = 85.0 ;
   zon_do_23 = 155.0 ;
   return;
   }
  if ( mu_0 == 14 )
   {
   zon_bo_6 = iBands(NULL,0,140,2.0,0,0,2,1)>Close[1] && iBands(NULL,0,140,2.0,0,0,2,2)<=Close[2] ;
   zon_bo_7 = iBands(NULL,0,140,2.0,0,0,1,1)<=Close[1] && iBands(NULL,0,140,2.0,0,0,1,2)>Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iMA(NULL,0,40,0,MODE_SMA,PRICE_CLOSE,1) + zon_do_67 * 65.0;
   zon_do_11=iMA(NULL,0,40,0,MODE_SMA,PRICE_CLOSE,1) - zon_do_67 * 65.0;
   zon_do_12=iATR(NULL,0,15,1) * 5.0;
   zon_do_13=iATR(NULL,0,15,1) * 5.0;
   zon_do_16=iATR(NULL,0,150,1) * 25.0;
   zon_do_17=iATR(NULL,0,150,1) * 25.0;
   zon_do_14=iATR(NULL,0,75,1) * 22.0;
   zon_do_15 = 0.0 ;
   zon_do_26 = 65.0 ;
   zon_do_27 = 145.0 ;
   zon_do_24 = 65.0 ;
   zon_do_25 = 145.0 ;
   zon_do_28 = 65.0 ;
   zon_do_29 = 145.0 ;
   zon_do_20 = 65.0 ;
   zon_do_21 = 145.0 ;
   zon_do_22 = 65.0 ;
   zon_do_23 = 145.0 ;
   return;
   }
  if ( mu_0 == 15 )
   {
   zon_bo_6 = iBands(NULL,0,50,2.0,0,0,2,1)<=Close[1] && iBands(NULL,0,50,2.0,0,0,2,2)>Close[2] ;
   zon_bo_7 = iBands(NULL,0,50,2.0,0,0,1,1)>Close[1] && iBands(NULL,0,50,2.0,0,0,1,2)<=Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=iATR(NULL,0,30,1) * 5.0;
   zon_do_17=iATR(NULL,0,30,1) * 5.0;
   zon_do_14=zon_do_67 * 175.0;
   zon_do_15=iATR(NULL,0,15,1) * 6.0;
   zon_do_26 = 20.0 ;
   zon_do_27 = 145.0 ;
   zon_do_24 = 20.0 ;
   zon_do_25 = 145.0 ;
   zon_do_28 = 20.0 ;
   zon_do_29 = 145.0 ;
   zon_do_20 = 20.0 ;
   zon_do_21 = 145.0 ;
   zon_do_22 = 20.0 ;
   zon_do_23 = 145.0 ;
   return;
   }
  if ( mu_0 == 16 )
   {
   zon_bo_6 = iBands(NULL,0,130,2.0,0,0,2,1)>Close[1] && iBands(NULL,0,130,2.0,0,0,2,2)<=Close[2] ;
   zon_bo_7 = iBands(NULL,0,130,2.0,0,0,1,1)<=Close[1] && iBands(NULL,0,130,2.0,0,0,1,2)>Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=iATR(NULL,0,90,1) * 4.0;
   zon_do_13=iATR(NULL,0,90,1) * 4.0;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=iATR(NULL,0,75,1) * 24.5;
   zon_do_15 = 0.0 ;
   zon_do_26 = 90.0 ;
   zon_do_27 = 135.0 ;
   zon_do_24 = 90.0 ;
   zon_do_25 = 135.0 ;
   zon_do_28 = 90.0 ;
   zon_do_29 = 135.0 ;
   zon_do_20 = 90.0 ;
   zon_do_21 = 135.0 ;
   zon_do_22 = 90.0 ;
   zon_do_23 = 135.0 ;
   return;
   }
  if ( mu_0 == 17 )
   {
   zon_bo_6 = iBands(NULL,0,140,2.0,0,0,2,1)>Close[1] && iBands(NULL,0,140,2.0,0,0,2,2)<=Close[2] ;
   zon_bo_7 = iBands(NULL,0,140,2.0,0,0,1,1)<=Close[1] && iBands(NULL,0,140,2.0,0,0,1,2)>Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iMA(NULL,0,40,0,MODE_SMA,PRICE_CLOSE,1) + zon_do_67 * 65.0;
   zon_do_11=iMA(NULL,0,40,0,MODE_SMA,PRICE_CLOSE,1) - zon_do_67 * 65.0;
   zon_do_12=iATR(NULL,0,15,1) * 5.0;
   zon_do_13=iATR(NULL,0,15,1) * 5.0;
   zon_do_16=iATR(NULL,0,150,1) * 25.0;
   zon_do_17=iATR(NULL,0,150,1) * 25.0;
   zon_do_14=iATR(NULL,0,75,1) * 22.0;
   zon_do_15 = 0.0 ;
   zon_do_26 = 65.0 ;
   zon_do_27 = 145.0 ;
   zon_do_24 = 65.0 ;
   zon_do_25 = 145.0 ;
   zon_do_28 = 65.0 ;
   zon_do_29 = 145.0 ;
   zon_do_20 = 65.0 ;
   zon_do_21 = 145.0 ;
   zon_do_22 = 65.0 ;
   zon_do_23 = 145.0 ;
   return;
   }
  if ( mu_0 == 18 )
   {
   zon_bo_6 = iMACD(NULL,0,40,280,1,PRICE_CLOSE,0,1)>0.0 && iMACD(NULL,0,40,280,1,PRICE_CLOSE,0,2)<=0.0 ;
   zon_bo_7 = iMACD(NULL,0,40,280,1,PRICE_CLOSE,0,1)<=0.0 && iMACD(NULL,0,40,280,1,PRICE_CLOSE,0,2)>0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iMA(NULL,0,30,0,MODE_SMA,PRICE_CLOSE,1) + zon_do_67 * 75.0;
   zon_do_11=iMA(NULL,0,30,0,MODE_SMA,PRICE_CLOSE,1) - zon_do_67 * 75.0;
   zon_do_12=iATR(NULL,0,35,1) * 9.5;
   zon_do_13=iATR(NULL,0,35,1) * 9.5;
   zon_do_16=iATR(NULL,0,70,1) * 18.5;
   zon_do_17=iATR(NULL,0,70,1) * 18.5;
   zon_do_14=zon_do_67 * 95.0;
   zon_do_15=zon_do_67 * 160.0;
   zon_do_26 = 120.0 ;
   zon_do_27 = 170.0 ;
   zon_do_24 = 120.0 ;
   zon_do_25 = 170.0 ;
   zon_do_28 = 120.0 ;
   zon_do_29 = 170.0 ;
   zon_do_20 = 120.0 ;
   zon_do_21 = 170.0 ;
   zon_do_22 = 120.0 ;
   zon_do_23 = 170.0 ;
   return;
   }
  if ( mu_0 == 19 )
   {
   zon_bo_6 = iMACD(NULL,0,10,60,1,PRICE_CLOSE,0,1)>0.0 && iMACD(NULL,0,10,60,1,PRICE_CLOSE,0,2)<=0.0 ;
   zon_bo_7 = iMACD(NULL,0,10,60,1,PRICE_CLOSE,0,1)<=0.0 && iMACD(NULL,0,10,60,1,PRICE_CLOSE,0,2)>0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=zon_do_67 * 10.0;
   zon_do_17 = zon_do_16 ;
   zon_do_14=zon_do_67 * 200.0;
   zon_do_15=iATR(NULL,0,85,1) * 4.5;
   zon_do_26 = 50.0 ;
   zon_do_27 = 190.0 ;
   zon_do_24 = 50.0 ;
   zon_do_25 = 190.0 ;
   zon_do_28 = 50.0 ;
   zon_do_29 = 190.0 ;
   zon_do_20 = 50.0 ;
   zon_do_21 = 190.0 ;
   zon_do_22 = 50.0 ;
   zon_do_23 = 190.0 ;
   return;
   }
  if (mu_0 != 20)  return;
  zon_bo_6 = iStochastic(NULL,0,25,1,3,0,0,1,1)<=20.0 && iStochastic(NULL,0,25,1,3,0,0,1,2)>20.0 ;
  lin_bo_184 = iStochastic(NULL,0,25,1,3,0,0,1,1)>80.0;
  zon_bo_7 = lin_bo_184 && iStochastic(NULL,0,25,1,3,0,0,1,2)<=80.0 ;
  zon_in_18 = 0 ;
  zon_do_8 = 0.0 ;
  zon_do_9 = 0.0 ;
  zon_do_10 = 0.0 ;
  zon_do_11 = 0.0 ;
  zon_do_12 = 0.0 ;
  zon_do_13 = 0.0 ;
  zon_do_16 = 0.0 ;
  zon_do_17 = 0.0 ;
  zon_do_14=iATR(NULL,0,75,1) * 9.0;
  zon_do_15=zon_do_67 * 85.0;
  zon_do_26 = 95.0 ;
  zon_do_27 = 170.0 ;
  zon_do_24 = 95.0 ;
  zon_do_25 = 170.0 ;
  zon_do_28 = 95.0 ;
  zon_do_29 = 170.0 ;
  zon_do_20 = 95.0 ;
  zon_do_21 = 170.0 ;
  zon_do_22 = 95.0 ;
  zon_do_23 = 170.0 ;
  return;
  }
*/  
// if ( StringFind(zi_st_1,"USDJPY",0) >= 0 && Period() == 15 )
if (USDJPY)
  {
  if ( mu_0 == 1 )
   {
   zon_bo_6 = iCCI(NULL,0,25,0,1)<=0.0 && iCCI(NULL,0,25,0,2)>0.0 ;
   zon_bo_7 = iCCI(NULL,0,25,0,1)>0.0 && iCCI(NULL,0,25,0,2)<=0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=zon_do_67 * 45.0;
   zon_do_15=iATR(NULL,0,180,1) * 8.5;
   zon_do_26 = 125.0 ;
   zon_do_27 = 140.0 ;
   zon_do_24 = 125.0 ;
   zon_do_25 = 140.0 ;
   zon_do_28 = 125.0 ;
   zon_do_29 = 140.0 ;
   zon_do_20 = 125.0 ;
   zon_do_21 = 140.0 ;
   zon_do_22 = 125.0 ;
   zon_do_23 = 140.0 ;
   return;
   }
  if ( mu_0 == 2 )
   {
   zon_bo_6 = iBands(NULL,0,100,2.0,0,0,2,1)>Close[1] && iBands(NULL,0,100,2.0,0,0,2,2)<=Close[2] ;
   zon_bo_7 = iBands(NULL,0,100,2.0,0,0,1,1)<=Close[1] && iBands(NULL,0,100,2.0,0,0,1,2)>Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iMA(NULL,0,50,0,MODE_SMA,PRICE_CLOSE,1) - iATR(NULL,0,60,1) * 14.0;
   zon_do_11=iMA(NULL,0,50,0,MODE_SMA,PRICE_CLOSE,1) + iATR(NULL,0,60,1) * 14.0;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=iATR(NULL,0,120,1) * 7.5;
   zon_do_17=iATR(NULL,0,120,1) * 7.5;
   zon_do_14=zon_do_67 * 55.0;
   zon_do_15 = 0.0 ;
   zon_do_26 = 70.0 ;
   zon_do_27 = 195.0 ;
   zon_do_24 = 70.0 ;
   zon_do_25 = 195.0 ;
   zon_do_28 = 70.0 ;
   zon_do_29 = 195.0 ;
   zon_do_20 = 70.0 ;
   zon_do_21 = 195.0 ;
   zon_do_22 = 70.0 ;
   zon_do_23 = 195.0 ;
   return;
   }
  if ( mu_0 == 3 )
   {
   zon_bo_6 = iMACD(NULL,0,40,90,1,PRICE_CLOSE,0,1)>0.0 && iMACD(NULL,0,40,90,1,PRICE_CLOSE,0,2)<=0.0 ;
   zon_bo_7 = iMACD(NULL,0,40,90,1,PRICE_CLOSE,0,1)<=0.0 && iMACD(NULL,0,40,90,1,PRICE_CLOSE,0,2)>0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iBands(NULL,0,65,2.0,0,0,2,1) + iATR(NULL,0,110,1) * 15.5;
   zon_do_11=iBands(NULL,0,65,2.0,0,0,1,1) - iATR(NULL,0,110,1) * 15.5;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=iATR(NULL,0,120,1) * 5.0;
   zon_do_17=iATR(NULL,0,120,1) * 5.0;
   zon_do_14=zon_do_67 * 55.0;
   zon_do_15=zon_do_67 * 45.0;
   zon_do_26 = 75.0 ;
   zon_do_27 = 130.0 ;
   zon_do_24 = 75.0 ;
   zon_do_25 = 130.0 ;
   zon_do_28 = 75.0 ;
   zon_do_29 = 130.0 ;
   zon_do_20 = 75.0 ;
   zon_do_21 = 130.0 ;
   zon_do_22 = 75.0 ;
   zon_do_23 = 130.0 ;
   return;
   }
  if ( mu_0 == 4 )
   {
   zon_bo_6 = iBands(NULL,0,40,2.0,0,0,2,1)<=Close[1] && iBands(NULL,0,40,2.0,0,0,2,2)>Close[2] ;
   zon_bo_7 = iBands(NULL,0,40,2.0,0,0,1,1)>Close[1] && iBands(NULL,0,40,2.0,0,0,1,2)<=Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iMA(NULL,0,65,0,MODE_SMA,PRICE_CLOSE,1) + zon_do_67 * 25.0;
   zon_do_11=iMA(NULL,0,65,0,MODE_SMA,PRICE_CLOSE,1) - zon_do_67 * 25.0;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=iATR(NULL,0,85,1) * 16.0;
   zon_do_17=iATR(NULL,0,85,1) * 16.0;
   zon_do_14=iATR(NULL,0,15,1) * 23.5;
   zon_do_15 = 0.0 ;
   zon_do_26 = 80.0 ;
   zon_do_27 = 145.0 ;
   zon_do_24 = 80.0 ;
   zon_do_25 = 145.0 ;
   zon_do_28 = 80.0 ;
   zon_do_29 = 145.0 ;
   zon_do_20 = 80.0 ;
   zon_do_21 = 145.0 ;
   zon_do_22 = 80.0 ;
   zon_do_23 = 145.0 ;
   return;
   }
  if ( mu_0 == 5 )
   {
   zon_bo_6 = iRSI(NULL,0,15,0,1)>80.0 && iRSI(NULL,0,15,0,2)<=80.0 ;
   zon_bo_7 = iRSI(NULL,0,15,0,1)<=20.0 && iRSI(NULL,0,15,0,2)>20.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iBands(NULL,0,70,1.0,0,0,2,1) + zon_do_67 * 30.0;
   zon_do_11=iBands(NULL,0,70,1.0,0,0,1,1) - zon_do_67 * 30.0;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=zon_do_67 * 10.0;
   zon_do_17 = zon_do_16 ;
   zon_do_14=iATR(NULL,0,80,1) * 4.5;
   zon_do_15=zon_do_67 * 160.0;
   zon_do_26 = 60.0 ;
   zon_do_27 = 95.0 ;
   zon_do_24 = 60.0 ;
   zon_do_25 = 95.0 ;
   zon_do_28 = 60.0 ;
   zon_do_29 = 95.0 ;
   zon_do_20 = 60.0 ;
   zon_do_21 = 95.0 ;
   zon_do_22 = 60.0 ;
   zon_do_23 = 95.0 ;
   return;
   }
  if ( mu_0 == 6 )
   {
   zon_bo_6 = iStochastic(NULL,0,30,1,3,0,0,1,1)>80.0 && iStochastic(NULL,0,30,1,3,0,0,1,2)<=80.0 ;
   zon_bo_7 = iStochastic(NULL,0,30,1,3,0,0,1,1)<=20.0 && iStochastic(NULL,0,30,1,3,0,0,1,2)>20.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=zon_do_67 * 65.0;
   zon_do_15=zon_do_67 * 100.0;
   zon_do_26 = 150.0 ;
   zon_do_27 = 165.0 ;
   zon_do_24 = 150.0 ;
   zon_do_25 = 165.0 ;
   zon_do_28 = 150.0 ;
   zon_do_29 = 165.0 ;
   zon_do_20 = 150.0 ;
   zon_do_21 = 165.0 ;
   zon_do_22 = 150.0 ;
   zon_do_23 = 165.0 ;
   return;
   }
  if ( mu_0 == 7 )
   {
   zon_bo_6 = iStochastic(NULL,0,100,1,3,0,0,1,1)>80.0 && iStochastic(NULL,0,100,1,3,0,0,1,2)<=80.0 ;
   zon_bo_7 = iStochastic(NULL,0,100,1,3,0,0,1,1)<=20.0 && iStochastic(NULL,0,100,1,3,0,0,1,2)>20.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=zon_do_67 * 40.0;
   zon_do_15=iATR(NULL,0,35,1) * 20.5;
   zon_do_26 = 115.0 ;
   zon_do_27 = 125.0 ;
   zon_do_24 = 115.0 ;
   zon_do_25 = 125.0 ;
   zon_do_28 = 115.0 ;
   zon_do_29 = 125.0 ;
   zon_do_20 = 115.0 ;
   zon_do_21 = 125.0 ;
   zon_do_22 = 115.0 ;
   zon_do_23 = 125.0 ;
   return;
   }
  if ( mu_0 == 8 )
   {
   zon_bo_6 = iBands(NULL,0,50,1.0,0,0,2,1)<=Close[1] && iBands(NULL,0,50,1.0,0,0,2,2)>Close[2] ;
   zon_bo_7 = iBands(NULL,0,50,1.0,0,0,1,1)>Close[1] && iBands(NULL,0,50,1.0,0,0,1,2)<=Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iBands(NULL,0,40,2.0,0,0,1,1) - zon_do_67 * 85.0;
   zon_do_11=iBands(NULL,0,40,2.0,0,0,2,1) + zon_do_67 * 85.0;
   zon_do_12=iATR(NULL,0,130,1) * 20.5;
   zon_do_13=iATR(NULL,0,130,1) * 20.5;
   zon_do_16=zon_do_67 * 195.0;
   zon_do_17 = zon_do_16 ;
   zon_do_14=zon_do_67 * 40.0;
   zon_do_15 = 0.0 ;
   zon_do_26 = 110.0 ;
   zon_do_27 = 145.0 ;
   zon_do_24 = 110.0 ;
   zon_do_25 = 145.0 ;
   zon_do_28 = 110.0 ;
   zon_do_29 = 145.0 ;
   zon_do_20 = 110.0 ;
   zon_do_21 = 145.0 ;
   zon_do_22 = 110.0 ;
   zon_do_23 = 145.0 ;
   return;
   }
  if ( mu_0 == 9 )
   {
   zon_bo_6 = iBands(NULL,0,145,1.0,0,0,2,1)>Close[1] && iBands(NULL,0,145,1.0,0,0,2,2)<=Close[2] ;
   zon_bo_7 = iBands(NULL,0,145,1.0,0,0,1,1)<=Close[1] && iBands(NULL,0,145,1.0,0,0,1,2)>Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iMA(NULL,0,30,0,MODE_EMA,PRICE_CLOSE,1) - zon_do_67 * 190.0;
   zon_do_11=iMA(NULL,0,30,0,MODE_EMA,PRICE_CLOSE,1) + zon_do_67 * 190.0;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=iATR(NULL,0,80,1) * 20.0;
   zon_do_17=iATR(NULL,0,80,1) * 20.0;
   zon_do_14=iATR(NULL,0,75,1) * 25.0;
   zon_do_15 = 0.0 ;
   zon_do_26 = 60.0 ;
   zon_do_27 = 130.0 ;
   zon_do_24 = 60.0 ;
   zon_do_25 = 130.0 ;
   zon_do_28 = 60.0 ;
   zon_do_29 = 130.0 ;
   zon_do_20 = 60.0 ;
   zon_do_21 = 130.0 ;
   zon_do_22 = 60.0 ;
   zon_do_23 = 130.0 ;
   return;
   }
  if ( mu_0 == 10 )
   {
   zon_bo_6 = iMACD(NULL,0,15,120,1,PRICE_CLOSE,0,1)>0.0 && iMACD(NULL,0,15,120,1,PRICE_CLOSE,0,2)<=0.0 ;
   zon_bo_7 = iMACD(NULL,0,15,120,1,PRICE_CLOSE,0,1)<=0.0 && iMACD(NULL,0,15,120,1,PRICE_CLOSE,0,2)>0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=iATR(NULL,0,30,1) * 23.5;
   zon_do_13=iATR(NULL,0,30,1) * 23.5;
   zon_do_16=iATR(NULL,0,90,1) * 17.5;
   zon_do_17=iATR(NULL,0,90,1) * 17.5;
   zon_do_14=iATR(NULL,0,110,1) * 4.0;
   zon_do_15 = 0.0 ;
   zon_do_26 = 50.0 ;
   zon_do_27 = 180.0 ;
   zon_do_24 = 50.0 ;
   zon_do_25 = 180.0 ;
   zon_do_28 = 50.0 ;
   zon_do_29 = 180.0 ;
   zon_do_20 = 50.0 ;
   zon_do_21 = 180.0 ;
   zon_do_22 = 50.0 ;
   zon_do_23 = 180.0 ;
   return;
   }
  if ( mu_0 == 11 )
   {
   zon_bo_6 = iBands(NULL,0,125,1.0,0,0,2,1)>Close[1] && iBands(NULL,0,125,1.0,0,0,2,2)<=Close[2] ;
   zon_bo_7 = iBands(NULL,0,125,1.0,0,0,1,1)<=Close[1] && iBands(NULL,0,125,1.0,0,0,1,2)>Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=iATR(NULL,0,75,1) * 19.5;
   zon_do_13=iATR(NULL,0,75,1) * 19.5;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=iATR(NULL,0,95,1) * 9.0;
   zon_do_15=iATR(NULL,0,160,1) * 3.5;
   zon_do_26 = 105.0 ;
   zon_do_27 = 120.0 ;
   zon_do_24 = 105.0 ;
   zon_do_25 = 120.0 ;
   zon_do_28 = 105.0 ;
   zon_do_29 = 120.0 ;
   zon_do_20 = 105.0 ;
   zon_do_21 = 120.0 ;
   zon_do_22 = 105.0 ;
   zon_do_23 = 120.0 ;
   return;
   }
  if ( mu_0 == 12 )
   {
   zon_bo_6 = iRSI(NULL,0,15,0,1)>80.0 && iRSI(NULL,0,15,0,2)<=80.0 ;
   zon_bo_7 = iRSI(NULL,0,15,0,1)<=20.0 && iRSI(NULL,0,15,0,2)>20.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iBands(NULL,0,70,1.0,0,0,2,1) + zon_do_67 * 30.0;
   zon_do_11=iBands(NULL,0,70,1.0,0,0,1,1) - zon_do_67 * 30.0;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=zon_do_67 * 10.0;
   zon_do_17 = zon_do_16 ;
   zon_do_14=iATR(NULL,0,80,1) * 4.5;
   zon_do_15=zon_do_67 * 160.0;
   zon_do_26 = 60.0 ;
   zon_do_27 = 95.0 ;
   zon_do_24 = 60.0 ;
   zon_do_25 = 95.0 ;
   zon_do_28 = 60.0 ;
   zon_do_29 = 95.0 ;
   zon_do_20 = 60.0 ;
   zon_do_21 = 95.0 ;
   zon_do_22 = 60.0 ;
   zon_do_23 = 95.0 ;
   return;
   }
  if ( mu_0 == 13 )
   {
   zon_bo_6 = iRSI(NULL,0,100,0,1)>50.0 && iRSI(NULL,0,100,0,2)<=50.0 ;
   zon_bo_7 = iRSI(NULL,0,100,0,1)<=50.0 && iRSI(NULL,0,100,0,2)>50.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=iATR(NULL,0,65,1) * 11.0;
   zon_do_13=iATR(NULL,0,65,1) * 11.0;
   zon_do_16=iATR(NULL,0,110,1) * 24.0;
   zon_do_17=iATR(NULL,0,110,1) * 24.0;
   zon_do_14=zon_do_67 * 130.0;
   zon_do_15=zon_do_67 * 105.0;
   zon_do_26 = 85.0 ;
   zon_do_27 = 180.0 ;
   zon_do_24 = 85.0 ;
   zon_do_25 = 180.0 ;
   zon_do_28 = 85.0 ;
   zon_do_29 = 180.0 ;
   zon_do_20 = 85.0 ;
   zon_do_21 = 180.0 ;
   zon_do_22 = 85.0 ;
   zon_do_23 = 180.0 ;
   return;
   }
  if ( mu_0 == 14 )
   {
   zon_bo_6 = iStochastic(NULL,0,100,1,3,0,0,1,1)>80.0 && iStochastic(NULL,0,100,1,3,0,0,1,2)<=80.0 ;
   zon_bo_7 = iStochastic(NULL,0,100,1,3,0,0,1,1)<=20.0 && iStochastic(NULL,0,100,1,3,0,0,1,2)>20.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=zon_do_67 * 40.0;
   zon_do_15=iATR(NULL,0,35,1) * 20.5;
   zon_do_26 = 115.0 ;
   zon_do_27 = 125.0 ;
   zon_do_24 = 115.0 ;
   zon_do_25 = 125.0 ;
   zon_do_28 = 115.0 ;
   zon_do_29 = 125.0 ;
   zon_do_20 = 115.0 ;
   zon_do_21 = 125.0 ;
   zon_do_22 = 115.0 ;
   zon_do_23 = 125.0 ;
   return;
   }
  if ( mu_0 == 15 )
   {
   zon_bo_6 = iBands(NULL,0,35,2.0,0,0,2,1)<=Close[1] && iBands(NULL,0,35,2.0,0,0,2,2)>Close[2] ;
   zon_bo_7 = iBands(NULL,0,35,2.0,0,0,1,1)>Close[1] && iBands(NULL,0,35,2.0,0,0,1,2)<=Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=iATR(NULL,0,15,1) * 18.0;
   zon_do_13=iATR(NULL,0,15,1) * 18.0;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=iATR(NULL,0,45,1) * 10.5;
   zon_do_15=iATR(NULL,0,110,1) * 23.0;
   zon_do_26 = 120.0 ;
   zon_do_27 = 175.0 ;
   zon_do_24 = 120.0 ;
   zon_do_25 = 175.0 ;
   zon_do_28 = 120.0 ;
   zon_do_29 = 175.0 ;
   zon_do_20 = 120.0 ;
   zon_do_21 = 175.0 ;
   zon_do_22 = 120.0 ;
   zon_do_23 = 175.0 ;
   return;
   }
  if ( mu_0 == 16 )
   {
   zon_bo_6 = iBands(NULL,0,30,2.0,0,0,2,1)>Close[1] && iBands(NULL,0,30,2.0,0,0,2,2)<=Close[2] ;
   zon_bo_7 = iBands(NULL,0,30,2.0,0,0,1,1)<=Close[1] && iBands(NULL,0,30,2.0,0,0,1,2)>Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iMA(NULL,0,160,0,MODE_SMA,PRICE_CLOSE,1) + iATR(NULL,0,30,1) * 2.5;
   zon_do_11=iMA(NULL,0,160,0,MODE_SMA,PRICE_CLOSE,1) - iATR(NULL,0,30,1) * 2.5;
   zon_do_12=zon_do_67 * 150.0;
   zon_do_13 = zon_do_12 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=zon_do_67 * 155.0;
   zon_do_15=iATR(NULL,0,200,1) * 21.0;
   zon_do_26 = 80.0 ;
   zon_do_27 = 190.0 ;
   zon_do_24 = 80.0 ;
   zon_do_25 = 190.0 ;
   zon_do_28 = 80.0 ;
   zon_do_29 = 190.0 ;
   zon_do_20 = 80.0 ;
   zon_do_21 = 190.0 ;
   zon_do_22 = 80.0 ;
   zon_do_23 = 190.0 ;
   return;
   }
  if ( mu_0 == 17 )
   {
   zon_bo_6 = iBands(NULL,0,30,2.0,0,0,2,1)<=Close[1] && iBands(NULL,0,30,2.0,0,0,2,2)>Close[2] ;
   zon_bo_7 = iBands(NULL,0,30,2.0,0,0,1,1)>Close[1] && iBands(NULL,0,30,2.0,0,0,1,2)<=Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iMA(NULL,0,85,0,MODE_SMA,PRICE_CLOSE,1) + zon_do_67 * 15.0;
   zon_do_11=iMA(NULL,0,85,0,MODE_SMA,PRICE_CLOSE,1) - zon_do_67 * 15.0;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=zon_do_67 * 20.0;
   zon_do_15 = 0.0 ;
   zon_do_26 = 60.0 ;
   zon_do_27 = 190.0 ;
   zon_do_24 = 60.0 ;
   zon_do_25 = 190.0 ;
   zon_do_28 = 60.0 ;
   zon_do_29 = 190.0 ;
   zon_do_20 = 60.0 ;
   zon_do_21 = 190.0 ;
   zon_do_22 = 60.0 ;
   zon_do_23 = 190.0 ;
   return;
   }
  if ( mu_0 == 18 )
   {
   zon_bo_6 = iBands(NULL,0,150,1.0,0,0,2,1)>Close[1] && iBands(NULL,0,150,1.0,0,0,2,2)<=Close[2] ;
   zon_bo_7 = iBands(NULL,0,150,1.0,0,0,1,1)<=Close[1] && iBands(NULL,0,150,1.0,0,0,1,2)>Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iMA(NULL,0,35,0,MODE_EMA,PRICE_CLOSE,1) + iATR(NULL,0,75,1) * 15.5;
   zon_do_11=iMA(NULL,0,35,0,MODE_EMA,PRICE_CLOSE,1) - iATR(NULL,0,75,1) * 15.5;
   zon_do_12=iATR(NULL,0,60,1) * 14.5;
   zon_do_13=iATR(NULL,0,60,1) * 14.5;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=zon_do_67 * 115.0;
   zon_do_15 = 0.0 ;
   zon_do_26 = 95.0 ;
   zon_do_27 = 130.0 ;
   zon_do_24 = 95.0 ;
   zon_do_25 = 130.0 ;
   zon_do_28 = 95.0 ;
   zon_do_29 = 130.0 ;
   zon_do_20 = 95.0 ;
   zon_do_21 = 130.0 ;
   zon_do_22 = 95.0 ;
   zon_do_23 = 130.0 ;
   return;
   }
  if ( mu_0 == 19 )
   {
   zon_bo_6 = iRSI(NULL,0,15,0,1)>80.0 && iRSI(NULL,0,15,0,2)<=80.0 ;
   zon_bo_7 = iRSI(NULL,0,15,0,1)<=20.0 && iRSI(NULL,0,15,0,2)>20.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=zon_do_67 * 10.0;
   zon_do_13 = zon_do_12 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=iATR(NULL,0,130,1) * 0.5;
   zon_do_15=iATR(NULL,0,10,1) * 5.0;
   zon_do_26 = 60.0 ;
   zon_do_27 = 100.0 ;
   zon_do_24 = 60.0 ;
   zon_do_25 = 100.0 ;
   zon_do_28 = 60.0 ;
   zon_do_29 = 100.0 ;
   zon_do_20 = 60.0 ;
   zon_do_21 = 100.0 ;
   zon_do_22 = 60.0 ;
   zon_do_23 = 100.0 ;
   return;
   }
  if (mu_0 != 20)  return;
  zon_bo_6 = iStochastic(NULL,0,70,1,3,0,0,1,1)<=30.0 && iStochastic(NULL,0,70,1,3,0,0,1,2)>30.0 ;
  zon_bo_7 = iStochastic(NULL,0,70,1,3,0,0,1,1)>70.0 && iStochastic(NULL,0,70,1,3,0,0,1,2)<=70.0 ;
  zon_in_18 = 0 ;
  zon_do_8 = 0.0 ;
  zon_do_9 = 0.0 ;
  zon_do_10=iMA(NULL,0,95,0,MODE_SMA,PRICE_CLOSE,1) - iATR(NULL,0,110,1) * 24.5;
  zon_do_11=iMA(NULL,0,95,0,MODE_SMA,PRICE_CLOSE,1) + iATR(NULL,0,110,1) * 24.5;
  zon_do_12=iATR(NULL,0,130,1) * 20.0;
  zon_do_13=iATR(NULL,0,130,1) * 20.0;
  zon_do_16=iATR(NULL,0,80,1) * 13.0;
  zon_do_17=iATR(NULL,0,80,1) * 13.0;
  zon_do_14=iATR(NULL,0,60,1) * 6.0;
  zon_do_15=iATR(NULL,0,120,1) * 6.5;
  zon_do_26 = 100.0 ;
  zon_do_27 = 150.0 ;
  zon_do_24 = 100.0 ;
  zon_do_25 = 150.0 ;
  zon_do_28 = 100.0 ;
  zon_do_29 = 150.0 ;
  zon_do_20 = 100.0 ;
  zon_do_21 = 150.0 ;
  zon_do_22 = 100.0 ;
  zon_do_23 = 150.0 ;
  return;
  }
  
// if ( StringFind(zi_st_1,"EURCAD",0) >= 0 && Period() == 60 )
/*if (EURCAD)
  {
  if ( mu_0 == 1 )
   {
   zon_bo_6 = iRSI(NULL,0,140,0,1)>50.0 && iRSI(NULL,0,140,0,2)<=50.0 ;
   zon_bo_7 = iRSI(NULL,0,140,0,1)<=50.0 && iRSI(NULL,0,140,0,2)>50.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=zon_do_67 * 75.0;
   zon_do_13 = zon_do_12 ;
   zon_do_16=iATR(NULL,0,190,1) * 19.0;
   zon_do_17=iATR(NULL,0,190,1) * 19.0;
   zon_do_14=zon_do_67 * 180.0;
   zon_do_15=zon_do_67 * 80.0;
   zon_do_26 = 50.0 ;
   zon_do_27 = 150.0 ;
   zon_do_24 = 50.0 ;
   zon_do_25 = 150.0 ;
   zon_do_28 = 50.0 ;
   zon_do_29 = 150.0 ;
   zon_do_20 = 50.0 ;
   zon_do_21 = 150.0 ;
   zon_do_22 = 50.0 ;
   zon_do_23 = 150.0 ;
   return;
   }
  if ( mu_0 == 2 )
   {
   zon_bo_6 = iBands(NULL,0,20,2.0,0,0,2,1)<=Close[1] && iBands(NULL,0,20,2.0,0,0,2,2)>Close[2] ;
   zon_bo_7 = iBands(NULL,0,20,2.0,0,0,1,1)>Close[1] && iBands(NULL,0,20,2.0,0,0,1,2)<=Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iMA(NULL,0,160,0,MODE_SMA,PRICE_CLOSE,1) - iATR(NULL,0,75,1) * 14.0;
   zon_do_11=iMA(NULL,0,160,0,MODE_SMA,PRICE_CLOSE,1) + iATR(NULL,0,75,1) * 14.0;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=iATR(NULL,0,150,1) * 8.0;
   zon_do_17=iATR(NULL,0,150,1) * 8.0;
   zon_do_14=iATR(NULL,0,20,1) * 1.5;
   zon_do_15 = 0.0 ;
   zon_do_26 = 125.0 ;
   zon_do_27 = 155.0 ;
   zon_do_24 = 125.0 ;
   zon_do_25 = 155.0 ;
   zon_do_28 = 125.0 ;
   zon_do_29 = 155.0 ;
   zon_do_20 = 125.0 ;
   zon_do_21 = 155.0 ;
   zon_do_22 = 125.0 ;
   zon_do_23 = 155.0 ;
   return;
   }
  if ( mu_0 == 3 )
   {
   zon_bo_6 = iBands(NULL,0,135,2.0,0,0,2,1)>Close[1] && iBands(NULL,0,135,2.0,0,0,2,2)<=Close[2] ;
   zon_bo_7 = iBands(NULL,0,135,2.0,0,0,1,1)<=Close[1] && iBands(NULL,0,135,2.0,0,0,1,2)>Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iMA(NULL,0,150,0,MODE_EMA,PRICE_CLOSE,1) - iATR(NULL,0,5,1) * 13.0;
   zon_do_11=iMA(NULL,0,150,0,MODE_EMA,PRICE_CLOSE,1) + iATR(NULL,0,5,1) * 13.0;
   zon_do_12=iATR(NULL,0,40,1) * 6.0;
   zon_do_13=iATR(NULL,0,40,1) * 6.0;
   zon_do_16=iATR(NULL,0,70,1) * 3.0;
   zon_do_17=iATR(NULL,0,70,1) * 3.0;
   zon_do_14=zon_do_67 * 155.0;
   zon_do_15 = 0.0 ;
   zon_do_26 = 60.0 ;
   zon_do_27 = 140.0 ;
   zon_do_24 = 60.0 ;
   zon_do_25 = 140.0 ;
   zon_do_28 = 60.0 ;
   zon_do_29 = 140.0 ;
   zon_do_20 = 60.0 ;
   zon_do_21 = 140.0 ;
   zon_do_22 = 60.0 ;
   zon_do_23 = 140.0 ;
   return;
   }
  if ( mu_0 == 4 )
   {
   zon_bo_6 = iMACD(NULL,0,15,80,1,PRICE_CLOSE,0,1)>0.0 && iMACD(NULL,0,15,80,1,PRICE_CLOSE,0,2)<=0.0 ;
   zon_bo_7 = iMACD(NULL,0,15,80,1,PRICE_CLOSE,0,1)<=0.0 && iMACD(NULL,0,15,80,1,PRICE_CLOSE,0,2)>0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iMA(NULL,0,65,0,MODE_EMA,PRICE_CLOSE,1) + zon_do_67 * 15.0;
   zon_do_11=iMA(NULL,0,65,0,MODE_EMA,PRICE_CLOSE,1) - zon_do_67 * 15.0;
   zon_do_12=iATR(NULL,0,90,1) * 4.5;
   zon_do_13=iATR(NULL,0,90,1) * 4.5;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=zon_do_67 * 195.0;
   zon_do_15=iATR(NULL,0,60,1) * 12.5;
   zon_do_26 = 125.0 ;
   zon_do_27 = 175.0 ;
   zon_do_24 = 125.0 ;
   zon_do_25 = 175.0 ;
   zon_do_28 = 125.0 ;
   zon_do_29 = 175.0 ;
   zon_do_20 = 125.0 ;
   zon_do_21 = 175.0 ;
   zon_do_22 = 125.0 ;
   zon_do_23 = 175.0 ;
   return;
   }
  if ( mu_0 == 5 )
   {
   zon_bo_6 = iStochastic(NULL,0,55,1,3,0,0,1,1)<=30.0 && iStochastic(NULL,0,55,1,3,0,0,1,2)>30.0 ;
   zon_bo_7 = iStochastic(NULL,0,55,1,3,0,0,1,1)>70.0 && iStochastic(NULL,0,55,1,3,0,0,1,2)<=70.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=iATR(NULL,0,150,1) * 11.0;
   zon_do_15=iATR(NULL,0,190,1) * 14.0;
   zon_do_26 = 130.0 ;
   zon_do_27 = 170.0 ;
   zon_do_24 = 130.0 ;
   zon_do_25 = 170.0 ;
   zon_do_28 = 130.0 ;
   zon_do_29 = 170.0 ;
   zon_do_20 = 130.0 ;
   zon_do_21 = 170.0 ;
   zon_do_22 = 130.0 ;
   zon_do_23 = 170.0 ;
   return;
   }
  if ( mu_0 == 6 )
   {
   zon_bo_6 = iBands(NULL,0,30,2.0,0,0,2,1)<=Close[1] && iBands(NULL,0,30,2.0,0,0,2,2)>Close[2] ;
   zon_bo_7 = iBands(NULL,0,30,2.0,0,0,1,1)>Close[1] && iBands(NULL,0,30,2.0,0,0,1,2)<=Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=zon_do_67 * 190.0;
   zon_do_13 = zon_do_12 ;
   zon_do_16=iATR(NULL,0,50,1) * 5.0;
   zon_do_17=iATR(NULL,0,50,1) * 5.0;
   zon_do_14=zon_do_67 * 150.0;
   zon_do_15 = zon_do_14 ;
   zon_do_26 = 85.0 ;
   zon_do_27 = 185.0 ;
   zon_do_24 = 85.0 ;
   zon_do_25 = 185.0 ;
   zon_do_28 = 85.0 ;
   zon_do_29 = 185.0 ;
   zon_do_20 = 85.0 ;
   zon_do_21 = 185.0 ;
   zon_do_22 = 85.0 ;
   zon_do_23 = 185.0 ;
   return;
   }
  if ( mu_0 == 7 )
   {
   zon_bo_6 = iCCI(NULL,0,15,0,1)<=0.0 && iCCI(NULL,0,15,0,2)>0.0 ;
   zon_bo_7 = iCCI(NULL,0,15,0,1)>0.0 && iCCI(NULL,0,15,0,2)<=0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=zon_do_67 * 165.0;
   zon_do_15=zon_do_67 * 70.0;
   zon_do_26 = 120.0 ;
   zon_do_27 = 180.0 ;
   zon_do_24 = 120.0 ;
   zon_do_25 = 180.0 ;
   zon_do_28 = 120.0 ;
   zon_do_29 = 180.0 ;
   zon_do_20 = 120.0 ;
   zon_do_21 = 180.0 ;
   zon_do_22 = 120.0 ;
   zon_do_23 = 180.0 ;
   return;
   }
  if ( mu_0 == 8 )
   {
   zon_bo_6 = iStochastic(NULL,0,30,1,3,0,0,1,1)>80.0 && iStochastic(NULL,0,30,1,3,0,0,1,2)<=80.0 ;
   zon_bo_7 = iStochastic(NULL,0,30,1,3,0,0,1,1)<=20.0 && iStochastic(NULL,0,30,1,3,0,0,1,2)>20.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=iATR(NULL,0,180,1) * 20.5;
   zon_do_17=iATR(NULL,0,180,1) * 20.5;
   zon_do_14=iATR(NULL,0,200,1) * 7.5;
   zon_do_15=iATR(NULL,0,75,1) * 23.5;
   zon_do_26 = 15.0 ;
   zon_do_27 = 180.0 ;
   zon_do_24 = 15.0 ;
   zon_do_25 = 180.0 ;
   zon_do_28 = 15.0 ;
   zon_do_29 = 180.0 ;
   zon_do_20 = 15.0 ;
   zon_do_21 = 180.0 ;
   zon_do_22 = 15.0 ;
   zon_do_23 = 180.0 ;
   return;
   }
  if ( mu_0 == 9 )
   {
   zon_bo_6 = iBands(NULL,0,145,2.0,0,0,2,1)<=Close[1] && iBands(NULL,0,145,2.0,0,0,2,2)>Close[2] ;
   zon_bo_7 = iBands(NULL,0,145,2.0,0,0,1,1)>Close[1] && iBands(NULL,0,145,2.0,0,0,1,2)<=Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iMA(NULL,0,25,0,MODE_EMA,PRICE_CLOSE,1) - iATR(NULL,0,170,1) * 12.0;
   zon_do_11=iMA(NULL,0,25,0,MODE_EMA,PRICE_CLOSE,1) + iATR(NULL,0,170,1) * 12.0;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=zon_do_67 * 80.0;
   zon_do_17 = zon_do_16 ;
   zon_do_14=iATR(NULL,0,130,1) * 0.5;
   zon_do_15=iATR(NULL,0,170,1) * 24.0;
   zon_do_26 = 95.0 ;
   zon_do_27 = 185.0 ;
   zon_do_24 = 95.0 ;
   zon_do_25 = 185.0 ;
   zon_do_28 = 95.0 ;
   zon_do_29 = 185.0 ;
   zon_do_20 = 95.0 ;
   zon_do_21 = 185.0 ;
   zon_do_22 = 95.0 ;
   zon_do_23 = 185.0 ;
   return;
   }
  if ( mu_0 == 10 )
   {
   zon_bo_6 = iStochastic(NULL,0,55,1,3,0,0,1,1)<=30.0 && iStochastic(NULL,0,55,1,3,0,0,1,2)>30.0 ;
   zon_bo_7 = iStochastic(NULL,0,55,1,3,0,0,1,1)>70.0 && iStochastic(NULL,0,55,1,3,0,0,1,2)<=70.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=iATR(NULL,0,150,1) * 11.0;
   zon_do_15=iATR(NULL,0,190,1) * 14.0;
   zon_do_26 = 130.0 ;
   zon_do_27 = 170.0 ;
   zon_do_24 = 130.0 ;
   zon_do_25 = 170.0 ;
   zon_do_28 = 130.0 ;
   zon_do_29 = 170.0 ;
   zon_do_20 = 130.0 ;
   zon_do_21 = 170.0 ;
   zon_do_22 = 130.0 ;
   zon_do_23 = 170.0 ;
   return;
   }
  if ( mu_0 == 11 )
   {
   zon_bo_6 = iStochastic(NULL,0,35,1,3,0,0,1,1)>80.0 && iStochastic(NULL,0,35,1,3,0,0,1,2)<=80.0 ;
   zon_bo_7 = iStochastic(NULL,0,35,1,3,0,0,1,1)<=20.0 && iStochastic(NULL,0,35,1,3,0,0,1,2)>20.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=zon_do_67 * 195.0;
   zon_do_17 = zon_do_16 ;
   zon_do_14=zon_do_67 * 185.0;
   zon_do_15=zon_do_67 * 180.0;
   zon_do_26 = 115.0 ;
   zon_do_27 = 195.0 ;
   zon_do_24 = 115.0 ;
   zon_do_25 = 195.0 ;
   zon_do_28 = 115.0 ;
   zon_do_29 = 195.0 ;
   zon_do_20 = 115.0 ;
   zon_do_21 = 195.0 ;
   zon_do_22 = 115.0 ;
   zon_do_23 = 195.0 ;
   return;
   }
  if ( mu_0 == 12 )
   {
   zon_bo_6 = iBands(NULL,0,150,2.0,0,0,2,1)>Close[1] && iBands(NULL,0,150,2.0,0,0,2,2)<=Close[2] ;
   zon_bo_7 = iBands(NULL,0,150,2.0,0,0,1,1)<=Close[1] && iBands(NULL,0,150,2.0,0,0,1,2)>Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iBands(NULL,0,130,2.0,0,0,2,1) + zon_do_67 * 155.0;
   zon_do_11=iBands(NULL,0,130,2.0,0,0,1,1) - zon_do_67 * 155.0;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14 = zon_do_67 * 155.0 ;
   zon_do_15=zon_do_67 * 20.0;
   zon_do_26 = 125.0 ;
   zon_do_27 = 195.0 ;
   zon_do_24 = 125.0 ;
   zon_do_25 = 195.0 ;
   zon_do_28 = 125.0 ;
   zon_do_29 = 195.0 ;
   zon_do_20 = 125.0 ;
   zon_do_21 = 195.0 ;
   zon_do_22 = 125.0 ;
   zon_do_23 = 195.0 ;
   return;
   }
  if ( mu_0 == 13 )
   {
   zon_bo_6 = iBands(NULL,0,20,2.0,0,0,2,1)>Close[1] && iBands(NULL,0,20,2.0,0,0,2,2)<=Close[2] ;
   zon_bo_7 = iBands(NULL,0,20,2.0,0,0,1,1)<=Close[1] && iBands(NULL,0,20,2.0,0,0,1,2)>Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=zon_do_67 * 165.0;
   zon_do_13 = zon_do_12 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=iATR(NULL,0,30,1) * 22.0;
   zon_do_15 = 0.0 ;
   zon_do_26 = 135.0 ;
   zon_do_27 = 170.0 ;
   zon_do_24 = 135.0 ;
   zon_do_25 = 170.0 ;
   zon_do_28 = 135.0 ;
   zon_do_29 = 170.0 ;
   zon_do_20 = 135.0 ;
   zon_do_21 = 170.0 ;
   zon_do_22 = 135.0 ;
   zon_do_23 = 170.0 ;
   return;
   }
  if ( mu_0 == 14 )
   {
   zon_bo_6 = iMACD(NULL,0,10,140,1,PRICE_CLOSE,0,1)>0.0 && iMACD(NULL,0,10,140,1,PRICE_CLOSE,0,2)<=0.0 ;
   zon_bo_7 = iMACD(NULL,0,10,140,1,PRICE_CLOSE,0,1)<=0.0 && iMACD(NULL,0,10,140,1,PRICE_CLOSE,0,2)>0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iBands(NULL,0,40,1.0,0,0,1,1) - iATR(NULL,0,15,1) * 5.5;
   zon_do_11=iBands(NULL,0,40,1.0,0,0,2,1) + iATR(NULL,0,15,1) * 5.5;
   zon_do_12=zon_do_67 * 55.0;
   zon_do_13 = zon_do_12 ;
   zon_do_16=iATR(NULL,0,90,1) * 3.0;
   zon_do_17=iATR(NULL,0,90,1) * 3.0;
   zon_do_14=zon_do_67 * 170.0;
   zon_do_15=zon_do_67 * 145.0;
   zon_do_26 = 90.0 ;
   zon_do_27 = 135.0 ;
   zon_do_24 = 90.0 ;
   zon_do_25 = 135.0 ;
   zon_do_28 = 90.0 ;
   zon_do_29 = 135.0 ;
   zon_do_20 = 90.0 ;
   zon_do_21 = 135.0 ;
   zon_do_22 = 90.0 ;
   zon_do_23 = 135.0 ;
   return;
   }
  if ( mu_0 == 15 )
   {
   zon_bo_6 = iMACD(NULL,0,35,90,1,PRICE_CLOSE,0,1)>0.0 && iMACD(NULL,0,35,90,1,PRICE_CLOSE,0,2)<=0.0 ;
   zon_bo_7 = iMACD(NULL,0,35,90,1,PRICE_CLOSE,0,1)<=0.0 && iMACD(NULL,0,35,90,1,PRICE_CLOSE,0,2)>0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=iATR(NULL,0,10,1) * 3.0;
   zon_do_13=iATR(NULL,0,10,1) * 3.0;
   zon_do_16=iATR(NULL,0,50,1) * 14.5;
   zon_do_17=iATR(NULL,0,50,1) * 14.5;
   zon_do_14=zon_do_67 * 180.0;
   zon_do_15=iATR(NULL,0,20,1) * 13.0;
   zon_do_26 = 85.0 ;
   zon_do_27 = 160.0 ;
   zon_do_24 = 85.0 ;
   zon_do_25 = 160.0 ;
   zon_do_28 = 85.0 ;
   zon_do_29 = 160.0 ;
   zon_do_20 = 85.0 ;
   zon_do_21 = 160.0 ;
   zon_do_22 = 85.0 ;
   zon_do_23 = 160.0 ;
   return;
   }
  if ( mu_0 == 16 )
   {
   zon_bo_6 = iMACD(NULL,0,10,140,1,PRICE_CLOSE,0,1)>0.0 && iMACD(NULL,0,10,140,1,PRICE_CLOSE,0,2)<=0.0 ;
   zon_bo_7 = iMACD(NULL,0,10,140,1,PRICE_CLOSE,0,1)<=0.0 && iMACD(NULL,0,10,140,1,PRICE_CLOSE,0,2)>0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iBands(NULL,0,85,2.0,0,0,2,1) + zon_do_67 * 155.0;
   zon_do_11=iBands(NULL,0,85,2.0,0,0,1,1) - zon_do_67 * 155.0;
   zon_do_12=iATR(NULL,0,160,1) * 4.0;
   zon_do_13=iATR(NULL,0,160,1) * 4.0;
   zon_do_16 = iATR(NULL,0,95,1) ;
   zon_do_17 = iATR(NULL,0,95,1) ;
   zon_do_14=iATR(NULL,0,35,1) * 24.0;
   zon_do_15=iATR(NULL,0,130,1) * 18.0;
   zon_do_26 = 90.0 ;
   zon_do_27 = 150.0 ;
   zon_do_24 = 90.0 ;
   zon_do_25 = 150.0 ;
   zon_do_28 = 90.0 ;
   zon_do_29 = 150.0 ;
   zon_do_20 = 90.0 ;
   zon_do_21 = 150.0 ;
   zon_do_22 = 90.0 ;
   zon_do_23 = 150.0 ;
   return;
   }
  if ( mu_0 == 17 )
   {
   zon_bo_6 = iBands(NULL,0,25,2.0,0,0,2,1)>Close[1] && iBands(NULL,0,25,2.0,0,0,2,2)<=Close[2] ;
   zon_bo_7 = iBands(NULL,0,25,2.0,0,0,1,1)<=Close[1] && iBands(NULL,0,25,2.0,0,0,1,2)>Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iMA(NULL,0,20,0,MODE_EMA,PRICE_CLOSE,1) + zon_do_67 * 170.0;
   zon_do_11=iMA(NULL,0,20,0,MODE_EMA,PRICE_CLOSE,1) - zon_do_67 * 170.0;
   zon_do_12=zon_do_67 * 140.0;
   zon_do_13 = zon_do_12 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=zon_do_67 * 130.0;
   zon_do_15 = 0.0 ;
   zon_do_26 = 120.0 ;
   zon_do_27 = 155.0 ;
   zon_do_24 = 120.0 ;
   zon_do_25 = 155.0 ;
   zon_do_28 = 120.0 ;
   zon_do_29 = 155.0 ;
   zon_do_20 = 120.0 ;
   zon_do_21 = 155.0 ;
   zon_do_22 = 120.0 ;
   zon_do_23 = 155.0 ;
   return;
   }
  if ( mu_0 == 18 )
   {
   zon_bo_6 = iCCI(NULL,0,15,0,1)<=0.0 && iCCI(NULL,0,15,0,2)>0.0 ;
   zon_bo_7 = iCCI(NULL,0,15,0,1)>0.0 && iCCI(NULL,0,15,0,2)<=0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=zon_do_67 * 165.0;
   zon_do_15=zon_do_67 * 70.0;
   zon_do_26 = 120.0 ;
   zon_do_27 = 180.0 ;
   zon_do_24 = 120.0 ;
   zon_do_25 = 180.0 ;
   zon_do_28 = 120.0 ;
   zon_do_29 = 180.0 ;
   zon_do_20 = 120.0 ;
   zon_do_21 = 180.0 ;
   zon_do_22 = 120.0 ;
   zon_do_23 = 180.0 ;
   return;
   }
  if ( mu_0 == 19 )
   {
   zon_bo_6 = iBands(NULL,0,30,2.0,0,0,2,1)<=Close[1] && iBands(NULL,0,30,2.0,0,0,2,2)>Close[2] ;
   zon_bo_7 = iBands(NULL,0,30,2.0,0,0,1,1)>Close[1] && iBands(NULL,0,30,2.0,0,0,1,2)<=Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=zon_do_67 * 190.0;
   zon_do_13 = zon_do_12 ;
   zon_do_16=iATR(NULL,0,50,1) * 5.0;
   zon_do_17=iATR(NULL,0,50,1) * 5.0;
   zon_do_14=zon_do_67 * 150.0;
   zon_do_15 = zon_do_14 ;
   zon_do_26 = 85.0 ;
   zon_do_27 = 185.0 ;
   zon_do_24 = 85.0 ;
   zon_do_25 = 185.0 ;
   zon_do_28 = 85.0 ;
   zon_do_29 = 185.0 ;
   zon_do_20 = 85.0 ;
   zon_do_21 = 185.0 ;
   zon_do_22 = 85.0 ;
   zon_do_23 = 185.0 ;
   return;
   }
  if (mu_0 != 20)  return;
  zon_bo_6 = iStochastic(NULL,0,155,1,3,0,0,1,1)<=30.0 && iStochastic(NULL,0,155,1,3,0,0,1,2)>30.0 ;
  zon_bo_7 = iStochastic(NULL,0,155,1,3,0,0,1,1)>70.0 && iStochastic(NULL,0,155,1,3,0,0,1,2)<=70.0 ;
  zon_in_18 = 0 ;
  zon_do_8 = 0.0 ;
  zon_do_9 = 0.0 ;
  zon_do_10=iMA(NULL,0,100,0,MODE_EMA,PRICE_CLOSE,1) - zon_do_67 * 155.0;
  zon_do_11=iMA(NULL,0,100,0,MODE_EMA,PRICE_CLOSE,1) + zon_do_67 * 155.0;
  zon_do_12 = 0.0 ;
  zon_do_13 = 0.0 ;
  zon_do_16 = 0.0 ;
  zon_do_17 = 0.0 ;
  zon_do_14=zon_do_67 * 85.0;
  zon_do_15 = 0.0 ;
  zon_do_26 = 160.0 ;
  zon_do_27 = 195.0 ;
  zon_do_24 = 160.0 ;
  zon_do_25 = 195.0 ;
  zon_do_28 = 160.0 ;
  zon_do_29 = 195.0 ;
  zon_do_20 = 160.0 ;
  zon_do_21 = 195.0 ;
  zon_do_22 = 160.0 ;
  zon_do_23 = 195.0 ;
  return;
  }
*/  
// if ( StringFind(zi_st_1,"EURUSD",0) >= 0 && Period() == 30 )
if (EURUSD_30)
  {
  if ( mu_0 == 1 )
   {
   zon_bo_6 = iRSI(NULL,0,130,0,1)>50.0 && iRSI(NULL,0,130,0,2)<=50.0 ;
   zon_bo_7 = iRSI(NULL,0,130,0,1)<=50.0 && iRSI(NULL,0,130,0,2)>50.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=iATR(NULL,0,110,1) * 3.5;
   zon_do_13=iATR(NULL,0,110,1) * 3.5;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=zon_do_67 * 55.0;
   zon_do_15 = 0.0 ;
   zon_do_26 = 20.0 ;
   zon_do_27 = 60.0 ;
   zon_do_24 = 20.0 ;
   zon_do_25 = 60.0 ;
   zon_do_28 = 20.0 ;
   zon_do_29 = 60.0 ;
   zon_do_20 = 20.0 ;
   zon_do_21 = 60.0 ;
   zon_do_22 = 20.0 ;
   zon_do_23 = 60.0 ;
   return;
   }
  if ( mu_0 == 2 )
   {
   zon_bo_6 = iStochastic(NULL,0,15,1,3,0,0,1,1)>70.0 && iStochastic(NULL,0,15,1,3,0,0,1,2)<=70.0 ;
   zon_bo_7 = iStochastic(NULL,0,15,1,3,0,0,1,1)<=30.0 && iStochastic(NULL,0,15,1,3,0,0,1,2)>30.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=iATR(NULL,0,70,1) * 7.0;
   zon_do_15=iATR(NULL,0,110,1) * 23.0;
   zon_do_26 = 165.0 ;
   zon_do_27 = 195.0 ;
   zon_do_24 = 165.0 ;
   zon_do_25 = 195.0 ;
   zon_do_28 = 165.0 ;
   zon_do_29 = 195.0 ;
   zon_do_20 = 165.0 ;
   zon_do_21 = 195.0 ;
   zon_do_22 = 165.0 ;
   zon_do_23 = 195.0 ;
   return;
   }
  if ( mu_0 == 3 )
   {
   zon_bo_6 = iCCI(NULL,0,100,0,1)<=0.0 && iCCI(NULL,0,100,0,2)>0.0 ;
   zon_bo_7 = iCCI(NULL,0,100,0,1)>0.0 && iCCI(NULL,0,100,0,2)<=0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=zon_do_67 * 45.0;
   zon_do_17 = zon_do_16 ;
   zon_do_14=iATR(NULL,0,190,1) * 20.5;
   zon_do_15=iATR(NULL,0,130,1) * 11.5;
   zon_do_26 = 90.0 ;
   zon_do_27 = 170.0 ;
   zon_do_24 = 90.0 ;
   zon_do_25 = 170.0 ;
   zon_do_28 = 90.0 ;
   zon_do_29 = 170.0 ;
   zon_do_20 = 90.0 ;
   zon_do_21 = 170.0 ;
   zon_do_22 = 90.0 ;
   zon_do_23 = 170.0 ;
   return;
   }
  if ( mu_0 == 4 )
   {
   zon_bo_6 = iBands(NULL,0,75,2.0,0,0,2,1)<=Close[1] && iBands(NULL,0,75,2.0,0,0,2,2)>Close[2] ;
   zon_bo_7 = iBands(NULL,0,75,2.0,0,0,1,1)>Close[1] && iBands(NULL,0,75,2.0,0,0,1,2)<=Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iBands(NULL,0,20,2.0,0,0,1,1) - zon_do_67 * 190.0;
   zon_do_11=iBands(NULL,0,20,2.0,0,0,2,1) + zon_do_67 * 190.0;
   zon_do_12=iATR(NULL,0,130,1) * 6.0;
   zon_do_13=iATR(NULL,0,130,1) * 6.0;
   zon_do_16=zon_do_67 * 145.0;
   zon_do_17 = zon_do_16 ;
   zon_do_14=zon_do_67 * 30.0;
   zon_do_15 = 0.0 ;
   zon_do_26 = 80.0 ;
   zon_do_27 = 95.0 ;
   zon_do_24 = 80.0 ;
   zon_do_25 = 95.0 ;
   zon_do_28 = 80.0 ;
   zon_do_29 = 95.0 ;
   zon_do_20 = 80.0 ;
   zon_do_21 = 95.0 ;
   zon_do_22 = 80.0 ;
   zon_do_23 = 95.0 ;
   return;
   }
  if ( mu_0 == 5 )
   {
   zon_bo_6 = iStochastic(NULL,0,25,1,3,0,0,1,1)>50.0 && iStochastic(NULL,0,25,1,3,0,0,1,2)<=50.0 ;
   zon_bo_7 = iStochastic(NULL,0,25,1,3,0,0,1,1)<=50.0 && iStochastic(NULL,0,25,1,3,0,0,1,2)>50.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iBands(NULL,0,60,1.0,0,0,2,1) + iATR(NULL,0,180,1) * 4.0;
   zon_do_11=iBands(NULL,0,60,1.0,0,0,1,1) - iATR(NULL,0,180,1) * 4.0;
   zon_do_12=iATR(NULL,0,190,1) * 17.5;
   zon_do_13=iATR(NULL,0,190,1) * 17.5;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=zon_do_67 * 80.0;
   zon_do_15 = 0.0 ;
   zon_do_26 = 140.0 ;
   zon_do_27 = 190.0 ;
   zon_do_24 = 140.0 ;
   zon_do_25 = 190.0 ;
   zon_do_28 = 140.0 ;
   zon_do_29 = 190.0 ;
   zon_do_20 = 140.0 ;
   zon_do_21 = 190.0 ;
   zon_do_22 = 140.0 ;
   zon_do_23 = 190.0 ;
   return;
   }
  if ( mu_0 == 6 )
   {
   zon_bo_6 = iStochastic(NULL,0,65,1,3,0,0,1,1)<=30.0 && iStochastic(NULL,0,65,1,3,0,0,1,2)>30.0 ;
   zon_bo_7 = iStochastic(NULL,0,65,1,3,0,0,1,1)>70.0 && iStochastic(NULL,0,65,1,3,0,0,1,2)<=70.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=zon_do_67 * 155.0;
   zon_do_13 = zon_do_12 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=zon_do_67 * 100.0;
   zon_do_15 = 0.0 ;
   zon_do_26 = 85.0 ;
   zon_do_27 = 195.0 ;
   zon_do_24 = 85.0 ;
   zon_do_25 = 195.0 ;
   zon_do_28 = 85.0 ;
   zon_do_29 = 195.0 ;
   zon_do_20 = 85.0 ;
   zon_do_21 = 195.0 ;
   zon_do_22 = 85.0 ;
   zon_do_23 = 195.0 ;
   return;
   }
  if ( mu_0 == 7 )
   {
   zon_bo_6 = iRSI(NULL,0,15,0,1)>70.0 && iRSI(NULL,0,15,0,2)<=70.0 ;
   zon_bo_7 = iRSI(NULL,0,15,0,1)<=30.0 && iRSI(NULL,0,15,0,2)>30.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iMA(NULL,0,40,0,MODE_SMA,PRICE_CLOSE,1) - iATR(NULL,0,45,1) * 23.5;
   zon_do_11=iMA(NULL,0,40,0,MODE_SMA,PRICE_CLOSE,1) + iATR(NULL,0,45,1) * 23.5;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=zon_do_67 * 115.0;
   zon_do_17 = zon_do_16 ;
   zon_do_14=zon_do_67 * 35.0;
   zon_do_15=zon_do_67 * 180.0;
   zon_do_26 = 50.0 ;
   zon_do_27 = 130.0 ;
   zon_do_24 = 50.0 ;
   zon_do_25 = 130.0 ;
   zon_do_28 = 50.0 ;
   zon_do_29 = 130.0 ;
   zon_do_20 = 50.0 ;
   zon_do_21 = 130.0 ;
   zon_do_22 = 50.0 ;
   zon_do_23 = 130.0 ;
   return;
   }
  if ( mu_0 == 8 )
   {
   zon_bo_6 = iCCI(NULL,0,150,0,1)<=0.0 && iCCI(NULL,0,150,0,2)>0.0 ;
   zon_bo_7 = iCCI(NULL,0,150,0,1)>0.0 && iCCI(NULL,0,150,0,2)<=0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=zon_do_67 * 60.0;
   zon_do_17 = zon_do_16 ;
   zon_do_14=iATR(NULL,0,140,1) * 22.5;
   zon_do_15=iATR(NULL,0,200,1) * 23.0;
   zon_do_26 = 45.0 ;
   zon_do_27 = 150.0 ;
   zon_do_24 = 45.0 ;
   zon_do_25 = 150.0 ;
   zon_do_28 = 45.0 ;
   zon_do_29 = 150.0 ;
   zon_do_20 = 45.0 ;
   zon_do_21 = 150.0 ;
   zon_do_22 = 45.0 ;
   zon_do_23 = 150.0 ;
   return;
   }
  if ( mu_0 == 9 )
   {
   zon_bo_6 = iBands(NULL,0,70,2.0,0,0,2,1)>Close[1] && iBands(NULL,0,70,2.0,0,0,2,2)<=Close[2] ;
   zon_bo_7 = iBands(NULL,0,70,2.0,0,0,1,1)<=Close[1] && iBands(NULL,0,70,2.0,0,0,1,2)>Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=iATR(NULL,0,10,1) * 12.5;
   zon_do_13=iATR(NULL,0,10,1) * 12.5;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=iATR(NULL,0,80,1) * 2.5;
   zon_do_15 = 0.0 ;
   zon_do_26 = 85.0 ;
   zon_do_27 = 145.0 ;
   zon_do_24 = 85.0 ;
   zon_do_25 = 145.0 ;
   zon_do_28 = 85.0 ;
   zon_do_29 = 145.0 ;
   zon_do_20 = 85.0 ;
   zon_do_21 = 145.0 ;
   zon_do_22 = 85.0 ;
   zon_do_23 = 145.0 ;
   return;
   }
  if ( mu_0 == 10 )
   {
   zon_bo_6 = iBands(NULL,0,90,2.0,0,0,2,1)>Close[1] && iBands(NULL,0,90,2.0,0,0,2,2)<=Close[2] ;
   zon_bo_7 = iBands(NULL,0,90,2.0,0,0,1,1)<=Close[1] && iBands(NULL,0,90,2.0,0,0,1,2)>Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=zon_do_67 * 35.0;
   zon_do_13 = zon_do_12 ;
   zon_do_16=zon_do_67 * 160.0;
   zon_do_17 = zon_do_16 ;
   zon_do_14=zon_do_67 * 65.0;
   zon_do_15 = 0.0 ;
   zon_do_26 = 65.0 ;
   zon_do_27 = 80.0 ;
   zon_do_24 = 65.0 ;
   zon_do_25 = 80.0 ;
   zon_do_28 = 65.0 ;
   zon_do_29 = 80.0 ;
   zon_do_20 = 65.0 ;
   zon_do_21 = 80.0 ;
   zon_do_22 = 65.0 ;
   zon_do_23 = 80.0 ;
   return;
   }
  if ( mu_0 == 11 )
   {
   zon_bo_6 = iBands(NULL,0,95,1.0,0,0,1,1)<=Close[1] && iBands(NULL,0,95,1.0,0,0,1,2)>Close[2] ;
   zon_bo_7 = iBands(NULL,0,95,1.0,0,0,2,1)>Close[1] && iBands(NULL,0,95,1.0,0,0,2,2)<=Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=zon_do_67 * 80.0;
   zon_do_17 = zon_do_16 ;
   zon_do_14=iATR(NULL,0,110,1) * 11.0;
   zon_do_15=iATR(NULL,0,10,1) * 11.5;
   zon_do_26 = 120.0 ;
   zon_do_27 = 135.0 ;
   zon_do_24 = 120.0 ;
   zon_do_25 = 135.0 ;
   zon_do_28 = 120.0 ;
   zon_do_29 = 135.0 ;
   zon_do_20 = 120.0 ;
   zon_do_21 = 135.0 ;
   zon_do_22 = 120.0 ;
   zon_do_23 = 135.0 ;
   return;
   }
  if ( mu_0 == 12 )
   {
   zon_bo_6 = iBands(NULL,0,90,2.0,0,0,2,1)<=Close[1] && iBands(NULL,0,90,2.0,0,0,2,2)>Close[2] ;
   zon_bo_7 = iBands(NULL,0,90,2.0,0,0,1,1)>Close[1] && iBands(NULL,0,90,2.0,0,0,1,2)<=Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=zon_do_67 * 30.0;
   zon_do_13 = zon_do_12 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14 = iATR(NULL,0,65,1) ;
   zon_do_15 = 0.0 ;
   zon_do_26 = 65.0 ;
   zon_do_27 = 180.0 ;
   zon_do_24 = 65.0 ;
   zon_do_25 = 180.0 ;
   zon_do_28 = 65.0 ;
   zon_do_29 = 180.0 ;
   zon_do_20 = 65.0 ;
   zon_do_21 = 180.0 ;
   zon_do_22 = 65.0 ;
   zon_do_23 = 180.0 ;
   return;
   }
  if ( mu_0 == 13 )
   {
   zon_bo_6 = iBands(NULL,0,75,2.0,0,0,2,1)<=Close[1] && iBands(NULL,0,75,2.0,0,0,2,2)>Close[2] ;
   zon_bo_7 = iBands(NULL,0,75,2.0,0,0,1,1)>Close[1] && iBands(NULL,0,75,2.0,0,0,1,2)<=Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iBands(NULL,0,20,2.0,0,0,1,1) - zon_do_67 * 190.0;
   zon_do_11=iBands(NULL,0,20,2.0,0,0,2,1) + zon_do_67 * 190.0;
   zon_do_12=iATR(NULL,0,130,1) * 6.0;
   zon_do_13=iATR(NULL,0,130,1) * 6.0;
   zon_do_16=zon_do_67 * 145.0;
   zon_do_17 = zon_do_16 ;
   zon_do_14=zon_do_67 * 30.0;
   zon_do_15 = 0.0 ;
   zon_do_26 = 80.0 ;
   zon_do_27 = 95.0 ;
   zon_do_24 = 80.0 ;
   zon_do_25 = 95.0 ;
   zon_do_28 = 80.0 ;
   zon_do_29 = 95.0 ;
   zon_do_20 = 80.0 ;
   zon_do_21 = 95.0 ;
   zon_do_22 = 80.0 ;
   zon_do_23 = 95.0 ;
   return;
   }
  if ( mu_0 == 14 )
   {
   zon_bo_6 = iBands(NULL,0,75,2.0,0,0,2,1)<=Close[1] && iBands(NULL,0,75,2.0,0,0,2,2)>Close[2] ;
   zon_bo_7 = iBands(NULL,0,75,2.0,0,0,1,1)>Close[1] && iBands(NULL,0,75,2.0,0,0,1,2)<=Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iBands(NULL,0,20,2.0,0,0,1,1) - zon_do_67 * 190.0;
   zon_do_11=iBands(NULL,0,20,2.0,0,0,2,1) + zon_do_67 * 190.0;
   zon_do_12=iATR(NULL,0,130,1) * 6.0;
   zon_do_13=iATR(NULL,0,130,1) * 6.0;
   zon_do_16=zon_do_67 * 145.0;
   zon_do_17 = zon_do_16 ;
   zon_do_14=zon_do_67 * 30.0;
   zon_do_15 = 0.0 ;
   zon_do_26 = 80.0 ;
   zon_do_27 = 95.0 ;
   zon_do_24 = 80.0 ;
   zon_do_25 = 95.0 ;
   zon_do_28 = 80.0 ;
   zon_do_29 = 95.0 ;
   zon_do_20 = 80.0 ;
   zon_do_21 = 95.0 ;
   zon_do_22 = 80.0 ;
   zon_do_23 = 95.0 ;
   return;
   }
  if ( mu_0 == 15 )
   {
   zon_bo_6 = iStochastic(NULL,0,40,1,3,0,0,1,1)>80.0 && iStochastic(NULL,0,40,1,3,0,0,1,2)<=80.0 ;
   zon_bo_7 = iStochastic(NULL,0,40,1,3,0,0,1,1)<=20.0 && iStochastic(NULL,0,40,1,3,0,0,1,2)>20.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iMA(NULL,0,5,0,MODE_EMA,PRICE_CLOSE,1) + zon_do_67 * 60.0;
   zon_do_11=iMA(NULL,0,5,0,MODE_EMA,PRICE_CLOSE,1) - zon_do_67 * 60.0;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=zon_do_67 * 90.0;
   zon_do_15=zon_do_67 * 80.0;
   zon_do_26 = 160.0 ;
   zon_do_27 = 160.0 ;
   zon_do_24 = 160.0 ;
   zon_do_25 = 160.0 ;
   zon_do_28 = 160.0 ;
   zon_do_29 = 160.0 ;
   zon_do_20 = 160.0 ;
   zon_do_21 = 160.0 ;
   zon_do_22 = 160.0 ;
   zon_do_23 = 160.0 ;
   return;
   }
  if ( mu_0 == 16 )
   {
   zon_bo_6 = iBands(NULL,0,70,2.0,0,0,2,1)>Close[1] && iBands(NULL,0,70,2.0,0,0,2,2)<=Close[2] ;
   zon_bo_7 = iBands(NULL,0,70,2.0,0,0,1,1)<=Close[1] && iBands(NULL,0,70,2.0,0,0,1,2)>Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=iATR(NULL,0,10,1) * 12.5;
   zon_do_13=iATR(NULL,0,10,1) * 12.5;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=iATR(NULL,0,80,1) * 2.5;
   zon_do_15 = 0.0 ;
   zon_do_26 = 85.0 ;
   zon_do_27 = 145.0 ;
   zon_do_24 = 85.0 ;
   zon_do_25 = 145.0 ;
   zon_do_28 = 85.0 ;
   zon_do_29 = 145.0 ;
   zon_do_20 = 85.0 ;
   zon_do_21 = 145.0 ;
   zon_do_22 = 85.0 ;
   zon_do_23 = 145.0 ;
   return;
   }
  if ( mu_0 == 17 )
   {
   zon_bo_6 = iCCI(NULL,0,100,0,1)<=0.0 && iCCI(NULL,0,100,0,2)>0.0 ;
   zon_bo_7 = iCCI(NULL,0,100,0,1)>0.0 && iCCI(NULL,0,100,0,2)<=0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=zon_do_67 * 90.0;
   zon_do_17 = zon_do_16 ;
   zon_do_14=zon_do_67 * 55.0;
   zon_do_15=iATR(NULL,0,10,1) * 10.0;
   zon_do_26 = 95.0 ;
   zon_do_27 = 155.0 ;
   zon_do_24 = 95.0 ;
   zon_do_25 = 155.0 ;
   zon_do_28 = 95.0 ;
   zon_do_29 = 155.0 ;
   zon_do_20 = 95.0 ;
   zon_do_21 = 155.0 ;
   zon_do_22 = 95.0 ;
   zon_do_23 = 155.0 ;
   return;
   }
  if ( mu_0 == 18 )
   {
   zon_bo_6 = iStochastic(NULL,0,65,1,3,0,0,1,1)<=30.0 && iStochastic(NULL,0,65,1,3,0,0,1,2)>30.0 ;
   zon_bo_7 = iStochastic(NULL,0,65,1,3,0,0,1,1)>70.0 && iStochastic(NULL,0,65,1,3,0,0,1,2)<=70.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=zon_do_67 * 155.0;
   zon_do_13 = zon_do_12 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=zon_do_67 * 100.0;
   zon_do_15 = 0.0 ;
   zon_do_26 = 85.0 ;
   zon_do_27 = 195.0 ;
   zon_do_24 = 85.0 ;
   zon_do_25 = 195.0 ;
   zon_do_28 = 85.0 ;
   zon_do_29 = 195.0 ;
   zon_do_20 = 85.0 ;
   zon_do_21 = 195.0 ;
   zon_do_22 = 85.0 ;
   zon_do_23 = 195.0 ;
   return;
   }
  if ( mu_0 == 19 )
   {
   zon_bo_6 = iStochastic(NULL,0,95,1,3,0,0,1,1)<=20.0 && iStochastic(NULL,0,95,1,3,0,0,1,2)>20.0 ;
   zon_bo_7 = iStochastic(NULL,0,95,1,3,0,0,1,1)>80.0 && iStochastic(NULL,0,95,1,3,0,0,1,2)<=80.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iMA(NULL,0,55,0,MODE_EMA,PRICE_CLOSE,1) + zon_do_67 * 165.0;
   zon_do_11=iMA(NULL,0,55,0,MODE_EMA,PRICE_CLOSE,1) - zon_do_67 * 165.0;
   zon_do_12=zon_do_67 * 130.0;
   zon_do_13 = zon_do_12 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=zon_do_67 * 185.0;
   zon_do_15 = 0.0 ;
   zon_do_26 = 85.0 ;
   zon_do_27 = 135.0 ;
   zon_do_24 = 85.0 ;
   zon_do_25 = 135.0 ;
   zon_do_28 = 85.0 ;
   zon_do_29 = 135.0 ;
   zon_do_20 = 85.0 ;
   zon_do_21 = 135.0 ;
   zon_do_22 = 85.0 ;
   zon_do_23 = 135.0 ;
   return;
   }
  if (mu_0 != 20)  return;
  zon_bo_6 = iBands(NULL,0,30,2.0,0,0,2,1)<=Close[1] && iBands(NULL,0,30,2.0,0,0,2,2)>Close[2] ;
  lin_in_492 = 1;
  zon_bo_7 = iBands(NULL,0,30,2.0,0,0,1,1)>Close[lin_in_492] && iBands(NULL,0,30,2.0,0,0,1,2)<=Close[2] ;
  zon_in_18 = 0 ;
  zon_do_8 = 0.0 ;
  zon_do_9 = 0.0 ;
  zon_do_10 = 0.0 ;
  zon_do_11 = 0.0 ;
  zon_do_12=iATR(NULL,0,70,1) * 21.0;
  zon_do_13=iATR(NULL,0,70,1) * 21.0;
  zon_do_16=zon_do_67 * 180.0;
  zon_do_17 = zon_do_16 ;
  zon_do_14 = zon_do_16 ;
  zon_do_15 = 0.0 ;
  zon_do_26 = 65.0 ;
  zon_do_27 = 75.0 ;
  zon_do_24 = 65.0 ;
  zon_do_25 = 75.0 ;
  zon_do_28 = 65.0 ;
  zon_do_29 = 75.0 ;
  zon_do_20 = 65.0 ;
  zon_do_21 = 75.0 ;
  zon_do_22 = 65.0 ;
  zon_do_23 = 75.0 ;
  return;
  }
/* if ( StringFind(zi_st_1,"AUDUSD",0) >= 0 && Period() == 60 )
  {
  if ( mu_0 == 1 )
   {
   zon_bo_6 = iBands(NULL,0,65,2.0,0,0,2,1)>Close[1] && iBands(NULL,0,65,2.0,0,0,2,2)<=Close[2] ;
   zon_bo_7 = iBands(NULL,0,65,2.0,0,0,1,1)<=Close[1] && iBands(NULL,0,65,2.0,0,0,1,2)>Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iBands(NULL,0,105,1.0,0,0,2,1) + zon_do_67 * 160.0;
   zon_do_11=iBands(NULL,0,105,1.0,0,0,1,1) - zon_do_67 * 160.0;
   zon_do_12=iATR(NULL,0,85,1) * 22.0;
   zon_do_13=iATR(NULL,0,85,1) * 22.0;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=zon_do_67 * 25.0;
   zon_do_15=zon_do_67 * 185.0;
   zon_do_26 = 75.0 ;
   zon_do_27 = 105.0 ;
   zon_do_24 = 75.0 ;
   zon_do_25 = 105.0 ;
   zon_do_28 = 75.0 ;
   zon_do_29 = 105.0 ;
   zon_do_20 = 75.0 ;
   zon_do_21 = 105.0 ;
   zon_do_22 = 75.0 ;
   zon_do_23 = 105.0 ;
   return;
   }
  if ( mu_0 == 2 )
   {
   lin_in_508 = 1;
   zon_bo_6 = iBands(NULL,0,125,2.0,0,0,1,1)>Close[lin_in_508] && iBands(NULL,0,125,2.0,0,0,1,2)<=Close[2] ;
   zon_bo_7 = iBands(NULL,0,125,2.0,0,0,2,1)<=Close[1] && iBands(NULL,0,125,2.0,0,0,2,2)>Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=iATR(NULL,0,25,1) * 11.0;
   zon_do_17=iATR(NULL,0,25,1) * 11.0;
   zon_do_14=iATR(NULL,0,40,1) * 19.0;
   zon_do_15=zon_do_67 * 40.0;
   zon_do_26 = 55.0 ;
   zon_do_27 = 190.0 ;
   zon_do_24 = 55.0 ;
   zon_do_25 = 190.0 ;
   zon_do_28 = 55.0 ;
   zon_do_29 = 190.0 ;
   zon_do_20 = 55.0 ;
   zon_do_21 = 190.0 ;
   zon_do_22 = 55.0 ;
   zon_do_23 = 190.0 ;
   return;
   }
  if ( mu_0 == 3 )
   {
   zon_bo_6 = iRSI(NULL,0,75,0,1)<=50.0 && iRSI(NULL,0,75,0,2)>50.0 ;
   zon_bo_7 = iRSI(NULL,0,75,0,1)>50.0 && iRSI(NULL,0,75,0,2)<=50.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=iATR(NULL,0,160,1) * 2.5;
   zon_do_17=iATR(NULL,0,160,1) * 2.5;
   zon_do_14=zon_do_67 * 170.0;
   zon_do_15=zon_do_67 * 125.0;
   zon_do_26 = 30.0 ;
   zon_do_27 = 155.0 ;
   zon_do_24 = 30.0 ;
   zon_do_25 = 155.0 ;
   zon_do_28 = 30.0 ;
   zon_do_29 = 155.0 ;
   zon_do_20 = 30.0 ;
   zon_do_21 = 155.0 ;
   zon_do_22 = 30.0 ;
   zon_do_23 = 155.0 ;
   return;
   }
  if ( mu_0 == 4 )
   {
   zon_bo_6 = iBands(NULL,0,15,2.0,0,0,2,1)<=Close[1] && iBands(NULL,0,15,2.0,0,0,2,2)>Close[2] ;
   zon_bo_7 = iBands(NULL,0,15,2.0,0,0,1,1)>Close[1] && iBands(NULL,0,15,2.0,0,0,1,2)<=Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iMA(NULL,0,30,0,MODE_SMA,PRICE_CLOSE,1) + iATR(NULL,0,45,1) * 4.0;
   zon_do_11=iMA(NULL,0,30,0,MODE_SMA,PRICE_CLOSE,1) - iATR(NULL,0,45,1) * 4.0;
   zon_do_12=zon_do_67 * 160.0;
   zon_do_13 = zon_do_12 ;
   zon_do_16=iATR(NULL,0,75,1) * 11.5;
   zon_do_17=iATR(NULL,0,75,1) * 11.5;
   zon_do_14=zon_do_67 * 65.0;
   zon_do_15=iATR(NULL,0,80,1) * 7.0;
   zon_do_26 = 135.0 ;
   zon_do_27 = 155.0 ;
   zon_do_24 = 135.0 ;
   zon_do_25 = 155.0 ;
   zon_do_28 = 135.0 ;
   zon_do_29 = 155.0 ;
   zon_do_20 = 135.0 ;
   zon_do_21 = 155.0 ;
   zon_do_22 = 135.0 ;
   zon_do_23 = 155.0 ;
   return;
   }
  if ( mu_0 == 5 )
   {
   zon_bo_6 = iMACD(NULL,0,15,280,1,PRICE_CLOSE,0,1)>0.0 && iMACD(NULL,0,15,280,1,PRICE_CLOSE,0,2)<=0.0 ;
   zon_bo_7 = iMACD(NULL,0,15,280,1,PRICE_CLOSE,0,1)<=0.0 && iMACD(NULL,0,15,280,1,PRICE_CLOSE,0,2)>0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=iATR(NULL,0,100,1) * 2.0;
   zon_do_13=iATR(NULL,0,100,1) * 2.0;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=iATR(NULL,0,75,1) * 8.5;
   zon_do_15=iATR(NULL,0,130,1) * 20.0;
   zon_do_26 = 45.0 ;
   zon_do_27 = 50.0 ;
   zon_do_24 = 45.0 ;
   zon_do_25 = 50.0 ;
   zon_do_28 = 45.0 ;
   zon_do_29 = 50.0 ;
   zon_do_20 = 45.0 ;
   zon_do_21 = 50.0 ;
   zon_do_22 = 45.0 ;
   zon_do_23 = 50.0 ;
   return;
   }
  if ( mu_0 == 6 )
   {
   zon_bo_6 = iMACD(NULL,0,35,160,1,PRICE_CLOSE,0,1)>0.0 && iMACD(NULL,0,35,160,1,PRICE_CLOSE,0,2)<=0.0 ;
   zon_bo_7 = iMACD(NULL,0,35,160,1,PRICE_CLOSE,0,1)<=0.0 && iMACD(NULL,0,35,160,1,PRICE_CLOSE,0,2)>0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iBands(NULL,0,55,1.0,0,0,1,1) - zon_do_67 * 105.0;
   zon_do_11=iBands(NULL,0,55,1.0,0,0,2,1) + zon_do_67 * 105.0;
   zon_do_12=iATR(NULL,0,70,1) * 4.5;
   zon_do_13=iATR(NULL,0,70,1) * 4.5;
   zon_do_16=zon_do_67 * 60.0;
   zon_do_17 = zon_do_16 ;
   zon_do_14=iATR(NULL,0,75,1) * 2.0;
   zon_do_15=zon_do_67 * 190.0;
   zon_do_26 = 50.0 ;
   zon_do_27 = 200.0 ;
   zon_do_24 = 50.0 ;
   zon_do_25 = 200.0 ;
   zon_do_28 = 50.0 ;
   zon_do_29 = 200.0 ;
   zon_do_20 = 50.0 ;
   zon_do_21 = 200.0 ;
   zon_do_22 = 50.0 ;
   zon_do_23 = 200.0 ;
   return;
   }
  if ( mu_0 == 7 )
   {
   zon_bo_6 = iStochastic(NULL,0,135,1,3,0,0,1,1)>70.0 && iStochastic(NULL,0,135,1,3,0,0,1,2)<=70.0 ;
   zon_bo_7 = iStochastic(NULL,0,135,1,3,0,0,1,1)<=30.0 && iStochastic(NULL,0,135,1,3,0,0,1,2)>30.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=iATR(NULL,0,120,1) * 5.0;
   zon_do_17=iATR(NULL,0,120,1) * 5.0;
   zon_do_14=iATR(NULL,0,40,1) * 21.0;
   zon_do_15=zon_do_67 * 115.0;
   zon_do_26 = 25.0 ;
   zon_do_27 = 120.0 ;
   zon_do_24 = 25.0 ;
   zon_do_25 = 120.0 ;
   zon_do_28 = 25.0 ;
   zon_do_29 = 120.0 ;
   zon_do_20 = 25.0 ;
   zon_do_21 = 120.0 ;
   zon_do_22 = 25.0 ;
   zon_do_23 = 120.0 ;
   return;
   }
  if ( mu_0 == 8 )
   {
   zon_bo_6 = iRSI(NULL,0,130,0,1)>50.0 && iRSI(NULL,0,130,0,2)<=50.0 ;
   zon_bo_7 = iRSI(NULL,0,130,0,1)<=50.0 && iRSI(NULL,0,130,0,2)>50.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=iATR(NULL,0,150,1) * 0.5;
   zon_do_17=iATR(NULL,0,150,1) * 0.5;
   zon_do_14=iATR(NULL,0,5,1) * 12.5;
   zon_do_15=iATR(NULL,0,30,1) * 21.0;
   zon_do_26 = 20.0 ;
   zon_do_27 = 140.0 ;
   zon_do_24 = 20.0 ;
   zon_do_25 = 140.0 ;
   zon_do_28 = 20.0 ;
   zon_do_29 = 140.0 ;
   zon_do_20 = 20.0 ;
   zon_do_21 = 140.0 ;
   zon_do_22 = 20.0 ;
   zon_do_23 = 140.0 ;
   return;
   }
  if ( mu_0 == 9 )
   {
   zon_bo_6 = iBands(NULL,0,25,1.0,0,0,1,1)>Close[1] && iBands(NULL,0,25,1.0,0,0,1,2)<=Close[2] ;
   zon_bo_7 = iBands(NULL,0,25,1.0,0,0,2,1)<=Close[1] && iBands(NULL,0,25,1.0,0,0,2,2)>Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=zon_do_67 * 90.0;
   zon_do_15=iATR(NULL,0,140,1) * 12.0;
   zon_do_26 = 150.0 ;
   zon_do_27 = 190.0 ;
   zon_do_24 = 150.0 ;
   zon_do_25 = 190.0 ;
   zon_do_28 = 150.0 ;
   zon_do_29 = 190.0 ;
   zon_do_20 = 150.0 ;
   zon_do_21 = 190.0 ;
   zon_do_22 = 150.0 ;
   zon_do_23 = 190.0 ;
   return;
   }
  if ( mu_0 == 10 )
   {
   zon_bo_6 = iBands(NULL,0,15,1.0,0,0,1,1)>Close[1] && iBands(NULL,0,15,1.0,0,0,1,2)<=Close[2] ;
   zon_bo_7 = iBands(NULL,0,15,1.0,0,0,2,1)<=Close[1] && iBands(NULL,0,15,1.0,0,0,2,2)>Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=zon_do_67 * 135.0;
   zon_do_15=iATR(NULL,0,60,1) * 19.0;
   zon_do_26 = 100.0 ;
   zon_do_27 = 185.0 ;
   zon_do_24 = 100.0 ;
   zon_do_25 = 185.0 ;
   zon_do_28 = 100.0 ;
   zon_do_29 = 185.0 ;
   zon_do_20 = 100.0 ;
   zon_do_21 = 185.0 ;
   zon_do_22 = 100.0 ;
   zon_do_23 = 185.0 ;
   return;
   }
  if ( mu_0 == 11 )
   {
   zon_bo_6 = iBands(NULL,0,30,2.0,0,0,2,1)>Close[1] && iBands(NULL,0,30,2.0,0,0,2,2)<=Close[2] ;
   zon_bo_7 = iBands(NULL,0,30,2.0,0,0,1,1)<=Close[1] && iBands(NULL,0,30,2.0,0,0,1,2)>Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iMA(NULL,0,15,0,MODE_EMA,PRICE_CLOSE,1) + iATR(NULL,0,10,1) * 9.5;
   lin_do_563 = iMA(NULL,0,15,0,MODE_EMA,PRICE_CLOSE,1);
   zon_do_11=lin_do_563 - iATR(NULL,0,10,1) * 9.5;
   zon_do_12=zon_do_67 * 25.0;
   zon_do_13 = zon_do_12 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=zon_do_67 * 85.0;
   zon_do_15 = 0.0 ;
   zon_do_26 = 140.0 ;
   zon_do_27 = 140.0 ;
   zon_do_24 = 140.0 ;
   zon_do_25 = 140.0 ;
   zon_do_28 = 140.0 ;
   zon_do_29 = 140.0 ;
   zon_do_20 = 140.0 ;
   zon_do_21 = 140.0 ;
   zon_do_22 = 140.0 ;
   zon_do_23 = 140.0 ;
   return;
   }
  if ( mu_0 == 12 )
   {
   zon_bo_6 = iBands(NULL,0,60,2.0,0,0,2,1)<=Close[1] && iBands(NULL,0,60,2.0,0,0,2,2)>Close[2] ;
   zon_bo_7 = iBands(NULL,0,60,2.0,0,0,1,1)>Close[1] && iBands(NULL,0,60,2.0,0,0,1,2)<=Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iMA(NULL,0,110,0,MODE_SMA,PRICE_CLOSE,1) - zon_do_67 * 190.0;
   zon_do_11=iMA(NULL,0,110,0,MODE_SMA,PRICE_CLOSE,1) + zon_do_67 * 190.0;
   zon_do_12=zon_do_67 * 110.0;
   zon_do_13 = zon_do_12 ;
   zon_do_16=iATR(NULL,0,90,1) * 13.5;
   zon_do_17=iATR(NULL,0,90,1) * 13.5;
   zon_do_14=zon_do_67 * 125.0;
   zon_do_15=iATR(NULL,0,150,1) * 11.0;
   zon_do_26 = 50.0 ;
   zon_do_27 = 195.0 ;
   zon_do_24 = 50.0 ;
   zon_do_25 = 195.0 ;
   zon_do_28 = 50.0 ;
   zon_do_29 = 195.0 ;
   zon_do_20 = 50.0 ;
   zon_do_21 = 195.0 ;
   zon_do_22 = 50.0 ;
   zon_do_23 = 195.0 ;
   return;
   }
  if ( mu_0 == 13 )
   {
   zon_bo_6 = iBands(NULL,0,20,1.0,0,0,2,1)>Close[1] && iBands(NULL,0,20,1.0,0,0,2,2)<=Close[2] ;
   zon_bo_7 = iBands(NULL,0,20,1.0,0,0,1,1)<=Close[1] && iBands(NULL,0,20,1.0,0,0,1,2)>Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iMA(NULL,0,150,0,MODE_EMA,PRICE_CLOSE,1) + iATR(NULL,0,160,1);
   zon_do_11=iMA(NULL,0,150,0,MODE_EMA,PRICE_CLOSE,1) - iATR(NULL,0,160,1);
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=iATR(NULL,0,170,1) * 12.5;
   zon_do_17=iATR(NULL,0,170,1) * 12.5;
   zon_do_14=iATR(NULL,0,140,1) * 14.0;
   zon_do_15=iATR(NULL,0,170,1) * 11.0;
   zon_do_26 = 145.0 ;
   zon_do_27 = 190.0 ;
   zon_do_24 = 145.0 ;
   zon_do_25 = 190.0 ;
   zon_do_28 = 145.0 ;
   zon_do_29 = 190.0 ;
   zon_do_20 = 145.0 ;
   zon_do_21 = 190.0 ;
   zon_do_22 = 145.0 ;
   zon_do_23 = 190.0 ;
   return;
   }
  if ( mu_0 == 14 )
   {
   zon_bo_6 = iBands(NULL,0,65,2.0,0,0,2,1)>Close[1] && iBands(NULL,0,65,2.0,0,0,2,2)<=Close[2] ;
   zon_bo_7 = iBands(NULL,0,65,2.0,0,0,1,1)<=Close[1] && iBands(NULL,0,65,2.0,0,0,1,2)>Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=iATR(NULL,0,200,1) * 21.0;
   zon_do_17=iATR(NULL,0,200,1) * 21.0;
   zon_do_14=zon_do_67 * 20.0;
   zon_do_15=zon_do_67 * 155.0;
   zon_do_26 = 100.0 ;
   zon_do_27 = 145.0 ;
   zon_do_24 = 100.0 ;
   zon_do_25 = 145.0 ;
   zon_do_28 = 100.0 ;
   zon_do_29 = 145.0 ;
   zon_do_20 = 100.0 ;
   zon_do_21 = 145.0 ;
   zon_do_22 = 100.0 ;
   zon_do_23 = 145.0 ;
   return;
   }
  if ( mu_0 == 15 )
   {
   zon_bo_6 = iMACD(NULL,0,30,50,1,PRICE_CLOSE,0,1)>0.0 && iMACD(NULL,0,30,50,1,PRICE_CLOSE,0,2)<=0.0 ;
   zon_bo_7 = iMACD(NULL,0,30,50,1,PRICE_CLOSE,0,1)<=0.0 && iMACD(NULL,0,30,50,1,PRICE_CLOSE,0,2)>0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=zon_do_67 * 125.0;
   zon_do_17 = zon_do_16 ;
   zon_do_14=zon_do_67 * 40.0;
   zon_do_15=iATR(NULL,0,40,1) * 14.5;
   zon_do_26 = 70.0 ;
   zon_do_27 = 120.0 ;
   zon_do_24 = 70.0 ;
   zon_do_25 = 120.0 ;
   zon_do_28 = 70.0 ;
   zon_do_29 = 120.0 ;
   zon_do_20 = 70.0 ;
   zon_do_21 = 120.0 ;
   zon_do_22 = 70.0 ;
   zon_do_23 = 120.0 ;
   return;
   }
  if ( mu_0 == 16 )
   {
   zon_bo_6 = iStochastic(NULL,0,15,1,3,0,0,1,1)>50.0 && iStochastic(NULL,0,15,1,3,0,0,1,2)<=50.0 ;
   zon_bo_7 = iStochastic(NULL,0,15,1,3,0,0,1,1)<=50.0 && iStochastic(NULL,0,15,1,3,0,0,1,2)>50.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iBands(NULL,0,155,2.0,0,0,2,1) + zon_do_67 * 60.0;
   zon_do_11=iBands(NULL,0,155,2.0,0,0,1,1) - zon_do_67 * 60.0;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=zon_do_67 * 10.0;
   zon_do_17 = zon_do_16 ;
   zon_do_14=iATR(NULL,0,60,1) * 24.5;
   zon_do_15 = 0.0 ;
   zon_do_26 = 105.0 ;
   zon_do_27 = 155.0 ;
   zon_do_24 = 105.0 ;
   zon_do_25 = 155.0 ;
   zon_do_28 = 105.0 ;
   zon_do_29 = 155.0 ;
   zon_do_20 = 105.0 ;
   zon_do_21 = 155.0 ;
   zon_do_22 = 105.0 ;
   zon_do_23 = 155.0 ;
   return;
   }
  if ( mu_0 == 17 )
   {
   zon_bo_6 = iMACD(NULL,0,5,90,1,PRICE_CLOSE,0,1)<=0.0 && iMACD(NULL,0,5,90,1,PRICE_CLOSE,0,2)>0.0 ;
   zon_bo_7 = iMACD(NULL,0,5,90,1,PRICE_CLOSE,0,1)>0.0 && iMACD(NULL,0,5,90,1,PRICE_CLOSE,0,2)<=0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iBands(NULL,0,145,2.0,0,0,2,1) + iATR(NULL,0,85,1) * 8.5;
   zon_do_11=iBands(NULL,0,145,2.0,0,0,1,1) - iATR(NULL,0,85,1) * 8.5;
   zon_do_12=zon_do_67 * 80.0;
   zon_do_13 = zon_do_12 ;
   zon_do_16=iATR(NULL,0,25,1) * 11.0;
   zon_do_17=iATR(NULL,0,25,1) * 11.0;
   zon_do_14=iATR(NULL,0,25,1) * 6.0;
   zon_do_15 = 0.0 ;
   zon_do_26 = 90.0 ;
   zon_do_27 = 95.0 ;
   zon_do_24 = 90.0 ;
   zon_do_25 = 95.0 ;
   zon_do_28 = 90.0 ;
   zon_do_29 = 95.0 ;
   zon_do_20 = 90.0 ;
   zon_do_21 = 95.0 ;
   zon_do_22 = 90.0 ;
   zon_do_23 = 95.0 ;
   return;
   }
  if ( mu_0 == 18 )
   {
   zon_bo_6 = iBands(NULL,0,65,2.0,0,0,2,1)>Close[1] && iBands(NULL,0,65,2.0,0,0,2,2)<=Close[2] ;
   zon_bo_7 = iBands(NULL,0,65,2.0,0,0,1,1)<=Close[1] && iBands(NULL,0,65,2.0,0,0,1,2)>Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=zon_do_67 * 35.0;
   zon_do_17 = zon_do_16 ;
   zon_do_14=zon_do_67 * 100.0;
   zon_do_15=zon_do_67 * 125.0;
   zon_do_26 = 95.0 ;
   zon_do_27 = 150.0 ;
   zon_do_24 = 95.0 ;
   zon_do_25 = 150.0 ;
   zon_do_28 = 95.0 ;
   zon_do_29 = 150.0 ;
   zon_do_20 = 95.0 ;
   zon_do_21 = 150.0 ;
   zon_do_22 = 95.0 ;
   zon_do_23 = 150.0 ;
   return;
   }
  if ( mu_0 == 19 )
   {
   zon_bo_6 = iRSI(NULL,0,110,0,1)>50.0 && iRSI(NULL,0,110,0,2)<=50.0 ;
   zon_bo_7 = iRSI(NULL,0,110,0,1)<=50.0 && iRSI(NULL,0,110,0,2)>50.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=iATR(NULL,0,140,1) * 17.0;
   zon_do_15=zon_do_67 * 35.0;
   zon_do_26 = 30.0 ;
   zon_do_27 = 120.0 ;
   zon_do_24 = 30.0 ;
   zon_do_25 = 120.0 ;
   zon_do_28 = 30.0 ;
   zon_do_29 = 120.0 ;
   zon_do_20 = 30.0 ;
   zon_do_21 = 120.0 ;
   zon_do_22 = 30.0 ;
   zon_do_23 = 120.0 ;
   return;
   }
  if (mu_0 != 20)  return;
  zon_bo_6 = iMACD(NULL,0,15,280,1,PRICE_CLOSE,0,1)>0.0 && iMACD(NULL,0,15,280,1,PRICE_CLOSE,0,2)<=0.0 ;
  zon_bo_7 = iMACD(NULL,0,15,280,1,PRICE_CLOSE,0,1)<=0.0 && iMACD(NULL,0,15,280,1,PRICE_CLOSE,0,2)>0.0 ;
  zon_in_18 = 0 ;
  zon_do_8 = 0.0 ;
  zon_do_9 = 0.0 ;
  zon_do_10 = 0.0 ;
  zon_do_11 = 0.0 ;
  zon_do_12=iATR(NULL,0,100,1) * 2.0;
  zon_do_13=iATR(NULL,0,100,1) * 2.0;
  zon_do_16 = 0.0 ;
  zon_do_17 = 0.0 ;
  zon_do_14=iATR(NULL,0,75,1) * 8.5;
  zon_do_15=iATR(NULL,0,130,1) * 20.0;
  zon_do_26 = 45.0 ;
  zon_do_27 = 50.0 ;
  zon_do_24 = 45.0 ;
  zon_do_25 = 50.0 ;
  zon_do_28 = 45.0 ;
  zon_do_29 = 50.0 ;
  zon_do_20 = 45.0 ;
  zon_do_21 = 50.0 ;
  zon_do_22 = 45.0 ;
  zon_do_23 = 50.0 ;
  return;
  }
  
// if ( StringFind(zi_st_1,"USDCAD",0) >= 0 && Period() == 60 )
if (USDCAD)
  {
  if ( mu_0 == 1 )
   {
   zon_bo_6 = iCCI(NULL,0,60,0,1)<=0.0 && iCCI(NULL,0,60,0,2)>0.0 ;
   zon_bo_7 = iCCI(NULL,0,60,0,1)>0.0 && iCCI(NULL,0,60,0,2)<=0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iMA(NULL,0,150,0,MODE_EMA,PRICE_CLOSE,1) - iATR(NULL,0,20,1) * 13.5;
   zon_do_11=iMA(NULL,0,150,0,MODE_EMA,PRICE_CLOSE,1) + iATR(NULL,0,20,1) * 13.5;
   zon_do_12=iATR(NULL,0,20,1) * 5.5;
   zon_do_13=iATR(NULL,0,20,1) * 5.5;
   zon_do_16=iATR(NULL,0,45,1) * 4.0;
   zon_do_17=iATR(NULL,0,45,1) * 4.0;
   zon_do_14=zon_do_67 * 100.0;
   zon_do_15=iATR(NULL,0,65,1) * 13.5;
   zon_do_26 = 80.0 ;
   zon_do_27 = 135.0 ;
   zon_do_24 = 80.0 ;
   zon_do_25 = 135.0 ;
   zon_do_28 = 80.0 ;
   zon_do_29 = 135.0 ;
   zon_do_20 = 80.0 ;
   zon_do_21 = 135.0 ;
   zon_do_22 = 80.0 ;
   zon_do_23 = 135.0 ;
   return;
   }
  if ( mu_0 == 2 )
   {
   zon_bo_6 = iBands(NULL,0,20,2.0,0,0,2,1)<=Close[1] && iBands(NULL,0,20,2.0,0,0,2,2)>Close[2] ;
   zon_bo_7 = iBands(NULL,0,20,2.0,0,0,1,1)>Close[1] && iBands(NULL,0,20,2.0,0,0,1,2)<=Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=iATR(NULL,0,160,1) * 7.0;
   zon_do_13=iATR(NULL,0,160,1) * 7.0;
   zon_do_16=iATR(NULL,0,50,1) * 18.0;
   zon_do_17=iATR(NULL,0,50,1) * 18.0;
   zon_do_14=zon_do_67 * 170.0;
   zon_do_15 = 0.0 ;
   zon_do_26 = 115.0 ;
   zon_do_27 = 155.0 ;
   zon_do_24 = 115.0 ;
   zon_do_25 = 155.0 ;
   zon_do_28 = 115.0 ;
   zon_do_29 = 155.0 ;
   zon_do_20 = 115.0 ;
   zon_do_21 = 155.0 ;
   zon_do_22 = 115.0 ;
   zon_do_23 = 155.0 ;
   return;
   }
  if ( mu_0 == 3 )
   {
   zon_bo_6 = iMACD(NULL,0,35,70,1,PRICE_CLOSE,0,1)>0.0 && iMACD(NULL,0,35,70,1,PRICE_CLOSE,0,2)<=0.0 ;
   zon_bo_7 = iMACD(NULL,0,35,70,1,PRICE_CLOSE,0,1)<=0.0 && iMACD(NULL,0,35,70,1,PRICE_CLOSE,0,2)>0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iMA(NULL,0,10,0,MODE_SMA,PRICE_CLOSE,1) - zon_do_67 * 125.0;
   zon_do_11=iMA(NULL,0,10,0,MODE_SMA,PRICE_CLOSE,1) + zon_do_67 * 125.0;
   zon_do_12=zon_do_67 * 105.0;
   zon_do_13 = zon_do_12 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=zon_do_67 * 65.0;
   zon_do_15=iATR(NULL,0,160,1) * 7.0;
   zon_do_26 = 65.0 ;
   zon_do_27 = 110.0 ;
   zon_do_24 = 65.0 ;
   zon_do_25 = 110.0 ;
   zon_do_28 = 65.0 ;
   zon_do_29 = 110.0 ;
   zon_do_20 = 65.0 ;
   zon_do_21 = 110.0 ;
   zon_do_22 = 65.0 ;
   zon_do_23 = 110.0 ;
   return;
   }
  if ( mu_0 == 4 )
   {
   zon_bo_6 = iCCI(NULL,0,40,0,1)<=0.0 && iCCI(NULL,0,40,0,2)>0.0 ;
   zon_bo_7 = iCCI(NULL,0,40,0,1)>0.0 && iCCI(NULL,0,40,0,2)<=0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=zon_do_67 * 55.0;
   zon_do_17 = zon_do_16 ;
   zon_do_14=iATR(NULL,0,45,1) * 4.5;
   zon_do_15=iATR(NULL,0,40,1) * 3.5;
   zon_do_26 = 85.0 ;
   zon_do_27 = 95.0 ;
   zon_do_24 = 85.0 ;
   zon_do_25 = 95.0 ;
   zon_do_28 = 85.0 ;
   zon_do_29 = 95.0 ;
   zon_do_20 = 85.0 ;
   zon_do_21 = 95.0 ;
   zon_do_22 = 85.0 ;
   zon_do_23 = 95.0 ;
   return;
   }
  if ( mu_0 == 5 )
   {
   zon_bo_6 = iBands(NULL,0,110,2.0,0,0,2,1)<=Close[1] && iBands(NULL,0,110,2.0,0,0,2,2)>Close[2] ;
   zon_bo_7 = iBands(NULL,0,110,2.0,0,0,1,1)>Close[1] && iBands(NULL,0,110,2.0,0,0,1,2)<=Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iBands(NULL,0,100,2.0,0,0,1,1) - zon_do_67 * 120.0;
   zon_do_11=iBands(NULL,0,100,2.0,0,0,2,1) + zon_do_67 * 120.0;
   zon_do_12=iATR(NULL,0,90,1) * 22.5;
   zon_do_13=iATR(NULL,0,90,1) * 22.5;
   zon_do_16=zon_do_67 * 75.0;
   zon_do_17 = zon_do_16 ;
   zon_do_14=zon_do_67 * 125.0;
   zon_do_15=zon_do_67 * 135.0;
   zon_do_26 = 120.0 ;
   zon_do_27 = 155.0 ;
   zon_do_24 = 120.0 ;
   zon_do_25 = 155.0 ;
   zon_do_28 = 120.0 ;
   zon_do_29 = 155.0 ;
   zon_do_20 = 120.0 ;
   zon_do_21 = 155.0 ;
   zon_do_22 = 120.0 ;
   zon_do_23 = 155.0 ;
   return;
   }
  if ( mu_0 == 6 )
   {
   zon_bo_6 = iMACD(NULL,0,10,260,1,PRICE_CLOSE,0,1)>0.0 && iMACD(NULL,0,10,260,1,PRICE_CLOSE,0,2)<=0.0 ;
   zon_bo_7 = iMACD(NULL,0,10,260,1,PRICE_CLOSE,0,1)<=0.0 && iMACD(NULL,0,10,260,1,PRICE_CLOSE,0,2)>0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iBands(NULL,0,50,1.0,0,0,2,1) + iATR(NULL,0,85,1) * 1.5;
   zon_do_11=iBands(NULL,0,50,1.0,0,0,1,1) - iATR(NULL,0,85,1) * 1.5;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=zon_do_67 * 155.0;
   zon_do_17 = zon_do_16 ;
   zon_do_14=iATR(NULL,0,10,1) * 5.0;
   zon_do_15=zon_do_67 * 65.0;
   zon_do_26 = 25.0 ;
   zon_do_27 = 175.0 ;
   zon_do_24 = 25.0 ;
   zon_do_25 = 175.0 ;
   zon_do_28 = 25.0 ;
   zon_do_29 = 175.0 ;
   zon_do_20 = 25.0 ;
   zon_do_21 = 175.0 ;
   zon_do_22 = 25.0 ;
   zon_do_23 = 175.0 ;
   return;
   }
  if ( mu_0 == 7 )
   {
   zon_bo_6 = iCCI(NULL,0,90,0,1)<=0.0 && iCCI(NULL,0,90,0,2)>0.0 ;
   zon_bo_7 = iCCI(NULL,0,90,0,1)>0.0 && iCCI(NULL,0,90,0,2)<=0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iBands(NULL,0,85,2.0,0,0,2,1) + zon_do_67 * 105.0;
   zon_do_11=iBands(NULL,0,85,2.0,0,0,1,1) - zon_do_67 * 105.0;
   zon_do_12=iATR(NULL,0,50,1) * 4.0;
   zon_do_13=iATR(NULL,0,50,1) * 4.0;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=zon_do_67 * 45.0;
   zon_do_15 = 0.0 ;
   zon_do_26 = 105.0 ;
   zon_do_27 = 145.0 ;
   zon_do_24 = 105.0 ;
   zon_do_25 = 145.0 ;
   zon_do_28 = 105.0 ;
   zon_do_29 = 145.0 ;
   zon_do_20 = 105.0 ;
   zon_do_21 = 145.0 ;
   zon_do_22 = 105.0 ;
   zon_do_23 = 145.0 ;
   return;
   }
  if ( mu_0 == 8 )
   {
   zon_bo_6 = iCCI(NULL,0,50,0,1)<=0.0 && iCCI(NULL,0,50,0,2)>0.0 ;
   zon_bo_7 = iCCI(NULL,0,50,0,1)>0.0 && iCCI(NULL,0,50,0,2)<=0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=iATR(NULL,0,55,1) * 12.0;
   zon_do_17=iATR(NULL,0,55,1) * 12.0;
   zon_do_14=iATR(NULL,0,55,1) * 10.0;
   zon_do_15=zon_do_67 * 180.0;
   zon_do_26 = 90.0 ;
   zon_do_27 = 95.0 ;
   zon_do_24 = 90.0 ;
   zon_do_25 = 95.0 ;
   zon_do_28 = 90.0 ;
   zon_do_29 = 95.0 ;
   zon_do_20 = 90.0 ;
   zon_do_21 = 95.0 ;
   zon_do_22 = 90.0 ;
   zon_do_23 = 95.0 ;
   return;
   }
  if ( mu_0 == 9 )
   {
   zon_bo_6 = iStochastic(NULL,0,145,1,3,0,0,1,1)<=20.0 && iStochastic(NULL,0,145,1,3,0,0,1,2)>20.0 ;
   zon_bo_7 = iStochastic(NULL,0,145,1,3,0,0,1,1)>80.0 && iStochastic(NULL,0,145,1,3,0,0,1,2)<=80.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iBands(NULL,0,45,2.0,0,0,1,1) - zon_do_67 * 50.0;
   zon_do_11=iBands(NULL,0,45,2.0,0,0,2,1) + zon_do_67 * 50.0;
   zon_do_12=iATR(NULL,0,10,1) * 8.5;
   zon_do_13=iATR(NULL,0,10,1) * 8.5;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=iATR(NULL,0,30,1) * 17.5;
   zon_do_15=zon_do_67 * 175.0;
   zon_do_26 = 80.0 ;
   zon_do_27 = 150.0 ;
   zon_do_24 = 80.0 ;
   zon_do_25 = 150.0 ;
   zon_do_28 = 80.0 ;
   zon_do_29 = 150.0 ;
   zon_do_20 = 80.0 ;
   zon_do_21 = 150.0 ;
   zon_do_22 = 80.0 ;
   zon_do_23 = 150.0 ;
   return;
   }
  if ( mu_0 == 10 )
   {
   zon_bo_6 = iStochastic(NULL,0,25,1,3,0,0,1,1)<=20.0 && iStochastic(NULL,0,25,1,3,0,0,1,2)>20.0 ;
   zon_bo_7 = iStochastic(NULL,0,25,1,3,0,0,1,1)>80.0 && iStochastic(NULL,0,25,1,3,0,0,1,2)<=80.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iMA(NULL,0,35,0,MODE_SMA,PRICE_CLOSE,1) - iATR(NULL,0,60,1) * 19.5;
   zon_do_11=iMA(NULL,0,35,0,MODE_SMA,PRICE_CLOSE,1) + iATR(NULL,0,60,1) * 19.5;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=zon_do_67 * 35.0;
   zon_do_15=iATR(NULL,0,120,1) * 12.5;
   zon_do_26 = 140.0 ;
   zon_do_27 = 150.0 ;
   zon_do_24 = 140.0 ;
   zon_do_25 = 150.0 ;
   zon_do_28 = 140.0 ;
   zon_do_29 = 150.0 ;
   zon_do_20 = 140.0 ;
   zon_do_21 = 150.0 ;
   zon_do_22 = 140.0 ;
   zon_do_23 = 150.0 ;
   return;
   }
  if ( mu_0 == 11 )
   {
   zon_bo_6 = iMACD(NULL,0,15,80,1,PRICE_CLOSE,0,1)>0.0 && iMACD(NULL,0,15,80,1,PRICE_CLOSE,0,2)<=0.0 ;
   zon_bo_7 = iMACD(NULL,0,15,80,1,PRICE_CLOSE,0,1)<=0.0 && iMACD(NULL,0,15,80,1,PRICE_CLOSE,0,2)>0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=iATR(NULL,0,10,1) * 16.5;
   zon_do_15=iATR(NULL,0,15,1) * 0.5;
   zon_do_26 = 25.0 ;
   zon_do_27 = 200.0 ;
   zon_do_24 = 25.0 ;
   zon_do_25 = 200.0 ;
   zon_do_28 = 25.0 ;
   zon_do_29 = 200.0 ;
   zon_do_20 = 25.0 ;
   zon_do_21 = 200.0 ;
   zon_do_22 = 25.0 ;
   zon_do_23 = 200.0 ;
   return;
   }
  if ( mu_0 == 12 )
   {
   zon_bo_6 = iMACD(NULL,0,10,160,1,PRICE_CLOSE,0,1)>0.0 && iMACD(NULL,0,10,160,1,PRICE_CLOSE,0,2)<=0.0 ;
   zon_bo_7 = iMACD(NULL,0,10,160,1,PRICE_CLOSE,0,1)<=0.0 && iMACD(NULL,0,10,160,1,PRICE_CLOSE,0,2)>0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=zon_do_67 * 95.0;
   zon_do_13 = zon_do_12 ;
   zon_do_16=zon_do_67 * 25.0;
   zon_do_17 = zon_do_16 ;
   zon_do_14=zon_do_67 * 105.0;
   zon_do_15=iATR(NULL,0,100,1) * 7.0;
   zon_do_26 = 25.0 ;
   zon_do_27 = 90.0 ;
   zon_do_24 = 25.0 ;
   zon_do_25 = 90.0 ;
   zon_do_28 = 25.0 ;
   zon_do_29 = 90.0 ;
   zon_do_20 = 25.0 ;
   zon_do_21 = 90.0 ;
   zon_do_22 = 25.0 ;
   zon_do_23 = 90.0 ;
   return;
   }
  if ( mu_0 == 13 )
   {
   zon_bo_6 = iStochastic(NULL,0,145,1,3,0,0,1,1)<=30.0 && iStochastic(NULL,0,145,1,3,0,0,1,2)>30.0 ;
   zon_bo_7 = iStochastic(NULL,0,145,1,3,0,0,1,1)>70.0 && iStochastic(NULL,0,145,1,3,0,0,1,2)<=70.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=zon_do_67 * 20.0;
   zon_do_17 = zon_do_16 ;
   zon_do_14=zon_do_67 * 95.0;
   zon_do_15=zon_do_67 * 190.0;
   zon_do_26 = 80.0 ;
   zon_do_27 = 120.0 ;
   zon_do_24 = 80.0 ;
   zon_do_25 = 120.0 ;
   zon_do_28 = 80.0 ;
   zon_do_29 = 120.0 ;
   zon_do_20 = 80.0 ;
   zon_do_21 = 120.0 ;
   zon_do_22 = 80.0 ;
   zon_do_23 = 120.0 ;
   return;
   }
  if ( mu_0 == 14 )
   {
   zon_bo_6 = iStochastic(NULL,0,145,1,3,0,0,1,1)<=30.0 && iStochastic(NULL,0,145,1,3,0,0,1,2)>30.0 ;
   zon_bo_7 = iStochastic(NULL,0,145,1,3,0,0,1,1)>70.0 && iStochastic(NULL,0,145,1,3,0,0,1,2)<=70.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iMA(NULL,0,95,0,MODE_EMA,PRICE_CLOSE,1) + zon_do_67 * 135.0;
   zon_do_11=iMA(NULL,0,95,0,MODE_EMA,PRICE_CLOSE,1) - zon_do_67 * 135.0;
   zon_do_12=iATR(NULL,0,30,1) * 9.0;
   zon_do_13=iATR(NULL,0,30,1) * 9.0;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=iATR(NULL,0,55,1) * 13.5;
   zon_do_15=zon_do_67 * 165.0;
   zon_do_26 = 105.0 ;
   zon_do_27 = 115.0 ;
   zon_do_24 = 105.0 ;
   zon_do_25 = 115.0 ;
   zon_do_28 = 105.0 ;
   zon_do_29 = 115.0 ;
   zon_do_20 = 105.0 ;
   zon_do_21 = 115.0 ;
   zon_do_22 = 105.0 ;
   zon_do_23 = 115.0 ;
   return;
   }
  if ( mu_0 == 15 )
   {
   zon_bo_6 = iBands(NULL,0,155,1.0,0,0,2,1)>Close[1] && iBands(NULL,0,155,1.0,0,0,2,2)<=Close[2] ;
   zon_bo_7 = iBands(NULL,0,155,1.0,0,0,1,1)<=Close[1] && iBands(NULL,0,155,1.0,0,0,1,2)>Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=iATR(NULL,0,80,1) * 17.0;
   zon_do_13=iATR(NULL,0,80,1) * 17.0;
   zon_do_16=zon_do_67 * 80.0;
   zon_do_17 = zon_do_16 ;
   zon_do_14 = zon_do_16 ;
   zon_do_15=zon_do_67 * 140.0;
   zon_do_26 = 100.0 ;
   zon_do_27 = 165.0 ;
   zon_do_24 = 100.0 ;
   zon_do_25 = 165.0 ;
   zon_do_28 = 100.0 ;
   zon_do_29 = 165.0 ;
   zon_do_20 = 100.0 ;
   zon_do_21 = 165.0 ;
   zon_do_22 = 100.0 ;
   zon_do_23 = 165.0 ;
   return;
   }
  if ( mu_0 == 16 )
   {
   zon_bo_6 = iBands(NULL,0,95,2.0,0,0,2,1)<=Close[1] && iBands(NULL,0,95,2.0,0,0,2,2)>Close[2] ;
   zon_bo_7 = iBands(NULL,0,95,2.0,0,0,1,1)>Close[1] && iBands(NULL,0,95,2.0,0,0,1,2)<=Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iMA(NULL,0,35,0,MODE_EMA,PRICE_CLOSE,1) - zon_do_67 * 90.0;
   zon_do_11=iMA(NULL,0,35,0,MODE_EMA,PRICE_CLOSE,1) + zon_do_67 * 90.0;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=iATR(NULL,0,50,1) * 24.5;
   zon_do_17=iATR(NULL,0,50,1) * 24.5;
   zon_do_14=zon_do_67 * 25.0;
   zon_do_15 = 0.0 ;
   zon_do_26 = 50.0 ;
   zon_do_27 = 115.0 ;
   zon_do_24 = 50.0 ;
   zon_do_25 = 115.0 ;
   zon_do_28 = 50.0 ;
   zon_do_29 = 115.0 ;
   zon_do_20 = 50.0 ;
   zon_do_21 = 115.0 ;
   zon_do_22 = 50.0 ;
   zon_do_23 = 115.0 ;
   return;
   }
  if ( mu_0 == 17 )
   {
   zon_bo_6 = iCCI(NULL,0,30,0,1)<=0.0 && iCCI(NULL,0,30,0,2)>0.0 ;
   zon_bo_7 = iCCI(NULL,0,30,0,1)>0.0 && iCCI(NULL,0,30,0,2)<=0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=zon_do_67 * 35.0;
   zon_do_17 = zon_do_16 ;
   zon_do_14=zon_do_67 * 95.0;
   zon_do_15=iATR(NULL,0,90,1) * 14.0;
   zon_do_26 = 90.0 ;
   zon_do_27 = 195.0 ;
   zon_do_24 = 90.0 ;
   zon_do_25 = 195.0 ;
   zon_do_28 = 90.0 ;
   zon_do_29 = 195.0 ;
   zon_do_20 = 90.0 ;
   zon_do_21 = 195.0 ;
   zon_do_22 = 90.0 ;
   zon_do_23 = 195.0 ;
   return;
   }
  if ( mu_0 == 18 )
   {
   zon_bo_6 = iMACD(NULL,0,10,260,1,PRICE_CLOSE,0,1)>0.0 && iMACD(NULL,0,10,260,1,PRICE_CLOSE,0,2)<=0.0 ;
   zon_bo_7 = iMACD(NULL,0,10,260,1,PRICE_CLOSE,0,1)<=0.0 && iMACD(NULL,0,10,260,1,PRICE_CLOSE,0,2)>0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iBands(NULL,0,50,1.0,0,0,2,1) + iATR(NULL,0,85,1) * 1.5;
   zon_do_11=iBands(NULL,0,50,1.0,0,0,1,1) - iATR(NULL,0,85,1) * 1.5;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=zon_do_67 * 155.0;
   zon_do_17 = zon_do_16 ;
   zon_do_14=iATR(NULL,0,10,1) * 5.0;
   zon_do_15=zon_do_67 * 65.0;
   zon_do_26 = 25.0 ;
   zon_do_27 = 175.0 ;
   zon_do_24 = 25.0 ;
   zon_do_25 = 175.0 ;
   zon_do_28 = 25.0 ;
   zon_do_29 = 175.0 ;
   zon_do_20 = 25.0 ;
   zon_do_21 = 175.0 ;
   zon_do_22 = 25.0 ;
   zon_do_23 = 175.0 ;
   return;
   }
  if ( mu_0 == 19 )
   {
   zon_bo_6 = iCCI(NULL,0,30,0,1)<=0.0 && iCCI(NULL,0,30,0,2)>0.0 ;
   zon_bo_7 = iCCI(NULL,0,30,0,1)>0.0 && iCCI(NULL,0,30,0,2)<=0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=zon_do_67 * 35.0;
   zon_do_17 = zon_do_16 ;
   zon_do_14=zon_do_67 * 95.0;
   zon_do_15=iATR(NULL,0,90,1) * 14.0;
   zon_do_26 = 90.0 ;
   zon_do_27 = 195.0 ;
   zon_do_24 = 90.0 ;
   zon_do_25 = 195.0 ;
   zon_do_28 = 90.0 ;
   zon_do_29 = 195.0 ;
   zon_do_20 = 90.0 ;
   zon_do_21 = 195.0 ;
   zon_do_22 = 90.0 ;
   zon_do_23 = 195.0 ;
   return;
   }
  if (mu_0 != 20)  return;
  zon_bo_6 = iBands(NULL,0,110,2.0,0,0,2,1)<=Close[1] && iBands(NULL,0,110,2.0,0,0,2,2)>Close[2] ;
  zon_bo_7 = iBands(NULL,0,110,2.0,0,0,1,1)>Close[1] && iBands(NULL,0,110,2.0,0,0,1,2)<=Close[2] ;
  zon_in_18 = 0 ;
  zon_do_8 = 0.0 ;
  zon_do_9 = 0.0 ;
  zon_do_10=iMA(NULL,0,140,0,MODE_SMA,PRICE_CLOSE,1) + iATR(NULL,0,30,1) * 21.0;
  zon_do_11=iMA(NULL,0,140,0,MODE_SMA,PRICE_CLOSE,1) - iATR(NULL,0,30,1) * 21.0;
  zon_do_12=iATR(NULL,0,180,1) * 19.5;
  zon_do_13=iATR(NULL,0,180,1) * 19.5;
  zon_do_16 = 0.0 ;
  zon_do_17 = 0.0 ;
  zon_do_14=zon_do_67 * 85.0;
  zon_do_15=iATR(NULL,0,20,1) * 2.5;
  zon_do_26 = 125.0 ;
  zon_do_27 = 185.0 ;
  zon_do_24 = 125.0 ;
  zon_do_25 = 185.0 ;
  zon_do_28 = 125.0 ;
  zon_do_29 = 185.0 ;
  zon_do_20 = 125.0 ;
  zon_do_21 = 185.0 ;
  zon_do_22 = 125.0 ;
  zon_do_23 = 185.0 ;
  return;
  }
*/  
// if ( StringFind(zi_st_1,"EURUSD",0) >= 0 && Period() == 60 )
if (EURUSD_60)
  {
  if ( mu_0 == 1 )
   {
   zon_bo_6 = iStochastic(NULL,0,110,1,3,0,0,1,1)<=30.0 && iStochastic(NULL,0,110,1,3,0,0,1,2)>30.0 ;
   zon_bo_7 = iStochastic(NULL,0,110,1,3,0,0,1,1)>70.0 && iStochastic(NULL,0,110,1,3,0,0,1,2)<=70.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=iATR(NULL,0,30,1) * 4.5;
   zon_do_13=iATR(NULL,0,30,1) * 4.5;
   zon_do_16=iATR(NULL,0,90,1) * 5.5;
   zon_do_17=iATR(NULL,0,90,1) * 5.5;
   zon_do_14=zon_do_67 * 75.0;
   zon_do_15 = 125.0 ;
   zon_do_26 = 30.0 ;
   zon_do_27 = 125.0 ;
   zon_do_24 = 30.0 ;
   zon_do_25 = 125.0 ;
   zon_do_28 = 30.0 ;
   zon_do_29 = 125.0 ;
   zon_do_20 = 30.0 ;
   zon_do_21 = 125.0 ;
   zon_do_22 = 30.0 ;
   zon_do_23 = 125.0 ;
   return;
   }
  if ( mu_0 == 2 )
   {
   zon_bo_6 = iStochastic(NULL,0,135,1,3,0,0,1,1)<=50.0 && iStochastic(NULL,0,135,1,3,0,0,1,2)>50.0 ;
   zon_bo_7 = iStochastic(NULL,0,135,1,3,0,0,1,1)>50.0 && iStochastic(NULL,0,135,1,3,0,0,1,2)<=50.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iMA(NULL,0,90,0,MODE_EMA,PRICE_CLOSE,1) - iATR(NULL,0,150,1) * 5.0;
   zon_do_11=iMA(NULL,0,90,0,MODE_EMA,PRICE_CLOSE,1) + iATR(NULL,0,150,1) * 5.0;
   zon_do_12=zon_do_67 * 85.0;
   zon_do_13 = zon_do_12 ;
   zon_do_16=iATR(NULL,0,50,1) * 15.0;
   zon_do_17=iATR(NULL,0,50,1) * 15.0;
   zon_do_14=iATR(NULL,0,90,1) * 11.5;
   zon_do_15 = 95.0 ;
   zon_do_26 = 80.0 ;
   zon_do_27 = 95.0 ;
   zon_do_24 = 80.0 ;
   zon_do_25 = 95.0 ;
   zon_do_28 = 80.0 ;
   zon_do_29 = 95.0 ;
   zon_do_20 = 80.0 ;
   zon_do_21 = 95.0 ;
   zon_do_22 = 80.0 ;
   zon_do_23 = 95.0 ;
   return;
   }
  if ( mu_0 == 3 )
   {
   zon_bo_6 = iStochastic(NULL,0,35,1,3,0,0,1,1)<=30.0 && iStochastic(NULL,0,35,1,3,0,0,1,2)>30.0 ;
   zon_bo_7 = iStochastic(NULL,0,35,1,3,0,0,1,1)>70.0 && iStochastic(NULL,0,35,1,3,0,0,1,2)<=70.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iMA(NULL,0,160,0,MODE_SMA,PRICE_CLOSE,1) + iATR(NULL,0,65,1) * 4.5;
   zon_do_11=iMA(NULL,0,160,0,MODE_SMA,PRICE_CLOSE,1) - iATR(NULL,0,65,1) * 4.5;
   zon_do_12=iATR(NULL,0,90,1) * 9.5;
   zon_do_13=iATR(NULL,0,90,1) * 9.5;
   zon_do_16=iATR(NULL,0,160,1) * 6.5;
   zon_do_17=iATR(NULL,0,160,1) * 6.5;
   zon_do_14=zon_do_67 * 90.0;
   zon_do_15=iATR(NULL,0,60,1) * 18.5;
   zon_do_26 = 85.0 ;
   zon_do_27 = 125.0 ;
   zon_do_24 = 85.0 ;
   zon_do_25 = 125.0 ;
   zon_do_28 = 85.0 ;
   zon_do_29 = 125.0 ;
   zon_do_20 = 85.0 ;
   zon_do_21 = 125.0 ;
   zon_do_22 = 85.0 ;
   zon_do_23 = 125.0 ;
   return;
   }
  if ( mu_0 == 4 )
   {
   zon_bo_6 = iBands(NULL,0,40,2.0,0,0,2,1)<=Close[1] && iBands(NULL,0,40,2.0,0,0,2,2)>Close[2] ;
   zon_bo_7 = iBands(NULL,0,40,2.0,0,0,1,1)>Close[1] && iBands(NULL,0,40,2.0,0,0,1,2)<=Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iMA(NULL,0,150,0,MODE_SMA,PRICE_CLOSE,1) + iATR(NULL,0,90,1) * 10.0;
   zon_do_11=iMA(NULL,0,150,0,MODE_SMA,PRICE_CLOSE,1) - iATR(NULL,0,90,1) * 10.0;
   zon_do_12=iATR(NULL,0,45,1) * 18.0;
   zon_do_13=iATR(NULL,0,45,1) * 18.0;
   zon_do_16=zon_do_67 * 30.0;
   zon_do_17 = zon_do_16 ;
   zon_do_14=zon_do_67 * 65.0;
   zon_do_15 = 120.0 ;
   zon_do_26 = 90.0 ;
   zon_do_27 = 120.0 ;
   zon_do_24 = 90.0 ;
   zon_do_25 = 120.0 ;
   zon_do_28 = 90.0 ;
   zon_do_29 = 120.0 ;
   zon_do_20 = 90.0 ;
   zon_do_21 = 120.0 ;
   zon_do_22 = 90.0 ;
   zon_do_23 = 120.0 ;
   return;
   }
  if ( mu_0 == 5 )
   {
   zon_bo_6 = iStochastic(NULL,0,35,1,3,0,0,1,1)<=30.0 && iStochastic(NULL,0,35,1,3,0,0,1,2)>30.0 ;
   zon_bo_7 = iStochastic(NULL,0,35,1,3,0,0,1,1)>70.0 && iStochastic(NULL,0,35,1,3,0,0,1,2)<=70.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iBands(NULL,0,40,1.0,0,0,2,1) + zon_do_67 * 70.0;
   zon_do_11=iBands(NULL,0,40,1.0,0,0,1,1) - zon_do_67 * 70.0;
   zon_do_12=zon_do_67 * 60.0;
   zon_do_13 = zon_do_12 ;
   zon_do_16=iATR(NULL,0,95,1) * 24.5;
   zon_do_17=iATR(NULL,0,95,1) * 24.5;
   zon_do_14=zon_do_67 * 80.0;
   zon_do_15 = iATR(NULL,0,10,1) ;
   zon_do_26 = 130.0 ;
   zon_do_27 = 150.0 ;
   zon_do_24 = 130.0 ;
   zon_do_25 = 150.0 ;
   zon_do_28 = 130.0 ;
   zon_do_29 = 150.0 ;
   zon_do_20 = 130.0 ;
   zon_do_21 = 150.0 ;
   zon_do_22 = 130.0 ;
   zon_do_23 = 150.0 ;
   return;
   }
  if ( mu_0 == 6 )
   {
   zon_bo_6 = iRSI(NULL,0,140,0,1)>50.0 && iRSI(NULL,0,140,0,2)<=50.0 ;
   zon_bo_7 = iRSI(NULL,0,140,0,1)<=50.0 && iRSI(NULL,0,140,0,2)>50.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=iATR(NULL,0,50,1) * 4.5;
   zon_do_13=iATR(NULL,0,50,1) * 4.5;
   zon_do_16=zon_do_67 * 25.0;
   zon_do_17 = zon_do_16 ;
   zon_do_14=zon_do_67 * 30.0;
   zon_do_15=iATR(NULL,0,25,1) * 8.5;
   zon_do_26 = 15.0 ;
   zon_do_27 = 65.0 ;
   zon_do_24 = 15.0 ;
   zon_do_25 = 65.0 ;
   zon_do_28 = 15.0 ;
   zon_do_29 = 65.0 ;
   zon_do_20 = 15.0 ;
   zon_do_21 = 65.0 ;
   zon_do_22 = 15.0 ;
   zon_do_23 = 65.0 ;
   return;
   }
  if ( mu_0 == 7 )
   {
   zon_bo_6 = iRSI(NULL,0,150,0,1)>50.0 && iRSI(NULL,0,150,0,2)<=50.0 ;
   zon_bo_7 = iRSI(NULL,0,150,0,1)<=50.0 && iRSI(NULL,0,150,0,2)>50.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=iATR(NULL,0,110,1) * 2.0;
   zon_do_13=iATR(NULL,0,110,1) * 2.0;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=iATR(NULL,0,25,1) * 5.0;
   zon_do_15=zon_do_67 * 125.0;
   zon_do_26 = 40.0 ;
   zon_do_27 = 85.0 ;
   zon_do_24 = 40.0 ;
   zon_do_25 = 85.0 ;
   zon_do_28 = 40.0 ;
   zon_do_29 = 85.0 ;
   zon_do_20 = 40.0 ;
   zon_do_21 = 85.0 ;
   zon_do_22 = 40.0 ;
   zon_do_23 = 85.0 ;
   return;
   }
  if ( mu_0 == 8 )
   {
   zon_bo_6 = iStochastic(NULL,0,70,1,3,0,0,1,1)>70.0 && iStochastic(NULL,0,70,1,3,0,0,1,2)<=70.0 ;
   zon_bo_7 = iStochastic(NULL,0,70,1,3,0,0,1,1)<=30.0 && iStochastic(NULL,0,70,1,3,0,0,1,2)>30.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=zon_do_67 * 20.0;
   zon_do_17 = zon_do_16 ;
   zon_do_14=zon_do_67 * 175.0;
   zon_do_15=zon_do_67 * 115.0;
   zon_do_26 = 25.0 ;
   zon_do_27 = 165.0 ;
   zon_do_24 = 25.0 ;
   zon_do_25 = 165.0 ;
   zon_do_28 = 25.0 ;
   zon_do_29 = 165.0 ;
   zon_do_20 = 25.0 ;
   zon_do_21 = 165.0 ;
   zon_do_22 = 25.0 ;
   zon_do_23 = 165.0 ;
   return;
   }
  if ( mu_0 == 9 )
   {
   zon_bo_6 = iBands(NULL,0,40,2.0,0,0,2,1)<=Close[1] && iBands(NULL,0,40,2.0,0,0,2,2)>Close[2] ;
   zon_bo_7 = iBands(NULL,0,40,2.0,0,0,1,1)>Close[1] && iBands(NULL,0,40,2.0,0,0,1,2)<=Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=iATR(NULL,0,20,1) * 9.0;
   zon_do_13=iATR(NULL,0,20,1) * 9.0;
   zon_do_16=zon_do_67 * 15.0;
   zon_do_17 = zon_do_16 ;
   zon_do_14=zon_do_67 * 60.0;
   zon_do_15 = 80.0 ;
   zon_do_26 = 75.0 ;
   zon_do_27 = 80.0 ;
   zon_do_24 = 75.0 ;
   zon_do_25 = 80.0 ;
   zon_do_28 = 75.0 ;
   zon_do_29 = 80.0 ;
   zon_do_20 = 75.0 ;
   zon_do_21 = 80.0 ;
   zon_do_22 = 75.0 ;
   zon_do_23 = 80.0 ;
   return;
   }
  if ( mu_0 == 10 )
   {
   zon_bo_6 = iMACD(NULL,0,20,35,1,PRICE_CLOSE,0,1)<=0.0 && iMACD(NULL,0,20,35,1,PRICE_CLOSE,0,2)>0.0 ;
   zon_bo_7 = iMACD(NULL,0,20,35,1,PRICE_CLOSE,0,1)>0.0 && iMACD(NULL,0,20,35,1,PRICE_CLOSE,0,2)<=0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iMA(NULL,0,20,0,MODE_SMA,PRICE_CLOSE,1) - zon_do_67 * 175.0;
   zon_do_11=iMA(NULL,0,20,0,MODE_SMA,PRICE_CLOSE,1) + zon_do_67 * 175.0;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=zon_do_67 * 200.0;
   zon_do_15=iATR(NULL,0,70,1) * 18.0;
   zon_do_26 = 70.0 ;
   zon_do_27 = 140.0 ;
   zon_do_24 = 70.0 ;
   zon_do_25 = 140.0 ;
   zon_do_28 = 70.0 ;
   zon_do_29 = 140.0 ;
   zon_do_20 = 70.0 ;
   zon_do_21 = 140.0 ;
   zon_do_22 = 70.0 ;
   zon_do_23 = 140.0 ;
   return;
   }
  if ( mu_0 == 11 )
   {
   zon_bo_6 = iRSI(NULL,0,140,0,1)>50.0 && iRSI(NULL,0,140,0,2)<=50.0 ;
   zon_bo_7 = iRSI(NULL,0,140,0,1)<=50.0 && iRSI(NULL,0,140,0,2)>50.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iMA(NULL,0,170,0,MODE_SMA,PRICE_CLOSE,1) - iATR(NULL,0,35,1) * 22.5;
   zon_do_11=iMA(NULL,0,170,0,MODE_SMA,PRICE_CLOSE,1) + iATR(NULL,0,35,1) * 22.5;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=zon_do_67 * 35.0;
   zon_do_15=zon_do_67 * 145.0;
   zon_do_26 = 25.0 ;
   zon_do_27 = 50.0 ;
   zon_do_24 = 25.0 ;
   zon_do_25 = 50.0 ;
   zon_do_28 = 25.0 ;
   zon_do_29 = 50.0 ;
   zon_do_20 = 25.0 ;
   zon_do_21 = 50.0 ;
   zon_do_22 = 25.0 ;
   zon_do_23 = 50.0 ;
   return;
   }
  if ( mu_0 == 12 )
   {
   zon_bo_6 = iBands(NULL,0,70,1.0,0,0,2,1)<=Close[1] && iBands(NULL,0,70,1.0,0,0,2,2)>Close[2] ;
   zon_bo_7 = iBands(NULL,0,70,1.0,0,0,1,1)>Close[1] && iBands(NULL,0,70,1.0,0,0,1,2)<=Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=iATR(NULL,0,85,1) * 9.5;
   zon_do_13=iATR(NULL,0,85,1) * 9.5;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=zon_do_67 * 65.0;
   zon_do_15 = 85.0 ;
   zon_do_26 = 60.0 ;
   zon_do_27 = 85.0 ;
   zon_do_24 = 60.0 ;
   zon_do_25 = 85.0 ;
   zon_do_28 = 60.0 ;
   zon_do_29 = 85.0 ;
   zon_do_20 = 60.0 ;
   zon_do_21 = 85.0 ;
   zon_do_22 = 60.0 ;
   zon_do_23 = 85.0 ;
   return;
   }
  if ( mu_0 == 13 )
   {
   zon_bo_6 = iRSI(NULL,0,110,0,1)>50.0 && iRSI(NULL,0,110,0,2)<=50.0 ;
   zon_bo_7 = iRSI(NULL,0,110,0,1)<=50.0 && iRSI(NULL,0,110,0,2)>50.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=zon_do_67 * 45.0;
   zon_do_13 = zon_do_12 ;
   zon_do_16=zon_do_67 * 180.0;
   zon_do_17 = zon_do_16 ;
   zon_do_14=zon_do_67 * 30.0;
   zon_do_15 = 60.0 ;
   zon_do_26 = 30.0 ;
   zon_do_27 = 60.0 ;
   zon_do_24 = 30.0 ;
   zon_do_25 = 60.0 ;
   zon_do_28 = 30.0 ;
   zon_do_29 = 60.0 ;
   zon_do_20 = 30.0 ;
   zon_do_21 = 60.0 ;
   zon_do_22 = 30.0 ;
   zon_do_23 = 60.0 ;
   return;
   }
  if ( mu_0 == 14 )
   {
   zon_bo_6 = iRSI(NULL,0,140,0,1)>50.0 && iRSI(NULL,0,140,0,2)<=50.0 ;
   zon_bo_7 = iRSI(NULL,0,140,0,1)<=50.0 && iRSI(NULL,0,140,0,2)>50.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=iATR(NULL,0,50,1) * 4.5;
   zon_do_13=iATR(NULL,0,50,1) * 4.5;
   zon_do_16=zon_do_67 * 25.0;
   zon_do_17 = zon_do_16 ;
   zon_do_14=zon_do_67 * 30.0;
   zon_do_15=iATR(NULL,0,25,1) * 8.5;
   zon_do_26 = 15.0 ;
   zon_do_27 = 65.0 ;
   zon_do_24 = 15.0 ;
   zon_do_25 = 65.0 ;
   zon_do_28 = 15.0 ;
   zon_do_29 = 65.0 ;
   zon_do_20 = 15.0 ;
   zon_do_21 = 65.0 ;
   zon_do_22 = 15.0 ;
   zon_do_23 = 65.0 ;
   return;
   }
  if ( mu_0 == 15 )
   {
   zon_bo_6 = iRSI(NULL,0,140,0,1)>50.0 && iRSI(NULL,0,140,0,2)<=50.0 ;
   zon_bo_7 = iRSI(NULL,0,140,0,1)<=50.0 && iRSI(NULL,0,140,0,2)>50.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iMA(NULL,0,70,0,MODE_SMA,PRICE_CLOSE,1) - iATR(NULL,0,130,1) * 22.0;
   zon_do_11=iMA(NULL,0,70,0,MODE_SMA,PRICE_CLOSE,1) + iATR(NULL,0,130,1) * 22.0;
   zon_do_12=zon_do_67 * 60.0;
   zon_do_13 = zon_do_12 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=zon_do_67 * 10.0;
   zon_do_15=zon_do_67 * 170.0;
   zon_do_26 = 30.0 ;
   zon_do_27 = 170.0 ;
   zon_do_24 = 30.0 ;
   zon_do_25 = 170.0 ;
   zon_do_28 = 30.0 ;
   zon_do_29 = 170.0 ;
   zon_do_20 = 30.0 ;
   zon_do_21 = 170.0 ;
   zon_do_22 = 30.0 ;
   zon_do_23 = 170.0 ;
   return;
   }
  if ( mu_0 == 16 )
   {
   zon_bo_6 = iRSI(NULL,0,65,0,1)<=50.0 && iRSI(NULL,0,65,0,2)>50.0 ;
   zon_bo_7 = iRSI(NULL,0,65,0,1)>50.0 && iRSI(NULL,0,65,0,2)<=50.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=zon_do_67 * 120.0;
   zon_do_13 = zon_do_12 ;
   zon_do_16=zon_do_67 * 65.0;
   zon_do_17 = zon_do_16 ;
   zon_do_14=iATR(NULL,0,95,1) * 18.5;
   zon_do_15 = 95.0 ;
   zon_do_26 = 50.0 ;
   zon_do_27 = 95.0 ;
   zon_do_24 = 50.0 ;
   zon_do_25 = 95.0 ;
   zon_do_28 = 50.0 ;
   zon_do_29 = 95.0 ;
   zon_do_20 = 50.0 ;
   zon_do_21 = 95.0 ;
   zon_do_22 = 50.0 ;
   zon_do_23 = 95.0 ;
   return;
   }
  if ( mu_0 == 17 )
   {
   zon_bo_6 = iMACD(NULL,0,10,140,1,PRICE_CLOSE,0,1)<=0.0 && iMACD(NULL,0,10,140,1,PRICE_CLOSE,0,2)>0.0 ;
   zon_bo_7 = iMACD(NULL,0,10,140,1,PRICE_CLOSE,0,1)>0.0 && iMACD(NULL,0,10,140,1,PRICE_CLOSE,0,2)<=0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=iATR(NULL,0,150,1) * 3.5;
   zon_do_13=iATR(NULL,0,150,1) * 3.5;
   zon_do_16=iATR(NULL,0,30,1) * 14.5;
   zon_do_17=iATR(NULL,0,30,1) * 14.5;
   zon_do_14=zon_do_67 * 155.0;
   zon_do_15 = 95.0 ;
   zon_do_26 = 60.0 ;
   zon_do_27 = 95.0 ;
   zon_do_24 = 60.0 ;
   zon_do_25 = 95.0 ;
   zon_do_28 = 60.0 ;
   zon_do_29 = 95.0 ;
   zon_do_20 = 60.0 ;
   zon_do_21 = 95.0 ;
   zon_do_22 = 60.0 ;
   zon_do_23 = 95.0 ;
   return;
   }
  if ( mu_0 == 18 )
   {
   zon_bo_6 = iBands(NULL,0,40,1.0,0,0,2,1)>Close[1] && iBands(NULL,0,40,1.0,0,0,2,2)<=Close[2] ;
   zon_bo_7 = iBands(NULL,0,40,1.0,0,0,1,1)<=Close[1] && iBands(NULL,0,40,1.0,0,0,1,2)>Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=iATR(NULL,0,160,1) * 7.5;
   zon_do_13=iATR(NULL,0,160,1) * 7.5;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14 = iATR(NULL,0,150,1) ;
   zon_do_15 = 185.0 ;
   zon_do_26 = 70.0 ;
   zon_do_27 = 185.0 ;
   zon_do_24 = 70.0 ;
   zon_do_25 = 185.0 ;
   zon_do_28 = 70.0 ;
   zon_do_29 = 185.0 ;
   zon_do_20 = 70.0 ;
   zon_do_21 = 185.0 ;
   zon_do_22 = 70.0 ;
   zon_do_23 = 185.0 ;
   return;
   }
  if ( mu_0 == 19 )
   {
   zon_bo_6 = iBands(NULL,0,15,1.0,0,0,1,1)<=Close[1] && iBands(NULL,0,15,1.0,0,0,1,2)>Close[2] ;
   zon_bo_7 = iBands(NULL,0,15,1.0,0,0,2,1)>Close[1] && iBands(NULL,0,15,1.0,0,0,2,2)<=Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=iATR(NULL,0,100,1) * 11.0;
   zon_do_13=iATR(NULL,0,100,1) * 11.0;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=iATR(NULL,0,20,1) * 16.5;
   zon_do_15=iATR(NULL,0,10,1) * 12.0;
   zon_do_26 = 40.0 ;
   zon_do_27 = 190.0 ;
   zon_do_24 = 40.0 ;
   zon_do_25 = 190.0 ;
   zon_do_28 = 40.0 ;
   zon_do_29 = 190.0 ;
   zon_do_20 = 40.0 ;
   zon_do_21 = 190.0 ;
   zon_do_22 = 40.0 ;
   zon_do_23 = 190.0 ;
   return;
   }
  if (mu_0 != 20)  return;
  zon_bo_6 = iBands(NULL,0,40,2.0,0,0,2,1)<=Close[1] && iBands(NULL,0,40,2.0,0,0,2,2)>Close[2] ;
  zon_bo_7 = iBands(NULL,0,40,2.0,0,0,1,1)>Close[1] && iBands(NULL,0,40,2.0,0,0,1,2)<=Close[2] ;
  zon_in_18 = 0 ;
  zon_do_8 = 0.0 ;
  zon_do_9 = 0.0 ;
  zon_do_10=iMA(NULL,0,150,0,MODE_SMA,PRICE_CLOSE,1) + iATR(NULL,0,90,1) * 10.0;
  zon_do_11=iMA(NULL,0,150,0,MODE_SMA,PRICE_CLOSE,1) - iATR(NULL,0,90,1) * 10.0;
  zon_do_12=iATR(NULL,0,45,1) * 18.0;
  zon_do_13=iATR(NULL,0,45,1) * 18.0;
  zon_do_16=zon_do_67 * 30.0;
  zon_do_17 = zon_do_16 ;
  zon_do_14=zon_do_67 * 65.0;
  zon_do_15 = 120.0 ;
  zon_do_26 = 90.0 ;
  zon_do_27 = 120.0 ;
  zon_do_24 = 90.0 ;
  zon_do_25 = 120.0 ;
  zon_do_28 = 90.0 ;
  zon_do_29 = 120.0 ;
  zon_do_20 = 90.0 ;
  zon_do_21 = 120.0 ;
  zon_do_22 = 90.0 ;
  zon_do_23 = 120.0 ;
  return;
  }
// if ( StringFind(zi_st_1,"GBPUSD",0) >= 0 && Period() == 30 )
if (GBPUSD)
  {
  if ( mu_0 == 1 )
   {
   zon_bo_6 = iCCI(NULL,0,155,0,1)>0.0 && iCCI(NULL,0,155,0,2)<=0.0 ;
   zon_bo_7 = iCCI(NULL,0,155,0,1)<=0.0 && iCCI(NULL,0,155,0,2)>0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=iATR(NULL,0,140,1) * 8.0;
   zon_do_13=iATR(NULL,0,140,1) * 8.0;
   zon_do_16=iATR(NULL,0,65,1) * 21.5;
   zon_do_17=iATR(NULL,0,65,1) * 21.5;
   zon_do_14=zon_do_67 * 65.0;
   zon_do_15=zon_do_67 * 135.0;
   zon_do_26 = 55.0 ;
   zon_do_27 = 135.0 ;
   zon_do_24 = 55.0 ;
   zon_do_25 = 135.0 ;
   zon_do_28 = 55.0 ;
   zon_do_29 = 135.0 ;
   zon_do_20 = 55.0 ;
   zon_do_21 = 135.0 ;
   zon_do_22 = 55.0 ;
   zon_do_23 = 135.0 ;
   return;
   }
  if ( mu_0 == 2 )
   {
   zon_bo_6 = iBands(NULL,0,130,2.0,0,0,2,1)>Close[1] && iBands(NULL,0,130,2.0,0,0,2,2)<=Close[2] ;
   zon_bo_7 = iBands(NULL,0,130,2.0,0,0,1,1)<=Close[1] && iBands(NULL,0,130,2.0,0,0,1,2)>Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iMA(NULL,0,200,0,MODE_SMA,PRICE_CLOSE,1) + zon_do_67 * 115.0;
   zon_do_11=iMA(NULL,0,200,0,MODE_SMA,PRICE_CLOSE,1) - zon_do_67 * 115.0;
   zon_do_12=iATR(NULL,0,95,1) * 16.0;
   zon_do_13=iATR(NULL,0,95,1) * 16.0;
   zon_do_16=iATR(NULL,0,160,1) * 12.5;
   zon_do_17=iATR(NULL,0,160,1) * 12.5;
   zon_do_14=iATR(NULL,0,70,1) * 4.5;
   zon_do_15 = 0.0 ;
   zon_do_26 = 110.0 ;
   zon_do_27 = 120.0 ;
   zon_do_24 = 110.0 ;
   zon_do_25 = 120.0 ;
   zon_do_28 = 110.0 ;
   zon_do_29 = 120.0 ;
   zon_do_20 = 110.0 ;
   zon_do_21 = 120.0 ;
   zon_do_22 = 110.0 ;
   zon_do_23 = 120.0 ;
   return;
   }
  if ( mu_0 == 3 )
   {
   zon_bo_6 = iMACD(NULL,0,40,280,1,PRICE_CLOSE,0,1)<=0.0 && iMACD(NULL,0,40,280,1,PRICE_CLOSE,0,2)>0.0 ;
   zon_bo_7 = iMACD(NULL,0,40,280,1,PRICE_CLOSE,0,1)>0.0 && iMACD(NULL,0,40,280,1,PRICE_CLOSE,0,2)<=0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=zon_do_67 * 90.0;
   zon_do_13 = zon_do_12 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=iATR(NULL,0,60,1) * 2.5;
   zon_do_15 = 0.0 ;
   zon_do_26 = 40.0 ;
   zon_do_27 = 85.0 ;
   zon_do_24 = 40.0 ;
   zon_do_25 = 85.0 ;
   zon_do_28 = 40.0 ;
   zon_do_29 = 85.0 ;
   zon_do_20 = 40.0 ;
   zon_do_21 = 85.0 ;
   zon_do_22 = 40.0 ;
   zon_do_23 = 85.0 ;
   return;
   }
  if ( mu_0 == 4 )
   {
   zon_bo_6 = iMACD(NULL,0,5,260,1,PRICE_CLOSE,0,1)<=0.0 && iMACD(NULL,0,5,260,1,PRICE_CLOSE,0,2)>0.0 ;
   zon_bo_7 = iMACD(NULL,0,5,260,1,PRICE_CLOSE,0,1)>0.0 && iMACD(NULL,0,5,260,1,PRICE_CLOSE,0,2)<=0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=iATR(NULL,0,70,1) * 0.5;
   zon_do_13=iATR(NULL,0,70,1) * 0.5;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=iATR(NULL,0,70,1) * 22.5;
   zon_do_15=iATR(NULL,0,70,1) * 5.0;
   zon_do_26 = 120.0 ;
   zon_do_27 = 180.0 ;
   zon_do_24 = 120.0 ;
   zon_do_25 = 180.0 ;
   zon_do_28 = 120.0 ;
   zon_do_29 = 180.0 ;
   zon_do_20 = 120.0 ;
   zon_do_21 = 180.0 ;
   zon_do_22 = 120.0 ;
   zon_do_23 = 180.0 ;
   return;
   }
  if ( mu_0 == 5 )
   {
   zon_bo_6 = iCCI(NULL,0,115,0,1)<=0.0 && iCCI(NULL,0,115,0,2)>0.0 ;
   zon_bo_7 = iCCI(NULL,0,115,0,1)>0.0 && iCCI(NULL,0,115,0,2)<=0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=zon_do_67 * 10.0;
   zon_do_17 = zon_do_16 ;
   zon_do_14=iATR(NULL,0,25,1) * 25.0;
   zon_do_15=zon_do_67 * 200.0;
   zon_do_26 = 60.0 ;
   zon_do_27 = 200.0 ;
   zon_do_24 = 60.0 ;
   zon_do_25 = 200.0 ;
   zon_do_28 = 60.0 ;
   zon_do_29 = 200.0 ;
   zon_do_20 = 60.0 ;
   zon_do_21 = 200.0 ;
   zon_do_22 = 60.0 ;
   zon_do_23 = 200.0 ;
   return;
   }
  if ( mu_0 == 6 )
   {
   zon_bo_6 = iStochastic(NULL,0,60,1,3,0,0,1,1)>80.0 && iStochastic(NULL,0,60,1,3,0,0,1,2)<=80.0 ;
   zon_bo_7 = iStochastic(NULL,0,60,1,3,0,0,1,1)<=20.0 && iStochastic(NULL,0,60,1,3,0,0,1,2)>20.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=iATR(NULL,0,50,1) * 8.5;
   zon_do_15=iATR(NULL,0,5,1) * 9.0;
   zon_do_26 = 180.0 ;
   zon_do_27 = 190.0 ;
   zon_do_24 = 180.0 ;
   zon_do_25 = 190.0 ;
   zon_do_28 = 180.0 ;
   zon_do_29 = 190.0 ;
   zon_do_20 = 180.0 ;
   zon_do_21 = 190.0 ;
   zon_do_22 = 180.0 ;
   zon_do_23 = 190.0 ;
   return;
   }
  if ( mu_0 == 7 )
   {
   zon_bo_6 = iCCI(NULL,0,115,0,1)<=0.0 && iCCI(NULL,0,115,0,2)>0.0 ;
   zon_bo_7 = iCCI(NULL,0,115,0,1)>0.0 && iCCI(NULL,0,115,0,2)<=0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=zon_do_67 * 10.0;
   zon_do_17 = zon_do_16 ;
   zon_do_14=iATR(NULL,0,25,1) * 25.0;
   zon_do_15=zon_do_67 * 200.0;
   zon_do_26 = 60.0 ;
   zon_do_27 = 200.0 ;
   zon_do_24 = 60.0 ;
   zon_do_25 = 200.0 ;
   zon_do_28 = 60.0 ;
   zon_do_29 = 200.0 ;
   zon_do_20 = 60.0 ;
   zon_do_21 = 200.0 ;
   zon_do_22 = 60.0 ;
   zon_do_23 = 200.0 ;
   return;
   }
  if ( mu_0 == 8 )
   {
   zon_bo_6 = iBands(NULL,0,50,1.0,0,0,2,1)>Close[1] && iBands(NULL,0,50,1.0,0,0,2,2)<=Close[2] ;
   zon_bo_7 = iBands(NULL,0,50,1.0,0,0,1,1)<=Close[1] && iBands(NULL,0,50,1.0,0,0,1,2)>Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iBands(NULL,0,140,1.0,0,0,1,1) - zon_do_67 * 75.0;
   zon_do_11=iBands(NULL,0,140,1.0,0,0,2,1) + zon_do_67 * 75.0;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=zon_do_67 * 20.0;
   zon_do_17 = zon_do_16 ;
   zon_do_14=zon_do_67 * 140.0;
   zon_do_15=zon_do_67 * 155.0;
   zon_do_26 = 185.0 ;
   zon_do_27 = 200.0 ;
   zon_do_24 = 185.0 ;
   zon_do_25 = 200.0 ;
   zon_do_28 = 185.0 ;
   zon_do_29 = 200.0 ;
   zon_do_20 = 185.0 ;
   zon_do_21 = 200.0 ;
   zon_do_22 = 185.0 ;
   zon_do_23 = 200.0 ;
   return;
   }
  if ( mu_0 == 9 )
   {
   zon_bo_6 = iRSI(NULL,0,85,0,1)>50.0 && iRSI(NULL,0,85,0,2)<=50.0 ;
   zon_bo_7 = iRSI(NULL,0,85,0,1)<=50.0 && iRSI(NULL,0,85,0,2)>50.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iMA(NULL,0,90,0,MODE_EMA,PRICE_CLOSE,1) - zon_do_67 * 45.0;
   zon_do_11=iMA(NULL,0,90,0,MODE_EMA,PRICE_CLOSE,1) + zon_do_67 * 45.0;
   zon_do_12=zon_do_67 * 70.0;
   zon_do_13 = zon_do_12 ;
   zon_do_16=iATR(NULL,0,70,1) * 23.5;
   zon_do_17=iATR(NULL,0,70,1) * 23.5;
   zon_do_14=zon_do_67 * 160.0;
   zon_do_15=iATR(NULL,0,75,1) * 24.5;
   zon_do_26 = 30.0 ;
   zon_do_27 = 75.0 ;
   zon_do_24 = 30.0 ;
   zon_do_25 = 75.0 ;
   zon_do_28 = 30.0 ;
   zon_do_29 = 75.0 ;
   zon_do_20 = 30.0 ;
   zon_do_21 = 75.0 ;
   zon_do_22 = 30.0 ;
   zon_do_23 = 75.0 ;
   return;
   }
  if ( mu_0 == 10 )
   {
   zon_bo_6 = iBands(NULL,0,30,2.0,0,0,2,1)>Close[1] && iBands(NULL,0,30,2.0,0,0,2,2)<=Close[2] ;
   zon_bo_7 = iBands(NULL,0,30,2.0,0,0,1,1)<=Close[1] && iBands(NULL,0,30,2.0,0,0,1,2)>Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=zon_do_67 * 130.0;
   zon_do_13 = zon_do_12 ;
   zon_do_16=iATR(NULL,0,130,1) * 4.0;
   zon_do_17=iATR(NULL,0,130,1) * 4.0;
   zon_do_14=iATR(NULL,0,65,1) * 17.5;
   zon_do_15 = 0.0 ;
   zon_do_26 = 35.0 ;
   zon_do_27 = 160.0 ;
   zon_do_24 = 35.0 ;
   zon_do_25 = 160.0 ;
   zon_do_28 = 35.0 ;
   zon_do_29 = 160.0 ;
   zon_do_20 = 35.0 ;
   zon_do_21 = 160.0 ;
   zon_do_22 = 35.0 ;
   zon_do_23 = 160.0 ;
   return;
   }
  if ( mu_0 == 11 )
   {
   zon_bo_6 = iStochastic(NULL,0,30,1,3,0,0,1,1)>50.0 && iStochastic(NULL,0,30,1,3,0,0,1,2)<=50.0 ;
   zon_bo_7 = iStochastic(NULL,0,30,1,3,0,0,1,1)<=50.0 && iStochastic(NULL,0,30,1,3,0,0,1,2)>50.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iBands(NULL,0,135,1.0,0,0,1,1) - zon_do_67 * 130.0;
   zon_do_11=iBands(NULL,0,135,1.0,0,0,2,1) + zon_do_67 * 130.0;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=zon_do_67 * 165.0;
   zon_do_15=iATR(NULL,0,40,1) * 4.0;
   zon_do_26 = 95.0 ;
   zon_do_27 = 100.0 ;
   zon_do_24 = 95.0 ;
   zon_do_25 = 100.0 ;
   zon_do_28 = 95.0 ;
   zon_do_29 = 100.0 ;
   zon_do_20 = 95.0 ;
   zon_do_21 = 100.0 ;
   zon_do_22 = 95.0 ;
   zon_do_23 = 100.0 ;
   return;
   }
  if ( mu_0 == 12 )
   {
   zon_bo_6 = iBands(NULL,0,30,2.0,0,0,2,1)<=Close[1] && iBands(NULL,0,30,2.0,0,0,2,2)>Close[2] ;
   zon_bo_7 = iBands(NULL,0,30,2.0,0,0,1,1)>Close[1] && iBands(NULL,0,30,2.0,0,0,1,2)<=Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=iATR(NULL,0,140,1) * 21.0;
   zon_do_17=iATR(NULL,0,140,1) * 21.0;
   zon_do_14=zon_do_67 * 120.0;
   zon_do_15=iATR(NULL,0,50,1) * 24.0;
   zon_do_26 = 135.0 ;
   zon_do_27 = 155.0 ;
   zon_do_24 = 135.0 ;
   zon_do_25 = 155.0 ;
   zon_do_28 = 135.0 ;
   zon_do_29 = 155.0 ;
   zon_do_20 = 135.0 ;
   zon_do_21 = 155.0 ;
   zon_do_22 = 135.0 ;
   zon_do_23 = 155.0 ;
   return;
   }
  if ( mu_0 == 13 )
   {
   zon_bo_6 = iStochastic(NULL,0,15,1,3,0,0,1,1)>70.0 && iStochastic(NULL,0,15,1,3,0,0,1,2)<=70.0 ;
   zon_bo_7 = iStochastic(NULL,0,15,1,3,0,0,1,1)<=30.0 && iStochastic(NULL,0,15,1,3,0,0,1,2)>30.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iMA(NULL,0,40,0,MODE_EMA,PRICE_CLOSE,1) - zon_do_67 * 150.0;
   zon_do_11=iMA(NULL,0,40,0,MODE_EMA,PRICE_CLOSE,1) + zon_do_67 * 150.0;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=iATR(NULL,0,30,1) * 11.5;
   zon_do_17=iATR(NULL,0,30,1) * 11.5;
   zon_do_14=zon_do_67 * 145.0;
   zon_do_15=iATR(NULL,0,70,1) * 18.5;
   zon_do_26 = 170.0 ;
   zon_do_27 = 185.0 ;
   zon_do_24 = 170.0 ;
   zon_do_25 = 185.0 ;
   zon_do_28 = 170.0 ;
   zon_do_29 = 185.0 ;
   zon_do_20 = 170.0 ;
   zon_do_21 = 185.0 ;
   zon_do_22 = 170.0 ;
   zon_do_23 = 185.0 ;
   return;
   }
  if ( mu_0 == 14 )
   {
   zon_bo_6 = iCCI(NULL,0,155,0,1)>0.0 && iCCI(NULL,0,155,0,2)<=0.0 ;
   zon_bo_7 = iCCI(NULL,0,155,0,1)<=0.0 && iCCI(NULL,0,155,0,2)>0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iBands(NULL,0,20,2.0,0,0,1,1) - zon_do_67 * 150.0;
   zon_do_11=iBands(NULL,0,20,2.0,0,0,2,1) + zon_do_67 * 150.0;
   zon_do_12=zon_do_67 * 105.0;
   zon_do_13 = zon_do_12 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=iATR(NULL,0,140,1) * 25.0;
   zon_do_15 = 0.0 ;
   zon_do_26 = 35.0 ;
   zon_do_27 = 170.0 ;
   zon_do_24 = 35.0 ;
   zon_do_25 = 170.0 ;
   zon_do_28 = 35.0 ;
   zon_do_29 = 170.0 ;
   zon_do_20 = 35.0 ;
   zon_do_21 = 170.0 ;
   zon_do_22 = 35.0 ;
   zon_do_23 = 170.0 ;
   return;
   }
  if ( mu_0 == 15 )
   {
   zon_bo_6 = iBands(NULL,0,40,1.0,0,0,2,1)>Close[1] && iBands(NULL,0,40,1.0,0,0,2,2)<=Close[2] ;
   zon_bo_7 = iBands(NULL,0,40,1.0,0,0,1,1)<=Close[1] && iBands(NULL,0,40,1.0,0,0,1,2)>Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=iATR(NULL,0,130,1) * 8.0;
   zon_do_17=iATR(NULL,0,130,1) * 8.0;
   zon_do_14=iATR(NULL,0,15,1) * 20.5;
   zon_do_15=zon_do_67 * 100.0;
   zon_do_26 = 140.0 ;
   zon_do_27 = 190.0 ;
   zon_do_24 = 140.0 ;
   zon_do_25 = 190.0 ;
   zon_do_28 = 140.0 ;
   zon_do_29 = 190.0 ;
   zon_do_20 = 140.0 ;
   zon_do_21 = 190.0 ;
   zon_do_22 = 140.0 ;
   zon_do_23 = 190.0 ;
   return;
   }
  if ( mu_0 == 16 )
   {
   zon_bo_6 = iStochastic(NULL,0,60,1,3,0,0,1,1)>80.0 && iStochastic(NULL,0,60,1,3,0,0,1,2)<=80.0 ;
   zon_bo_7 = iStochastic(NULL,0,60,1,3,0,0,1,1)<=20.0 && iStochastic(NULL,0,60,1,3,0,0,1,2)>20.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=iATR(NULL,0,50,1) * 8.5;
   zon_do_15=iATR(NULL,0,5,1) * 9.0;
   zon_do_26 = 180.0 ;
   zon_do_27 = 190.0 ;
   zon_do_24 = 180.0 ;
   zon_do_25 = 190.0 ;
   zon_do_28 = 180.0 ;
   zon_do_29 = 190.0 ;
   zon_do_20 = 180.0 ;
   zon_do_21 = 190.0 ;
   zon_do_22 = 180.0 ;
   zon_do_23 = 190.0 ;
   return;
   }
  if ( mu_0 == 17 )
   {
   zon_bo_6 = iRSI(NULL,0,100,0,1)>50.0 && iRSI(NULL,0,100,0,2)<=50.0 ;
   zon_bo_7 = iRSI(NULL,0,100,0,1)<=50.0 && iRSI(NULL,0,100,0,2)>50.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=iATR(NULL,0,70,1) * 10.5;
   zon_do_15=zon_do_67 * 55.0;
   zon_do_26 = 90.0 ;
   zon_do_27 = 190.0 ;
   zon_do_24 = 90.0 ;
   zon_do_25 = 190.0 ;
   zon_do_28 = 90.0 ;
   zon_do_29 = 190.0 ;
   zon_do_20 = 90.0 ;
   zon_do_21 = 190.0 ;
   zon_do_22 = 90.0 ;
   zon_do_23 = 190.0 ;
   return;
   }
  if ( mu_0 == 18 )
   {
   zon_bo_6 = iBands(NULL,0,40,2.0,0,0,2,1)>Close[1] && iBands(NULL,0,40,2.0,0,0,2,2)<=Close[2] ;
   zon_bo_7 = iBands(NULL,0,40,2.0,0,0,1,1)<=Close[1] && iBands(NULL,0,40,2.0,0,0,1,2)>Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=iATR(NULL,0,190,1) * 8.5;
   zon_do_13=iATR(NULL,0,190,1) * 8.5;
   zon_do_16=zon_do_67 * 45.0;
   zon_do_17 = zon_do_16 ;
   zon_do_14=iATR(NULL,0,45,1) * 12.0;
   zon_do_15 = 0.0 ;
   zon_do_26 = 55.0 ;
   zon_do_27 = 160.0 ;
   zon_do_24 = 55.0 ;
   zon_do_25 = 160.0 ;
   zon_do_28 = 55.0 ;
   zon_do_29 = 160.0 ;
   zon_do_20 = 55.0 ;
   zon_do_21 = 160.0 ;
   zon_do_22 = 55.0 ;
   zon_do_23 = 160.0 ;
   return;
   }
  if ( mu_0 == 19 )
   {
   zon_bo_6 = iMACD(NULL,0,40,280,1,PRICE_CLOSE,0,1)<=0.0 && iMACD(NULL,0,40,280,1,PRICE_CLOSE,0,2)>0.0 ;
   zon_bo_7 = iMACD(NULL,0,40,280,1,PRICE_CLOSE,0,1)>0.0 && iMACD(NULL,0,40,280,1,PRICE_CLOSE,0,2)<=0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iBands(NULL,0,65,1.0,0,0,2,1) + iATR(NULL,0,20,1) * 16.0;
   zon_do_11=iBands(NULL,0,65,1.0,0,0,1,1) - iATR(NULL,0,20,1) * 16.0;
   zon_do_12=iATR(NULL,0,55,1) * 24.0;
   zon_do_13=iATR(NULL,0,55,1) * 24.0;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=zon_do_67 * 75.0;
   zon_do_15 = 0.0 ;
   zon_do_26 = 45.0 ;
   zon_do_27 = 85.0 ;
   zon_do_24 = 45.0 ;
   zon_do_25 = 85.0 ;
   zon_do_28 = 45.0 ;
   zon_do_29 = 85.0 ;
   zon_do_20 = 45.0 ;
   zon_do_21 = 85.0 ;
   zon_do_22 = 45.0 ;
   zon_do_23 = 85.0 ;
   return;
   }
  if (mu_0 != 20)  return;
  zon_bo_6 = iCCI(NULL,0,155,0,1)>0.0 && iCCI(NULL,0,155,0,2)<=0.0 ;
  zon_bo_7 = iCCI(NULL,0,155,0,1)<=0.0 && iCCI(NULL,0,155,0,2)>0.0 ;
  zon_in_18 = 0 ;
  zon_do_8 = 0.0 ;
  zon_do_9 = 0.0 ;
  zon_do_10 = 0.0 ;
  zon_do_11 = 0.0 ;
  zon_do_12=iATR(NULL,0,140,1) * 8.0;
  zon_do_13=iATR(NULL,0,140,1) * 8.0;
  zon_do_16=iATR(NULL,0,65,1) * 21.5;
  zon_do_17=iATR(NULL,0,65,1) * 21.5;
  zon_do_14=zon_do_67 * 65.0;
  zon_do_15=zon_do_67 * 135.0;
  zon_do_26 = 55.0 ;
  zon_do_27 = 135.0 ;
  zon_do_24 = 55.0 ;
  zon_do_25 = 135.0 ;
  zon_do_28 = 55.0 ;
  zon_do_29 = 135.0 ;
  zon_do_20 = 55.0 ;
  zon_do_21 = 135.0 ;
  zon_do_22 = 55.0 ;
  zon_do_23 = 135.0 ;
  return;
  }
  
/*if (GBPCAD)
  {
  if ( mu_0 == 1 )
   {
   zon_bo_6 = iCCI(NULL,0,155,0,1)>0.0 && iCCI(NULL,0,155,0,2)<=0.0 ;
   zon_bo_7 = iCCI(NULL,0,155,0,1)<=0.0 && iCCI(NULL,0,155,0,2)>0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=iATR(NULL,0,140,1) * 8.0;
   zon_do_13=iATR(NULL,0,140,1) * 8.0;
   zon_do_16=iATR(NULL,0,65,1) * 21.5;
   zon_do_17=iATR(NULL,0,65,1) * 21.5;
   zon_do_14=zon_do_67 * 65.0;
   zon_do_15=zon_do_67 * 135.0;
   zon_do_26 = 55.0 ;
   zon_do_27 = 135.0 ;
   zon_do_24 = 55.0 ;
   zon_do_25 = 135.0 ;
   zon_do_28 = 55.0 ;
   zon_do_29 = 135.0 ;
   zon_do_20 = 55.0 ;
   zon_do_21 = 135.0 ;
   zon_do_22 = 55.0 ;
   zon_do_23 = 135.0 ;
   return;
   }
  if ( mu_0 == 2 )
   {
   zon_bo_6 = iBands(NULL,0,130,2.0,0,0,2,1)>Close[1] && iBands(NULL,0,130,2.0,0,0,2,2)<=Close[2] ;
   zon_bo_7 = iBands(NULL,0,130,2.0,0,0,1,1)<=Close[1] && iBands(NULL,0,130,2.0,0,0,1,2)>Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iMA(NULL,0,200,0,MODE_SMA,PRICE_CLOSE,1) + zon_do_67 * 115.0;
   zon_do_11=iMA(NULL,0,200,0,MODE_SMA,PRICE_CLOSE,1) - zon_do_67 * 115.0;
   zon_do_12=iATR(NULL,0,95,1) * 16.0;
   zon_do_13=iATR(NULL,0,95,1) * 16.0;
   zon_do_16=iATR(NULL,0,160,1) * 12.5;
   zon_do_17=iATR(NULL,0,160,1) * 12.5;
   zon_do_14=iATR(NULL,0,70,1) * 4.5;
   zon_do_15 = 0.0 ;
   zon_do_26 = 110.0 ;
   zon_do_27 = 120.0 ;
   zon_do_24 = 110.0 ;
   zon_do_25 = 120.0 ;
   zon_do_28 = 110.0 ;
   zon_do_29 = 120.0 ;
   zon_do_20 = 110.0 ;
   zon_do_21 = 120.0 ;
   zon_do_22 = 110.0 ;
   zon_do_23 = 120.0 ;
   return;
   }
  if ( mu_0 == 3 )
   {
   zon_bo_6 = iMACD(NULL,0,40,280,1,PRICE_CLOSE,0,1)<=0.0 && iMACD(NULL,0,40,280,1,PRICE_CLOSE,0,2)>0.0 ;
   zon_bo_7 = iMACD(NULL,0,40,280,1,PRICE_CLOSE,0,1)>0.0 && iMACD(NULL,0,40,280,1,PRICE_CLOSE,0,2)<=0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=zon_do_67 * 90.0;
   zon_do_13 = zon_do_12 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=iATR(NULL,0,60,1) * 2.5;
   zon_do_15 = 0.0 ;
   zon_do_26 = 40.0 ;
   zon_do_27 = 85.0 ;
   zon_do_24 = 40.0 ;
   zon_do_25 = 85.0 ;
   zon_do_28 = 40.0 ;
   zon_do_29 = 85.0 ;
   zon_do_20 = 40.0 ;
   zon_do_21 = 85.0 ;
   zon_do_22 = 40.0 ;
   zon_do_23 = 85.0 ;
   return;
   }
  if ( mu_0 == 4 )
   {
   zon_bo_6 = iMACD(NULL,0,5,260,1,PRICE_CLOSE,0,1)<=0.0 && iMACD(NULL,0,5,260,1,PRICE_CLOSE,0,2)>0.0 ;
   zon_bo_7 = iMACD(NULL,0,5,260,1,PRICE_CLOSE,0,1)>0.0 && iMACD(NULL,0,5,260,1,PRICE_CLOSE,0,2)<=0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=iATR(NULL,0,70,1) * 0.5;
   zon_do_13=iATR(NULL,0,70,1) * 0.5;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=iATR(NULL,0,70,1) * 22.5;
   zon_do_15=iATR(NULL,0,70,1) * 5.0;
   zon_do_26 = 120.0 ;
   zon_do_27 = 180.0 ;
   zon_do_24 = 120.0 ;
   zon_do_25 = 180.0 ;
   zon_do_28 = 120.0 ;
   zon_do_29 = 180.0 ;
   zon_do_20 = 120.0 ;
   zon_do_21 = 180.0 ;
   zon_do_22 = 120.0 ;
   zon_do_23 = 180.0 ;
   return;
   }
  if ( mu_0 == 5 )
   {
   zon_bo_6 = iCCI(NULL,0,115,0,1)<=0.0 && iCCI(NULL,0,115,0,2)>0.0 ;
   zon_bo_7 = iCCI(NULL,0,115,0,1)>0.0 && iCCI(NULL,0,115,0,2)<=0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=zon_do_67 * 10.0;
   zon_do_17 = zon_do_16 ;
   zon_do_14=iATR(NULL,0,25,1) * 25.0;
   zon_do_15=zon_do_67 * 200.0;
   zon_do_26 = 60.0 ;
   zon_do_27 = 200.0 ;
   zon_do_24 = 60.0 ;
   zon_do_25 = 200.0 ;
   zon_do_28 = 60.0 ;
   zon_do_29 = 200.0 ;
   zon_do_20 = 60.0 ;
   zon_do_21 = 200.0 ;
   zon_do_22 = 60.0 ;
   zon_do_23 = 200.0 ;
   return;
   }
  if ( mu_0 == 6 )
   {
   zon_bo_6 = iStochastic(NULL,0,60,1,3,0,0,1,1)>80.0 && iStochastic(NULL,0,60,1,3,0,0,1,2)<=80.0 ;
   zon_bo_7 = iStochastic(NULL,0,60,1,3,0,0,1,1)<=20.0 && iStochastic(NULL,0,60,1,3,0,0,1,2)>20.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=iATR(NULL,0,50,1) * 8.5;
   zon_do_15=iATR(NULL,0,5,1) * 9.0;
   zon_do_26 = 180.0 ;
   zon_do_27 = 190.0 ;
   zon_do_24 = 180.0 ;
   zon_do_25 = 190.0 ;
   zon_do_28 = 180.0 ;
   zon_do_29 = 190.0 ;
   zon_do_20 = 180.0 ;
   zon_do_21 = 190.0 ;
   zon_do_22 = 180.0 ;
   zon_do_23 = 190.0 ;
   return;
   }
  if ( mu_0 == 7 )
   {
   zon_bo_6 = iCCI(NULL,0,115,0,1)<=0.0 && iCCI(NULL,0,115,0,2)>0.0 ;
   zon_bo_7 = iCCI(NULL,0,115,0,1)>0.0 && iCCI(NULL,0,115,0,2)<=0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=zon_do_67 * 10.0;
   zon_do_17 = zon_do_16 ;
   zon_do_14=iATR(NULL,0,25,1) * 25.0;
   zon_do_15=zon_do_67 * 200.0;
   zon_do_26 = 60.0 ;
   zon_do_27 = 200.0 ;
   zon_do_24 = 60.0 ;
   zon_do_25 = 200.0 ;
   zon_do_28 = 60.0 ;
   zon_do_29 = 200.0 ;
   zon_do_20 = 60.0 ;
   zon_do_21 = 200.0 ;
   zon_do_22 = 60.0 ;
   zon_do_23 = 200.0 ;
   return;
   }
  if ( mu_0 == 8 )
   {
   zon_bo_6 = iBands(NULL,0,50,1.0,0,0,2,1)>Close[1] && iBands(NULL,0,50,1.0,0,0,2,2)<=Close[2] ;
   zon_bo_7 = iBands(NULL,0,50,1.0,0,0,1,1)<=Close[1] && iBands(NULL,0,50,1.0,0,0,1,2)>Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iBands(NULL,0,140,1.0,0,0,1,1) - zon_do_67 * 75.0;
   zon_do_11=iBands(NULL,0,140,1.0,0,0,2,1) + zon_do_67 * 75.0;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=zon_do_67 * 20.0;
   zon_do_17 = zon_do_16 ;
   zon_do_14=zon_do_67 * 140.0;
   zon_do_15=zon_do_67 * 155.0;
   zon_do_26 = 185.0 ;
   zon_do_27 = 200.0 ;
   zon_do_24 = 185.0 ;
   zon_do_25 = 200.0 ;
   zon_do_28 = 185.0 ;
   zon_do_29 = 200.0 ;
   zon_do_20 = 185.0 ;
   zon_do_21 = 200.0 ;
   zon_do_22 = 185.0 ;
   zon_do_23 = 200.0 ;
   return;
   }
  if ( mu_0 == 9 )
   {
   zon_bo_6 = iRSI(NULL,0,85,0,1)>50.0 && iRSI(NULL,0,85,0,2)<=50.0 ;
   zon_bo_7 = iRSI(NULL,0,85,0,1)<=50.0 && iRSI(NULL,0,85,0,2)>50.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iMA(NULL,0,90,0,MODE_EMA,PRICE_CLOSE,1) - zon_do_67 * 45.0;
   zon_do_11=iMA(NULL,0,90,0,MODE_EMA,PRICE_CLOSE,1) + zon_do_67 * 45.0;
   zon_do_12=zon_do_67 * 70.0;
   zon_do_13 = zon_do_12 ;
   zon_do_16=iATR(NULL,0,70,1) * 23.5;
   zon_do_17=iATR(NULL,0,70,1) * 23.5;
   zon_do_14=zon_do_67 * 160.0;
   zon_do_15=iATR(NULL,0,75,1) * 24.5;
   zon_do_26 = 30.0 ;
   zon_do_27 = 75.0 ;
   zon_do_24 = 30.0 ;
   zon_do_25 = 75.0 ;
   zon_do_28 = 30.0 ;
   zon_do_29 = 75.0 ;
   zon_do_20 = 30.0 ;
   zon_do_21 = 75.0 ;
   zon_do_22 = 30.0 ;
   zon_do_23 = 75.0 ;
   return;
   }
  if ( mu_0 == 10 )
   {
   zon_bo_6 = iBands(NULL,0,30,2.0,0,0,2,1)>Close[1] && iBands(NULL,0,30,2.0,0,0,2,2)<=Close[2] ;
   zon_bo_7 = iBands(NULL,0,30,2.0,0,0,1,1)<=Close[1] && iBands(NULL,0,30,2.0,0,0,1,2)>Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=zon_do_67 * 130.0;
   zon_do_13 = zon_do_12 ;
   zon_do_16=iATR(NULL,0,130,1) * 4.0;
   zon_do_17=iATR(NULL,0,130,1) * 4.0;
   zon_do_14=iATR(NULL,0,65,1) * 17.5;
   zon_do_15 = 0.0 ;
   zon_do_26 = 35.0 ;
   zon_do_27 = 160.0 ;
   zon_do_24 = 35.0 ;
   zon_do_25 = 160.0 ;
   zon_do_28 = 35.0 ;
   zon_do_29 = 160.0 ;
   zon_do_20 = 35.0 ;
   zon_do_21 = 160.0 ;
   zon_do_22 = 35.0 ;
   zon_do_23 = 160.0 ;
   return;
   }
  if ( mu_0 == 11 )
   {
   zon_bo_6 = iStochastic(NULL,0,30,1,3,0,0,1,1)>50.0 && iStochastic(NULL,0,30,1,3,0,0,1,2)<=50.0 ;
   zon_bo_7 = iStochastic(NULL,0,30,1,3,0,0,1,1)<=50.0 && iStochastic(NULL,0,30,1,3,0,0,1,2)>50.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iBands(NULL,0,135,1.0,0,0,1,1) - zon_do_67 * 130.0;
   zon_do_11=iBands(NULL,0,135,1.0,0,0,2,1) + zon_do_67 * 130.0;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=zon_do_67 * 165.0;
   zon_do_15=iATR(NULL,0,40,1) * 4.0;
   zon_do_26 = 95.0 ;
   zon_do_27 = 100.0 ;
   zon_do_24 = 95.0 ;
   zon_do_25 = 100.0 ;
   zon_do_28 = 95.0 ;
   zon_do_29 = 100.0 ;
   zon_do_20 = 95.0 ;
   zon_do_21 = 100.0 ;
   zon_do_22 = 95.0 ;
   zon_do_23 = 100.0 ;
   return;
   }
  if ( mu_0 == 12 )
   {
   zon_bo_6 = iBands(NULL,0,30,2.0,0,0,2,1)<=Close[1] && iBands(NULL,0,30,2.0,0,0,2,2)>Close[2] ;
   zon_bo_7 = iBands(NULL,0,30,2.0,0,0,1,1)>Close[1] && iBands(NULL,0,30,2.0,0,0,1,2)<=Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=iATR(NULL,0,140,1) * 21.0;
   zon_do_17=iATR(NULL,0,140,1) * 21.0;
   zon_do_14=zon_do_67 * 120.0;
   zon_do_15=iATR(NULL,0,50,1) * 24.0;
   zon_do_26 = 135.0 ;
   zon_do_27 = 155.0 ;
   zon_do_24 = 135.0 ;
   zon_do_25 = 155.0 ;
   zon_do_28 = 135.0 ;
   zon_do_29 = 155.0 ;
   zon_do_20 = 135.0 ;
   zon_do_21 = 155.0 ;
   zon_do_22 = 135.0 ;
   zon_do_23 = 155.0 ;
   return;
   }
  if ( mu_0 == 13 )
   {
   zon_bo_6 = iStochastic(NULL,0,15,1,3,0,0,1,1)>70.0 && iStochastic(NULL,0,15,1,3,0,0,1,2)<=70.0 ;
   zon_bo_7 = iStochastic(NULL,0,15,1,3,0,0,1,1)<=30.0 && iStochastic(NULL,0,15,1,3,0,0,1,2)>30.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iMA(NULL,0,40,0,MODE_EMA,PRICE_CLOSE,1) - zon_do_67 * 150.0;
   zon_do_11=iMA(NULL,0,40,0,MODE_EMA,PRICE_CLOSE,1) + zon_do_67 * 150.0;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=iATR(NULL,0,30,1) * 11.5;
   zon_do_17=iATR(NULL,0,30,1) * 11.5;
   zon_do_14=zon_do_67 * 145.0;
   zon_do_15=iATR(NULL,0,70,1) * 18.5;
   zon_do_26 = 170.0 ;
   zon_do_27 = 185.0 ;
   zon_do_24 = 170.0 ;
   zon_do_25 = 185.0 ;
   zon_do_28 = 170.0 ;
   zon_do_29 = 185.0 ;
   zon_do_20 = 170.0 ;
   zon_do_21 = 185.0 ;
   zon_do_22 = 170.0 ;
   zon_do_23 = 185.0 ;
   return;
   }
  if ( mu_0 == 14 )
   {
   zon_bo_6 = iCCI(NULL,0,155,0,1)>0.0 && iCCI(NULL,0,155,0,2)<=0.0 ;
   zon_bo_7 = iCCI(NULL,0,155,0,1)<=0.0 && iCCI(NULL,0,155,0,2)>0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iBands(NULL,0,20,2.0,0,0,1,1) - zon_do_67 * 150.0;
   zon_do_11=iBands(NULL,0,20,2.0,0,0,2,1) + zon_do_67 * 150.0;
   zon_do_12=zon_do_67 * 105.0;
   zon_do_13 = zon_do_12 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=iATR(NULL,0,140,1) * 25.0;
   zon_do_15 = 0.0 ;
   zon_do_26 = 35.0 ;
   zon_do_27 = 170.0 ;
   zon_do_24 = 35.0 ;
   zon_do_25 = 170.0 ;
   zon_do_28 = 35.0 ;
   zon_do_29 = 170.0 ;
   zon_do_20 = 35.0 ;
   zon_do_21 = 170.0 ;
   zon_do_22 = 35.0 ;
   zon_do_23 = 170.0 ;
   return;
   }
  if ( mu_0 == 15 )
   {
   zon_bo_6 = iBands(NULL,0,40,1.0,0,0,2,1)>Close[1] && iBands(NULL,0,40,1.0,0,0,2,2)<=Close[2] ;
   zon_bo_7 = iBands(NULL,0,40,1.0,0,0,1,1)<=Close[1] && iBands(NULL,0,40,1.0,0,0,1,2)>Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16=iATR(NULL,0,130,1) * 8.0;
   zon_do_17=iATR(NULL,0,130,1) * 8.0;
   zon_do_14=iATR(NULL,0,15,1) * 20.5;
   zon_do_15=zon_do_67 * 100.0;
   zon_do_26 = 140.0 ;
   zon_do_27 = 190.0 ;
   zon_do_24 = 140.0 ;
   zon_do_25 = 190.0 ;
   zon_do_28 = 140.0 ;
   zon_do_29 = 190.0 ;
   zon_do_20 = 140.0 ;
   zon_do_21 = 190.0 ;
   zon_do_22 = 140.0 ;
   zon_do_23 = 190.0 ;
   return;
   }
  if ( mu_0 == 16 )
   {
   zon_bo_6 = iStochastic(NULL,0,60,1,3,0,0,1,1)>80.0 && iStochastic(NULL,0,60,1,3,0,0,1,2)<=80.0 ;
   zon_bo_7 = iStochastic(NULL,0,60,1,3,0,0,1,1)<=20.0 && iStochastic(NULL,0,60,1,3,0,0,1,2)>20.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=iATR(NULL,0,50,1) * 8.5;
   zon_do_15=iATR(NULL,0,5,1) * 9.0;
   zon_do_26 = 180.0 ;
   zon_do_27 = 190.0 ;
   zon_do_24 = 180.0 ;
   zon_do_25 = 190.0 ;
   zon_do_28 = 180.0 ;
   zon_do_29 = 190.0 ;
   zon_do_20 = 180.0 ;
   zon_do_21 = 190.0 ;
   zon_do_22 = 180.0 ;
   zon_do_23 = 190.0 ;
   return;
   }
  if ( mu_0 == 17 )
   {
   zon_bo_6 = iRSI(NULL,0,100,0,1)>50.0 && iRSI(NULL,0,100,0,2)<=50.0 ;
   zon_bo_7 = iRSI(NULL,0,100,0,1)<=50.0 && iRSI(NULL,0,100,0,2)>50.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12 = 0.0 ;
   zon_do_13 = 0.0 ;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=iATR(NULL,0,70,1) * 10.5;
   zon_do_15=zon_do_67 * 55.0;
   zon_do_26 = 90.0 ;
   zon_do_27 = 190.0 ;
   zon_do_24 = 90.0 ;
   zon_do_25 = 190.0 ;
   zon_do_28 = 90.0 ;
   zon_do_29 = 190.0 ;
   zon_do_20 = 90.0 ;
   zon_do_21 = 190.0 ;
   zon_do_22 = 90.0 ;
   zon_do_23 = 190.0 ;
   return;
   }
  if ( mu_0 == 18 )
   {
   zon_bo_6 = iBands(NULL,0,40,2.0,0,0,2,1)>Close[1] && iBands(NULL,0,40,2.0,0,0,2,2)<=Close[2] ;
   zon_bo_7 = iBands(NULL,0,40,2.0,0,0,1,1)<=Close[1] && iBands(NULL,0,40,2.0,0,0,1,2)>Close[2] ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10 = 0.0 ;
   zon_do_11 = 0.0 ;
   zon_do_12=iATR(NULL,0,190,1) * 8.5;
   zon_do_13=iATR(NULL,0,190,1) * 8.5;
   zon_do_16=zon_do_67 * 45.0;
   zon_do_17 = zon_do_16 ;
   zon_do_14=iATR(NULL,0,45,1) * 12.0;
   zon_do_15 = 0.0 ;
   zon_do_26 = 55.0 ;
   zon_do_27 = 160.0 ;
   zon_do_24 = 55.0 ;
   zon_do_25 = 160.0 ;
   zon_do_28 = 55.0 ;
   zon_do_29 = 160.0 ;
   zon_do_20 = 55.0 ;
   zon_do_21 = 160.0 ;
   zon_do_22 = 55.0 ;
   zon_do_23 = 160.0 ;
   return;
   }
  if ( mu_0 == 19 )
   {
   zon_bo_6 = iMACD(NULL,0,40,280,1,PRICE_CLOSE,0,1)<=0.0 && iMACD(NULL,0,40,280,1,PRICE_CLOSE,0,2)>0.0 ;
   zon_bo_7 = iMACD(NULL,0,40,280,1,PRICE_CLOSE,0,1)>0.0 && iMACD(NULL,0,40,280,1,PRICE_CLOSE,0,2)<=0.0 ;
   zon_in_18 = 0 ;
   zon_do_8 = 0.0 ;
   zon_do_9 = 0.0 ;
   zon_do_10=iBands(NULL,0,65,1.0,0,0,2,1) + iATR(NULL,0,20,1) * 16.0;
   zon_do_11=iBands(NULL,0,65,1.0,0,0,1,1) - iATR(NULL,0,20,1) * 16.0;
   zon_do_12=iATR(NULL,0,55,1) * 24.0;
   zon_do_13=iATR(NULL,0,55,1) * 24.0;
   zon_do_16 = 0.0 ;
   zon_do_17 = 0.0 ;
   zon_do_14=zon_do_67 * 75.0;
   zon_do_15 = 0.0 ;
   zon_do_26 = 45.0 ;
   zon_do_27 = 85.0 ;
   zon_do_24 = 45.0 ;
   zon_do_25 = 85.0 ;
   zon_do_28 = 45.0 ;
   zon_do_29 = 85.0 ;
   zon_do_20 = 45.0 ;
   zon_do_21 = 85.0 ;
   zon_do_22 = 45.0 ;
   zon_do_23 = 85.0 ;
   return;
   }
  if (mu_0 != 20)  return;
  zon_bo_6 = iCCI(NULL,0,155,0,1)>0.0 && iCCI(NULL,0,155,0,2)<=0.0 ;
  zon_bo_7 = iCCI(NULL,0,155,0,1)<=0.0 && iCCI(NULL,0,155,0,2)>0.0 ;
  zon_in_18 = 0 ;
  zon_do_8 = 0.0 ;
  zon_do_9 = 0.0 ;
  zon_do_10 = 0.0 ;
  zon_do_11 = 0.0 ;
  zon_do_12=iATR(NULL,0,140,1) * 8.0;
  zon_do_13=iATR(NULL,0,140,1) * 8.0;
  zon_do_16=iATR(NULL,0,65,1) * 21.5;
  zon_do_17=iATR(NULL,0,65,1) * 21.5;
  zon_do_14=zon_do_67 * 65.0;
  zon_do_15=zon_do_67 * 135.0;
  zon_do_26 = 55.0 ;
  zon_do_27 = 135.0 ;
  zon_do_24 = 55.0 ;
  zon_do_25 = 135.0 ;
  zon_do_28 = 55.0 ;
  zon_do_29 = 135.0 ;
  zon_do_20 = 55.0 ;
  zon_do_21 = 135.0 ;
  zon_do_22 = 55.0 ;
  zon_do_23 = 135.0 ;
  return;
  }
 */ 
  
  
 Print("Not For:  " + zi_st_2 + "    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    "); 
 }
//lizong_6
//---------------------  ----------------------------------------

 bool lizong_7()
 {

//----------------------------
 int        lin_in_1;
 bool       lin_bo_3;
 int        lin_in_6;
 string     lin_st_8;
 int        lin_in_5;
 int        lin_in_9;
 int        lin_in_11;

 for (lin_in_1 = 0 ; lin_in_1 < OrdersTotal() ; lin_in_1=lin_in_1 + 1)
  {
  if ( OrderSelect(lin_in_1,SELECT_BY_POS,MODE_TRADES) == true && OrderMagicNumber() == Magic && OrderSymbol() == Symbol() )
   {
   if ( OrderType() == 0 )
    break;
   if ( OrderType() == 1 )
    break;
   }
  }
 lizong_12(); 
 if ( zon_bo_41 )
  {
  if ( zon_bo_76 == false && ( TimeCurrent() < StringToTime(zon_st_42) || TimeCurrent() > StringToTime(zon_st_43) ) )
   {
   lin_bo_3 = false;
   }
  else
   {
   if ( zon_bo_76 == true && TimeCurrent() > StringToTime(zon_st_43) && TimeCurrent() <  StringToTime(zon_st_42) )
    {
    lin_bo_3 = false;
    }
   else
    {
    lin_bo_3 = true;
   }}
  if ( lin_bo_3 == false )
   {
   return(false); 
  }}
 if ( !(lizong_15(Time[0])) )
  {
  return(false); 
  }
 if ( zon_in_39 > 0 )
  {
  lin_in_6 = zon_in_73 - 10;
  if ( lin_in_6 <  0 )
   {
   lin_in_6 = 0;
   }
  lin_st_8 = TimeToString(TimeCurrent(),TIME_DATE);
  lin_in_5 = 0;
  lin_in_9 = lin_in_6;
  while (lin_in_9 < HistoryTotal())
   {
   if ( OrderSelect(lin_in_9,SELECT_BY_POS,MODE_HISTORY) == true && OrderMagicNumber() == Magic && OrderSymbol() == Symbol() )
    {
    TimeToString(OrderOpenTime(),TIME_DATE); 
    zon_in_73 = lin_in_9 ;
    if ( OrderSymbol() == lin_st_8 )
     {
     lin_in_5=lin_in_5 + 1; 
    }}
   lin_in_9=zon_in_73 + 1; 
   }
  for (lin_in_11 = 0 ; lin_in_11 < OrdersTotal() ; lin_in_11=lin_in_11 + 1)
   {
   if ( OrderSelect(lin_in_11,SELECT_BY_POS,MODE_TRADES) == true && OrderMagicNumber() == Magic && OrderSymbol() == Symbol() && TimeToString(OrderOpenTime(),TIME_DATE) == lin_st_8 )
    {
    lin_in_5=lin_in_5 + 1; 
    }
   }
  if ( lin_in_5 >= zon_in_39 )
   {
   return(false); 
  }}
 return(true); 
 }
//lizong_7
//---------------------  ----------------------------------------

 void lizong_8()
 {
 int         zi_in_1;

//----------------------------
 int        lin_in_1;
 bool       lin_bo_2;
 int        lin_in_3;
 int        lin_in_4;
 double     lin_do_7;
 int        lin_in_11;
 int        lin_in_12;
 double     lin_do_13;
 int        lin_in_15;
 int        lin_in_16;
 int        lin_in_18;
 int        lin_in_19;
 double     lin_do_21;
 int        lin_in_25;
 int        lin_in_26;
 double     lin_do_27;
 int        lin_in_29;
 int        lin_in_30;
 long       lin_lo_32;
 bool       lin_bo_33;
 int        lin_in_35;
 int        lin_in_36;
 double     lin_do_37;
 int        lin_in_39;
 int        lin_in_40;
 int        lin_in_43;
 int        lin_in_44;
 double     lin_do_45;
 int        lin_in_47;
 int        lin_in_48;

 for (lin_in_1 = 0 ; lin_in_1 < OrdersTotal() ; lin_in_1=lin_in_1 + 1)
  {
  if ( OrderSelect(lin_in_1,SELECT_BY_POS,MODE_TRADES) == true && OrderMagicNumber() == Magic && OrderSymbol() == Symbol() )
   {
   lin_bo_2 = true;
   break;
   }
  }
 lin_bo_2 = false;
 if ( lin_bo_2 != 0 )
  {
  if ( zon_bo_45 )
   {
   if ( zon_st_46 == "00:00" )
    {
    for (lin_in_3 = 0 ; lin_in_3 < OrdersTotal() ; lin_in_3=lin_in_3 + 1)
     {
     if ( OrderSelect(lin_in_3,SELECT_BY_POS,MODE_TRADES) == true && OrderMagicNumber() == Magic && OrderSymbol() == Symbol() )
      {
      lin_in_4 = OrderType();
      if ( TimeToString(Time[0],TIME_DATE)  !=  TimeToString(OrderOpenTime(),TIME_DATE) )
       {
       if ( ( lin_in_4 == 0 || lin_in_4 == 1 ) )
        {
        RefreshRates(); 
        lin_do_7 = 0.0;
        if ( OrderType() == 0 )
         {
         lin_do_7 = Bid;
         }
        else
         {
         lin_do_7 = Ask;
         }
        zon_bo_84 = OrderClose(OrderTicket(),OrderLots(),lin_do_7,zon_in_60,0xFFFFFFFF) ;
        }
       else
        {
        if ( OrderDelete(OrderTicket(),0xFFFFFFFF) )
         {
         zon_in_83 = OrderTicket() ;
      }}}}
     }
    }
   else
    {
    if ( TimeCurrent() >= StringToTime(zon_st_46) )
     {
     lin_in_11 = 0;
     for (lin_in_12 = 0 ; lin_in_12 < OrdersTotal() ; lin_in_12=lin_in_12 + 1)
      {
      if ( OrderSelect(lin_in_12,SELECT_BY_POS,MODE_TRADES) == true && OrderMagicNumber() == Magic && OrderSymbol() == Symbol() )
       {
       lin_in_11 = OrderType();
       if ( ( OrderType() == 0 || lin_in_11 == 1 ) )
        {
        RefreshRates(); 
        lin_do_13 = 0.0;
        if ( OrderType() == 0 )
         {
         lin_do_13 = Bid;
         }
        else
         {
         lin_do_13 = Ask;
         }
        zon_bo_84 = OrderClose(OrderTicket(),OrderLots(),lin_do_13,zon_in_60,0xFFFFFFFF) ;
       }}
      }
     lin_in_15 = 0;
     for (lin_in_16 = 0 ; lin_in_16 < OrdersTotal() ; lin_in_16=lin_in_16 + 1)
      {
      if ( OrderSelect(lin_in_16,SELECT_BY_POS,MODE_TRADES) == true && OrderMagicNumber() == Magic && OrderSymbol() == Symbol() )
       {
       lin_in_15 = OrderType();
       if ( OrderType() != 0 && lin_in_15  !=  1 && OrderDelete(OrderTicket(),0xFFFFFFFF) )
        {
        zon_in_83 = OrderTicket() ;
       }}
      }
   }}}
   
   
   
  if ( zon_bo_47 )
   {
   zi_in_1 = TimeDayOfWeek(Time[0]) ;
   if ( ( zon_st_48 == "00:00" || zon_st_48 == "0:00" ) )
    {
    if ( ( zi_in_1 == 6 || zi_in_1 == 0 || zi_in_1 == 1 ) )
     {
     for (lin_in_18 = 0 ; lin_in_18 < OrdersTotal() ; lin_in_18=lin_in_18 + 1)
      {
      if ( OrderSelect(lin_in_18,SELECT_BY_POS,MODE_TRADES) == true && OrderMagicNumber() == Magic && OrderSymbol() == Symbol() )
       {
       lin_in_19 = OrderType();
       if ( TimeToString(Time[0],TIME_DATE)  !=  TimeToString(OrderOpenTime(),TIME_DATE) )
        {
        if ( ( lin_in_19 == 0 || lin_in_19 == 1 ) )
         {
         RefreshRates(); 
         lin_do_21 = 0.0;
         if ( OrderType() == 0 )
          {
          lin_do_21 = Bid;
          }
         else
          {
          lin_do_21 = Ask;
          }
         zon_bo_84 = OrderClose(OrderTicket(),OrderLots(),lin_do_21,zon_in_60,0xFFFFFFFF) ;
         }
        else
         {
         if ( OrderDelete(OrderTicket(),0xFFFFFFFF) )
          {
          zon_in_83 = OrderTicket() ;
       }}}}
      }
    }}
   else
    {
    if ( zi_in_1 == 5 && TimeCurrent() >= StringToTime(zon_st_48) )
     {
     lin_in_25 = 0;
     for (lin_in_26 = 0 ; lin_in_26 < OrdersTotal() ; lin_in_26=lin_in_26 + 1)
      {
      if ( OrderSelect(lin_in_26,SELECT_BY_POS,MODE_TRADES) == true && OrderMagicNumber() == Magic && OrderSymbol() == Symbol() )
       {
       lin_in_25 = OrderType();
       if ( ( OrderType() == 0 || lin_in_25 == 1 ) )
        {
        RefreshRates(); 
        lin_do_27 = 0.0;
        if ( OrderType() == 0 )
         {
         lin_do_27 = Bid;
         }
        else
         {
         lin_do_27 = Ask;
         }
        zon_bo_84 = OrderClose(OrderTicket(),OrderLots(),lin_do_27,zon_in_60,0xFFFFFFFF) ;
       }}
      }
     lin_in_29 = 0;
     for (lin_in_30 = 0 ; lin_in_30 < OrdersTotal() ; lin_in_30=lin_in_30 + 1)
      {
      if ( OrderSelect(lin_in_30,SELECT_BY_POS,MODE_TRADES) == true && OrderMagicNumber() == Magic && OrderSymbol() == Symbol() )
       {
       lin_in_29 = OrderType();
       if ( OrderType() != 0 && lin_in_29  !=  1 && OrderDelete(OrderTicket(),0xFFFFFFFF) )
        {
        zon_in_83 = OrderTicket() ;
       }}
      }
  }}}
  }
  
 if (!(zon_bo_41))  return;
 if ( zon_bo_76 == false )
  {
  lin_lo_32 = TimeCurrent();
  if ( ( lin_lo_32 < StringToTime(zon_st_42) || TimeCurrent() > StringToTime(zon_st_43) ) )
   {
   lin_bo_33 = false;
  }}
 else
  {
  if ( zon_bo_76 == true && TimeCurrent() > StringToTime(zon_st_43) && TimeCurrent() <  StringToTime(zon_st_42) )
   {
   lin_bo_33 = false;
   }
  else
   {
   lin_bo_33 = true;
  }}
 if (lin_bo_33 != false)  return;
 if (!(zon_bo_44))  return;
 if ( zon_bo_76 == false && TimeCurrent() > StringToTime(zon_st_43) )
  {
  lin_in_35 = 0;
  for (lin_in_36 = 0 ; lin_in_36 < OrdersTotal() ; lin_in_36=lin_in_36 + 1)
   {
   if ( OrderSelect(lin_in_36,SELECT_BY_POS,MODE_TRADES) == true && OrderMagicNumber() == Magic && OrderSymbol() == Symbol() )
    {
    lin_in_35 = OrderType();
    if ( ( OrderType() == 0 || lin_in_35 == 1 ) )
     {
     RefreshRates(); 
     lin_do_37 = 0.0;
     if ( OrderType() == 0 )
      {
      lin_do_37 = Bid;
      }
     else
      {
      lin_do_37 = Ask;
      }
     zon_bo_84 = OrderClose(OrderTicket(),OrderLots(),lin_do_37,zon_in_60,0xFFFFFFFF) ;
    }}
   }
  lin_in_39 = 0;
  for (lin_in_40 = 0 ; lin_in_40 < OrdersTotal() ; lin_in_40=lin_in_40 + 1)
   {
   if ( OrderSelect(lin_in_40,SELECT_BY_POS,MODE_TRADES) == true && OrderMagicNumber() == Magic && OrderSymbol() == Symbol() )
    {
    lin_in_39 = OrderType();
    if ( OrderType() != 0 && lin_in_39  !=  1 && OrderDelete(OrderTicket(),0xFFFFFFFF) )
     {
     zon_in_83 = OrderTicket() ;
    }}
   }
  return;
  }
 if (zon_bo_76 != true)  return;
 if (TimeCurrent() <= StringToTime(zon_st_43))  return;
 if (TimeCurrent() >= StringToTime(zon_st_42))  return;
 lin_in_43 = 0;
 for (lin_in_44 = 0 ; lin_in_44 < OrdersTotal() ; lin_in_44=lin_in_44 + 1)
  {
  if ( OrderSelect(lin_in_44,SELECT_BY_POS,MODE_TRADES) == true && OrderMagicNumber() == Magic && OrderSymbol() == Symbol() )
   {
   lin_in_43 = OrderType();
   if ( ( OrderType() == 0 || lin_in_43 == 1 ) )
    {
    RefreshRates(); 
    lin_do_45 = 0.0;
    if ( OrderType() == 0 )
     {
     lin_do_45 = Bid;
     }
    else
     {
     lin_do_45 = Ask;
     }
    zon_bo_84 = OrderClose(OrderTicket(),OrderLots(),lin_do_45,zon_in_60,0xFFFFFFFF) ;
   }}
  }
 lin_in_47 = 0;
 for (lin_in_48 = 0 ; lin_in_48 < OrdersTotal() ; lin_in_48=lin_in_48 + 1)
  {
  if ( OrderSelect(lin_in_48,SELECT_BY_POS,MODE_TRADES) == true && OrderMagicNumber() == Magic && OrderSymbol() == Symbol() )
   {
   lin_in_47 = OrderType();
   if ( OrderType() != 0 && lin_in_47  !=  1 && OrderDelete(OrderTicket(),0xFFFFFFFF) )
    {
    zon_in_83 = OrderTicket() ;
   }}
  }
 }
//lizong_8
//---------------------  ----------------------------------------

 void lizong_9 (int mu_0,int magic)
 {
 double      zi_do_1;
 int         zi_in_2;
 double      zi_do_3;
 double      zi_do_4;
 double      zi_do_5;
 double      zi_do_6;
 double      zi_do_7;
 string      zi_st_8;
 double      zi_do_9;
 int         zi_in_10;
 int         zi_in_11;

//----------------------------
 int        lin_in_2;
 int        lin_in_1;
 bool       lin_bo_4;
 string     lin_st_6;
 int        lin_in_8;
 int        lin_in_7;
 string     lin_st_10;
 bool       lin_bo_11;
 int        lin_in_12;
 double     lin_do_14;
 int        lin_in_15;
 int        lin_in_16;
 int        lin_in_17;
 int        lin_in_18;
 int        lin_in_19;
 int        lin_in_20;
 int        lin_in_21;
 int        lin_in_22;
 int        lin_in_40;
 int        lin_in_41;
 bool       lin_bo_42;
 int        lin_in_43;
 int        lin_in_44;
 bool       lin_bo_46;
 int        lin_in_55;
 double     lin_do_63;
 double     lin_do_64;
 double     lin_do_66;
 double     lin_do_67;
 double     lin_do_69;
 double     lin_do_71;
 double     lin_do_72;
 double     lin_do_74;
 int        lin_in_75;
 double     lin_do_77;
 double     lin_do_78;
 double     lin_do_80;
 double     lin_do_81;
 double     lin_do_83;
 double     lin_do_85;
 double     lin_do_86;
 double     lin_do_88;
 int        lin_in_91;
 int        lin_in_92;
 int        lin_in_93;
 uint       lin_ui_94;
 int        lin_in_95;
 int        lin_in_96;
 uint       lin_ui_97;
 int        lin_in_99;
 int        lin_in_101;

 if (mu_0 == 0)  return;
 lin_in_2 = zon_in_72 - 10;
 if ( lin_in_2 <  0 )
  {
  lin_in_2 = 0;
  }
 lin_bo_4 = false;
 for (lin_in_1 = lin_in_2 ; lin_in_1 < HistoryTotal() ; lin_in_1=lin_in_1 + 1)
  {
  if ( OrderSelect(lin_in_1,SELECT_BY_POS,MODE_HISTORY) == true && OrderMagicNumber() == Magic && OrderSymbol() == Symbol() && ( OrderType() == 0 || OrderType() == 1 ) && OrderCloseTime() >= Time[0] )
   {
   lin_bo_4 = true;
   break;
   }
  }
 if (lin_bo_4)  return;
 lin_st_6 = TimeToString(TimeCurrent(),3);
 lin_in_8 = zon_in_72 - 10;
 if ( lin_in_8 <  0 )
  {
  lin_in_8 = 0;
  }
  lin_bo_11 = false; 
 lin_in_7 = lin_in_8;
 
 while (lin_in_7 < HistoryTotal())
  {
  if ( OrderSelect(lin_in_7,SELECT_BY_POS,MODE_HISTORY) == true && OrderMagicNumber() == Magic && OrderSymbol() == Symbol() )
   {
   lin_st_10 = TimeToString(OrderCloseTime(),3);
   if ( ( zon_in_83 == -1 || OrderTicket()  !=  zon_in_83 ) )
    {
    zon_in_72 = lin_in_7 ;
    if ( lin_st_10 == lin_st_6 )
     {
     lin_bo_11 = true;
     break;
   }}}
  lin_in_7=lin_in_7+1;//zon_in_72 + 1; 
  }
 if (lin_bo_11)  return;
 lin_in_12 = mu_0;
 if ( ( zon_in_18 == 0 || zon_do_8==0.0 ) )
  {
  if ( lin_in_12 == 1 )
   {
   lin_do_14 = zon_do_4;
   }
  else
   {
   lin_do_14 = zon_do_5;
  }}
 else
  {
  if ( lin_in_12 == 1 )
   {
   lin_do_14 = zon_do_8;
   }
  else
   {
   lin_do_14 = zon_do_9;
  }}
 zi_do_1 = NormalizeDouble(lin_do_14,Digits()) ;
 if ( mu_0 == 1 )
  { lin_in_16 = 0;
  for (lin_in_15 = 0 ; lin_in_15 < OrdersTotal() ; lin_in_15=lin_in_15 + 1)
   {
   if ( OrderSelect(lin_in_15,SELECT_BY_POS,MODE_TRADES) == true && OrderMagicNumber() == Magic && OrderSymbol() == Symbol() )
    {
    if ( OrderType() == 0 )
     {
     lin_in_16 = 1;
     break;
     }
    if ( OrderType() == 1 )
     {
     lin_in_16 = -1;
     break;
    }}
   }
 
  if (lin_in_16 != 0)  return;
  lin_in_17 = mu_0;
  if ( zon_in_18 == 0 )
   {
   if ( mu_0 == 1 )
    {
    lin_in_18 = 0;
    }
   else
    {
    lin_in_18 = 1;
   }}
  else
   {
   if ( lin_in_17 == 1 )
    {
    lin_in_18 = 4;
    }
   else
    {
    lin_in_18 = 5;
   }}
  zi_in_2 = lin_in_18 ;
  }
 else
  {  lin_in_20 = 0;
  for (lin_in_19 = 0 ; lin_in_19 < OrdersTotal() ; lin_in_19=lin_in_19 + 1)
   {
   if ( OrderSelect(lin_in_19,SELECT_BY_POS,MODE_TRADES) == true && OrderMagicNumber() == Magic && OrderSymbol() == Symbol() )
    {
    if ( OrderType() == 0 )
     {
     lin_in_20 = 1;
     break;
     }
    if ( OrderType() == 1 )
     {
     lin_in_20 = -1;
     break;
    }}
   }

  if (lin_in_20 != 0)  return;
  lin_in_21 = mu_0;
  if ( zon_in_18 == 0 )
   {
   if ( mu_0 == 1 )
    {
    lin_in_22 = 0;
    }
   else
    {
    lin_in_22 = 1;
   }}
  else
   {
   if ( lin_in_21 == 1 )
    {
    lin_in_22 = 4;
    }
   else
    {
    lin_in_22 = 5;
   }}
  zi_in_2 = lin_in_22 ;
  }
 if ( zi_in_2 != 0 && zi_in_2  !=  1 )
  {
  zi_do_3 = 0.0 ;
  if ( mu_0 == 1 )
   {
   zi_do_3 = Ask ;
   }
  else
   {
   zi_do_3 = Bid ;
   }
  if ( NormalizeDouble(MathAbs(zi_do_1 - zi_do_3),Digits())<=NormalizeDouble(zon_do_71,Digits()) )
   {
   Print(TimeToString(TimeCurrent(),5)," ","stop/limit order is too close to actual price","","","","","","","","","","",""); 
   return;
   }
  if ( zi_in_2 == 4 )
   {
   if ( zi_do_3>=zi_do_1 )
    {
    return;
   }}
  else
   {
   if ( zi_in_2 == 5 )
    {
    if ( zi_do_3<=zi_do_1 )
     {
     return;
    }}
   else
    {
    if ( zi_in_2 == 2 )
     {
     if ( zi_do_3<=zi_do_1 )
      {
      return;
     }}
    else
     {    
     if (( zi_in_2 == 3 && zi_do_3>=zi_do_1 ))  return;
     lin_bo_42 = false;
     lin_in_40 = zi_in_2;
     for (lin_in_41 = 0 ; lin_in_41 < OrdersTotal() ; lin_in_41=lin_in_41 + 1)
      {
      if ( OrderSelect(lin_in_41,SELECT_BY_POS,MODE_TRADES) == true && OrderMagicNumber() == Magic && OrderSymbol() == Symbol() && OrderType() == lin_in_40 )
       {
       lin_bo_42 = true;
       break;
       }
      }
 
     if ( lin_bo_42 )
      {
      if (!(zon_bo_40))  return;
       lin_bo_46 = true;
      lin_in_43 = zi_in_2;
      for (lin_in_44 = 0 ; lin_in_44 < OrdersTotal() ; lin_in_44=lin_in_44 + 1)
       {
       if ( OrderSelect(lin_in_44,SELECT_BY_POS,MODE_TRADES) == true && OrderMagicNumber() == Magic && OrderSymbol() == Symbol() && OrderType() == lin_in_43 )
        {
        if ( OrderDelete(OrderTicket(),0xFFFFFFFF) == false )
         {
         lin_bo_46 = false;
         break;
         }
        zon_in_83 = OrderTicket() ;
        }
       }

      if ( !(lin_bo_46) )
       {
       Print(TimeToString(TimeCurrent(),5)," ","Cannot close existing previous pending order with ticket: ",string(OrderTicket()),", reason: ",string(GetLastError()),"","","","","","","",""); 
       return;
  }}}}}}
 zi_do_4 = 0.0 ;
 zi_do_5 = 0.0 ;
 lin_in_55 = mu_0;
 if ( zon_do_14==0.0 )
  {
  lin_do_63 = 0.0;
  }
 else
  {
  if ( lin_in_55 == 1 )
   {
   lin_do_64 = zon_do_14;
   if ( zon_do_20>0.0 )
    {
    lin_do_66 = zon_do_20 * zon_do_67;
    if ( zon_do_20 * zon_do_67 <= zon_do_14 )
     {
     lin_do_67 = zon_do_14;
     }
    else
     {
     lin_do_67 = lin_do_66;
     }
    lin_do_64 = lin_do_67;
    }
   if ( zon_do_21>0.0 )
    {
    lin_do_67 = zon_do_21 * zon_do_67;
    if ( zon_do_21 * zon_do_67 >= lin_do_64 )
     {
     lin_do_69 = lin_do_64;
     }
    else
     {
     lin_do_69 = lin_do_67;
     }
    lin_do_64 = lin_do_69;
    }
   lin_do_63 = lin_do_64;
   }
  else
   {
   lin_do_69 = zon_do_14;
   if ( zon_do_20>0.0 )
    {
    lin_do_71 = zon_do_20 * zon_do_67;
    if ( zon_do_20 * zon_do_67 <= zon_do_14 )
     {
     lin_do_72 = zon_do_14;
     }
    else
     {
     lin_do_72 = lin_do_71;
     }
    lin_do_69 = lin_do_72;
    }
   if ( zon_do_21>0.0 )
    {
    lin_do_72 = zon_do_21 * zon_do_67;
    if ( zon_do_21 * zon_do_67 >= lin_do_69 )
     {
     lin_do_74 = lin_do_69;
     }
    else
     {
     lin_do_74 = lin_do_72;
     }
    lin_do_69 = lin_do_74;
    }
   lin_do_63 = lin_do_69;
  }}
 zi_do_6 = NormalizeDouble(lin_do_63,Digits()) ;
 lin_in_75 = mu_0;
 if ( zon_do_15==0.0 )
  {
  lin_do_77 = 0.0;
  }
 else
  {
  if ( lin_in_75 == 1 )
   {
   lin_do_78 = zon_do_15;
   if ( zon_do_22>0.0 )
    {
    lin_do_80 = zon_do_22 * zon_do_67;
    if ( zon_do_22 * zon_do_67 <= zon_do_15 )
     {
     lin_do_81 = zon_do_15;
     }
    else
     {
     lin_do_81 = lin_do_80;
     }
    lin_do_78 = lin_do_81;
    }
   if ( zon_do_23>0.0 )
    {
    lin_do_81 = zon_do_23 * zon_do_67;
    if ( zon_do_23 * zon_do_67 >= lin_do_78 )
     {
     lin_do_83 = lin_do_78;
     }
    else
     {
     lin_do_83 = lin_do_81;
     }
    lin_do_78 = lin_do_83;
    }
   lin_do_77 = lin_do_78;
   }
  else
   {
   lin_do_83 = zon_do_15;
   if ( zon_do_22>0.0 )
    {
    lin_do_85 = zon_do_22 * zon_do_67;
    if ( zon_do_22 * zon_do_67 <= zon_do_15 )
     {
     lin_do_86 = zon_do_15;
     }
    else
     {
     lin_do_86 = lin_do_85;
     }
    lin_do_83 = lin_do_86;
    }
   if ( zon_do_23>0.0 )
    {
    lin_do_86 = zon_do_23 * zon_do_67;
    if ( zon_do_23 * zon_do_67 >= lin_do_83 )
     {
     lin_do_88 = lin_do_83;
     }
    else
     {
     lin_do_88 = lin_do_86;
     }
    lin_do_83 = lin_do_88;
    }
   lin_do_77 = lin_do_83;
  }}
 zi_do_7 = NormalizeDouble(lin_do_77,Digits()) ;
 if ( zi_do_6!=0.0 )
  {
  zi_do_4 = zi_do_1 - mu_0 * zi_do_6 ;
  }
 if ( zi_do_7!=0.0 )
  {
  zi_do_5 = mu_0 * zi_do_7 + zi_do_1 ;
  }
 zi_st_8 = StringConcatenate(zon_st_61,"/",Symbol(),"/M" ,Period(),magic);
 zi_do_9 = lizong_13(zi_do_6 * zon_do_66) ;
 if ( zi_do_9>zon_do_35 )
  {
  zi_do_9 = zon_do_35 ;
  }
 zi_in_11 = 3 ;

 for ( ; ; ) 
  {
  zi_in_11 = zi_in_11 - 1;
  if ( zi_in_11 <  0 )
   {
   return;
   }
  lin_in_92 = 0;
  for (lin_in_91 = 0 ; lin_in_91 < OrdersTotal() ; lin_in_91=lin_in_91 + 1)
   {
   if ( OrderSelect(lin_in_91,SELECT_BY_POS,MODE_TRADES) == true && OrderMagicNumber() == Magic && OrderSymbol() == Symbol() )
    {
    if ( OrderType() == 0 )
     {
     lin_in_92 = 1;
     break;
     }
    if ( OrderType() == 1 )
     {
     lin_in_92 = -1;
     break;
    }}
   }

  if ( lin_in_92 != 0 )
   {
   return;
   }
  lin_in_93 = 30;
   lin_in_96 = 1;
  if ( !(IsTradeAllowed()) )
   {
  // lin_ui_94 = GetTickCount();
   lin_in_95 = GetTickCount();
   Print("Trade context is busy! Wait until it is free..."); 
   for ( ; ; ) 
    {
    if ( _StopFlag )
     {
     Print("The expert was terminated by the user!"); 
     lin_in_96 = -1;
     break;
     }
    lin_ui_97 = GetTickCount();
    if (  - lin_in_95 > lin_in_93 * 1000 )
     {
     Print("The waiting limit exceeded (" + string(lin_in_93) + " ???.)!"); 
     lin_in_96 = -2;
     break;
     }
    if ( IsTradeAllowed() )
     {
     Print("Trade context has become free!"); 
     RefreshRates(); 
     lin_in_96 = 1;
     break;
     }
    Sleep(100); 
    }
   }
 
  if ( lin_in_96 == 1 )
   {lin_in_101 = 0;
   for (lin_in_99 = 0 ; lin_in_99 < OrdersTotal() ; lin_in_99=lin_in_99 + 1)
    {
    if ( OrderSelect(lin_in_99,SELECT_BY_POS,MODE_TRADES) == true && OrderMagicNumber() == Magic && OrderSymbol() == Symbol() )
     {
     if ( OrderType() == 0 )
      {
      lin_in_101 = 1;
      break;
      }
     if ( OrderType() == 1 )
      {
      lin_in_101 = -1;
      break;
     }}
    }
   
   if ( lin_in_101 != 0 )
    {
    return;
    }
   zi_in_10 = lizong_10(zi_in_2,zi_do_9,zi_do_1,zi_do_4,zi_do_5,zi_st_8,Magic) ;
   if ( zi_in_10 > 0 )
    {
    if ( mu_0 > 0 )
     {
     ObjectSetText("lines","Last Signal: Long, ticket: " + string(zi_in_10),8,"Tahoma",zon_ui_82); 
     }
    else
     {
     ObjectSetText("lines","Last Signal: Short, ticket: " + string(zi_in_10),8,"Tahoma",zon_ui_82); 
     }
    return;
   }}
  if ( ( zi_in_10 == -130 || zi_in_10 == -131 ) )
   {
   return;
   }
  Sleep(1000); 
  }
  
 }
//lizong_9
//---------------------  ----------------------------------------

 int lizong_10 (int mu_0,double mu_1,double mu_2,double mu_3,double mu_4,string mu_5,int mu_6)
 {
 string      zi_st_1;
 int         zi_in_2;
 int         zi_in_3;
 bool        zi_bo_4;
 int         zi_in_5;

//----------------------------
 double     lin_do_1;
 string     lin_st_4;
 bool       lin_bo_3;
 double     lin_do_7;
 bool       lin_bo_8;
 int        lin_in_16;
 bool       lin_bo_14;
 string     lin_st_59;
 string     lin_st_89;
 string     lin_st_90;
 string     lin_st_91;
 string     lin_st_92;
 string     lin_st_93;
 string     lin_st_94;
 string     lin_st_95;
 string     lin_st_96;
 string     lin_st_97;
 string     lin_st_98;
 string     lin_st_99;
 string     lin_st_100;
 int        lin_in_60;
 uint       lin_ui_102;
 int        lin_in_103;
 int        lin_in_104;
 uint       lin_ui_105;
 string     lin_st_150;
 string     lin_st_151;
 string     lin_st_152;
 string     lin_st_153;
 string     lin_st_154;
 string     lin_st_155;
 string     lin_st_156;
 string     lin_st_157;
 string     lin_st_158;
 string     lin_st_159;
 string     lin_st_160;
 string     lin_st_161;
 long       lin_lo_121;

 lin_do_1 = mu_1;
 if ( AccountFreeMarginCheck(Symbol(),mu_0,mu_1)<0.0 )
  {
  if ( mu_0 == 0 )
   {
   lin_st_4 = "Buy";
   }
  else
   {
   lin_st_4 = "Sell";
   }
  Print("Not enough money for ",lin_st_4," ",lin_do_1," ",Symbol()," Error code=",GetLastError()); 
  lin_bo_3 = false;
  }
 else
  {
  lin_bo_3 = true;
  }
 if ( !(lin_bo_3) )
  {
  return(0); 
  }
 zi_st_1 = "" ;
 lin_do_7 = mu_1;
 if ( mu_1<SymbolInfoDouble(Symbol(),34) )
  {
  zi_st_1 = StringFormat("Volume is less than the minimal allowed SYMBOL_VOLUME_MIN=%.2f",SymbolInfoDouble(Symbol(),34)) ;
  lin_bo_8 = false;
  }
 else
  {
  if ( lin_do_7>SymbolInfoDouble(Symbol(),35) )
   {
   zi_st_1 = StringFormat("Volume is greater than the maximal allowed SYMBOL_VOLUME_MAX=%.2f",SymbolInfoDouble(Symbol(),35)) ;
   lin_bo_8 = false;
   }
  else
   {
   if ( MathAbs(MathRound(lin_do_7 / SymbolInfoDouble(Symbol(),36)) * SymbolInfoDouble(Symbol(),36) - lin_do_7)>1e-007 )
    {
    zi_st_1 = StringFormat("Volume(%.2f) is not a multiple of the minimal step SYMBOL_VOLUME_STEP=%.2f, the closest correct volume is %.2f",lin_do_7,SymbolInfoDouble(Symbol(),36),MathRound(lin_do_7 / SymbolInfoDouble(Symbol(),36)) * SymbolInfoDouble(Symbol(),36)) ;
    lin_bo_8 = false;
    }
   else
    {
    zi_st_1 = "Correct volume value" ;
    lin_bo_8 = true;
  }}}
 if ( !(lin_bo_8) )
  {
  Print(zi_st_1); 
  return(0); 
  }
 lin_in_16 = AccountInfoInteger(47);
 if ( lin_in_16 == 0 )
  {
  lin_bo_14 = true;
  }
 else
  {
  lin_bo_14 = OrdersTotal()<lin_in_16;
  }
 if ( !(lin_bo_14) )
  {
  Print("Orders more than limit"); 
  }
 if ( !(lizong_18(mu_0,mu_3,mu_4)) )
  {
  Print("The StopLoss or TakeProfit level is incorrect!"); 
  }
 Print(TimeToString(TimeCurrent(),5)," ","Opening order, direction: ",string(mu_0),", price: ",string(mu_2),", Ask: ",string(Ask),", Bid: ",string(Bid),"","","",""); 
 zi_in_3 = OrderSend(Symbol(),mu_0,mu_1,mu_2,zon_in_60,0.0,0.0,mu_5,mu_6,0,Green) ;
 if ( zi_in_3 <  0 )
  {
  zi_in_2 = GetLastError() ;
  Print(TimeToString(TimeCurrent(),5)," ","Error opening order: ",string(zi_in_2)," : ",lizong_17(zi_in_2),"","","","","","","",""); 
   return( -(zi_in_2));
  }
 zon_bo_84 = OrderSelect(zi_in_3,SELECT_BY_TICKET,MODE_TRADES) ;
 Print(TimeToString(TimeCurrent(),5)," ","Order opened: ",string(OrderTicket())," at price:",string(OrderOpenPrice()),"","","","","","","",""); 
 if ( zon_bo_63 )
  {
  lin_st_59 = StringConcatenate(StringConcatenate(TimeToString(TimeCurrent(),3)," New Order Opened\n\n")," Order ticket: ",OrderTicket(),"\n");
  switch(OrderType())
   {
   case 0 :
    lin_st_59 = StringConcatenate(lin_st_59," Direction : Buy\n");
       break;
   case 1 :
    lin_st_59 = StringConcatenate(lin_st_59," Direction : Sell\n");
       break;
   case 2 :
    lin_st_59 = StringConcatenate(lin_st_59," Direction : Buy Limit\n");
       break;
   case 3 :
    lin_st_59 = StringConcatenate(lin_st_59," Direction : Sell Limit\n");
       break;
   case 4 :
    lin_st_59 = StringConcatenate(lin_st_59," Direction : Buy Stop\n");
       break;
   case 5 :
    lin_st_59 = StringConcatenate(lin_st_59," Direction : Sell Stop\n");
   }
  lin_st_59 = StringConcatenate(StringConcatenate(lin_st_59," Open price: ",OrderOpenPrice(),"\n")," Lots: ",OrderLots(),"\n");
  SendMail("GB Strategy - Order opened",StringConcatenate(StringConcatenate(lin_st_59," Open price: ",OrderOpenPrice(),"\n")," Lots: ",OrderLots(),"\n")); 
  }
 if ( ( mu_3!=0.0 || mu_4!=0.0 ) )
  {
  zi_bo_4 = false ;
  Print(TimeToString(TimeCurrent(),5)," ","Setting SL/TP for order ",string(zi_in_3)," - SL: ",string(mu_3),", TP: ",string(mu_4),"","","","","",""); 
  if ( OrderModify(zi_in_3,OrderOpenPrice(),mu_3,mu_4,0,0) )
   {
   Print(TimeToString(TimeCurrent(),5)," ","Order ",string(zi_in_3)," modified, StopLoss: ",string(OrderStopLoss()),", Take Profit: ",string(OrderTakeProfit()),"","","","","",""); 
   }
  else
   {
   zi_in_2 = GetLastError() ;
   lin_st_89 = "";
   lin_st_90 = "";
   lin_st_91 = "";
   lin_st_92 = "";
   lin_st_93 = "";
   lin_st_94 = "";
   lin_st_95 = lizong_17(zi_in_2);
   lin_st_96 = " : ";
   lin_st_97 = string(zi_in_2);
   lin_st_98 = ": ";
   lin_st_99 = string(zi_in_3);
   lin_st_100 = "Error modifying order ";
   Print(TimeToString(TimeCurrent(),5)," ",lin_st_100,lin_st_99,lin_st_98,lin_st_97,lin_st_96,lin_st_95,lin_st_94,lin_st_93,lin_st_92,lin_st_91,lin_st_90,lin_st_89); 
   zi_bo_4 = true ;
   }
  if ( zi_bo_4 )
   {
   zi_in_5 = 3 ;
   for ( ; ; ) 
    {
    zi_in_5 = zi_in_5 - 1;
    if ( zi_in_5 < 0 )
     break;
    if ( OrderStopLoss()!=0.0 )
     break;
    if ( OrderTakeProfit()!=0.0 )
     break;
    lin_in_60 = 30;
     lin_in_104 = 1;
    if ( !(IsTradeAllowed()) )
     {
    // lin_ui_102 = GetTickCount();
     lin_in_103 = GetTickCount();
     Print("Trade context is busy! Wait until it is free..."); 
     for ( ; ; ) 
      {
      if ( _StopFlag )
       {
       Print("The expert was terminated by the user!"); 
       lin_in_104 = -1;
       break;
       }
      lin_ui_105 = GetTickCount();
      if (  - lin_in_103 > lin_in_60 * 1000 )
       {
       Print("The waiting limit exceeded (" + string(lin_in_60) + " ???.)!"); 
       lin_in_104 = -2;
       break;
       }
      if ( IsTradeAllowed() )
       {
       Print("Trade context has become free!"); 
       RefreshRates(); 
       lin_in_104 = 1;
       break;
       }
      Sleep(100); 
      }
     }
   
    if ( lin_in_104 == 1 )
     {
     if ( OrderModify(zi_in_3,OrderOpenPrice(),mu_3,mu_4,0,0) )
      {
      Print(TimeToString(TimeCurrent(),5)," ","SLTP Retry #",string(zi_in_5)," - Order ",string(zi_in_3)," modified, StopLoss: ",string(OrderStopLoss()),", Take Profit: ",string(OrderTakeProfit()),"","","",""); 
      break;
      }
     zi_in_2 = GetLastError() ;
     Print(TimeToString(TimeCurrent(),5)," ","SLTP Retry #",string(zi_in_5)," - Error modifying order ",string(zi_in_3),": ",string(zi_in_2)," : ",lizong_17(zi_in_2),"","","",""); 
     }
    Sleep(500); 
    }
   if ( ( ( mu_3!=0.0 && OrderStopLoss()==0.0 ) || (mu_4!=0.0 && OrderTakeProfit()==0.0) ) )
    {
    Print(TimeToString(TimeCurrent(),5)," ","Cannot set SL/TP, deleting order: ",string(zi_in_3),"","","","","","","","","",""); 
    if ( !(OrderDelete(zi_in_3,0xFFFFFFFF)) )
     {
     zi_in_2 = GetLastError() ;
     lin_st_150 = "";
     lin_st_151 = "";
     lin_st_152 = "";
     lin_st_153 = "";
     lin_st_154 = "";
     lin_st_155 = "";
     lin_st_156 = lizong_17(zi_in_2);
     lin_st_157 = " : ";
     lin_st_158 = string(zi_in_2);
     lin_st_159 = ": ";
     lin_st_160 = string(zi_in_3);
     lin_st_161 = "Error deleting order: ";
     lin_lo_121 = TimeCurrent();
     Print(TimeToString(lin_lo_121,5)," ",lin_st_161,lin_st_160,lin_st_159,lin_st_158,lin_st_157,lin_st_156,lin_st_155,lin_st_154,lin_st_153,lin_st_152,lin_st_151,lin_st_150); 
  }}}}
 return(zi_in_3); 
 }
//lizong_10
//---------------------  ----------------------------------------

 void lizong_11()
 {
 double      zi_do_1;
 double      zi_do_2;
 double      zi_do_3;
 double      zi_do_4;
 double      zi_do_5;
 double      zi_do_6;
 double      zi_do_7;
 double      zi_do_8;
 int         zi_in_9;
 int         zi_in_10;

//----------------------------
 double     lin_do_3;
 double     lin_do_4;
 double     lin_do_7;
 double     lin_do_8;
 double     lin_do_10;
 double     lin_do_12;
 double     lin_do_13;
 double     lin_do_15;
 bool       lin_bo_17;
 double     lin_do_23;
 bool       lin_bo_24;
 double     lin_do_31;
 double     lin_do_32;
 int        lin_in_34;
 double     lin_do_35;
 double     lin_do_37;
 double     lin_do_36;
 double     lin_do_39;
 double     lin_do_41;
 int        lin_in_42;
 double     lin_do_43;
 double     lin_do_45;
 double     lin_do_44;
 double     lin_do_47;
 double     lin_do_49;
 double     lin_do_50;
 bool       lin_bo_51;
 double     lin_do_57;
 bool       lin_bo_58;
 double     lin_do_65;
 double     lin_do_66;
 double     lin_do_68;
 double     lin_do_69;
 double     lin_do_71;
 double     lin_do_73;
 double     lin_do_74;
 double     lin_do_76;
 bool       lin_bo_78;
 double     lin_do_83;
 bool       lin_bo_84;

 zi_do_1 = 0.0 ;
 zi_do_2 = 0.0 ;
 zi_do_3 = 0.0 ;
 zi_do_4 = 0.0 ;
 zi_do_5 = 0.0 ;
 zi_do_6 = Close[1] ;
 zi_do_7 = 0.0 ;
 zi_do_8 = 0.0 ;
 for (zi_in_10=0 ; zi_in_10 < OrdersTotal() ; zi_in_10 = zi_in_10 + 1)
  {
  if ( OrderSelect(zi_in_10,SELECT_BY_POS,MODE_TRADES) == true && OrderMagicNumber() == Magic && OrderSymbol() == Symbol() )
   {
   zi_in_9 = OrderTicket() ;
   if ( ( OrderType() == 0 || OrderType() == 1 ) && OrderOpenTime() <  Time[0] )
    {
    if ( zon_do_12==0.0 )
     {
     lin_do_3 = 0.0;
     }
    else
     {
     if ( OrderType() == 0 )
      {
      lin_do_4 = zon_do_12;
      if ( zon_do_24>0.0 )
       {
       lin_do_7 = zon_do_24 * zon_do_67;
       if ( zon_do_24 * zon_do_67 <= zon_do_12 )
        {
        lin_do_8 = zon_do_12;
        }
       else
        {
        lin_do_8 = lin_do_7;
        }
       lin_do_4 = lin_do_8;
       }
      if ( zon_do_25>0.0 )
       {
       lin_do_8 = zon_do_25 * zon_do_67;
       if ( zon_do_25 * zon_do_67 >= lin_do_4 )
        {
        lin_do_10 = lin_do_4;
        }
       else
        {
        lin_do_10 = lin_do_8;
        }
       lin_do_4 = lin_do_10;
       }
      lin_do_3 = lin_do_4;
      }
     else
      {
      if ( OrderType() == 1 )
       {
       lin_do_10 = zon_do_13;
       if ( zon_do_24>0.0 )
        {
        lin_do_12 = zon_do_24 * zon_do_67;
        if ( zon_do_24 * zon_do_67 <= zon_do_13 )
         {
         lin_do_13 = zon_do_13;
         }
        else
         {
         lin_do_13 = lin_do_12;
         }
        lin_do_10 = lin_do_13;
        }
       if ( zon_do_25>0.0 )
        {
        lin_do_13 = zon_do_25 * zon_do_67;
        if ( zon_do_25 * zon_do_67 >= lin_do_10 )
         {
         lin_do_15 = lin_do_10;
         }
        else
         {
         lin_do_15 = lin_do_13;
         }
        lin_do_10 = lin_do_15;
        }
       lin_do_3 = lin_do_10;
       }
      else
       {
       lin_do_3 = 0.0;
     }}}
    zi_do_1 = lin_do_3 ;
    if ( zi_do_1>0.0 && OrderSelect(zi_in_9,SELECT_BY_TICKET,MODE_TRADES) == true )
     {
     if ( OrderType() == 0 )
      {
      zi_do_7 = zi_do_6 - zi_do_1 ;
      }
     else
      {
      zi_do_7 = zi_do_6 + zi_do_1 ;
      }
     zi_do_3 = OrderStopLoss() ;
     zi_do_4 = zi_do_3 ;
     zi_do_8 = zi_do_7 ;
     if ( OrderType() == 0 )
      {
      lin_do_15 = zi_do_7;
      if ( OrderType() == 0 )
       {
       if ( zi_do_7<Bid - zon_do_71 )
        {
        lin_bo_17 = true;
       }}
      else
       {
       if ( lin_do_15>Ask + zon_do_71 )
        {
        lin_bo_17 = true;
        }
       else
        {
        lin_bo_17 = false;
       }}
      if ( lin_bo_17 && ( zi_do_3==0.0 || zi_do_4<zi_do_8 ) && DoubleToString(zi_do_3,Digits())  !=  DoubleToString(zi_do_8,Digits()) )
       {
       zon_bo_84 = OrderModify(OrderTicket(),OrderOpenPrice(),zi_do_8,OrderTakeProfit(),0,0xFFFFFFFF) ;
      }}
     else
      {
      lin_do_23 = zi_do_7;
      if ( OrderType() == 0 )
       {
       if ( zi_do_7<Bid - zon_do_71 )
        {
        lin_bo_24 = true;
       }}
      else
       {
       if ( lin_do_23>Ask + zon_do_71 )
        {
        lin_bo_24 = true;
        }
       else
        {
        lin_bo_24 = false;
       }}
      if ( lin_bo_24 && ( zi_do_3==0.0 || zi_do_4>zi_do_8 ) && DoubleToString(zi_do_3,Digits())  !=  DoubleToString(zi_do_8,Digits()) )
       {
       zon_bo_84 = OrderModify(OrderTicket(),OrderOpenPrice(),zi_do_8,OrderTakeProfit(),0,0xFFFFFFFF) ;
     }}}
     
     
    if ( zon_do_10==0.0 )
     {
     lin_do_31 = 0.0;
     }
    else
     {
     lin_do_32 = 0.0;
     if ( OrderType() == 0 )
      {
      lin_do_32 = zon_do_10;
      }
     else
      {
      if ( OrderType() == 1 )
       {
       lin_do_32 = zon_do_11;
      }}
     lin_do_31 = lin_do_32;
     }
    zi_do_1 = lin_do_31 ;
    if ( zi_do_1>0.0 && OrderSelect(zi_in_9,SELECT_BY_TICKET,MODE_TRADES) == true )
     {
     if ( OrderType() == 0 )
      {
      lin_in_34 = 1;
      lin_do_35 = zi_do_1;
      lin_do_37 = Close[1] - lin_do_35;
      lin_do_36 = Close[1] - lin_do_35;
      if ( zon_do_26>0.0 )
       {
       lin_do_39 = zon_do_26 * zon_do_67;
       if ( zon_do_26 * zon_do_67 <= lin_do_37 )
        {
        lin_do_37 = lin_do_37;
        }
       else
        {
        lin_do_37 = lin_do_39;
        }
       lin_do_36 = lin_do_37;
       }
      if ( zon_do_27>0.0 )
       {
       lin_do_37 = zon_do_27 * zon_do_67;
       if ( zon_do_27 * zon_do_67 >= lin_do_36 )
        {
        lin_do_41 = lin_do_36;
        }
       else
        {
        lin_do_41 = lin_do_37;
        }
       lin_do_36 = lin_do_41;
       }
      if ( lin_in_34 > 0 )
       {
       lin_do_35 = Close[1] - lin_do_36;
       }
      else
       {
       lin_do_35 = Close[1] + lin_do_36;
       }
      zi_do_1 = lin_do_35 ;
      }
     else
      {
      lin_in_42 = -1;
      lin_do_43 = zi_do_1;
      lin_do_45 = Close[1] + zi_do_1;
      lin_do_44 = Close[1] + zi_do_1;
      if ( zon_do_26>0.0 )
       {
       lin_do_47 = zon_do_26 * zon_do_67;
       if ( zon_do_26 * zon_do_67 <= lin_do_45 )
        {
        lin_do_45 = lin_do_45;
        }
       else
        {
        lin_do_45 = lin_do_47;
        }
       lin_do_44 = lin_do_45;
       }
      if ( zon_do_27>0.0 )
       {
       lin_do_45 = zon_do_27 * zon_do_67;
       if ( zon_do_27 * zon_do_67 >= lin_do_44 )
        {
        lin_do_49 = lin_do_44;
        }
       else
        {
        lin_do_49 = lin_do_45;
        }
       lin_do_44 = lin_do_49;
       }
      if ( lin_in_42 > 0 )
       {
       lin_do_43 = Close[1] - lin_do_44;
       }
      else
       {
       lin_do_43 = Close[1] + lin_do_44;
       }
      zi_do_1 = lin_do_43 ;
      }
     zi_do_3 = OrderStopLoss() ;
     zi_do_4 = zi_do_3 ;
     zi_do_8 = zi_do_1 ;
     if ( OrderType() == 0 )
      {
      lin_do_50 = zi_do_1;
      if ( OrderType() == 0 )
       {
       if ( zi_do_1<Bid - zon_do_71 )
        {
        lin_bo_51 = true;
       }}
      else
       {
       if ( lin_do_50>Ask + zon_do_71 )
        {
        lin_bo_51 = true;
        }
       else
        {
        lin_bo_51 = false;
       }}
      if ( lin_bo_51 && ( zi_do_3==0.0 || zi_do_4<zi_do_8 ) && DoubleToString(zi_do_3,Digits())  !=  DoubleToString(zi_do_8,Digits()) )
       {
       zon_bo_84 = OrderModify(OrderTicket(),OrderOpenPrice(),zi_do_8,OrderTakeProfit(),0,0xFFFFFFFF) ;
      }}
     else
      {
      lin_do_57 = zi_do_1;
      if ( OrderType() == 0 )
       {
       if ( zi_do_1<Bid - zon_do_71 )
        {
        lin_bo_58 = true;
       }}
      else
       {
       if ( lin_do_57>Ask + zon_do_71 )
        {
        lin_bo_58 = true;
        }
       else
        {
        lin_bo_58 = false;
       }}
      if ( lin_bo_58 && ( zi_do_3==0.0 || zi_do_4>zi_do_8 ) && DoubleToString(zi_do_3,Digits())  !=  DoubleToString(zi_do_8,Digits()) )
       {
       zon_bo_84 = OrderModify(OrderTicket(),OrderOpenPrice(),zi_do_8,OrderTakeProfit(),0,0xFFFFFFFF) ;
     }}}
    if ( zon_do_16==0.0 )
     {
     lin_do_65 = 0.0;
     }
    else
     {
     if ( OrderType() == 0 )
      {
      lin_do_66 = zon_do_16;
      if ( zon_do_28>0.0 )
       {
       lin_do_68 = zon_do_28 * zon_do_67;
       if ( zon_do_28 * zon_do_67 <= zon_do_16 )
        {
        lin_do_69 = zon_do_16;
        }
       else
        {
        lin_do_69 = lin_do_68;
        }
       lin_do_66 = lin_do_69;
       }
      if ( zon_do_29>0.0 )
       {
       lin_do_69 = zon_do_29 * zon_do_67;
       if ( zon_do_29 * zon_do_67 >= lin_do_66 )
        {
        lin_do_71 = lin_do_66;
        }
       else
        {
        lin_do_71 = lin_do_69;
        }
       lin_do_66 = lin_do_71;
       }
      lin_do_65 = lin_do_66;
      }
     else
      {
      if ( OrderType() == 1 )
       {
       lin_do_71 = zon_do_17;
       if ( zon_do_28>0.0 )
        {
        lin_do_73 = zon_do_28 * zon_do_67;
        if ( zon_do_28 * zon_do_67 <= zon_do_17 )
         {
         lin_do_74 = zon_do_17;
         }
        else
         {
         lin_do_74 = lin_do_73;
         }
        lin_do_71 = lin_do_74;
        }
       if ( zon_do_29>0.0 )
        {
        lin_do_74 = zon_do_29 * zon_do_67;
        if ( zon_do_29 * zon_do_67 >= lin_do_71 )
         {
         lin_do_76 = lin_do_71;
         }
        else
         {
         lin_do_76 = lin_do_74;
         }
        lin_do_71 = lin_do_76;
        }
       lin_do_65 = lin_do_71;
       }
      else
       {
       lin_do_65 = 0.0;
     }}}
    zi_do_2 = lin_do_65 ;
    if ( zi_do_2>0.0 && OrderSelect(zi_in_9,SELECT_BY_TICKET,MODE_TRADES) == true )
     {
     zi_do_3 = OrderStopLoss() ;
     zi_do_4 = zi_do_3 ;
     zi_do_5 = OrderOpenPrice() ;
     zi_do_8 = zi_do_5 ;
     if ( OrderType() == 0 )
      {
      lin_do_76 = zi_do_5;
      if ( OrderType() == 0 )
       {
       if ( zi_do_5<Bid - zon_do_71 )
        {
        lin_bo_78 = true;
       }}
      else
       {
       if ( lin_do_76>Ask + zon_do_71 )
        {
        lin_bo_78 = true;
        }
       else
        {
        lin_bo_78 = false;
       }}
      if ( lin_bo_78 && zi_do_6 - zi_do_5>=zi_do_2 && ( zi_do_3==0.0 || zi_do_4<zi_do_8 ) && DoubleToString(zi_do_3,Digits())  !=  DoubleToString(zi_do_8,Digits()) )
       {
       zon_bo_84 = OrderModify(OrderTicket(),zi_do_5,zi_do_8,OrderTakeProfit(),0,0xFFFFFFFF) ;
      }}
     else
      {
      lin_do_83 = zi_do_5;
      if ( OrderType() == 0 )
       {
       if ( zi_do_5<Bid - zon_do_71 )
        {
        lin_bo_84 = true;
       }}
      else
       {
       if ( lin_do_83>Ask + zon_do_71 )
        {
        lin_bo_84 = true;
        }
       else
        {
        lin_bo_84 = false;
       }}
      if ( lin_bo_84 && zi_do_5 - zi_do_6>=zi_do_2 && ( zi_do_3==0.0 || zi_do_4>zi_do_8 ) && DoubleToString(zi_do_3,Digits())  !=  DoubleToString(zi_do_8,Digits()) )
       {
       zon_bo_84 = OrderModify(OrderTicket(),zi_do_5,zi_do_8,OrderTakeProfit(),0,0xFFFFFFFF) ;
   }}}}}
  }
 }
//lizong_11
//---------------------  ----------------------------------------

 void lizong_12()
 {
 int         zi_in_1;
 int         zi_in_2;
 int         zi_in_3;
 int         zi_in_4;
 int         zi_in_5;

//----------------------------
 string     lin_st_2;
 int        lin_in_3;
 int        lin_in_6;
 long       lin_lo_7;
 int        lin_in_8;
 int        lin_in_9;
 int        lin_in_12;
 long       lin_lo_13;
 int        lin_in_14;
 int        lin_in_15;

 lin_st_2 = TimeToString(TimeCurrent(),TIME_DATE);
 lin_in_3 = Period();
 if ( ( Period() == 240 || Period() == 60 ) )
  {
  lin_st_2 = lin_st_2 + string(TimeHour(TimeCurrent()));
  }
 if ( ( lin_in_3 == 30 || lin_in_3 == 15 || lin_in_3 == 5 || lin_in_3 == 1 ) )
  {
  lin_st_2 = lin_st_2 + " " + TimeToString(TimeCurrent(),TIME_MINUTES);
  }
 zon_st_74 = lin_st_2 ;
 if (zon_st_74 == zon_st_75)  return;
 for (zi_in_5=0 ; zi_in_5 < OrdersTotal() ; zi_in_5 = zi_in_5 + 1)
  {
  if ( OrderSelect(zi_in_5,SELECT_BY_POS,MODE_TRADES) == true && OrderMagicNumber() == Magic && OrderSymbol() == Symbol() )
   {
   zi_in_2 = OrderType() ;
   if ( zi_in_2 != 0 && zi_in_2  !=  1 )
    {
    if ( ( zi_in_2 == 2 || zi_in_2 == 4 ) )
     {
     zi_in_4 = zon_in_18 ;
     if ( zon_in_18 > 0 )
      {
      lin_in_6 = zon_in_18;
      lin_lo_7 = OrderOpenTime();
      lin_in_8 = 0;
      for (lin_in_9 = 0 ; lin_in_9 < lin_in_6 + 10 ; lin_in_9=lin_in_9 + 1)
       {
       if ( lin_lo_7 <  Time[lin_in_9] )
        {
        lin_in_8=lin_in_8 + 1; 
        }
       }
      zi_in_1 = lin_in_8 ;
      if ( zi_in_1 >= zi_in_4 && OrderDelete(OrderTicket(),0xFFFFFFFF) )
       {
       zon_in_83 = OrderTicket() ;
     }}}
    else
     {
     if ( ( zi_in_2 == 3 || zi_in_2 == 5 ) )
      {
      zi_in_4 = zon_in_18 ;
      if ( zon_in_18 > 0 )
       {
       lin_in_12 = zon_in_18;
       lin_lo_13 = OrderOpenTime();
       lin_in_14 = 0;
       for (lin_in_15 = 0 ; lin_in_15 < lin_in_12 + 10 ; lin_in_15=lin_in_15 + 1)
        {
        if ( lin_lo_13 <  Time[lin_in_15] )
         {
         lin_in_14=lin_in_14 + 1; 
         }
        }
       zi_in_1 = lin_in_14 ;
       if ( zi_in_1 >= zi_in_4 && OrderDelete(OrderTicket(),0xFFFFFFFF) )
        {
        zon_in_83 = OrderTicket() ;
   }}}}}}
  }
 zon_st_75 = zon_st_74 ;
 }
//lizong_12
//---------------------  ----------------------------------------

 double lizong_13 (double mu_0)
 {

//----------------------------
 double     lin_do_2;
 double     lin_do_18;
 double     lin_do_19;
 double     lin_do_35;

 if ( mu_0<=0.0 )
  {
  return(LotsFix); 
  }
 if ( zon_bo_32 == false )
  {
  if ( LotsFix>zon_do_35 )
   {
   return(zon_do_35); 
   }
  return(LotsFix); 
  }
 if ( zon_bo_36 )
  {
  lin_do_2 = mu_0;
  if ( zon_do_37<0.0 )
   {
   Print(TimeToString(TimeCurrent(),5)," ","Incorrect RiskInPercent size, it must be above 0","","","","","","","","","","",""); 
   lin_do_18 = 0.0;
   }
  else
   {
   lin_do_18 = lizong_14(zon_do_37,lin_do_2);
   }
  return(lin_do_18); 
  }
 lin_do_19 = mu_0;
 if ( RiskInPercent<0.0 )
  {
  Print(TimeToString(TimeCurrent(),5)," ","Incorrect RiskInPercent size, it must be above 0","","","","","","","","","","",""); 
  lin_do_35 = 0.0;
  }
 else
  {
  lin_do_35 = lizong_14(RiskInPercent / 100.0 * AccountBalance(),lin_do_19);
  }
 return(lin_do_35); 
 }
//lizong_13
//---------------------  ----------------------------------------

 double lizong_14 (double mu_0,double mu_1)
 {
 double      zi_do_1;
 double      zi_do_2;
 double      zi_do_3;
 double      zi_do_4;
 double      zi_do_5;
 double      zi_do_6;

//----------------------------

 if ( mu_1<=0.0 )
  {
  Print(TimeToString(TimeCurrent(),5)," ","Incorrect StopLossPips size, it must be above 0","","","","","","","","","","",""); 
  return(0.0); 
  }
 zi_do_1 = 1.0 ;
 if ( MarketInfo(Symbol(),17)!=0.0 )
  {
  zi_do_1 = MarketInfo(Symbol(),11) / MarketInfo(Symbol(),17) * MarketInfo(Symbol(),16) ;
  }
 zi_do_2 = NormalizeDouble(mu_0 / zi_do_1 / (mu_1 * 10.0),zon_in_33) ;
 zi_do_3 = 0.0 ;
 zi_do_4 = MarketInfo(Symbol(),24) ;
 if ( MathMod(0.0,zi_do_4 * 100.0)>0.0 )
  {
  zi_do_3 = zi_do_2 - MathMod(zi_do_2,zi_do_4) ;
  }
 else
  {
  zi_do_3 = zi_do_2 ;
  }
 zi_do_3 = NormalizeDouble(zi_do_3,zon_in_33) ;
 if ( MarketInfo(Symbol(),15)==10000.0 )
  {
  zi_do_3 = zi_do_3 * 10.0 ;
  }
 zi_do_3 = NormalizeDouble(zi_do_3,zon_in_33) ;
 Print(TimeToString(TimeCurrent(),5)," ","Computing lots, risk: ",string(mu_0),", lotMM: ",string(zi_do_2),", lotStep: ",string(zi_do_4),", lots: ",string(zi_do_3),"","","",""); 
 zi_do_5 = MarketInfo(Symbol(),23) ;
 zi_do_6 = MarketInfo(Symbol(),25) ;
 if ( zi_do_3<zi_do_5 )
  {
  zi_do_3 = zi_do_5 ;
  }
 if ( zi_do_3>zi_do_6 )
  {
  zi_do_3 = zi_do_6 ;
  }
 if ( zi_do_3>zon_do_35 )
  {
  zi_do_3 = zon_do_35 ;
  }
 Print(TimeToString(TimeCurrent(),5)," ","SL size: ",string(mu_1),", LotMM: ",string(zi_do_3),"","","","","","","",""); 
 return(zi_do_3); 
 }
//lizong_14
//---------------------  ----------------------------------------

 bool lizong_15 (long mu_0)
 {
 int         zi_in_1;

//----------------------------

 zi_in_1 = TimeDayOfWeek(mu_0) ;
 if ( !(zon_bo_52) && zi_in_1 == 0 )
  {
  return(false); 
  }
 if ( !(zon_bo_53) && zi_in_1 == 1 )
  {
  return(false); 
  }
 if ( !(zon_bo_54) && zi_in_1 == 2 )
  {
  return(false); 
  }
 if ( !(zon_bo_55) && zi_in_1 == 3 )
  {
  return(false); 
  }
 if ( !(zon_bo_56) && zi_in_1 == 4 )
  {
  return(false); 
  }
 if ( !(zon_bo_57) && zi_in_1 == 5 )
  {
  return(false); 
  }
 if ( !(zon_bo_58) && zi_in_1 == 6 )
  {
  return(false); 
  }
 return(true); 
 }
//lizong_15
//---------------------  ----------------------------------------

 void lizong_16()
 {

//----------------------------
 int        lin_in_1;
 double     lin_do_2;
 int        lin_in_3;
 int        lin_in_4;
 int        lin_in_5;
 string     lin_st_9;
 int        lin_in_10;
 double     lin_do_11;
 int        lin_in_12;
 int        lin_in_13;
 int        lin_in_14;
 int        lin_in_17;
 double     lin_do_18;
 int        lin_in_19;
 int        lin_in_20;
 double     lin_do_21;

 lin_in_1 = 500;
 lin_do_2 = 0.0;
 lin_in_3 = 0;
 lin_in_4 = 0;
 for (lin_in_5 = HistoryTotal() ; lin_in_5 >= 0 ; lin_in_5=lin_in_5 - 1)
  {
  if ( OrderSelect(lin_in_5,SELECT_BY_POS,MODE_HISTORY) == true && OrderSymbol() == Symbol() && OrderMagicNumber() == Magic )
   {
   lin_in_3=lin_in_3 + 1; 
   if ( OrderType() == 0 )
    {
    lin_do_2 = OrderClosePrice() - OrderOpenPrice();
    }
   else
    {
    lin_do_2 = OrderOpenPrice() - OrderClosePrice();
    }
   if ( lin_do_2>0.0 )
    {
    lin_in_4=lin_in_4 + 1; 
    }
   if ( lin_in_3 >= lin_in_1 )
    break;
   }
  }
 lin_st_9="Total profits/losses so far: " + string(lin_in_4) + "/"; 
 lin_in_10 = 500;
 lin_do_11 = 0.0;
 lin_in_12 = 0;
 lin_in_13 = 0;
 for (lin_in_14 = HistoryTotal() ; lin_in_14 >= 0 ; lin_in_14=lin_in_14 - 1)
  {
  if ( OrderSelect(lin_in_14,SELECT_BY_POS,MODE_HISTORY) == true && OrderSymbol() == Symbol() && OrderMagicNumber() == Magic )
   {
   lin_in_12=lin_in_12 + 1; 
   if ( OrderType() == 0 )
    {
    lin_do_11 = OrderClosePrice() - OrderOpenPrice();
    }
   else
    {
    lin_do_11 = OrderOpenPrice() - OrderClosePrice();
    }
   if ( lin_do_11<0.0 )
    {
    lin_in_13=lin_in_13 + 1; 
    }
   if ( lin_in_12 >= lin_in_10 )
    break;
   }
  }
 ObjectSetText("lineto",lin_st_9 + string(lin_in_13),8,"Tahoma",zon_ui_82); 
 lin_in_17 = 5000;
 lin_do_18 = 0.0;
 lin_in_19 = 0;
 for (lin_in_20 = HistoryTotal() ; lin_in_20 >= 0 ; lin_in_20=lin_in_20 - 1)
  {
  if ( OrderSelect(lin_in_20,SELECT_BY_POS,MODE_HISTORY) == true && OrderSymbol() == Symbol() && OrderMagicNumber() == Magic )
   {
   lin_in_19=lin_in_19 + 1; 
   lin_do_21 = OrderProfit();
   lin_do_18 = lin_do_21 + OrderCommission() + OrderSwap() + lin_do_18;
   if ( lin_in_19 >= lin_in_17 )
    break;
   }
  }
 ObjectSetText("linetp","Total P/L so far: " + DoubleToString(lin_do_18,2),8,"Tahoma",zon_ui_82); 
 }
//lizong_16
//---------------------  ----------------------------------------

 string lizong_17 (int mu_0)
 {
 string      zi_st_1;

//----------------------------

 switch(mu_0)
  {
  case 1 :
   zi_st_1 = "no error" ;
      break;
  case 2 :
   zi_st_1 = "common error" ;
      break;
  case 3 :
   zi_st_1 = "invalid trade parameters" ;
      break;
  case 4 :
   zi_st_1 = "trade server is busy" ;
      break;
  case 5 :
   zi_st_1 = "old version of the client terminal" ;
      break;
  case 6 :
   zi_st_1 = "no connection with trade server" ;
      break;
  case 7 :
   zi_st_1 = "not enough rights" ;
      break;
  case 8 :
   zi_st_1 = "too frequent requests" ;
      break;
  case 9 :
   zi_st_1 = "malfunctional trade operation (never returned error)" ;
      break;
  case 64 :
   zi_st_1 = "account disabled" ;
      break;
  case 65 :
   zi_st_1 = "invalid account" ;
      break;
  case 128 :
   zi_st_1 = "trade timeout" ;
      break;
  case 129 :
   zi_st_1 = "invalid price" ;
      break;
  case 130 :
   zi_st_1 = "invalid stops" ;
      break;
  case 131 :
   zi_st_1 = "invalid trade volume" ;
      break;
  case 132 :
   zi_st_1 = "market is closed" ;
      break;
  case 133 :
   zi_st_1 = "trade is disabled" ;
      break;
  case 134 :
   zi_st_1 = "not enough money" ;
      break;
  case 135 :
   zi_st_1 = "price changed" ;
      break;
  case 136 :
   zi_st_1 = "off quotes" ;
      break;
  case 137 :
   zi_st_1 = "broker is busy (never returned error)" ;
      break;
  case 138 :
   zi_st_1 = "requote" ;
      break;
  case 139 :
   zi_st_1 = "order is locked" ;
      break;
  case 140 :
   zi_st_1 = "long positions only allowed" ;
      break;
  case 141 :
   zi_st_1 = "too many requests" ;
      break;
  case 145 :
   zi_st_1 = "modification denied because order too close to market" ;
      break;
  case 146 :
   zi_st_1 = "trade context is busy" ;
      break;
  case 147 :
   zi_st_1 = "expirations are denied by broker" ;
      break;
  case 148 :
   zi_st_1 = "amount of open and pending orders has reached the limit" ;
      break;
  case 149 :
   zi_st_1 = "hedging is prohibited" ;
      break;
  case 150 :
   zi_st_1 = "prohibited by FIFO rules" ;
      break;
  case 4000 :
   zi_st_1 = "no error (never generated code)" ;
      break;
  case 4001 :
   zi_st_1 = "wrong function pointer" ;
      break;
  case 4002 :
   zi_st_1 = "array index is out of range" ;
      break;
  case 4003 :
   zi_st_1 = "no memory for function call stack" ;
      break;
  case 4004 :
   zi_st_1 = "recursive stack overflow" ;
      break;
  case 4005 :
   zi_st_1 = "not enough stack for parameter" ;
      break;
  case 4006 :
   zi_st_1 = "no memory for parameter string" ;
      break;
  case 4007 :
   zi_st_1 = "no memory for temp string" ;
      break;
  case 4008 :
   zi_st_1 = "not initialized string" ;
      break;
  case 4009 :
   zi_st_1 = "not initialized string in array" ;
      break;
  case 4010 :
   zi_st_1 = "no memory for array\' string" ;
      break;
  case 4011 :
   zi_st_1 = "too long string" ;
      break;
  case 4012 :
   zi_st_1 = "remainder from zero divide" ;
      break;
  case 4013 :
   zi_st_1 = "zero divide" ;
      break;
  case 4014 :
   zi_st_1 = "unknown command" ;
      break;
  case 4015 :
   zi_st_1 = "wrong jump (never generated error)" ;
      break;
  case 4016 :
   zi_st_1 = "not initialized array" ;
      break;
  case 4017 :
   zi_st_1 = "dll calls are not allowed" ;
      break;
  case 4018 :
   zi_st_1 = "cannot load library" ;
      break;
  case 4019 :
   zi_st_1 = "cannot call function" ;
      break;
  case 4020 :
   zi_st_1 = "expert function calls are not allowed" ;
      break;
  case 4021 :
   zi_st_1 = "not enough memory for temp string returned from function" ;
      break;
  case 4022 :
   zi_st_1 = "system is busy (never generated error)" ;
      break;
  case 4050 :
   zi_st_1 = "invalid function parameters count" ;
      break;
  case 4051 :
   zi_st_1 = "invalid function parameter value" ;
      break;
  case 4052 :
   zi_st_1 = "string function internal error" ;
      break;
  case 4053 :
   zi_st_1 = "some array error" ;
      break;
  case 4054 :
   zi_st_1 = "incorrect series array using" ;
      break;
  case 4055 :
   zi_st_1 = "custom indicator error" ;
      break;
  case 4056 :
   zi_st_1 = "arrays are incompatible" ;
      break;
  case 4057 :
   zi_st_1 = "global variables processing error" ;
      break;
  case 4058 :
   zi_st_1 = "global variable not found" ;
      break;
  case 4059 :
   zi_st_1 = "function is not allowed in testing mode" ;
      break;
  case 4060 :
   zi_st_1 = "function is not confirmed" ;
      break;
  case 4061 :
   zi_st_1 = "send mail error" ;
      break;
  case 4062 :
   zi_st_1 = "string parameter expected" ;
      break;
  case 4063 :
   zi_st_1 = "integer parameter expected" ;
      break;
  case 4064 :
   zi_st_1 = "double parameter expected" ;
      break;
  case 4065 :
   zi_st_1 = "array as parameter expected" ;
      break;
  case 4066 :
   zi_st_1 = "requested history data in update state" ;
      break;
  case 4099 :
   zi_st_1 = "end of file" ;
      break;
  case 4100 :
   zi_st_1 = "some file error" ;
      break;
  case 4101 :
   zi_st_1 = "wrong file name" ;
      break;
  case 4102 :
   zi_st_1 = "too many opened files" ;
      break;
  case 4103 :
   zi_st_1 = "cannot open file" ;
      break;
  case 4104 :
   zi_st_1 = "incompatible access to a file" ;
      break;
  case 4105 :
   zi_st_1 = "no order selected" ;
      break;
  case 4106 :
   zi_st_1 = "unknown symbol" ;
      break;
  case 4107 :
   zi_st_1 = "invalid price parameter for trade function" ;
      break;
  case 4108 :
   zi_st_1 = "invalid ticket" ;
      break;
  case 4109 :
   zi_st_1 = "trade is not allowed in the expert properties" ;
      break;
  case 4110 :
   zi_st_1 = "longs are not allowed in the expert properties" ;
      break;
  case 4111 :
   zi_st_1 = "shorts are not allowed in the expert properties" ;
      break;
  case 4200 :
   zi_st_1 = "object is already exist" ;
      break;
  case 4201 :
   zi_st_1 = "unknown object property" ;
      break;
  case 4202 :
   zi_st_1 = "object is not exist" ;
      break;
  case 4203 :
   zi_st_1 = "unknown object type" ;
      break;
  case 4204 :
   zi_st_1 = "no object name" ;
      break;
  case 4205 :
   zi_st_1 = "object coordinates error" ;
      break;
  case 4206 :
   zi_st_1 = "no specified subwindow" ;
      break;
  default :
   zi_st_1 = "unknown error" ;
  }
 return(zi_st_1);
 }
//lizong_17
//---------------------  ----------------------------------------

 bool lizong_18 (int mu_0,double mu_1,double mu_2)
 {
 ENUM_ORDER_TYPE   zi_in_1;
 int         zi_in_2;
 bool        zi_bo_3;
 bool        zi_bo_4;

//----------------------------
 double     lin_do_3;
 string     lin_st_5;
 bool       lin_bo_1;
 string     lin_st_7;

 if ( mu_0 == 0 )
  {
  zi_in_1 = 0 ;
  }
 if ( mu_0 == 1 )
  {
  zi_in_1 = 1 ;
  }
 zi_in_2 = SymbolInfoInteger(Symbol(),31) ;
 if ( zi_in_2 != 0 )
  {
  PrintFormat("SYMBOL_TRADE_stopsLEVEL=%d: StopLoss and TakeProfit must not be nearer than %d points from the closing price",zi_in_2,zi_in_2); 
  }
 zi_bo_3 = false ;
 zi_bo_4 = false ;
 switch(zi_in_1)
  {
  case 0 :
   if ( mu_1==0.0 )
    {
    zi_bo_3 = true ;
    }
   else
    {
    zi_bo_3=Bid - mu_1>zi_in_2 * Point();
    }
   if ( !(zi_bo_3) )
    {
    lin_do_3 = Bid - zi_in_2 * Point();
    lin_st_5 = EnumToString(zi_in_1);
    PrintFormat("For order %s StopLoss=%.5f must be less than %.5f (Bid=%.5f - SYMBOL_TRADE_stopsLEVEL=%d points)",lin_st_5,mu_1,lin_do_3,Bid,zi_in_2); 
    }
   if ( mu_2==0.0 )
    {
    zi_bo_4 = true ;
    }
   else
    {
    zi_bo_4=mu_2 - Bid>zi_in_2 * Point();
    }
   if ( !(zi_bo_4) )
    {
    PrintFormat("For order %s TakeProfit=%.5f must be greater than %.5f (Bid=%.5f + SYMBOL_TRADE_stopsLEVEL=%d points)",EnumToString(zi_in_1),mu_2,zi_in_2 * Point() + Bid,Bid,zi_in_2); 
    }
   lin_bo_1 = zi_bo_3;
   return(zi_bo_4); 
  case 1 :
   if ( mu_1==0.0 )
    {
    zi_bo_3 = true ;
    }
   else
    {
    zi_bo_3=mu_1 - Ask>zi_in_2 * Point();
    }
   if ( !(zi_bo_3) )
    {
    lin_do_3 = zi_in_2 * Point() + Ask;
    lin_st_7 = EnumToString(zi_in_1);
    PrintFormat("For order %s StopLoss=%.5f must be greater than %.5f  (Ask=%.5f + SYMBOL_TRADE_stopsLEVEL=%d points)",lin_st_7,mu_1,lin_do_3,Ask,zi_in_2); 
    }
   if ( mu_2==0.0 )
    {
    zi_bo_4 = true ;
    }
   else
    {
    zi_bo_4=Ask - mu_2>zi_in_2 * Point();
    }
   if ( !(zi_bo_4) )
    {
    PrintFormat("For order %s TakeProfit=%.5f must be less than %.5f  (Ask=%.5f - SYMBOL_TRADE_stopsLEVEL=%d points)",EnumToString(zi_in_1),mu_2,Ask - zi_in_2 * Point(),Ask,zi_in_2); 
    }
   lin_bo_1 = zi_bo_4;
   return(zi_bo_3); 
  default :
   return(false); 
  }
 }
//lizong_18
//---------------------  ----------------------------------------

