//****************************************************************************************************************************
// `timescale  1ns/1ns
// module fft_top_tb();

// wire [4351:0] FFT_in;
// reg [33:0] Inputdata [0:127];
// wire [4351:0] FFT_out;

// assign FFT_in = {
//         Inputdata[127] ,Inputdata[126] ,Inputdata[125] ,Inputdata[124] ,Inputdata[123] ,Inputdata[122] ,Inputdata[121] ,Inputdata[120],
//         Inputdata[119] ,Inputdata[118] ,Inputdata[117] ,Inputdata[116] ,Inputdata[115] ,Inputdata[114] ,Inputdata[113] ,Inputdata[112],
//         Inputdata[111] ,Inputdata[110] ,Inputdata[109] ,Inputdata[108] ,Inputdata[107] ,Inputdata[106] ,Inputdata[105] ,Inputdata[104],
//         Inputdata[103] ,Inputdata[102] ,Inputdata[101] ,Inputdata[100] ,Inputdata[99]  ,Inputdata[98]  ,Inputdata[97]  ,Inputdata[96] ,
//         Inputdata[95]  ,Inputdata[94]  ,Inputdata[93]  ,Inputdata[92]  ,Inputdata[91]  ,Inputdata[90]  ,Inputdata[89]  ,Inputdata[88] ,
//         Inputdata[87]  ,Inputdata[86]  ,Inputdata[85]  ,Inputdata[84]  ,Inputdata[83]  ,Inputdata[82]  ,Inputdata[81]  ,Inputdata[80] ,
//         Inputdata[79]  ,Inputdata[78]  ,Inputdata[77]  ,Inputdata[76]  ,Inputdata[75]  ,Inputdata[74]  ,Inputdata[73]  ,Inputdata[72] ,
//         Inputdata[71]  ,Inputdata[70]  ,Inputdata[69]  ,Inputdata[68]  ,Inputdata[67]  ,Inputdata[66]  ,Inputdata[65]  ,Inputdata[64] ,
//         Inputdata[63]  ,Inputdata[62]  ,Inputdata[61]  ,Inputdata[60]  ,Inputdata[59]  ,Inputdata[58]  ,Inputdata[57]  ,Inputdata[56] ,
//         Inputdata[55]  ,Inputdata[54]  ,Inputdata[53]  ,Inputdata[52]  ,Inputdata[51]  ,Inputdata[50]  ,Inputdata[49]  ,Inputdata[48] ,
//         Inputdata[47]  ,Inputdata[46]  ,Inputdata[45]  ,Inputdata[44]  ,Inputdata[43]  ,Inputdata[42]  ,Inputdata[41]  ,Inputdata[40] ,
//         Inputdata[39]  ,Inputdata[38]  ,Inputdata[37]  ,Inputdata[36]  ,Inputdata[35]  ,Inputdata[34]  ,Inputdata[33]  ,Inputdata[32] ,
//         Inputdata[31]  ,Inputdata[30]  ,Inputdata[29]  ,Inputdata[28]  ,Inputdata[27]  ,Inputdata[26]  ,Inputdata[25]  ,Inputdata[24] ,
//         Inputdata[23]  ,Inputdata[22]  ,Inputdata[21]  ,Inputdata[20]  ,Inputdata[19]  ,Inputdata[18]  ,Inputdata[17]  ,Inputdata[16] ,
//         Inputdata[15]  ,Inputdata[14]  ,Inputdata[13]  ,Inputdata[12]  ,Inputdata[11]  ,Inputdata[10]  ,Inputdata[9]   ,Inputdata[8]  ,
//         Inputdata[7]   ,Inputdata[6]   ,Inputdata[5]   ,Inputdata[4]   ,Inputdata[3]   ,Inputdata[2]   ,Inputdata[1]   ,Inputdata[0]

// };
// integer dout_file3;
// initial begin
//     $readmemb("C:/FFT_128xiangliang/03/data_03_b.txt",Inputdata);
//     dout_file3 = $fopen("C:/FFT/fftdataout.txt");
//     #10
//     $fclose(dout_file3);
//     $stop;
// end
// always@(*) 
// begin
//     $fdisplay(dout_file3,"%b",FFT_out);
// end
// FFT128_TOP inst1(
//     .FFT_in(FFT_in),
//     .FFT_out(FFT_out)
// );
// endmodule

//****************************************************************************************************************************

