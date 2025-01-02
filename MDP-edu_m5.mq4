// ------------------------------------------------------------------
// Based on MillionDollarPips - (ANY PAIR + NO DLL) - ver 1.1.0 
// Debuger fix: Stack Overflow problem fixed, NDD-mode added
// Sept-2011 by Capella: Cleaned code from unused code, proper 
// variable names and sub-names
//
// Ver. 1.0 - 2011-09-24
// - Added Print lines for STOPLEVEL when errors (for debugging purposes)
// - Removed unused externals and variables
// - Moved dynamic TP/SL and trading signals constants to externals, 
//   as VolatilityLimit and Scalpfactor.
// - Forced TrailingStop
// ------------------------------------------------------------------

// Ver. 1.1 - 2011-09-24
// - Defaults are for 5m timeframe
// - Units in Pips
// - Support 4 Digits brokers(?)
// - Corrected error when broker has STOP_LEVEL=0
// - Added a Max Orders limit
// - Removed "strange" trading stragegy
// - Removed ScalpFactor
// - Fixed Lots and Lots caculated over Risk and StopLoss.


#property copyright "Copyright © 2011"
#property link      "http://www.metaquotes.net"
#property show_inputs

#include <stderror.mqh>
#include <stdlib.mqh>


//----------------------- External variables ----------------------------

extern string Configuration = "=== General settings ===";
extern int Magic = 0;  // MagicNumber
extern string OrderCmt = "";  // Terminal comments
extern bool NDD_Mode = FALSE;  
extern bool Show_Debug = FALSE;
extern bool Verbose = FALSE;
extern string ScalpingSettings = "=== Scalping settings in Pips ===";
extern double TakeProfit = 10.0; 
extern double StopLoss = 10.0;
extern double Distance = 5.0;
extern double Trailing_Resolution = 1;
extern double Trailing_Stoploss = 4;	// in Pips, 4 for safer
extern double VolatilityLimit = 25; 	// Default 35 Pips on 5 Minutes. Less than 250 makes less but safer trades, over 250 the opposite
extern string Money_Management = "=== Money Management ===";
extern int  Max_Orders=1;
extern double Risk = 0.0;
extern double FixedLots=0.1;  // If Risk is 0, we use this fixed lot number.


//--------------------------- Global variables ---------------------------

bool checkrisksettings = TRUE;
bool condition2 = FALSE;
bool trailingstop = TRUE;


int slippage = 3;
int globalerror = 0;
int lasttime = 0;
int tickcounter = 0;
int upto30counter = 0;
int array_tickcounts[30];
double array_bid[30];
double array_ask[30];
double array_spread[30];
double maxamount = 0.0;
double minmaxlot = 0.1;
double commission = 0.0;

//----------------------------------------------------------------------------
double         mypoint;
double         pipfactor;

//----------------------------------------------------------------------------
int init()
{
    // x digits broker

    pipfactor = MathPow(10,Digits%2);
    mypoint   = Point*pipfactor;

    VolatilityLimit = VolatilityLimit * mypoint;

    int stoplevel = MarketInfo(Symbol(), MODE_STOPLEVEL) / pipfactor;
    if (stoplevel==0) stoplevel=1;
    
    if (TakeProfit < stoplevel)
        TakeProfit = stoplevel;
    if (StopLoss < stoplevel)
        StopLoss = stoplevel;

    ArrayInitialize(array_spread, 0);
    globalerror = -1;
    
    slippage*=pipfactor; 
    
    start();

    return (0);
}

int start() 
{
    // The line below can be removed, since it doesn't make any sense!   
    //	sub_moveandfillarrays(array_bid, array_ask, array_tickcounts, one);
    sub_trade();
    return (0);
}

//===================== Subroutines starts here =========================================
// All subs have their names starting with sub_
// Exception are the standard routines init() and start()
//
// Notation:
// All parameters in subs have their names starting with par_
// All local variables in subs have thewir names starting with local_
//

