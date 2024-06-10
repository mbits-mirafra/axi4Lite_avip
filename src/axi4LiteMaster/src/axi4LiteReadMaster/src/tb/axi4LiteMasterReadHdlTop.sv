`ifndef HDLTOP_INCLUDED_
`define HDLTOP_INCLUDED_

module HdlTop;

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

  genvar i;
  generate
    for (i=0; i<NO_OF_MASTERS; i++) begin : Axi4LiteMasterReadAgentBFM
      Axi4LiteMasterReadAgentBFM #() axi4LiteMasterReadAgentBFM(.aclk(axi4LiteMasterReadInterface.aclk),
                                                                  .aresetn(axi4LiteMasterReadInterface.aresetn),
                                                                  .arvalid(axi4LiteMasterReadInterface.arvalid),
                                                                  .arready(axi4LiteMasterReadInterface.arready),
                                                                  .rvalid(axi4LiteMasterReadInterface.rvalid),
                                                                  .rready(axi4LiteMasterReadInterface.rready)                                                                                    );
    end
  endgenerate

endmodule : HdlTop

`endif

