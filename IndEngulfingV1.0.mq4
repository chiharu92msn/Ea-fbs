//+-------------------------------------------------------------------------------------------------------------------------------------------------+
//| Разработчик: Минаев Андрей                                                                                                                      |
//| Индикатор:   Engulfing (IndEngulfingV1.0)                                                                                                       |
//| Почта:       minaev.work@mail.ru                                                                                                                |
//| Скайп:       live:minaev.work                                                                                                                   |
//+-------------------------------------------------------------------------------------------------------------------------------------------------+
#property copyright "Safe-Forex.ru"
#property link      "http://safe-forex.ru"
#property strict
#property indicator_chart_window
#property indicator_buffers 2

double upArrow[]; //стрелки вверх
double dnArrow[]; //стрелки вниз
double indent;    //отступ для рисования стрелки
//+-------------------------------------------------------------------------------------------------------------------------------------------------+
int OnInit(void)
{
   SetIndexBuffer(0,upArrow); SetIndexArrow(0,233); SetIndexStyle(0,DRAW_ARROW,EMPTY,1,clrGreen); SetIndexLabel(0,"Бычье поглощение");
   SetIndexBuffer(1,dnArrow); SetIndexArrow(1,234); SetIndexStyle(1,DRAW_ARROW,EMPTY,1,clrRed); SetIndexLabel(1,"Медвежье поглощение");
   
   indent=3*_Point; if(_Digits==3||_Digits==5) indent*=10*_Point;
   
   return INIT_SUCCEEDED;
}
//+-------------------------------------------------------------------------------------------------------------------------------------------------+
int OnCalculate(const int rates_total,const int prev_calculated,const datetime &time[],const double &open[],const double &high[],const double &low[],
                const double &close[],const long &tick_volume[],const long &volume[],const int &spread[])
{
   if(prev_calculated==0) //ищем паттерны в истории
      for(int i=Bars-1;i>1;i--) {
         if(open[i]>close[i]&&open[i-1]<close[i-1]&&close[i]>=open[i-1]&&open[i]<close[i-1]) upArrow[i-1]=low[i-1]-indent; //бычье поглощение
         if(open[i]<close[i]&&open[i-1]>close[i-1]&&close[i]<=open[i-1]&&open[i]>close[i-1]) dnArrow[i-1]=high[i-1]+indent; //медвежье поглощение
      }
   if(prev_calculated>0) { //ищем текущие паттерны
      if(open[2]>close[2]&&open[1]<close[1]&&close[2]>=open[1]&&open[2]<close[1]) upArrow[1]=low[1]-indent; //бычье поглощение
      if(open[2]<close[2]&&open[1]>close[1]&&close[2]<=open[1]&&open[2]>close[1]) dnArrow[1]=high[1]+indent; //медвежье поглощение
   }
   return rates_total;
}
//+-------------------------------------------------------------------------------------------------------------------------------------------------+