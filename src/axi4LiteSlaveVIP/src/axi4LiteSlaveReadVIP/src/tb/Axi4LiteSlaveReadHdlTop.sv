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
    axi4LiteSlaveReadInterface.araddr   <= 4'hd;
    axi4LiteSlaveReadInterface.arprot   <= 3'b000;
    axi4LiteSlaveReadInterface.rready   <= 1'b1;
 end

  genvar i;
  generate
    for (i=0; i<NO_OF_READSLAVES; i++) begin : Axi4LiteSlaveReadAgentBFM
      Axi4LiteSlaveReadAgentBFM #() axi4LiteSlaveReadAgentBFM(axi4LiteSlaveReadInterface);
    end
  endgenerate

endmodule : Axi4LiteSlaveReadHdlTop

`endif

