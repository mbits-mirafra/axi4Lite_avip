`ifndef SLAVEVIPMASTERIPHDLTOP_INCLUDED_
`define SLAVEVIPMASTERIPHDLTOP_INCLUDED_

`define AXI4LITE_MASTERWRITEINTERFACE slaveVIPMasterIPInterface.axi4LiteMasterInterface.axi4LiteMasterWriteInterface  
`define AXI4LITE_MASTERREADINTERFACE slaveVIPMasterIPInterface.axi4LiteMasterInterface.axi4LiteMasterReadInterface  
`define AXI4LITE_SLAVEWRITEINTERFACE slaveVIPMasterIPInterface.axi4LiteSlaveInterface.axi4LiteSlaveWriteInterface  
`define AXI4LITE_SLAVEREADINTERFACE slaveVIPMasterIPInterface.axi4LiteSlaveInterface.axi4LiteSlaveReadInterface  
`define AXI4LITE_MASTERINTERFACE slaveVIPMasterIPInterface.axi4LiteMasterInterface
`define AXI4LITE_SLAVEINTERFACE slaveVIPMasterIPInterface.axi4LiteSlaveInterface

module SlaveVIPMasterIPHdlTop;
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

  MasterRTLInterface masterRTLInterface(.aclk(aclk),
                                        .aresetn(aresetn)
                                        );

  SlaveVIPMasterIPInterface slaveVIPMasterIPInterface(.aclk(aclk),
                                                      .aresetn(aresetn)
                                                     );

  initial begin
    assign `AXI4LITE_MASTERWRITEINTERFACE.awvalid = `AXI4LITE_SLAVEWRITEINTERFACE.awvalid;
    assign `AXI4LITE_MASTERWRITEINTERFACE.awready = `AXI4LITE_SLAVEWRITEINTERFACE.awready;
    assign `AXI4LITE_MASTERWRITEINTERFACE.awaddr  = `AXI4LITE_SLAVEWRITEINTERFACE.awaddr;
    assign `AXI4LITE_MASTERWRITEINTERFACE.awprot  = `AXI4LITE_SLAVEWRITEINTERFACE.awprot;
    assign `AXI4LITE_MASTERWRITEINTERFACE.wvalid  = `AXI4LITE_SLAVEWRITEINTERFACE.wvalid;
    assign `AXI4LITE_MASTERWRITEINTERFACE.wready  = `AXI4LITE_SLAVEWRITEINTERFACE.wready;
    assign `AXI4LITE_MASTERWRITEINTERFACE.wdata   = `AXI4LITE_SLAVEWRITEINTERFACE.wdata;
    assign `AXI4LITE_MASTERWRITEINTERFACE.wstrb   = `AXI4LITE_SLAVEWRITEINTERFACE.wstrb;
    assign `AXI4LITE_MASTERWRITEINTERFACE.bvalid  = `AXI4LITE_SLAVEWRITEINTERFACE.bvalid;
    assign `AXI4LITE_MASTERWRITEINTERFACE.bready  = `AXI4LITE_SLAVEWRITEINTERFACE.bready;
    assign `AXI4LITE_MASTERWRITEINTERFACE.bresp   = `AXI4LITE_SLAVEWRITEINTERFACE.bresp;

    assign `AXI4LITE_MASTERREADINTERFACE.arvalid = `AXI4LITE_SLAVEREADINTERFACE.arvalid;
    assign `AXI4LITE_MASTERREADINTERFACE.arready = `AXI4LITE_SLAVEREADINTERFACE.arready;
    assign `AXI4LITE_MASTERREADINTERFACE.araddr  = `AXI4LITE_SLAVEREADINTERFACE.araddr;
    assign `AXI4LITE_MASTERREADINTERFACE.arprot  = `AXI4LITE_SLAVEREADINTERFACE.arprot;
    assign `AXI4LITE_MASTERREADINTERFACE.rvalid  = `AXI4LITE_SLAVEREADINTERFACE.rvalid;
    assign `AXI4LITE_MASTERREADINTERFACE.rready  = `AXI4LITE_SLAVEREADINTERFACE.rready;
    assign `AXI4LITE_MASTERREADINTERFACE.rdata   = `AXI4LITE_SLAVEREADINTERFACE.rdata;
    assign `AXI4LITE_MASTERREADINTERFACE.rresp   = `AXI4LITE_SLAVEREADINTERFACE.rresp;
  end

 //modifie below code with your master RTL.
 axi4_lite_master_adaptor masterRTL(.aclk(aclk),
                                    .aresetn(aresetn),
                                    .awvalid_out(`AXI4LITE_SLAVEWRITEINTERFACE.awvalid),
                                    .awaddr_out(`AXI4LITE_SLAVEWRITEINTERFACE.awaddr),
                                    .wvalid_out(`AXI4LITE_SLAVEWRITEINTERFACE.wvalid),
                                    .wdata_out(`AXI4LITE_SLAVEWRITEINTERFACE.wdata),
                                    .wstrb_out(`AXI4LITE_SLAVEWRITEINTERFACE.wstrb),
                                    .bready_out(`AXI4LITE_SLAVEWRITEINTERFACE.bready),
                                    .awready_in(`AXI4LITE_SLAVEWRITEINTERFACE.awready),
                                    .wready_in(`AXI4LITE_SLAVEWRITEINTERFACE.wready),
                                    .bvalid_in(`AXI4LITE_SLAVEWRITEINTERFACE.bvalid),
                                    .bresp_in(`AXI4LITE_SLAVEWRITEINTERFACE.bresp), 

                                    .arvalid_out(`AXI4LITE_SLAVEREADINTERFACE.arvalid),
                                    .araddr_out(`AXI4LITE_SLAVEREADINTERFACE.araddr),
                                    .rready_out(`AXI4LITE_SLAVEREADINTERFACE.rready),
                                    .arready_in(`AXI4LITE_SLAVEREADINTERFACE.arready),
                                    .rvalid_in(`AXI4LITE_SLAVEREADINTERFACE.rvalid),
                                    .rdata_in(`AXI4LITE_SLAVEREADINTERFACE.rdata),
                                    .rresp_in(`AXI4LITE_SLAVEREADINTERFACE.rresp),

                                    .awaddr_in(masterRTLInterface.awaddr),
                                    .awprot_in(masterRTLInterface.awaddr),
                                    .wstrb_in(masterRTLInterface.wstrb),
                                    .wdata_in(masterRTLInterface.wdata),
                                    .araddr_in(masterRTLInterface.araddr),
                                    .arprot_in(masterRTLInterface.araddr)
                                  );

  initial begin
    uvm_config_db#(virtual MasterRTLInterface)::set(null,"*", "MasterRTLInterface", masterRTLInterface); 
  end

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

endmodule : SlaveVIPMasterIPHdlTop

`endif

