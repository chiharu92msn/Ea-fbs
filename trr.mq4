extern string ฬๅ๒๊เ1="-= ฯเ๐เ์ๅ๒๐๛ PriceChannel_Stop_v6 =-";
extern int PriceChannel_ChannelPeriod=26;   //Price Channel Period
extern double PriceChannel_Risk=0.1;      //channel narrowing factor (0...0,5)  
extern string ฬๅ๒๊เ2="-= ฯเ๐เ์ๅ๒๐๛ ๑เ์๎ใ๎ ๊๑๏ๅ๐๒เ =-";
extern int ฮ๒๑๒๓๏_๎๒_๒๎๗๊่_๑๒๎๏เ=20;
extern int TP=200;

double PCSU,PCSD,PCst;
int cbar=0;
int start()
{ 
 RefreshRates();
/* PCSU=iCustom(Symbol(),PERIOD_M15,"PriceChannel_Stop_v6",PriceChannel_ChannelPeriod, PriceChannel_Risk, 1, 0, 0, 0, 1000, 0, 1);
 if (PCSU==0) PCSU=iCustom(Symbol(),PERIOD_M15,"PriceChannel_Stop_v6",PriceChannel_ChannelPeriod, PriceChannel_Risk, 1, 0, 0, 0, 1000, 2, 1);
 PCSD=iCustom(Symbol(),PERIOD_M15,"PriceChannel_Stop_v6",PriceChannel_ChannelPeriod, PriceChannel_Risk, 1, 0, 0, 0, 1000, 1, 1);
 if (PCSD==0) PCSD=iCustom(Symbol(),PERIOD_M15,"PriceChannel_Stop_v6",PriceChannel_ChannelPeriod, PriceChannel_Risk, 1, 0, 0, 0, 1000, 3, 1);
 Print(" อ่ๆํ=",PCSU," ยๅ๐๕ํ=",PCSD);*/
 if (Hour()==23 && Minute()>45){
  Print("inter");
  if (OrdersTotal()<1) OrderSend(Symbol(),OP_SELL,0.1,Bid,2,0,0,"-",0,0,Yellow);}
 if (Hour()==0) 
  {
   OrderSelect(0,SELECT_BY_POS,MODE_TRADES);
   OrderClose(OrderTicket(),OrderLots(),Ask,2,Orange);
  }
}