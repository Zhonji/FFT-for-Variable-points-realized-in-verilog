//****************************************************************************************************************************************
// `timescale 1ns/1ns
// module butterfly2(
//     input wire [67:0] butterfly2_in,
//     input wire [5:0] rotation,
//     output wire [67:0] butterfly2_out
// );
//     parameter para1111 = 8'b01111111;//√
//     parameter para0000 = 8'b00000000;//√
//     parameter para9988 = 8'b01111111;//√       //0.11111111101100010101101
//     parameter parn0491 = 8'b10000110;       //0.00001100100100011101
//     parameter para9952 = 8'b01111111;//√       //0.1111111011000101
//     parameter parn0980 = 8'b10001100;//√       //0.0001100100010110
//     parameter para9892 = 8'b01111110;       //0.1111110100111100
//     parameter parn1467 = 8'b10010010;       //0.001001011000111000100001100
//     parameter para9808 = 8'b01111101;//√       //0.1111101100010
//     parameter parn1951 = 8'b10011000;//√       //0.00110001111
//     parameter para9700 = 8'b01111100;       //0.1111100001010001111
//     parameter parn2430 = 8'b10011111;       //0.0011111000110
//     parameter para9569 = 8'b01111010;//√       //0.1111010011110111
//     parameter parn2903 = 8'b10100101;//√       //0.01001010010100
//     parameter para9415 = 8'b01111000;       //0.11110001000
//     parameter parn3369 = 8'b10101011;       //0.010101100011111
//     parameter para9239 = 8'b01110110;//√       //0.1110110010000100101
//     parameter parn3827 = 8'b10110001;//√      //0.0110000111111
//     parameter para9040 = 8'b01110011;       //0.11100111011
//     parameter parn4276 = 8'b10110110;       //0.01101101001111
//     parameter para8819 = 8'b01110000;//√       //0.1110000111
//     parameter parn4714 = 8'b10111100;//√       //0.01111000101011
//     parameter para8577 = 8'b01101101;       //0.11011011100
//     parameter parn5141 = 8'b11000001;       //0.1000001110011
//     parameter para8315 = 8'b01101010;//√       //0.11010100110
//     parameter parn5556 = 8'b11000111;//√       //0.1000111000111
//     parameter para8032 = 8'b01100110;       //0.110011011
//     parameter parn5957 = 8'b11001100;       //0.1001100001
//     parameter para7730 = 8'b01100010;//√       //0.110001011110
//     parameter parn6344 = 8'b11010001;//√       //0.101000100
//     parameter para7410 = 8'b01011110;       //0.10111101101100100
//     parameter parn6716 = 8'b11010101;       //0.101010111110
//     parameter para7071 = 8'b01011010;//√       //0.10110101000
//     parameter parn7071 = 8'b11011010;//√
//     parameter para6716 = 8'b01010101;
//     parameter parn7410 = 8'b11011110;
//     parameter para6344 = 8'b01010001;//√
//     parameter parn7730 = 8'b11100010;//√
//     parameter para5957 = 8'b01001100;
//     parameter parn8032 = 8'b11100110;
//     parameter para5556 = 8'b01000111;//√
//     parameter parn8315 = 8'b11101010;//√
//     parameter para5141 = 8'b01000001;
//     parameter parn8577 = 8'b11101101;
//     parameter para4714 = 8'b00111100;//√
//     parameter parn8819 = 8'b11110000;//√
//     parameter para4276 = 8'b00110110;       //0.011011010111011
//     parameter parn9040 = 8'b11110011;
//     parameter para3827 = 8'b00110001;//√
//     parameter parn9239 = 8'b11110110;//√
//     parameter para3369 = 8'b00101011;
//     parameter parn9415 = 8'b11111000;
//     parameter para2903 = 8'b00100101;//√
//     parameter parn9569 = 8'b11111010;//√
//     parameter para2430 = 8'b00011111;
//     parameter parn9700 = 8'b11111100;
//     parameter para1951 = 8'b00011000;//√
//     parameter parn9808 = 8'b11111101;//√
//     parameter para1467 = 8'b00010010;
//     parameter parn9892 = 8'b11111110;
//     parameter para0980 = 8'b00001100;//√
//     parameter parn9952 = 8'b11111111;//√
//     parameter para0491 = 8'b00000110;
//     parameter parn9988 = 8'b11111111;//√
//     parameter parn1111 = 8'b11111111;//√
 
// reg signed [7:0]rotation_real;
// reg signed [7:0]rotation_imag;

// wire signed [7:0] in_8bit_real;
// wire signed [7:0] in_8bit_imag;

// wire signed [16:0] in_17bit_0_real;
// wire signed [16:0] in_17bit_0_imag;
// wire signed [16:0] in_17bit_1_real;
// wire signed [16:0] in_17bit_1_imag;

// wire signed [33:0] temp_0, temp_1;
// wire signed [16:0] temp_0_real, temp_0_imag;
// wire signed [16:0] temp_1_real, temp_1_imag;