void sub_trade () 
{
    string local_textstring; 

    bool local_wasordermodified;
    bool local_ordersenderror;
    bool local_isbidgreaterthanindy;

    int local_orderticket;
    int local_useless;
    int local_orderexpiretime;
    int local_lotstep;
    int local_bidpart;
    int local_askpart;
    int local_loopcount1;
    int local_loopcount2;
    int local_pricedirection;
    int count_orders;
    int local_counter2;

    double local_askplusdistance;
    double local_bidminusdistance;
    double local_a; 
    double local_trailingdistance;
    double local_trailingresolution;
    double local_d;
    double local_orderstoploss;
    double local_ordertakeprofit;
    double local_tpadjust;
    double local_stoplevel;
    double local_spread = Ask - Bid;
    double local_adjuststoplevel;
    double local_e;
    double local_avgspread;	
    double local_f;
    double local_g;
    double local_h;
    double local_i;

    if (lasttime < Time[0]) 
    {
        lasttime = Time[0];
        tickcounter = 0;
    } 
    else 
    tickcounter++;

    if (!condition2) 
    {
        for (local_loopcount2 = OrdersTotal() - 1; local_loopcount2 >= 0; local_loopcount2--) 
        {
            OrderSelect(local_loopcount2, SELECT_BY_POS, MODE_TRADES);
            if (OrderSymbol() == Symbol() && OrderCloseTime() != 0 && OrderClosePrice() != OrderOpenPrice() && OrderProfit() != 0.0 && OrderComment() != "partial close" && StringFind(OrderComment(), "[sl]from #") == -1 && StringFind(OrderComment(), "[tp]from #") == -1) {
                condition2 = TRUE;
                local_a = MathAbs(OrderProfit() / (OrderClosePrice() - OrderOpenPrice()));
                commission = (-OrderCommission()) / local_a;
                if (Show_Debug==true) Print("Commission_Rate : " + sub_dbl2strbrokerdigits(commission));
                break;
            }
        }
    }
    
    if (!condition2) 
    {
        for (local_loopcount2 = OrdersHistoryTotal() - 1; local_loopcount2 >= 0; local_loopcount2--) 
        {
            OrderSelect(local_loopcount2, SELECT_BY_POS, MODE_HISTORY);
            if (OrderSymbol() == Symbol() && OrderCloseTime() != 0 && OrderClosePrice() != OrderOpenPrice() && OrderProfit() != 0.0 && OrderComment() != "partial close" && StringFind(OrderComment(), "[sl]from #") == -1 && StringFind(OrderComment(), "[tp]from #") == -1) {
                condition2 = TRUE;
                local_a = MathAbs(OrderProfit() / (OrderClosePrice() - OrderOpenPrice()));
                commission = (-OrderCommission()) / local_a;
                if (Show_Debug==true) Print("Commission_Rate : " + sub_dbl2strbrokerdigits(commission));
                break;
            }
        }
    }  

    local_stoplevel  = (MarketInfo(Symbol(), MODE_STOPLEVEL) / pipfactor) * mypoint ;
    if (local_stoplevel==0) local_stoplevel=1*mypoint;

    local_trailingdistance = Trailing_Stoploss * mypoint; 
    local_adjuststoplevel = 0;
    local_trailingresolution = Trailing_Resolution * mypoint;

    // The trailing distance might be the key for this EA to work on a slower broker
    // We need to give a reasobale distance for the trade not being stopped out too early
    local_trailingdistance = MathMax(local_trailingdistance, local_stoplevel);
    local_trailingdistance = MathMax(local_trailingdistance, Distance * mypoint); 
    
    local_adjuststoplevel = MathMax(local_adjuststoplevel, local_stoplevel);  
    local_adjuststoplevel = MathMax(local_adjuststoplevel, Distance * mypoint);  
    
    // Calculate average spread
    ArrayCopy(array_spread, array_spread, 0, 1, 29);
    array_spread[29] = local_spread;
    if (upto30counter < 30) 
    upto30counter++;  
       
    local_e = 0;
    local_loopcount2 = 29;
    for (local_loopcount1 = 0; local_loopcount1 < upto30counter; local_loopcount1++) 
    {
        local_e += array_spread[local_loopcount2];
        local_loopcount2--;
    }
    local_avgspread = local_e / upto30counter;

    if (!condition2 && local_avgspread < 1.5 * mypoint) 
    commission = 1.5 * mypoint - local_avgspread;
    
    //=====================================================================================
    //  Entry Criteria.    
    //=====================================================================================
    double local_ihigh = iHigh(Symbol(), PERIOD_M5, 0);
    double local_ilow = iLow(Symbol(), PERIOD_M5, 0);
    double local_ihighilowdiff = local_ihigh - local_ilow;
    double local_ima3low = iMA(NULL, PERIOD_M5, 3, 0, MODE_LWMA, PRICE_LOW, 0);
    double local_ima3high = iMA(NULL, PERIOD_M5, 3, 0, MODE_LWMA, PRICE_HIGH, 0);
    double local_ima3diff = local_ima3low - local_ima3high;

    local_isbidgreaterthanindy = Bid >= local_ima3high + local_ima3diff / 2.0;

    local_f = sub_normalizebrokerdigits(Ask + commission);
    local_g = sub_normalizebrokerdigits(Bid - commission);
    local_h = local_avgspread + commission;

    if(local_ihighilowdiff > VolatilityLimit) 
    { 
        if (Bid < local_ima3high)   
        local_pricedirection = -1; 
        else if (Bid > local_ima3low) 
        local_pricedirection = 1;
    }  

    local_orderexpiretime = TimeCurrent() + 60.0 * MathMax(10 * PERIOD_M1, 60);
    if (MarketInfo(Symbol(), MODE_LOTSTEP) == 0.0) 
       local_lotstep = 5;
    else 
       local_lotstep = sub_logarithm(0.1, MarketInfo(Symbol(), MODE_LOTSTEP));

    minmaxlot=AutoLot(StopLoss);

    if (checkrisksettings) 
    {
        if (Risk < 0.00 || Risk > 100.0) 
        {
            Comment("ERROR -- Invalid Risk Value.");
            return;
        }

        if (AccountBalance() <= 0.0) 
        {
            Comment("ERROR -- Account Balance is " + DoubleToStr(MathRound(AccountBalance()), 0));
            return;
        }

    }

    // Run through already open orders and modify if necessary
    count_orders = 0;
    local_counter2 = 0;
    for (local_loopcount2 = 0; local_loopcount2 < OrdersTotal(); local_loopcount2++) 
    {
        OrderSelect(local_loopcount2, SELECT_BY_POS, MODE_TRADES);
        if (OrderMagicNumber() == Magic && OrderCloseTime() == 0) 
        {
            if (OrderSymbol() != Symbol()) 
            {
                local_counter2++;
                continue;
            }
            switch (OrderType()) 
            {
            case OP_BUY:
                while (trailingstop) 
                {
                    local_orderstoploss = OrderStopLoss();
                    local_ordertakeprofit = OrderTakeProfit();
                    if (!(local_ordertakeprofit < sub_normalizebrokerdigits(local_f + local_trailingdistance) && local_f + local_trailingdistance - local_ordertakeprofit > local_trailingresolution)) 
                    break;
                    local_orderstoploss = sub_normalizebrokerdigits(Bid - local_trailingdistance);
                    local_ordertakeprofit = sub_normalizebrokerdigits(local_f + local_trailingdistance);
                    local_wasordermodified = OrderModify(OrderTicket(), 0, local_orderstoploss, local_ordertakeprofit, local_orderexpiretime, Lime);   
                        break;
                }
                count_orders++;
                break;
            case OP_SELL:
                while (trailingstop)
                {
                    local_orderstoploss = OrderStopLoss();
                    local_ordertakeprofit = OrderTakeProfit();
                    if (!(local_ordertakeprofit > sub_normalizebrokerdigits(local_g - local_trailingdistance) && local_ordertakeprofit - local_g + local_trailingdistance > local_trailingresolution)) 
                    break;
                    local_orderstoploss = sub_normalizebrokerdigits(Ask + local_trailingdistance);
                    local_ordertakeprofit = sub_normalizebrokerdigits(local_g - local_trailingdistance);
                    local_wasordermodified = OrderModify(OrderTicket(), 0, local_orderstoploss, local_ordertakeprofit, local_orderexpiretime, Orange);
                        break;
                }
                count_orders++;
                break;
            case OP_BUYSTOP:  //Trailing the pending orders
                if (!local_isbidgreaterthanindy) 
                {
                    local_tpadjust = OrderTakeProfit() - OrderOpenPrice() - commission;
                    while (true)
                    {
                        // same as:          if (Ask + local_adjuststoplevel) > OrderOpenPrice() && OrderOpenPrice() - Ask - local_adjuststoplevel < Trailing_Resolution * pipette)
                        if (!(sub_normalizebrokerdigits(Ask + local_adjuststoplevel) < OrderOpenPrice() && OrderOpenPrice() - Ask - local_adjuststoplevel > local_trailingresolution)) 
                        break;
                        local_wasordermodified = OrderModify(OrderTicket(), sub_normalizebrokerdigits(Ask + local_adjuststoplevel), sub_normalizebrokerdigits(Bid + local_adjuststoplevel - local_tpadjust), sub_normalizebrokerdigits(local_f + local_adjuststoplevel + local_tpadjust), 0, Lime);
                        break;
                    }
                    count_orders++;
                } 
                else OrderDelete(OrderTicket());
                break;
            case OP_SELLSTOP:
                if (local_isbidgreaterthanindy) 
                {
                    local_tpadjust = OrderOpenPrice() - OrderTakeProfit() - commission;
                    while (true) 
                    {
                        if (!(sub_normalizebrokerdigits(Bid - local_adjuststoplevel) > OrderOpenPrice() && Bid - local_adjuststoplevel - OrderOpenPrice() > local_trailingresolution)) 
                        break;
                        local_wasordermodified = OrderModify(OrderTicket(), sub_normalizebrokerdigits(Bid - local_adjuststoplevel), sub_normalizebrokerdigits(Ask - local_adjuststoplevel + local_tpadjust), sub_normalizebrokerdigits(local_g - local_adjuststoplevel - local_tpadjust), 0, Orange);
                        break;
                    }
                    count_orders++;
                } 
                else  OrderDelete(OrderTicket());
            }
        }
    }
    local_ordersenderror = FALSE;

    if (count_orders < Max_Orders && local_pricedirection != 0 && sub_normalizebrokerdigits(local_h) <= sub_normalizebrokerdigits(4 * mypoint) && globalerror == -1) 
    {

        if (local_pricedirection < 0 && minmaxlot >0) 
        {
            local_askplusdistance = Ask + Distance * mypoint;
            if (NDD_Mode)
            {
                local_orderticket = OrderSend(Symbol(), OP_BUYSTOP, minmaxlot, local_askplusdistance, slippage, 0, 0, OrderCmt, Magic, 0, Lime);             
                if (OrderSelect(local_orderticket, SELECT_BY_TICKET)) 
                OrderModify(OrderTicket(), OrderOpenPrice(), local_askplusdistance - StopLoss * mypoint, local_askplusdistance + TakeProfit * mypoint, local_orderexpiretime, Lime);
            } 
            else 
            local_orderticket = OrderSend(Symbol(), OP_BUYSTOP, minmaxlot, local_askplusdistance, slippage, local_askplusdistance - StopLoss * mypoint, local_askplusdistance + TakeProfit * mypoint, OrderCmt, Magic, local_orderexpiretime, Lime);
            if (local_orderticket < 0) 
            {
                local_ordersenderror = TRUE;
                if (Show_Debug==true) Print("ERROR BUYSTOP! Ask: ",sub_dbl2strbrokerdigits(Ask) + " Price: " + sub_dbl2strbrokerdigits(Ask + local_adjuststoplevel) + " SL:" + sub_dbl2strbrokerdigits(Bid + local_adjuststoplevel) + " TP:" + sub_dbl2strbrokerdigits(local_f + local_adjuststoplevel));
            } 
            else 
            {
                PlaySound("news.wav");
                if (Show_Debug==true) Print("BUYSTOP! Ask: ",sub_dbl2strbrokerdigits(Ask) + " Price: " + sub_dbl2strbrokerdigits(Ask + local_adjuststoplevel) + " SL:" + sub_dbl2strbrokerdigits(Bid + local_adjuststoplevel) + " TP:" + sub_dbl2strbrokerdigits(local_f + local_adjuststoplevel));
            }
            
        } 
        else 
        {
            if (local_pricedirection > 0 && minmaxlot >0) 
            {
                local_bidminusdistance = Bid - Distance * mypoint;
                if (NDD_Mode)
                {
                    local_orderticket = OrderSend(Symbol(), OP_SELLSTOP, minmaxlot, local_bidminusdistance, slippage, 0, 0, OrderCmt, Magic, 0, Orange);                
                    if (OrderSelect(local_orderticket, SELECT_BY_TICKET)) 
                    OrderModify(OrderTicket(), OrderOpenPrice(), local_bidminusdistance + StopLoss * mypoint, local_bidminusdistance - TakeProfit * mypoint, local_orderexpiretime, Orange);
                }
                else 
                local_orderticket = OrderSend(Symbol(), OP_SELLSTOP, minmaxlot, local_bidminusdistance, slippage, local_bidminusdistance + StopLoss * mypoint, local_bidminusdistance - TakeProfit * mypoint, OrderCmt, Magic, local_orderexpiretime, Orange);
                if (local_orderticket < 0) 
                {
                    local_ordersenderror = TRUE;
                    if (Show_Debug==true) Print("ERROR SELLSTOP : " + sub_dbl2strbrokerdigits(Bid - local_adjuststoplevel) + " SL:" + sub_dbl2strbrokerdigits(Ask - local_adjuststoplevel ) + " TP:" + sub_dbl2strbrokerdigits(local_g - local_adjuststoplevel));
                } 
                else 
                {
                    PlaySound("news.wav");
                    if (Show_Debug==true) Print("SELLSTOP : " + sub_dbl2strbrokerdigits(Bid - local_adjuststoplevel) + " SL:" + sub_dbl2strbrokerdigits(Ask - local_adjuststoplevel ) + " TP:" + sub_dbl2strbrokerdigits(local_g - local_adjuststoplevel));
                }
            }
        }
    }
    if (globalerror >= 0) 
    Comment("Robot is initializing...");
    else 
    {
        if (globalerror == -2) 
        Comment("ERROR -- Instrument " + Symbol() + " prices should have " + Digits + " fraction digits on broker account");
        else 
        {
            local_textstring = TimeToStr(TimeCurrent()) + " tick:" + sub_adjust00instring(tickcounter);
            if (Show_Debug || Verbose) 
            {
                local_textstring = local_textstring + "\n" + " digits:" + Digits + " " + globalerror + " stopLevel:" + sub_dbl2strbrokerdigits(local_stoplevel);
                local_textstring = local_textstring + "\n" + local_pricedirection + " " + sub_dbl2strbrokerdigits(local_ima3high) + " " + sub_dbl2strbrokerdigits(local_ima3low) + " " + sub_dbl2strbrokerdigits(0.4) + " exp:" + TimeToStr(local_orderexpiretime, TIME_MINUTES) + " numOrders:" + count_orders + " shouldRepeat:" + local_ordersenderror;
                local_textstring = local_textstring + "\ntrailingLimit:" + sub_dbl2strbrokerdigits(local_adjuststoplevel) + " trailingDist:" + sub_dbl2strbrokerdigits(local_trailingdistance) + " trailingResolution:" + sub_dbl2strbrokerdigits(local_trailingresolution);
            }
            local_textstring = local_textstring + "\nBid:" + sub_dbl2strbrokerdigits(Bid) + " Ask:" + sub_dbl2strbrokerdigits(Ask) + " avgSpread:" + sub_dbl2strbrokerdigits(local_avgspread) + "  Commission rate:" + sub_dbl2strbrokerdigits(commission) + "  Real avg. spread:" + sub_dbl2strbrokerdigits(local_h) + "  Lots:" + sub_dbl2strparb(minmaxlot, local_lotstep);
            if (sub_normalizebrokerdigits(local_h) > sub_normalizebrokerdigits(4 * mypoint)) 
            local_textstring = local_textstring + "\n" + "Robot is OFF :: Real avg. spread is too high for this scalping strategy ( " + sub_dbl2strbrokerdigits(local_h) + " > " + sub_dbl2strbrokerdigits(4 * mypoint) + " )";
            
            Comment(local_textstring);
            
            if (count_orders != 0 || local_pricedirection != 0 || Verbose) 
            
            if (Show_Debug==true) sub_printformattedstring(local_textstring);
        }
    }
}

