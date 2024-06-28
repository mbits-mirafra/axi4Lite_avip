`ifndef AXI4LITEMASTERREADHDLTOP_INCLUDED_
`define AXI4LITEMASTERREADHDLTOP_INCLUDED_

module Axi4LiteMasterReadHdlTop;

  import uvm_pkg::*;
  `include "uvm_macros.svh"
  import Axi4LiteReadMasterGlobalPkg::*;

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

  Axi4LiteMasterReadInterface axi4LiteMasterReadInterface(.aclk(aclk),
                                                          .aresetn(aresetn));

  initial begin
    axi4LiteMasterReadInterface.arready = 1'b1;
    axi4LiteMasterReadInterface.rvalid = 1'b1;
  end
                                                           
  genvar i;
  generate
    for (i=0; i<NO_OF_READMASTERS; i++) begin : Axi4LiteMasterReadAgentBFM
      Axi4LiteMasterReadAgentBFM #() axi4LiteMasterReadAgentBFM(axi4LiteMasterReadInterface);
    end
  endgenerate

endmodule : Axi4LiteMasterReadHdlTop

`endif

