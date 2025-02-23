`timescale  1ns/1ns

//64位FFT算法模块 输入64组34bit数据，输出64组34bit数据
module butterfly64(
    input wire  [2175:0] butterfly64_in,
    output wire [2175:0] butterfly64_out
);
wire [543:0] butterfly16_inst_0_out;
wire [543:0] butterfly16_inst_1_out;
wire [543:0] butterfly16_inst_2_out;
wire [543:0] butterfly16_inst_3_out;

wire [135:0] butterfly4_inst_0_out,  butterfly4_inst_1_out,  butterfly4_inst_2_out,  butterfly4_inst_3_out;
wire [135:0] butterfly4_inst_4_out,  butterfly4_inst_5_out,  butterfly4_inst_6_out,  butterfly4_inst_7_out;
wire [135:0] butterfly4_inst_8_out,  butterfly4_inst_9_out,  butterfly4_inst_10_out, butterfly4_inst_11_out;
wire [135:0] butterfly4_inst_12_out, butterfly4_inst_13_out, butterfly4_inst_14_out, butterfly4_inst_15_out;
//parameter rotation
//**************************************************************butterfly16***************************************************************
// butterfly16(
//     input   wire [543:0] butterfly_in,
//     output  wire [543:0] butterfly_out
// );
 butterfly16 butterfly16_inst_0(
     .butterfly_in(
        {butterfly64_in[2073:2040]    ,butterfly64_in[1937:1904]   ,butterfly64_in[1801:1768]    ,butterfly64_in[1665:1632],
         butterfly64_in[1529:1496]    ,butterfly64_in[1393:1360]   ,butterfly64_in[1257:1224]    ,butterfly64_in[1121:1088],
         butterfly64_in[985:952]      ,butterfly64_in[849:816]     ,butterfly64_in[713:680]      ,butterfly64_in[577:544],
         butterfly64_in[441:408]      ,butterfly64_in[305:272]     ,butterfly64_in[169:136]      ,butterfly64_in[33:0] }),
     .butterfly_out(butterfly16_inst_0_out)
);

 butterfly16 butterfly16_inst_1(
     .butterfly_in(
        {butterfly64_in[2107:2074]    ,butterfly64_in[1971:1938]   ,butterfly64_in[1835:1802]    ,butterfly64_in[1699:1666],
         butterfly64_in[1563:1530]    ,butterfly64_in[1427:1394]   ,butterfly64_in[1291:1258]    ,butterfly64_in[1155:1122],
         butterfly64_in[1019:986]     ,butterfly64_in[883:850]     ,butterfly64_in[747:714]      ,butterfly64_in[611:578],
         butterfly64_in[475:442]      ,butterfly64_in[339:306]     ,butterfly64_in[203:170]      ,butterfly64_in[67:34] }),
     .butterfly_out(butterfly16_inst_1_out)
);

 butterfly16 butterfly16_inst_2(
     .butterfly_in(
        {butterfly64_in[2141:2108]    ,butterfly64_in[2005:1972]   ,butterfly64_in[1869:1836]    ,butterfly64_in[1733:1700],
         butterfly64_in[1597:1564]    ,butterfly64_in[1461:1428]   ,butterfly64_in[1325:1292]    ,butterfly64_in[1189:1156],
         butterfly64_in[1053:1020]    ,butterfly64_in[917:884]     ,butterfly64_in[781:748]      ,butterfly64_in[645:612],
         butterfly64_in[509:476]      ,butterfly64_in[373:340]     ,butterfly64_in[237:204]      ,butterfly64_in[101:68] }),
     .butterfly_out(butterfly16_inst_2_out)
);

 butterfly16 butterfly16_inst_3(
     .butterfly_in(
        {butterfly64_in[2175:2142]    ,butterfly64_in[2039:2006]   ,butterfly64_in[1903:1870]    ,butterfly64_in[1767:1734],
         butterfly64_in[1631:1598]    ,butterfly64_in[1495:1462]   ,butterfly64_in[1359:1326]    ,butterfly64_in[1223:1190],
         butterfly64_in[1087:1054]    ,butterfly64_in[951:918]     ,butterfly64_in[815:782]      ,butterfly64_in[679:646],
         butterfly64_in[543:510]      ,butterfly64_in[407:374]     ,butterfly64_in[271:238]      ,butterfly64_in[135:102] }),
     .butterfly_out(butterfly16_inst_3_out)
);
//  butterfly16 butterfly16_inst_0(
//      .butterfly_in(
//         {butterfly64_in[]    ,butterfly64_in[]   ,butterfly64_in[]    ,butterfly64_in[],
//          butterfly64_in[]    ,butterfly64_in[]   ,butterfly64_in[]    ,butterfly64_in[],
//          butterfly64_in[]    ,butterfly64_in[]   ,butterfly64_in[]    ,butterfly64_in[],
//          butterfly64_in[]    ,butterfly64_in[]   ,butterfly64_in[]    ,butterfly64_in[] }),
//      .butterfly_out(butterfly16_inst_0_out)
// );

//  butterfly16 butterfly16_inst_1(
//      .butterfly_in(
//         {butterfly64_in[]    ,butterfly64_in[]   ,butterfly64_in[]    ,butterfly64_in[],
//          butterfly64_in[]    ,butterfly64_in[]   ,butterfly64_in[]    ,butterfly64_in[],
//          butterfly64_in[]    ,butterfly64_in[]   ,butterfly64_in[]    ,butterfly64_in[],
//          butterfly64_in[]    ,butterfly64_in[]   ,butterfly64_in[]    ,butterfly64_in[] }),
//      .butterfly_out(butterfly16_inst_1_out)
// );

//  butterfly16 butterfly16_inst_2(
//      .butterfly_in(
//         {butterfly64_in[]    ,butterfly64_in[]   ,butterfly64_in[]    ,butterfly64_in[],
//          butterfly64_in[]    ,butterfly64_in[]   ,butterfly64_in[]    ,butterfly64_in[],
//          butterfly64_in[]    ,butterfly64_in[]   ,butterfly64_in[]    ,butterfly64_in[],
//          butterfly64_in[]    ,butterfly64_in[]   ,butterfly64_in[]    ,butterfly64_in[] }),
//      .butterfly_out(butterfly16_inst_2_out)
// );

//  butterfly16 butterfly16_inst_3(
//      .butterfly_in(
//         {butterfly64_in[]    ,butterfly64_in[]   ,butterfly64_in[]    ,butterfly64_in[],
//          butterfly64_in[]    ,butterfly64_in[]   ,butterfly64_in[]    ,butterfly64_in[],
//          butterfly64_in[]    ,butterfly64_in[]   ,butterfly64_in[]    ,butterfly64_in[],
//          butterfly64_in[]    ,butterfly64_in[]   ,butterfly64_in[]    ,butterfly64_in[] }),
//      .butterfly_out(butterfly16_inst_3_out)
// );
// butterfly16 butterfly16_inst_0(
//     .butterfly_in(
//        {butterfly64_in[2073:2040]    ,butterfly64_in[1529:1496]   ,butterfly64_in[985:952]    ,butterfly64_in[441:408],
//         butterfly64_in[1937:1904]    ,butterfly64_in[1393:1360]   ,butterfly64_in[849:816]    ,butterfly64_in[305:272],
//         butterfly64_in[1801:1768]    ,butterfly64_in[1257:1224]   ,butterfly64_in[713:680]    ,butterfly64_in[169:136],
//         butterfly64_in[1665:1632]    ,butterfly64_in[1121:1088]   ,butterfly64_in[577:544]    ,butterfly64_in[33:0] }),
//     .butterfly_out(butterfly16_inst_0_out)
// );

// butterfly16 butterfly16_inst_1(
//     .butterfly_in(
//        {butterfly64_in[2107:2074]    ,butterfly64_in[1563:1530]   ,butterfly64_in[1019:986]   ,butterfly64_in[475:442],
//         butterfly64_in[1971:1938]    ,butterfly64_in[1427:1394]   ,butterfly64_in[883:850]    ,butterfly64_in[339:306],
//         butterfly64_in[1835:1802]    ,butterfly64_in[1291:1258]   ,butterfly64_in[747:714]    ,butterfly64_in[203:170],
//         butterfly64_in[1699:1666]    ,butterfly64_in[1155:1122]   ,butterfly64_in[611:578]    ,butterfly64_in[67:34]}),
//     .butterfly_out(butterfly16_inst_1_out)
// );

// butterfly16 butterfly16_inst_2(
//     .butterfly_in(
//        {butterfly64_in[2141:2108]    ,butterfly64_in[1597:1564]   ,butterfly64_in[1053:1020]  ,butterfly64_in[509:476],
//         butterfly64_in[2005:1972]    ,butterfly64_in[1461:1428]   ,butterfly64_in[917:884]    ,butterfly64_in[373:340],
//         butterfly64_in[1869:1836]    ,butterfly64_in[1325:1292]   ,butterfly64_in[781:748]    ,butterfly64_in[237:204],
//         butterfly64_in[1733:1700]    ,butterfly64_in[1189:1156]   ,butterfly64_in[645:612]    ,butterfly64_in[101:68]}),
//     .butterfly_out(butterfly16_inst_2_out)
// );

// butterfly16 butterfly16_inst_3(
//     .butterfly_in(
//        {butterfly64_in[2175:2142]    ,butterfly64_in[1631:1598]   ,butterfly64_in[1087:1054]  ,butterfly64_in[543:510],
//         butterfly64_in[2039:2006]    ,butterfly64_in[1495:1462]   ,butterfly64_in[951:918]    ,butterfly64_in[407:374],
//         butterfly64_in[1903:1870]    ,butterfly64_in[1359:1326]   ,butterfly64_in[815:782]    ,butterfly64_in[271:238],
//         butterfly64_in[1767:1734]    ,butterfly64_in[1223:1190]   ,butterfly64_in[679:646]    ,butterfly64_in[135:102]}),
//     .butterfly_out(butterfly16_inst_3_out)
// );
//****************************************************************************************************************************************

//**************************************************************butterfly4***************************************************************
// butterfly4(
//   input  wire [135:0] calc_in,  // The 4 numbers which need to be calculated. Format: in4(Re,Im), in3(Re,Im), in2(Re,Im), in1(Re,Im)
//   input  wire [3:0]   rotation, // Number of each butterfly computation (8 in total)
//   output wire [135:0] calc_out  // The 4 output numbers. Format: out4(Re,Im), out3(Re,Im), out2(Re,Im), out1(Re,Im)
//   );
butterfly4 butterfly4_inst_0(
    .calc_in({butterfly16_inst_3_out[33:0], butterfly16_inst_2_out[33:0], butterfly16_inst_1_out[33:0], butterfly16_inst_0_out[33:0]}),
    .rotation(4'b0000),
    .calc_out(butterfly4_inst_0_out)
);

butterfly4 butterfly4_inst_1(
    .calc_in({butterfly16_inst_3_out[67:34], butterfly16_inst_2_out[67:34], butterfly16_inst_1_out[67:34], butterfly16_inst_0_out[67:34]}),
    .rotation(4'b0001),
    .calc_out(butterfly4_inst_1_out)
);

butterfly4 butterfly4_inst_2(
    .calc_in({butterfly16_inst_3_out[101:68], butterfly16_inst_2_out[101:68], butterfly16_inst_1_out[101:68], butterfly16_inst_0_out[101:68]}),
    .rotation(4'b0010),
    .calc_out(butterfly4_inst_2_out)
);

butterfly4 butterfly4_inst_3(
    .calc_in({butterfly16_inst_3_out[135:102], butterfly16_inst_2_out[135:102], butterfly16_inst_1_out[135:102], butterfly16_inst_0_out[135:102]}),
    .rotation(4'b0011),
    .calc_out(butterfly4_inst_3_out)
);

butterfly4 butterfly4_inst_4(
    .calc_in({butterfly16_inst_3_out[169:136], butterfly16_inst_2_out[169:136], butterfly16_inst_1_out[169:136], butterfly16_inst_0_out[169:136]}),
    .rotation(4'b0100),
    .calc_out(butterfly4_inst_4_out)
);

butterfly4 butterfly4_inst_5(
    .calc_in({butterfly16_inst_3_out[203:170], butterfly16_inst_2_out[203:170], butterfly16_inst_1_out[203:170], butterfly16_inst_0_out[203:170]}),
    .rotation(4'b0101),
    .calc_out(butterfly4_inst_5_out)
);

butterfly4 butterfly4_inst_6(
    .calc_in({butterfly16_inst_3_out[237:204], butterfly16_inst_2_out[237:204], butterfly16_inst_1_out[237:204], butterfly16_inst_0_out[237:204]}),
    .rotation(4'b0110),
    .calc_out(butterfly4_inst_6_out)
);

butterfly4 butterfly4_inst_7(
    .calc_in({butterfly16_inst_3_out[271:238], butterfly16_inst_2_out[271:238], butterfly16_inst_1_out[271:238], butterfly16_inst_0_out[271:238]}),
    .rotation(4'b0111),
    .calc_out(butterfly4_inst_7_out)
);

butterfly4 butterfly4_inst_8(
    .calc_in({butterfly16_inst_3_out[305:272], butterfly16_inst_2_out[305:272], butterfly16_inst_1_out[305:272], butterfly16_inst_0_out[305:272]}),
    .rotation(4'b1000),
    .calc_out(butterfly4_inst_8_out)
);

butterfly4 butterfly4_inst_9(
    .calc_in({butterfly16_inst_3_out[339:306], butterfly16_inst_2_out[339:306], butterfly16_inst_1_out[339:306], butterfly16_inst_0_out[339:306]}),
    .rotation(4'b1001),
    .calc_out(butterfly4_inst_9_out)
);

butterfly4 butterfly4_inst_10(
    .calc_in({butterfly16_inst_3_out[373:340], butterfly16_inst_2_out[373:340], butterfly16_inst_1_out[373:340], butterfly16_inst_0_out[373:340]}),
    .rotation(4'b1010),
    .calc_out(butterfly4_inst_10_out)
);

butterfly4 butterfly4_inst_11(
    .calc_in({butterfly16_inst_3_out[407:374], butterfly16_inst_2_out[407:374], butterfly16_inst_1_out[407:374], butterfly16_inst_0_out[407:374]}),
    .rotation(4'b1011),
    .calc_out(butterfly4_inst_11_out)
);

butterfly4 butterfly4_inst_12(
    .calc_in({butterfly16_inst_3_out[441:408], butterfly16_inst_2_out[441:408], butterfly16_inst_1_out[441:408], butterfly16_inst_0_out[441:408]}),
    .rotation(4'b1100),
    .calc_out(butterfly4_inst_12_out)
);

butterfly4 butterfly4_inst_13(
    .calc_in({butterfly16_inst_3_out[475:442], butterfly16_inst_2_out[475:442], butterfly16_inst_1_out[475:442], butterfly16_inst_0_out[475:442]}),
    .rotation(4'b1101),
    .calc_out(butterfly4_inst_13_out)
);

butterfly4 butterfly4_inst_14(
    .calc_in({butterfly16_inst_3_out[509:476], butterfly16_inst_2_out[509:476], butterfly16_inst_1_out[509:476], butterfly16_inst_0_out[509:476]}),
    .rotation(4'b1110),
    .calc_out(butterfly4_inst_14_out)
);

butterfly4 butterfly4_inst_15(
    .calc_in({butterfly16_inst_3_out[543:510], butterfly16_inst_2_out[543:510], butterfly16_inst_1_out[543:510], butterfly16_inst_0_out[543:510]}),
    .rotation(4'b1111),
    .calc_out(butterfly4_inst_15_out)
);
//****************************************************************************************************************************************
//---------------------------------------------------------assign out---------------------------------------------------------------------
//[135:102][101:68][67:34][33:0]
assign butterfly64_out = {
    butterfly4_inst_15_out[135:102],butterfly4_inst_14_out[135:102],butterfly4_inst_13_out[135:102],butterfly4_inst_12_out[135:102],
    butterfly4_inst_11_out[135:102],butterfly4_inst_10_out[135:102],butterfly4_inst_9_out[135:102] ,butterfly4_inst_8_out[135:102] ,
    butterfly4_inst_7_out[135:102] ,butterfly4_inst_6_out[135:102] ,butterfly4_inst_5_out[135:102] ,butterfly4_inst_4_out[135:102] ,
    butterfly4_inst_3_out[135:102] ,butterfly4_inst_2_out[135:102] ,butterfly4_inst_1_out[135:102] ,butterfly4_inst_0_out[135:102] ,
    butterfly4_inst_15_out[101:68] ,butterfly4_inst_14_out[101:68] ,butterfly4_inst_13_out[101:68] ,butterfly4_inst_12_out[101:68] ,
    butterfly4_inst_11_out[101:68] ,butterfly4_inst_10_out[101:68] ,butterfly4_inst_9_out[101:68]  ,butterfly4_inst_8_out[101:68]  ,
    butterfly4_inst_7_out[101:68]  ,butterfly4_inst_6_out[101:68]  ,butterfly4_inst_5_out[101:68]  ,butterfly4_inst_4_out[101:68]  ,
    butterfly4_inst_3_out[101:68]  ,butterfly4_inst_2_out[101:68]  ,butterfly4_inst_1_out[101:68]  ,butterfly4_inst_0_out[101:68]  ,
    butterfly4_inst_15_out[67:34]  ,butterfly4_inst_14_out[67:34]  ,butterfly4_inst_13_out[67:34]  ,butterfly4_inst_12_out[67:34]  ,
    butterfly4_inst_11_out[67:34]  ,butterfly4_inst_10_out[67:34]  ,butterfly4_inst_9_out[67:34]   ,butterfly4_inst_8_out[67:34]   ,
    butterfly4_inst_7_out[67:34]   ,butterfly4_inst_6_out[67:34]   ,butterfly4_inst_5_out[67:34]   ,butterfly4_inst_4_out[67:34]   ,
    butterfly4_inst_3_out[67:34]   ,butterfly4_inst_2_out[67:34]   ,butterfly4_inst_1_out[67:34]   ,butterfly4_inst_0_out[67:34]   ,
    butterfly4_inst_15_out[33:0]   ,butterfly4_inst_14_out[33:0]   ,butterfly4_inst_13_out[33:0]   ,butterfly4_inst_12_out[33:0]   ,
    butterfly4_inst_11_out[33:0]   ,butterfly4_inst_10_out[33:0]   ,butterfly4_inst_9_out[33:0]    ,butterfly4_inst_8_out[33:0]    ,
    butterfly4_inst_7_out[33:0]    ,butterfly4_inst_6_out[33:0]    ,butterfly4_inst_5_out[33:0]    ,butterfly4_inst_4_out[33:0]    ,
    butterfly4_inst_3_out[33:0]    ,butterfly4_inst_2_out[33:0]    ,butterfly4_inst_1_out[33:0]    ,butterfly4_inst_0_out[33:0]};


endmodule
