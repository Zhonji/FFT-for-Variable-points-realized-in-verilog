//*****************************************************************************************************************************************************************************************************
// `timescale 1ns/1ns

// module FFT128_TOP(
//     input wire [4351:0] FFT_in,
//     output wire [4351:0] FFT_out
// );

// wire [2175:0] inst0_0_out, inst0_1_out;

// butterfly64 inst0_0(
//     .butterfly64_in({
//          FFT_in[4317:4284]   ,FFT_in[4249:4216]   ,FFT_in[4181:4148]   ,FFT_in[4113:4080]   ,FFT_in[4045:4012]   ,FFT_in[3977:3944]   ,FFT_in[3909:3876]   ,FFT_in[3841:3808]   ,
//          FFT_in[3773:3740]   ,FFT_in[3705:3672]   ,FFT_in[3637:3604]   ,FFT_in[3569:3536]   ,FFT_in[3501:3468]   ,FFT_in[3433:3400]   ,FFT_in[3365:3332]   ,FFT_in[3297:3264]   ,
//          FFT_in[3229:3196]   ,FFT_in[3161:3128]   ,FFT_in[3093:3060]   ,FFT_in[3025:2992]   ,FFT_in[2957:2924]   ,FFT_in[2889:2856]   ,FFT_in[2821:2788]   ,FFT_in[2753:2720]   ,
//          FFT_in[2685:2652]   ,FFT_in[2617:2584]   ,FFT_in[2549:2516]   ,FFT_in[2481:2448]   ,FFT_in[2413:2380]   ,FFT_in[2345:2312]   ,FFT_in[2277:2244]   ,FFT_in[2209:2176]   ,
//          FFT_in[2141:2108]   ,FFT_in[2073:2040]   ,FFT_in[2005:1972]   ,FFT_in[1937:1904]   ,FFT_in[1869:1836]   ,FFT_in[1801:1768]   ,FFT_in[1733:1700]   ,FFT_in[1665:1632]   ,
//          FFT_in[1597:1564]   ,FFT_in[1529:1496]   ,FFT_in[1461:1428]   ,FFT_in[1393:1360]   ,FFT_in[1325:1292]   ,FFT_in[1257:1224]   ,FFT_in[1189:1156]   ,FFT_in[1121:1088]   ,
//          FFT_in[1053:1020]   ,FFT_in[985:952]     ,FFT_in[917:884]     ,FFT_in[849:816]     ,FFT_in[781:748]     ,FFT_in[713:680]     ,FFT_in[645:612]     ,FFT_in[577:544]     ,
//          FFT_in[509:476]     ,FFT_in[441:408]     ,FFT_in[373:340]     ,FFT_in[305:272]     ,FFT_in[237:204]     ,FFT_in[169:136]     ,FFT_in[101:68]      ,FFT_in[33:0]   
//     }),
//     .butterfly64_out(inst0_0_out)
// );

// butterfly64 inst0_1(
//     .butterfly64_in({
//          FFT_in[4351:4318]   ,FFT_in[4283:4250]   ,FFT_in[4215:4182]   ,FFT_in[4147:4114]   ,FFT_in[4079:4046]   ,FFT_in[4011:3978]   ,FFT_in[3943:3910]   ,FFT_in[3875:3842]   ,
//          FFT_in[3807:3774]   ,FFT_in[3739:3706]   ,FFT_in[3671:3638]   ,FFT_in[3603:3570]   ,FFT_in[3535:3502]   ,FFT_in[3467:3434]   ,FFT_in[3399:3366]   ,FFT_in[3331:3298]   ,
//          FFT_in[3263:3230]   ,FFT_in[3195:3162]   ,FFT_in[3127:3094]   ,FFT_in[3059:3026]   ,FFT_in[2991:2958]   ,FFT_in[2923:2890]   ,FFT_in[2855:2822]   ,FFT_in[2787:2754]   ,
//          FFT_in[2719:2686]   ,FFT_in[2651:2618]   ,FFT_in[2583:2550]   ,FFT_in[2515:2482]   ,FFT_in[2447:2414]   ,FFT_in[2379:2346]   ,FFT_in[2311:2278]   ,FFT_in[2243:2210]   ,
//          FFT_in[2175:2142]   ,FFT_in[2107:2074]   ,FFT_in[2039:2006]   ,FFT_in[1971:1938]   ,FFT_in[1903:1870]   ,FFT_in[1835:1802]   ,FFT_in[1767:1734]   ,FFT_in[1699:1666]   ,
//          FFT_in[1631:1598]   ,FFT_in[1563:1530]   ,FFT_in[1495:1462]   ,FFT_in[1427:1394]   ,FFT_in[1359:1326]   ,FFT_in[1291:1258]   ,FFT_in[1223:1190]   ,FFT_in[1155:1122]   ,
//          FFT_in[1087:1054]   ,FFT_in[1019:986]    ,FFT_in[951:918]     ,FFT_in[883:850]     ,FFT_in[815:782]     ,FFT_in[747:714]     ,FFT_in[679:646]     ,FFT_in[611:578]     ,
//          FFT_in[543:510]     ,FFT_in[475:442]     ,FFT_in[407:374]     ,FFT_in[339:306]     ,FFT_in[271:238]     ,FFT_in[203:170]     ,FFT_in[135:102]     ,FFT_in[67:34]   
//     }), 
//     .butterfly64_out(inst0_1_out)
// );

// butterfly128  inst1_0(
//     .butterfly128_in({
//         inst0_1_out,inst0_0_out
//     }),
//     .butterfly128_out(FFT_out)
// );
// endmodule


