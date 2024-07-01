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
                                                          
  initial begin
    @(negedge aresetn);
    axi4LiteMasterWriteInterface.bvalid  <= 1'b0;
    axi4LiteMasterWriteInterface.awready <= 1'b1;  
    axi4LiteMasterWriteInterface.wready  <= 1'b1;
    @(posedge aresetn);
    axi4LiteMasterWriteInterface.awready <= 1'b0;  
    axi4LiteMasterWriteInterface.wready  <= 1'b0;
    repeat(3) begin
      @(posedge aclk);
    end
    axi4LiteMasterWriteInterface.awready <= 1'b1;  
    repeat(4) begin
      @(posedge aclk);
    end
    axi4LiteMasterWriteInterface.wready  <= 1'b1;
    repeat(4) begin
      @(posedge aclk);
    end
    axi4LiteMasterWriteInterface.bvalid  <= 1'b1;
    axi4LiteMasterWriteInterface.bresp   <= 2'b00;
  end

  genvar i;
  generate
    for (i=0; i<NO_OF_WRITEMASTERS; i++) begin : Axi4LiteMasterWriteAgentBFM
      Axi4LiteMasterWriteAgentBFM #() axi4LiteMasterWriteAgentBFM(axi4LiteMasterWriteInterface);
    end
  endgenerate

endmodule : Axi4LiteMasterWriteHdlTop

`endif

