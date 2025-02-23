`timescale 1ns/1ns
module butterfly128(
    input wire [4351:0] butterfly128_in,
    output wire [4351:0] butterfly128_out
);
    
//     butterfly64(
//     input wire  [2175:0] butterfly64_in,
//     output wire [2175:0] butterfly64_out
// );{butterfly128_in[2209:2176],butterfly128_in[33:0]}
// butterfly64 inst0(
//     .butterfly64_in({}),
//     .butterfly64_out(),
// );
// butterfly64 inst1(
//     .butterfly64_in({}),
//     .butterfly64_out(),
// );
wire [67:0] inst0_out,  inst1_out,  inst2_out,  inst3_out;
wire [67:0] inst4_out,  inst5_out,  inst6_out,  inst7_out;
wire [67:0] inst8_out,  inst9_out,  inst10_out, inst11_out;
wire [67:0] inst12_out, inst13_out, inst14_out, inst15_out;
wire [67:0] inst16_out, inst17_out, inst18_out, inst19_out;
wire [67:0] inst20_out, inst21_out, inst22_out, inst23_out;
wire [67:0] inst24_out, inst25_out, inst26_out, inst27_out;
wire [67:0] inst28_out, inst29_out, inst30_out, inst31_out;
wire [67:0] inst32_out, inst33_out, inst34_out, inst35_out;
wire [67:0] inst36_out, inst37_out, inst38_out, inst39_out;
wire [67:0] inst40_out, inst41_out, inst42_out, inst43_out;
wire [67:0] inst44_out, inst45_out, inst46_out, inst47_out;
wire [67:0] inst48_out, inst49_out, inst50_out, inst51_out;
wire [67:0] inst52_out, inst53_out, inst54_out, inst55_out;
wire [67:0] inst56_out, inst57_out, inst58_out, inst59_out;
wire [67:0] inst60_out, inst61_out, inst62_out, inst63_out;
//********************************************************************************************************
butterfly2 inst0(
    .butterfly2_in({butterfly128_in[2209:2176],butterfly128_in[33:0]}),//[67:0]
    .rotation(6'b000000),
    .butterfly2_out(inst0_out)
);

butterfly2 inst1(
    .butterfly2_in({butterfly128_in[2243:2210],butterfly128_in[67:34]}),
    .rotation(6'b000001),
    .butterfly2_out(inst1_out)
);

butterfly2 inst2(
    .butterfly2_in({butterfly128_in[2277:2244],butterfly128_in[101:68]}),
    .rotation(6'b000010),
    .butterfly2_out(inst2_out)
);

butterfly2 inst3(
    .butterfly2_in({butterfly128_in[2311:2278],butterfly128_in[135:102]}),
    .rotation(6'b000011),
    .butterfly2_out(inst3_out)
);

butterfly2 inst4(
    .butterfly2_in({butterfly128_in[2345:2312],butterfly128_in[169:136]}),
    .rotation(6'b000100),
    .butterfly2_out(inst4_out)
);

butterfly2 inst5(
    .butterfly2_in({butterfly128_in[2379:2346],butterfly128_in[203:170]}),
    .rotation(6'b000101),
    .butterfly2_out(inst5_out)
);

butterfly2 inst6(
    .butterfly2_in({butterfly128_in[2413:2380],butterfly128_in[237:204]}),
    .rotation(6'b000110),
    .butterfly2_out(inst6_out)
);

butterfly2 inst7(
    .butterfly2_in({butterfly128_in[2447:2414],butterfly128_in[271:238]}),
    .rotation(6'b000111),
    .butterfly2_out(inst7_out)
);

butterfly2 inst8(
    .butterfly2_in({butterfly128_in[2481:2448],butterfly128_in[305:272]}),
    .rotation(6'b001000),
    .butterfly2_out(inst8_out)
);

butterfly2 inst9(
    .butterfly2_in({butterfly128_in[2515:2482],butterfly128_in[339:306]}),
    .rotation(6'b001001),
    .butterfly2_out(inst9_out)
);

butterfly2 inst10(
    .butterfly2_in({butterfly128_in[2549:2516],butterfly128_in[373:340]}),
    .rotation(6'b001010),
    .butterfly2_out(inst10_out)
);

butterfly2 inst11(
    .butterfly2_in({butterfly128_in[2583:2550],butterfly128_in[407:374]}),
    .rotation(6'b001011),
    .butterfly2_out(inst11_out)
);

butterfly2 inst12(
    .butterfly2_in({butterfly128_in[2617:2584],butterfly128_in[441:408]}),
    .rotation(6'b001100),
    .butterfly2_out(inst12_out)
);

butterfly2 inst13(
    .butterfly2_in({butterfly128_in[2651:2618],butterfly128_in[475:442]}),
    .rotation(6'b001101),
    .butterfly2_out(inst13_out)
);

butterfly2 inst14(
    .butterfly2_in({butterfly128_in[2685:2652],butterfly128_in[509:476]}),
    .rotation(6'b001110),
    .butterfly2_out(inst14_out)
);

butterfly2 inst15(
    .butterfly2_in({butterfly128_in[2719:2686],butterfly128_in[543:510]}),
    .rotation(6'b001111),
    .butterfly2_out(inst15_out)
);

butterfly2 inst16(
    .butterfly2_in({butterfly128_in[2753:2720],butterfly128_in[577:544]}),
    .rotation(6'b010000),
    .butterfly2_out(inst16_out)
);

butterfly2 inst17(
    .butterfly2_in({butterfly128_in[2787:2754],butterfly128_in[611:578]}),
    .rotation(6'b010001),
    .butterfly2_out(inst17_out)
);

butterfly2 inst18(
    .butterfly2_in({butterfly128_in[2821:2788],butterfly128_in[645:612]}),
    .rotation(6'b010010),
    .butterfly2_out(inst18_out)
);

butterfly2 inst19(
    .butterfly2_in({butterfly128_in[2855:2822],butterfly128_in[679:646]}),
    .rotation(6'b010011),
    .butterfly2_out(inst19_out)
);

butterfly2 inst20(
    .butterfly2_in({butterfly128_in[2889:2856],butterfly128_in[713:680]}),
    .rotation(6'b010100),
    .butterfly2_out(inst20_out)
);

butterfly2 inst21(
    .butterfly2_in({butterfly128_in[2923:2890],butterfly128_in[747:714]}),
    .rotation(6'b010101),
    .butterfly2_out(inst21_out)
);

butterfly2 inst22(
    .butterfly2_in({butterfly128_in[2957:2924],butterfly128_in[781:748]}),
    .rotation(6'b010110),
    .butterfly2_out(inst22_out)
);

butterfly2 inst23(
    .butterfly2_in({butterfly128_in[2991:2958],butterfly128_in[815:782]}),
    .rotation(6'b010111),
    .butterfly2_out(inst23_out)
);

butterfly2 inst24(
    .butterfly2_in({butterfly128_in[3025:2992],butterfly128_in[849:816]}),
    .rotation(6'b011000),
    .butterfly2_out(inst24_out)
);

butterfly2 inst25(
    .butterfly2_in({butterfly128_in[3059:3026],butterfly128_in[883:850]}),
    .rotation(6'b011001),
    .butterfly2_out(inst25_out)
);

butterfly2 inst26(
    .butterfly2_in({butterfly128_in[3093:3060],butterfly128_in[917:884]}),
    .rotation(6'b011010),
    .butterfly2_out(inst26_out)
);

butterfly2 inst27(
    .butterfly2_in({butterfly128_in[3127:3094],butterfly128_in[951:918]}),
    .rotation(6'b011011),
    .butterfly2_out(inst27_out)
);

butterfly2 inst28(
    .butterfly2_in({butterfly128_in[3161:3128],butterfly128_in[985:952]}),
    .rotation(6'b011100),
    .butterfly2_out(inst28_out)
);

butterfly2 inst29(
    .butterfly2_in({butterfly128_in[3195:3162],butterfly128_in[1019:986]}),
    .rotation(6'b011101),
    .butterfly2_out(inst29_out)
);

butterfly2 inst30(
    .butterfly2_in({butterfly128_in[3229:3196],butterfly128_in[1053:1020]}),
    .rotation(6'b011110),
    .butterfly2_out(inst30_out)
);

butterfly2 inst31(
    .butterfly2_in({butterfly128_in[3263:3230],butterfly128_in[1087:1054]}),
    .rotation(6'b011111),
    .butterfly2_out(inst31_out)
);

butterfly2 inst32(
    .butterfly2_in({butterfly128_in[3297:3264],butterfly128_in[1121:1088]}),
    .rotation(6'b100000),
    .butterfly2_out(inst32_out)
);

butterfly2 inst33(
    .butterfly2_in({butterfly128_in[3331:3298],butterfly128_in[1155:1122]}),
    .rotation(6'b100001),
    .butterfly2_out(inst33_out)
);

butterfly2 inst34(
    .butterfly2_in({butterfly128_in[3365:3332],butterfly128_in[1189:1156]}),
    .rotation(6'b100010),
    .butterfly2_out(inst34_out)
);

butterfly2 inst35(
    .butterfly2_in({butterfly128_in[3399:3366],butterfly128_in[1223:1190]}),
    .rotation(6'b100011),
    .butterfly2_out(inst35_out)
);

butterfly2 inst36(
    .butterfly2_in({butterfly128_in[3433:3400],butterfly128_in[1257:1224]}),
    .rotation(6'b100100),
    .butterfly2_out(inst36_out)
);

butterfly2 inst37(
    .butterfly2_in({butterfly128_in[3467:3434],butterfly128_in[1291:1258]}),
    .rotation(6'b100101),
    .butterfly2_out(inst37_out)
);

butterfly2 inst38(
    .butterfly2_in({butterfly128_in[3501:3468],butterfly128_in[1325:1292]}),
    .rotation(6'b100110),
    .butterfly2_out(inst38_out)
);

butterfly2 inst39(
    .butterfly2_in({butterfly128_in[3535:3502],butterfly128_in[1359:1326]}),
    .rotation(6'b100111),
    .butterfly2_out(inst39_out)
);

butterfly2 inst40(
    .butterfly2_in({butterfly128_in[3569:3536],butterfly128_in[1393:1360]}),
    .rotation(6'b101000),
    .butterfly2_out(inst40_out)
);

butterfly2 inst41(
    .butterfly2_in({butterfly128_in[3603:3570],butterfly128_in[1427:1394]}),
    .rotation(6'b101001),
    .butterfly2_out(inst41_out)
);

butterfly2 inst42(
    .butterfly2_in({butterfly128_in[3637:3604],butterfly128_in[1461:1428]}),
    .rotation(6'b101010),
    .butterfly2_out(inst42_out)
);

butterfly2 inst43(
    .butterfly2_in({butterfly128_in[3671:3638],butterfly128_in[1495:1462]}),
    .rotation(6'b101011),
    .butterfly2_out(inst43_out)
);

butterfly2 inst44(
    .butterfly2_in({butterfly128_in[3705:3672],butterfly128_in[1529:1496]}),
    .rotation(6'b101100),
    .butterfly2_out(inst44_out)
);

butterfly2 inst45(
    .butterfly2_in({butterfly128_in[3739:3706],butterfly128_in[1563:1530]}),
    .rotation(6'b101101),
    .butterfly2_out(inst45_out)
);

butterfly2 inst46(
    .butterfly2_in({butterfly128_in[3773:3740],butterfly128_in[1597:1564]}),
    .rotation(6'b101110),
    .butterfly2_out(inst46_out)
);

butterfly2 inst47(
    .butterfly2_in({butterfly128_in[3807:3774],butterfly128_in[1631:1598]}),
    .rotation(6'b101111),
    .butterfly2_out(inst47_out)
);

butterfly2 inst48(
    .butterfly2_in({butterfly128_in[3841:3808],butterfly128_in[1665:1632]}),
    .rotation(6'b110000),
    .butterfly2_out(inst48_out)
);

butterfly2 inst49(
    .butterfly2_in({butterfly128_in[3875:3842],butterfly128_in[1699:1666]}),
    .rotation(6'b110001),
    .butterfly2_out(inst49_out)
);

butterfly2 inst50(
    .butterfly2_in({butterfly128_in[3909:3876],butterfly128_in[1733:1700]}),
    .rotation(6'b110010),
    .butterfly2_out(inst50_out)
);

butterfly2 inst51(
    .butterfly2_in({butterfly128_in[3943:3910],butterfly128_in[1767:1734]}),
    .rotation(6'b110011),
    .butterfly2_out(inst51_out)
);

butterfly2 inst52(
    .butterfly2_in({butterfly128_in[3977:3944],butterfly128_in[1801:1768]}),
    .rotation(6'b110100),
    .butterfly2_out(inst52_out)
);

butterfly2 inst53(
    .butterfly2_in({butterfly128_in[4011:3978],butterfly128_in[1835:1802]}),
    .rotation(6'b110101),
    .butterfly2_out(inst53_out)
);

butterfly2 inst54(
    .butterfly2_in({butterfly128_in[4045:4012],butterfly128_in[1869:1836]}),
    .rotation(6'b110110),
    .butterfly2_out(inst54_out)
);

butterfly2 inst55(
    .butterfly2_in({butterfly128_in[4079:4046],butterfly128_in[1903:1870]}),
    .rotation(6'b110111),
    .butterfly2_out(inst55_out)
);

butterfly2 inst56(
    .butterfly2_in({butterfly128_in[4113:4080],butterfly128_in[1937:1904]}),
    .rotation(6'b111000),
    .butterfly2_out(inst56_out)
);

butterfly2 inst57(
    .butterfly2_in({butterfly128_in[4147:4114],butterfly128_in[1971:1938]}),
    .rotation(6'b111001),
    .butterfly2_out(inst57_out)
);

butterfly2 inst58(
    .butterfly2_in({butterfly128_in[4181:4148],butterfly128_in[2005:1972]}),
    .rotation(6'b111010),
    .butterfly2_out(inst58_out)
);

butterfly2 inst59(
    .butterfly2_in({butterfly128_in[4215:4182],butterfly128_in[2039:2006]}),
    .rotation(6'b111011),
    .butterfly2_out(inst59_out)
);

butterfly2 inst60(
    .butterfly2_in({butterfly128_in[4249:4216],butterfly128_in[2073:2040]}),
    .rotation(6'b111100),
    .butterfly2_out(inst60_out)
);

butterfly2 inst61(
    .butterfly2_in({butterfly128_in[4283:4250],butterfly128_in[2107:2074]}),
    .rotation(6'b111101),
    .butterfly2_out(inst61_out)
);

butterfly2 inst62(
    .butterfly2_in({butterfly128_in[4317:4284],butterfly128_in[2141:2108]}),
    .rotation(6'b111110),
    .butterfly2_out(inst62_out)
);

butterfly2 inst63(
    .butterfly2_in({butterfly128_in[4351:4318],butterfly128_in[2175:2142]}),
    .rotation(6'b111111),
    .butterfly2_out(inst63_out)
);
//********************************************************************************************************

assign butterfly128_out = {
        inst63_out[67:34], inst62_out[67:34], inst61_out[67:34], inst60_out[67:34], inst59_out[67:34], inst58_out[67:34], inst57_out[67:34], inst56_out[67:34],
        inst55_out[67:34], inst54_out[67:34], inst53_out[67:34], inst52_out[67:34], inst51_out[67:34], inst50_out[67:34], inst49_out[67:34], inst48_out[67:34],
        inst47_out[67:34], inst46_out[67:34], inst45_out[67:34], inst44_out[67:34], inst43_out[67:34], inst42_out[67:34], inst41_out[67:34], inst40_out[67:34],
        inst39_out[67:34], inst38_out[67:34], inst37_out[67:34], inst36_out[67:34], inst35_out[67:34], inst34_out[67:34], inst33_out[67:34], inst32_out[67:34],
        inst31_out[67:34], inst30_out[67:34], inst29_out[67:34], inst28_out[67:34], inst27_out[67:34], inst26_out[67:34], inst25_out[67:34], inst24_out[67:34],
        inst23_out[67:34], inst22_out[67:34], inst21_out[67:34], inst20_out[67:34], inst19_out[67:34], inst18_out[67:34], inst17_out[67:34], inst16_out[67:34],
        inst15_out[67:34], inst14_out[67:34], inst13_out[67:34], inst12_out[67:34], inst11_out[67:34], inst10_out[67:34], inst9_out[67:34] , inst8_out[67:34] ,
        inst7_out[67:34] , inst6_out[67:34] , inst5_out[67:34] , inst4_out[67:34] , inst3_out[67:34] , inst2_out[67:34] , inst1_out[67:34] , inst0_out[67:34] ,
        inst63_out[33:0], inst62_out[33:0], inst61_out[33:0], inst60_out[33:0], inst59_out[33:0], inst58_out[33:0], inst57_out[33:0], inst56_out[33:0],
        inst55_out[33:0], inst54_out[33:0], inst53_out[33:0], inst52_out[33:0], inst51_out[33:0], inst50_out[33:0], inst49_out[33:0], inst48_out[33:0],
        inst47_out[33:0], inst46_out[33:0], inst45_out[33:0], inst44_out[33:0], inst43_out[33:0], inst42_out[33:0], inst41_out[33:0], inst40_out[33:0],
        inst39_out[33:0], inst38_out[33:0], inst37_out[33:0], inst36_out[33:0], inst35_out[33:0], inst34_out[33:0], inst33_out[33:0], inst32_out[33:0],
        inst31_out[33:0], inst30_out[33:0], inst29_out[33:0], inst28_out[33:0], inst27_out[33:0], inst26_out[33:0], inst25_out[33:0], inst24_out[33:0],
        inst23_out[33:0], inst22_out[33:0], inst21_out[33:0], inst20_out[33:0], inst19_out[33:0], inst18_out[33:0], inst17_out[33:0], inst16_out[33:0],
        inst15_out[33:0], inst14_out[33:0], inst13_out[33:0], inst12_out[33:0], inst11_out[33:0], inst10_out[33:0], inst9_out[33:0] , inst8_out[33:0] ,
        inst7_out[33:0] , inst6_out[33:0] , inst5_out[33:0] , inst4_out[33:0] , inst3_out[33:0] , inst2_out[33:0] , inst1_out[33:0] , inst0_out[33:0]
};



endmodule
