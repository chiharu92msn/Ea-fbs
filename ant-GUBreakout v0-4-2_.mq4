/*
   G e n e r a t e d  by ex4-to-mq4 decompiler FREEWARE 4.0.509.5
   Website: h T tp :// WwW. Met AqU o tE S .n ET
   E-mail :  Su p POrt@ M Et aQ UoTE s. ne T
*/

#property indicator_chart_window

extern string exp1 = "//----- 1.Change this number --------//";
extern int indi_number = 123;
extern string exp2 = "//----- 2. Time Setting -------------//";
extern int GMTshift = 1;
extern string Start = "23:00";
extern string End = "01:00";
extern string exp3 = "//----- 3. Display Setting ---------//";
extern int day_number = 2;
extern int offset = 10;
extern string exp4 = "//----- 4. Color & font Setting -----//";
extern color linecolor = Silver;
extern color textcolor = Silver;
extern color boxcolor1 = C'0x00,0x00,0x4F';
extern color boxcolor2 = MidnightBlue;
extern int fontsize = 8;
extern string exp5 = "//----- 5. Line Setting ------------//";
extern int line_end_hour = 21;
extern int line_style = 2;
extern string exp6 = "//----- 6. Others :) ---------------//";
extern bool show_label = TRUE;
extern bool show_extra_label = TRUE;

void init() {
   for (int count_0 = 0; count_0 < day_number; count_0++) {
      Buat_Obj("GUB2" + indi_number + count_0, boxcolor1);
      Buat_Garis("GUB0" + indi_number + count_0, linecolor);
      Buat_Garis("GUB1" + indi_number + count_0, linecolor);
      if (offset > 0) Buat_Obj("GUB3" + indi_number + count_0, boxcolor2);
   }
}

void deinit() {
   for (int count_0 = 0; count_0 < day_number; count_0++) {
      ObjectDelete("GUB2" + indi_number + count_0);
      ObjectDelete("GUB0" + indi_number + count_0);
      ObjectDelete("GUB1" + indi_number + count_0);
      if (offset > 0) ObjectDelete("GUB3" + indi_number + count_0);
      ObjectDelete("txt_" + indi_number + count_0 + "hi");
      ObjectDelete("txt_" + indi_number + count_0 + "lo");
      ObjectDelete("txt_" + indi_number + count_0 + "Range");
      ObjectDelete("txt_" + indi_number + count_0 + "lbl");
   }
   ObjectDelete("ext_lbl");
}

void Buat_Obj(string A_name_0, color A_color_8) {
   ObjectCreate(A_name_0, OBJ_RECTANGLE, 0, 0, 0, 0, 0);
   ObjectSet(A_name_0, OBJPROP_STYLE, STYLE_SOLID);
   ObjectSet(A_name_0, OBJPROP_COLOR, A_color_8);
   ObjectSet(A_name_0, OBJPROP_BACK, TRUE);
}

void Buat_Garis(string A_name_0, color A_color_8) {
   ObjectCreate(A_name_0, OBJ_TREND, 0, 0, 0, 0, 0);
   ObjectSet(A_name_0, OBJPROP_STYLE, line_style);
   ObjectSet(A_name_0, OBJPROP_COLOR, A_color_8);
   ObjectSet(A_name_0, OBJPROP_BACK, TRUE);
}

void Tulis_Label(string A_name_0, string A_text_8, double Ad_16, color A_color_24, int A_datetime_28) {
   if (ObjectFind(A_name_0) == 1) ObjectMove(A_name_0, 0, A_datetime_28, Ad_16);
   else ObjectCreate(A_name_0, OBJ_TEXT, 0, A_datetime_28, Ad_16);
   ObjectSetText(A_name_0, A_text_8, fontsize, "Arial", CLR_NONE);
   ObjectSet(A_name_0, OBJPROP_COLOR, A_color_24);
   ObjectSet(A_name_0, OBJPROP_PRICE1, Ad_16);
   ObjectSet(A_name_0, OBJPROP_TIME1, A_datetime_28);
}

