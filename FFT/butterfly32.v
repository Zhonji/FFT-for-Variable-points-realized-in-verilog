
`timescale 1ns/1ns
//32 * 34 bit = 1088 bit      16 * 34bit = 544 bit  [543:0] [1087:544]
//16个基2模块，W为W32^0、W32^1、W32^2、W32^3、W32^4、W32^5、W32^6、W32^7、W32^8、W32^9、W32^10、W32^11、W32^12、W32^13、W32^14、W32^15
module butterfly32(
    input  wire [1087:0] butyerfly32_in,
    output wire [1087:0] butterfly32_out
);
// module butterfly2(
//     input wire [67:0] butterfly2_in,
//     input wire [5:0] rotation,
//     output wire [67:0] butterfly2_out
// );//10110110
wire [67:0]     butterfly2_inst0_out    ,butterfly2_inst1_out   ,butterfly2_inst2_out   ,butterfly2_inst3_out;
wire [67:0]     butterfly2_inst4_out    ,butterfly2_inst5_out   ,butterfly2_inst6_out   ,butterfly2_inst7_out;
wire [67:0]     butterfly2_inst8_out    ,butterfly2_inst9_out   ,butterfly2_inst10_out  ,butterfly2_inst11_out;
wire [67:0]     butterfly2_inst12_out   ,butterfly2_inst13_out  ,butterfly2_inst14_out  ,butterfly2_inst15_out;
//***********************************************************************
butterfly2 butterfly2_inst0(
    .butterfly2_in({butyerfly32_in[577:544],butyerfly32_in[33:0]}),
    .rotation(7'b000_0000),//W32^0 W256^0
    .butterfly2_out(butterfly2_inst0_out)
);
butterfly2 butterfly2_inst1(
    .butterfly2_in({butyerfly32_in[611:578],butyerfly32_in[67:34]}),
    .rotation(7'b000_1000),//W32^1 W256^8
    .butterfly2_out(butterfly2_inst1_out)
);
butterfly2 butterfly2_inst2(
    .butterfly2_in({butyerfly32_in[645:612],butyerfly32_in[101:68]}),
    .rotation(7'b001_0000),//W32^2 W256^16
    .butterfly2_out(butterfly2_inst2_out)
);
butterfly2 butterfly2_inst3(
    .butterfly2_in({butyerfly32_in[679:646],butyerfly32_in[135:102]}),
    .rotation(7'b001_1000),//W32^3 W256^24
    .butterfly2_out(butterfly2_inst3_out)
);
butterfly2 butterfly2_inst4(
    .butterfly2_in({butyerfly32_in[713:680],butyerfly32_in[169:136]}),
    .rotation(7'b010_0000),//W32^4 W256^32
    .butterfly2_out(butterfly2_inst4_out)
);
butterfly2 butterfly2_inst5(
    .butterfly2_in({butyerfly32_in[747:714],butyerfly32_in[203:170]}),
    .rotation(7'b010_1000),//W32^5 W256^40
    .butterfly2_out(butterfly2_inst5_out)
);
butterfly2 butterfly2_inst6(
    .butterfly2_in({butyerfly32_in[781:748],butyerfly32_in[237:204]}),
    .rotation(7'b011_0000),//W32^6 W256^48
    .butterfly2_out(butterfly2_inst6_out)
);
butterfly2 butterfly2_inst7(
    .butterfly2_in({butyerfly32_in[815:782],butyerfly32_in[271:238]}),
    .rotation(7'b011_1000),//W32^7 W256^56
    .butterfly2_out(butterfly2_inst7_out)
);
butterfly2 butterfly2_inst8(
    .butterfly2_in({butyerfly32_in[849:816],butyerfly32_in[305:272]}),
    .rotation(7'b100_0000),//W32^8 W256^64
    .butterfly2_out(butterfly2_inst8_out)
);
butterfly2 butterfly2_inst9(
    .butterfly2_in({butyerfly32_in[883:850],butyerfly32_in[339:306]}),
    .rotation(7'b100_1000),//W32^9 W256^72
    .butterfly2_out(butterfly2_inst9_out)
);
butterfly2 butterfly2_inst10(
    .butterfly2_in({butyerfly32_in[917:884],butyerfly32_in[373:340]}),
    .rotation(7'b101_0000),//W32^10 W256^80
    .butterfly2_out(butterfly2_inst10_out)
);
butterfly2 butterfly2_inst11(
    .butterfly2_in({butyerfly32_in[951:918],butyerfly32_in[407:374]}),
    .rotation(7'b101_1000),//W32^11 W256^88
    .butterfly2_out(butterfly2_inst11_out)
);
butterfly2 butterfly2_inst12(
    .butterfly2_in({butyerfly32_in[985:952],butyerfly32_in[441:408]}),
    .rotation(7'b110_0000),//W32^12 W256^96
    .butterfly2_out(butterfly2_inst12_out)
);
butterfly2 butterfly2_inst13(
    .butterfly2_in({butyerfly32_in[1019:986],butyerfly32_in[475:442]}),
    .rotation(7'b110_1000),//W32^13 W256^104
    .butterfly2_out(butterfly2_inst13_out)
);
butterfly2 butterfly2_inst14(
    .butterfly2_in({butyerfly32_in[1053:1020],butyerfly32_in[509:476]}),
    .rotation(7'b111_0000),//W32^14 W256^112
    .butterfly2_out(butterfly2_inst14_out)
);
butterfly2 butterfly2_inst15(
    .butterfly2_in({butyerfly32_in[1087:1054],butyerfly32_in[543:510]}),
    .rotation(7'b111_1000),//W32^15 W256^120
    .butterfly2_out(butterfly2_inst15_out)
);
//*******************************************************

assign butterfly32_out = {
    butterfly2_inst15_out[67:34] ,butterfly2_inst14_out[67:34] ,butterfly2_inst13_out[67:34] ,butterfly2_inst12_out[67:34],
    butterfly2_inst11_out[67:34] ,butterfly2_inst10_out[67:34] ,butterfly2_inst9_out[67:34]  ,butterfly2_inst8_out[67:34] ,
    butterfly2_inst7_out[67:34]  ,butterfly2_inst6_out[67:34]  ,butterfly2_inst5_out[67:34]  ,butterfly2_inst4_out[67:34] ,
    butterfly2_inst3_out[67:34]  ,butterfly2_inst2_out[67:34]  ,butterfly2_inst1_out[67:34]  ,butterfly2_inst0_out[67:34] ,
    butterfly2_inst15_out[33:0]  ,butterfly2_inst14_out[33:0]  ,butterfly2_inst13_out[33:0]  ,butterfly2_inst12_out[33:0] ,
    butterfly2_inst11_out[33:0]  ,butterfly2_inst10_out[33:0]  ,butterfly2_inst9_out[33:0]   ,butterfly2_inst8_out[33:0]  ,
    butterfly2_inst7_out[33:0]   ,butterfly2_inst6_out[33:0]   ,butterfly2_inst5_out[33:0]   ,butterfly2_inst4_out[33:0]  ,
    butterfly2_inst3_out[33:0]   ,butterfly2_inst2_out[33:0]   ,butterfly2_inst1_out[33:0]   ,butterfly2_inst0_out[33:0]

};

endmodule