//*****************************************************************************************************************************************************************************************************

`timescale 1ns/1ns

module FFT128_TOP(
    input wire [4351:0] FFT_in,
    output wire [4351:0] FFT_out,
    output wire [2175:0] out_1,
    output wire [2175:0] out_2
);

wire [2175:0] inst0_0_out, inst0_1_out;

butterfly64 inst0_0(
    .butterfly64_in({
         FFT_in[4317:4284]   ,FFT_in[4249:4216]   ,FFT_in[4181:4148]   ,FFT_in[4113:4080]   ,FFT_in[4045:4012]   ,FFT_in[3977:3944]   ,FFT_in[3909:3876]   ,FFT_in[3841:3808]   ,
         FFT_in[3773:3740]   ,FFT_in[3705:3672]   ,FFT_in[3637:3604]   ,FFT_in[3569:3536]   ,FFT_in[3501:3468]   ,FFT_in[3433:3400]   ,FFT_in[3365:3332]   ,FFT_in[3297:3264]   ,
         FFT_in[3229:3196]   ,FFT_in[3161:3128]   ,FFT_in[3093:3060]   ,FFT_in[3025:2992]   ,FFT_in[2957:2924]   ,FFT_in[2889:2856]   ,FFT_in[2821:2788]   ,FFT_in[2753:2720]   ,
         FFT_in[2685:2652]   ,FFT_in[2617:2584]   ,FFT_in[2549:2516]   ,FFT_in[2481:2448]   ,FFT_in[2413:2380]   ,FFT_in[2345:2312]   ,FFT_in[2277:2244]   ,FFT_in[2209:2176]   ,
         FFT_in[2141:2108]   ,FFT_in[2073:2040]   ,FFT_in[2005:1972]   ,FFT_in[1937:1904]   ,FFT_in[1869:1836]   ,FFT_in[1801:1768]   ,FFT_in[1733:1700]   ,FFT_in[1665:1632]   ,
         FFT_in[1597:1564]   ,FFT_in[1529:1496]   ,FFT_in[1461:1428]   ,FFT_in[1393:1360]   ,FFT_in[1325:1292]   ,FFT_in[1257:1224]   ,FFT_in[1189:1156]   ,FFT_in[1121:1088]   ,
         FFT_in[1053:1020]   ,FFT_in[985:952]     ,FFT_in[917:884]     ,FFT_in[849:816]     ,FFT_in[781:748]     ,FFT_in[713:680]     ,FFT_in[645:612]     ,FFT_in[577:544]     ,
         FFT_in[509:476]     ,FFT_in[441:408]     ,FFT_in[373:340]     ,FFT_in[305:272]     ,FFT_in[237:204]     ,FFT_in[169:136]     ,FFT_in[101:68]      ,FFT_in[33:0]   
    }),
    .butterfly64_out(inst0_0_out)
);

assign out_1 = inst0_0_out;

butterfly64 inst0_1(
    .butterfly64_in({
         FFT_in[4351:4318]   ,FFT_in[4283:4250]   ,FFT_in[4215:4182]   ,FFT_in[4147:4114]   ,FFT_in[4079:4046]   ,FFT_in[4011:3978]   ,FFT_in[3943:3910]   ,FFT_in[3875:3842]   ,
         FFT_in[3807:3774]   ,FFT_in[3739:3706]   ,FFT_in[3671:3638]   ,FFT_in[3603:3570]   ,FFT_in[3535:3502]   ,FFT_in[3467:3434]   ,FFT_in[3399:3366]   ,FFT_in[3331:3298]   ,
         FFT_in[3263:3230]   ,FFT_in[3195:3162]   ,FFT_in[3127:3094]   ,FFT_in[3059:3026]   ,FFT_in[2991:2958]   ,FFT_in[2923:2890]   ,FFT_in[2855:2822]   ,FFT_in[2787:2754]   ,
         FFT_in[2719:2686]   ,FFT_in[2651:2618]   ,FFT_in[2583:2550]   ,FFT_in[2515:2482]   ,FFT_in[2447:2414]   ,FFT_in[2379:2346]   ,FFT_in[2311:2278]   ,FFT_in[2243:2210]   ,
         FFT_in[2175:2142]   ,FFT_in[2107:2074]   ,FFT_in[2039:2006]   ,FFT_in[1971:1938]   ,FFT_in[1903:1870]   ,FFT_in[1835:1802]   ,FFT_in[1767:1734]   ,FFT_in[1699:1666]   ,
         FFT_in[1631:1598]   ,FFT_in[1563:1530]   ,FFT_in[1495:1462]   ,FFT_in[1427:1394]   ,FFT_in[1359:1326]   ,FFT_in[1291:1258]   ,FFT_in[1223:1190]   ,FFT_in[1155:1122]   ,
         FFT_in[1087:1054]   ,FFT_in[1019:986]    ,FFT_in[951:918]     ,FFT_in[883:850]     ,FFT_in[815:782]     ,FFT_in[747:714]     ,FFT_in[679:646]     ,FFT_in[611:578]     ,
         FFT_in[543:510]     ,FFT_in[475:442]     ,FFT_in[407:374]     ,FFT_in[339:306]     ,FFT_in[271:238]     ,FFT_in[203:170]     ,FFT_in[135:102]     ,FFT_in[67:34]   
    }), 
    .butterfly64_out(inst0_1_out)
);

assign out_2 = inst0_1_out;

butterfly128  inst1_0(
    .butterfly128_in({
        inst0_1_out,inst0_0_out
    }),
    .butterfly128_out(FFT_out)
);
endmodule
