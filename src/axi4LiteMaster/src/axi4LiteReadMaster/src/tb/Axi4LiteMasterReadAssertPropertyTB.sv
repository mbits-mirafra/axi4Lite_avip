`ifndef AXI4LITEMASTERWRITEASSERTPROPERTYTB_INCLUDED_
`define AXI4LITEMASTERWRITEASSERTPROPERTYTB_INCLUDED_

`include "uvm_macros.svh"
import uvm_pkg::*;
import Axi4LiteReadMasterGlobalPkg::*;

module Axi4LiteMasterReadAssertPropertyTB;
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
  
  string name = "AXI4LITE_ASSERTPROPERTY_TB";

  initial begin
    `uvm_info(name,$sformatf("TEST_BENCH_FOR_AXI4LITE_ASSERTPROPERTY"),UVM_LOW);
  end
  always #10 aclk = ~aclk;

  Axi4LiteMasterReadAssertions axi4LiteMasterReadAssertions(.aclk(aclk),
                                                              .aresetn(aresetn),
                                                              .arvalid(arvalid),
                                                              .arready(arready),
                                                              .araddr(araddr),
                                                              .rvalid(rvalid),
                                                              .rdata(rdata),
                                                              .rready(rready)
                                                            );

  initial begin
    #1000;
    $finish;
  end

  initial begin
    When_arvalidIsAsserted_Then_sameClkaraddrIsNotUnknown();
    When_rvalidIsAsserted_Then_sameClkrdataIsNotUnknown();
  end

  task When_arvalidIsAsserted_Then_sameClkaraddrIsNotUnknown();
    `uvm_info(name,$sformatf("When_arvalidIsAsserted_Then_sameClk_araddrIsNotUnknown Task started"),UVM_NONE);
      arvalid <= 1'b0;
      araddr <= 32'bx;
      repeat(2) begin
      @(posedge aclk);
      end
      arvalid <= 1'b1;
      araddr <= 32'h1122_3344;

      repeat(2) begin
       @(posedge aclk);
        arvalid <= 1'b0;
      end
    `uvm_info(name,$sformatf("When_arvalidIsAsserted_Then_sameClk_araddrIsNotUnknown Task Ended"),UVM_NONE);
  endtask

  task When_rvalidIsAsserted_Then_sameClkrdataIsNotUnknown();
    `uvm_info(name,$sformatf("When_rvalidIsAsserted_Then_sameClk_rdataIsNotUnknown Task started"),UVM_NONE);
      rvalid <= 1'b0;
      rdata <= 32'bx;
      repeat(2) begin
      @(posedge aclk);
      end
      rvalid <= 1'b1;
      rdata <= 32'h1111_3333;

      repeat(2) begin
       @(posedge aclk);
        rvalid <= 1'b0;
      end
    `uvm_info(name,$sformatf("When_rvalidIsAsserted_Then_sameClk_rdataIsNotUnknown Task Ended"),UVM_NONE);
  endtask
endmodule : Axi4LiteMasterReadAssertPropertyTB

`endif


