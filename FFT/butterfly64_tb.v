`timescale 1ns/1ns
//"C:/FFT/Library/64fft_g4/datain.txt"
//"C:/FFT/Library/64fft_g4/dataout.txt"
module butterfly64_tb();
// module butterfly64(
//     input wire  [2175:0] butterfly64_in,
//     output wire [2175:0] butterfly64_out
// );
reg  [33:0] Inputdata [0:63];
wire [2175:0] butterfly64_in;
wire [2175:0] butterfly64_out;
assign butterfly64_in = {Inputdata[63],Inputdata[62],Inputdata[61],Inputdata[60],
                         Inputdata[59],Inputdata[58],Inputdata[57],Inputdata[56],
                         Inputdata[55],Inputdata[54],Inputdata[53],Inputdata[52],
                         Inputdata[51],Inputdata[50],Inputdata[49],Inputdata[48],
                         Inputdata[47],Inputdata[46],Inputdata[45],Inputdata[44],
                         Inputdata[43],Inputdata[42],Inputdata[41],Inputdata[40],
                         Inputdata[39],Inputdata[38],Inputdata[37],Inputdata[36],
                         Inputdata[35],Inputdata[34],Inputdata[33],Inputdata[32],
                         Inputdata[31],Inputdata[30],Inputdata[29],Inputdata[28],
                         Inputdata[27],Inputdata[26],Inputdata[25],Inputdata[24],
                         Inputdata[23],Inputdata[22],Inputdata[21],Inputdata[20],
                         Inputdata[19],Inputdata[18],Inputdata[17],Inputdata[16],
                         Inputdata[15],Inputdata[14],Inputdata[13],Inputdata[12],
                         Inputdata[11],Inputdata[10],Inputdata[9] ,Inputdata[8] ,
                         Inputdata[7] ,Inputdata[6] ,Inputdata[5] ,Inputdata[4] ,
                         Inputdata[3] ,Inputdata[2] ,Inputdata[1] ,Inputdata[0]};
integer dout_file1;
initial begin
    $readmemb("C:/FFT/Library/64fft_g4/datain.txt", Inputdata);
    dout_file1 = $fopen("C:/FFT/Library/64fft_g4/dataout.txt");
    #10
    $fclose(dout_file1);
    $stop;
end
 always@(*)
 begin
     $fdisplay(dout_file1,"%b",butterfly64_out);
 end
butterfly64 inst1(
    .butterfly64_in(butterfly64_in),
    .butterfly64_out(butterfly64_out)
);

endmodule
