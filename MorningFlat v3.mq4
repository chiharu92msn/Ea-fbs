//+-------------------------------------------------------------------------------------+
//|                                                                  MorningFlat_V3.mq4 |
//|                                                                           Scriptong |
//|                                                                                     |
//+-------------------------------------------------------------------------------------+
#property copyright "Scriptong"
#property link      ""

// Во второй версии добавлено отображение ширины канала
// В третьей версии добавлена возможность указания минут

#property indicator_chart_window
#property indicator_buffers 4
#property indicator_color1 Turquoise
#property indicator_color2 Red
#property indicator_color3 Gold
#property indicator_color4 Silver

extern int StartHour = 0;
extern int StartMinute = 15;
extern int EndHour = 8;
extern int EndMinute = 45;
extern double TargetLevel = 161.8;
extern color UpColor = Turquoise;
extern color DnColor = Red;
extern color TargetUpColor = Gold;
extern color TargetDnColor = Silver;

//---- buffers
double Up[];
double Down[];
double TargetUp[];
double TargetDn[];
bool Activate = False;
datetime LastDay;
//+-------------------------------------------------------------------------------------+
//| Custom indicator initialization function                                            |
//+-------------------------------------------------------------------------------------+
int init()
  {
//---- indicators
   if(Period() > PERIOD_H1) 
     {
      Comment("Индикатор работает на таймфреймах меньше H4!");
      return(0);   
     }

   if(StartHour < 0 || EndHour < 0 || StartHour > 23 || EndHour > 23 || 
      StartHour > EndHour || (StartHour == EndHour && StartMinute >= EndMinute))
     {
      Comment("Значения StartHour и EndHour должны лежать в диапазоне от 0 до 24 и ",
              "StartHour < EndHour.");
      return(0);
     } 
    
   if(StartMinute < 0 || EndMinute < 0 || StartMinute > 59 || EndMinute > 59)
     {
      Comment("Значения StartHour и EndHour должны лежать в диапазоне от 0 до 24 и ",
              "StartHour < EndHour.");
      return(0);
     } 

   SetIndexStyle(0,DRAW_LINE);
   SetIndexBuffer(0,Up);
   SetIndexStyle(1,DRAW_LINE);
   SetIndexBuffer(1,Down);
   SetIndexStyle(2,DRAW_LINE);
   SetIndexBuffer(2,TargetUp);
   SetIndexStyle(3,DRAW_LINE);
   SetIndexBuffer(3,TargetDn);
   SetIndexEmptyValue(0, 0.0);
   SetIndexEmptyValue(1, 0.0);
   SetIndexEmptyValue(2, 0.0);
   SetIndexEmptyValue(3, 0.0);
   
   Activate = True;
//----
   return(0);
  }
//+-------------------------------------------------------------------------------------+
//| Custom indicator deinitialization function                                          |
//+-------------------------------------------------------------------------------------+
int deinit()
  {
//----
   // Удаление  объектов-ценовых меток
   for (int i = ObjectsTotal()-1; i >= 0; i--)
     { 
      string Name = ObjectName(i);
      if (StringSubstr(Name, 0, 3) == "Lab")
        ObjectDelete(Name);
     }
   Comment("");
//----
   return(0);
  }

//+-------------------------------------------------------------------------------------+
//| Ценовая метка со значением уровня                                                   |
//+-------------------------------------------------------------------------------------+
void DrawLabel(datetime TimeL, double Price, bool Upper, color Col, int Code)
{
 if(Upper)
   string Name = "Lab"+DoubleToStr(TimeL, 0)+"U";
  else
   Name = "Lab"+DoubleToStr(TimeL, 0)+"D"; 

 if(ObjectCreate(Name, OBJ_ARROW, 0, TimeL, Price))
   {
    ObjectSet(Name, OBJPROP_ARROWCODE, Code);
    ObjectSet(Name, OBJPROP_COLOR, Col);
   } 
}
  
