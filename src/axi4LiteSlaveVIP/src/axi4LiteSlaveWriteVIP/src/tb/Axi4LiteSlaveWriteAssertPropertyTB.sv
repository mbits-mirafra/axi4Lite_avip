`ifndef AXI4LITESLAVEWRITEASSERTPROPERTYTB_INCLUDED_
`define AXI4LITESLAVEWRITEASSERTPROPERTYTB_INCLUDED_

`include "uvm_macros.svh"
import uvm_pkg::*;
import Axi4LiteWriteSlaveGlobalPkg::*;

module Axi4LiteSlaveWriteAssertPropertyTB;
  bit aclk;
  bit aresetn;
  //Write Address Channels Signals
  logic awvalid;
  logic [ADDRESS_WIDTH-1:0] awaddr;
  logic awready;
  logic [2:0] awprot;
  //Write Data Channel Signals
  logic wvalid;
  logic [DATA_WIDTH-1:0] wdata;
  logic wready;
  logic [(DATA_WIDTH/8)-1:0] wstrb;
  //Write Response Channel
  logic bvalid;
  logic bready;
  logic [1:0] bresp;

  string name = "AXI4LITE_ASSERTPROPERTY_TB";

  initial begin
    `uvm_info(name,$sformatf("TEST_BENCH_FOR_AXI4LITE_ASSERTPROPERTY"),UVM_LOW);
  end
  always #10 aclk = ~aclk;

  Axi4LiteSlaveWriteAssertions axi4LiteSlaveWriteAssertions(.aclk(aclk),
                                                              .aresetn(aresetn),
                                                              .awvalid(awvalid),
                                                              .awready(awready),
                                                              .awaddr(awaddr),
                                                              .awprot(awprot),
                                                              .wvalid(wvalid),
                                                              .wdata(wdata),
                                                              .wready(wready),
                                                              .wstrb(wstrb),
                                                              .bvalid(bvalid),
                                                              .bready(bready),
                                                              .bresp(bresp)
                                                             );

  initial begin
    #10000;
    $finish;
  end


endmodule : Axi4LiteSlaveWriteAssertPropertyTB

`endif


