//***********************************************************************************************************
// `timescale 1ns/1ns
// module multi16(

//   input  wire [16:0] in_17bit,  // 17-bit input  data
//   input  wire [7:0]  in_8bit,   // 8-bit  input  data
//   output wire [16:0] out        // 17-bit output data
  
//   );

//   wire        flag;             // determine the sign of the product
//   wire [16:0] in_17bit_b;       // store 17-bit true form data
//   wire [7:0]  in_8bit_b;        // store 8-bit  true form data
//   wire [24:0] mul;
//   wire [16:0] mul_b;
//   reg  [24:0] neg_mul;
//   wire  [15:0] in_16bit;
// //**************************** The following are assign statements ****************************
//   assign in_17bit_b = in_17bit;

//   assign  in_16bit = in_17bit_b[15:0];

//   always @ ( in_17bit or in_8bit ) begin
//     case ( in_8bit )
//         8'b00000000: neg_mul = 25'b0;
//         8'b00110001: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 4 ) + ( in_16bit << 5 );
//         8'b10110001: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 4 ) + ( in_16bit << 5 );
//         8'b01011010: neg_mul = ( in_16bit << 1 ) + ( in_16bit << 3 ) + ( in_16bit << 4 ) + ( in_16bit << 6 );
//         8'b11011010: neg_mul = ( in_16bit << 1 ) + ( in_16bit << 3 ) + ( in_16bit << 4 ) + ( in_16bit << 6 );
//         8'b01110110: neg_mul = ( in_16bit << 1 ) + ( in_16bit << 2 ) + ( in_16bit << 4 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
//         8'b11110110: neg_mul = ( in_16bit << 1 ) + ( in_16bit << 2 ) + ( in_16bit << 4 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
//         8'b01111111: neg_mul = ( in_16bit << 7 );
//         8'b11111111: neg_mul = ( in_16bit << 7 );
//         8'b10001100: neg_mul = ( in_16bit << 2 ) + ( in_16bit << 3 );
//         8'b01111101: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 2 ) + ( in_16bit << 3 ) + ( in_16bit << 4 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
//         8'b10011000: neg_mul = ( in_16bit << 3 ) + ( in_16bit << 4 );
//         8'b01111010: neg_mul = ( in_16bit << 1 ) + ( in_16bit << 3 ) + ( in_16bit << 4 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
//         8'b10100101: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 2 ) + ( in_16bit << 5 );
//         8'b01110000: neg_mul = ( in_16bit << 4 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
//         8'b10111100: neg_mul = ( in_16bit << 2 ) + ( in_16bit << 3 ) + ( in_16bit << 4 ) + ( in_16bit << 5 );
//         8'b01101010: neg_mul = ( in_16bit << 1 ) + ( in_16bit << 3 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
//         8'b11000111: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 1 ) + ( in_16bit << 2 ) + ( in_16bit << 6 );
//         8'b01100010: neg_mul = ( in_16bit << 1 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
//         8'b01010001: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 4 ) + ( in_16bit << 6 );
//         8'b11010001: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 4 ) + ( in_16bit << 6 );
//         8'b11100010: neg_mul = ( in_16bit << 1 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
//         8'b01000111: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 1 ) + ( in_16bit << 2 ) + ( in_16bit << 6 );
//         8'b11101010: neg_mul = ( in_16bit << 1 ) + ( in_16bit << 3 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
//         8'b00111100: neg_mul = ( in_16bit << 2 ) + ( in_16bit << 3 ) + ( in_16bit << 4 ) + ( in_16bit << 5 );
//         8'b11110000: neg_mul = ( in_16bit << 4 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
//         8'b00100101: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 2 ) + ( in_16bit << 5 );
//         8'b11111010: neg_mul = ( in_16bit << 1 ) + ( in_16bit << 3 ) + ( in_16bit << 4 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
//         8'b00011000: neg_mul = ( in_16bit << 3 ) + ( in_16bit << 4 );
//         8'b11111101: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 2 ) + ( in_16bit << 3 ) + ( in_16bit << 4 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
//         8'b00001100: neg_mul = ( in_16bit << 3 ) + ( in_16bit << 4 );
//         8'b10000110: neg_mul = ( in_16bit << 1 ) + ( in_16bit << 2 );
//         8'b01111110: neg_mul = ( in_16bit << 1 ) + ( in_16bit << 2 ) + ( in_16bit << 3 ) + ( in_16bit << 4 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
//         8'b10010010: neg_mul = ( in_16bit << 1 ) + ( in_16bit << 4 );
//         8'b01111100: neg_mul = ( in_16bit << 2 ) + ( in_16bit << 3 ) + ( in_16bit << 4 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
//         8'b10011111: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 1 ) + ( in_16bit << 2 ) + ( in_16bit << 3 ) + ( in_16bit << 4 );
//         8'b01111000: neg_mul = ( in_16bit << 3 ) + ( in_16bit << 4 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
//         8'b10101011: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 1 ) + ( in_16bit << 3 ) + ( in_16bit << 5 );
//         8'b01110011: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 1 ) + ( in_16bit << 4 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
//         8'b10110110: neg_mul = ( in_16bit << 1 ) + ( in_16bit << 2 ) + ( in_16bit << 4 ) + ( in_16bit << 5 );
//         8'b01101101: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 2 ) + ( in_16bit << 3 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
//         8'b11000001: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 6 );
//         8'b01100110: neg_mul = ( in_16bit << 1 ) + ( in_16bit << 2 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
//         8'b11001100: neg_mul = ( in_16bit << 2 ) + ( in_16bit << 3 ) + ( in_16bit << 6 );
//         8'b01011110: neg_mul = ( in_16bit << 1 ) + ( in_16bit << 2 ) + ( in_16bit << 3 ) + ( in_16bit << 4 ) + ( in_16bit << 6 );
//         8'b11010101: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 2 ) + ( in_16bit << 4 ) + ( in_16bit << 6 );
//         8'b01010101: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 2 ) + ( in_16bit << 4 ) + ( in_16bit << 6 );
//         8'b11011110: neg_mul = ( in_16bit << 1 ) + ( in_16bit << 2 ) + ( in_16bit << 3 ) + ( in_16bit << 4 ) + ( in_16bit << 6 );
//         8'b01001100: neg_mul = ( in_16bit << 2 ) + ( in_16bit << 3 ) + ( in_16bit << 6 );
//         8'b11100110: neg_mul = ( in_16bit << 1 ) + ( in_16bit << 2 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
//         8'b01000001: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 6 );
//         8'b11101101: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 2 ) + ( in_16bit << 3 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
//         8'b00110110: neg_mul = ( in_16bit << 1 ) + ( in_16bit << 2 ) + ( in_16bit << 4 ) + ( in_16bit << 5 );
//         8'b11110011: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 1 ) + ( in_16bit << 4 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
//         8'b00101011: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 1 ) + ( in_16bit << 3 ) + ( in_16bit << 5 );
//         8'b11111000: neg_mul = ( in_16bit << 3 ) + ( in_16bit << 4 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
//         8'b00011111: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 1 ) + ( in_16bit << 2 ) + ( in_16bit << 3 ) + ( in_16bit << 4 );
//         8'b11111100: neg_mul = ( in_16bit << 2 ) + ( in_16bit << 3 ) + ( in_16bit << 4 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
//         8'b00010010: neg_mul = ( in_16bit << 1 ) + ( in_16bit << 4 );
//         8'b11111110: neg_mul = ( in_16bit << 1 ) + ( in_16bit << 2 ) + ( in_16bit << 3 ) + ( in_16bit << 4 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
//         8'b00000110: neg_mul = ( in_16bit << 1 ) + ( in_16bit << 2 );
//     endcase
//   end
// assign mul = neg_mul;
// assign mul_b={mul[22:15], mul[14:7]};
// assign flag = in_17bit[16] + in_8bit[7];
// assign out = flag?{1'b1,~mul_b+1'b1}:{1'b0,mul_b};
  
