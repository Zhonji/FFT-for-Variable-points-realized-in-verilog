`timescale  1ns/1ns


module butterfly2_tb();
// module butterfly2(
//     input wire [67:0] butterfly2_in,
//     input wire [5:0] rotation,
//     output wire [67:0] butterfly2_out
// )

reg [67:0] butterfly2_in;
reg [5:0] rotation;
wire [67:0] butterfly2_out;
initial begin
    butterfly2_in = 68'b0_0000_0011_0000_0000_0_0000_0000_0000_0000__0_0000_0010_0000_0000_0_0000_0000_0000_0000;
    rotation = 6'b000000;
    #10
    $stop;
end

butterfly2  inst0(
    .butterfly2_in(butterfly2_in),
    .rotation(rotation),
    .butterfly2_out(butterfly2_out)
 );




endmodule
