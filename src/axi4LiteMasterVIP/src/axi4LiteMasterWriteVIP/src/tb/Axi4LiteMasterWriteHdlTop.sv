`ifndef AXI4LITEMASTERWRITEHDLTOP_INCLUDED_
`define AXI4LITEMASTERWRITEHDLTOP_INCLUDED_

module Axi4LiteMasterWriteHdlTop;

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
                                                            .aresetn(aresetn)
                                                          );
                                                          
/*  Axi4LiteMasterWriteInterface axi4LiteMasterWriteInterface(.aclk(aclk),
                                                            .aresetn(aresetn),
                                                            .awready(1'b1),
                                                            .wready(1'b1),
                                                            .bvalid(1'b1),
                                                            .bresp(2'b00)
                                                          );
*/

  initial begin
    axi4LiteMasterWriteInterface.awready = 1'b1;  
    axi4LiteMasterWriteInterface.wready  = 1'b1;
    axi4LiteMasterWriteInterface.bvalid  = 1'b1;
    axi4LiteMasterWriteInterface.bresp   = 2'b00;
  end

  genvar i;
  generate
    for (i=0; i<NO_OF_WRITEMASTERS; i++) begin : Axi4LiteMasterWriteAgentBFM
      Axi4LiteMasterWriteAgentBFM #() axi4LiteMasterWriteAgentBFM(.aclk(axi4LiteMasterWriteInterface.aclk),
                                                                  .aresetn(axi4LiteMasterWriteInterface.aresetn),
                                                                  .awvalid(axi4LiteMasterWriteInterface.awvalid),
                                                                  .awready(axi4LiteMasterWriteInterface.awready),
                                                                  .awaddr(axi4LiteMasterWriteInterface.awaddr),
                                                                  .awprot(axi4LiteMasterWriteInterface.awprot),
                                                                  .wvalid(axi4LiteMasterWriteInterface.wvalid),
                                                                  .wready(axi4LiteMasterWriteInterface.wready),
                                                                  .wdata(axi4LiteMasterWriteInterface.wdata),
                                                                  .wstrb(axi4LiteMasterWriteInterface.wstrb),
                                                                  .bvalid(axi4LiteMasterWriteInterface.bvalid),
                                                                  .bready(axi4LiteMasterWriteInterface.bready),
                                                                  .bresp(axi4LiteMasterWriteInterface.bresp)
                                                                 );
    end
  endgenerate

endmodule : Axi4LiteMasterWriteHdlTop

`endif

