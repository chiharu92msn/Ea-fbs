//+------------------------------------------------------------------+
//|                                                        VTral.mq4 |
//|                      Copyright � 2006, MetaQuotes Software Corp. |
//|                                                                  |
//+------------------------------------------------------------------+
#property copyright "Copyright � 2006, MetaQuotes Software Corp."
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
//��������� ���� �� �������� �������, 
//����������� ������ �������� ������� � ������ �[4][4]
bool Pred()
{
   int NL; //������� ����� � �������
   
   for (i=0; i<=4; i++)
      for (j=0; j<=4; j++)
         a[i][j]=-1;//���� � -1
         
   for (i=0; i<OrdersTotal(); i++) //���������� ��� ������ 
   {
      if (OrderSelect(i,SELECT_BY_POS,MODE_TRADES)==false)//�������� �����, ���� �� ��������
         break;
      if (OrderSymbol()==Symbol())//���� ���� �� ����� �������
         if (OrderComment()=="a1")//���� �� �����?
            NL=0;
         else if (OrderComment()=="a2")//���� �� �����?
            NL=1;
         else if (OrderComment()=="a3")//���� �� �����?
            NL=2;
         else if (OrderComment()=="a4")//���� �� �����?
            NL=3;
         else
            continue;//���? ����� ���������� �����
            
         //���� ���� ������, ���������� � ����
            if (OrderType()==OP_BUY)//���� ������� �� buy
               a[NL][0]=OrderTicket();//�������� ��� �����           
            else if (OrderType()==OP_SELL)//���� ������� �� sell
               a[NL][1]=OrderTicket();//�������� ��� �����
            else if(OrderType()==OP_BUYSTOP)//���� ������� ���������� buy
               a[NL][2]=OrderTicket();//�������� ��� �����
            else if (OrderType()==OP_SELLSTOP)//���� ������� ���������� sell
               a[NL][3]=OrderTicket();//�������� ��� �����
 
   }//����� �������� 
}


