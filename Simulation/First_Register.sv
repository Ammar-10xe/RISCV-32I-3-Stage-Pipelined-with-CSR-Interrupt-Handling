module First_Register (
    input               clk ,rst,Stall,Flush,csr_Flush,is_mret,
    input  logic [31:0] Addr,Inst,
    output logic        is_mretF,
    output logic [31:0] AddrF,InstF
);
    always_ff @( posedge clk ) begin 
     
        if(rst) begin
            AddrF <= 32'b0;
            InstF <= 32'b0;
            is_mretF <= 1'b0;
        end
        else if(Stall) begin
            AddrF <= AddrF;
            InstF <= InstF;
            is_mretF <= is_mretF;
        end
        else if (Flush || csr_Flush) begin
            InstF <= 32'h00000013;
        end
        else begin
            AddrF <= Addr;
            InstF <= Inst;
            is_mretF <= is_mret;
            
        end
    end
    
endmodule
