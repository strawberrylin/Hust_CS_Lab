`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/23 16:14:09
// Design Name: 
// Module Name: MIPS_CPU
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


module MIPS_CPU(
CLK,power,k0,k1,k2,k3,k4,k5,k6,k7,k8,k9,k10,k11,k12,k13,k14,Dout,Segout
    );
    input CLK,power;
    input k0,k1,k2,k3,k4,k5,k6,k7,k8,k9,k10,k11,k12,k13,k14;
    output [7:0] Dout,Segout;
    wire [31:0] data_led,data_led_15;
    wire clk,clk_in,SYS_B,break_down;
    wire stop,j_clear,l_clear;
    wire [31:0] rom_data;
    wire [31:0] pc_4,pc_in;
    
    wire [31:0]pc;
    //IFID
    wire i_type_id,lw_id,sw_id,beq_id,bne_id,jl_id,jr_id,blez_id,we_id,jal_id,lui_id,lbu_id,sys_b_id,slra_id;
    wire [3:0] alu_op_id;
    wire [4:0] reg_write_id,reg1_in_id,reg2_in_id;
    wire [31:0] pc_out_id,shamt_id,immediate_id,jump_addr_id;
    wire [31:0] instruction_id;
    //regfile
  
    wire [31:0] data_in;
    wire [31:0] reg_a0,reg_v0,reg1_out,reg2_out;
    //IDEX
    wire i_type_ex,lw_ex,sw_ex,beq_ex,bne_ex,jl_ex,jr_ex,blez_ex,we_ex,jal_ex,lui_ex,lbu_ex,sys_b_ex,slra_ex;
    wire [3:0] alu_op_ex;
    wire [4:0] reg_write_ex,rs_ex,rt_ex;
    wire [31:0] reg1_ex,reg2_ex,shamt_ex,immediate_ex,jump_addr_ex,pc_ex;
    wire clear2;
    wire [31:0] reg1_ex_in,reg2_ex_in;
    wire [31:0] instruction_ex;
    //zhuanfa input choose
    wire [31:0]choose00a,choose00b;
    //bruanch
    wire [31:0] j_addr,brh_addr,jr_addr,blez_addr;
    wire bruanch,jump,jr,blez;
    
    wire blezr;
    
    //by-path
    wire forward1a,forward1b;
    wire [1:0] forward2a,forward2b;
    wire forward3a,forward3b;
    wire [31:0]choose1,choose2;
    wire choose_immediate;
    wire [31:0]input1,input2;
    wire [31:0] choose3;
    
    //alu
    wire equal,of,uof;
    wire [31:0] alu_r;
    //EXMEM
    wire sys_b_mem,lbu_mem,lw_mem,sw_mem,jal_mem,we_mem,lui_mem;
    wire [4:0]reg_write_mem,rt_mem;
    wire [31:0]pc_mem,alur_mem,memdata_mem,immediate_mem;
    
    wire [31:0] ram_data_in;
    wire [31:0] instruction_mem;
    //RAM
    wire [31:0] ram_data_out;
    wire [7:0] lbu_choose8;
    wire [31:0] lw_choose,lbu_choose32,lui_choose;
    //MEM/WB
    wire [31:0] wb_data_in;
    wire sys_b_wb,jal_wb,we_wb;
    wire [4:0]reg_write_wb;
    wire  [31:0]pc_wb,data_wb;
    wire lw_lbu;
    wire [31:0] instruction_wb;
    
    //ram
    wire [31:0] ram_0,ram_1,ram_2,ram_3,ram_4,ram_5,ram_6,ram_7,ram_8,ram_9,ram_10,ram_11,ram_12,ram_13,ram_14;
    //initial
    dclok #(327680) dclock_15  (.clk(clk_in),.dclk(clk));
    //main
    assign pc_4 = pc + 32'd4;
    REGISTER PC_COUNTER (.clk(clk),.data_in(pc_in),.data_out(pc),.en(stop),.reset(1'b0));
    ROM_INSTRUCTION INSTRUCTION (.rom_addr(pc[11:2]),.rom_data(rom_data));
    //IFID
    IFID IFID1 (.clk(clk),.clear(j_clear),.stop(stop),.pc_in(pc_4),.instruction(rom_data),.instruction_id(instruction_id),.i_type(i_type_id),.lw(lw_id),.sw(sw_id),.beq(beq_id),.bne(bne_id),.jl(jl_id),.jr(jr_id),.blez(blez_id),.we(we_id),.jal(jal_id),.lui(lui_id),.lbu(lbu_id),.sys_b(sys_b_id),.slar(slra_id),.alu_op(alu_op_id),.reg_write(reg_write_id),.reg1_in(reg1_in_id),.reg2_in(reg2_in_id),.pc_out(pc_out_id),.shamt(shamt_id),.immediate(immediate_id),.jump_addr(jump_addr_id));
    
    //regfile
    REGFILE REGFILE1 (.reg1_in(reg1_in_id),.reg2_in(reg2_in_id),.reg_write(reg_write_wb),.data_write(data_in),.en_write(we_wb),.clk(clk),.reg_v0(reg_v0),.reg_a0(reg_a0),.reg1_out(reg1_out),.reg2_out(reg2_out));
    
    //zhuanfa
    assign reg1_ex_in = forward1a ? data_in : reg1_out;
    assign reg2_ex_in = forward1b ? data_in : reg2_out;
    
    //IDEX
    IDEX IDEX1 (.clk(clk),.clear(clear2),.i_type_in(i_type_id),.lw_in(lw_id),.sw_in(sw_id),.beq_in(beq_id),.bne_in(bne_id),.jl_in(jl_id),.jr_in(jr_id),.blez_in(blez_id),.we_in(we_id),.jal_in(jal_id),.lui_in(lui_id),.lbu_in(lbu_id),.sys_b_in(sys_b_id),.slra_in(slra_id),.alu_op_in(alu_op_id),.reg_write_in(reg_write_id),.rs_in(reg1_in_id),.rt_in(reg2_in_id),.reg1_in(reg1_ex_in),.reg2_in(reg2_ex_in),.shamt_in(shamt_id),.immediate_in(immediate_id),.jump_addr_in(jump_addr_id),.pc_in(pc_out_id),
                .i_type_out(i_type_ex),.lw_out(lw_ex),.sw_out(sw_ex),.beq_out(beq_ex),.bne_out(bne_ex),.jl_out(jl_ex),.jr_out(jr_ex),.blez_out(blez_ex),.we_out(we_ex),.jal_out(jal_ex),.lui_out(lui_ex),.lbu_out(lbu_ex),.sys_b_out(sys_b_ex),.slra_out(slra_ex),.alu_op_out(alu_op_ex),.reg_write_out(reg_write_ex),.rs_out(rs_ex),.rt_out(rt_ex),.reg1_out(reg1_ex),.reg2_out(reg2_ex),.shamt_out(shamt_ex),.immediate_out(immediate_ex),.jump_addr_out(jump_addr_ex),.pc_out(pc_ex),.instruction_id(instruction_id),.instruction_ex(instruction_ex));
    
    
    //bruanch count
    assign jump = jl_ex | jal_ex;
    assign bruanch = (beq_ex & equal) | (bne_ex & (~equal));
    assign jr = jr_ex;
    assign blez = (blezr | equal) & blez_ex;
    assign j_clear = jump | bruanch | jr | blez;
    
    assign j_addr = ( pc_ex & 32'hf0000000 ) + jump_addr_ex;
    assign brh_addr = ( immediate_ex << 2 ) + pc_ex;
    assign jr_addr = reg1_ex;
    assign blezr = alu_r[0];
    assign blez_addr = (immediate_ex << 2 ) + pc_ex;
    
    assign pc_in =blez ? blez_addr 
                 :jr ? jr_addr 
                 : jump ? j_addr
                 : bruanch ? brh_addr
                 : pc_4;
    //zhuanfa & alu
    assign choose00a = slra_ex ? reg2_ex : reg1_ex;
    assign choose00b = slra_ex ? shamt_ex : reg2_ex;
    
    assign choose1 = forward2a == 2'b10 ? alur_mem
                   : forward2a == 2'b01 ? data_in
                   : choose00a;
    assign choose2 = forward2b == 2'b10 ? alur_mem
                   : forward2b == 2'b01 ? data_in
                   : choose00b;
    assign choose_immediate = i_type_ex ^ beq_ex ^ bne_ex;
    assign input1 = choose1;
    assign input2 = blez_ex ? 32'd0
                  : choose_immediate ? immediate_ex 
                  : choose2;
    assign choose3 = forward3b ? data_in : reg2_ex;
    
    ALU_MIPS ALU (.input1(input1),.input2(input2),.alu_op(alu_op_ex),.alu_r(alu_r),.of(of),.uof(uof),.equal(equal));
    
    //EX/MEM
    EXMEM EXMEM1 (.clk(clk),.pc_in(pc_ex),.rs_in(rt_ex),.alur_in(alu_r),.memdata_in(choose3),.sys_b_in(sys_b_ex),.reg_write_in(reg_write_ex),.lbu_in(lbu_ex),.immediate_in(immediate_ex),.lw_in(lw_ex),.sw_in(sw_ex),.jal_in(jal_ex),.we_in(we_ex),.lui_in(lui_ex),.instruction_ex(instruction_ex),
                  .pc_out(pc_mem),.rs_out(rt_mem),.alur_out(alur_mem),.memdata_out(memdata_mem),.sys_b_out(sys_b_mem),.reg_write_out(reg_write_mem),.lbu_out(lbu_mem),.immediate_out(immediate_mem),.lw_out(lw_mem),.sw_out(sw_mem),.jal_out(jal_mem),.we_out(we_mem),.lui_out(lui_mem),.instruction_mem(instruction_mem));
    
    assign ram_data_in = forward3a ? data_in : memdata_mem;
    
    //RAM
    RAM_DATA RAM (.clk(clk),.sw(sw_mem),.lw(lw_mem),.ram_addr(alur_mem[11:2]),.ram_datain(ram_data_in),.ram_dataout(ram_data_out),.ram_0(ram_0),.ram_1(ram_1),.ram_2(ram_2),.ram_3(ram_3),.ram_4(ram_4),.ram_5(ram_5),.ram_6(ram_6),.ram_7(ram_7),.ram_8(ram_8),.ram_9(ram_9),.ram_10(ram_10),.ram_11(ram_11),.ram_12(ram_12),.ram_13(ram_13),.ram_14(ram_14));
    //lbu,lui
    assign lw_choose = lw_mem ? ram_data_out : alur_mem;
    assign lbu_choose8 = alur_mem[1:0] == 00 ? ram_data_out[7:0]
                      : alur_mem[1:0] == 01 ? ram_data_out[15:8]
                      : alur_mem[1:0] == 10 ? ram_data_out[23:16]
                      : ram_data_out[31:24];
    assign lbu_choose32 = {{24{1'b0}},lbu_choose8};
    assign lui_choose = lui_mem ? (immediate_mem << 16) : lw_choose;
    assign wb_data_in = lbu_mem ? lbu_choose32 : lui_choose;
    
    //MEM/WB
    MEMWB MEMWB1 (.sys_b_in(sys_b_mem),.jal_in(jal_mem),.we_in(we_mem),.clk(clk),.reg_write_in(reg_write_mem),.pc_in(pc_mem),.data_in(wb_data_in),.instruction_mem(instruction_mem),
                  .sys_b_out(sys_b_wb),.jal_out(jal_wb),.we_out(we_wb),.reg_write_out(reg_write_wb),.pc_out(pc_wb),.data_out(data_wb),.instruction_wb(instruction_wb));
    
    assign data_in = jal_wb ? pc_wb : data_wb;
    //BY-PATH
    
    BY_PATH BY_PATH1(.rs1_r(reg1_in_id),.rt1_r(reg2_in_id),.forward1_a(forward1a),.forward1_b(forward1b),
                     .rs2_r(rs_ex),.rt2_r(rt_ex),.forward2_a(forward2a),.forward2_b(forward2b),.reg1_write(reg_write_mem),.reg2_write(reg_write_wb),.we_mem(we_mem),.we_wb(we_wb),
                     .slar_in(slra_ex),
                     .rt3_r(rt_mem),.forward3_a(forward3a),.forward3_b(forward3b));
    
    
    //HAZARD
    assign lw_lbu = lw_ex | lbu_ex;
    HAZARD HAZARD1 (.lw(lw_lbu),.rt_ifid(reg2_in_id),.rt_idex(rt_ex),.rs_ifid(reg1_in_id),.stop(stop),.clear(l_clear));
    assign clear2 = j_clear | l_clear;
    
    //sys_b
    assign SYS_B = (reg_v0 == 10) & sys_b_wb;
    REGISTER #(1)REGISTER2 (.clk(SYS_B),.data_in(1'b1),.en(1'b1),.reset(1'b0),.data_out(break_down));
    assign clk_in = (break_down | (~power)) ? 1 : CLK;
    REGISTER REGISTER3 (.clk(clk),.data_in(reg_a0),.en(sys_b_wb),.reset(1'b0),.data_out(data_led_15));
    assign data_led = k0 ? ram_0
                    : k1 ? ram_1
                    : k2 ? ram_2
                    : k3 ? ram_3
                    : k4 ? ram_4
                    : k5 ? ram_5
                    : k6 ? ram_6
                    : k7 ? ram_7
                    : k8 ? ram_8
                    : k9 ? ram_9
                    : k10 ? ram_10
                    : k11 ? ram_11
                    : k12 ? ram_12
                    : k13 ? ram_13
                    : k14 ? ram_14
                    : data_led_15 ;
                    
    //led
    choose_seg LED(.power(power),.clk(CLK),.data1(data_led[3:0]),.data2(data_led[7:4]),.data3(data_led[11:8]),.data4(data_led[15:12]),.data5(data_led[19:16]),.data6(data_led[23:20]),.data7(data_led[27:24]),.data8(data_led[31:28]),.seg_choose(Segout),.data_choose(Dout));
    
endmodule