void SetText(int Ai_0, string As_4, string As_12, string As_20) {
   int shift_44;
   int shift_48;
   double Ld_52;
   double Ld_60;
   double Ld_68;
   double Ld_76;
   int Li_28 = StrToTime(TimeToStr(Ai_0, TIME_DATE) + " " + "00:00") + 3600 * GMTshift;
   int Li_32 = StrToTime(TimeToStr(Ai_0, TIME_DATE) + " " + As_12) + 3600 * GMTshift;
   int Li_36 = StrToTime(TimeToStr(Ai_0, TIME_DATE) + " " + As_20) + 3600 * GMTshift;
   int Li_40 = Li_28 + 3600 * line_end_hour;
   if (Li_36 < Li_32) {
      Li_36 = StrToTime(TimeToStr(Ai_0, TIME_DATE) + " " + As_20) + 3600 * (GMTshift + 24);
      Li_40 = Li_32 + 3600 * line_end_hour;
   }
   if (TimeDayOfWeek(Li_36) != 0) {
      if (TimeCurrent() >= Li_32) {
         if (TimeCurrent() < Li_36) Li_36 = Time[0];
         if (TimeCurrent() < Li_40) Li_40 = Time[0];
         shift_44 = iBarShift(NULL, 0, Li_32);
         shift_48 = iBarShift(NULL, 0, Li_36);
         Ld_52 = High[iHighest(NULL, 0, MODE_HIGH, shift_44 - shift_48 + 1, shift_48)];
         Ld_60 = Low[iLowest(NULL, 0, MODE_LOW, shift_44 - shift_48 + 1, shift_48)];
         Ld_68 = Ld_52 + offset * Point;
         Ld_76 = Ld_60 - offset * Point;
         if (show_label && TimeDayOfWeek(Li_36) < 6) {
            Tulis_Label(As_4 + "lbl", "[H]:" + DoubleToStr(Ld_52, Digits) + " [L]:" + DoubleToStr(Ld_60, Digits) + " [R]:" + DoubleToStr((Ld_52 - Ld_60) / Point, 0), Ld_68, textcolor,
               Li_32);
         }
      }
   }
}

void Gambar_Obj(int Ai_0, string A_name_4, string As_12, string As_20, int Ai_28) {
   int shift_48;
   int shift_52;
   double Ld_56;
   double Ld_64;
   double Ld_72;
   double Ld_80;
   int Li_32 = StrToTime(TimeToStr(Ai_0, TIME_DATE) + " " + "00:00") + 3600 * GMTshift;
   int Li_36 = StrToTime(TimeToStr(Ai_0, TIME_DATE) + " " + As_12) + 3600 * GMTshift;
   int Li_40 = StrToTime(TimeToStr(Ai_0, TIME_DATE) + " " + As_20) + 3600 * GMTshift;
   int datetime_44 = Li_32 + 3600 * line_end_hour;
   if (Li_40 < Li_36) {
      Li_40 = StrToTime(TimeToStr(Ai_0, TIME_DATE) + " " + As_20) + 3600 * (GMTshift + 24);
      datetime_44 = Li_36 + 3600 * line_end_hour;
   }
   if (TimeDayOfWeek(Li_40) != 0) {
      if (TimeCurrent() >= Li_36) {
         if (TimeCurrent() < Li_40) Li_40 = Time[0];
         if (TimeCurrent() < datetime_44) datetime_44 = Time[0];
         shift_48 = iBarShift(NULL, 0, Li_36);
         shift_52 = iBarShift(NULL, 0, Li_40);
         Ld_56 = High[iHighest(NULL, 0, MODE_HIGH, shift_48 - shift_52 + 1, shift_52)];
         Ld_64 = Low[iLowest(NULL, 0, MODE_LOW, shift_48 - shift_52 + 1, shift_52)];
         Ld_72 = Ld_56 + offset * Point;
         Ld_80 = Ld_64 - offset * Point;
         switch (Ai_28) {
         case 0:
            ObjectSet(A_name_4, OBJPROP_TIME1, Li_36);
            ObjectSet(A_name_4, OBJPROP_PRICE1, Ld_72);
            ObjectSet(A_name_4, OBJPROP_TIME2, datetime_44);
            ObjectSet(A_name_4, OBJPROP_PRICE2, Ld_72);
            break;
         case 1:
            ObjectSet(A_name_4, OBJPROP_TIME1, Li_36);
            ObjectSet(A_name_4, OBJPROP_PRICE1, Ld_80);
            ObjectSet(A_name_4, OBJPROP_TIME2, datetime_44);
            ObjectSet(A_name_4, OBJPROP_PRICE2, Ld_80);
            break;
         case 2:
            ObjectSet(A_name_4, OBJPROP_TIME1, Li_36);
            ObjectSet(A_name_4, OBJPROP_PRICE1, Ld_56);
            ObjectSet(A_name_4, OBJPROP_TIME2, Li_40);
            ObjectSet(A_name_4, OBJPROP_PRICE2, Ld_64);
            break;
         case 3:
            ObjectSet(A_name_4, OBJPROP_TIME1, Li_36);
            ObjectSet(A_name_4, OBJPROP_PRICE1, Ld_72);
            ObjectSet(A_name_4, OBJPROP_TIME2, Li_40);
            ObjectSet(A_name_4, OBJPROP_PRICE2, Ld_80);
         }
         ObjectSet(A_name_4, OBJPROP_RAY, FALSE);
      }
   }
}

