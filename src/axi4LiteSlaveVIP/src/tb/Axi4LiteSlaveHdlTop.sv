`ifndef AXI4LITESLAVEHDLTOP_INCLUDED_
`define AXI4LITESLAVEHDLTOP_INCLUDED_

module Axi4LiteSlaveHdlTop;

  import uvm_pkg::*;
  `include "uvm_macros.svh"
  import Axi4LiteWriteSlaveGlobalPkg::*;
  import Axi4LiteReadSlaveGlobalPkg::*;

  bit aclk;
  bit aresetn;

  initial begin
    $display("AXI4LITESLAVE_HDLTOP");
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

  Axi4LiteSlaveInterface axi4LiteSlaveInterface(.aclk(aclk),
                                                .aresetn(aresetn)
                                               );

  initial begin
   axi4LiteSlaveInterface.axi4LiteSlaveWriteInterface.awvalid  <= 1'b1; 
   axi4LiteSlaveInterface.axi4LiteSlaveWriteInterface.wvalid   <= 1'b1;    
   axi4LiteSlaveInterface.axi4LiteSlaveWriteInterface.bready   <= 1'b1;  
 end

  initial begin
    axi4LiteSlaveInterface.axi4LiteSlaveReadInterface.arvalid  <= 1'b1;
    axi4LiteSlaveInterface.axi4LiteSlaveReadInterface.araddr   <= 1'hf;
    axi4LiteSlaveInterface.axi4LiteSlaveReadInterface.rready   <= 1'b1;
 end

  genvar i;
  generate
    for (i=0; i<NO_OF_WRITESLAVES; i++) begin : Axi4LiteSlaveWriteAgentBFM
      Axi4LiteSlaveWriteAgentBFM #() axi4LiteSlaveWriteAgentBFM(.aclk(axi4LiteSlaveInterface.axi4LiteSlaveWriteInterface.aclk),
                                                                .aresetn(axi4LiteSlaveInterface.axi4LiteSlaveWriteInterface.aresetn),
                                                                .awvalid(axi4LiteSlaveInterface.axi4LiteSlaveWriteInterface.awvalid),
                                                                .awready(axi4LiteSlaveInterface.axi4LiteSlaveWriteInterface.awready),
                                                                .awaddr(axi4LiteSlaveInterface.axi4LiteSlaveWriteInterface.awaddr),
                                                                .awprot(axi4LiteSlaveInterface.axi4LiteSlaveWriteInterface.awprot),
                                                                .wvalid(axi4LiteSlaveInterface.axi4LiteSlaveWriteInterface.wvalid),
                                                                .wready(axi4LiteSlaveInterface.axi4LiteSlaveWriteInterface.wready),
                                                                .wdata(axi4LiteSlaveInterface.axi4LiteSlaveWriteInterface.wdata),
                                                                .wstrb(axi4LiteSlaveInterface.axi4LiteSlaveWriteInterface.wstrb),
                                                                .bvalid(axi4LiteSlaveInterface.axi4LiteSlaveWriteInterface.bvalid),
                                                                .bready(axi4LiteSlaveInterface.axi4LiteSlaveWriteInterface.bready),
                                                                .bresp(axi4LiteSlaveInterface.axi4LiteSlaveWriteInterface.bresp)
                                                               );
    end

    for (i=0; i<NO_OF_READSLAVES; i++) begin : Axi4LiteSlaveReadAgentBFM
      Axi4LiteSlaveReadAgentBFM #() axi4LiteSlaveReadAgentBFM(.aclk(axi4LiteSlaveInterface.axi4LiteSlaveReadInterface.aclk),
                                                              .aresetn(axi4LiteSlaveInterface.axi4LiteSlaveReadInterface.aresetn),
                                                              .arvalid(axi4LiteSlaveInterface.axi4LiteSlaveReadInterface.arvalid),
                                                              .arready(axi4LiteSlaveInterface.axi4LiteSlaveReadInterface.arready),
                                                              .araddr(axi4LiteSlaveInterface.axi4LiteSlaveReadInterface.araddr),
                                                              .arprot(axi4LiteSlaveInterface.axi4LiteSlaveReadInterface.arprot),
                                                              .rvalid(axi4LiteSlaveInterface.axi4LiteSlaveReadInterface.rvalid),
                                                              .rready(axi4LiteSlaveInterface.axi4LiteSlaveReadInterface.rready),
                                                              .rdata(axi4LiteSlaveInterface.axi4LiteSlaveReadInterface.rdata),
                                                              .rresp(axi4LiteSlaveInterface.axi4LiteSlaveReadInterface.rresp)
                                                             );
    end
  endgenerate

endmodule : Axi4LiteSlaveHdlTop

`endif

