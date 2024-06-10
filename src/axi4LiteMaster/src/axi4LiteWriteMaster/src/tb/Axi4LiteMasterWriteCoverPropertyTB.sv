`ifndef AXI4LITEASSERTIONTB_INCLUDED_
`define AXI4LITEASSERTIONTB_INCLUDED_

`include "uvm_macros.svh"
import uvm_pkg::*;
import Axi4LiteWriteMasterGlobalPkg::*;

module Axi4LiteMasterWriteCoverPropertyTB;
  bit aclk;
  bit aresetn;
  //Write Address Channels Signals
  logic awvalid;
  logic [ADDRESS_WIDTH-1:0] awaddr;
  logic awready;
  //Write Data Channel Signals
  logic wvalid;
  logic [DATA_WIDTH-1:0] wdata;
  logic wready;
  //Write Response Channel
  logic bvalid;
  logic bready;

  
  string name = "AXI4LITE_COVERPROPERTY_TB";

  initial begin
    `uvm_info(name,$sformatf("TEST_BENCH_FOR_AXI4LITE_COVERPROPERTY"),UVM_LOW);
  end
  always #10 aclk = ~aclk;

  Axi4LiteMasterWriteCoverProperty Axi4LiteMasterWriteCoverPropertys(.aclk(aclk),
                                                                    .aresetn(aresetn),
                                                                    .awvalid(awvalid),
                                                                    .awready(awready),
                                                                    .awaddr(awaddr),
                                                                    .wvalid(wvalid),
                                                                    .wdata(wdata),
                                                                    .wwready(wready),
                                                                    .bvalid(bvalid),
                                                                    .bready(bready));

  initial begin
    #3000;
    $finish;
  end

  initial begin
    When_AWVALIDIsAsserted_Then_AWADDRESIsNotUnknown();
  end

  task When_AWVALIDIsAsserted_Then_AWADDRESIsNotUnknown();
    `uvm_info(name,$sformatf("When_AWVALIDIsAsserted_ThenAWADDR_IS_NOT_UNKNOWN Task started"),UVM_NONE);
      awvalid <= 1'b0;
      awaddr <= 32'bx;
      repeat(2) begin
      @(posedge aclk);
      end
      awvalid <= 1'b1; 
    `uvm_info(name,$sformatf("When_AWVALIDIsAsserted_ThenAWADDR_IS_NOT_UNKNOWN Task Ended"),UVM_NONE);
  endtask
  endmodule : Axi4LiteMasterWriteCoverPropertyTB

`endif