//+-------------------------------------------------------------------------------------+
//| Подпись ширины канала                                                               |
//+-------------------------------------------------------------------------------------+
void DrawText(datetime TimeL, double Price, string St, color Col)
{
 string Name = "LabWidth"+DoubleToStr(TimeL, 0);

 if (ObjectCreate(Name, OBJ_TEXT, 0, TimeL, Price))
   ObjectSetText(Name, St, 10, "Arial", Col);
}  
  
//+-------------------------------------------------------------------------------------+
//| Custom indicator iteration function                                                 |
//+-------------------------------------------------------------------------------------+
int start()
  {
//----
   if (!Activate) return(0);

   LastDay = 0;
   int counted_bars = IndicatorCounted();
   if (counted_bars>0) counted_bars--;
   int limit = Bars - counted_bars;
   for (int i=limit; i>=0; i--)
     if (TimeHour(Time[i]) > EndHour || 
         (TimeMinute(Time[i]) > EndMinute && TimeHour(Time[i]) == EndHour))
       {
         datetime BeginDay = iTime(Symbol(), PERIOD_D1,    // Расчет времени начала суток
                                  iBarShift(Symbol(), PERIOD_D1, Time[i]));   
         datetime NextDay = BeginDay+86400;      // Расчет времени начала следующих суток
         if (LastDay >= BeginDay)             // Если в этот день уже рисовали уровни, то
           continue;                                         //  продолжаем основной цикл
         // Бар, соответсвующий началу суток плюс смещение в часах и минутах
         int StartBar = iBarShift(Symbol(), 0, BeginDay+StartHour*3600+StartMinute*60);
         // Бар, соответствующий последнему бару "утреннего флэта"
         int FinishBar = iBarShift(Symbol(), 0, BeginDay+EndHour*3600+EndMinute*60)+1; 
         
         double LowV = Low[iLowest(Symbol(), 0, MODE_LOW, StartBar-FinishBar+1, // Нижняя
                          FinishBar)];                                  // граница канала
         double HighV = High[iHighest(Symbol(), 0, MODE_HIGH, StartBar-FinishBar+1,
                            FinishBar)];                        // Верхняя граница канала
         double TargetU = (HighV-LowV)*(TargetLevel-100)/100+HighV;       // Верхняя цель
         double TargetD = LowV-(HighV-LowV)*(TargetLevel-100)/100;         // Нижняя цель
         // Рисуется канал "утреннего флэта"
         for(int j = StartBar; j >= FinishBar; j--)
           {
            Up[j] = HighV;
            Down[j] = LowV;
           }
         // -----------------------
         
         // Ожидаемые цели при пробое флэта  
         for(j = FinishBar; Time[j] < NextDay && j >= 0; j--)
           {
            TargetUp[j] = TargetU;
            TargetDn[j] = TargetD;
           }
         // -------------------  
           
         datetime TB = Time[iBarShift(Symbol(), 0, BeginDay + StartHour*3600 + 
                                      StartMinute*60)];
         DrawLabel(TB, HighV, True, UpColor, 5);   // Рисуем верхнюю ценовую метку канала
         DrawLabel(TB, LowV, False, DnColor, 5);    // Рисуем нижнюю ценовую метку канала
         // Рисуем верхнюю ценовую метку цели
         DrawLabel(Time[FinishBar], TargetU, True, TargetUpColor, 5);   
         // Рисуем нижнюю ценовую метку цели
         DrawLabel(Time[FinishBar], TargetD, False, TargetDnColor, 5);   
         DrawText((Time[FinishBar] - TB)/2 + TB, HighV,      // Отображение ширины канала
                   DoubleToStr(MathRound((HighV-LowV)/Point), 0), Red);
         LastDay = BeginDay;      // Отмечаем, что в этот день уровни уже были нарисованы
       }

   WindowRedraw();
//----
   return(0);
  }
//+------------------------------------------------------------------+