//********************************************************************
//������:
//����������� ������� 1.9420, ������� ���� 1.9277 ��� 1.9537 ������� ����-� ����. �������
//�)|1.9420-1.9277|*10000/40=3.575
//    3.575-3=0.575;  0.575*40=23; 1.9277-0.0023=1.9255 ��������� ������� �������
//�)|1.9420-1.9537|*10000/40=2.925
//    2.925-2=0.925;  0.925*40=37; 1.9537-0.0037=1.9500 ��������� ������ �������
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
      return(0); // �� ���� ��� � 5 ������
  LastWork = CurTime();
   
  Pred();//��� �������
  Comment("a[1][1]=",a[0][0]," a[0][2]=",a[0][1]," a[1][3]=",a[0][2]," a[1][4]=",a[0][3],"\n",
          "a[2][1]=",a[1][0]," a[2][2]=",a[1][1]," a[2][3]=",a[1][2]," a[2][4]=",a[1][3],"\n",
          "a[3][1]=",a[2][0]," a[3][2]=",a[2][1]," a[3][3]=",a[2][2]," a[3][4]=",a[2][3],"\n",
          "a[4][1]=",a[3][0]," a[4][2]=",a[3][1]," a[4][3]=",a[3][2]," a[4][4]=",a[3][3],"\n");
  string coment;
  double Init_line,qw,qw1,uo,w, sl, op;
  
  for(i=0;i<ColUr;i++)//�������� ����� �[4][4]
  {
      //����������� ������
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
         
         //���� ��������� �������
         w=(MathAbs(Bid-Init_line)*1/Point)/Step_line;//����-�
         if (Bid>=Init_line)
            qw=Step_line*(w-MathFloor(w));//���������� ������� ���� �� ���������� ������ 
         else 
            qw=Step_line-Step_line*(w-MathFloor(w));//���������� ������� ���� �� ���������� ������ 
         qw1=Step_line-qw;//���������� ������� ����� �� ���������� ������    
      
     // Comment("Line1 ",Init_line," w=",((Bid-Init_line)*1/Point)/Step_line," qw=",qw," NewLine",Bid-(qw)*Point);      
      if ((a[i][0]==-1)&&(a[i][1]==-1)&&(a[i][2]==-1)&&(a[i][3]==-1))//���� ��������
      {
         
          
         //���������� ������  
         if (qw+4>=15)// ����� ������� ����� �� sell
            OrderSend(Symbol(), OP_SELLSTOP, Lots, Bid-(qw)*Point,0,Bid-Point*(qw-2*Step_line),0,coment,0,0,CLR_NONE);
         else //������ �� ��������� ������� ����
            OrderSend(Symbol(), OP_SELLSTOP, Lots, Bid-Point*(qw+Step_line),0,Bid-Point*(qw+Step_line-2*Step_line),0,coment,0,0,CLR_NONE);
         
         if (qw1>=15)//����� ������� ����� �� Buy
            OrderSend(Symbol(), OP_BUYSTOP, Lots, Ask+(qw1-4)*Point,0,Ask+Point*(qw1-4-2*Step_line),0,coment,0,0,CLR_NONE);
         else//c����� �� ��������� ������� �����
            OrderSend(Symbol(), OP_BUYSTOP, Lots, Ask+Point*(qw1-4+Step_line),0,Ask+Point*(qw1-4+Step_line-2*Step_line),0,coment,0,0,CLR_NONE);   
         
      }
      //!!!!!!!!!!!!!
      else if (a[i][0]!=-1)// ����� buy
      {//���������� � �������� buy
         OrderSelect(a[i][0],SELECT_BY_TICKET, MODE_TRADES);//������� �������� ��� ��� �����
          uo=OrderOpenPrice();//���� ��� �������� - �������
          op=uo;
         
         if (uo<(Ask-(qw-4)*Point))//������� �������� ���� �������� �������
               //��������� SL ���������, ���� ���� ��������������
               if (OrderStopLoss()<(Ask-Point*(qw+4+2*Step_line)))//SL ���� ��� 2 ������ ���� �� ���. ����
                  OrderModify(a[i][0],NULL,Ask-Point*(qw+4+2*Step_line),NULL,NULL,CLR_NONE); 
         sl=OrderStopLoss();
         //���������� � ����������
         if (a[i][3]!=-1)// ����� sellstop
         { 
            OrderSelect(a[i][3],SELECT_BY_TICKET, MODE_TRADES);//������������� �� �����
            uo=OrderOpenPrice();//���� ��� �������� - �������
            if(uo!=sl)//(Bid-Point*(qw+2*Step_line)))//������� ������� �������� ����� �������� BUY
               OrderModify(a[i][3],sl, sl+Point*(2*Step_line),NULL,NULL,CLR_NONE);
              // OrderModify(a[i][3],Bid-Point*(qw-2*Step_line), Bid+qw*Point,NULL,NULL,NULL);
         }
         
         else if (a[i][3]==-1)//�������� ������������ �� buy, ���� ��������� sellstop
            OrderSend(Symbol(), OP_SELLSTOP, Lots, sl,0,sl+Point*(2*Step_line),NULL,coment,0,0,CLR_NONE);
          //     OrderSend(Symbol(), OP_SELLSTOP, Lots, Bid-(qw+2*Step_line)*Point,0,Bid-Point*(qw),NULL,coment,0,0,0);
      } 
      //!!!!!!!!!!!!!
      else if (a[i][1]!=-1)//����� sell
      {
         OrderSelect(a[i][1],SELECT_BY_TICKET, MODE_TRADES);//������� �������� ��� ��� �����
         uo=OrderOpenPrice();//���� ��� �������� - �������
         op=uo;
         
         if (uo>(Bid+(qw1)*Point))//������� �������� ���� �������� ��������
             //��������� SL ���������, ���� ���� ��������������
            if (OrderStopLoss()>(Bid+Point*(qw1+2*Step_line)))//SL ���� ��� 2 ������ ����� �� ���. ����
            OrderModify(a[i][1],NULL,Bid+Point*(qw1+2*Step_line),NULL,NULL,CLR_NONE);  
         sl=OrderStopLoss();  
         //���������� � ����������   
         if (a[i][2]!=-1)// ����� buystop
         {
            OrderSelect(a[i][2],SELECT_BY_TICKET, MODE_TRADES);//������������� �� �����
            uo=OrderOpenPrice();//���� ��� �������� - �������
            if (uo!=sl)//������� ������� �������� ����� �������� SELL
               OrderModify(a[i][2],sl,sl-(2*Step_line)*Point,NULL,NULL,CLR_NONE);
           //    OrderModify(a[i][2],Ask+Point*(qw1-4+2*Step_line),  Ask+(qw1-4)*Point,NULL,NULL,NULL);
         }
         else if (a[i][2]==-1)//�������� ������������ �� sell, ���� ��������� buystop
            OrderSend(Symbol(), OP_BUYSTOP, Lots, sl,0,sl-Point*(2*Step_line),NULL,coment,0,0,CLR_NONE);
          //OrderSend(Symbol(), OP_BUYSTOP, Lots, Ask+(qw1-4+2*Step_line)*Point,0,Ask+Point*(qw1-4),NULL,coment,0,0,0); 
      }  
  }
  
  
  
   return (0);
  }