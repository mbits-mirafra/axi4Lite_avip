`ifndef MASTERVIPSLAVEIPHDLTOP_INCLUDED_
`define MASTERVIPSLAVEIPHDLTOP_INCLUDED_

`define AXI4LITE_MASTERWRITEINTERFACE masterVIPSlaveIPInterface.axi4LiteMasterInterface.axi4LiteMasterWriteInterface  
`define AXI4LITE_MASTERREADINTERFACE masterVIPSlaveIPInterface.axi4LiteMasterInterface.axi4LiteMasterReadInterface  
`define AXI4LITE_SLAVEWRITEINTERFACE masterVIPSlaveIPInterface.axi4LiteSlaveInterface.axi4LiteSlaveWriteInterface  
`define AXI4LITE_SLAVEREADINTERFACE masterVIPSlaveIPInterface.axi4LiteSlaveInterface.axi4LiteSlaveReadInterface  

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

  slave #(.ADDRESS_WIDTH(Axi4LiteWriteMasterGlobalPkg::ADDRESS_WIDTH), 
          .DATA_WIDTH(Axi4LiteWriteMasterGlobalPkg::DATA_WIDTH))
  slaveRTL(.clk(aclk),
           .rst_n(aresetn),
           .awvalid(`AXI4LITE_MASTERWRITEINTERFACE.awvalid),
           .awaddr(`AXI4LITE_MASTERWRITEINTERFACE.awaddr),
           .wvalid(`AXI4LITE_MASTERWRITEINTERFACE.wvalid),
           .wdata(`AXI4LITE_MASTERWRITEINTERFACE.wdata),
           .wstrb(`AXI4LITE_MASTERWRITEINTERFACE.wstrb),
           .bready(`AXI4LITE_MASTERWRITEINTERFACE.bready),
           .awready(`AXI4LITE_MASTERWRITEINTERFACE.awready),
           .wready(`AXI4LITE_MASTERWRITEINTERFACE.wready),
           .bvalid(`AXI4LITE_MASTERWRITEINTERFACE.bvalid),
           .bresp(`AXI4LITE_MASTERWRITEINTERFACE.bresp), 

           .arvalid(`AXI4LITE_MASTERREADINTERFACE.arvalid),
           .araddr(`AXI4LITE_MASTERREADINTERFACE.araddr),
           .rready(`AXI4LITE_MASTERREADINTERFACE.rready),
           .arready(`AXI4LITE_MASTERREADINTERFACE.arready),
           .rvalid(`AXI4LITE_MASTERREADINTERFACE.rvalid),
           .rdata(`AXI4LITE_MASTERREADINTERFACE.rdata),
           .rresp(`AXI4LITE_MASTERREADINTERFACE.rresp)
          );


  genvar i;
  generate
    for (i=0; i<NO_OF_WRITEMASTERS; i++) begin : Axi4LiteMasterWriteAgentBFM
         Axi4LiteMasterWriteAgentBFM #(.ADDR_WIDTH(Axi4LiteWriteMasterGlobalPkg::ADDRESS_WIDTH), .DATA_WIDTH(Axi4LiteWriteMasterGlobalPkg::DATA_WIDTH)) 
                                    axi4LiteMasterWriteAgentBFM(`AXI4LITE_MASTERWRITEINTERFACE);
    end

    for (i=0; i<NO_OF_READMASTERS; i++) begin : Axi4LiteMasterReadAgentBFM
      Axi4LiteMasterReadAgentBFM #(.ADDR_WIDTH(Axi4LiteReadMasterGlobalPkg::ADDRESS_WIDTH), .DATA_WIDTH(Axi4LiteReadMasterGlobalPkg::DATA_WIDTH)) 
                                   axi4LiteMasterReadAgentBFM(`AXI4LITE_MASTERREADINTERFACE);
    end

    for (i=0; i<NO_OF_WRITESLAVES; i++) begin : Axi4LiteSlaveWriteAgentBFM
      Axi4LiteSlaveWriteAgentBFM #(.ADDR_WIDTH(Axi4LiteWriteSlaveGlobalPkg::ADDRESS_WIDTH), .DATA_WIDTH(Axi4LiteWriteSlaveGlobalPkg::DATA_WIDTH)) 
                                   axi4LiteSlaveWriteAgentBFM(`AXI4LITE_SLAVEWRITEINTERFACE);
    end

    for (i=0; i<NO_OF_READSLAVES; i++) begin : Axi4LiteSlaveReadAgentBFM
      Axi4LiteSlaveReadAgentBFM #(.ADDR_WIDTH(Axi4LiteReadSlaveGlobalPkg::ADDRESS_WIDTH), .DATA_WIDTH(Axi4LiteReadSlaveGlobalPkg::DATA_WIDTH)) 
                                  axi4LiteSlaveReadAgentBFM(`AXI4LITE_SLAVEREADINTERFACE);
    end

  endgenerate

endmodule : MasterVIPSlaveIPHdlTop

`endif

