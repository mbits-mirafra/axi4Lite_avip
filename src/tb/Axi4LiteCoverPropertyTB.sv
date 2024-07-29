`ifndef AXI4LITECOVERASSERTPROPERTYTB_INCLUDED_
`define AXI4LITECOVERASSERTPROPERTYTB_INCLUDED_

`define AXI4LITE_MASTERWRITEINTERFACE axi4LiteInterface.axi4LiteMasterInterface.axi4LiteMasterWriteInterface  
`define AXI4LITE_MASTERREADINTERFACE axi4LiteInterface.axi4LiteMasterInterface.axi4LiteMasterReadInterface  
`define AXI4LITE_SLAVEWRITEINTERFACE axi4LiteInterface.axi4LiteSlaveInterface.axi4LiteSlaveWriteInterface  
`define AXI4LITE_SLAVEREADINTERFACE axi4LiteInterface.axi4LiteSlaveInterface.axi4LiteSlaveReadInterface  


 `include "uvm_macros.svh"
  import Axi4LiteWriteMasterGlobalPkg::*;

  import uvm_pkg::*;

module Axi4LiteCoverPropertyTB;
  
  bit aclk;
  bit aresetn;
  //Write Address Channels Signals
  logic awvalid;
  logic [(Axi4LiteWriteMasterGlobalPkg::ADDRESS_WIDTH)-1:0] awaddr;
  logic awready;
  logic [2:0] awprot;
  //Write Data Channel Signals
  logic wvalid;
  logic [((Axi4LiteWriteMasterGlobalPkg::DATA_WIDTH/8))-1:0] wstrb;
  logic [(Axi4LiteWriteMasterGlobalPkg::DATA_WIDTH)-1:0] wdata;
  logic wready;
  //Write Response Channel
  logic bvalid;
  logic bready;
  logic [1:0] bresp;
  //Read Address Channels Signals
  logic arvalid;
  logic [(Axi4LiteReadMasterGlobalPkg::ADDRESS_WIDTH)-1:0] araddr;
  logic arready;
  logic [2:0] arprot;
  //Read Data Channel Signals
  logic rvalid;
  logic [(Axi4LiteReadMasterGlobalPkg::DATA_WIDTH)-1:0] rdata;
  logic rready;
  logic [1:0] rresp;
  
  string name = "AXI4LITE_COVERASSERT_PROPERTY_TB";
  initial begin
    `uvm_info(name,$sformatf("AXI4LITE_COVER_ASSERT_PROPERTY_TB"),UVM_LOW);
  end

  always #10 aclk = ~aclk;
 
  Axi4LiteInterface axi4LiteInterface(.aclk(aclk),
                                     .aresetn(aresetn));
  
  Axi4LiteCoverProperty axi4LiteCoverProperty(.aclk(aclk),
                                              .aresetn(aresetn),
                                              .awvalid(awvalid),
                                              .awready(awready),
                                              .awaddr(awaddr),
                                              .awprot(awprot),
                                              .wvalid(wvalid),
                                              .wready(wready),
                                              .wdata(wdata),
                                              .wstrb(wstrb),
                                              .bvalid(bvalid),
                                              .bready(bready),
                                              .bresp(bresp),
                                              .arvalid(arvalid),
                                              .arready(arready),
                                              .araddr(araddr),
                                              .arprot(arprot),
                                              .rvalid(rvalid),
                                              .rready(rready),
                                              .rdata(rdata),
                                              .rresp(rresp)
                                             );

 
  initial begin
    #1400;
    $finish;
  end

  initial begin
    When_writeAddressAndDataAreEqualToReadAddressAndData();
    When_writeAddressAndDataIsNotEqualToReadAddressAndData();
    When_write64BitsAddressAndDataAreEqualTo64BitsReadAddressAndData();
    When_write64BitsAddressAndDataIsNotEqualTo64BitsReadAddressAndData();
  end 

  task When_writeAddressAndDataAreEqualToReadAddressAndData();
    `uvm_info(name,$sformatf("When_writeAddressAndDataAreEqualToReadAddressAndData Task started"),UVM_NONE);
      @(posedge aclk);  
      aresetn <= 1'b1;
      awvalid <= 1'b0;
      awready <= 1'b0;
      awaddr  <= 32'hxxxx_xxxx;
      wvalid  <= 1'b0;
      wready  <= 1'b0;
      wdata   <= 32'hxxxx_xxxx;
      arvalid <= 1'b0;
      arready <= 1'b0;
      araddr  <= 32'hxxxx_xxxx;
      rvalid  <= 1'b0;
      rready  <= 1'b0;
      rdata   <= 32'hxxxx_xxxx;
      @(posedge aclk)
      awvalid <= 1'b1;
      awready <= 1'b1;
      awaddr  <= 32'h1000_10004;
      @(posedge aclk)
      arvalid <= 1'b1;
      arready <= 1'b1;
      araddr  <= 32'h1000_10004;
      @(posedge aclk)
      wvalid  <= 1'b1;
      wready  <= 1'b1;
      wdata   <= 32'h1234_abcd;
      @(posedge aclk)
      rvalid  <= 1'b1;
      rready  <= 1'b1;
      rdata   <= 32'h1234_abcd;
   `uvm_info(name,$sformatf("When_writeAddressAndDataAreEqualToReadAddressAndData Task Ended"),UVM_NONE);
  endtask

  task When_writeAddressAndDataIsNotEqualToReadAddressAndData();
    `uvm_info(name,$sformatf("When_writeAddressAndDataIsNotEqualToReadAddressAndData Task started"),UVM_NONE);
      @(posedge aclk);  
      aresetn <= 1'b1;
      awvalid <= 1'b0;
      awready <= 1'b0;
      awaddr  <= 32'hxxxx_xxxx;
      wvalid  <= 1'b0;
      wready  <= 1'b0;
      wdata   <= 32'hxxxx_xxxx;
      arvalid <= 1'b0;
      arready <= 1'b0;
      araddr  <= 32'hxxxx_xxxx;
      rvalid  <= 1'b0;
      rready  <= 1'b0;
      rdata   <= 32'hxxxx_xxxx;
      @(posedge aclk)
      awvalid <= 1'b1;
      awready <= 1'b1;
      awaddr  <= 32'h1004_1008;
      @(posedge aclk)
      arvalid <= 1'b1;
      arready <= 1'b1;
      araddr  <= 32'h1000_2000;
      @(posedge aclk)
      wvalid  <= 1'b1;
      wready  <= 1'b1;
      wdata   <= 32'h1234_5678;
      @(posedge aclk)
      rvalid  <= 1'b1;
      rready  <= 1'b1;
      rdata   <= 32'h4545_abcd;
   `uvm_info(name,$sformatf("When_writeAddressAndDataIsNotEqualToReadAddressAndData Task Ended"),UVM_NONE);
  endtask

   task  When_write64BitsAddressAndDataAreEqualTo64BitsReadAddressAndData();
    `uvm_info(name,$sformatf("When_write64BitsAddressAndDataAreEqualTo64BitsReadAddressAndData Task started"),UVM_NONE);
      @(posedge aclk);  
      aresetn <= 1'b1;
      awvalid <= 1'b0;
      awready <= 1'b0;
      awaddr  <= 64'hxxxx_xxxx_xxxx_xxxx;
      wvalid  <= 1'b0;
      wready  <= 1'b0;
      wdata   <= 64'hxxxx_xxxx_xxxx_xxxx;
      wstrb   <= 8'b0000_0000;
      arvalid <= 1'b0;
      arready <= 1'b0;
      araddr  <= 64'hxxxx_xxxx_xxxx_xxxx;
      rvalid  <= 1'b0;
      rready  <= 1'b0;
      rdata   <= 64'hxxxx_xxxx_xxxx_xxxx;
      @(posedge aclk)
      awvalid <= 1'b1;
      awready <= 1'b1;
      awaddr  <= 64'h1000_10004_1008_100B;
      @(posedge aclk)
      arvalid <= 1'b1;
      arready <= 1'b1;
      araddr  <= 64'h1000_10004_1008_100B;
      @(posedge aclk)
      wvalid  <= 1'b1;
      wready  <= 1'b1;
      wdata   <= 64'h1234_abcd_4545_5678;
      wstrb   <= 8'b1111_1111;
      @(posedge aclk)
      rvalid  <= 1'b1;
      rready  <= 1'b1;
      rdata   <= 64'h1234_abcd_4545_5678;
   `uvm_info(name,$sformatf("When_write64BitsAddressAndDataAreEqualTo64BitsReadAddressAndData Task Ended"),UVM_NONE);
  endtask

  task When_write64BitsAddressAndDataIsNotEqualTo64BitsReadAddressAndData();
  `uvm_info(name,$sformatf("When_write64BitsAddressAndDataIsNotEqualTo64BitsReadAddressAndData Task started"),UVM_NONE);
      @(posedge aclk);  
      aresetn <= 1'b1;
      awvalid <= 1'b0;
      awready <= 1'b0;
      awaddr  <= 64'hxxxx_xxxx_xxxx_xxxx;
      wvalid  <= 1'b0;
      wready  <= 1'b0;
      wdata   <= 64'hxxxx_xxxx_xxxx_xxxx;
      wstrb   <= 8'b0000_0000;
      arvalid <= 1'b0;
      arready <= 1'b0;
      araddr  <= 64'hxxxx_xxxx_xxxx_xxxx;
      rvalid  <= 1'b0;
      rready  <= 1'b0;
      rdata   <= 64'hxxxx_xxxx_xxxx_xxxx;
      @(posedge aclk)
      awvalid <= 1'b1;
      awready <= 1'b1;
      awaddr  <= 64'h1000_10004_1008_100B;
      @(posedge aclk)
      arvalid <= 1'b1;
      arready <= 1'b1;
      araddr  <= 64'h1000_10004_ABCD_1001;
      @(posedge aclk)
      wvalid  <= 1'b1;
      wready  <= 1'b1;
      wdata   <= 64'h1234_abcd_4545_5678;
      wstrb   <= 8'b1111_1111;
      @(posedge aclk)
      rvalid  <= 1'b1;
      rready  <= 1'b1;
      rdata   <= 64'hAD2A_1231_1313_111A;
   `uvm_info(name,$sformatf("When_write64BitsAddressAndDataIsNotEqualTo64BitsReadAddressAndData Task Ended"),UVM_NONE);
  endtask


endmodule : Axi4LiteCoverPropertyTB


`endif
