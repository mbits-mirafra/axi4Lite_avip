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
    When_awvalidIsAsserted_Then_sameClkAwaddrIsNotUnknown_Expect_AssertionPass();
    When_wvalidIsAsserted_Then_sameClkWdataIsNotUnknown_Expect_AssertionPass();
    When_awvalidAsserted_Then_awvalidHighAndWithin16ClkAwreadyAsserted_Expect_AssertionPass();
    When_wvalidAsserted_Then_wvalidHighAndWithin16ClkWreadyAsserted_Expect_AssertionPass();
    When_bvalidAsserted_Then_bvalidHighAndWithin16ClkBreadyAsserted_Expect_AssertionPass();
    When_awvalidAsserted_Then_awvalidHighAndAfter16ClkAwreadyAsserted_Expect_AssertionFail();
    When_wvalidAsserted_Then_wvalidHighAndAfter16ClkWreadyAsserted_Expect_AssertionFail();
    When_bvalidAsserted_Then_bvalidHighAndAfter16ClkBreadyAsserted_Expect_AssertionFail();
    When_awvalidAsserted_Then_sameClkAwreadyAsserted_Expect_AssertionPass();
    When_wvalidAsserted_Then_sameClkWreadyAsserted_Expect_AssertionPass();
    When_bvalidAsserted_Then_sameClkBreadyAsserted_Expect_AssertionPass();
  end

  task When_awvalidIsAsserted_Then_sameClkAwaddrIsNotUnknown_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_sameClkAwaddrIsNotUnknown_Expect_AssertionPass Task started"),UVM_NONE);
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
    `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_sameClkAwaddrIsNotUnknown_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_wvalidIsAsserted_Then_sameClkWdataIsNotUnknown_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_sameClkWdataIsNotUnknown_Expect_AssertionPass Task started"),UVM_NONE);
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
    `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_sameClkWdataIsNotUnknown_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_awvalidAsserted_Then_awvalidHighAndWithin16ClkAwreadyAsserted_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_awvalidAsserted_Then_awvalidHighAndWithin16ClkAwreadyAsserted_Expect_AssertionPass Task started"),UVM_NONE);
      awvalid <= 1'b0;
      awready <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      awvalid <= 1'b1;

      repeat(8) begin
       @(posedge aclk);
       awready <= 1'b1;
      end
      @(posedge aclk);
      awvalid <= 1'b0;
      awready <= 1'b0;
    `uvm_info(name,$sformatf("When_awvalidAsserted_Then_awvalidHighAndWithin16ClkAwreadyAsserted_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_wvalidAsserted_Then_wvalidHighAndWithin16ClkWreadyAsserted_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_wvalidAsserted_Then_wvalidHighAndWithin16ClkWreadyAsserted_Expect_AssertionPass Task started"),UVM_NONE);
      wvalid <= 1'b0;
      wready <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      wvalid <= 1'b1;

      repeat(8) begin
       @(posedge aclk);
       wready <= 1'b1;
      end
      @(posedge aclk);
      wvalid <= 1'b0;
      wready <= 1'b0;
    `uvm_info(name,$sformatf("When_wvalidAsserted_Then_wvalidHighAndWithin16ClkWreadyAsserted_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_bvalidAsserted_Then_bvalidHighAndWithin16ClkBreadyAsserted_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_bvalidAsserted_Then_bvalidHighAndWithin16ClkBreadyAsserted_Expect_AssertionPass Task started"),UVM_NONE);
      bvalid <= 1'b0;
      bready <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      bvalid <= 1'b1;

      repeat(8) begin
       @(posedge aclk);
       bready <= 1'b1;
      end
      @(posedge aclk);
      bvalid <= 1'b0;
      bready <= 1'b0;
    `uvm_info(name,$sformatf("When_bvalidAsserted_Then_bvalidHighAndWithin16ClkBreadyAsserted_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_awvalidAsserted_Then_awvalidHighAndAfter16ClkAwreadyAsserted_Expect_AssertionFail();
    `uvm_info(name,$sformatf("When_awvalidAsserted_Then_awvalidHighAndAfter16ClkAwreadyAsserted_Expect_AssertionFail Task started"),UVM_NONE);
      awvalid <= 1'b0;
      awready <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      awvalid <= 1'b1;

      repeat(18) begin
       @(posedge aclk);
       awready <= 1'b1;
      end
      @(posedge aclk);
      awvalid <= 1'b0;
      awready <= 1'b0;
    `uvm_info(name,$sformatf("When_awvalidAsserted_Then_awvalidHighAndAfter16ClkAwreadyAsserted_Expect_AssertionFail Task Ended"),UVM_NONE);
  endtask

  task When_wvalidAsserted_Then_wvalidHighAndAfter16ClkWreadyAsserted_Expect_AssertionFail();
    `uvm_info(name,$sformatf("When_wvalidAsserted_Then_wvalidHighAndAfter16ClkWreadyAsserted_Expect_AssertionFail Task started"),UVM_NONE);
      wvalid <= 1'b0;
      wready <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      wvalid <= 1'b1;

      repeat(18) begin
       @(posedge aclk);
       wready <= 1'b1;
      end
      @(posedge aclk);
      wvalid <= 1'b0;
      wready <= 1'b0;
    `uvm_info(name,$sformatf("When_wvalidAsserted_Then_wvalidHighAndAfter16ClkWreadyAsserted_Expect_AssertionFail Task Ended"),UVM_NONE);
  endtask

  task When_bvalidAsserted_Then_bvalidHighAndAfter16ClkBreadyAsserted_Expect_AssertionFail();
    `uvm_info(name,$sformatf("When_bvalidAsserted_Then_bvalidHighAndAfter16ClkBreadyAsserted_Expect_AssertionFail Task started"),UVM_NONE);
      bvalid <= 1'b0;
      bready <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      bvalid <= 1'b1;

      repeat(18) begin
       @(posedge aclk);
       bready <= 1'b1;
      end
      @(posedge aclk);
      bvalid <= 1'b0;
      bready <= 1'b0;
    `uvm_info(name,$sformatf("When_bvalidAsserted_Then_bvalidHighAndAfter16ClkBreadyAsserted_Expect_AssertionFail Task Ended"),UVM_NONE);
  endtask

  task When_awvalidAsserted_Then_sameClkAwreadyAsserted_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_awvalidAsserted_Then_sameClkAwreadyAsserted_Expect_AssertionPass Task started"),UVM_NONE);
      awvalid <= 1'b0;
      awready <= 1'b0;
      repeat(3) begin
      @(posedge aclk);
      end
      awvalid <= 1'b1;
      awready <= 1'b1;
      @(posedge aclk);
      awvalid <= 1'b0;
      awready <= 1'b0;

    `uvm_info(name,$sformatf("When_awvalidAsserted_Then_sameClkAwreadyAsserted_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_wvalidAsserted_Then_sameClkWreadyAsserted_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_wvalidAsserted_Then_sameClkWreadyAsserted_Expect_AssertionPass Task started"),UVM_NONE);
      wvalid <= 1'b0;
      wready <= 1'b0;
      repeat(3) begin
      @(posedge aclk);
      end
      wvalid <= 1'b1;
      wready <= 1'b1;
      @(posedge aclk);
      wvalid <= 1'b0;
      wready <= 1'b0;

    `uvm_info(name,$sformatf("When_wvalidAsserted_Then_sameClkWreadyAsserted_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_bvalidAsserted_Then_sameClkBreadyAsserted_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_bvalidAsserted_Then_sameClkBreadyAsserted_Expect_AssertionPass Task started"),UVM_NONE);
      bvalid <= 1'b0;
      bready <= 1'b0;
      repeat(3) begin
      @(posedge aclk);
      end
      bvalid <= 1'b1;
      bready <= 1'b1;
      @(posedge aclk);
      bvalid <= 1'b0;
      bready <= 1'b0;

    `uvm_info(name,$sformatf("When_bvalidAsserted_Then_sameClkBreadyAsserted_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask
  
endmodule : Axi4LiteMasterWriteAssertPropertyTB

`endif


