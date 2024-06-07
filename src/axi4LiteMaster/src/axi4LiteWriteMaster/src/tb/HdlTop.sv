`ifndef HDLTOP_INCLUDED_
`define HDLTOP_INCLUDED_

module HdlTop;

  import uvm_pkg::*;
  `include "uvm_macros.svh"
  import Axi4LiteWriteMasterGlobalPkg::*;

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

  Axi4LiteMasterWriteInterface axi4LiteMasterWriteInterface(.aclk(aclk),
                                                            .aresetn(aresetn));

  genvar i;
  generate
    for (i=0; i<NO_OF_MASTERS; i++) begin : Axi4LiteMasterWriteAgentBFM
      Axi4LiteMasterWriteAgentBFM #() axi4LiteMasterWriteAgentBFM(.aclk(axi4LiteMasterWriteInterface.aclk),
                                                                  .aresetn(axi4LiteMasterWriteInterface.aresetn),
                                                                  .awvalid(axi4LiteMasterWriteInterface.awvalid),
                                                                  .awready(axi4LiteMasterWriteInterface.awready),
                                                                  .wvalid(axi4LiteMasterWriteInterface.wvalid),
                                                                  .wready(axi4LiteMasterWriteInterface.wready),
                                                                  .bvalid(axi4LiteMasterWriteInterface.bvalid),
                                                                  .bready(axi4LiteMasterWriteInterface.bready)
                                                                 );
    end
  endgenerate

endmodule : HdlTop

`endif

