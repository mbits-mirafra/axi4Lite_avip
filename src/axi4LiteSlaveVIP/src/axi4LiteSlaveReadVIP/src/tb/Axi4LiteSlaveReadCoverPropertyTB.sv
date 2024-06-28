`ifndef AXI4LITESLAVEREADCOVERPROPERTYTB_INCLUDED_
`define AXI4LITESLAVEREADCOVERPROPERTYTB_INCLUDED_

`include "uvm_macros.svh"
import uvm_pkg::*;
import Axi4LiteReadSlaveGlobalPkg::*;

module Axi4LiteSlaveReadCoverPropertyTB;
  bit aclk;
  bit aresetn;
  //Read Address Channels Signals
  logic arvalid;
  logic [ADDRESS_WIDTH-1:0] araddr;
  logic arready;
  logic [2:0] arprot;
  //Read Data Channel Signals
  logic rvalid;
  logic [DATA_WIDTH-1:0] rdata;
  logic rready;
  logic [1:0] rresp;
  
  string name = "AXI4LITE_COVERPROPERTY_TB";

  initial begin
    `uvm_info(name,$sformatf("TEST_BENCH_FOR_AXI4LITE_COVERPROPERTY"),UVM_LOW);
  end
  always #10 aclk = ~aclk;

  Axi4LiteSlaveReadCoverProperty Axi4LiteSlaveReadCoverPropertys(.aclk(aclk),
                                                                    .aresetn(aresetn),
                                                                    .arvalid(arvalid),
                                                                    .arready(arready),
                                                                    .araddr(araddr),
                                                                    .arprot(arprot),
                                                                    .rvalid(rvalid),
                                                                    .rdata(rdata),
                                                                    .rresp(rresp),
                                                                    .rready(rready)
                                                                  );

  initial begin
    #8000;
    $finish;
  end

    endmodule : Axi4LiteSlaveReadCoverPropertyTB

`endif


