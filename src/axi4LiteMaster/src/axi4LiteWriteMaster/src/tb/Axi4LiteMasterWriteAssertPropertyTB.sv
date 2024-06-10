`ifndef AXI4LITEMASTERWRITEASSERTPROPERTYTB_INCLUDED_
`define AXI4LITEMASTERWRITEASSERTPROPERTYTB_INCLUDED_

`include "uvm_macros.svh"
import uvm_pkg::*;
import Axi4LiteWriteMasterGlobalPkg::*;

module Axi4LiteMasterWriteAssertPropertyTB;
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

  
  string name = "AXI4LITE_ASSERTPROPERTY_TB";

  initial begin
    `uvm_info(name,$sformatf("TEST_BENCH_FOR_AXI4LITE_ASSERTPROPERTY"),UVM_LOW);
  end
  always #10 aclk = ~aclk;

  Axi4LiteMasterWriteAssertions axi4LiteMasterWriteAssertions(.aclk(aclk),
                                                              .aresetn(aresetn),
                                                              .awvalid(awvalid),
                                                              .awready(awready),
                                                              .awaddr(awaddr),
                                                              .wvalid(wvalid),
                                                              .wdata(wdata),
                                                              .wready(wready),
                                                              .bvalid(bvalid),
                                                              .bready(bready)
                                                             );

  initial begin
    #1000;
    $finish;
  end

  initial begin
    When_awvalidIsAsserted_Then_sameClkAwaddrIsNotUnknown();
    When_wvalidIsAsserted_Then_sameClkWdataIsNotUnknown();
  end

  task When_awvalidIsAsserted_Then_sameClkAwaddrIsNotUnknown();
    `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_sameClkAwaddrIsNotUnknown Task started"),UVM_NONE);
      awvalid <= 1'b0;
      awaddr <= 32'bx;
      repeat(2) begin
      @(posedge aclk);
      end
      awvalid <= 1'b1;
      awaddr <= 32'h1122_3344;

      repeat(2) begin
       @(posedge aclk);
        awvalid <= 1'b0;
      end
    `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_sameClkAwaddrIsNotUnknown Task Ended"),UVM_NONE);
  endtask

  task When_wvalidIsAsserted_Then_sameClkWdataIsNotUnknown();
    `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_sameClkWdataIsNotUnknown Task started"),UVM_NONE);
      wvalid <= 1'b0;
      wdata <= 32'bx;
      repeat(2) begin
      @(posedge aclk);
      end
      wvalid <= 1'b1;
      wdata <= 32'h1111_3333;

      repeat(2) begin
       @(posedge aclk);
        wvalid <= 1'b0;
      end
    `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_sameClkWdataIsNotUnknown Task Ended"),UVM_NONE);
  endtask
endmodule : Axi4LiteMasterWriteAssertPropertyTB

`endif


