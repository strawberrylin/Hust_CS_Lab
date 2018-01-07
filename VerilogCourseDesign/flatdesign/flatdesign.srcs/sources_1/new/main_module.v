`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/09/28 09:34:42
// Design Name: 
// Module Name: main_module
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module main_module(
clk,power,open,close,in_require,out_uprequire,out_downrequire,Dataout,Segout,
powerled,upled,downled,openled,closeled,up_requireled,down_requireled,in_requireled
    );
    input clk,power,open,close;
    input [3:0] in_require,out_uprequire,out_downrequire;
    output reg openled,closeled,upled,downled;
    output powerled;
    output [2:0] up_requireled,down_requireled;
    output [3:0] in_requireled;
    output [7:0] Dataout,Segout;
    wire [3:0]showfloor,count10s,count5s;
    reg [3:0]nowfloor;
    reg [1:0] liftstate;
    reg [3:0] dcount10,dcount5;
    reg runstate;
    reg [3:0]in_lable;
    reg [2:0] out_uplable,out_downlable;
    
    reg [31:0] dcount;
    reg startcount,startchange;
    reg clo_lable;
    /*initial
        begin
            nowfloor<=1;
            runstate<=1;
            in_lable<=0;
            out_lable<=0;
            liftstate<=0;
        end*/
    
    //require_module,to set and update the require
    always@(posedge clk)
            begin
            //To judge the users' reauires and set the lable
                if(power)
                    begin
                    //1
                        if(out_uprequire[0])
                            out_uplable[0]<=1;
                        if(in_require[0])
                            in_lable[0]=1;
                   //3
                        if(out_uprequire[1])
                             out_uplable[1]<=1;
                        if(out_downrequire[0])
                             out_downlable[0]<=1;
                        if(in_require[1])
                             in_lable[1]=1;
                   //5
                        if(out_uprequire[2])
                             out_uplable[2]<=1;
                        if(out_downrequire[1])
                             out_downlable[1]<=1;
                        if(in_require[2])
                             in_lable[2]=1;
                   //8
                        if(out_downrequire[2])
                             out_downlable[2]<=1;
                        if(in_require[3])
                             in_lable[3]=1;
                        
                     //To cancle the lable of require
                     //1
                        if((nowfloor==1)&&(((out_uplable[0]==1)&&(runstate==1))||in_lable[0]))
                             begin
                                out_uplable[0]<=0;
                                in_lable[0]=0;
                             end
                     //3
                        if((nowfloor==3)&&(((out_uplable[1]==1)&&(runstate==1))||in_lable[1]))
                             begin
                                out_uplable[1]<=0;
                                in_lable[1]=0;
                             end
                        if((nowfloor==3)&&((out_downlable[0]==1)&&(runstate==0)))
                                out_downlable[0]<=0;
                            
                     //5
                        if((nowfloor==5)&&(((out_uplable[2]==1)&&(runstate==1))||in_lable[2]))
                             begin
                                out_uplable[2]<=0;
                                in_lable[2]=0;
                             end
                        if((nowfloor==5)&&((out_downlable[1]==1)&&(runstate==0)))
                                out_downlable[1]<=0;
                    //8
                         if((nowfloor==8)&&(((out_downlable[2]==1)&&(runstate==0))||in_lable[3]))
                             begin
                                out_downlable[2]<=0;
                                in_lable[3]=0;
                             end
                end
                else//power=0
                    begin
                        in_lable<=0;
                        out_uplable<=0;
                        out_downlable<=0;
                    end     
            end
            
    //change he liftstate zccording to the require
    always@(posedge clk)
        begin
            if(power)
            begin
                case(nowfloor)
                1:
                    begin
                        if( out_uplable[0]|| in_lable[0]||startcount)
                        begin
                            liftstate <= 3 ;    //若1楼内/外有请求或开门键被按下，变为开门状态，清楚请求
                         end
                        else if (out_uplable[1] || out_uplable[2] ||out_downlable[0]||out_downlable[1]||
                                            out_downlable[2]|| in_lable[1] || in_lable[2] || in_lable[3])
                            begin
                                liftstate <= 1 ;    //若3/5/8楼有请求，则变为上行状态
                            end
                        else
                            liftstate <= 0 ;
                    end
                3:
                    begin
                        if( (out_uplable[1]&&(runstate==1)) || (out_downlable[0]&&(runstate==0)) ||in_lable[1]||startcount)
                            begin
                            liftstate <= 3 ;    //3楼有请求或开门键被按下
                            
                            end
                        else if( (runstate==0)  && (out_uplable[0]==1 || in_lable[0]==1) )
                            begin
                                liftstate <= 2 ;    //运行向下且1楼有请求，则变下行状态
                            end
                        else if( (runstate==1) && (out_uplable[2] || out_downlable[1] ||out_downlable[2]|| 
                                                                                in_lable[2] || in_lable[3]))
                            begin
                                liftstate <= 1 ;   //运行向上且5/8楼有请求，则变上行状态
                            end
                        else if( (runstate==1)  && (out_uplable[0]==1 || in_lable[0]==1) )
                            begin
                                liftstate <= 2 ; //运行向上且1楼有请求，则变下行状态
                            end
                        else if( (runstate==0) && (out_uplable[2] ||out_downlable[1]|| out_downlable[2] || 
                                                                                in_lable[2] || in_lable[3]))
                            begin
                                liftstate <= 1 ;    //运行向下且5/8楼有请求，则变上行状态
                            end
                        else
                            liftstate <= 0 ;
                    end
                5:
                        begin
                            if( (out_uplable[2]&&(runstate==1)) || (out_downlable[1]&&(runstate==0))|| in_lable[2]||startcount )
                            begin
                                liftstate <= 3 ;
                            end
                            else if( (runstate==1)  && (out_downlable[2] || in_lable[3]) )
                                liftstate <= 1 ;
                            else if( (runstate==0) && (out_uplable[0] || out_uplable[1] || out_downlable[0]|| 
                                                                                    in_lable[0] || in_lable[1]))
                                liftstate <= 2 ;
                            else if( (runstate==0)  && (out_downlable[2]==1 || in_lable[3]==1) )
                                liftstate <= 1 ;
                            else if( (runstate==1) && (out_uplable[0] || out_uplable[1] || out_downlable[0]||
                                                                                    in_lable[0] || in_lable[1]))
                                liftstate <= 2 ;
                            else
                                liftstate <= 0 ;
                        end
                8:
                    begin
                            if( out_downlable[2] || in_lable[3] ||startcount )
                            begin
                                liftstate <= 3 ;
                            end
                            else if (out_uplable[0] || out_uplable[1] || out_uplable[2] ||out_downlable[0]||
                                                out_downlable[1]|| in_lable[0] || in_lable[1] || in_lable[2])
                                liftstate <= 2 ;
                            else
                                liftstate <= 0 ;
                    end
                default:
                        begin
                            if(runstate == 0)
                                liftstate <= 2 ;
                            else
                                liftstate <= 1 ;
                         end
              endcase
           end
              else
                begin
                   liftstate <= 0;     //无电源时闭门等待
                end
           end
    
    //To deal with the diffrent liftstate
   
    /*initial
        begin
            dcount<=0;
            startcount<=0;
            startchange<=0;
            clo_lable=0;
        end*/
    always@(posedge clk)
        begin
            if(power)
                begin
                    if(liftstate==2'b00)
                        begin
                           clo_lable=0;
                        end
                    else if(liftstate==2'b01)
                        begin
                            begin
                               dcount=dcount+1;
                               if(dcount<50000000)
                                  dcount10=9;
                               else if(dcount<100000000)            //worry write to the paple!!!
                                  dcount10=8;
                               else if(dcount<150000000)
                                  dcount10=7;
                               else if(dcount<200000000)
                                  dcount10=6;
                               else if(dcount<250000000)
                                  dcount10=5;
                               else if(dcount<300000000)
                                  dcount10=4;
                               else if(dcount<350000000)
                                  dcount10=3;
                               else if(dcount<400000000)
                                  dcount10=2;
                               else if(dcount<450000000)
                                  dcount10=1;
                               else if(dcount<500000000)
                                  dcount10=0;
                               else 
                                  begin
                                     startchange=1;
                                     dcount=0;
                                   end
                           end
                           if(startchange)
                                begin
                                    nowfloor=nowfloor+1;
                                    runstate=1;
                                    startchange<=0;
                                    clo_lable=0;
                                end
                        end
                    else if(liftstate==2'b10)
                        begin
                             begin
                                dcount=dcount+1;
                                if(dcount<50000000)
                                    dcount10=9;
                                else if(dcount<100000000)
                                     dcount10=8;
                                else if(dcount<150000000)
                                      dcount10=7;
                                else if(dcount<200000000)
                                      dcount10=6;
                                else if(dcount<250000000)
                                      dcount10=5;
                                else if(dcount<300000000)
                                      dcount10=4;
                                else if(dcount<350000000)
                                      dcount10=3;
                                else if(dcount<400000000)
                                      dcount10=2;
                                else if(dcount<450000000)
                                      dcount10=1;
                                else if(dcount<500000000)
                                      dcount10=0;
                                else 
                                    begin
                                        startchange=1;
                                        dcount=0;
                                    end      
                              end
                              if(startchange)
                              begin
                                 nowfloor=nowfloor-1;
                                 runstate=0;
                                 startchange=0;
                                 clo_lable=0;
                              end
                        end
                    else if(liftstate==2'b11)
                        begin
                            if(close)
                                clo_lable=1;
                            if(clo_lable)
                                begin
                                    dcount=0;
                                    dcount5=0;
                                    startcount=0;
                                end
                            else if(open)
                                begin
                                    dcount=0;
                                    dcount5=5;
                                    startcount=1;
                                    clo_lable=0;
                                end
                            else
                                begin
                                    clo_lable=0;
                                    startcount=1;
                                    clo_lable=0;
                                end
                       if(startcount)
                            begin
                                dcount=dcount+1;
                                if(dcount<50000000)         //yi qian zhineng xianshi 4 ge shu
                                    dcount5=4'd5;
                                else if(dcount<100000000)
                                    dcount5=4'd4;
                                else if(dcount<150000000)
                                    dcount5=4'd3;
                                else if(dcount<200000000)
                                    dcount5=4'd2;
                                else if(dcount<250000000)
                                    begin
                                        dcount5=4'd1;
                                     end
                                else 
                                    begin
                                        clo_lable=1;
                                     end
                            end
                    end 
                    if(nowfloor==8)
                        runstate=0;
                    if(nowfloor==1)
                        runstate=1;
                    if(nowfloor==3)
                        begin
                            if(runstate==1)
                                begin
                                    if(out_downlable[0]&&(out_uplable[1]==0)&&(out_uplable[2]==0)&&(out_downlable[1]==0)&&(out_downlable[2]==0))
                                        runstate=0;
                                end
                            else
                                begin
                                    if(out_uplable[1]&&(out_downlable[0]==0)&&(out_uplable[0]==0))
                                        runstate=1;
                                end
                        end
                   if(nowfloor==5)
                        begin
                            if(runstate==1)
                                begin
                                    if(out_downlable[1]&&(out_uplable[2]==0)&&(out_downlable[2]==0))
                                        runstate=0;
                                end
                             else
                                begin
                                    if(out_uplable[2]&&(out_downlable[1]==0)&&(out_uplable[1]==0)&&(out_downlable[0]==0)&&(out_uplable[0]==0))
                                        runstate=1;
                                end
                         end
              end
           else//power=0
              begin
                nowfloor<=1;
                runstate<=1;
                dcount<=0;
                startcount<=0;
                startchange<=0;
                clo_lable=0;
                dcount5=0;
                dcount10=0;
              end       
       end   
       //light to show the experiment
       assign up_requireled=out_uplable;
       assign down_requireled=out_downlable;
       assign in_requireled=in_lable;
       assign powerled=power;
       always@ (posedge clk)
           begin
               if(power)
                   begin
                       if(liftstate==0)
                            begin 
                                 upled <= 0;
                                 downled <= 0;
                                 openled <= 0;
                                 closeled <= 1; 
                           end
                        else if(liftstate==1)
                           begin
                                 upled <= 1;
                                 downled <= 0;
                                 openled <= 0;
                                 closeled <= 1;
                           end
                         else if(liftstate==2)
                           begin
                                 upled <= 0;
                                 downled <= 1;
                                 openled <= 0;
                                 closeled <= 1;
                           end
                          else if(liftstate==3)
                             begin
                                   upled <= 0;
                                   downled <= 0;
                                   openled <= 1;
                                   closeled <= 0;
                             end
                  end
              else
                   begin
                       upled <= 0;
                       downled <= 0;
                       openled <= 0;
                       closeled <= 0;
                   end    
           end 
     //seven segments todisplay
       assign showfloor=nowfloor;
       assign count5s=dcount5;
       assign count10s=dcount10;
       display_module DISPLAY (.power(power),.clk(clk),.data1(showfloor),.data2(4'b0),.data3(4'b0),.data4(count10s),
                                .data5(4'b0),.data6(4'b0),.data7(count5s),.data8(4'b0),
                                .data_choose(Dataout),.seg_choose(Segout));           
endmodule
