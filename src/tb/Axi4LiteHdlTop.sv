`ifndef AXI4LITEMASTERHDLTOP_INCLUDED_
`define AXI4LITEMASTERHDLTOP_INCLUDED_

module Axi4LiteHdlTop;

  import uvm_pkg::*;
  `include "uvm_macros.svh"
  import Axi4LiteWriteMasterGlobalPkg::*;
  import Axi4LiteReadMasterGlobalPkg::*;
  import Axi4LiteWriteSlaveGlobalPkg::*;
  import Axi4LiteReadSlaveGlobalPkg::*;

  bit aclk;
  bit aresetn;

  initial begin
    $display("AXI4LITE_HDLTOP");
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

  Axi4LiteInterface axi4LiteInterface(.aclk(aclk),
                                      .aresetn(aresetn)
                                    );

  genvar i;
  generate
    for (i=0; i<NO_OF_WRITEMASTERS; i++) begin : Axi4LiteMasterWriteAgentBFM
      Axi4LiteMasterWriteAgentBFM #() axi4LiteMasterWriteAgentBFM(.aclk(axi4LiteInterface.aclk),
                                                                  .aresetn(axi4LiteInterface.aresetn),
                                                                  .awvalid(axi4LiteInterface.awvalid),
                                                                  .awready(axi4LiteInterface.awready),
                                                                  .awaddr(axi4LiteInterface.awaddr),
                                                                  .awprot(axi4LiteInterface.awprot),
                                                                  .wvalid(axi4LiteInterface.wvalid),
                                                                  .wready(axi4LiteInterface.wready),
                                                                  .wdata(axi4LiteInterface.wdata),
                                                                  .wstrb(axi4LiteInterface.wstrb),
                                                                  .bvalid(axi4LiteInterface.bvalid),
                                                                  .bready(axi4LiteInterface.bready),
                                                                  .bresp(axi4LiteInterface.bresp)
                                                                 );
    end

    for (i=0; i<NO_OF_READMASTERS; i++) begin : Axi4LiteMasterReadAgentBFM
      Axi4LiteMasterReadAgentBFM #() axi4LiteMasterReadAgentBFM(.aclk(axi4LiteInterface.aclk),
                                                                .aresetn(axi4LiteInterface.aresetn),
                                                                .arvalid(axi4LiteInterface.arvalid),
                                                                .arready(axi4LiteInterface.arready),
                                                                .araddr(axi4LiteInterface.araddr),
                                                                .arprot(axi4LiteInterface.arprot),
                                                                .rvalid(axi4LiteInterface.rvalid),
                                                                .rready(axi4LiteInterface.rready),
                                                                .rdata(axi4LiteInterface.rdata),
                                                                .rresp(axi4LiteInterface.rresp)
                                                               );
    end

    for (i=0; i<NO_OF_WRITESLAVES; i++) begin : Axi4LiteSlaveWriteAgentBFM
      Axi4LiteSlaveWriteAgentBFM #() axi4LiteSlaveWriteAgentBFM(.aclk(axi4LiteInterface.aclk),
                                                                .aresetn(axi4LiteInterface.aresetn),
                                                                .awvalid(axi4LiteInterface.awvalid),
                                                                .awready(axi4LiteInterface.awready),
                                                                .awaddr(axi4LiteInterface.awaddr),
                                                                .awprot(axi4LiteInterface.awprot),
                                                                .wvalid(axi4LiteInterface.wvalid),
                                                                .wready(axi4LiteInterface.wready),
                                                                .wdata(axi4LiteInterface.wdata),
                                                                .wstrb(axi4LiteInterface.wstrb),
                                                                .bvalid(axi4LiteInterface.bvalid),
                                                                .bready(axi4LiteInterface.bready),
                                                                .bresp(axi4LiteInterface.bresp)
                                                               );
    end

    for (i=0; i<NO_OF_READSLAVES; i++) begin : Axi4LiteSlaveReadAgentBFM
      Axi4LiteSlaveReadAgentBFM #() axi4LiteSlaveReadAgentBFM(.aclk(axi4LiteInterface.aclk),
                                                                .aresetn(axi4LiteInterface.aresetn),
                                                                .arvalid(axi4LiteInterface.arvalid),
                                                                .arready(axi4LiteInterface.arready),
                                                                .araddr(axi4LiteInterface.araddr),
                                                                .arprot(axi4LiteInterface.arprot),
                                                                .rvalid(axi4LiteInterface.rvalid),
                                                                .rready(axi4LiteInterface.rready),
                                                                .rdata(axi4LiteInterface.rdata),
                                                                .rresp(axi4LiteInterface.rresp)
                                                               );
    end
  endgenerate

endmodule : Axi4LiteHdlTop

`endif

