`ifndef MASTERVIPSLAVEIPHDLTOP_INCLUDED_
`define MASTERVIPSLAVEIPHDLTOP_INCLUDED_

module MasterVIPSlaveIPHdlTop;

  import uvm_pkg::*;
  `include "uvm_macros.svh"
  import Axi4LiteWriteMasterGlobalPkg::*;
  import Axi4LiteReadMasterGlobalPkg::*;

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
  MasterVIPSlaveIPInterface masterVIPSlaveIPInterface(.aclk(aclk),
                                                      .aresetn(aresetn)
                                                     );

  initial begin
  end

  genvar i;
  generate
    for (i=0; i<NO_OF_WRITEMASTERS; i++) begin : Axi4LiteMasterWriteAgentBFM
         Axi4LiteMasterWriteAgentBFM #(.ADDR_WIDTH(Axi4LiteWriteMasterGlobalPkg::ADDRESS_WIDTH), .DATA_WIDTH(Axi4LiteWriteMasterGlobalPkg::DATA_WIDTH)) 
                                    axi4LiteMasterWriteAgentBFM(.aclk(`AXI4LITE_MASTERWRITEINTERFACE.aclk),
                                                                .aresetn(`AXI4LITE_MASTERWRITEINTERFACE.aresetn),
                                                                .awvalid(`AXI4LITE_MASTERWRITEINTERFACE.awvalid),
                                                                .awready(`AXI4LITE_MASTERWRITEINTERFACE.awready),
                                                                .awaddr(`AXI4LITE_MASTERWRITEINTERFACE.awaddr),
                                                                .awprot(`AXI4LITE_MASTERWRITEINTERFACE.awprot),
                                                                .wvalid(`AXI4LITE_MASTERWRITEINTERFACE.wvalid),
                                                                .wready(`AXI4LITE_MASTERWRITEINTERFACE.wready),
                                                                .wdata(`AXI4LITE_MASTERWRITEINTERFACE.wdata),
                                                                .wstrb(`AXI4LITE_MASTERWRITEINTERFACE.wstrb),
                                                                .bvalid(`AXI4LITE_MASTERWRITEINTERFACE.bvalid),
                                                                .bready(`AXI4LITE_MASTERWRITEINTERFACE.bready),
                                                                .bresp(`AXI4LITE_MASTERWRITEINTERFACE.bresp)
                                                                );
    end

    for (i=0; i<NO_OF_READMASTERS; i++) begin : Axi4LiteMasterReadAgentBFM
      Axi4LiteMasterReadAgentBFM #(.ADDR_WIDTH(Axi4LiteReadMasterGlobalPkg::ADDRESS_WIDTH), .DATA_WIDTH(Axi4LiteReadMasterGlobalPkg::DATA_WIDTH)) 
                                   axi4LiteMasterReadAgentBFM(.aclk(`AXI4LITE_MASTERREADINTERFACE.aclk),
                                                              .aresetn(`AXI4LITE_MASTERREADINTERFACE.aresetn),
                                                              .arvalid(`AXI4LITE_MASTERREADINTERFACE.arvalid),
                                                              .arready(`AXI4LITE_MASTERREADINTERFACE.arready),
                                                              .araddr(`AXI4LITE_MASTERREADINTERFACE.araddr),
                                                              .arprot(`AXI4LITE_MASTERREADINTERFACE.arprot),
                                                              .rvalid(`AXI4LITE_MASTERREADINTERFACE.rvalid),
                                                              .rready(`AXI4LITE_MASTERREADINTERFACE.rready),
                                                              .rdata(`AXI4LITE_MASTERREADINTERFACE.rdata),
                                                              .rresp(`AXI4LITE_MASTERREADINTERFACE.rresp)
                                                             );
    end

  endgenerate

endmodule : MasterVIPSlaveIPHdlTop

`endif

