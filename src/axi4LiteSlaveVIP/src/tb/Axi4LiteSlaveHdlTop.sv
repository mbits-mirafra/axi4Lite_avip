`ifndef AXI4LITESLAVEHDLTOP_INCLUDED_
`define AXI4LITESLAVEHDLTOP_INCLUDED_

`define AXI4LITE_WRITEINTERFACE axi4LiteMasterInterface.axi4LiteMasterWriteInterface  
`define AXI4LITE_READINTERFACE axi4LiteMasterInterface.axi4LiteMasterReadInterface  

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

  Axi4LiteSlaveInterface axi4LiteSlaveInterface(.aclk(aclk),
                                                .aresetn(aresetn)
                                               );

  initial begin
   `AXI4LITE_WRITEINTERFACE.awvalid  <= 1'b1; 
   `AXI4LITE_WRITEINTERFACE.awaddr   <= 4'hc; 
   `AXI4LITE_WRITEINTERFACE.awprot   <= 3'b000; 
   `AXI4LITE_WRITEINTERFACE.wvalid   <= 1'b1;    
   `AXI4LITE_WRITEINTERFACE.wdata    <= 32'haaaa_bbbb;    
   `AXI4LITE_WRITEINTERFACE.wstrb    <= 4'hf;    
   `AXI4LITE_WRITEINTERFACE.bready   <= 1'b1;  
 end

  initial begin
    `AXI4LITE_READINTERFACE.arvalid  <= 1'b1;
    `AXI4LITE_READINTERFACE.araddr   <= 4'hd;
    `AXI4LITE_READINTERFACE.arprot   <= 3'b000;
    `AXI4LITE_READINTERFACE.rready   <= 1'b1;
 end

  genvar i;
  generate
    for (i=0; i<NO_OF_WRITESLAVES; i++) begin : Axi4LiteSlaveWriteAgentBFM
      Axi4LiteSlaveWriteAgentBFM #() axi4LiteSlaveWriteAgentBFM(.aclk(`AXI4LITE_WRITEINTERFACE.aclk),
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

    for (i=0; i<NO_OF_READSLAVES; i++) begin : Axi4LiteSlaveReadAgentBFM
      Axi4LiteSlaveReadAgentBFM #() axi4LiteSlaveReadAgentBFM(.aclk(`AXI4LITE_READINTERFACE.aclk),
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

endmodule : Axi4LiteSlaveHdlTop

`endif