// endmodule

//***********************************************************************************************************

`timescale 1ns/1ns
module multi16(

  input  wire [16:0] in_17bit,  // 17-bit input  data
  input  wire [7:0]  in_8bit,   // 8-bit  input  data
  output wire [16:0] out        // 17-bit output data
  
  );

  wire        flag;             // determine the sign of the product
  wire [16:0] in_17bit_b;       // store 17-bit true form data
  wire [7:0]  in_8bit_b;        // store 8-bit  true form data
  wire [24:0] mul;
  wire [16:0] mul_b;
  reg  [24:0] neg_mul;
  wire  [15:0] in_16bit;
//**************************** The following are assign statements ****************************
  assign in_17bit_b = in_17bit;

  assign  in_16bit = in_17bit_b[15:0];

  always @ ( in_17bit or in_8bit ) begin
    case ( in_8bit )
        8'b00000000: neg_mul = 25'b0;
        8'b00110001: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 4 ) + ( in_16bit << 5 );
        8'b10110001: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 4 ) + ( in_16bit << 5 );
        8'b01011010: neg_mul = ( in_16bit << 1 ) + ( in_16bit << 3 ) + ( in_16bit << 4 ) + ( in_16bit << 6 );
        8'b11011010: neg_mul = ( in_16bit << 1 ) + ( in_16bit << 3 ) + ( in_16bit << 4 ) + ( in_16bit << 6 );
        8'b01110110: neg_mul = ( in_16bit << 1 ) + ( in_16bit << 2 ) + ( in_16bit << 4 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
        8'b11110110: neg_mul = ( in_16bit << 1 ) + ( in_16bit << 2 ) + ( in_16bit << 4 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
        8'b01111111: neg_mul = ( in_16bit << 7 );
        8'b11111111: neg_mul = ( in_16bit << 7 );
        8'b10001100: neg_mul = ( in_16bit << 2 ) + ( in_16bit << 3 );
        8'b01111101: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 2 ) + ( in_16bit << 3 ) + ( in_16bit << 4 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
        8'b10011000: neg_mul = ( in_16bit << 3 ) + ( in_16bit << 4 );
        8'b01111010: neg_mul = ( in_16bit << 1 ) + ( in_16bit << 3 ) + ( in_16bit << 4 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
        8'b10100101: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 2 ) + ( in_16bit << 5 );
        8'b01110000: neg_mul = ( in_16bit << 4 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
        8'b10111100: neg_mul = ( in_16bit << 2 ) + ( in_16bit << 3 ) + ( in_16bit << 4 ) + ( in_16bit << 5 );
        8'b01101010: neg_mul = ( in_16bit << 1 ) + ( in_16bit << 3 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
        8'b11000111: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 1 ) + ( in_16bit << 2 ) + ( in_16bit << 6 );
        8'b01100010: neg_mul = ( in_16bit << 1 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
        8'b01010001: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 4 ) + ( in_16bit << 6 );
        8'b11010001: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 4 ) + ( in_16bit << 6 );
        8'b11100010: neg_mul = ( in_16bit << 1 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
        8'b01000111: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 1 ) + ( in_16bit << 2 ) + ( in_16bit << 6 );
        8'b11101010: neg_mul = ( in_16bit << 1 ) + ( in_16bit << 3 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
        8'b00111100: neg_mul = ( in_16bit << 2 ) + ( in_16bit << 3 ) + ( in_16bit << 4 ) + ( in_16bit << 5 );
        8'b11110000: neg_mul = ( in_16bit << 4 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
        8'b00100101: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 2 ) + ( in_16bit << 5 );
        8'b11111010: neg_mul = ( in_16bit << 1 ) + ( in_16bit << 3 ) + ( in_16bit << 4 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
        8'b00011000: neg_mul = ( in_16bit << 3 ) + ( in_16bit << 4 );
        8'b11111101: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 2 ) + ( in_16bit << 3 ) + ( in_16bit << 4 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
        8'b00001100: neg_mul = ( in_16bit << 3 ) + ( in_16bit << 4 );
        8'b10000110: neg_mul = ( in_16bit << 1 ) + ( in_16bit << 2 );
        8'b01111110: neg_mul = ( in_16bit << 1 ) + ( in_16bit << 2 ) + ( in_16bit << 3 ) + ( in_16bit << 4 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
        8'b10010010: neg_mul = ( in_16bit << 1 ) + ( in_16bit << 4 );
        8'b01111100: neg_mul = ( in_16bit << 2 ) + ( in_16bit << 3 ) + ( in_16bit << 4 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
        8'b10011111: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 1 ) + ( in_16bit << 2 ) + ( in_16bit << 3 ) + ( in_16bit << 4 );
        8'b01111000: neg_mul = ( in_16bit << 3 ) + ( in_16bit << 4 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
        8'b10101011: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 1 ) + ( in_16bit << 3 ) + ( in_16bit << 5 );
        8'b01110011: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 1 ) + ( in_16bit << 4 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
        8'b10110110: neg_mul = ( in_16bit << 1 ) + ( in_16bit << 2 ) + ( in_16bit << 4 ) + ( in_16bit << 5 );
        8'b01101101: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 2 ) + ( in_16bit << 3 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
        8'b11000001: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 6 );
        8'b01100110: neg_mul = ( in_16bit << 1 ) + ( in_16bit << 2 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
        8'b11001100: neg_mul = ( in_16bit << 2 ) + ( in_16bit << 3 ) + ( in_16bit << 6 );
        8'b01011110: neg_mul = ( in_16bit << 1 ) + ( in_16bit << 2 ) + ( in_16bit << 3 ) + ( in_16bit << 4 ) + ( in_16bit << 6 );
        8'b11010101: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 2 ) + ( in_16bit << 4 ) + ( in_16bit << 6 );
        8'b01010101: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 2 ) + ( in_16bit << 4 ) + ( in_16bit << 6 );
        8'b11011110: neg_mul = ( in_16bit << 1 ) + ( in_16bit << 2 ) + ( in_16bit << 3 ) + ( in_16bit << 4 ) + ( in_16bit << 6 );
        8'b01001100: neg_mul = ( in_16bit << 2 ) + ( in_16bit << 3 ) + ( in_16bit << 6 );
        8'b11100110: neg_mul = ( in_16bit << 1 ) + ( in_16bit << 2 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
        8'b01000001: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 6 );
        8'b11101101: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 2 ) + ( in_16bit << 3 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
        8'b00110110: neg_mul = ( in_16bit << 1 ) + ( in_16bit << 2 ) + ( in_16bit << 4 ) + ( in_16bit << 5 );
        8'b11110011: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 1 ) + ( in_16bit << 4 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
        8'b00101011: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 1 ) + ( in_16bit << 3 ) + ( in_16bit << 5 );
        8'b11111000: neg_mul = ( in_16bit << 3 ) + ( in_16bit << 4 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
        8'b00011111: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 1 ) + ( in_16bit << 2 ) + ( in_16bit << 3 ) + ( in_16bit << 4 );
        8'b11111100: neg_mul = ( in_16bit << 2 ) + ( in_16bit << 3 ) + ( in_16bit << 4 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
        8'b00010010: neg_mul = ( in_16bit << 1 ) + ( in_16bit << 4 );
        8'b11111110: neg_mul = ( in_16bit << 1 ) + ( in_16bit << 2 ) + ( in_16bit << 3 ) + ( in_16bit << 4 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
        8'b00000110: neg_mul = ( in_16bit << 1 ) + ( in_16bit << 2 );
        
        8'b10000011: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 1 );
        8'b10001001: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 3 );
        8'b10001111: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 1 ) + ( in_16bit << 2 ) + ( in_16bit << 3 );
        8'b10010101: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 2 ) + ( in_16bit << 4 );
        8'b10011100: neg_mul = ( in_16bit << 2 ) + ( in_16bit << 3 ) + ( in_16bit << 4 );
        8'b01111011: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 1 ) + ( in_16bit << 3 ) + ( in_16bit << 4 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
        8'b10100010: neg_mul = ( in_16bit << 1 ) + ( in_16bit << 5 );
        8'b01111001: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 3 ) + ( in_16bit << 4 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
        8'b10101000: neg_mul = ( in_16bit << 3 ) + ( in_16bit << 5 );
        8'b01110111: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 1 ) + ( in_16bit << 2 ) + ( in_16bit << 4 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
        8'b10101110: neg_mul = ( in_16bit << 1 ) + ( in_16bit << 2 ) + ( in_16bit << 3 ) + ( in_16bit << 5 );
        8'b01110101: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 2 ) + ( in_16bit << 4 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
        8'b10110011: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 1 ) + ( in_16bit << 4 ) + ( in_16bit << 5 );
        8'b01110010: neg_mul = ( in_16bit << 1 ) + ( in_16bit << 4 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
        8'b10111001: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 3 ) + ( in_16bit << 4 ) + ( in_16bit << 5 );
        8'b01101111: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 1 ) + ( in_16bit << 2 ) + ( in_16bit << 3 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
        8'b10111111: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 1 ) + ( in_16bit << 2 ) + ( in_16bit << 3 ) + ( in_16bit << 4 ) + ( in_16bit << 5 );
        8'b01101100: neg_mul = ( in_16bit << 2 ) + ( in_16bit << 3 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
        8'b11000100: neg_mul = ( in_16bit << 2 ) + ( in_16bit << 6 );
        8'b01101000: neg_mul = ( in_16bit << 3 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
        8'b11001001: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 3 ) + ( in_16bit << 6 );
        8'b01100100: neg_mul = ( in_16bit << 2 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
        8'b11001110: neg_mul = ( in_16bit << 1 ) + ( in_16bit << 2 ) + ( in_16bit << 3 ) + ( in_16bit << 6 );
        8'b01100000: neg_mul = ( in_16bit << 5 ) + ( in_16bit << 6 );
        8'b11010011: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 1 ) + ( in_16bit << 4 ) + ( in_16bit << 6 );
        8'b01011100: neg_mul = ( in_16bit << 2 ) + ( in_16bit << 3 ) + ( in_16bit << 4 ) + ( in_16bit << 6 );
        8'b11011000: neg_mul = ( in_16bit << 3 ) + ( in_16bit << 4 ) + ( in_16bit << 6 );
        8'b01011000: neg_mul = ( in_16bit << 3 ) + ( in_16bit << 4 ) + ( in_16bit << 6 );
        8'b11011100: neg_mul = ( in_16bit << 2 ) + ( in_16bit << 3 ) + ( in_16bit << 4 ) + ( in_16bit << 6 );
        8'b01010011: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 1 ) + ( in_16bit << 4 ) + ( in_16bit << 6 );
        8'b11100000: neg_mul = ( in_16bit << 5 ) + ( in_16bit << 6 );
        8'b01001110: neg_mul = ( in_16bit << 1 ) + ( in_16bit << 2 ) + ( in_16bit << 3 ) + ( in_16bit << 6 );
        8'b11100100: neg_mul = ( in_16bit << 2 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
        8'b01001001: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 3 ) + ( in_16bit << 6 );
        8'b11101000: neg_mul = ( in_16bit << 3 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
        8'b01000100: neg_mul = ( in_16bit << 2 ) + ( in_16bit << 6 );
        8'b11101100: neg_mul = ( in_16bit << 2 ) + ( in_16bit << 3 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
        8'b00111111: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 1 ) + ( in_16bit << 2 ) + ( in_16bit << 3 ) + ( in_16bit << 4 ) + ( in_16bit << 5 );
        8'b11101111: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 1 ) + ( in_16bit << 2 ) + ( in_16bit << 3 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
        8'b00111001: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 3 ) + ( in_16bit << 4 ) + ( in_16bit << 5 );
        8'b11110010: neg_mul = ( in_16bit << 1 ) + ( in_16bit << 4 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
        8'b00110011: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 1 ) + ( in_16bit << 4 ) + ( in_16bit << 5 );
        8'b11110101: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 2 ) + ( in_16bit << 4 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
        8'b00101110: neg_mul = ( in_16bit << 1 ) + ( in_16bit << 2 ) + ( in_16bit << 3 ) + ( in_16bit << 5 );
        8'b11110111: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 1 ) + ( in_16bit << 2 ) + ( in_16bit << 4 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
        8'b00101000: neg_mul = ( in_16bit << 3 ) + ( in_16bit << 5 );
        8'b11111001: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 3 ) + ( in_16bit << 4 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
        8'b00100010: neg_mul = ( in_16bit << 1 ) + ( in_16bit << 5 );
        8'b11111011: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 1 ) + ( in_16bit << 3 ) + ( in_16bit << 4 ) + ( in_16bit << 5 ) + ( in_16bit << 6 );
        8'b00011100: neg_mul = ( in_16bit << 2 ) + ( in_16bit << 3 ) + ( in_16bit << 4 );
        8'b00010101: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 2 ) + ( in_16bit << 4 );
        8'b00001111: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 1 ) + ( in_16bit << 2 ) + ( in_16bit << 3 );
        8'b00001001: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 3 );
        8'b00000011: neg_mul = ( in_16bit << 0 ) + ( in_16bit << 1 );
    endcase
  end
assign mul = neg_mul;
assign mul_b={mul[22:15], mul[14:7]};
assign flag = in_17bit[16] + in_8bit[7];
assign out = flag?{1'b1,~mul_b+1'b1}:{1'b0,mul_b};
  
endmodule