`timescale  1ns/1ns
module fft_top_tb();

wire [4351:0] FFT_in;
reg [33:0] Inputdata [0:127];
wire [4351:0] FFT_out;
wire [2175:0] out_1,out_2;

assign FFT_in = {
        Inputdata[127] ,Inputdata[126] ,Inputdata[125] ,Inputdata[124] ,Inputdata[123] ,Inputdata[122] ,Inputdata[121] ,Inputdata[120],
        Inputdata[119] ,Inputdata[118] ,Inputdata[117] ,Inputdata[116] ,Inputdata[115] ,Inputdata[114] ,Inputdata[113] ,Inputdata[112],
        Inputdata[111] ,Inputdata[110] ,Inputdata[109] ,Inputdata[108] ,Inputdata[107] ,Inputdata[106] ,Inputdata[105] ,Inputdata[104],
        Inputdata[103] ,Inputdata[102] ,Inputdata[101] ,Inputdata[100] ,Inputdata[99]  ,Inputdata[98]  ,Inputdata[97]  ,Inputdata[96] ,
        Inputdata[95]  ,Inputdata[94]  ,Inputdata[93]  ,Inputdata[92]  ,Inputdata[91]  ,Inputdata[90]  ,Inputdata[89]  ,Inputdata[88] ,
        Inputdata[87]  ,Inputdata[86]  ,Inputdata[85]  ,Inputdata[84]  ,Inputdata[83]  ,Inputdata[82]  ,Inputdata[81]  ,Inputdata[80] ,
        Inputdata[79]  ,Inputdata[78]  ,Inputdata[77]  ,Inputdata[76]  ,Inputdata[75]  ,Inputdata[74]  ,Inputdata[73]  ,Inputdata[72] ,
        Inputdata[71]  ,Inputdata[70]  ,Inputdata[69]  ,Inputdata[68]  ,Inputdata[67]  ,Inputdata[66]  ,Inputdata[65]  ,Inputdata[64] ,
        Inputdata[63]  ,Inputdata[62]  ,Inputdata[61]  ,Inputdata[60]  ,Inputdata[59]  ,Inputdata[58]  ,Inputdata[57]  ,Inputdata[56] ,
        Inputdata[55]  ,Inputdata[54]  ,Inputdata[53]  ,Inputdata[52]  ,Inputdata[51]  ,Inputdata[50]  ,Inputdata[49]  ,Inputdata[48] ,
        Inputdata[47]  ,Inputdata[46]  ,Inputdata[45]  ,Inputdata[44]  ,Inputdata[43]  ,Inputdata[42]  ,Inputdata[41]  ,Inputdata[40] ,
        Inputdata[39]  ,Inputdata[38]  ,Inputdata[37]  ,Inputdata[36]  ,Inputdata[35]  ,Inputdata[34]  ,Inputdata[33]  ,Inputdata[32] ,
        Inputdata[31]  ,Inputdata[30]  ,Inputdata[29]  ,Inputdata[28]  ,Inputdata[27]  ,Inputdata[26]  ,Inputdata[25]  ,Inputdata[24] ,
        Inputdata[23]  ,Inputdata[22]  ,Inputdata[21]  ,Inputdata[20]  ,Inputdata[19]  ,Inputdata[18]  ,Inputdata[17]  ,Inputdata[16] ,
        Inputdata[15]  ,Inputdata[14]  ,Inputdata[13]  ,Inputdata[12]  ,Inputdata[11]  ,Inputdata[10]  ,Inputdata[9]   ,Inputdata[8]  ,
        Inputdata[7]   ,Inputdata[6]   ,Inputdata[5]   ,Inputdata[4]   ,Inputdata[3]   ,Inputdata[2]   ,Inputdata[1]   ,Inputdata[0]

};
integer dout_file3 ,dout_file4 ,dout_file5;
initial begin
    $readmemb("C:/FFT_128xiangliang/03/data_03_b.txt",Inputdata);
    dout_file3 = $fopen("C:/FFT/fftdataout.txt");
    dout_file4 = $fopen("C:/FFT/fftdataout1.txt");
    dout_file5 = $fopen("C:/FFT/fftdataout2.txt");
    #10
    $fclose(dout_file3);
    $fclose(dout_file4);
    $fclose(dout_file5);
    $stop;
end

always@(*) 
begin
    $fdisplay(dout_file3,"%b",FFT_out);
end

always@(*) 
begin
    $fdisplay(dout_file4,"%b",out_1);
end

always@(*) 
begin
    $fdisplay(dout_file5,"%b",out_2);
end


FFT128_TOP inst1(
    .FFT_in(FFT_in),
    .FFT_out(FFT_out),
    .out_1(out_1),
    .out_2(out_2)
);
endmodule
