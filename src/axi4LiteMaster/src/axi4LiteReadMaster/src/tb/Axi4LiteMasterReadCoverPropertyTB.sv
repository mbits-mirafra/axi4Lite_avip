`ifndef AXI4LITEMASTERREADCOVERPROPERTYTB_INCLUDED_
`define AXI4LITEMASTERREADCOVERPROPERTYTB_INCLUDED_

`include "uvm_macros.svh"
import uvm_pkg::*;
import Axi4LiteReadMasterGlobalPkg::*;

module Axi4LiteMasterReadCoverPropertyTB;
  bit aclk;
  bit aresetn;
  //Read Address Channels Signals
  logic arvalid;
  logic [ADDRESS_WIDTH-1:0] araddr;
  logic arready;
  //Read Data Channel Signals
  logic rvalid;
  logic [DATA_WIDTH-1:0] rdata;
  logic rready;
  
  string name = "AXI4LITE_COVERPROPERTY_TB";

  initial begin
    `uvm_info(name,$sformatf("TEST_BENCH_FOR_AXI4LITE_COVERPROPERTY"),UVM_LOW);
  end
  always #10 aclk = ~aclk;

  Axi4LiteMasterReadCoverProperty Axi4LiteMasterReadCoverPropertys(.aclk(aclk),
                                                                    .aresetn(aresetn),
                                                                    .arvalid(arvalid),
                                                                    .arready(arready),
                                                                    .araddr(araddr),
                                                                    .rvalid(rvalid),
                                                                    .rdata(rdata),
                                                                    .rready(rready)
                                                                  );

  initial begin
    #3000;
    $finish;
  end

  initial begin
    When_arvalidIsAsserted_Then_araddrESIsNotUnknown();
    When_rvalidIsAsserted_Then_rdataIsNotUnknown();
    When_arvalidIsAsserted_Then_araddrIsNotUnknownAndPrevious2ClkAraddrIsUnknown();
    When_rvalidIsAsserted_Then_rdataIsNotUnknownAndPrevious2ClkRdataIsUnknown();
  end

  task When_arvalidIsAsserted_Then_araddrESIsNotUnknown();
    `uvm_info(name,$sformatf("When_arvalidIsAsserted_Then_araddr_IS_NOT_UNKNOWN Task started"),UVM_NONE);
      arvalid <= 1'b0;
      araddr <= 32'bx;
      repeat(2) begin
      @(posedge aclk);
      end
      arvalid <= 1'b1;
      araddr <= 32'h1122_3344;
    `uvm_info(name,$sformatf("When_arvalidIsAsserted_Then_araddr_IS_NOT_UNKNOWN Task Ended"),UVM_NONE);
  endtask

  task When_rvalidIsAsserted_Then_rdataIsNotUnknown();
    `uvm_info(name,$sformatf("When_rvalidIsAsserted_Then_rdataIsNotUnknown Task started"),UVM_NONE);
      rvalid <= 1'b0;
      rdata <= 32'bx;
      repeat(2) begin
      @(posedge aclk);
      end
      rvalid <= 1'b1;
      rdata <= 32'h2222_3333;
    `uvm_info(name,$sformatf("When_rvalidIsAsserted_Then_rdataIsNotUnknown Task Ended"),UVM_NONE);
  endtask

  task When_arvalidIsAsserted_Then_araddrIsNotUnknownAndPrevious2ClkAraddrIsUnknown();
    `uvm_info(name,$sformatf("When_arvalidIsAsserted_Then_araddrIsNotUnknownAndPrevious2ClkAraddrIsUnknown Task started"),UVM_NONE);
      arvalid <= 1'b0;
      araddr <= 32'bx;
      repeat(3) begin
      @(posedge aclk);
      end
      arvalid <= 1'b1;
      araddr <= 32'h1122_3344;
    `uvm_info(name,$sformatf("When_arvalidIsAsserted_Then_araddrIsNotUnknownAndPrevious2ClkAraddrIsUnknown Task Ended"),UVM_NONE);
  endtask

  task When_rvalidIsAsserted_Then_rdataIsNotUnknownAndPrevious2ClkRdataIsUnknown();
    `uvm_info(name,$sformatf("When_rvalidIsAsserted_Then_rdataIsNotUnknownAndPrevious2ClkRdataIsUnknown Task started"),UVM_NONE);
      rvalid <= 1'b0;
      rdata <= 32'bx;
      repeat(3) begin
      @(posedge aclk);
      end
      rvalid <= 1'b1;
      rdata <= 32'h2222_3333;
    `uvm_info(name,$sformatf("When_rvalidIsAsserted_Then_rdataIsNotUnknownAndPrevious2ClkRdataIsUnknown Task Ended"),UVM_NONE);
  endtask


  endmodule : Axi4LiteMasterReadCoverPropertyTB

`endif