// wire signed [16:0] temp_1_1_real, temp_1_2_real, temp_1_1_imag, temp_1_2_imag;

// wire signed [16:0] out_0_real, out_0_imag;
// wire signed [16:0] out_1_real, out_1_imag;

// wire signed [16:0] out_0_real_out, out_0_imag_out;
// wire signed [16:0] out_1_real_out, out_1_imag_out;


// always@(rotation)
//     begin
//         case(rotation)
//             6'b000000: rotation_real = para1111;
//             6'b000001: rotation_real = para9988;
//             6'b000010: rotation_real = para9952;
//             6'b000011: rotation_real = para9892;
//             6'b000100: rotation_real = para9808;
//             6'b000101: rotation_real = para9700;
//             6'b000110: rotation_real = para9569;
//             6'b000111: rotation_real = para9415;
//             6'b001000: rotation_real = para9239;
//             6'b001001: rotation_real = para9040;
//             6'b001010: rotation_real = para8819;
//             6'b001011: rotation_real = para8577;
//             6'b001100: rotation_real = para8315;
//             6'b001101: rotation_real = para8032;
//             6'b001110: rotation_real = para7730;
//             6'b001111: rotation_real = para7410;
//             6'b010000: rotation_real = para7071;
//             6'b010001: rotation_real = para6716;
//             6'b010010: rotation_real = para6344;
//             6'b010011: rotation_real = para5957;
//             6'b010100: rotation_real = para5556;
//             6'b010101: rotation_real = para5141;
//             6'b010110: rotation_real = para4714;
//             6'b010111: rotation_real = para4276;
//             6'b011000: rotation_real = para3827;
//             6'b011001: rotation_real = para3369;
//             6'b011010: rotation_real = para2903;
//             6'b011011: rotation_real = para2430;
//             6'b011100: rotation_real = para1951;
//             6'b011101: rotation_real = para1467;
//             6'b011110: rotation_real = para0980;
//             6'b011111: rotation_real = para0491;
//             6'b100000: rotation_real = para0000;
//             6'b100001: rotation_real = parn0491;
//             6'b100010: rotation_real = parn0980;
//             6'b100011: rotation_real = parn1467;
//             6'b100100: rotation_real = parn1951;
//             6'b100101: rotation_real = parn2430;
//             6'b100110: rotation_real = parn2903;
//             6'b100111: rotation_real = parn3369;
//             6'b101000: rotation_real = parn3827;
//             6'b101001: rotation_real = parn4276;
//             6'b101010: rotation_real = parn4714;
//             6'b101011: rotation_real = parn5141;
//             6'b101100: rotation_real = parn5556;
//             6'b101101: rotation_real = parn5957;
//             6'b101110: rotation_real = parn6344;
//             6'b101111: rotation_real = parn6716;
//             6'b110000: rotation_real = parn7071;
//             6'b110001: rotation_real = parn7410;
//             6'b110010: rotation_real = parn7730;
//             6'b110011: rotation_real = parn8032;
//             6'b110100: rotation_real = parn8315;
//             6'b110101: rotation_real = parn8577;
//             6'b110110: rotation_real = parn8819;
//             6'b110111: rotation_real = parn9040;
//             6'b111000: rotation_real = parn9239;
//             6'b111001: rotation_real = parn9415;
//             6'b111010: rotation_real = parn9569;
//             6'b111011: rotation_real = parn9700;
//             6'b111100: rotation_real = parn9808;
//             6'b111101: rotation_real = parn9892;
//             6'b111110: rotation_real = parn9952;
//             6'b111111: rotation_real = parn9988;
//         endcase
//     end


