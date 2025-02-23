`timescale 1ns/1ns
//544
//十六位并行输入，16位并行输出
module butterfly16(
    input   wire [543:0] butterfly_in,
    output  wire [543:0] butterfly_out
);
wire [135:0] inst1_0_out;
wire [135:0] inst1_1_out;
wire [135:0] inst1_2_out;
wire [135:0] inst1_3_out;

wire [135:0] inst2_0_out;
wire [135:0] inst2_1_out;
wire [135:0] inst2_2_out;
wire [135:0] inst2_3_out;

// parameter rotation0  = 4'b0000;
// parameter rotation1  = 4'b0001;
// parameter rotation2  = 4'b0010;
// parameter rotation3  = 4'b0011;

// parameter rotation4  = 4'b0100;
// parameter rotation5  = 4'b0101;
// parameter rotation6  = 4'b0110;
// parameter rotation7  = 4'b0111;

// parameter rotation8  = 4'b1000;
// parameter rotation9  = 4'b1001;
// parameter rotation10 = 4'b1010;
// parameter rotation11 = 4'b1011;

// parameter rotation12 = 4'b1100;
// parameter rotation13 = 4'b1101;
// parameter rotation14 = 4'b1110;
// parameter rotation15 = 4'b1111;
//***********************************************************************************************************************************
//--------------------------------------------------------------SECTION 1------------------------------------------------------------
butterfly4 inst1_0(
  .calc_in({butterfly_in[441:408],butterfly_in[305:272],butterfly_in[169:136],butterfly_in[33:0]}),   //input  wire [135:0] calc_in
  .rotation(4'b0000),  //input  wire [2:0]   rotation
  .calc_out(inst1_0_out)   //output wire [135:0] calc_out
  );

butterfly4 inst1_1(
  .calc_in({butterfly_in[475:442],butterfly_in[339:306],butterfly_in[203:170],butterfly_in[67:34]}),   //input  wire [135:0] calc_in
  .rotation(4'b0000),  //input  wire [2:0]   rotation
  .calc_out(inst1_1_out)   //output wire [135:0] calc_out
  );

butterfly4 inst1_2(
  .calc_in({butterfly_in[509:476],butterfly_in[373:340],butterfly_in[237:204],butterfly_in[101:68]}),   //input  wire [135:0] calc_in
  .rotation(4'b0000),  //input  wire [2:0]   rotation
  .calc_out(inst1_2_out)   //output wire [135:0] calc_out
  );

butterfly4 inst1_3(
  .calc_in({butterfly_in[543:510],butterfly_in[407:374],butterfly_in[271:238],butterfly_in[135:102]}),   //input  wire [135:0] calc_in
  .rotation(4'b0000),  //input  wire [2:0]   rotation
  .calc_out(inst1_3_out)   //output wire [135:0] calc_out
  );
//----------------------------------------------------------------reg----------------------------------------------------------------

//--------------------------------------------------------------SECTION 2------------------------------------------------------------
butterfly4 inst2_0(
  .calc_in({inst1_3_out[33:0],inst1_2_out[33:0],inst1_1_out[33:0],inst1_0_out[33:0]}),   //input  wire [135:0] calc_in
  .rotation(4'b0000),  //input  wire [2:0]   rotation
  .calc_out(inst2_0_out)   //output wire [135:0] calc_out
  );

butterfly4 inst2_1(
  .calc_in({inst1_3_out[67:34],inst1_2_out[67:34],inst1_1_out[67:34],inst1_0_out[67:34]}),   //input  wire [135:0] calc_in
  .rotation(4'b0100),  //input  wire [2:0]   rotation
  .calc_out(inst2_1_out)   //output wire [135:0] calc_out
  );

butterfly4 inst2_2(
  .calc_in({inst1_3_out[101:68],inst1_2_out[101:68],inst1_1_out[101:68],inst1_0_out[101:68]}),   //input  wire [135:0] calc_in
  .rotation(4'b1000),  //input  wire [2:0]   rotation
  .calc_out(inst2_2_out)   //output wire [135:0] calc_out
  );

butterfly4 inst2_3(
  .calc_in({inst1_3_out[135:102],inst1_2_out[135:102],inst1_1_out[135:102],inst1_0_out[135:102]}),   //input  wire [135:0] calc_in
  .rotation(4'b1100),  //input  wire [2:0]   rotation
  .calc_out(inst2_3_out)   //output wire [135:0] calc_out
  );
//****************************************************************************************************************************************

assign butterfly_out = {
    inst2_3_out[135:102],inst2_2_out[135:102],inst2_1_out[135:102],inst2_0_out[135:102],
    inst2_3_out[101:68],inst2_2_out[101:68],inst2_1_out[101:68],inst2_0_out[101:68],
    inst2_3_out[67:34],inst2_2_out[67:34],inst2_1_out[67:34],inst2_0_out[67:34],
    inst2_3_out[33:0],inst2_2_out[33:0],inst2_1_out[33:0],inst2_0_out[33:0]};
endmodule

