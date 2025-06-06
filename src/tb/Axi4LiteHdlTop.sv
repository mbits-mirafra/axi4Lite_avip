`ifndef AXI4LITEMASTERHDLTOP_INCLUDED_
`define AXI4LITEMASTERHDLTOP_INCLUDED_

`define AXI4LITE_MASTERWRITEINTERFACE axi4LiteInterface.axi4LiteMasterInterface.axi4LiteMasterWriteInterface  
`define AXI4LITE_MASTERREADINTERFACE axi4LiteInterface.axi4LiteMasterInterface.axi4LiteMasterReadInterface  
`define AXI4LITE_SLAVEWRITEINTERFACE axi4LiteInterface.axi4LiteSlaveInterface.axi4LiteSlaveWriteInterface  
`define AXI4LITE_SLAVEREADINTERFACE axi4LiteInterface.axi4LiteSlaveInterface.axi4LiteSlaveReadInterface  
`define AXI4LITE_MASTERINTERFACE axi4LiteInterface.axi4LiteMasterInterface
`define AXI4LITE_SLAVEINTERFACE axi4LiteInterface.axi4LiteSlaveInterface

module Axi4LiteHdlTop;

  import uvm_pkg::*;
  `include "uvm_macros.svh"
  import Axi4LiteWriteMasterGlobalPkg::*;
  import Axi4LiteReadMasterGlobalPkg::*;
  import Axi4LiteWriteSlaveGlobalPkg::*;
  import Axi4LiteReadSlaveGlobalPkg::*;

  `include "Axi4LiteCoverProperty.sv"

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

  initial begin
    $dumpfile("waveform.vcd");      // name of the VCD file
    $dumpvars(0, Axi4LiteHdlTop);    // dump variables from the testbench top
  end

  Axi4LiteInterface axi4LiteInterface(.aclk(aclk),
                                      .aresetn(aresetn)
                                     );

  initial begin
    assign `AXI4LITE_SLAVEWRITEINTERFACE.awvalid = `AXI4LITE_MASTERWRITEINTERFACE.awvalid;
    assign `AXI4LITE_SLAVEWRITEINTERFACE.awaddr  = `AXI4LITE_MASTERWRITEINTERFACE.awaddr;
    assign `AXI4LITE_SLAVEWRITEINTERFACE.awprot  = `AXI4LITE_MASTERWRITEINTERFACE.awprot;
    assign `AXI4LITE_SLAVEWRITEINTERFACE.wvalid  = `AXI4LITE_MASTERWRITEINTERFACE.wvalid;
    assign `AXI4LITE_SLAVEWRITEINTERFACE.wdata   = `AXI4LITE_MASTERWRITEINTERFACE.wdata;
    assign `AXI4LITE_SLAVEWRITEINTERFACE.wstrb   = `AXI4LITE_MASTERWRITEINTERFACE.wstrb;
    assign `AXI4LITE_SLAVEWRITEINTERFACE.bready  = `AXI4LITE_MASTERWRITEINTERFACE.bready;

    assign `AXI4LITE_MASTERWRITEINTERFACE.awready = `AXI4LITE_SLAVEWRITEINTERFACE.awready;
    assign `AXI4LITE_MASTERWRITEINTERFACE.wready  = `AXI4LITE_SLAVEWRITEINTERFACE.wready;
    assign `AXI4LITE_MASTERWRITEINTERFACE.bvalid  = `AXI4LITE_SLAVEWRITEINTERFACE.bvalid;
    assign `AXI4LITE_MASTERWRITEINTERFACE.bresp   = `AXI4LITE_SLAVEWRITEINTERFACE.bresp;

    assign `AXI4LITE_SLAVEREADINTERFACE.arvalid = `AXI4LITE_MASTERREADINTERFACE.arvalid;
    assign `AXI4LITE_SLAVEREADINTERFACE.araddr  = `AXI4LITE_MASTERREADINTERFACE.araddr;
    assign `AXI4LITE_SLAVEREADINTERFACE.arprot  = `AXI4LITE_MASTERREADINTERFACE.arprot;
    assign `AXI4LITE_SLAVEREADINTERFACE.rready  = `AXI4LITE_MASTERREADINTERFACE.rready;

    assign `AXI4LITE_MASTERREADINTERFACE.arready = `AXI4LITE_SLAVEREADINTERFACE.arready;
    assign `AXI4LITE_MASTERREADINTERFACE.rvalid  = `AXI4LITE_SLAVEREADINTERFACE.rvalid;
    assign `AXI4LITE_MASTERREADINTERFACE.rdata   = `AXI4LITE_SLAVEREADINTERFACE.rdata;
    assign `AXI4LITE_MASTERREADINTERFACE.rresp   = `AXI4LITE_SLAVEREADINTERFACE.rresp;
  end

  genvar i;
  generate
    for (i=0; i<NO_OF_WRITEMASTERS; i++) begin : Axi4LiteMasterAgentBFM
         Axi4LiteMasterAgentBFM #(.ADDR_WIDTH(Axi4LiteWriteMasterGlobalPkg::ADDRESS_WIDTH), .DATA_WIDTH(Axi4LiteWriteMasterGlobalPkg::DATA_WIDTH)) 
                                    axi4LiteMasterAgentBFM(`AXI4LITE_MASTERINTERFACE);
    end

    for (i=0; i<NO_OF_WRITESLAVES; i++) begin : Axi4LiteSlaveAgentBFM
      Axi4LiteSlaveAgentBFM #(.ADDR_WIDTH(Axi4LiteWriteSlaveGlobalPkg::ADDRESS_WIDTH), .DATA_WIDTH(Axi4LiteWriteSlaveGlobalPkg::DATA_WIDTH)) 
                                   axi4LiteSlaveAgentBFM(`AXI4LITE_SLAVEINTERFACE);
    end

  endgenerate


  bind axi4LiteInterface Axi4LiteCoverProperty AXI4LITE_COVERPROPERTY (.aclk(aclk),
                                                                       .aresetn(aresetn),
                                                                       .awvalid(`AXI4LITE_MASTERWRITEINTERFACE.awvalid),
                                                                       .awready(`AXI4LITE_SLAVEWRITEINTERFACE.awready),
                                                                       .awaddr(`AXI4LITE_MASTERWRITEINTERFACE.awaddr),
                                                                       .awprot(`AXI4LITE_MASTERWRITEINTERFACE.awprot),
                                                                       .wvalid(`AXI4LITE_MASTERWRITEINTERFACE.wvalid),
                                                                       .wready(`AXI4LITE_SLAVEWRITEINTERFACE.wready),
                                                                       .wdata(`AXI4LITE_MASTERWRITEINTERFACE.wdata),
                                                                       .wstrb(`AXI4LITE_MASTERWRITEINTERFACE.wstrb),

                                                                       .bvalid(`AXI4LITE_SLAVEWRITEINTERFACE.bvalid),
                                                                       .bready(`AXI4LITE_MASTERWRITEINTERFACE.bready),
                                                                       .bresp(`AXI4LITE_SLAVEWRITEINTERFACE.bresp), 
                                                                       .arvalid(`AXI4LITE_MASTERREADINTERFACE.arvalid),
                                                                       .arready(`AXI4LITE_SLAVEREADINTERFACE.arready),
                                                                       .araddr(`AXI4LITE_MASTERREADINTERFACE.araddr),
                                                                       .arprot(`AXI4LITE_MASTERREADINTERFACE.arprot),
                                                                       .rvalid(`AXI4LITE_SLAVEREADINTERFACE.rvalid),
                                                                       .rready(`AXI4LITE_MASTERREADINTERFACE.rready),
                                                                       .rdata(`AXI4LITE_SLAVEREADINTERFACE.rdata),
                                                                       .rresp(`AXI4LITE_SLAVEREADINTERFACE.rresp)
                                                                       );
  

endmodule : Axi4LiteHdlTop

`endif

