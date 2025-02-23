`timescale 1ns/1ns
//256 * 34 bit = 8704 bit   128 * 34 bit = 4352 bit
module butterfly256(
    input wire [8703:0] butterfly256_in,
    output wire [8703:0] butterfly256_out
);
//128个基2模块，W为：
//W256^0、W256^1、W256^2、W256^3、W256^4、W256^5、W256^6、W256^7、W256^8、W256^9、W256^10、W256^11、W256^12、
//W256^13、W256^14、W256^15、W256^16、W256^17、W256^18、W256^19、W256^20、W256^21、W256^22、W256^23、
//W256^24、W256^25、W256^26、W256^27、W256^28、W256^29、W256^30、W256^31、W256^32、W256^33、W256^34、
//W256^35、W256^36、W256^37、W256^38、W256^39、W256^40、W256^41、W256^42、W256^43、W256^44、W256^45、
//W256^46、W256^47、W256^48、W256^49、W256^50、W256^51、W256^52、W256^53、W256^54、W256^55、W256^56、
//W256^57、W256^58、W256^59、W256^60、W256^61、W256^62、W256^63、W256^64、W256^65、W256^66、W256^67、
//W256^68、W256^69、W256^70、W256^71、W256^72、W256^73、W256^74、W256^75、W256^76、W256^77、W256^78、
//W256^79、W256^80、W256^81、W256^82、W256^83、W256^84、W256^85、W256^86、W256^87、W256^88、W256^89、
//W256^90、W256^91、W256^92、W256^93、W256^94、W256^95、W256^96、W256^97、W256^98、W256^99、W256^100、
//W256^101、W256^102、W256^103、W256^104、W256^105、W256^106、W256^107、W256^108、W256^109、W256^110、W256^111、
//W256^112、W256^113、W256^114、W256^115、W256^116、W256^117、W256^118、W256^119、W256^120、W256^121、W256^122、
//W256^123、W256^124、W256^125、W256^126、W256^127、
//****************************************************************************************************************
wire [67:0] butterfly2_inst0_out  ,butterfly2_inst1_out  ,butterfly2_inst2_out  ,butterfly2_inst3_out;
wire [67:0] butterfly2_inst4_out  ,butterfly2_inst5_out  ,butterfly2_inst6_out  ,butterfly2_inst7_out;
wire [67:0] butterfly2_inst8_out  ,butterfly2_inst9_out  ,butterfly2_inst10_out ,butterfly2_inst11_out;
wire [67:0] butterfly2_inst12_out ,butterfly2_inst13_out ,butterfly2_inst14_out ,butterfly2_inst15_out;
wire [67:0] butterfly2_inst16_out ,butterfly2_inst17_out ,butterfly2_inst18_out ,butterfly2_inst19_out;
wire [67:0] butterfly2_inst20_out ,butterfly2_inst21_out ,butterfly2_inst22_out ,butterfly2_inst23_out;
wire [67:0] butterfly2_inst24_out ,butterfly2_inst25_out ,butterfly2_inst26_out ,butterfly2_inst27_out;
wire [67:0] butterfly2_inst28_out ,butterfly2_inst29_out ,butterfly2_inst30_out ,butterfly2_inst31_out;
wire [67:0] butterfly2_inst32_out ,butterfly2_inst33_out ,butterfly2_inst34_out ,butterfly2_inst35_out;
wire [67:0] butterfly2_inst36_out ,butterfly2_inst37_out ,butterfly2_inst38_out ,butterfly2_inst39_out;
wire [67:0] butterfly2_inst40_out ,butterfly2_inst41_out ,butterfly2_inst42_out ,butterfly2_inst43_out;
wire [67:0] butterfly2_inst44_out ,butterfly2_inst45_out ,butterfly2_inst46_out ,butterfly2_inst47_out;
wire [67:0] butterfly2_inst48_out ,butterfly2_inst49_out ,butterfly2_inst50_out ,butterfly2_inst51_out;
wire [67:0] butterfly2_inst52_out ,butterfly2_inst53_out ,butterfly2_inst54_out ,butterfly2_inst55_out;
wire [67:0] butterfly2_inst56_out ,butterfly2_inst57_out ,butterfly2_inst58_out ,butterfly2_inst59_out;
wire [67:0] butterfly2_inst60_out ,butterfly2_inst61_out ,butterfly2_inst62_out ,butterfly2_inst63_out;
wire [67:0] butterfly2_inst64_out ,butterfly2_inst65_out ,butterfly2_inst66_out ,butterfly2_inst67_out;
wire [67:0] butterfly2_inst68_out ,butterfly2_inst69_out ,butterfly2_inst70_out ,butterfly2_inst71_out;
wire [67:0] butterfly2_inst72_out ,butterfly2_inst73_out ,butterfly2_inst74_out ,butterfly2_inst75_out;
wire [67:0] butterfly2_inst76_out ,butterfly2_inst77_out ,butterfly2_inst78_out ,butterfly2_inst79_out;
wire [67:0] butterfly2_inst80_out ,butterfly2_inst81_out ,butterfly2_inst82_out ,butterfly2_inst83_out;
wire [67:0] butterfly2_inst84_out ,butterfly2_inst85_out ,butterfly2_inst86_out ,butterfly2_inst87_out;
wire [67:0] butterfly2_inst88_out ,butterfly2_inst89_out ,butterfly2_inst90_out ,butterfly2_inst91_out;
wire [67:0] butterfly2_inst92_out ,butterfly2_inst93_out ,butterfly2_inst94_out ,butterfly2_inst95_out;
wire [67:0] butterfly2_inst96_out ,butterfly2_inst97_out ,butterfly2_inst98_out ,butterfly2_inst99_out;
wire [67:0] butterfly2_inst100_out,butterfly2_inst101_out,butterfly2_inst102_out,butterfly2_inst103_out;
wire [67:0] butterfly2_inst104_out,butterfly2_inst105_out,butterfly2_inst106_out,butterfly2_inst107_out;
wire [67:0] butterfly2_inst108_out,butterfly2_inst109_out,butterfly2_inst110_out,butterfly2_inst111_out;
wire [67:0] butterfly2_inst112_out,butterfly2_inst113_out,butterfly2_inst114_out,butterfly2_inst115_out;
wire [67:0] butterfly2_inst116_out,butterfly2_inst117_out,butterfly2_inst118_out,butterfly2_inst119_out;
wire [67:0] butterfly2_inst120_out,butterfly2_inst121_out,butterfly2_inst122_out,butterfly2_inst123_out;
wire [67:0] butterfly2_inst124_out,butterfly2_inst125_out,butterfly2_inst126_out,butterfly2_inst127_out;
//****************************************************************************************************************
// module butterfly2(
//     input wire [67:0] butterfly2_in,
//     input wire [5:0] rotation,
//     output wire [67:0] butterfly2_out
// );//10110110
butterfly2 butterfly2_inst0(
    .butterfly2_in({butterfly256_in[4385:4352],butterfly256_in[33:0]}),
    .rotation(7'b0000000),//[6:0]
    .butterfly2_out(butterfly2_inst0_out)
);

butterfly2 butterfly2_inst1(
    .butterfly2_in({butterfly256_in[4419:4386],butterfly256_in[67:34]}),
    .rotation(7'b0000001),//[6:0]
    .butterfly2_out(butterfly2_inst1_out)
);

butterfly2 butterfly2_inst2(
    .butterfly2_in({butterfly256_in[4453:4420],butterfly256_in[101:68]}),
    .rotation(7'b0000010),//[6:0]
    .butterfly2_out(butterfly2_inst2_out)
);

butterfly2 butterfly2_inst3(
    .butterfly2_in({butterfly256_in[4487:4454],butterfly256_in[135:102]}),
    .rotation(7'b0000011),//[6:0]
    .butterfly2_out(butterfly2_inst3_out)
);

butterfly2 butterfly2_inst4(
    .butterfly2_in({butterfly256_in[4521:4488],butterfly256_in[169:136]}),
    .rotation(7'b0000100),//[6:0]
    .butterfly2_out(butterfly2_inst4_out)
);

butterfly2 butterfly2_inst5(
    .butterfly2_in({butterfly256_in[4555:4522],butterfly256_in[203:170]}),
    .rotation(7'b0000101),//[6:0]
    .butterfly2_out(butterfly2_inst5_out)
);

butterfly2 butterfly2_inst6(
    .butterfly2_in({butterfly256_in[4589:4556],butterfly256_in[237:204]}),
    .rotation(7'b0000110),//[6:0]
    .butterfly2_out(butterfly2_inst6_out)
);

butterfly2 butterfly2_inst7(
    .butterfly2_in({butterfly256_in[4623:4590],butterfly256_in[271:238]}),
    .rotation(7'b0000111),//[6:0]
    .butterfly2_out(butterfly2_inst7_out)
);

butterfly2 butterfly2_inst8(
    .butterfly2_in({butterfly256_in[4657:4624],butterfly256_in[305:272]}),
    .rotation(7'b0001000),//[6:0]
    .butterfly2_out(butterfly2_inst8_out)
);

butterfly2 butterfly2_inst9(
    .butterfly2_in({butterfly256_in[4691:4658],butterfly256_in[339:306]}),
    .rotation(7'b0001001),//[6:0]
    .butterfly2_out(butterfly2_inst9_out)
);

butterfly2 butterfly2_inst10(
    .butterfly2_in({butterfly256_in[4725:4692],butterfly256_in[373:340]}),
    .rotation(7'b0001010),//[6:0]
    .butterfly2_out(butterfly2_inst10_out)
);

butterfly2 butterfly2_inst11(
    .butterfly2_in({butterfly256_in[4726+:34],butterfly256_in[407:374]}),
    .rotation(7'b0001011),//[6:0]
    .butterfly2_out(butterfly2_inst11_out)
);

butterfly2 butterfly2_inst12(
    .butterfly2_in({butterfly256_in[4759+:34],butterfly256_in[441:408]}),
    .rotation(7'b0001100),//[6:0]
    .butterfly2_out(butterfly2_inst12_out)
);

butterfly2 butterfly2_inst13(
    .butterfly2_in({butterfly256_in[4793+:34],butterfly256_in[475:442]}),
    .rotation(7'b0001101),//[6:0]
    .butterfly2_out(butterfly2_inst13_out)
);

butterfly2 butterfly2_inst14(
    .butterfly2_in({butterfly256_in[4827+:34],butterfly256_in[509:476]}),
    .rotation(7'b0001110),//[6:0]
    .butterfly2_out(butterfly2_inst14_out)
);

butterfly2 butterfly2_inst15(
    .butterfly2_in({butterfly256_in[4861+:34],butterfly256_in[543:510]}),
    .rotation(7'b0001111),//[6:0]
    .butterfly2_out(butterfly2_inst15_out)
);

butterfly2 butterfly2_inst16(
    .butterfly2_in({butterfly256_in[4895+:34],butterfly256_in[577:544]}),
    .rotation(7'b0010000),//[6:0]
    .butterfly2_out(butterfly2_inst16_out)
);

butterfly2 butterfly2_inst17(
    .butterfly2_in({butterfly256_in[4929+:34],butterfly256_in[611:578]}),
    .rotation(7'b0010001),//[6:0]
    .butterfly2_out(butterfly2_inst17_out)
);

butterfly2 butterfly2_inst18(
    .butterfly2_in({butterfly256_in[4963+:34],butterfly256_in[645:612]}),
    .rotation(7'b0010010),//[6:0]
    .butterfly2_out(butterfly2_inst18_out)
);

butterfly2 butterfly2_inst19(
    .butterfly2_in({butterfly256_in[4997+:34],butterfly256_in[679:646]}),
    .rotation(7'b0010011),//[6:0]
    .butterfly2_out(butterfly2_inst19_out)
);

butterfly2 butterfly2_inst20(
    .butterfly2_in({butterfly256_in[5031+:34],butterfly256_in[713:680]}),
    .rotation(7'b0010100),//[6:0]
    .butterfly2_out(butterfly2_inst20_out)
);

butterfly2 butterfly2_inst21(
    .butterfly2_in({butterfly256_in[5065+:34],butterfly256_in[747:714]}),
    .rotation(7'b0010101),//[6:0]
    .butterfly2_out(butterfly2_inst21_out)
);

butterfly2 butterfly2_inst22(
    .butterfly2_in({butterfly256_in[5099+:34],butterfly256_in[781:748]}),
    .rotation(7'b0010110),//[6:0]
    .butterfly2_out(butterfly2_inst22_out)
);

butterfly2 butterfly2_inst23(
    .butterfly2_in({butterfly256_in[5133+:34],butterfly256_in[815:782]}),
    .rotation(7'b0010111),//[6:0]
    .butterfly2_out(butterfly2_inst23_out)
);

butterfly2 butterfly2_inst24(
    .butterfly2_in({butterfly256_in[5167+:34],butterfly256_in[849:816]}),
    .rotation(7'b0011000),//[6:0]
    .butterfly2_out(butterfly2_inst24_out)
);

butterfly2 butterfly2_inst25(
    .butterfly2_in({butterfly256_in[5201+:34],butterfly256_in[883:850]}),
    .rotation(7'b0011001),//[6:0]
    .butterfly2_out(butterfly2_inst25_out)
);

butterfly2 butterfly2_inst26(
    .butterfly2_in({butterfly256_in[5235+:34],butterfly256_in[917:884]}),
    .rotation(7'b0011010),//[6:0]
    .butterfly2_out(butterfly2_inst26_out)
);

butterfly2 butterfly2_inst27(
    .butterfly2_in({butterfly256_in[5269+:34],butterfly256_in[951:918]}),
    .rotation(7'b0011011),//[6:0]
    .butterfly2_out(butterfly2_inst27_out)
);

butterfly2 butterfly2_inst28(
    .butterfly2_in({butterfly256_in[5303+:34],butterfly256_in[985:952]}),
    .rotation(7'b0011100),//[6:0]
    .butterfly2_out(butterfly2_inst28_out)
);

butterfly2 butterfly2_inst29(
    .butterfly2_in({butterfly256_in[5337+:34],butterfly256_in[1019:986]}),
    .rotation(7'b001110),//[6:0]
    .butterfly2_out(butterfly2_inst29_out)
);

butterfly2 butterfly2_inst30(
    .butterfly2_in({butterfly256_in[5371+:34],butterfly256_in[1053:1020]}),
    .rotation(7'b0011110),//[6:0]
    .butterfly2_out(butterfly2_inst30_out)
);

butterfly2 butterfly2_inst31(
    .butterfly2_in({butterfly256_in[5405+:34],butterfly256_in[1087:1054]}),
    .rotation(7'b0011111),//[6:0]
    .butterfly2_out(butterfly2_inst31_out)
);

butterfly2 butterfly2_inst32(
    .butterfly2_in({butterfly256_in[5439+:34],butterfly256_in[1121:1088]}),
    .rotation(7'b0100000),//[6:0]
    .butterfly2_out(butterfly2_inst32_out)
);

butterfly2 butterfly2_inst33(
    .butterfly2_in({butterfly256_in[5473+:34],butterfly256_in[1155:1122]}),
    .rotation(7'b0100001),//[6:0]
    .butterfly2_out(butterfly2_inst33_out)
);

butterfly2 butterfly2_inst34(
    .butterfly2_in({butterfly256_in[5507+:34],butterfly256_in[1189:1156]}),
    .rotation(7'b0100010),//[6:0]
    .butterfly2_out(butterfly2_inst34_out)
);

butterfly2 butterfly2_inst35(
    .butterfly2_in({butterfly256_in[5541+:34],butterfly256_in[1223:1190]}),
    .rotation(7'b0100011),//[6:0]
    .butterfly2_out(butterfly2_inst35_out)
);

butterfly2 butterfly2_inst36(
    .butterfly2_in({butterfly256_in[5575+:34],butterfly256_in[1257:1224]}),
    .rotation(7'b0100100),//[6:0]
    .butterfly2_out(butterfly2_inst36_out)
);

butterfly2 butterfly2_inst37(
    .butterfly2_in({butterfly256_in[5609+:34],butterfly256_in[1291:1258]}),
    .rotation(7'b0100101),//[6:0]
    .butterfly2_out(butterfly2_inst37_out)
);

butterfly2 butterfly2_inst38(
    .butterfly2_in({butterfly256_in[5643+:34],butterfly256_in[1325:1292]}),
    .rotation(7'b0100110),//[6:0]
    .butterfly2_out(butterfly2_inst38_out)
);

butterfly2 butterfly2_inst39(
    .butterfly2_in({butterfly256_in[5677+:34],butterfly256_in[1359:1326]}),
    .rotation(7'b0100111),//[6:0]
    .butterfly2_out(butterfly2_inst39_out)
);

butterfly2 butterfly2_inst40(
    .butterfly2_in({butterfly256_in[5711+:34],butterfly256_in[1393:1360]}),
    .rotation(7'b0101000),//[6:0]
    .butterfly2_out(butterfly2_inst40_out)
);

butterfly2 butterfly2_inst41(
    .butterfly2_in({butterfly256_in[5745+:34],butterfly256_in[1427:1394]}),
    .rotation(7'b0101001),//[6:0]
    .butterfly2_out(butterfly2_inst41_out)
);

butterfly2 butterfly2_inst42(
    .butterfly2_in({butterfly256_in[5779+:34],butterfly256_in[1461:1428]}),
    .rotation(7'b0101010),//[6:0]
    .butterfly2_out(butterfly2_inst42_out)
);

butterfly2 butterfly2_inst43(
    .butterfly2_in({butterfly256_in[5813+:34],butterfly256_in[1495:1462]}),
    .rotation(7'b0101011),//[6:0]
    .butterfly2_out(butterfly2_inst43_out)
);

butterfly2 butterfly2_inst44(
    .butterfly2_in({butterfly256_in[5847+:34],butterfly256_in[1529:1496]}),
    .rotation(7'b0101100),//[6:0]
    .butterfly2_out(butterfly2_inst44_out)
);

butterfly2 butterfly2_inst45(
    .butterfly2_in({butterfly256_in[5881+:34],butterfly256_in[1563:1530]}),
    .rotation(7'b0101101),//[6:0]
    .butterfly2_out(butterfly2_inst45_out)
);

butterfly2 butterfly2_inst46(
    .butterfly2_in({butterfly256_in[5915+:34],butterfly256_in[1597:1564]}),
    .rotation(7'b0101110),//[6:0]
    .butterfly2_out(butterfly2_inst46_out)
);

butterfly2 butterfly2_inst47(
    .butterfly2_in({butterfly256_in[5949+:34],butterfly256_in[1631:1598]}),
    .rotation(7'b0101111),//[6:0]
    .butterfly2_out(butterfly2_inst47_out)
);

butterfly2 butterfly2_inst48(
    .butterfly2_in({butterfly256_in[5983+:34],butterfly256_in[1665:1632]}),
    .rotation(7'b0110000),//[6:0]
    .butterfly2_out(butterfly2_inst48_out)
);

butterfly2 butterfly2_inst49(
    .butterfly2_in({butterfly256_in[6017+:34],butterfly256_in[1699:1666]}),
    .rotation(7'b0110001),//[6:0]
    .butterfly2_out(butterfly2_inst49_out)
);

butterfly2 butterfly2_inst50(
    .butterfly2_in({butterfly256_in[6051+:34],butterfly256_in[1733:1700]}),
    .rotation(7'b0110010),//[6:0]
    .butterfly2_out(butterfly2_inst50_out)
);

butterfly2 butterfly2_inst51(
    .butterfly2_in({butterfly256_in[6085+:34],butterfly256_in[1767:1734]}),
    .rotation(7'b0110011),//[6:0]
    .butterfly2_out(butterfly2_inst51_out)
);

butterfly2 butterfly2_inst52(
    .butterfly2_in({butterfly256_in[6119+:34],butterfly256_in[1801:1768]}),
    .rotation(7'b0110100),//[6:0]
    .butterfly2_out(butterfly2_inst52_out)
);

butterfly2 butterfly2_inst53(
    .butterfly2_in({butterfly256_in[6153+:34],butterfly256_in[1835:1802]}),
    .rotation(7'b0110101),//[6:0]
    .butterfly2_out(butterfly2_inst53_out)
);

butterfly2 butterfly2_inst54(
    .butterfly2_in({butterfly256_in[6187+:34],butterfly256_in[1869:1836]}),
    .rotation(7'b0110110),//[6:0]
    .butterfly2_out(butterfly2_inst54_out)
);

butterfly2 butterfly2_inst55(
    .butterfly2_in({butterfly256_in[6221+:34],butterfly256_in[1903:1870]}),
    .rotation(7'b0110111),//[6:0]
    .butterfly2_out(butterfly2_inst55_out)
);

butterfly2 butterfly2_inst56(
    .butterfly2_in({butterfly256_in[6255+:34],butterfly256_in[1937:1904]}),
    .rotation(7'b0111000),//[6:0]
    .butterfly2_out(butterfly2_inst56_out)
);

butterfly2 butterfly2_inst57(
    .butterfly2_in({butterfly256_in[6289+:34],butterfly256_in[1971:1938]}),
    .rotation(7'b0111001),//[6:0]
    .butterfly2_out(butterfly2_inst57_out)
);

butterfly2 butterfly2_inst58(
    .butterfly2_in({butterfly256_in[6323+:34],butterfly256_in[2005:1972]}),
    .rotation(7'b0111010),//[6:0]
    .butterfly2_out(butterfly2_inst58_out)
);

butterfly2 butterfly2_inst59(
    .butterfly2_in({butterfly256_in[6357+:34],butterfly256_in[2039:2006]}),
    .rotation(7'b0111011),//[6:0]
    .butterfly2_out(butterfly2_inst59_out)
);

butterfly2 butterfly2_inst60(
    .butterfly2_in({butterfly256_in[6391+:34],butterfly256_in[2073:2040]}),
    .rotation(7'b0111100),//[6:0]
    .butterfly2_out(butterfly2_inst60_out)
);

butterfly2 butterfly2_inst61(
    .butterfly2_in({butterfly256_in[6425+:34],butterfly256_in[2107:2074]}),
    .rotation(7'b0111101),//[6:0]
    .butterfly2_out(butterfly2_inst61_out)
);

butterfly2 butterfly2_inst62(
    .butterfly2_in({butterfly256_in[6459+:34],butterfly256_in[2141:2108]}),
    .rotation(7'b0111110),//[6:0]
    .butterfly2_out(butterfly2_inst62_out)
);

butterfly2 butterfly2_inst63(
    .butterfly2_in({butterfly256_in[6493+:34],butterfly256_in[2175:2142]}),
    .rotation(7'b0111111),//[6:0]
    .butterfly2_out(butterfly2_inst63_out)
);

butterfly2 butterfly2_inst64(
    .butterfly2_in({butterfly256_in[6527+:34],butterfly256_in[2209:2176]}),
    .rotation(7'b1000000),//[6:0]
    .butterfly2_out(butterfly2_inst64_out)
);

butterfly2 butterfly2_inst65(
    .butterfly2_in({butterfly256_in[6561+:34],butterfly256_in[2243:2210]}),
    .rotation(7'b1000001),//[6:0]
    .butterfly2_out(butterfly2_inst65_out)
);

butterfly2 butterfly2_inst66(
    .butterfly2_in({butterfly256_in[6595+:34],butterfly256_in[2277:2244]}),
    .rotation(7'b1000010),//[6:0]
    .butterfly2_out(butterfly2_inst66_out)
);

butterfly2 butterfly2_inst67(
    .butterfly2_in({butterfly256_in[6629+:34],butterfly256_in[2311:2278]}),
    .rotation(7'b1000011),//[6:0]
    .butterfly2_out(butterfly2_inst67_out)
);

butterfly2 butterfly2_inst68(
    .butterfly2_in({butterfly256_in[6663+:34],butterfly256_in[2345:2312]}),
    .rotation(7'b1000100),//[6:0]
    .butterfly2_out(butterfly2_inst68_out)
);

butterfly2 butterfly2_inst69(
    .butterfly2_in({butterfly256_in[6697+:34],butterfly256_in[2379:2346]}),
    .rotation(7'b1000101),//[6:0]
    .butterfly2_out(butterfly2_inst69_out)
);

butterfly2 butterfly2_inst70(
    .butterfly2_in({butterfly256_in[6731+:34],butterfly256_in[2413:2380]}),
    .rotation(7'b1000110),//[6:0]
    .butterfly2_out(butterfly2_inst70_out)
);

butterfly2 butterfly2_inst71(
    .butterfly2_in({butterfly256_in[6765+:34],butterfly256_in[2447:2414]}),
    .rotation(7'b1000111),//[6:0]
    .butterfly2_out(butterfly2_inst71_out)
);

butterfly2 butterfly2_inst72(
    .butterfly2_in({butterfly256_in[6799+:34],butterfly256_in[2481:2448]}),
    .rotation(7'b1001000),//[6:0]
    .butterfly2_out(butterfly2_inst72_out)
);

butterfly2 butterfly2_inst73(
    .butterfly2_in({butterfly256_in[6833+:34],butterfly256_in[2515:2482]}),
    .rotation(7'b1001001),//[6:0]
    .butterfly2_out(butterfly2_inst73_out)
);

butterfly2 butterfly2_inst74(
    .butterfly2_in({butterfly256_in[6867+:34],butterfly256_in[2549:2516]}),
    .rotation(7'b1001010),//[6:0]
    .butterfly2_out(butterfly2_inst74_out)
);

butterfly2 butterfly2_inst75(
    .butterfly2_in({butterfly256_in[6901+:34],butterfly256_in[2583:2550]}),
    .rotation(7'b1001011),//[6:0]
    .butterfly2_out(butterfly2_inst75_out)
);

butterfly2 butterfly2_inst76(
    .butterfly2_in({butterfly256_in[6935+:34],butterfly256_in[2617:2584]}),
    .rotation(7'b1001100),//[6:0]
    .butterfly2_out(butterfly2_inst76_out)
);

butterfly2 butterfly2_inst77(
    .butterfly2_in({butterfly256_in[6969+:34],butterfly256_in[2651:2618]}),
    .rotation(7'b1001101),//[6:0]
    .butterfly2_out(butterfly2_inst77_out)
);

butterfly2 butterfly2_inst78(
    .butterfly2_in({butterfly256_in[7003+:34],butterfly256_in[2685:2652]}),
    .rotation(7'b1001110),//[6:0]
    .butterfly2_out(butterfly2_inst78_out)
);

butterfly2 butterfly2_inst79(
    .butterfly2_in({butterfly256_in[7037+:34],butterfly256_in[2719:2686]}),
    .rotation(7'b1001111),//[6:0]
    .butterfly2_out(butterfly2_inst79_out)
);

butterfly2 butterfly2_inst80(
    .butterfly2_in({butterfly256_in[7071+:34],butterfly256_in[2753:2720]}),
    .rotation(7'b1010000),//[6:0]
    .butterfly2_out(butterfly2_inst80_out)
);

butterfly2 butterfly2_inst81(
    .butterfly2_in({butterfly256_in[7105+:34],butterfly256_in[2787:2754]}),
    .rotation(7'b1010001),//[6:0]
    .butterfly2_out(butterfly2_inst81_out)
);

butterfly2 butterfly2_inst82(
    .butterfly2_in({butterfly256_in[7139+:34],butterfly256_in[2821:2788]}),
    .rotation(7'b1010010),//[6:0]
    .butterfly2_out(butterfly2_inst82_out)
);

butterfly2 butterfly2_inst83(
    .butterfly2_in({butterfly256_in[7173+:34],butterfly256_in[2855:2822]}),
    .rotation(7'b1010011),//[6:0]
    .butterfly2_out(butterfly2_inst83_out)
);

butterfly2 butterfly2_inst84(
    .butterfly2_in({butterfly256_in[7207+:34],butterfly256_in[2889:2856]}),
    .rotation(7'b1010100),//[6:0]
    .butterfly2_out(butterfly2_inst84_out)
);

butterfly2 butterfly2_inst85(
    .butterfly2_in({butterfly256_in[7241+:34],butterfly256_in[2923:2890]}),
    .rotation(7'b1010101),//[6:0]
    .butterfly2_out(butterfly2_inst85_out)
);

butterfly2 butterfly2_inst86(
    .butterfly2_in({butterfly256_in[7275+:34],butterfly256_in[2957:2924]}),
    .rotation(7'b1010110),//[6:0]
    .butterfly2_out(butterfly2_inst86_out)
);

butterfly2 butterfly2_inst87(
    .butterfly2_in({butterfly256_in[+:34],butterfly256_in[2991:2958]}),
    .rotation(7'b1010111),//[6:0]
    .butterfly2_out(butterfly2_inst87_out)
);

butterfly2 butterfly2_inst88(
    .butterfly2_in({butterfly256_in[+:34],butterfly256_in[3025:2992]}),
    .rotation(7'b1011000),//[6:0]
    .butterfly2_out(butterfly2_inst88_out)
);

butterfly2 butterfly2_inst89(
    .butterfly2_in({butterfly256_in[+:34],butterfly256_in[3059:3026]}),
    .rotation(7'b1011001),//[6:0]
    .butterfly2_out(butterfly2_inst89_out)
);

butterfly2 butterfly2_inst90(
    .butterfly2_in({butterfly256_in[+:34],butterfly256_in[3093:3060]}),
    .rotation(7'b1011010),//[6:0]
    .butterfly2_out(butterfly2_inst90_out)
);

butterfly2 butterfly2_inst91(
    .butterfly2_in({butterfly256_in[+:34],butterfly256_in[3127:3094]}),
    .rotation(7'b1011011),//[6:0]
    .butterfly2_out(butterfly2_inst91_out)
);

butterfly2 butterfly2_inst92(
    .butterfly2_in({butterfly256_in[+:34],butterfly256_in[3161:3128]}),
    .rotation(7'b1011100),//[6:0]
    .butterfly2_out(butterfly2_inst92_out)
);

butterfly2 butterfly2_inst93(
    .butterfly2_in({butterfly256_in[+:34],butterfly256_in[3195:3162]}),
    .rotation(7'b1011101),//[6:0]
    .butterfly2_out(butterfly2_inst93_out)
);

butterfly2 butterfly2_inst94(
    .butterfly2_in({butterfly256_in[+:34],butterfly256_in[3229:3196]}),
    .rotation(7'b1011110),//[6:0]
    .butterfly2_out(butterfly2_inst94_out)
);

butterfly2 butterfly2_inst95(
    .butterfly2_in({butterfly256_in[+:34],butterfly256_in[3263:3230]}),
    .rotation(7'b1011111),//[6:0]
    .butterfly2_out(butterfly2_inst95_out)
);

butterfly2 butterfly2_inst96(
    .butterfly2_in({butterfly256_in[+:34],butterfly256_in[3297:3264]}),
    .rotation(7'b1100000),//[6:0]
    .butterfly2_out(butterfly2_inst96_out)
);

butterfly2 butterfly2_inst97(
    .butterfly2_in({butterfly256_in[+:34],butterfly256_in[3331:3298]}),
    .rotation(7'b1100001),//[6:0]
    .butterfly2_out(butterfly2_inst97_out)
);

butterfly2 butterfly2_inst98(
    .butterfly2_in({butterfly256_in[+:34],butterfly256_in[3365:3332]}),
    .rotation(7'b1100010),//[6:0]
    .butterfly2_out(butterfly2_inst98_out)
);

butterfly2 butterfly2_inst99(
    .butterfly2_in({butterfly256_in[+:34],butterfly256_in[3399:3366]}),
    .rotation(7'b1100011),//[6:0]
    .butterfly2_out(butterfly2_inst99_out)
);

butterfly2 butterfly2_inst100(
    .butterfly2_in({butterfly256_in[+:34],butterfly256_in[3433:3400]}),
    .rotation(7'b1100100),//[6:0]
    .butterfly2_out(butterfly2_inst100_out)
);

butterfly2 butterfly2_inst101(
    .butterfly2_in({butterfly256_in[+:34],butterfly256_in[3467:3434]}),
    .rotation(7'b1100101),//[6:0]
    .butterfly2_out(butterfly2_inst101_out)
);

butterfly2 butterfly2_inst102(
    .butterfly2_in({butterfly256_in[+:34],butterfly256_in[3501:3468]}),
    .rotation(7'b1100110),//[6:0]
    .butterfly2_out(butterfly2_inst102_out)
);

butterfly2 butterfly2_inst103(
    .butterfly2_in({butterfly256_in[+:34],butterfly256_in[3535:3502]}),
    .rotation(7'b1100111),//[6:0]
    .butterfly2_out(butterfly2_inst103_out)
);

butterfly2 butterfly2_inst104(
    .butterfly2_in({butterfly256_in[+:34],butterfly256_in[3569:3536]}),
    .rotation(7'b1101000),//[6:0]
    .butterfly2_out(butterfly2_inst104_out)
);

butterfly2 butterfly2_inst105(
    .butterfly2_in({butterfly256_in[+:34],butterfly256_in[3603:3570]}),
    .rotation(7'b1101001),//[6:0]
    .butterfly2_out(butterfly2_inst105_out)
);

butterfly2 butterfly2_inst106(
    .butterfly2_in({butterfly256_in[+:34],butterfly256_in[3637:3604]}),
    .rotation(7'b1101010),//[6:0]
    .butterfly2_out(butterfly2_inst106_out)
);

butterfly2 butterfly2_inst107(
    .butterfly2_in({butterfly256_in[+:34],butterfly256_in[3671:3638]}),
    .rotation(7'b1101011),//[6:0]
    .butterfly2_out(butterfly2_inst107_out)
);

butterfly2 butterfly2_inst108(
    .butterfly2_in({butterfly256_in[+:34],butterfly256_in[3705:3672]}),
    .rotation(7'b1101100),//[6:0]
    .butterfly2_out(butterfly2_inst108_out)
);

butterfly2 butterfly2_inst109(
    .butterfly2_in({butterfly256_in[+:34],butterfly256_in[3739:3706]}),
    .rotation(7'b1101101),//[6:0]
    .butterfly2_out(butterfly2_inst109_out)
);

butterfly2 butterfly2_inst110(
    .butterfly2_in({butterfly256_in[+:34],butterfly256_in[3773:3740]}),
    .rotation(7'b1101110),//[6:0]
    .butterfly2_out(butterfly2_inst110_out)
);

butterfly2 butterfly2_inst111(
    .butterfly2_in({butterfly256_in[+:34],butterfly256_in[3807:3774]}),
    .rotation(7'b1101111),//[6:0]
    .butterfly2_out(butterfly2_inst111_out)
);

butterfly2 butterfly2_inst112(
    .butterfly2_in({butterfly256_in[+:34],butterfly256_in[3841:3808]}),
    .rotation(7'b1110000),//[6:0]
    .butterfly2_out(butterfly2_inst112_out)
);

butterfly2 butterfly2_inst113(
    .butterfly2_in({butterfly256_in[+:34],butterfly256_in[3875:3842]}),
    .rotation(7'b1110001),//[6:0]
    .butterfly2_out(butterfly2_inst113_out)
);

butterfly2 butterfly2_inst114(
    .butterfly2_in({butterfly256_in[+:34],butterfly256_in[3909:3876]}),
    .rotation(7'b1110010),//[6:0]
    .butterfly2_out(butterfly2_inst114_out)
);

butterfly2 butterfly2_inst115(
    .butterfly2_in({butterfly256_in[+:34],butterfly256_in[3943:3910]}),
    .rotation(7'b1110011),//[6:0]
    .butterfly2_out(butterfly2_inst115_out)
);

butterfly2 butterfly2_inst116(
    .butterfly2_in({butterfly256_in[+:34],butterfly256_in[3977:3944]}),
    .rotation(7'b1110100),//[6:0]
    .butterfly2_out(butterfly2_inst116_out)
);

butterfly2 butterfly2_inst117(
    .butterfly2_in({butterfly256_in[+:34],butterfly256_in[4011:3978]}),
    .rotation(7'b1110101),//[6:0]
    .butterfly2_out(butterfly2_inst117_out)
);

butterfly2 butterfly2_inst118(
    .butterfly2_in({butterfly256_in[+:34],butterfly256_in[4045:4012]}),
    .rotation(7'b1110110),//[6:0]
    .butterfly2_out(butterfly2_inst118_out)
);

butterfly2 butterfly2_inst119(
    .butterfly2_in({butterfly256_in[+:34],butterfly256_in[4079:4046]}),
    .rotation(7'b1110111),//[6:0]
    .butterfly2_out(butterfly2_inst119_out)
);

butterfly2 butterfly2_inst120(
    .butterfly2_in({butterfly256_in[+:34],butterfly256_in[4113:4080]}),
    .rotation(7'b1111000),//[6:0]
    .butterfly2_out(butterfly2_inst120_out)
);

butterfly2 butterfly2_inst121(
    .butterfly2_in({butterfly256_in[+:34],butterfly256_in[4147:4114]}),
    .rotation(7'b1111001),//[6:0]
    .butterfly2_out(butterfly2_inst121_out)
);

butterfly2 butterfly2_inst122(
    .butterfly2_in({butterfly256_in[+:34],butterfly256_in[4181:4148]}),
    .rotation(7'b1111010),//[6:0]
    .butterfly2_out(butterfly2_inst122_out)
);

butterfly2 butterfly2_inst123(
    .butterfly2_in({butterfly256_in[+:34],butterfly256_in[4215:4182]}),
    .rotation(7'b1111011),//[6:0]
    .butterfly2_out(butterfly2_inst123_out)
);

butterfly2 butterfly2_inst124(
    .butterfly2_in({butterfly256_in[+:34],butterfly256_in[4249:4216]}),
    .rotation(7'b1111100),//[6:0]
    .butterfly2_out(butterfly2_inst124_out)
);

butterfly2 butterfly2_inst125(
    .butterfly2_in({butterfly256_in[+:34],butterfly256_in[4283:4250]}),
    .rotation(7'b1111101),//[6:0]
    .butterfly2_out(butterfly2_inst125_out)
);

butterfly2 butterfly2_inst126(
    .butterfly2_in({butterfly256_in[+:34],butterfly256_in[4317:4284]}),
    .rotation(7'b1111110),//[6:0]
    .butterfly2_out(butterfly2_inst126_out)
);

butterfly2 butterfly2_inst127(
    .butterfly2_in({butterfly256_in[+:34],butterfly256_in[4351:4318]}),
    .rotation(7'b1111111),//[6:0]
    .butterfly2_out(butterfly2_inst127_out)
);

//****************************************************************************************************************

assign butterfly256_out = {
        
        
        
        
        butterfly2_inst19_out[33:0],butterfly2_inst18_out[33:0],butterfly2_inst17_out[33:0],butterfly2_inst16_out[33:0],
        butterfly2_inst15_out[33:0],butterfly2_inst14_out[33:0],butterfly2_inst13_out[33:0],butterfly2_inst12_out[33:0],
        butterfly2_inst11_out[33:0],butterfly2_inst10_out[33:0],butterfly2_inst9_out[33:0],butterfly2_inst8_out[33:0],
        butterfly2_inst7_out[33:0],butterfly2_inst6_out[33:0],butterfly2_inst5_out[33:0],butterfly2_inst4_out[33:0],
        butterfly2_inst3_out[33:0],butterfly2_inst2_out[33:0],butterfly2_inst1_out[33:0],butterfly2_inst0_out[33:0]

};

endmodule