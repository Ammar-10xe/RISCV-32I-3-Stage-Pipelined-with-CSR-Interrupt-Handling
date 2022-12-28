module TopLevel_tb ();
logic clk,rst,interrupt;

TopLevel toplevel (.clk(clk),.rst(rst),.interrupt(interrupt));

initial begin
    clk<=0;
    forever begin
        #1 clk <=~ clk;
    end
end
// initial begin
//     #1
//     rst<=1;
//     #1
//     rst<=0;
//     #150
//     $finish;
// end
// initial begin
//     rst <=0;
//     interrupt <=0;
//     @(posedge clk);
//     rst <=1;
//     @(posedge clk );
//     rst <=0;
//     #50
//     interrupt <=1;
//     #60
//     @(posedge clk)
//     interrupt <=0;
//     #100
//     $finish;
// end
  
    // initial
    // begin
    //     interrupt = 0;
    //     rst <= 0;
    //     @(posedge clk);
    //     rst <= 1;
    //     repeat (1) @(posedge clk);
    //     rst <= 0;
    //     repeat(50)@(posedge clk);
    //     interrupt = 1;
    //     repeat (1) @(posedge clk);
    //     interrupt = 0;
    //     repeat (15) @(posedge clk);
    //     $stop;
    // end


    initial
    begin
        interrupt = 0;
        rst <= 1;
        #5
        @(posedge clk);
        rst <= 1'b0;;
        #25
        @(posedge clk)
        interrupt <= 1'b1;
        @(posedge clk)
        interrupt <= 1'b0;
        
        #100
        $finish;
    end
endmodule