//     always@(rotation)
//     begin
//         case(rotation)
//             6'b000000: rotation_imag = para0000;
//             6'b000001: rotation_imag = parn0491;
//             6'b000010: rotation_imag = parn0980;
//             6'b000011: rotation_imag = parn1467;
//             6'b000100: rotation_imag = parn1951;
//             6'b000101: rotation_imag = parn2430;
//             6'b000110: rotation_imag = parn2903;
//             6'b000111: rotation_imag = parn3369;
//             6'b001000: rotation_imag = parn3827;
//             6'b001001: rotation_imag = parn4276;
//             6'b001010: rotation_imag = parn4714;
//             6'b001011: rotation_imag = parn5141;
//             6'b001100: rotation_imag = parn5556;
//             6'b001101: rotation_imag = parn5957;
//             6'b001110: rotation_imag = parn6344;
//             6'b001111: rotation_imag = parn6716;
//             6'b010000: rotation_imag = parn7071;
//             6'b010001: rotation_imag = parn7410;
//             6'b010010: rotation_imag = parn7730;
//             6'b010011: rotation_imag = parn8032;
//             6'b010100: rotation_imag = parn8315;
//             6'b010101: rotation_imag = parn8577;
//             6'b010110: rotation_imag = parn8819;
//             6'b010111: rotation_imag = parn9040;
//             6'b011000: rotation_imag = parn9239;
//             6'b011001: rotation_imag = parn9415;
//             6'b011010: rotation_imag = parn9569;
//             6'b011011: rotation_imag = parn9700;
//             6'b011100: rotation_imag = parn9808;
//             6'b011101: rotation_imag = parn9892;
//             6'b011110: rotation_imag = parn9952;
//             6'b011111: rotation_imag = parn9988;
//             6'b100000: rotation_imag = parn1111;
//             6'b100001: rotation_imag = parn9988;
//             6'b100010: rotation_imag = parn9952;
//             6'b100011: rotation_imag = parn9892;
//             6'b100100: rotation_imag = parn9808;
//             6'b100101: rotation_imag = parn9700;
//             6'b100110: rotation_imag = parn9569;
//             6'b100111: rotation_imag = parn9415;
//             6'b101000: rotation_imag = parn9239;
//             6'b101001: rotation_imag = parn9040;
//             6'b101010: rotation_imag = parn8819;
//             6'b101011: rotation_imag = parn8577;
//             6'b101100: rotation_imag = parn8315;
//             6'b101101: rotation_imag = parn8032;
//             6'b101110: rotation_imag = parn7730;//46
//             6'b101111: rotation_imag = parn7410;
//             6'b110000: rotation_imag = parn7071;
//             6'b110001: rotation_imag = parn6716;
//             6'b110010: rotation_imag = parn6344;
//             6'b110011: rotation_imag = parn5957;
//             6'b110100: rotation_imag = parn5556;
//             6'b110101: rotation_imag = parn5141;
//             6'b110110: rotation_imag = parn4714;
//             6'b110111: rotation_imag = parn4276;
//             6'b111000: rotation_imag = parn3827;
//             6'b111001: rotation_imag = parn3369;
//             6'b111010: rotation_imag = parn2903;
//             6'b111011: rotation_imag = parn2430;
//             6'b111100: rotation_imag = parn1951;
//             6'b111101: rotation_imag = parn1467;
//             6'b111110: rotation_imag = parn0980;
//             6'b111111: rotation_imag = parn0491;
//         endcase
//     end
// //*******************************************************************
// multi16 inst0(
//     .in_17bit(in_17bit_1_real),
//     .in_8bit(in_8bit_real),
//     .out(temp_1_1_real)
// );

// multi16 inst1(
//     .in_17bit(in_17bit_1_imag),
//     .in_8bit(in_8bit_imag),
//     .out(temp_1_2_real)
// );

// multi16 inst2(
//     .in_17bit(in_17bit_1_real),
//     .in_8bit(in_8bit_imag),
//     .out(temp_1_1_imag)
// );

// multi16 inst3(
//     .in_17bit(in_17bit_1_imag),
//     .in_8bit(in_8bit_real),
//     .out(temp_1_2_imag)
// );
// //*******************************************************************
// assign in_8bit_real = rotation_real;
// assign in_8bit_imag = rotation_imag;

// assign in_17bit_0_imag = butterfly2_in[16:0];
// assign in_17bit_0_real = butterfly2_in[33:17];
// assign in_17bit_1_imag = butterfly2_in[50:34];
// assign in_17bit_1_real = butterfly2_in[67:51];

// assign temp_0_real = in_17bit_0_real[16]?{1'b1,~in_17bit_0_real[15:0]+1'b1}:{1'b0,in_17bit_0_real[15:0]};
// assign temp_0_imag = in_17bit_0_imag[16]?{1'b1,~in_17bit_0_imag[15:0]+1'b1}:{1'b0,in_17bit_0_imag[15:0]};

// assign temp_1_real = temp_1_1_real - temp_1_2_real;
// assign temp_1_imag = temp_1_1_imag + temp_1_2_imag;

// assign temp_0 = {temp_0_real,temp_0_imag};
// assign temp_1 = {temp_1_real,temp_1_imag};

// assign out_0_real = temp_0_real + temp_1_real;
// assign out_0_imag = temp_0_imag + temp_1_imag;
// assign out_1_real = temp_0_real - temp_1_real;
// assign out_1_imag = temp_0_imag - temp_1_imag;

// assign out_0_real_out = out_0_real[16]?{1'b1,~out_0_real[15:0]+1'b1}:{1'b0,out_0_real[15:0]};
// assign out_0_imag_out = out_0_imag[16]?{1'b1,~out_0_imag[15:0]+1'b1}:{1'b0,out_0_imag[15:0]};
// assign out_1_real_out = out_1_real[16]?{1'b1,~out_1_real[15:0]+1'b1}:{1'b0,out_1_real[15:0]};
// assign out_1_imag_out = out_1_imag[16]?{1'b1,~out_1_imag[15:0]+1'b1}:{1'b0,out_1_imag[15:0]};

// assign butterfly2_out = {out_1_real_out, out_1_imag_out,
//                          out_0_real_out, out_0_imag_out};



