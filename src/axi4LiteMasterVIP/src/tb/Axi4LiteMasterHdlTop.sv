`ifndef AXI4LITEMASTERHDLTOP_INCLUDED_
`define AXI4LITEMASTERHDLTOP_INCLUDED_

module Axi4LiteMasterHdlTop;

  import uvm_pkg::*;
  `include "uvm_macros.svh"
  import Axi4LiteWriteMasterGlobalPkg::*;
  import Axi4LiteReadMasterGlobalPkg::*;

  bit aclk;
  bit aresetn;

  initial begin
    $display("AXI4LITEMASTER_HDLTOP");
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

  Axi4LiteMasterWriteInterface axi4LiteMasterWriteInterface(.aclk(aclk),
                                                            .aresetn(aresetn));

  Axi4LiteMasterReadInterface axi4LiteMasterReadInterface(.aclk(aclk),
                                                            .aresetn(aresetn));

  genvar i;
  generate
    for (i=0; i<NO_OF_WRITEMASTERS; i++) begin : Axi4LiteMasterWriteAgentBFM
      Axi4LiteMasterWriteAgentBFM #() axi4LiteMasterWriteAgentBFM(axi4LiteMasterWriteInterface);
    end

    for (i=0; i<NO_OF_READMASTERS; i++) begin : Axi4LiteMasterReadAgentBFM
      Axi4LiteMasterReadAgentBFM #() axi4LiteMasterReadAgentBFM(axi4LiteMasterReadInterface);
    end
  endgenerate

endmodule : Axi4LiteMasterHdlTop

`endif

