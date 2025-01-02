//+------------------------------------------------------------------+
//|                                                        VTral.mq4 |
//|                      Copyright © 2006, MetaQuotes Software Corp. |
//|                                                                  |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2006, MetaQuotes Software Corp."
#property link      ""

extern double Init_line1 = 1.9620;
extern double Init_line2 = 1.9630;
extern double Init_line3 = 1.9640;
extern double Init_line4 = 1.9650;
extern int Step_line = 4;
extern double Lots = 0.01;
extern int ColUr=2;

int i, j;
int a[4][4];//1-buy, 2-sell, 3-buystop, 4-sellstop

double minlot;
datetime LastWork;

//+------------------------------------------------------------------+
//| expert initialization function                                   |
//+------------------------------------------------------------------+

//********************************************************************
//проверяем есть ли открытые позиции, 
//проставляет номера открытых позиций в массив а[4][4]
bool Pred()
{
   int NL; //который строк в массиве
   
   for (i=0; i<=4; i++)
      for (j=0; j<=4; j++)
         a[i][j]=-1;//всех в -1
         
   for (i=0; i<OrdersTotal(); i++) //перебираем все ордера 
   {
      if (OrderSelect(i,SELECT_BY_POS,MODE_TRADES)==false)//выбираем ордер, если не возможно
         break;
      if (OrderSymbol()==Symbol())//есть позы по этому символу
         if (OrderComment()=="a1")//наша ли метка?
            NL=0;
         else if (OrderComment()=="a2")//наша ли метка?
            NL=1;
         else if (OrderComment()=="a3")//наша ли метка?
            NL=2;
         else if (OrderComment()=="a4")//наша ли метка?
            NL=3;
         else
            continue;//Нет? тогда продолжаем поиск
            
         //есть наши ордера, разберемся с ними
            if (OrderType()==OP_BUY)//если позиция на buy
               a[NL][0]=OrderTicket();//запомним его номер           
            else if (OrderType()==OP_SELL)//если позиция на sell
               a[NL][1]=OrderTicket();//запомним его номер
            else if(OrderType()==OP_BUYSTOP)//если позиция отложенная buy
               a[NL][2]=OrderTicket();//запомним его номер
            else if (OrderType()==OP_SELLSTOP)//если позиция отложенная sell
               a[NL][3]=OrderTicket();//запомним его номер
 
   }//конец перебора 
}


//********************************************************************
//Пример:
//контрольный уровень 1.9420, текущая цена 1.9277 или 1.9537 находим ближ-й нижн. уровень
//а)|1.9420-1.9277|*10000/40=3.575
//    3.575-3=0.575;  0.575*40=23; 1.9277-0.0023=1.9255 ближайший верхний уровень
//б)|1.9420-1.9537|*10000/40=2.925
//    2.925-2=0.925;  0.925*40=37; 1.9537-0.0037=1.9500 ближайший нижний уровень
int init()
  {
   LastWork = -1;
  }
  
  
//********************************************************************
int deinit()
  {
   return(0);
  }

