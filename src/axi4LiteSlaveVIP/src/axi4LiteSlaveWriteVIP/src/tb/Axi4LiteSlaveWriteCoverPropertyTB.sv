`ifndef AXI4LITESLAVEWRITECOVERPROPERTYTB_INCLUDED_
`define AXI4LITESLAVEWRITECOVERPROPERTYTB_INCLUDED_

`include "uvm_macros.svh"
import uvm_pkg::*;
import Axi4LiteWriteSlaveGlobalPkg::*;

module Axi4LiteSlaveWriteCoverPropertyTB;
  bit aclk;
  bit aresetn;
  //Write Address Channels Signals
  logic awvalid;
  logic [ADDRESS_WIDTH-1:0] awaddr;
  logic awready;
  logic [2:0] awprot;
  //Write Data Channel Signals
  logic wvalid;
  logic [(DATA_WIDTH/8)-1:0] wstrb;
  logic [DATA_WIDTH-1:0] wdata;
  logic wready;
  //Write Response Channel
  logic bvalid;
  logic bready;
  logic [1:0] bresp;
  
  string name = "AXI4LITE_COVERPROPERTY_TB";

  initial begin
    `uvm_info(name,$sformatf("TEST_BENCH_FOR_AXI4LITE_COVERPROPERTY"),UVM_LOW);
  end
  always #10 aclk = ~aclk;

  Axi4LiteSlaveWriteCoverProperty Axi4LiteSlaveWriteCoverPropertys(.aclk(aclk),
                                                                     .aresetn(aresetn),
                                                                     .awvalid(awvalid),
                                                                     .awready(awready),
                                                                     .awaddr(awaddr),
                                                                     .awprot(awprot),
                                                                     .wvalid(wvalid),
                                                                     .wdata(wdata),
                                                                     .wstrb(wstrb),
                                                                     .wready(wready),
                                                                     .bvalid(bvalid),
                                                                     .bready(bready),
                                                                     .bresp(bresp)
                                                                    );

  initial begin
    #14000;
    $finish;
  end


endmodule : Axi4LiteSlaveWriteCoverPropertyTB

`endif


