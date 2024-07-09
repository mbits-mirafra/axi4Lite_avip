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
   axi4LiteSlaveWriteInterface.awaddr   <= 1'hf;  
   axi4LiteSlaveWriteInterface.awprot   <= 3'b001;  
   axi4LiteSlaveWriteInterface.wdata    <= 2'hff;
   axi4LiteSlaveWriteInterface.wstrb    <= 1'hf;
 end

  genvar i;
  generate
    for (i=0; i<NO_OF_WRITESLAVES; i++) begin : Axi4LiteSlaveWriteAgentBFM
      Axi4LiteSlaveWriteAgentBFM #() axi4LiteSlaveWriteAgentBFM(.aclk(axi4LiteSlaveWriteInterface.aclk),
                                                                .aresetn(axi4LiteSlaveWriteInterface.aresetn),
                                                                .awvalid(axi4LiteSlaveWriteInterface.awvalid),
                                                                .awready(axi4LiteSlaveWriteInterface.awready),
                                                                .awaddr(axi4LiteSlaveWriteInterface.awaddr),
                                                                .awprot(axi4LiteSlaveWriteInterface.awprot),
                                                                .wvalid(axi4LiteSlaveWriteInterface.wvalid),
                                                                .wready(axi4LiteSlaveWriteInterface.wready),
                                                                .wdata(axi4LiteSlaveWriteInterface.wdata),
                                                                .wstrb(axi4LiteSlaveWriteInterface.wstrb),
                                                                .bvalid(axi4LiteSlaveWriteInterface.bvalid),
                                                                .bready(axi4LiteSlaveWriteInterface.bready),
                                                                .bresp(axi4LiteSlaveWriteInterface.bresp)
                                                               );
    end
  endgenerate

endmodule : Axi4LiteSlaveWriteHdlTop

`endif

