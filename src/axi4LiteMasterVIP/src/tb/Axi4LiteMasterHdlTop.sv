`ifndef AXI4LITEMASTERHDLTOP_INCLUDED_
`define AXI4LITEMASTERHDLTOP_INCLUDED_

`define AXI4LITE_WRITEINTERFACE axi4LiteMasterInterface.axi4LiteMasterWriteInterface  
`define AXI4LITE_READINTERFACE axi4LiteMasterInterface.axi4LiteMasterReadInterface  

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

  Axi4LiteMasterInterface axi4LiteMasterInterface(.aclk(aclk),
                                                  .aresetn(aresetn)
                                                  );

  initial begin
    @(negedge aresetn);
    `AXI4LITE_WRITEINTERFACE.bvalid  <= 1'b0;
    `AXI4LITE_WRITEINTERFACE.awready <= 1'b1;  
    `AXI4LITE_WRITEINTERFACE.wready  <= 1'b1;
    @(posedge aresetn);
    `AXI4LITE_WRITEINTERFACE.awready <= 1'b0;  
    `AXI4LITE_WRITEINTERFACE.wready  <= 1'b0;
    repeat(3) begin
      @(posedge aclk);
    end
    `AXI4LITE_WRITEINTERFACE.awready <= 1'b1;  
    repeat(4) begin
      @(posedge aclk);
    end
    `AXI4LITE_WRITEINTERFACE.wready  <= 1'b1;
    repeat(4) begin
      @(posedge aclk);
    end
    `AXI4LITE_WRITEINTERFACE.bvalid  <= 1'b1;
    `AXI4LITE_WRITEINTERFACE.bresp   <= 2'b00;
  end

  initial begin
    `AXI4LITE_READINTERFACE.arready = 1'b1;
    `AXI4LITE_READINTERFACE.rvalid = 1'b1;
    `AXI4LITE_READINTERFACE.rdata = 8'hff;
    `AXI4LITE_READINTERFACE.rresp = 2'b00;
  end


  genvar i;
  generate
    for (i=0; i<NO_OF_WRITEMASTERS; i++) begin : Axi4LiteMasterWriteAgentBFM
      Axi4LiteMasterWriteAgentBFM #() axi4LiteMasterWriteAgentBFM(.aclk(`AXI4LITE_WRITEINTERFACE.aclk),
                                                                  .aresetn(`AXI4LITE_WRITEINTERFACE.aresetn),
                                                                  .awvalid(`AXI4LITE_WRITEINTERFACE.awvalid),
                                                                  .awready(`AXI4LITE_WRITEINTERFACE.awready),
                                                                  .awaddr(`AXI4LITE_WRITEINTERFACE.awaddr),
                                                                  .awprot(`AXI4LITE_WRITEINTERFACE.awprot),
                                                                  .wvalid(`AXI4LITE_WRITEINTERFACE.wvalid),
                                                                  .wready(`AXI4LITE_WRITEINTERFACE.wready),
                                                                  .wdata(`AXI4LITE_WRITEINTERFACE.wdata),
                                                                  .wstrb(`AXI4LITE_WRITEINTERFACE.wstrb),
                                                                  .bvalid(`AXI4LITE_WRITEINTERFACE.bvalid),
                                                                  .bready(`AXI4LITE_WRITEINTERFACE.bready),
                                                                  .bresp(`AXI4LITE_WRITEINTERFACE.bresp)
                                                                 );
    end
    for (i=0; i<NO_OF_READMASTERS; i++) begin : Axi4LiteMasterReadAgentBFM
      Axi4LiteMasterReadAgentBFM #() axi4LiteMasterReadAgentBFM(.aclk(`AXI4LITE_READINTERFACE.aclk),
                                                                .aresetn(`AXI4LITE_READINTERFACE.aresetn),
                                                                .arvalid(`AXI4LITE_READINTERFACE.arvalid),
                                                                .arready(`AXI4LITE_READINTERFACE.arready),
                                                                .araddr(`AXI4LITE_READINTERFACE.araddr),
                                                                .arprot(`AXI4LITE_READINTERFACE.arprot),
                                                                .rvalid(`AXI4LITE_READINTERFACE.rvalid),
                                                                .rready(`AXI4LITE_READINTERFACE.rready),
                                                                .rdata(`AXI4LITE_READINTERFACE.rdata),
                                                                .rresp(`AXI4LITE_READINTERFACE.rresp)
                                                               );
    end
  endgenerate

endmodule : Axi4LiteMasterHdlTop

`endif

