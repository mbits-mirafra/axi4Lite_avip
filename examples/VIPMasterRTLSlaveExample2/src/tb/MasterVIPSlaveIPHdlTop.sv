`ifndef MASTERVIPSLAVEIPHDLTOP_INCLUDED_
`define MASTERVIPSLAVEIPHDLTOP_INCLUDED_

`define AXI4LITE_MASTERWRITEINTERFACE masterVIPSlaveIPInterface.axi4LiteMasterInterface.axi4LiteMasterWriteInterface  
`define AXI4LITE_MASTERREADINTERFACE masterVIPSlaveIPInterface.axi4LiteMasterInterface.axi4LiteMasterReadInterface  
`define AXI4LITE_SLAVEWRITEINTERFACE masterVIPSlaveIPInterface.axi4LiteSlaveInterface.axi4LiteSlaveWriteInterface  
`define AXI4LITE_SLAVEREADINTERFACE masterVIPSlaveIPInterface.axi4LiteSlaveInterface.axi4LiteSlaveReadInterface  
`define AXI4LITE_MASTERINTERFACE masterVIPSlaveIPInterface.axi4LiteMasterInterface
`define AXI4LITE_SLAVEINTERFACE masterVIPSlaveIPInterface.axi4LiteSlaveInterface

module MasterVIPSlaveIPHdlTop;

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

  MasterVIPSlaveIPInterface masterVIPSlaveIPInterface(.aclk(aclk),
                                                      .aresetn(aresetn)
                                                     );

  initial begin
    assign `AXI4LITE_SLAVEWRITEINTERFACE.awvalid = `AXI4LITE_MASTERWRITEINTERFACE.awvalid;
    assign `AXI4LITE_SLAVEWRITEINTERFACE.awready = `AXI4LITE_MASTERWRITEINTERFACE.awready;
    assign `AXI4LITE_SLAVEWRITEINTERFACE.awaddr  = `AXI4LITE_MASTERWRITEINTERFACE.awaddr;
    assign `AXI4LITE_SLAVEWRITEINTERFACE.awprot  = `AXI4LITE_MASTERWRITEINTERFACE.awprot;
    assign `AXI4LITE_SLAVEWRITEINTERFACE.wvalid  = `AXI4LITE_MASTERWRITEINTERFACE.wvalid;
    assign `AXI4LITE_SLAVEWRITEINTERFACE.wready  = `AXI4LITE_MASTERWRITEINTERFACE.wready;
    assign `AXI4LITE_SLAVEWRITEINTERFACE.wdata   = `AXI4LITE_MASTERWRITEINTERFACE.wdata;
    assign `AXI4LITE_SLAVEWRITEINTERFACE.wstrb   = `AXI4LITE_MASTERWRITEINTERFACE.wstrb;
    assign `AXI4LITE_SLAVEWRITEINTERFACE.bvalid  = `AXI4LITE_MASTERWRITEINTERFACE.bvalid;
    assign `AXI4LITE_SLAVEWRITEINTERFACE.bready  = `AXI4LITE_MASTERWRITEINTERFACE.bready;
    assign `AXI4LITE_SLAVEWRITEINTERFACE.bresp   = `AXI4LITE_MASTERWRITEINTERFACE.bresp;

    assign `AXI4LITE_SLAVEREADINTERFACE.arvalid = `AXI4LITE_MASTERREADINTERFACE.arvalid;
    assign `AXI4LITE_SLAVEREADINTERFACE.arready = `AXI4LITE_MASTERREADINTERFACE.arready;
    assign `AXI4LITE_SLAVEREADINTERFACE.araddr  = `AXI4LITE_MASTERREADINTERFACE.araddr;
    assign `AXI4LITE_SLAVEREADINTERFACE.arprot  = `AXI4LITE_MASTERREADINTERFACE.arprot;
    assign `AXI4LITE_SLAVEREADINTERFACE.rvalid  = `AXI4LITE_MASTERREADINTERFACE.rvalid;
    assign `AXI4LITE_SLAVEREADINTERFACE.rready  = `AXI4LITE_MASTERREADINTERFACE.rready;
    assign `AXI4LITE_SLAVEREADINTERFACE.rdata   = `AXI4LITE_MASTERREADINTERFACE.rdata;
    assign `AXI4LITE_SLAVEREADINTERFACE.rresp   = `AXI4LITE_MASTERREADINTERFACE.rresp;
  end

  //modifie below code with your slave RTL.
  axi4_lite_slave_adaptor slaveRTL(.aclk(aclk),
           .aresetn(aresetn),
           .awvalid_in(`AXI4LITE_MASTERWRITEINTERFACE.awvalid),
           .awaddr_in(`AXI4LITE_MASTERWRITEINTERFACE.awaddr),
           .awprot_in(`AXI4LITE_MASTERWRITEINTERFACE.awprot),
           .wvalid_in(`AXI4LITE_MASTERWRITEINTERFACE.wvalid),
           .wdata_in(`AXI4LITE_MASTERWRITEINTERFACE.wdata),
           .wstrb_in(`AXI4LITE_MASTERWRITEINTERFACE.wstrb),
           .bready_in(`AXI4LITE_MASTERWRITEINTERFACE.bready),
           .awready_out(`AXI4LITE_MASTERWRITEINTERFACE.awready),
           .wready_out(`AXI4LITE_MASTERWRITEINTERFACE.wready),
           .bvalid_out(`AXI4LITE_MASTERWRITEINTERFACE.bvalid),
           .bresp_out(`AXI4LITE_MASTERWRITEINTERFACE.bresp), 

           .arvalid_in(`AXI4LITE_MASTERREADINTERFACE.arvalid),
           .araddr_in(`AXI4LITE_MASTERREADINTERFACE.araddr),
           .arprot_in(`AXI4LITE_MASTERREADINTERFACE.arprot),
           .rready_in(`AXI4LITE_MASTERREADINTERFACE.rready),
           .arready_out(`AXI4LITE_MASTERREADINTERFACE.arready),
           .rvalid_out(`AXI4LITE_MASTERREADINTERFACE.rvalid),
           .rdata_in(32'hffff_0909),
           .rdata_out(`AXI4LITE_MASTERREADINTERFACE.rdata),
           .rresp_out(`AXI4LITE_MASTERREADINTERFACE.rresp)
          );


  genvar i;
  generate
    for (i=0; i<NO_OF_WRITEMASTERS; i++) begin : Axi4LiteMasterAgentBFM
         Axi4LiteMasterAgentBFM #(.ADDR_WIDTH(Axi4LiteWriteMasterGlobalPkg::ADDRESS_WIDTH), 
                                  .DATA_WIDTH(Axi4LiteWriteMasterGlobalPkg::DATA_WIDTH)) 
                                    axi4LiteMasterAgentBFM(`AXI4LITE_MASTERINTERFACE);
    end

    for (i=0; i<NO_OF_WRITESLAVES; i++) begin : Axi4LiteSlaveAgentBFM
      Axi4LiteSlaveAgentBFM #(.ADDR_WIDTH(Axi4LiteWriteSlaveGlobalPkg::ADDRESS_WIDTH), 
                              .DATA_WIDTH(Axi4LiteWriteSlaveGlobalPkg::DATA_WIDTH)) 
                                axi4LiteSlaveAgentBFM(`AXI4LITE_SLAVEINTERFACE);
    end

  endgenerate

endmodule : MasterVIPSlaveIPHdlTop

`endif

