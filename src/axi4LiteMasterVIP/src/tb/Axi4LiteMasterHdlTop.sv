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
/*
  Axi4LiteMasterWriteInterface axi4LiteMasterWriteInterface(.aclk(aclk),
                                                            .aresetn(aresetn));

  Axi4LiteMasterReadInterface axi4LiteMasterReadInterface(.aclk(aclk),
                                                            .aresetn(aresetn));
*/

  Axi4LiteMasterInterface axi4LiteMasterInterface(.aclk(aclk),
                                                  .aresetn(aresetn)
                                                  );

  initial begin
    @(negedge aresetn);
    axi4LiteMasterInterface.axi4LiteMasterWriteInterface.bvalid  <= 1'b0;
    axi4LiteMasterInterface.axi4LiteMasterWriteInterface.awready <= 1'b1;  
    axi4LiteMasterInterface.axi4LiteMasterWriteInterface.wready  <= 1'b1;
    @(posedge aresetn);
    axi4LiteMasterInterface.axi4LiteMasterWriteInterface.awready <= 1'b0;  
    axi4LiteMasterInterface.axi4LiteMasterWriteInterface.wready  <= 1'b0;
    repeat(3) begin
      @(posedge aclk);
    end
    axi4LiteMasterInterface.axi4LiteMasterWriteInterface.awready <= 1'b1;  
    repeat(4) begin
      @(posedge aclk);
    end
    axi4LiteMasterInterface.axi4LiteMasterWriteInterface.wready  <= 1'b1;
    repeat(4) begin
      @(posedge aclk);
    end
    axi4LiteMasterInterface.axi4LiteMasterWriteInterface.bvalid  <= 1'b1;
    axi4LiteMasterInterface.axi4LiteMasterWriteInterface.bresp   <= 2'b00;
  end

  initial begin
    axi4LiteMasterInterface.axi4LiteMasterReadInterface.arready = 1'b1;
    axi4LiteMasterInterface.axi4LiteMasterReadInterface.rvalid = 1'b1;
    axi4LiteMasterInterface.axi4LiteMasterReadInterface.rdata = 8'hff;
    axi4LiteMasterInterface.axi4LiteMasterReadInterface.rresp = 2'b00;
  end
                                                           

  genvar i;
  generate
    for (i=0; i<NO_OF_WRITEMASTERS; i++) begin : Axi4LiteMasterWriteAgentBFM
      //Axi4LiteMasterWriteAgentBFM #() axi4LiteMasterWriteAgentBFM(axi4LiteMasterWriteInterface);
      Axi4LiteMasterWriteAgentBFM #() axi4LiteMasterWriteAgentBFM(.aclk(axi4LiteMasterInterface.axi4LiteMasterWriteInterface.aclk),
                                                                  .aresetn(axi4LiteMasterInterface.axi4LiteMasterWriteInterface.aresetn),
                                                                  .awvalid(axi4LiteMasterInterface.axi4LiteMasterWriteInterface.awvalid),
                                                                  .awready(axi4LiteMasterInterface.axi4LiteMasterWriteInterface.awready),
                                                                  .awaddr(axi4LiteMasterInterface.axi4LiteMasterWriteInterface.awaddr),
                                                                  .awprot(axi4LiteMasterInterface.axi4LiteMasterWriteInterface.awprot),
                                                                  .wvalid(axi4LiteMasterInterface.axi4LiteMasterWriteInterface.wvalid),
                                                                  .wready(axi4LiteMasterInterface.axi4LiteMasterWriteInterface.wready),
                                                                  .wdata(axi4LiteMasterInterface.axi4LiteMasterWriteInterface.wdata),
                                                                  .wstrb(axi4LiteMasterInterface.axi4LiteMasterWriteInterface.wstrb),
                                                                  .bvalid(axi4LiteMasterInterface.axi4LiteMasterWriteInterface.bvalid),
                                                                  .bready(axi4LiteMasterInterface.axi4LiteMasterWriteInterface.bready),
                                                                  .bresp(axi4LiteMasterInterface.axi4LiteMasterWriteInterface.bresp)
                                                                 );
    end

    for (i=0; i<NO_OF_READMASTERS; i++) begin : Axi4LiteMasterReadAgentBFM
      //Axi4LiteMasterReadAgentBFM #() axi4LiteMasterReadAgentBFM(axi4LiteMasterReadInterface);
      Axi4LiteMasterReadAgentBFM #() axi4LiteMasterReadAgentBFM(.aclk(axi4LiteMasterInterface.axi4LiteMasterReadInterface.aclk),
                                                                .aresetn(axi4LiteMasterInterface.axi4LiteMasterReadInterface.aresetn),
                                                                .arvalid(axi4LiteMasterInterface.axi4LiteMasterReadInterface.arvalid),
                                                                .arready(axi4LiteMasterInterface.axi4LiteMasterReadInterface.arready),
                                                                .araddr(axi4LiteMasterInterface.axi4LiteMasterReadInterface.araddr),
                                                                .arprot(axi4LiteMasterInterface.axi4LiteMasterReadInterface.arprot),
                                                                .rvalid(axi4LiteMasterInterface.axi4LiteMasterReadInterface.rvalid),
                                                                .rready(axi4LiteMasterInterface.axi4LiteMasterReadInterface.rready),
                                                                .rdata(axi4LiteMasterInterface.axi4LiteMasterReadInterface.rdata),
                                                                .rresp(axi4LiteMasterInterface.axi4LiteMasterReadInterface.rresp)
                                                               );
    end
  endgenerate

endmodule : Axi4LiteMasterHdlTop

`endif

