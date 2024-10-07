`ifndef AXI4LITESLAVEHDLTOP_INCLUDED_
`define AXI4LITESLAVEHDLTOP_INCLUDED_

`define AXI4LITE_WRITEINTERFACE axi4LiteSlaveInterface.axi4LiteSlaveWriteInterface  
`define AXI4LITE_READINTERFACE axi4LiteSlaveInterface.axi4LiteSlaveReadInterface  

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
      Axi4LiteSlaveWriteAgentBFM #() axi4LiteSlaveWriteAgentBFM(`AXI4LITE_WRITEINTERFACE);
    end

    for (i=0; i<NO_OF_READSLAVES; i++) begin : Axi4LiteSlaveReadAgentBFM
      Axi4LiteSlaveReadAgentBFM #() axi4LiteSlaveReadAgentBFM(`AXI4LITE_READINTERFACE);
    end
  endgenerate

endmodule : Axi4LiteSlaveHdlTop

`endif