//********************************************************************
int start()
  {
  if (CurTime() - LastWork < 5) 
      return(0); // не чаще раз в 5 секунд
  LastWork = CurTime();
   
  Pred();//усе собрали
  Comment("a[1][1]=",a[0][0]," a[0][2]=",a[0][1]," a[1][3]=",a[0][2]," a[1][4]=",a[0][3],"\n",
          "a[2][1]=",a[1][0]," a[2][2]=",a[1][1]," a[2][3]=",a[1][2]," a[2][4]=",a[1][3],"\n",
          "a[3][1]=",a[2][0]," a[3][2]=",a[2][1]," a[3][3]=",a[2][2]," a[3][4]=",a[2][3],"\n",
          "a[4][1]=",a[3][0]," a[4][2]=",a[3][1]," a[4][3]=",a[3][2]," a[4][4]=",a[3][3],"\n");
  string coment;
  double Init_line,qw,qw1,uo,w, sl, op;
  
  for(i=0;i<ColUr;i++)//прогоним масив а[4][4]
  {
      //понадобитца дальше
         coment="";
         if (i==0) 
            {
             coment="a1";
             Init_line=Init_line1;
            }
         else if(i==1) 
            {
             coment="a2";
             Init_line=Init_line2;
            }
         else if(i==2) 
            {
             coment="a3";
             Init_line=Init_line3;
            }
         else if(i==3) 
            {
             coment="a4";
             Init_line=Init_line4;
            }
         
         //ищем ближайший уровень
         w=(MathAbs(Bid-Init_line)*1/Point)/Step_line;//коэф-т
         if (Bid>=Init_line)
            qw=Step_line*(w-MathFloor(w));//количество пунктов вниз до ближайшего уровня 
         else 
            qw=Step_line-Step_line*(w-MathFloor(w));//количество пунктов вниз до ближайшего уровня 
         qw1=Step_line-qw;//количество пунктов вверх до ближайшего уровня    
      
     // Comment("Line1 ",Init_line," w=",((Bid-Init_line)*1/Point)/Step_line," qw=",qw," NewLine",Bid-(qw)*Point);      
      if ((a[i][0]==-1)&&(a[i][1]==-1)&&(a[i][2]==-1)&&(a[i][3]==-1))//нету открытых
      {
         
          
         //выставляем ордера  
         if (qw+4>=15)// можно ставить отлож на sell
            OrderSend(Symbol(), OP_SELLSTOP, Lots, Bid-(qw)*Point,0,Bid-Point*(qw-2*Step_line),0,coment,0,0,CLR_NONE);
         else //ставим на следующий уровень вниз
            OrderSend(Symbol(), OP_SELLSTOP, Lots, Bid-Point*(qw+Step_line),0,Bid-Point*(qw+Step_line-2*Step_line),0,coment,0,0,CLR_NONE);
         
         if (qw1>=15)//можно ставить отлож на Buy
            OrderSend(Symbol(), OP_BUYSTOP, Lots, Ask+(qw1-4)*Point,0,Ask+Point*(qw1-4-2*Step_line),0,coment,0,0,CLR_NONE);
         else//cтавим на следующий уровень вверх
            OrderSend(Symbol(), OP_BUYSTOP, Lots, Ask+Point*(qw1-4+Step_line),0,Ask+Point*(qw1-4+Step_line-2*Step_line),0,coment,0,0,CLR_NONE);   
         
      }
      //!!!!!!!!!!!!!
      else if (a[i][0]!=-1)// стоит buy
      {//разберемся с открытым buy
         OrderSelect(a[i][0],SELECT_BY_TICKET, MODE_TRADES);//выбрали открытый сей час ордер
          uo=OrderOpenPrice();//цена его открытия - уровень
          op=uo;
         
         if (uo<(Ask-(qw-4)*Point))//уровень открытия ниже текущего нижнего
               //проверить SL открытого, если надо модифицировать
               if (OrderStopLoss()<(Ask-Point*(qw+4+2*Step_line)))//SL ниже чем 2 уровня вниз от тек. цены
                  OrderModify(a[i][0],NULL,Ask-Point*(qw+4+2*Step_line),NULL,NULL,CLR_NONE); 
         sl=OrderStopLoss();
         //разберемся с отложенным
         if (a[i][3]!=-1)// стоит sellstop
         { 
            OrderSelect(a[i][3],SELECT_BY_TICKET, MODE_TRADES);//спозицировали на отлож
            uo=OrderOpenPrice();//цена его открытия - уровень
            if(uo!=sl)//(Bid-Point*(qw+2*Step_line)))//уровень уровень открытия равен стоплосу BUY
               OrderModify(a[i][3],sl, sl+Point*(2*Step_line),NULL,NULL,CLR_NONE);
              // OrderModify(a[i][3],Bid-Point*(qw-2*Step_line), Bid+qw*Point,NULL,NULL,NULL);
         }
         
         else if (a[i][3]==-1)//открылся переворотник на buy, надо выставить sellstop
            OrderSend(Symbol(), OP_SELLSTOP, Lots, sl,0,sl+Point*(2*Step_line),NULL,coment,0,0,CLR_NONE);
          //     OrderSend(Symbol(), OP_SELLSTOP, Lots, Bid-(qw+2*Step_line)*Point,0,Bid-Point*(qw),NULL,coment,0,0,0);
      } 
      //!!!!!!!!!!!!!
      else if (a[i][1]!=-1)//стоит sell
      {
         OrderSelect(a[i][1],SELECT_BY_TICKET, MODE_TRADES);//выбрали открытый сей час ордер
         uo=OrderOpenPrice();//цена его открытия - уровень
         op=uo;
         
         if (uo>(Bid+(qw1)*Point))//уровень открытия выше текущего верхнего
             //проверить SL открытого, если надо модифицировать
            if (OrderStopLoss()>(Bid+Point*(qw1+2*Step_line)))//SL выше чем 2 уровня вверх от тек. цены
            OrderModify(a[i][1],NULL,Bid+Point*(qw1+2*Step_line),NULL,NULL,CLR_NONE);  
         sl=OrderStopLoss();  
         //разберемся с отложенным   
         if (a[i][2]!=-1)// стоит buystop
         {
            OrderSelect(a[i][2],SELECT_BY_TICKET, MODE_TRADES);//спозицировали на отлож
            uo=OrderOpenPrice();//цена его открытия - уровень
            if (uo!=sl)//уровень уровень открытия равен стоплосу SELL
               OrderModify(a[i][2],sl,sl-(2*Step_line)*Point,NULL,NULL,CLR_NONE);
           //    OrderModify(a[i][2],Ask+Point*(qw1-4+2*Step_line),  Ask+(qw1-4)*Point,NULL,NULL,NULL);
         }
         else if (a[i][2]==-1)//открылся переворотник на sell, надо выставить buystop
            OrderSend(Symbol(), OP_BUYSTOP, Lots, sl,0,sl-Point*(2*Step_line),NULL,coment,0,0,CLR_NONE);
          //OrderSend(Symbol(), OP_BUYSTOP, Lots, Ask+(qw1-4+2*Step_line)*Point,0,Ask+Point*(qw1-4),NULL,coment,0,0,0); 
      }  
  }
  
  
  
   return (0);
  }