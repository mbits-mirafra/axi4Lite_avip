`ifndef AXI4LITESLAVEREADHDLTOP_INCLUDED_
`define AXI4LITESLAVEREADHDLTOP_INCLUDED_

module Axi4LiteSlaveReadHdlTop;

  import uvm_pkg::*;
  `include "uvm_macros.svh"
  import Axi4LiteReadSlaveGlobalPkg::*;

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

  Axi4LiteSlaveReadInterface axi4LiteSlaveReadInterface(.aclk(aclk),
                                                        .aresetn(aresetn)
                                                       );

  initial begin
    axi4LiteSlaveReadInterface.arvalid  <= 1'b1;
    axi4LiteSlaveReadInterface.araddr   <= 1'hf;
    axi4LiteSlaveReadInterface.rready   <= 1'b1;
 end

  genvar i;
  generate
    for (i=0; i<NO_OF_READSLAVES; i++) begin : Axi4LiteSlaveReadAgentBFM
      Axi4LiteSlaveReadAgentBFM #() axi4LiteSlaveReadAgentBFM(.aclk(axi4LiteSlaveReadInterface.aclk),
                                                              .aresetn(axi4LiteSlaveReadInterface.aresetn),
                                                              .arvalid(axi4LiteSlaveReadInterface.arvalid),
                                                              .arready(axi4LiteSlaveReadInterface.arready),
                                                              .araddr(axi4LiteSlaveReadInterface.araddr),
                                                              .arprot(axi4LiteSlaveReadInterface.arprot),
                                                              .rvalid(axi4LiteSlaveReadInterface.rvalid),
                                                              .rready(axi4LiteSlaveReadInterface.rready),
                                                              .rdata(axi4LiteSlaveReadInterface.rdata),
                                                              .rresp(axi4LiteSlaveReadInterface.rresp)
                                                             );
    end
  endgenerate

endmodule : Axi4LiteSlaveReadHdlTop

`endif

