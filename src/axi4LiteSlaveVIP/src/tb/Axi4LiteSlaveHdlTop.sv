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

  Axi4LiteSlaveWriteInterface axi4LiteSlaveWriteInterface(.aclk(aclk),
                                                            .aresetn(aresetn));

  Axi4LiteSlaveReadInterface axi4LiteSlaveReadInterface(.aclk(aclk),
                                                            .aresetn(aresetn));

  genvar i;
  generate
    for (i=0; i<NO_OF_WRITESLAVES; i++) begin : Axi4LiteSlaveWriteAgentBFM
      Axi4LiteSlaveWriteAgentBFM #() axi4LiteSlaveWriteAgentBFM(axi4LiteSlaveWriteInterface);
    end

    for (i=0; i<NO_OF_READSLAVES; i++) begin : Axi4LiteSlaveReadAgentBFM
      Axi4LiteSlaveReadAgentBFM #() axi4LiteSlaveReadAgentBFM(axi4LiteSlaveReadInterface);
    end
  endgenerate

endmodule : Axi4LiteSlaveHdlTop

`endif

