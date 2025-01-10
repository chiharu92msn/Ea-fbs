//+------------------------------------------------------------------+
//|                                                  MorningFlat.mq4 |
//|                                                        Scriptong |
//|                                                                  |
//+------------------------------------------------------------------+
#property copyright "Scriptong"
#property link      ""

#property indicator_chart_window
#property indicator_buffers 4
#property indicator_color1 Turquoise
#property indicator_color2 Red
#property indicator_color3 Gold
#property indicator_color4 Silver

extern int StartHour = 0;
extern int EndHour = 8;
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
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int init()
  {
//---- indicators
   if(Period() > PERIOD_H1) 
     {
      Comment("��������� �������� �� ����������� ������ H4!");
      return(0);   
     }
   if(StartHour < 0 || EndHour < 0 || StartHour > 23 || EndHour > 23 || StartHour >= EndHour)
     {
      Comment("�������� StartHour � EndHour ������ ������ � ��������� �� 0 �� 24 � StartHour < EndHour.");
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
//+------------------------------------------------------------------+
//| Custom indicator deinitialization function                       |
//+------------------------------------------------------------------+
int deinit()
  {
//----
   // ��������  ��������-������� �����
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

//+------------------------------------------------------------------+
//| ������� ����� �� ��������� ������                                |
//+------------------------------------------------------------------+
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
  
  
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int start()
  {
//----
   if(!Activate) return(0);

   LastDay = 0;
   int counted_bars=IndicatorCounted();
   if(counted_bars>0) counted_bars--;
   int limit=Bars-counted_bars;
   for(int i=limit; i>=0; i--)
     if(TimeHour(Time[i]) >= EndHour)
       {
         datetime BeginDay = iTime(Symbol(), PERIOD_D1, iBarShift(Symbol(), PERIOD_D1, Time[i]));  // ������ ������� ������ �����
         datetime NextDay = BeginDay+86400;  // ������ ������� ������ ��������� �����
         if(LastDay >= BeginDay) continue; // ���� � ���� ���� ��� �������� ������, �� ���������� �������� ����
         int StartBar = iBarShift(Symbol(), 0, BeginDay+StartHour*3600);   // ���, �������������� ������ ����� ���� �������� � �����
         int FinishBar = iBarShift(Symbol(), 0, BeginDay+EndHour*3600)+1; // ���, ��������������� ���������� ���� "��������� �����"
         double LowV = Low[iLowest(Symbol(), 0, MODE_LOW, StartBar-FinishBar+1, FinishBar)];  // ������ �������
         double HighV = High[iHighest(Symbol(), 0, MODE_HIGH, StartBar-FinishBar+1, FinishBar)]; // ������� �������
         double TargetU = (HighV-LowV)*(TargetLevel-100)/100+HighV;
         double TargetD = LowV-(HighV-LowV)*(TargetLevel-100)/100;
         // ����� "��������� �����"
         for(int j = StartBar; j >= FinishBar; j--)
           {
            Up[j] = HighV;
            Down[j] = LowV;
           }
         // -----------------------
         // ��������� ���� ��� ������ �����  
         for(j = FinishBar; Time[j] < NextDay && j >= 0; j--)
           {
            TargetUp[j] = TargetU;
            TargetDn[j] = TargetD;
           }
         // -------------------  
           
         DrawLabel(Time[iBarShift(Symbol(), 0, BeginDay)], HighV, True, UpColor, 5);   // ������ ������� ������� ����� ������
         DrawLabel(Time[iBarShift(Symbol(), 0, BeginDay)], LowV, False, DnColor, 5);   // ������ ������ ������� ����� ������
         DrawLabel(Time[FinishBar], TargetU, True, TargetUpColor, 5);   // ������ ������� ������� ����� ����
         DrawLabel(Time[FinishBar], TargetD, False, TargetDnColor, 5);   // ������ ������ ������� ����� ����
         LastDay = BeginDay;  // ��������, ��� � ���� ���� ������ ��� ���� ����������
       }

   WindowRedraw();
//----
   return(0);
  }
//+------------------------------------------------------------------+