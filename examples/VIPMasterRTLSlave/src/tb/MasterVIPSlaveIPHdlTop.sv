`ifndef MASTERVIPSLAVEIPHDLTOP_INCLUDED_
`define MASTERVIPSLAVEIPHDLTOP_INCLUDED_

`define AXI4LITE_MASTERWRITEINTERFACE axi4LiteInterface.axi4LiteMasterInterface.axi4LiteMasterWriteInterface  
`define AXI4LITE_MASTERREADINTERFACE axi4LiteInterface.axi4LiteMasterInterface.axi4LiteMasterReadInterface  

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

  slave #(.ADDRESS_WIDTH(Axi4LiteWriteMasterGlobalPkg::ADDRESS_WIDTH), 
          .DATA_WIDTH(Axi4LiteWriteMasterGlobalPkg::DATA_WIDTH))
  slaveRTL(.clk(aclk),
           .rst_n(aresetn)
          );

  initial begin
    assign slaveRTL.awvalid = `AXI4LITE_MASTERWRITEINTERFACE.awvalid;
    assign slaveRTL.awaddr  = `AXI4LITE_MASTERWRITEINTERFACE.awaddr;
    assign slaveRTL.awprot  = `AXI4LITE_MASTERWRITEINTERFACE.awprot;
    assign slaveRTL.wvalid  = `AXI4LITE_MASTERWRITEINTERFACE.wvalid;
    assign slaveRTL.wdata   = `AXI4LITE_MASTERWRITEINTERFACE.wdata;
    assign slaveRTL.wstrb   = `AXI4LITE_MASTERWRITEINTERFACE.wstrb;
    assign slaveRTL.bready  = `AXI4LITE_MASTERWRITEINTERFACE.bready;

    assign `AXI4LITE_MASTERWRITEINTERFACE.awready = slaveRTL.awready;
    assign `AXI4LITE_MASTERWRITEINTERFACE.wready  = slaveRTL.wready;
    assign `AXI4LITE_MASTERWRITEINTERFACE.bvalid  = slaveRTL.bvalid;
    assign `AXI4LITE_MASTERWRITEINTERFACE.bresp   = slaveRTL.bresp;

    assign slaveRTL.arvalid = `AXI4LITE_MASTERREADINTERFACE.arvalid;
    assign slaveRTL.araddr  = `AXI4LITE_MASTERREADINTERFACE.araddr;
    assign slaveRTL.arprot  = `AXI4LITE_MASTERREADINTERFACE.arprot;
    assign slaveRTL.rready  = `AXI4LITE_MASTERREADINTERFACE.rready;

    assign `AXI4LITE_MASTERREADINTERFACE.arready = slaveRTL.arready;
    assign `AXI4LITE_MASTERREADINTERFACE.rvalid  = slaveRTL.rvalid;
    assign `AXI4LITE_MASTERREADINTERFACE.rdata   = slaveRTL.rdata;
    assign `AXI4LITE_MASTERREADINTERFACE.rresp   = slaveRTL.rresp;
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

