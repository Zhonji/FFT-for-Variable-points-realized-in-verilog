/*
`timescale 1ns/1ns
module butterfly4(
  input  wire [135:0] calc_in,  // The 4 numbers which need to be calculated. Format: in4(Re,Im), in3(Re,Im), in2(Re,Im), in1(Re,Im)
  input  wire [2:0]   rotation, // Number of each butterfly computation (8 in total)
  output wire [135:0] calc_out  // The 4 output numbers. Format: out4(Re,Im), out3(Re,Im), out2(Re,Im), out1(Re,Im)
  
  );

  parameter para0000 = 8'b00000000;  //  0.0000. sin(0pi/8) = sin(8pi/8) = cos(4pi/8) = - cos(4pi/8)
  parameter para3827 = 8'b00110001;  //  0.3827. sin(1pi/8) = sin(7pi/8) = cos(3pi/8) = - cos(5pi/8) 0.0110000111111000101000001001000000101101111000000001
  parameter parn3827 = 8'b11001111;  // -0.3827. sin(1pi/8) = sin(7pi/8) = cos(3pi/8) = - cos(5pi/8)
  parameter para7071 = 8'b01011010;  //  0.7071. sin(2pi/8) = sin(6pi/8) = cos(2pi/8) = - cos(6pi/8) 0.1011010100000100100000010110111100000000011010001110
  parameter parn7071 = 8'b10100110;  // -0.7071. sin(2pi/8) = sin(6pi/8) = cos(2pi/8) = - cos(6pi/8)
  parameter para9239 = 8'b01110110;  //  0.9239. sin(3pi/8) = sin(5pi/8) = cos(1pi/8) = - cos(7pi/8) 0.1110110010000100101101011101110011000110001111110001
  parameter parn9239 = 8'b10001010;  // -0.9239. sin(3pi/8) = sin(5pi/8) = cos(1pi/8) = - cos(7pi/8)
  parameter para1111 = 8'b01111111;  //  1.0000. sin(4pi/8) = sin(4pi/8) = cos(0pi/8) = - cos(8pi/8)
  parameter parn1111 = 8'b10000001;  // -1.0000.
  
  reg  signed [7:0]  rotation_factor1_real;  // For input B
  reg  signed [7:0]  rotation_factor1_imag;  // For input B
  reg  signed [7:0]  rotation_factor2_real;  // For input C
  reg  signed [7:0]  rotation_factor2_imag;  // For input C
  reg  signed [7:0]  rotation_factor3_real;  // For input D
  reg  signed [7:0]  rotation_factor3_imag;  // For input D

  wire signed [7:0]  in_8bit_1_real, in_8bit_1_imag;
  wire signed [7:0]  in_8bit_2_real, in_8bit_2_imag;
  wire signed [7:0]  in_8bit_3_real, in_8bit_3_imag;

  wire signed [33:0] temp_0, temp_1, temp_2, temp_3;

  wire signed [16:0] temp_0_real, temp_0_imag;
  wire signed [16:0] temp_1_real, temp_1_imag;
  wire signed [16:0] temp_2_real, temp_2_imag;
  wire signed [16:0] temp_3_real, temp_3_imag;

  wire signed [16:0] in_17bit_0_real, in_17bit_0_imag;
  wire signed [16:0] in_17bit_1_real, in_17bit_1_imag;
  wire signed [16:0] in_17bit_2_real, in_17bit_2_imag;
  wire signed [16:0] in_17bit_3_real, in_17bit_3_imag;

  wire signed [16:0] out_0_real, out_0_imag;
  wire signed [16:0] out_1_real, out_1_imag;
  wire signed [16:0] out_2_real, out_2_imag;
  wire signed [16:0] out_3_real, out_3_imag;

  wire signed [16:0] out_0_real_out, out_0_imag_out;
  wire signed [16:0] out_1_real_out, out_1_imag_out;
  wire signed [16:0] out_2_real_out, out_2_imag_out;
  wire signed [16:0] out_3_real_out, out_3_imag_out;

  wire signed [16:0] temp_2_1_real, temp_2_2_real, temp_2_1_imag, temp_2_2_imag;
  wire signed [16:0] temp_3_1_real, temp_3_2_real, temp_3_1_imag, temp_3_2_imag;
  wire signed [16:0] temp_4_1_real, temp_4_2_real, temp_4_1_imag, temp_4_2_imag;

//****************************** The following are state machines *****************************

// This always part controls signal rotation_factor1_real.
  always @ ( rotation ) begin
    case ( rotation )
      3'b000: rotation_factor1_real = para1111;
      3'b001: rotation_factor1_real = para1111;
      3'b010: rotation_factor1_real = para1111;
      3'b011: rotation_factor1_real = para1111;
      3'b100: rotation_factor1_real = para1111;  //   cos(0)     =   1        W_16^0
      3'b101: rotation_factor1_real = para9239;  //   cos(pi/8)  =   0.9239   W_16^1
      3'b110: rotation_factor1_real = para7071;  //   cos(pi/4)  =   0.7071   W_16^2
      3'b111: rotation_factor1_real = para3827;  //   cos(3pi/8) =   0.3827   W_16^3
    endcase
  end

// This always part controls signal rotation_factor1_imag.
  always @ ( rotation ) begin
    case ( rotation )
      3'b000: rotation_factor1_imag = para0000;
      3'b001: rotation_factor1_imag = para0000;
      3'b010: rotation_factor1_imag = para0000;
      3'b011: rotation_factor1_imag = para0000;
      3'b100: rotation_factor1_imag = para0000;  // - sin(0)     =   0        W_16^0
      3'b101: rotation_factor1_imag = parn3827;  // - sin(pi/8)  = - 0.3827   W_16^1
      3'b110: rotation_factor1_imag = parn7071;  // - sin(pi/4)  = - 0.7071   W_16^2
      3'b111: rotation_factor1_imag = parn9239;  // - sin(3pi/8) = - 0.9239   W_16^3
    endcase
  end

// This always part controls signal rotation_factor2_real.
  always @ ( rotation ) begin
    case ( rotation )
      3'b000: rotation_factor2_real = para1111;
      3'b001: rotation_factor2_real = para1111;
      3'b010: rotation_factor2_real = para1111;
      3'b011: rotation_factor2_real = para1111;
      3'b100: rotation_factor2_real = para1111;  //   cos(0)     =   1        W_16^0
      3'b101: rotation_factor2_real = para7071;  //   cos(pi/4)  =   0.7071   W_16^2
      3'b110: rotation_factor2_real = para0000;  //   cos(pi/2)  =   0        W_16^4
      3'b111: rotation_factor2_real = parn7071;  //   cos(3pi/4) = - 0.7071   W_16^6
    endcase
  end

// This always part controls signal rotation_factor2_imag.
  always @ ( rotation ) begin
    case ( rotation )
      3'b000: rotation_factor2_imag = para0000;
      3'b001: rotation_factor2_imag = para0000;
      3'b010: rotation_factor2_imag = para0000;
      3'b011: rotation_factor2_imag = para0000;
      3'b100: rotation_factor2_imag = para0000;  // - sin(0)     =   0        W_16^0
      3'b101: rotation_factor2_imag = parn7071;  // - sin(pi/8)  = - 0.7071   W_16^2
      3'b110: rotation_factor2_imag = parn1111;  // - sin(pi/4)  = - 1        W_16^4
      3'b111: rotation_factor2_imag = parn7071;  // - sin(3pi/8) = - 0.7071   W_16^6
    endcase
  end

// This always part controls signal rotation_factor3_real.
  always @ ( rotation ) begin
    case ( rotation )
      3'b000: rotation_factor3_real = para1111;
      3'b001: rotation_factor3_real = para1111;
      3'b010: rotation_factor3_real = para1111;
      3'b011: rotation_factor3_real = para1111;
      3'b100: rotation_factor3_real = para1111;  //   cos(0)     =   1        W_16^0
      3'b101: rotation_factor3_real = para3827;  //   cos(3pi/8) =   0.7071   W_16^3
      3'b110: rotation_factor3_real = parn7071;  //   cos(6pi/8) =   0        W_16^6
      3'b111: rotation_factor3_real = parn9239;  //   cos(9pi/8) = - 0.7071   W_16^9
    endcase
  end

// This always part controls signal rotation_factor3_imag.
  always @ ( rotation ) begin
    case ( rotation )
      3'b000: rotation_factor3_imag = para0000;
      3'b001: rotation_factor3_imag = para0000;
      3'b010: rotation_factor3_imag = para0000;
      3'b011: rotation_factor3_imag = para0000;
      3'b100: rotation_factor3_imag = para0000;  // - sin(0)     = - 0        W_16^0
      3'b101: rotation_factor3_imag = parn9239;  // - sin(3pi/8) = - 0.7071   W_16^3
      3'b110: rotation_factor3_imag = parn7071;  // - sin(6pi/8) = - 0.1      W_16^6
      3'b111: rotation_factor3_imag = para3827;  // - sin(9pi/8) =   0.7071   W_16^9
    endcase
  end

//****************************** The following are instantiations *****************************

  multi16 multiBRR( .in_17bit(in_17bit_1_real),
                    .in_8bit(in_8bit_1_real),
                    .out(temp_2_1_real)
                  );

  multi16 multiBII( .in_17bit(in_17bit_1_imag),
                    .in_8bit(in_8bit_1_imag),
                    .out(temp_2_2_real)
                  );

  multi16 multiBRI( .in_17bit(in_17bit_1_real),
                    .in_8bit(in_8bit_1_imag),
                    .out(temp_2_1_imag)
                  );

  multi16 multiBIR( .in_17bit(in_17bit_1_imag),
                    .in_8bit(in_8bit_1_real),
                    .out(temp_2_2_imag)
                  );
  
//************************************************************************************************

  multi16 multiCRR( .in_17bit(in_17bit_2_real),
                    .in_8bit(in_8bit_2_real),
                    .out(temp_3_1_real)
                  );
                  
  multi16 multiCII( .in_17bit(in_17bit_2_imag),
                    .in_8bit(in_8bit_2_imag),
                    .out(temp_3_2_real)
                  );

  multi16 multiCRI( .in_17bit(in_17bit_2_real),
                    .in_8bit(in_8bit_2_imag),
                    .out(temp_3_1_imag)
                  );

  multi16 multiCIR( .in_17bit(in_17bit_2_imag),
                    .in_8bit(in_8bit_2_real),
                    .out(temp_3_2_imag)
                  );

//************************************************************************************************                

  multi16 multiDRR( .in_17bit(in_17bit_3_real),
                    .in_8bit(in_8bit_3_real),
                    .out(temp_4_1_real)
                  );

  multi16 multiDII( .in_17bit(in_17bit_3_imag),
                    .in_8bit(in_8bit_3_imag),
                    .out(temp_4_2_real)
                  );

  multi16 multiDRI( .in_17bit(in_17bit_3_real),
                    .in_8bit(in_8bit_3_imag),
                    .out(temp_4_1_imag)
                  );

  multi16 multiDIR( .in_17bit(in_17bit_3_imag),
                    .in_8bit(in_8bit_3_real),
                    .out(temp_4_2_imag)
                  );

//**************************** The following are assign statements ****************************

  assign in_17bit_0_real = calc_in[33:17];         // A (real)
  assign in_17bit_0_imag = calc_in[16:0];          // A (imag)

  assign in_8bit_1_real  = rotation_factor1_real;  // rotation factor for B (real)
  assign in_8bit_1_imag  = rotation_factor1_imag;  // rotation factor for B (imag)
  assign in_17bit_1_real = calc_in[67:51];         // B (real) 
  assign in_17bit_1_imag = calc_in[50:34];         // B (imag) 

  assign in_8bit_2_real  = rotation_factor2_real;  // rotation factor for C (real)
  assign in_8bit_2_imag  = rotation_factor2_imag;  // rotation factor for C (imag)
  assign in_17bit_2_real = calc_in[101:85];        // C (real) 
  assign in_17bit_2_imag = calc_in[84:68];         // C (imag) 

  assign in_8bit_3_real  = rotation_factor3_real;  // rotation factor for D (real)
  assign in_8bit_3_imag  = rotation_factor3_imag;  // rotation factor for D (imag)
  assign in_17bit_3_real = calc_in[135:119];       // D (real)  
  assign in_17bit_3_imag = calc_in[118:102];       // D (imag) 

//************************************************************************************************       

  assign temp_0_real = in_17bit_0_real[16]?{1'b1,~in_17bit_0_real[15:0]+1'b1}:{1'b0,in_17bit_0_real[15:0]}; // A real
  assign temp_0_imag = in_17bit_0_imag[16]?{1'b1,~in_17bit_0_imag[15:0]+1'b1}:{1'b0,in_17bit_0_imag[15:0]}; // A imag

  assign temp_1_real = temp_2_1_real - temp_2_2_real;  //B * W^P     real
  assign temp_1_imag = temp_2_1_imag + temp_2_2_imag;  //B * W^P     imag

  assign temp_2_real = temp_3_1_real - temp_3_2_real;  //C * W^{2p}  real
  assign temp_2_imag = temp_3_1_imag + temp_3_2_imag;  //C * W^{2p}  imag

  assign temp_3_real = temp_4_1_real - temp_4_2_real;  //D * W^{3P}  real
  assign temp_3_imag = temp_4_1_imag + temp_4_2_imag;  //D * W^{3P}  imag


  assign temp_0 = {temp_0_real, temp_0_imag};   // A
  assign temp_1 = {temp_1_real, temp_1_imag};  // B * Wp
  assign temp_2 = {temp_2_real, temp_2_imag};  // C * W2p
  assign temp_3 = {temp_3_real, temp_3_imag};  // D * W3p

//************************************************************************************************       

  assign out_0_real = temp_0_real + temp_1_real + temp_2_real + temp_3_real;
  assign out_0_imag = temp_0_imag + temp_1_imag + temp_2_imag + temp_3_imag;

  assign out_1_real = temp_0_real - temp_1_real + temp_2_real - temp_3_real;
  assign out_1_imag = temp_0_imag - temp_1_imag + temp_2_imag - temp_3_imag;

  assign out_2_real = temp_0_real - temp_1_imag - temp_2_real + temp_3_imag;
  assign out_2_imag = temp_0_imag + temp_1_real - temp_2_imag - temp_3_real;

  assign out_3_real = temp_0_real + temp_1_imag - temp_2_real - temp_3_imag;
  assign out_3_imag = temp_0_imag - temp_1_real - temp_2_imag + temp_3_real;

  assign out_3_real_out  =  out_3_real[16]?{1'b1,~out_3_real[15:0]+1'b1}:{1'b0,out_3_real[15:0]};
  assign out_3_imag_out  =  out_3_imag[16]?{1'b1,~out_3_imag[15:0]+1'b1}:{1'b0,out_3_imag[15:0]};
  assign out_2_real_out  =  out_2_real[16]?{1'b1,~out_2_real[15:0]+1'b1}:{1'b0,out_2_real[15:0]};
  assign out_2_imag_out  =  out_2_imag[16]?{1'b1,~out_2_imag[15:0]+1'b1}:{1'b0,out_2_imag[15:0]};
  assign out_1_real_out  =  out_1_real[16]?{1'b1,~out_1_real[15:0]+1'b1}:{1'b0,out_1_real[15:0]};
  assign out_1_imag_out  =  out_1_imag[16]?{1'b1,~out_1_imag[15:0]+1'b1}:{1'b0,out_1_imag[15:0]};
  assign out_0_real_out  =  out_0_real[16]?{1'b1,~out_0_real[15:0]+1'b1}:{1'b0,out_0_real[15:0]};
  assign out_0_imag_out  =  out_0_imag[16]?{1'b1,~out_0_imag[15:0]+1'b1}:{1'b0,out_0_imag[15:0]};



  assign calc_out = { out_2_real_out, out_2_imag_out, 
                      out_1_real_out, out_1_imag_out,
                      out_3_real_out, out_3_imag_out,
                      out_0_real_out, out_0_imag_out };
endmodule
*/
`timescale 1ns/1ns
module butterfly4(
  input  wire [135:0] calc_in,  // The 4 numbers which need to be calculated. Format: in4(Re,Im), in3(Re,Im), in2(Re,Im), in1(Re,Im)
  input  wire [3:0]   rotation, // Number of each butterfly computation (8 in total)
  output wire [135:0] calc_out  // The 4 output numbers. Format: out4(Re,Im), out3(Re,Im), out2(Re,Im), out1(Re,Im)
  
  );
//**************************************************************************************
//-----------------------------------旋转因子--------------------------------------------
// for 16_bit
  parameter para0000 = 8'b00000000;  //  0.0000. sin(0pi/8) = sin(8pi/8) = cos(4pi/8) = - cos(4pi/8)
  parameter para3827 = 8'b00110001;  //  0.3827. sin(1pi/8) = sin(7pi/8) = cos(3pi/8) = - cos(5pi/8) 0.0110000111111000101000001001000000101101111000000001
  parameter parn3827 = 8'b10110001;  // -0.3827. sin(1pi/8) = sin(7pi/8) = cos(3pi/8) = - cos(5pi/8)
  parameter para7071 = 8'b01011010;  //  0.7071. sin(2pi/8) = sin(6pi/8) = cos(2pi/8) = - cos(6pi/8) 0.1011010100000100100000010110111100000000011010001110
  parameter parn7071 = 8'b11011010;  // -0.7071. sin(2pi/8) = sin(6pi/8) = cos(2pi/8) = - cos(6pi/8)
  parameter para9239 = 8'b01110110;  //  0.9239. sin(3pi/8) = sin(5pi/8) = cos(1pi/8) = - cos(7pi/8) 0.1110110010000100101101011101110011000110001111110001
  parameter parn9239 = 8'b11110110;  // -0.9239. sin(3pi/8) = sin(5pi/8) = cos(1pi/8) = - cos(7pi/8)
  parameter para1111 = 8'b01111111;  //  1.0000. sin(4pi/8) = sin(4pi/8) = cos(0pi/8) = - cos(8pi/8)
  parameter parn1111 = 8'b11111111;  // -1.0000.
 // exa for 64_bit
  parameter para9952 = 8'b01111111;  //  0.9952  0.111111101100010101101
  parameter parn0980 = 8'b10001100;  // -0.0980  0.00011001000
  parameter para9808 = 8'b01111101;  //  0.9808  0.11111011000101011011010101110011111
  parameter parn1951 = 8'b10011000;  // -0.1951  0.0011000111110010000100
  parameter para9569 = 8'b01111010;  //  0.9569  0.11110100111101110110
  parameter parn2903 = 8'b10100101;  // -0.2903  0.010010100101000100
  parameter para8819 = 8'b01110000;  //  0.8819  0.1110000111000
  parameter parn4714 = 8'b10111100;  // -0.4714  0.011110001010110110
  parameter para8315 = 8'b01101010;  //  0.8315  0.110101001101110100101111
  parameter parn5556 = 8'b11000111;  // -0.5556  0.100011100011101111
  parameter para7730 = 8'b01100010;  //  0.7730  0.110001011110001101010011
  parameter para6344 = 8'b01010001;  //  0.6344  0.1010001001101000000
  parameter parn6344 = 8'b11010001;  // -0.6344  0.1010001001101000000;
  parameter parn7730 = 8'b11100010;  // -0.7730  0.110001011110001101010011111101111
  parameter para5556 = 8'b01000111;  //  0.5556  0.100011100011101111
  parameter parn8315 = 8'b11101010;  // -0.8315  0.110101001101110100101111
  parameter para4714 = 8'b00111100;  //  0.4714  0.011110001010110110;
  parameter parn8819 = 8'b11110000;  // -0.8819  0.1110000111000;
  parameter para2903 = 8'b00100101;  //  0.2903  0.010010100101000100;
  parameter parn9569 = 8'b11111010;  // -0.9569  0.11110100111101110110;
  parameter para1951 = 8'b00011000;  //  0.1951  0.0011000111110010000100;
  parameter parn9808 = 8'b11111101;  // -0.9808  0.1111101100010101101101;
  parameter para0980 = 8'b00001100;  //  0.0980  0.00011001000;
  parameter parn9952 = 8'b11111111;  //  -0.9952  0.11111110110001010110;
//*************************************************************************************

  reg  signed [7:0]  rotation_factor1_real;  // For input B
  reg  signed [7:0]  rotation_factor1_imag;  // For input B
  reg  signed [7:0]  rotation_factor2_real;  // For input C
  reg  signed [7:0]  rotation_factor2_imag;  // For input C
  reg  signed [7:0]  rotation_factor3_real;  // For input D
  reg  signed [7:0]  rotation_factor3_imag;  // For input D

  wire signed [7:0]  in_8bit_1_real, in_8bit_1_imag;
  wire signed [7:0]  in_8bit_2_real, in_8bit_2_imag;
  wire signed [7:0]  in_8bit_3_real, in_8bit_3_imag;

  wire signed [33:0] temp_0, temp_1, temp_2, temp_3;

  wire signed [16:0] temp_0_real, temp_0_imag;
  wire signed [16:0] temp_1_real, temp_1_imag;
  wire signed [16:0] temp_2_real, temp_2_imag;
  wire signed [16:0] temp_3_real, temp_3_imag;

  wire signed [16:0] in_17bit_0_real, in_17bit_0_imag;
  wire signed [16:0] in_17bit_1_real, in_17bit_1_imag;
  wire signed [16:0] in_17bit_2_real, in_17bit_2_imag;
  wire signed [16:0] in_17bit_3_real, in_17bit_3_imag;

  wire signed [16:0] out_0_real, out_0_imag;
  wire signed [16:0] out_1_real, out_1_imag;
  wire signed [16:0] out_2_real, out_2_imag;
  wire signed [16:0] out_3_real, out_3_imag;

  wire signed [16:0] out_0_real_out, out_0_imag_out;
  wire signed [16:0] out_1_real_out, out_1_imag_out;
  wire signed [16:0] out_2_real_out, out_2_imag_out;
  wire signed [16:0] out_3_real_out, out_3_imag_out;

  wire signed [16:0] temp_2_1_real, temp_2_2_real, temp_2_1_imag, temp_2_2_imag;
  wire signed [16:0] temp_3_1_real, temp_3_2_real, temp_3_1_imag, temp_3_2_imag;
  wire signed [16:0] temp_4_1_real, temp_4_2_real, temp_4_1_imag, temp_4_2_imag;

//****************************** The following are state machines *****************************

// This always part controls signal rotation_factor1_real.
  always @ ( rotation ) begin
    case ( rotation )
      4'b0000: rotation_factor1_real = para1111;  //  W64^0
      4'b0001: rotation_factor1_real = para9952;  //  W64^1
      4'b0010: rotation_factor1_real = para9808;  //  W64^2
      4'b0011: rotation_factor1_real = para9569;  //  W64^3
      4'b0100: rotation_factor1_real = para9239;  //  W64^4/W16^1
      4'b0101: rotation_factor1_real = para8819;  //  W64^5
      4'b0110: rotation_factor1_real = para8315;  //  W64^6
      4'b0111: rotation_factor1_real = para7730;  //  W64^7
      4'b1000: rotation_factor1_real = para7071;  //  W64^8/W16^2
      4'b1001: rotation_factor1_real = para6344;  //  W64^9
      4'b1010: rotation_factor1_real = para5556;  //  W64^10
      4'b1011: rotation_factor1_real = para4714;  //  W64^11
      4'b1100: rotation_factor1_real = para3827;  //  W64^12/W16^3
      4'b1101: rotation_factor1_real = para2903;  //  W64^13
      4'b1110: rotation_factor1_real = para1951;  //  W64^14
      4'b1111: rotation_factor1_real = para0980;  //  W64^15
    endcase
  end

// This always part controls signal rotation_factor1_imag.
  always @ ( rotation ) begin
    case ( rotation )
      4'b0000: rotation_factor1_imag = para0000;  //  W64^0
      4'b0001: rotation_factor1_imag = parn0980;  //  W64^1
      4'b0010: rotation_factor1_imag = parn1951;  //  W64^2
      4'b0011: rotation_factor1_imag = parn2903;  //  W64^3
      4'b0100: rotation_factor1_imag = parn3827;  //  W64^4
      4'b0101: rotation_factor1_imag = parn4714;  //  W64^5
      4'b0110: rotation_factor1_imag = parn5556;  //  W64^6
      4'b0111: rotation_factor1_imag = parn6344;  //  W64^7
      4'b1000: rotation_factor1_imag = parn7071;  //  W64^8/W16^2
      4'b1001: rotation_factor1_imag = parn7730;  //  W64^9
      4'b1010: rotation_factor1_imag = parn8315;  //  W64^10
      4'b1011: rotation_factor1_imag = parn8819;  //  W64^11
      4'b1100: rotation_factor1_imag = parn9239;  //  W64^12/W16^3
      4'b1101: rotation_factor1_imag = parn9569;  //  W64^13
      4'b1110: rotation_factor1_imag = parn9808;  //  W64^14
      4'b1111: rotation_factor1_imag = parn9952;  //  W64^15
    endcase
  end

// This always part controls signal rotation_factor2_real.
  always @ ( rotation ) begin
    case ( rotation )
      4'b0000: rotation_factor2_real = para1111;  //  W64^0
      4'b0001: rotation_factor2_real = para9808;  //  W64^2
      4'b0010: rotation_factor2_real = para9239;  //  W64^4
      4'b0011: rotation_factor2_real = para8315;  //  W64^6
      4'b0100: rotation_factor2_real = para7071;  //  W64^8/W16^2
      4'b0101: rotation_factor2_real = para5556;  //  W64^10
      4'b0110: rotation_factor2_real = para3827;  //  W64^12/W16^3
      4'b0111: rotation_factor2_real = para1951;  //  W64^14
      4'b1000: rotation_factor2_real = para0000;  //  W64^16/W16^4
      4'b1001: rotation_factor2_real = parn1951;  //  W64^18
      4'b1010: rotation_factor2_real = parn3827;  //  W64^20
      4'b1011: rotation_factor2_real = parn5556;  //  W64^22
      4'b1100: rotation_factor2_real = parn7071;  //  W64^24/W16^6
      4'b1101: rotation_factor2_real = parn8315;  //  W64^26
      4'b1110: rotation_factor2_real = parn9239;  //  W64^28
      4'b1111: rotation_factor2_real = parn9808;  //  W64^30
    endcase
  end

// This always part controls signal rotation_factor2_imag.
  always @ ( rotation ) begin
    case ( rotation )
      4'b0000: rotation_factor2_imag = para0000;  //  W64^0
      4'b0001: rotation_factor2_imag = parn1951;  //  W64^2
      4'b0010: rotation_factor2_imag = parn3827;  //  W64^4  
      4'b0011: rotation_factor2_imag = parn5556;  //  W64^6
      4'b0100: rotation_factor2_imag = parn7071;  //  W64^8/W16^2
      4'b0101: rotation_factor2_imag = parn8315;  //  W64^10
      4'b0110: rotation_factor2_imag = parn9239;  //  W64^12/W16^3
      4'b0111: rotation_factor2_imag = parn9808;  //  W64^14
      4'b1000: rotation_factor2_imag = parn1111;  //  W64^16/W16^4
      4'b1001: rotation_factor2_imag = parn9808;  //  W64^18
      4'b1010: rotation_factor2_imag = parn9239;  //  W64^20
      4'b1011: rotation_factor2_imag = parn8315;  //  W64^22
      4'b1100: rotation_factor2_imag = parn7071;  //  W64^24/W16^6
      4'b1101: rotation_factor2_imag = parn5556;  //  W64^26
      4'b1110: rotation_factor2_imag = parn3827;  //  W64^28
      4'b1111: rotation_factor2_imag = parn1951;  //  W64^30
    endcase
  end

// This always part controls signal rotation_factor3_real.
  always @ ( rotation ) begin
    case ( rotation )
      4'b0000: rotation_factor3_real = para1111;  //  W64^0
      4'b0001: rotation_factor3_real = para9569;  //  W64^3
      4'b0010: rotation_factor3_real = para8315;  //  W64^6
      4'b0011: rotation_factor3_real = para6344;  //  W64^9
      4'b0100: rotation_factor3_real = para3827;  //  W64^12/W16^3
      4'b0101: rotation_factor3_real = para0980;  //  W64^15
      4'b0110: rotation_factor3_real = parn1951;  //  W64^18
      4'b0111: rotation_factor3_real = parn4714;  //  W64^21
      4'b1000: rotation_factor3_real = parn7071;  //  W64^24/W16^6
      4'b1001: rotation_factor3_real = parn8819;  //  W64^27
      4'b1010: rotation_factor3_real = parn9808;  //  W64^30
      4'b1011: rotation_factor3_real = parn9952;  //  W64^33
      4'b1100: rotation_factor3_real = parn9239;  //  W64^36
      4'b1101: rotation_factor3_real = parn7730;  //  W64^39
      4'b1110: rotation_factor3_real = parn5556;  //  W64^42
      4'b1111: rotation_factor3_real = parn2903;  //  W64^45
    endcase
  end

// This always part controls signal rotation_factor3_imag.
  always @ ( rotation ) begin
    case ( rotation )
      4'b0000: rotation_factor3_imag = para0000;  //  W64^0
      4'b0001: rotation_factor3_imag = parn2903;  //  W64^3
      4'b0010: rotation_factor3_imag = parn5556;  //  W64^6
      4'b0011: rotation_factor3_imag = parn7730;  //  W64^9
      4'b0100: rotation_factor3_imag = parn9239;  //  W64^12/W16^3
      4'b0101: rotation_factor3_imag = parn9952;  //  W64^15
      4'b0110: rotation_factor3_imag = parn9808;  //  W64^18
      4'b0111: rotation_factor3_imag = parn8819;  //  W64^21
      4'b1000: rotation_factor3_imag = parn7071;  //  W64^24/W16^6
      4'b1001: rotation_factor3_imag = parn4714;  //  W64^27
      4'b1010: rotation_factor3_imag = parn1951;  //  W64^30
      4'b1011: rotation_factor3_imag = para0980;  //  W64^33
      4'b1100: rotation_factor3_imag = para3827;  //  W64^36
      4'b1101: rotation_factor3_imag = para6344;  //  W64^39
      4'b1110: rotation_factor3_imag = para8315;  //  W64^42
      4'b1111: rotation_factor3_imag = para9569;  //  W64^45
    endcase
  end

//****************************** The following are instantiations *****************************

  multi16 multiBRR( .in_17bit(in_17bit_1_real),
                    .in_8bit(in_8bit_1_real),
                    .out(temp_2_1_real)
                  );

  multi16 multiBII( .in_17bit(in_17bit_1_imag),
                    .in_8bit(in_8bit_1_imag),
                    .out(temp_2_2_real)
                  );

  multi16 multiBRI( .in_17bit(in_17bit_1_real),
                    .in_8bit(in_8bit_1_imag),
                    .out(temp_2_1_imag)
                  );

  multi16 multiBIR( .in_17bit(in_17bit_1_imag),
                    .in_8bit(in_8bit_1_real),
                    .out(temp_2_2_imag)
                  );
  
//************************************************************************************************

  multi16 multiCRR( .in_17bit(in_17bit_2_real),
                    .in_8bit(in_8bit_2_real),
                    .out(temp_3_1_real)
                  );
                  
  multi16 multiCII( .in_17bit(in_17bit_2_imag),
                    .in_8bit(in_8bit_2_imag),
                    .out(temp_3_2_real)
                  );

  multi16 multiCRI( .in_17bit(in_17bit_2_real),
                    .in_8bit(in_8bit_2_imag),
                    .out(temp_3_1_imag)
                  );

  multi16 multiCIR( .in_17bit(in_17bit_2_imag),
                    .in_8bit(in_8bit_2_real),
                    .out(temp_3_2_imag)
                  );

//************************************************************************************************                

  multi16 multiDRR( .in_17bit(in_17bit_3_real),
                    .in_8bit(in_8bit_3_real),
                    .out(temp_4_1_real)
                  );

  multi16 multiDII( .in_17bit(in_17bit_3_imag),
                    .in_8bit(in_8bit_3_imag),
                    .out(temp_4_2_real)
                  );

  multi16 multiDRI( .in_17bit(in_17bit_3_real),
                    .in_8bit(in_8bit_3_imag),
                    .out(temp_4_1_imag)
                  );

  multi16 multiDIR( .in_17bit(in_17bit_3_imag),
                    .in_8bit(in_8bit_3_real),
                    .out(temp_4_2_imag)
                  );

//**************************** The following are assign statements ****************************

  assign in_17bit_0_real = calc_in[33:17];         // A (real)
  assign in_17bit_0_imag = calc_in[16:0];          // A (imag)

  assign in_8bit_1_real  = rotation_factor1_real;  // rotation factor for B (real)
  assign in_8bit_1_imag  = rotation_factor1_imag;  // rotation factor for B (imag)
  assign in_17bit_1_real = calc_in[67:51];         // B (real) 
  assign in_17bit_1_imag = calc_in[50:34];         // B (imag) 

  assign in_8bit_2_real  = rotation_factor2_real;  // rotation factor for C (real)
  assign in_8bit_2_imag  = rotation_factor2_imag;  // rotation factor for C (imag)
  assign in_17bit_2_real = calc_in[101:85];        // C (real) 
  assign in_17bit_2_imag = calc_in[84:68];         // C (imag) 

  assign in_8bit_3_real  = rotation_factor3_real;  // rotation factor for D (real)
  assign in_8bit_3_imag  = rotation_factor3_imag;  // rotation factor for D (imag)
  assign in_17bit_3_real = calc_in[135:119];       // D (real)  
  assign in_17bit_3_imag = calc_in[118:102];       // D (imag) 

//************************************************************************************************       

  assign temp_0_real = in_17bit_0_real[16]?{1'b1,~in_17bit_0_real[15:0]+1'b1}:{1'b0,in_17bit_0_real[15:0]}; // A real
  assign temp_0_imag = in_17bit_0_imag[16]?{1'b1,~in_17bit_0_imag[15:0]+1'b1}:{1'b0,in_17bit_0_imag[15:0]}; // A imag

  assign temp_1_real = temp_2_1_real - temp_2_2_real;  //B * W^P     real
  assign temp_1_imag = temp_2_1_imag + temp_2_2_imag;  //B * W^P     imag

  assign temp_2_real = temp_3_1_real - temp_3_2_real;  //C * W^{2p}  real
  assign temp_2_imag = temp_3_1_imag + temp_3_2_imag;  //C * W^{2p}  imag

  assign temp_3_real = temp_4_1_real - temp_4_2_real;  //D * W^{3P}  real
  assign temp_3_imag = temp_4_1_imag + temp_4_2_imag;  //D * W^{3P}  imag


  assign temp_0 = {temp_0_real, temp_0_imag};   // A
  assign temp_1 = {temp_1_real, temp_1_imag};  // B * Wp
  assign temp_2 = {temp_2_real, temp_2_imag};  // C * W2p
  assign temp_3 = {temp_3_real, temp_3_imag};  // D * W3p

//************************************************************************************************       

  assign out_0_real = temp_0_real + temp_1_real + temp_2_real + temp_3_real;
  assign out_0_imag = temp_0_imag + temp_1_imag + temp_2_imag + temp_3_imag;

  assign out_1_real = temp_0_real - temp_1_real + temp_2_real - temp_3_real;
  assign out_1_imag = temp_0_imag - temp_1_imag + temp_2_imag - temp_3_imag;

  assign out_2_real = temp_0_real - temp_1_imag - temp_2_real + temp_3_imag;
  assign out_2_imag = temp_0_imag + temp_1_real - temp_2_imag - temp_3_real;

  assign out_3_real = temp_0_real + temp_1_imag - temp_2_real - temp_3_imag;
  assign out_3_imag = temp_0_imag - temp_1_real - temp_2_imag + temp_3_real;

  assign out_3_real_out  =  out_3_real[16]?{1'b1,~out_3_real[15:0]+1'b1}:{1'b0,out_3_real[15:0]};
  assign out_3_imag_out  =  out_3_imag[16]?{1'b1,~out_3_imag[15:0]+1'b1}:{1'b0,out_3_imag[15:0]};
  assign out_2_real_out  =  out_2_real[16]?{1'b1,~out_2_real[15:0]+1'b1}:{1'b0,out_2_real[15:0]};
  assign out_2_imag_out  =  out_2_imag[16]?{1'b1,~out_2_imag[15:0]+1'b1}:{1'b0,out_2_imag[15:0]};
  assign out_1_real_out  =  out_1_real[16]?{1'b1,~out_1_real[15:0]+1'b1}:{1'b0,out_1_real[15:0]};
  assign out_1_imag_out  =  out_1_imag[16]?{1'b1,~out_1_imag[15:0]+1'b1}:{1'b0,out_1_imag[15:0]};
  assign out_0_real_out  =  out_0_real[16]?{1'b1,~out_0_real[15:0]+1'b1}:{1'b0,out_0_real[15:0]};
  assign out_0_imag_out  =  out_0_imag[16]?{1'b1,~out_0_imag[15:0]+1'b1}:{1'b0,out_0_imag[15:0]};



  assign calc_out = { out_2_real_out, out_2_imag_out, 
                      out_1_real_out, out_1_imag_out,
                      out_3_real_out, out_3_imag_out,
                      out_0_real_out, out_0_imag_out };
endmodule