string sub_dbl2strbrokerdigits(double par_a) 
{
    return (DoubleToStr(par_a, Digits));
}

string sub_dbl2strparb(double par_a, int par_b) 
{
    return (DoubleToStr(par_a, par_b));
}

double sub_normalizebrokerdigits(double par_a) 
{
    return (NormalizeDouble(par_a, Digits));
}

string sub_adjust00instring(int par_a) 
{
    if (par_a < 10) 
    return ("00" + par_a);
    if (par_a < 100) 
    return ("0" + par_a);
    return ("" + par_a);
}

double sub_logarithm(double par_a, double par_b) 
{
    return (MathLog(par_b) / MathLog(par_a));
}

void sub_printformattedstring (string par_a) 
{
    int local_a;
    int local_b = -1;

    if (IsTesting())  return;

    while (local_b < StringLen(par_a)) 
    {
        local_a = local_b + 1;
        local_b = StringFind(par_a, "\n", local_a);
        if (local_b == -1) 
        {
            Print(StringSubstr(par_a, local_a));
            return;
        }
        Print(StringSubstr(par_a, local_a, local_b - local_a));
    }
}

//######################################################################################################################################
double AutoLot(int StopLoss) {

    double MinLots  = MarketInfo(Symbol(), MODE_MINLOT);
    double MaxLots = MarketInfo(Symbol(), MODE_MAXLOT);
    double LotStep = MarketInfo(Symbol(), MODE_LOTSTEP);

    double LotsMM = FixedLots;


    if ( Risk > 0 ) {
        double riskDollars = AccountEquity() * Risk / 100;

        if (StopLoss>0) {
            LotsMM = riskDollars / StopLoss / (MarketInfo(Symbol(),MODE_TICKVALUE) * pipfactor);

        }
        else {
            LotsMM = riskDollars / (MarketInfo(Symbol(),MODE_LOTSIZE) / AccountLeverage());
        }

        LotsMM = NormalizeDouble(LotsMM/LotStep,0) * LotStep;

    }

    if (LotsMM < MinLots)
    LotsMM = MinLots;
    if (LotsMM > MaxLots)
    LotsMM = MaxLots;

    double MarginSize = MarketInfo (Symbol(), MODE_LOTSIZE) / AccountLeverage();
    if ( AccountFreeMargin() < LotsMM * MarginSize ) {
        if (Show_Debug==true) Print("Not enough money to open trade. Free Margin = ", AccountFreeMargin(),". Number of Lots to trade = ", LotsMM);
        return(-1);
    }

    return (LotsMM);
}