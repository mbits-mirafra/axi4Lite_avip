`ifndef AXI4LITESLAVEWRITEHDLTOP_INCLUDED_
`define AXI4LITESLAVEWRITEHDLTOP_INCLUDED_

module Axi4LiteSlaveWriteHdlTop;

  import uvm_pkg::*;
  `include "uvm_macros.svh"
  import Axi4LiteWriteSlaveGlobalPkg::*;

  bit aclk;
  bit aresetn;

  initial begin
    $display("HDL_TOP");
  end

  initial begin
    aclk = 1'b0;
    forever #10 aclk = ~aclk;
  end

  initial begin
    aresetn = 1'b1;
    #10 aresetn = 1'b0;

    repeat (1) begin
      @(posedge aclk);
    end
    aresetn = 1'b1;
  end

  Axi4LiteSlaveWriteInterface axi4LiteSlaveWriteInterface(.aclk(aclk),
                                                            .aresetn(aresetn)
                                                          );

  initial begin
   axi4LiteSlaveWriteInterface.awvalid  <= 1'b1; 
   axi4LiteSlaveWriteInterface.wvalid   <= 1'b1;    
   axi4LiteSlaveWriteInterface.bready   <= 1'b1;  
   
 end

  genvar i;
  generate
    for (i=0; i<NO_OF_WRITESLAVES; i++) begin : Axi4LiteSlaveWriteAgentBFM
      Axi4LiteSlaveWriteAgentBFM #() axi4LiteSlaveWriteAgentBFM(axi4LiteSlaveWriteInterface);
    end
  endgenerate

endmodule : Axi4LiteSlaveWriteHdlTop

`endif

