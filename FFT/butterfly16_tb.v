
`timescale 1ns/1ns
//"C:\FFT\Library\g16butterfly_nonseq\data.txt"
//"C:\FFT\Library\g16butterfly_nonseq\data_out.txt"
module butterfly16_tb(
);
reg [33:0] Inputdata [0:15];
wire [543:0] butterfly_out;
wire [543:0] butterfly_in = {Inputdata[15],Inputdata[14],Inputdata[13],Inputdata[12],Inputdata[11],Inputdata[10],Inputdata[9],Inputdata[8],
                            Inputdata[7],Inputdata[6],Inputdata[5],Inputdata[4],Inputdata[3],Inputdata[2],Inputdata[1],Inputdata[0]};
//wire [135:0] test_0,test_1,test_2,test_3;

integer dout_file1;
initial 
    begin
        $readmemb("C:/FFT/Library/g16butterfly_nonseq/data.txt", Inputdata);
        dout_file1 = $fopen("C:/FFT/Library/g16butterfly_nonseq/data_out.txt");
        #10
        $fclose(dout_file1);
        $stop;
    end

always@(*)
begin
    $fdisplay(dout_file1,"%b",butterfly_out);
end

butterfly16 inst1(
    .butterfly_in(butterfly_in),
    .butterfly_out(butterfly_out)
    //.test_0(test_0),
    //.test_1(test_1),
    //.test_2(test_2),
    //.test_3(test_3)
);
endmodule