int Hari_Trading(int Ai_0) {
   int Li_4 = TimeYear(Ai_0);
   int Li_8 = TimeMonth(Ai_0);
   int Li_12 = TimeDay(Ai_0);
   int hour_16 = TimeHour(Ai_0);
   int minute_20 = TimeMinute(Ai_0);
   Li_12--;
   if (Li_12 == 0) {
      Li_8--;
      if (Li_8 == 0) {
         Li_4--;
         Li_8 = 12;
      }
      if (Li_8 == 1 || Li_8 == 3 || Li_8 == 5 || Li_8 == 7 || Li_8 == 8 || Li_8 == 10 || Li_8 == 12) Li_12 = 31;
      if (Li_8 == 2) {
         if (MathMod(Li_4, 4) == 0.0) Li_12 = 29;
         else Li_12 = 28;
      }
      if (Li_8 == 4 || Li_8 == 6 || Li_8 == 9 || Li_8 == 11) Li_12 = 30;
   }
   return (StrToTime(Li_4 + "." + Li_8 + "." + Li_12 + " " + hour_16 + ":" + minute_20));
}

void Tulis(string A_name_0, double A_corner_8, int A_y_16, int A_x_20, string A_text_24, int A_fontsize_32, string A_fontname_36, color A_color_44) {
   ObjectCreate(A_name_0, OBJ_LABEL, 0, 0, 0);
   ObjectSetText(A_name_0, A_text_24, A_fontsize_32, A_fontname_36, A_color_44);
   ObjectSet(A_name_0, OBJPROP_CORNER, A_corner_8);
   ObjectSet(A_name_0, OBJPROP_XDISTANCE, A_x_20);
   ObjectSet(A_name_0, OBJPROP_YDISTANCE, A_y_16);
}

void start() {
   int datetime_0 = TimeCurrent();
   if (Period() < PERIOD_H4) {
      if (show_extra_label) Tulis("ext_lbl", 3, 5, 10, "ant-GUBreakout_V.0.4.2", 6, "Arial", SlateGray);
      for (int count_4 = 0; count_4 < day_number; count_4++) {
         Gambar_Obj(datetime_0, "GUB0" + indi_number + count_4, Start, End, 0);
         Gambar_Obj(datetime_0, "GUB1" + indi_number + count_4, Start, End, 1);
         Gambar_Obj(datetime_0, "GUB2" + indi_number + count_4, Start, End, 2);
         SetText(datetime_0, "txt_" + indi_number + count_4, Start, End);
         if (offset > 0) Gambar_Obj(datetime_0, "GUB3" + indi_number + count_4, Start, End, 3);
         datetime_0 = Hari_Trading(datetime_0);
         if (TimeDayOfWeek(datetime_0) > 5) datetime_0 = Hari_Trading(datetime_0);
      }
   }
}