// endmodule
//****************************************************************************************************************************************
`timescale 1ns/1ns
module butterfly2(
    input wire [67:0] butterfly2_in,
    input wire [6:0] rotation,
    output wire [67:0] butterfly2_out
);
    parameter para1111 = 8'b01111111;//√
    parameter para0000 = 8'b00000000;//√
    parameter para9988 = 8'b01111111;//√       //0.11111111101100010101101
    parameter parn0491 = 8'b10000110;       //0.00001100100100011101
    parameter para9952 = 8'b01111111;//√       //0.1111111011000101
    parameter parn0980 = 8'b10001100;//√       //0.0001100100010110
    parameter para9892 = 8'b01111110;       //0.1111110100111100
    parameter parn1467 = 8'b10010010;       //0.001001011000111000100001100
    parameter para9808 = 8'b01111101;//√       //0.1111101100010
    parameter parn1951 = 8'b10011000;//√       //0.00110001111
    parameter para9700 = 8'b01111100;       //0.1111100001010001111
    parameter parn2430 = 8'b10011111;       //0.0011111000110
    parameter para9569 = 8'b01111010;//√       //0.1111010011110111
    parameter parn2903 = 8'b10100101;//√       //0.01001010010100
    parameter para9415 = 8'b01111000;       //0.11110001000
    parameter parn3369 = 8'b10101011;       //0.010101100011111
    parameter para9239 = 8'b01110110;//√       //0.1110110010000100101
    parameter parn3827 = 8'b10110001;//√      //0.0110000111111
    parameter para9040 = 8'b01110011;       //0.11100111011
    parameter parn4276 = 8'b10110110;       //0.01101101001111
    parameter para8819 = 8'b01110000;//√       //0.1110000111
    parameter parn4714 = 8'b10111100;//√       //0.01111000101011
    parameter para8577 = 8'b01101101;       //0.11011011100
    parameter parn5141 = 8'b11000001;       //0.1000001110011
    parameter para8315 = 8'b01101010;//√       //0.11010100110
    parameter parn5556 = 8'b11000111;//√       //0.1000111000111
    parameter para8032 = 8'b01100110;       //0.110011011
    parameter parn5957 = 8'b11001100;       //0.1001100001
    parameter para7730 = 8'b01100010;//√       //0.110001011110
    parameter parn6344 = 8'b11010001;//√       //0.101000100
    parameter para7410 = 8'b01011110;       //0.10111101101100100
    parameter parn6716 = 8'b11010101;       //0.101010111110
    parameter para7071 = 8'b01011010;//√       //0.10110101000
    parameter parn7071 = 8'b11011010;//√
    parameter para6716 = 8'b01010101;
    parameter parn7410 = 8'b11011110;
    parameter para6344 = 8'b01010001;//√
    parameter parn7730 = 8'b11100010;//√
    parameter para5957 = 8'b01001100;
    parameter parn8032 = 8'b11100110;
    parameter para5556 = 8'b01000111;//√
    parameter parn8315 = 8'b11101010;//√
    parameter para5141 = 8'b01000001;
    parameter parn8577 = 8'b11101101;
    parameter para4714 = 8'b00111100;//√
    parameter parn8819 = 8'b11110000;//√
    parameter para4276 = 8'b00110110;       //0.011011010111011
    parameter parn9040 = 8'b11110011;
    parameter para3827 = 8'b00110001;//√
    parameter parn9239 = 8'b11110110;//√
    parameter para3369 = 8'b00101011;
    parameter parn9415 = 8'b11111000;
    parameter para2903 = 8'b00100101;//√
    parameter parn9569 = 8'b11111010;//√
    parameter para2430 = 8'b00011111;
    parameter parn9700 = 8'b11111100;
    parameter para1951 = 8'b00011000;//√
    parameter parn9808 = 8'b11111101;//√
    parameter para1467 = 8'b00010010;
    parameter parn9892 = 8'b11111110;
    parameter para0980 = 8'b00001100;//√
    parameter parn9952 = 8'b11111111;//√
    parameter para0491 = 8'b00000110;
    parameter parn9988 = 8'b11111111;//√
    parameter parn1111 = 8'b11111111;//√
//************************************************************************************************************
//W256^1、W256^3、W256^5、W256^7、W256^9、W256^11、W256^13、W256^15、W256^17、W256^19、W256^21、W256^23、
//W256^25、W256^27、W256^29、W256^31、W256^33、W256^35、W256^37、W256^39、W256^41、W256^43、W256^45、
//W256^47、W256^49、W256^51、W256^53、W256^55、W256^57、W256^59、W256^61、W256^63、W256^65、W256^67、
//W256^69、W256^71、W256^73、W256^75、W256^77、W256^79、W256^81、W256^83、W256^85、W256^87、W256^89、
//W256^91、W256^93、W256^95、W256^97、W256^99、W256^101、W256^103、W256^105、W256^107、W256^109、W256^111、
//W256^113、W256^115、W256^117、W256^119、W256^121、W256^123、W256^125、W256^127、
    parameter para9997 = 8'b01111111;//0.11111111111011
    parameter parn0245 = 8'b10000011;//0.00000110010
    parameter para9973 = 8'b01111111;//0.1111111101001
    parameter parn0736 = 8'b10001001;//0.00010010110
    parameter para9925 = 8'b01111111;//0.11111110000
    parameter parn1224 = 8'b10001111;//0.00011111010
    parameter para9853 = 8'b01111110;//0.1111110000
    parameter parn1710 = 8'b10010101;//0.001010111100
    parameter para9757 = 8'b01111100;//0.1111100111
    parameter parn2191 = 8'b10011100;//0.00111000000101
    parameter para9638 = 8'b01111011;//0.11110110101
    parameter parn2667 = 8'b10100010;//0.010001000
    parameter para9495 = 8'b01111001;//0.111100110
    parameter parn3137 = 8'b10101000;//0.0101000001001
    parameter para9330 = 8'b01110111;//0.11101110
    parameter parn3599 = 8'b10101110;//0.010111000
    parameter para9142 = 8'b01110101;//0.1110101000001001
    parameter parn4052 = 8'b10110011;//0.01100111101
    parameter para8932 = 8'b01110010;//0.111001001
    parameter parn4496 = 8'b10111001;//0.0111001100011
    parameter para8701 = 8'b01101111;//0.11011110101111101
    parameter parn4929 = 8'b10111111;//0.01111110
    parameter para8449 = 8'b01101100;//0.11011000010010110
    parameter parn5350 = 8'b11000100;//0.100010001
    parameter para8176 = 8'b01101000;//0.110100010100111
    parameter parn5758 = 8'b11001001;//0.10010011011
    parameter para7883 = 8'b01100100;//0.1100100111
    parameter parn6152 = 8'b11001110;//0.10011101
    parameter para7572 = 8'b01100000;//0.1100000111
    parameter parn6532 = 8'b11010011;//0.1010011100
    parameter para7242 = 8'b01011100;//0.10111001011001
    parameter parn6895 = 8'b11011000;//0.10110000100
    parameter para6895 = 8'b01011000;
    parameter parn7242 = 8'b11011100;
    parameter para6532 = 8'b01010011;
    parameter parn7572 = 8'b11100000;
    parameter para6152 = 8'b01001110;
    parameter parn7883 = 8'b11100100;
    parameter para5758 = 8'b01001001;
    parameter parn8176 = 8'b11101000;
    parameter para5350 = 8'b01000100;
    parameter parn8449 = 8'b11101100;
    parameter para4942 = 8'b00111111;
    parameter parn8701 = 8'b11101111;
    parameter para4496 = 8'b00111001;
    parameter parn8932 = 8'b11110010;
    parameter para4052 = 8'b00110011;
    parameter parn9142 = 8'b11110101;
    parameter para3599 = 8'b00101110;
    parameter parn9330 = 8'b11110111;
    parameter para3137 = 8'b00101000;
    parameter parn9495 = 8'b11111001;
    parameter para2667 = 8'b00100010;
    parameter parn9638 = 8'b11111011;
    parameter para2191 = 8'b00011100;
    parameter parn9757 = 8'b11111100;
    parameter para1710 = 8'b00010101;
    parameter parn9853 = 8'b11111110;
    parameter para1224 = 8'b00001111;
    parameter parn9925 = 8'b11111111;
    parameter para0736 = 8'b00001001;
    parameter parn9973 = 8'b11111111;
    parameter para0245 = 8'b00000011;
    parameter parn9997 = 8'b11111111;
    parameter para4929 = 8'b00111111;





//************************************************************************************************************
reg signed [7:0]rotation_real;
reg signed [7:0]rotation_imag;

wire signed [7:0] in_8bit_real;
wire signed [7:0] in_8bit_imag;

wire signed [16:0] in_17bit_0_real;
wire signed [16:0] in_17bit_0_imag;
wire signed [16:0] in_17bit_1_real;
wire signed [16:0] in_17bit_1_imag;

wire signed [33:0] temp_0, temp_1;
wire signed [16:0] temp_0_real, temp_0_imag;
wire signed [16:0] temp_1_real, temp_1_imag;

wire signed [16:0] temp_1_1_real, temp_1_2_real, temp_1_1_imag, temp_1_2_imag;

wire signed [16:0] out_0_real, out_0_imag;
wire signed [16:0] out_1_real, out_1_imag;

wire signed [16:0] out_0_real_out, out_0_imag_out;
wire signed [16:0] out_1_real_out, out_1_imag_out;


always@(rotation)
    begin
        case(rotation)
            7'b0000000: rotation_real = para1111;
            7'b0000001: rotation_real = para9997;
            7'b0000010: rotation_real = para9988;
            7'b0000011: rotation_real = para9973;
            7'b0000100: rotation_real = para9952;
            7'b0000101: rotation_real = para9925;
            7'b0000110: rotation_real = para9892;
            7'b0000111: rotation_real = para9853;
            7'b0001000: rotation_real = para9808;
            7'b0001001: rotation_real = para9757;
            7'b0001010: rotation_real = para9700;
            7'b0001011: rotation_real = para9638;
            7'b0001100: rotation_real = para9569;
            7'b0001101: rotation_real = para9495;
            7'b0001110: rotation_real = para9415;
            7'b0001111: rotation_real = para9330;
            7'b0010000: rotation_real = para9239;
            7'b0010001: rotation_real = para9142;
            7'b0010010: rotation_real = para9040;
            7'b0010011: rotation_real = para8932;
            7'b0010100: rotation_real = para8819;
            7'b0010101: rotation_real = para8701;
            7'b0010110: rotation_real = para8577;
            7'b0010111: rotation_real = para8449;
            7'b0011000: rotation_real = para8315;
            7'b0011001: rotation_real = para8176;
            7'b0011010: rotation_real = para8032;
            7'b0011011: rotation_real = para7883;
            7'b0011100: rotation_real = para7730;
            7'b0011101: rotation_real = para7572;
            7'b0011110: rotation_real = para7410;
            7'b0011111: rotation_real = para7242;
            7'b0100000: rotation_real = para7071;
            7'b0100001: rotation_real = para6895;
            7'b0100010: rotation_real = para6716;
            7'b0100011: rotation_real = para6532;
            7'b0100100: rotation_real = para6344;
            7'b0100101: rotation_real = para6152;
            7'b0100110: rotation_real = para5957;
            7'b0100111: rotation_real = para5758;
            7'b0101000: rotation_real = para5556;
            7'b0101001: rotation_real = para5350;
            7'b0101010: rotation_real = para5141;
            7'b0101011: rotation_real = para4929;
            7'b0101100: rotation_real = para4714;
            7'b0101101: rotation_real = para4496;
            7'b0101110: rotation_real = para4276;
            7'b0101111: rotation_real = para4052;
            7'b0110000: rotation_real = para3827;
            7'b0110001: rotation_real = para3599;
            7'b0110010: rotation_real = para3369;
            7'b0110011: rotation_real = para3137;
            7'b0110100: rotation_real = para2903;
            7'b0110101: rotation_real = para2667;
            7'b0110110: rotation_real = para2430;
            7'b0110111: rotation_real = para2191;
            7'b0111000: rotation_real = para1951;
            7'b0111001: rotation_real = para1710;
            7'b0111010: rotation_real = para1467;
            7'b0111011: rotation_real = para1224;
            7'b0111100: rotation_real = para0980;
            7'b0111101: rotation_real = para0736;
            7'b0111110: rotation_real = para0491;
            7'b0111111: rotation_real = para0245;
            7'b1000000: rotation_real = para0000;
            7'b1000001: rotation_real = parn0245;
            7'b1000010: rotation_real = parn0491;
            7'b1000011: rotation_real = parn0736;
            7'b1000100: rotation_real = parn0980;
            7'b1000101: rotation_real = parn1224;
            7'b1000110: rotation_real = parn1467;
            7'b1000111: rotation_real = parn1710;
            7'b1001000: rotation_real = parn1951;
            7'b1001001: rotation_real = parn2191;
            7'b1001010: rotation_real = parn2430;
            7'b1001011: rotation_real = parn2667;
            7'b1001100: rotation_real = parn2903;
            7'b1001101: rotation_real = parn3137;
            7'b1001110: rotation_real = parn3369;
            7'b1001111: rotation_real = parn3599;
            7'b1010000: rotation_real = parn3827;
            7'b1010001: rotation_real = parn4052;//81
            7'b1010010: rotation_real = parn4276;
            7'b1010011: rotation_real = parn4496;
            7'b1010100: rotation_real = parn4714;
            7'b1010101: rotation_real = parn4929;
            7'b1010110: rotation_real = parn5141;
            7'b1010111: rotation_real = parn5350;
            7'b1011000: rotation_real = parn5556;
            7'b1011001: rotation_real = parn5758;
            7'b1011010: rotation_real = parn5957;
            7'b1011011: rotation_real = parn6152;
            7'b1011100: rotation_real = parn6344;
            7'b1011101: rotation_real = parn6532;
            7'b1011110: rotation_real = parn6716;
            7'b1011111: rotation_real = parn6895;
            7'b1100000: rotation_real = parn7071;
            7'b1100001: rotation_real = parn7242;
            7'b1100010: rotation_real = parn7410;
            7'b1100011: rotation_real = parn7572;
            7'b1100100: rotation_real = parn7730;
            7'b1100101: rotation_real = parn7883;
            7'b1100110: rotation_real = parn8032;
            7'b1100111: rotation_real = parn8176;
            7'b1101000: rotation_real = parn8315;
            7'b1101001: rotation_real = parn8449;
            7'b1101010: rotation_real = parn8577;
            7'b1101011: rotation_real = parn8701;
            7'b1101100: rotation_real = parn8819;
            7'b1101101: rotation_real = parn8932;
            7'b1101110: rotation_real = parn9040;
            7'b1101111: rotation_real = parn9142;
            7'b1110000: rotation_real = parn9239;
            7'b1110001: rotation_real = parn9330;
            7'b1110010: rotation_real = parn9415;
            7'b1110011: rotation_real = parn9495;
            7'b1110100: rotation_real = parn9569;
            7'b1110101: rotation_real = parn9638;
            7'b1110110: rotation_real = parn9700;
            7'b1110111: rotation_real = parn9757;
            7'b1111000: rotation_real = parn9808;
            7'b1111001: rotation_real = parn9853;
            7'b1111010: rotation_real = parn9892;
            7'b1111011: rotation_real = parn9925;
            7'b1111100: rotation_real = parn9952;
            7'b1111101: rotation_real = parn9973;
            7'b1111110: rotation_real = parn9988;
            7'b1111111: rotation_real = parn9997;
        endcase
    end


    always@(rotation)
    begin
        case(rotation)
            7'b0000000: rotation_imag = para0000;
            7'b0000001: rotation_imag = parn0245;
            7'b0000010: rotation_imag = parn0491;
            7'b0000011: rotation_imag = parn0736;
            7'b0000100: rotation_imag = parn0980;
            7'b0000101: rotation_imag = parn1224;
            7'b0000110: rotation_imag = parn1467;
            7'b0000111: rotation_imag = parn1710;
            7'b0001000: rotation_imag = parn1951;
            7'b0001001: rotation_imag = parn2191;
            7'b0001010: rotation_imag = parn2430;
            7'b0001011: rotation_imag = parn2667;
            7'b0001100: rotation_imag = parn2903;
            7'b0001101: rotation_imag = parn3137;
            7'b0001110: rotation_imag = parn3369;
            7'b0001111: rotation_imag = parn3599;
            7'b0010000: rotation_imag = parn3827;
            7'b0010001: rotation_imag = parn4052;
            7'b0010010: rotation_imag = parn4276;
            7'b0010011: rotation_imag = parn4496;
            7'b0010100: rotation_imag = parn4714;
            7'b0010101: rotation_imag = parn4929;
            7'b0010110: rotation_imag = parn5141;
            7'b0010111: rotation_imag = parn5350;
            7'b0011000: rotation_imag = parn5556;
            7'b0011001: rotation_imag = parn5758;
            7'b0011010: rotation_imag = parn5957;
            7'b0011011: rotation_imag = parn6152;
            7'b0011100: rotation_imag = parn6344;
            7'b0011101: rotation_imag = parn6532;
            7'b0011110: rotation_imag = parn6716;
            7'b0011111: rotation_imag = parn6895;
            7'b0100000: rotation_imag = parn7071;
            7'b0100001: rotation_imag = parn7242;
            7'b0100010: rotation_imag = parn7410;
            7'b0100011: rotation_imag = parn7572;
            7'b0100100: rotation_imag = parn7730;
            7'b0100101: rotation_imag = parn7883;
            7'b0100110: rotation_imag = parn8032;
            7'b0100111: rotation_imag = parn8176;
            7'b0101000: rotation_imag = parn8315;
            7'b0101001: rotation_imag = parn8449;
            7'b0101010: rotation_imag = parn8577;
            7'b0101011: rotation_imag = parn8701;
            7'b0101100: rotation_imag = parn8819;
            7'b0101101: rotation_imag = parn8932;
            7'b0101110: rotation_imag = parn9040;
            7'b0101111: rotation_imag = parn9142;
            7'b0110000: rotation_imag = parn9239;
            7'b0110001: rotation_imag = parn9330;
            7'b0110010: rotation_imag = parn9415;
            7'b0110011: rotation_imag = parn9495;
            7'b0110100: rotation_imag = parn9569;
            7'b0110101: rotation_imag = parn9638;
            7'b0110110: rotation_imag = parn9700;
            7'b0110111: rotation_imag = parn9757;
            7'b0111000: rotation_imag = parn9808;
            7'b0111001: rotation_imag = parn9853;
            7'b0111010: rotation_imag = parn9892;
            7'b0111011: rotation_imag = parn9925;
            7'b0111100: rotation_imag = parn9952;
            7'b0111101: rotation_imag = parn9973;
            7'b0111110: rotation_imag = parn9988;
            7'b0111111: rotation_imag = parn9997;
            7'b1000000: rotation_imag = parn1111;
            7'b1000001: rotation_imag = parn9997;
            7'b1000010: rotation_imag = parn9988;
            7'b1000011: rotation_imag = parn9973;
            7'b1000100: rotation_imag = parn9952;
            7'b1000101: rotation_imag = parn9925;
            7'b1000110: rotation_imag = parn9892;
            7'b1000111: rotation_imag = parn9853;
            7'b1001000: rotation_imag = parn9808;
            7'b1001001: rotation_imag = parn9757;
            7'b1001010: rotation_imag = parn9700;
            7'b1001011: rotation_imag = parn9638;
            7'b1001100: rotation_imag = parn9569;
            7'b1001101: rotation_imag = parn9495;
            7'b1001110: rotation_imag = parn9415;
            7'b1001111: rotation_imag = parn9330;
            7'b1010000: rotation_imag = parn9239;
            7'b1010001: rotation_imag = parn9142;
            7'b1010010: rotation_imag = parn9040;
            7'b1010011: rotation_imag = parn8932;
            7'b1010100: rotation_imag = parn8819;
            7'b1010101: rotation_imag = parn8701;
            7'b1010110: rotation_imag = parn8577;
            7'b1010111: rotation_imag = parn8449;
            7'b1011000: rotation_imag = parn8315;
            7'b1011001: rotation_imag = parn8176;
            7'b1011010: rotation_imag = parn8032;
            7'b1011011: rotation_imag = parn7883;
            7'b1011100: rotation_imag = parn7730;//46
            7'b1011101: rotation_imag = parn7572;
            7'b1011110: rotation_imag = parn7410;
            7'b1011111: rotation_imag = parn7242;
            7'b1100000: rotation_imag = parn7071;
            7'b1100001: rotation_imag = parn6895;
            7'b1100010: rotation_imag = parn6716;
            7'b1100011: rotation_imag = parn6532;
            7'b1100100: rotation_imag = parn6344;
            7'b1100101: rotation_imag = parn6152;
            7'b1100110: rotation_imag = parn5957;
            7'b1100111: rotation_imag = parn5758;
            7'b1101000: rotation_imag = parn5556;
            7'b1101001: rotation_imag = parn5350;
            7'b1101010: rotation_imag = parn5141;
            7'b1101011: rotation_imag = parn4929;
            7'b1101100: rotation_imag = parn4714;
            7'b1101101: rotation_imag = parn4496;
            7'b1101110: rotation_imag = parn4276;
            7'b1101111: rotation_imag = parn4052;
            7'b1110000: rotation_imag = parn3827;
            7'b1110001: rotation_imag = parn3599;
            7'b1110010: rotation_imag = parn3369;
            7'b1110011: rotation_imag = parn3137;
            7'b1110100: rotation_imag = parn2903;
            7'b1110101: rotation_imag = parn2667;
            7'b1110110: rotation_imag = parn2430;
            7'b1110111: rotation_imag = parn2191;
            7'b1111000: rotation_imag = parn1951;
            7'b1111001: rotation_imag = parn1710;
            7'b1111010: rotation_imag = parn1467;
            7'b1111011: rotation_imag = parn1224;
            7'b1111100: rotation_imag = parn0980;
            7'b1111101: rotation_imag = parn0736;
            7'b1111110: rotation_imag = parn0491;
            7'b1111111: rotation_imag = parn0245;
        endcase
    end
//*******************************************************************
multi16 inst0(
    .in_17bit(in_17bit_1_real),
    .in_8bit(in_8bit_real),
    .out(temp_1_1_real)
);

multi16 inst1(
    .in_17bit(in_17bit_1_imag),
    .in_8bit(in_8bit_imag),
    .out(temp_1_2_real)
);

multi16 inst2(
    .in_17bit(in_17bit_1_real),
    .in_8bit(in_8bit_imag),
    .out(temp_1_1_imag)
);

multi16 inst3(
    .in_17bit(in_17bit_1_imag),
    .in_8bit(in_8bit_real),
    .out(temp_1_2_imag)
);
//*******************************************************************
assign in_8bit_real = rotation_real;
assign in_8bit_imag = rotation_imag;

assign in_17bit_0_imag = butterfly2_in[16:0];
assign in_17bit_0_real = butterfly2_in[33:17];
assign in_17bit_1_imag = butterfly2_in[50:34];
assign in_17bit_1_real = butterfly2_in[67:51];

assign temp_0_real = in_17bit_0_real[16]?{1'b1,~in_17bit_0_real[15:0]+1'b1}:{1'b0,in_17bit_0_real[15:0]};
assign temp_0_imag = in_17bit_0_imag[16]?{1'b1,~in_17bit_0_imag[15:0]+1'b1}:{1'b0,in_17bit_0_imag[15:0]};

assign temp_1_real = temp_1_1_real - temp_1_2_real;
assign temp_1_imag = temp_1_1_imag + temp_1_2_imag;

assign temp_0 = {temp_0_real,temp_0_imag};
assign temp_1 = {temp_1_real,temp_1_imag};

assign out_0_real = temp_0_real + temp_1_real;
assign out_0_imag = temp_0_imag + temp_1_imag;
assign out_1_real = temp_0_real - temp_1_real;
assign out_1_imag = temp_0_imag - temp_1_imag;

assign out_0_real_out = out_0_real[16]?{1'b1,~out_0_real[15:0]+1'b1}:{1'b0,out_0_real[15:0]};
assign out_0_imag_out = out_0_imag[16]?{1'b1,~out_0_imag[15:0]+1'b1}:{1'b0,out_0_imag[15:0]};
assign out_1_real_out = out_1_real[16]?{1'b1,~out_1_real[15:0]+1'b1}:{1'b0,out_1_real[15:0]};
assign out_1_imag_out = out_1_imag[16]?{1'b1,~out_1_imag[15:0]+1'b1}:{1'b0,out_1_imag[15:0]};

assign butterfly2_out = {out_1_real_out, out_1_imag_out,
                         out_0_real_out, out_0_imag_out};



endmodule