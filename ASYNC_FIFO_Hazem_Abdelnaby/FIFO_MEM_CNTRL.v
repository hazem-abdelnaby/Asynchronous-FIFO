module FIFO_MEM_CNTRL
#(
    parameter DATA_WIDTH =8,
              FIFO_WIDTH =8
)(
    input [DATA_WIDTH-1:0] WR_DATA ,
    input W_CLK,
    input RST,
    input wclken,
    input [2:0] waddr,
    input [2:0] raddr,
    output [DATA_WIDTH-1:0] RD_DATA

);
integer i;
reg [DATA_WIDTH-1:0] FIFO_MEM [0:FIFO_WIDTH-1];

always @(posedge W_CLK or negedge RST)
begin
    if(!RST)
    begin
        for(i=0;i<FIFO_WIDTH;i=i+1)
        begin
           FIFO_MEM[i]<= 'b0; 
        end     
    end
    else
    begin
        if(wclken)
        begin
            FIFO_MEM[waddr] <= WR_DATA;
        end
    end

end
assign RD_DATA = FIFO_MEM[raddr];
    
endmodule
