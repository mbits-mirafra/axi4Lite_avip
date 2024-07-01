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

  Axi4LiteMasterWriteAssertions axi4LiteMasterWriteAssertions(.aclk(aclk),
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
    #16000;
    $finish;
  end

  initial begin
  /*  When_awvalidIsAsserted_Then_sameClkAwaddrAndAwprotIsNotUnknown_Expect_AssertionPass();
    When_wvalidIsAsserted_Then_sameClkWdataAndWstrbIsNotUnknown_Expect_AssertionPass();
    When_bvalidIsAsserted_Then_sameClkBrespIsNotUnknown_Expect_AssertionPass();

    When_awvalidIsAsserted_Then_sameClkAwaddrAndAwprotIsUnknown_Expect_AssertionFail();
    When_wvalidIsAsserted_Then_sameClkWdataAndWstrbIsUnknown_Expect_AssertionFail();
    When_bvalidIsAsserted_Then_sameClkBrespIsUnknown_Expect_AssertionFail();
*/
    When_awvalidAsserted_Then_awvalidHighAndWithin16ClkAwreadyAsserted_Expect_AssertionPass();
    When_wvalidAsserted_Then_wvalidHighAndWithin16ClkWreadyAsserted_Expect_AssertionPass();
    When_bvalidAsserted_Then_bvalidHighAndWithin16ClkBreadyAsserted_Expect_AssertionPass();
  /*  When_awvalidAsserted_Then_awvalidHighAndAfter16ClkAwreadyAsserted_Expect_AssertionFail();
    When_wvalidAsserted_Then_wvalidHighAndAfter16ClkWreadyAsserted_Expect_AssertionFail();
    When_bvalidAsserted_Then_bvalidHighAndAfter16ClkBreadyAsserted_Expect_AssertionFail();
    When_awvalidAsserted_Then_sameClkAwreadyAsserted_Expect_AssertionPass();
    When_wvalidAsserted_Then_sameClkWreadyAsserted_Expect_AssertionPass();
    When_bvalidAsserted_Then_sameClkBreadyAsserted_Expect_AssertionPass();

  //  When_aresetnAsserted_Then_awreadyWillGoDefaultState1_Expect_AssertionPass();
  //  When_aresetnAsserted_Then_wreadyWillGoDefaultState1_Expect_AssertionPass();
  //  When_aresetnAsserted_Then_breadyWillGoDefaultState1_Expect_AssertionPass();
  //  When_aresetnAsserted_Then_awreadyWillGoDefaultState0_Expect_AssertionPass();
  //  When_aresetnAsserted_Then_wreadyWillGoDefaultState0_Expect_AssertionPass();
  //  When_aresetnAsserted_Then_breadyWillGoDefaultState0_Expect_AssertionPass();
  //  When_aresetnAsserted_Then_awreadyWillNotGoDefaultState1_Expect_AssertionFail();
  //  When_aresetnAsserted_Then_wreadyWillNotGoDefaultState1_Expect_AssertionFail();
  //  When_aresetnAsserted_Then_breadyWillNotGoDefaultState1_Expect_AssertionFail();
  //  When_aresetnAsserted_Then_awreadyWillNotGoDefaultState0_Expect_AssertionFail();
  //  When_aresetnAsserted_Then_wreadyWillNotGoDefaultState0_Expect_AssertionFail();
  //  When_aresetnAsserted_Then_breadyWillNotGoDefaultState0_Expect_AssertionFail();

    When_transferOccur_Then_nextClkAwreadyWillGoDefaultStateHigh_Expect_AssertionPass();
    When_transferOccur_Then_nextClkWreadyWillGoDefaultStateHigh_Expect_AssertionPass();
    When_transferOccur_Then_nextClkBreadyWillGoDefaultStateHigh_Expect_AssertionPass();
  //  When_transferOccur_Then_nextClkAwreadyWillGoDefaultStateLow_Expect_AssertionPass();
  //  When_transferOccur_Then_nextClkWreadyWillGoDefaultStateLow_Expect_AssertionPass();
  //  When_transferOccur_Then_nextClkBreadyWillGoDefaultStateLow_Expect_AssertionPass();
    When_transferOccur_Then_nextClkAwreadyWillNotGoDefaultStateHigh_Expect_AssertionFail();
    When_transferOccur_Then_nextClkWreadyWillNotGoDefaultStateHigh_Expect_AssertionFail();
    When_transferOccur_Then_nextClkBreadyWillNotGoDefaultStateHigh_Expect_AssertionFail();
  //  When_transferOccur_Then_nextClkAwreadyWillNotGoDefaultStateLow_Expect_AssertionFail();
  //  When_transferOccur_Then_nextClkWreadyWillNotGoDefaultStateLow_Expect_AssertionFail();
  //  When_transferOccur_Then_nextClkBreadyWillNotGoDefaultStateLow_Expect_AssertionFail();
  

    When_awvalidIsHigh_Then_awvalidAndAwaddrAndAwprotStableUntilAwreadyAsserted_Expect_AssertionPass();
    When_wvalidIsHigh_Then_wvalidAndWdataAndWstrbStableUntilWreadyAsserted_Expect_AssertionPass();
    When_bvalidIsHigh_Then_bvalidAndBrespStableUntilBreadyAsserted_Expect_AssertionPass();
    When_awvalidIsHigh_Then_awaddrAndAwprotStable2ClkThenNextClkAwreadyAsserted_Expect_AssertionFail();
    When_wvalidIsHigh_Then_wdataAndWstrbStable2ClkThenNextClkWreadyAsserted_Expect_AssertionFail();
    When_bvalidIsHigh_Then_brespStable2ClkThenNextClkBreadyAsserted_Expect_AssertionFail();

    When_awvalidAndAwreadyAsserted_Then_awaddrAndAwprotNotUnknownAndTransferOccur_Expect_AssertionPass();
    When_wvalidAndWreadyAsserted_Then_wdataAndWstrbNotUnknownAndTransferOccur_Expect_AssertionPass();
    When_bvalidAndBreadyAsserted_Then_brespNotUnknownAndTransferOccur_Expect_AssertionPass();
    When_awvalidAndAwreadyAsserted_Then_awaddrAndAwprotUnknown_Expect_AssertionFail();
    When_wvalidAndWreadyAsserted_Then_wdataAndWstrbUnknown_Expect_AssertionFail();
    When_bvalidAndBreadyAsserted_Then_brespUnknown_Expect_AssertionFail();

    When_awvalidAwreadyHighAndWithin10ClkWvalidHighAndWreadyAsserted_Then_wthin12ClkBValidAsserted_Expect_AssertionPass();
    When_awvalidAwreadyHighSameClkBvalidHighAndWithin10ClkWvalidHighAndWreadyAsserted_Expect_AssertionFail();
    When_wvalidWreadyAsserted_Then_within12ClkKBValidAsserted_Expect_AssertionPass();
    When_wvalidWreadyAsserted_Then_after12ClkBValidAsserted_Expect_AssertionFail();

    When_awvalidIsAsserted_Then_within10ClkWValidIsAsserted_Expect_AssertionPass();
    When_awvalidIsAsserted_Then_after10ClkWValidIsAsserted_Expect_AssertionFail();
  
    When_bvalidAndBreadyAsserted_Then_ResponseIsNotExokay_Expect_AssertionPass();
    When_bvalidAndBreadyAsserted_Then_ResponseIsExokay_Expect_AssertionFail();
*/
  end

  task When_awvalidIsAsserted_Then_sameClkAwaddrAndAwprotIsNotUnknown_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_sameClkAwaddrAndAwprotIsNotUnknown_Expect_AssertionPass Task started"),UVM_NONE);
      aresetn <= 1'b1;
      awvalid <= 1'b0;
      awaddr <= 32'bx;
      awprot <= 3'bxxx;
      repeat(2) begin
      @(posedge aclk);
      end
      awvalid <= 1'b1;
      awaddr <= 32'h1122_3344;
      awprot <= 3'b000;

      repeat(2) begin
       @(posedge aclk);
      end
      awvalid <= 1'b0;
    `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_sameClkAwaddrAndAwprotIsNotUnknown_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_wvalidIsAsserted_Then_sameClkWdataAndWstrbIsNotUnknown_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_sameClkWdataAndWstrbIsNotUnknown_Expect_AssertionPass Task started"),UVM_NONE);
      aresetn <= 1'b1;
      wvalid <= 1'b0;
      wdata <= 32'bx;
      wstrb <= 4'hx;
      repeat(2) begin
      @(posedge aclk);
      end
      wvalid <= 1'b1;
      wdata <= 32'h1111_3333;
      wstrb <= 4'hf;

      repeat(2) begin
       @(posedge aclk);
      end
      wvalid <= 1'b0;
    `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_sameClkWdataAndWstrbIsNotUnknown_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_bvalidIsAsserted_Then_sameClkBrespIsNotUnknown_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_bvalidIsAsserted_Then_sameClkBrespIsNotUnknown_Expect_AssertionPass Task started"),UVM_NONE);
      aresetn <= 1'b1;
      bvalid <= 1'b0;
      bresp <= 2'bxx;
      repeat(2) begin
      @(posedge aclk);
      end
      bvalid <= 1'b1;
      bresp <= 2'b00;

      repeat(2) begin
       @(posedge aclk);
      end
      bvalid <= 1'b0;
    `uvm_info(name,$sformatf("When_bvalidIsAsserted_Then_sameClkBrespIsNotUnknown_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_awvalidIsAsserted_Then_sameClkAwaddrAndAwprotIsUnknown_Expect_AssertionFail();
    `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_sameClkAwaddrAndAwprotIsUnknown_Expect_AssertionFail Task started"),UVM_NONE);
      aresetn <= 1'b1;
      awvalid <= 1'b0;
      awaddr <= 32'bx;
      awprot <= 3'bxxx;
      repeat(2) begin
      @(posedge aclk);
      end
      awvalid <= 1'b1;

      repeat(2) begin
       @(posedge aclk);
      end
      awvalid <= 1'b0;
    `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_sameClkAwaddrAndAwprotIsUnknown_Expect_AssertionFail Task Ended"),UVM_NONE);
  endtask

  task When_wvalidIsAsserted_Then_sameClkWdataAndWstrbIsUnknown_Expect_AssertionFail();
    `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_sameClkWdataAndWstrbIsUnknown_Expect_AssertionFail Task started"),UVM_NONE);
      aresetn <= 1'b1;
      wvalid <= 1'b0;
      wdata <= 32'bx;
      wstrb <= 4'hx;
      repeat(2) begin
      @(posedge aclk);
      end
      wvalid <= 1'b1;

      repeat(2) begin
       @(posedge aclk);
      end
      wvalid <= 1'b0;
    `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_sameClkWdataAndWstrbIsUnknown_Expect_AssertionFail Task Ended"),UVM_NONE);
  endtask

  task When_bvalidIsAsserted_Then_sameClkBrespIsUnknown_Expect_AssertionFail();
    `uvm_info(name,$sformatf("When_bvalidIsAsserted_Then_sameClkBrespIsUnknown_Expect_AssertionFail Task started"),UVM_NONE);
      aresetn <= 1'b1;
      bvalid <= 1'b0;
      bresp <= 2'bxx;
      repeat(2) begin
      @(posedge aclk);
      end
      bvalid <= 1'b1;

      repeat(2) begin
       @(posedge aclk);
      end
      bvalid <= 1'b0;
    `uvm_info(name,$sformatf("When_bvalidIsAsserted_Then_sameClkBrespIsUnknown_Expect_AssertionFail Task Ended"),UVM_NONE);
  endtask

  task When_awvalidAsserted_Then_awvalidHighAndWithin16ClkAwreadyAsserted_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_awvalidAsserted_Then_awvalidHighAndWithin16ClkAwreadyAsserted_Expect_AssertionPass Task started"),UVM_NONE);
      aresetn <= 1'b1;
      awvalid <= 1'b0;
      awready <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      awvalid <= 1'b1;
      awaddr <= 32'h1122_3344;

      repeat(8) begin
       @(posedge aclk);
      end
      awready <= 1'b1;
      @(posedge aclk);
      awvalid <= 1'b0;
      awready <= 1'b0;
    `uvm_info(name,$sformatf("When_awvalidAsserted_Then_awvalidHighAndWithin16ClkAwreadyAsserted_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_wvalidAsserted_Then_wvalidHighAndWithin16ClkWreadyAsserted_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_wvalidAsserted_Then_wvalidHighAndWithin16ClkWreadyAsserted_Expect_AssertionPass Task started"),UVM_NONE);
      aresetn <= 1'b1;
      wvalid <= 1'b0;
      wready <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      wvalid <= 1'b1;
      wdata <= 32'h1111_3333;

      repeat(8) begin
       @(posedge aclk);
      end
      wready <= 1'b1;
      @(posedge aclk);
      wvalid <= 1'b0;
      wready <= 1'b0;
    `uvm_info(name,$sformatf("When_wvalidAsserted_Then_wvalidHighAndWithin16ClkWreadyAsserted_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_bvalidAsserted_Then_bvalidHighAndWithin16ClkBreadyAsserted_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_bvalidAsserted_Then_bvalidHighAndWithin16ClkBreadyAsserted_Expect_AssertionPass Task started"),UVM_NONE);
      aresetn <= 1'b1;
      bvalid <= 1'b0;
      bready <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      bvalid <= 1'b1;

      repeat(8) begin
       @(posedge aclk);
      end
      bready <= 1'b1;
      @(posedge aclk);
      bvalid <= 1'b0;
      bready <= 1'b0;
    `uvm_info(name,$sformatf("When_bvalidAsserted_Then_bvalidHighAndWithin16ClkBreadyAsserted_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_awvalidAsserted_Then_awvalidHighAndAfter16ClkAwreadyAsserted_Expect_AssertionFail();
    `uvm_info(name,$sformatf("When_awvalidAsserted_Then_awvalidHighAndAfter16ClkAwreadyAsserted_Expect_AssertionFail Task started"),UVM_NONE);
      aresetn <= 1'b1;
      awvalid <= 1'b0;
      awready <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      awvalid <= 1'b1;
      awaddr <= 32'h1122_3344;

      repeat(18) begin
       @(posedge aclk);
      end
      awready <= 1'b1;
      @(posedge aclk);
      awvalid <= 1'b0;
      awready <= 1'b0;
    `uvm_info(name,$sformatf("When_awvalidAsserted_Then_awvalidHighAndAfter16ClkAwreadyAsserted_Expect_AssertionFail Task Ended"),UVM_NONE);
  endtask

  task When_wvalidAsserted_Then_wvalidHighAndAfter16ClkWreadyAsserted_Expect_AssertionFail();
    `uvm_info(name,$sformatf("When_wvalidAsserted_Then_wvalidHighAndAfter16ClkWreadyAsserted_Expect_AssertionFail Task started"),UVM_NONE);
      aresetn <= 1'b1;
      wvalid <= 1'b0;
      wready <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      wvalid <= 1'b1;
      wdata <= 32'h1111_3333;

      repeat(18) begin
       @(posedge aclk);
      end
      wready <= 1'b1;
      @(posedge aclk);
      wvalid <= 1'b0;
      wready <= 1'b0;
    `uvm_info(name,$sformatf("When_wvalidAsserted_Then_wvalidHighAndAfter16ClkWreadyAsserted_Expect_AssertionFail Task Ended"),UVM_NONE);
  endtask

  task When_bvalidAsserted_Then_bvalidHighAndAfter16ClkBreadyAsserted_Expect_AssertionFail();
    `uvm_info(name,$sformatf("When_bvalidAsserted_Then_bvalidHighAndAfter16ClkBreadyAsserted_Expect_AssertionFail Task started"),UVM_NONE);
      aresetn <= 1'b1;
      bvalid <= 1'b0;
      bready <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      bvalid <= 1'b1;

      repeat(18) begin
       @(posedge aclk);
      end
      bready <= 1'b1;
      @(posedge aclk);
      bvalid <= 1'b0;
      bready <= 1'b0;
    `uvm_info(name,$sformatf("When_bvalidAsserted_Then_bvalidHighAndAfter16ClkBreadyAsserted_Expect_AssertionFail Task Ended"),UVM_NONE);
  endtask

  task When_awvalidAsserted_Then_sameClkAwreadyAsserted_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_awvalidAsserted_Then_sameClkAwreadyAsserted_Expect_AssertionPass Task started"),UVM_NONE);
      aresetn <= 1'b1;
      awvalid <= 1'b0;
      awready <= 1'b0;
      repeat(3) begin
      @(posedge aclk);
      end
      awvalid <= 1'b1;
      awaddr <= 32'h1122_3344;
      awready <= 1'b1;
      @(posedge aclk);
      awvalid <= 1'b0;
      awready <= 1'b0;

    `uvm_info(name,$sformatf("When_awvalidAsserted_Then_sameClkAwreadyAsserted_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_wvalidAsserted_Then_sameClkWreadyAsserted_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_wvalidAsserted_Then_sameClkWreadyAsserted_Expect_AssertionPass Task started"),UVM_NONE);
      aresetn <= 1'b1;
      wvalid <= 1'b0;
      wready <= 1'b0;
      repeat(3) begin
      @(posedge aclk);
      end
      wvalid <= 1'b1;
      wdata <= 32'h1111_3333;
      wready <= 1'b1;
      @(posedge aclk);
      wvalid <= 1'b0;
      wready <= 1'b0;

    `uvm_info(name,$sformatf("When_wvalidAsserted_Then_sameClkWreadyAsserted_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_bvalidAsserted_Then_sameClkBreadyAsserted_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_bvalidAsserted_Then_sameClkBreadyAsserted_Expect_AssertionPass Task started"),UVM_NONE);
      aresetn <= 1'b1;
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
  
  task When_aresetnAsserted_Then_awreadyWillGoDefaultState1_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_aresetnAsserted_Then_awreadyWillGoDefaultState1_Expect_AssertionPass Task started"),UVM_NONE);
      aresetn <= 1'b1;
      awready <= 1'bx;
      repeat(2) begin
      @(posedge aclk);
      end
      aresetn <= 1'b0;
      awready <= 1'b1;

    `uvm_info(name,$sformatf("When_aresetnAsserted_Then_awreadyWillGoDefaultState1_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_aresetnAsserted_Then_wreadyWillGoDefaultState1_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_aresetnAsserted_Then_wreadyWillGoDefaultState1_Expect_AssertionPass Task started"),UVM_NONE);
      aresetn <= 1'b1;
      wready <= 1'bx;
      repeat(2) begin
      @(posedge aclk);
      end
      aresetn <= 1'b0;
      wready <= 1'b1;

    `uvm_info(name,$sformatf("When_aresetnAsserted_Then_wreadyWillGoDefaultState1_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_aresetnAsserted_Then_breadyWillGoDefaultState1_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_aresetnAsserted_Then_breadyWillGoDefaultState1_Expect_AssertionPass Task started"),UVM_NONE);
      aresetn <= 1'b1;
      bready <= 1'bx;
      repeat(2) begin
      @(posedge aclk);
      end
      aresetn <= 1'b0;
      bready <= 1'b1;

    `uvm_info(name,$sformatf("When_aresetnAsserted_Then_breadyWillGoDefaultState1_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_aresetnAsserted_Then_awreadyWillGoDefaultState0_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_aresetnAsserted_Then_awreadyWillGoDefaultState0_Expect_AssertionPass Task started"),UVM_NONE);
      aresetn <= 1'b1;
      awready <= 1'bx;
      repeat(2) begin
      @(posedge aclk);
      end
      aresetn <= 1'b0;
      awready <= 1'b0;

    `uvm_info(name,$sformatf("When_aresetnAsserted_Then_awreadyWillGoDefaultState0_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_aresetnAsserted_Then_wreadyWillGoDefaultState0_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_aresetnAsserted_Then_wreadyWillGoDefaultState0_Expect_AssertionPass Task started"),UVM_NONE);
      aresetn <= 1'b1;
      wready <= 1'bx;
      repeat(2) begin
      @(posedge aclk);
      end
      aresetn <= 1'b0;
      wready <= 1'b0;

    `uvm_info(name,$sformatf("When_aresetnAsserted_Then_wreadyWillGoDefaultState0_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_aresetnAsserted_Then_breadyWillGoDefaultState0_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_aresetnAsserted_Then_breadyWillGoDefaultState0_Expect_AssertionPass Task started"),UVM_NONE);
      aresetn <= 1'b1;
      bready <= 1'bx;
      repeat(2) begin
      @(posedge aclk);
      end
      aresetn <= 1'b0;
      bready <= 1'b0;

    `uvm_info(name,$sformatf("When_aresetnAsserted_Then_breadyWillGoDefaultState0_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_aresetnAsserted_Then_awreadyWillNotGoDefaultState1_Expect_AssertionFail();
    `uvm_info(name,$sformatf("When_aresetnAsserted_Then_awreadyWillNotGoDefaultState1_Expect_AssertionFail Task started"),UVM_NONE);
      aresetn <= 1'b1;
      awready <= 1'bx;
      repeat(2) begin
      @(posedge aclk);
      end
      aresetn <= 1'b0;
      @(posedge aclk);
      awready <= 1'b1;

    `uvm_info(name,$sformatf("When_aresetnAsserted_Then_awreadyWillNotGoDefaultState1_Expect_AssertionFail Task Ended"),UVM_NONE);
  endtask

  task When_aresetnAsserted_Then_wreadyWillNotGoDefaultState1_Expect_AssertionFail();
    `uvm_info(name,$sformatf("When_aresetnAsserted_Then_wreadyWillNotGoDefaultState1_Expect_AssertionFail Task started"),UVM_NONE);
      aresetn <= 1'b1;
      wready <= 1'bx;
      repeat(2) begin
      @(posedge aclk);
      end
      aresetn <= 1'b0;
      @(posedge aclk);
      wready <= 1'b1;

    `uvm_info(name,$sformatf("When_aresetnAsserted_Then_wreadyWillNotGoDefaultState1_Expect_AssertionFail Task Ended"),UVM_NONE);
  endtask

  task When_aresetnAsserted_Then_breadyWillNotGoDefaultState1_Expect_AssertionFail();
    `uvm_info(name,$sformatf("When_aresetnAsserted_Then_breadyWillNotGoDefaultState1_Expect_AssertionFail Task started"),UVM_NONE);
      aresetn <= 1'b1;
      bready <= 1'bx;
      repeat(2) begin
      @(posedge aclk);
      end
      aresetn <= 1'b0;
      @(posedge aclk);
      bready <= 1'b1;

    `uvm_info(name,$sformatf("When_aresetnAsserted_Then_breadyWillNotGoDefaultState1_Expect_AssertionFail Task Ended"),UVM_NONE);
  endtask

  task When_aresetnAsserted_Then_awreadyWillNotGoDefaultState0_Expect_AssertionFail();
    `uvm_info(name,$sformatf("When_aresetnAsserted_Then_awreadyWillNotGoDefaultState0_Expect_AssertionFail Task started"),UVM_NONE);
      aresetn <= 1'b1;
      awready <= 1'bx;
      repeat(2) begin
      @(posedge aclk);
      end
      aresetn <= 1'b0;
      @(posedge aclk);
      awready <= 1'b0;

    `uvm_info(name,$sformatf("When_aresetnAsserted_Then_awreadyWillNotGoDefaultState0_Expect_AssertionFail Task Ended"),UVM_NONE);
  endtask

  task When_aresetnAsserted_Then_wreadyWillNotGoDefaultState0_Expect_AssertionFail();
    `uvm_info(name,$sformatf("When_aresetnAsserted_Then_wreadyWillNotGoDefaultState0_Expect_AssertionFail Task started"),UVM_NONE);
      aresetn <= 1'b1;
      wready <= 1'bx;
      repeat(2) begin
      @(posedge aclk);
      end
      aresetn <= 1'b0;
      @(posedge aclk);
      wready <= 1'b0;

    `uvm_info(name,$sformatf("When_aresetnAsserted_Then_wreadyWillNotGoDefaultState0_Expect_AssertionFail Task Ended"),UVM_NONE);
  endtask

  task When_aresetnAsserted_Then_breadyWillNotGoDefaultState0_Expect_AssertionFail();
    `uvm_info(name,$sformatf("When_aresetnAsserted_Then_breadyWillNotGoDefaultState0_Expect_AssertionFail Task started"),UVM_NONE);
      aresetn <= 1'b1;
      bready <= 1'bx;
      repeat(2) begin
      @(posedge aclk);
      end
      aresetn <= 1'b0;
      @(posedge aclk);
      bready <= 1'b0;

    `uvm_info(name,$sformatf("When_aresetnAsserted_Then_breadyWillNotGoDefaultState0_Expect_AssertionFail Task Ended"),UVM_NONE);
  endtask

  task When_transferOccur_Then_nextClkAwreadyWillGoDefaultStateHigh_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_transferOccur_Then_nextClkAwreadyWillGoDefaultStateHigh_Expect_AssertionPass Task started"),UVM_NONE);
      aresetn <= 1'b1;
      awvalid <= 1'b0;
      awready <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      awvalid <= 1'b1;
      awaddr <= 32'h1122_3344;
      awready <= 1'b1;
      @(posedge aclk);
      awvalid <= 1'b0;

    `uvm_info(name,$sformatf("When_transferOccur_Then_nextClkAwreadyWillGoDefaultStateHigh_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_transferOccur_Then_nextClkWreadyWillGoDefaultStateHigh_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_transferOccur_Then_nextClkWreadyWillGoDefaultStateHigh_Expect_AssertionPass Task started"),UVM_NONE);
      aresetn <= 1'b1;
      wvalid <= 1'b0;
      wready <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      wvalid <= 1'b1;
      wdata <= 32'h1111_3333;
      wready <= 1'b1;
      @(posedge aclk);
      wvalid <= 1'b0;

    `uvm_info(name,$sformatf("When_transferOccur_Then_nextClkWreadyWillGoDefaultStateHigh_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_transferOccur_Then_nextClkBreadyWillGoDefaultStateHigh_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_transferOccur_Then_nextClkBreadyWillGoDefaultStateHigh_Expect_AssertionPass Task started"),UVM_NONE);
      aresetn <= 1'b1;
      bvalid <= 1'b0;
      bready <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      bvalid <= 1'b1;
      bready <= 1'b1;
      @(posedge aclk);
      bvalid <= 1'b0;

    `uvm_info(name,$sformatf("When_transferOccur_Then_nextClkBreadyWillGoDefaultStateHigh_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_transferOccur_Then_nextClkAwreadyWillGoDefaultStateLow_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_transferOccur_Then_nextClkAwreadyWillGoDefaultStateLow_Expect_AssertionPass Task started"),UVM_NONE);
      aresetn <= 1'b1;
      awvalid <= 1'b0;
      awready <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      awvalid <= 1'b1;
      awaddr <= 32'h1122_3344;
      awready <= 1'b1;
      @(posedge aclk);
      awvalid <= 1'b0;
      awready <= 1'b0;

    `uvm_info(name,$sformatf("When_transferOccur_Then_nextClkAwreadyWillGoDefaultStateLow_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_transferOccur_Then_nextClkWreadyWillGoDefaultStateLow_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_transferOccur_Then_nextClkWreadyWillGoDefaultStateLow_Expect_AssertionPass Task started"),UVM_NONE);
      aresetn <= 1'b1;
      wvalid <= 1'b0;
      wready <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      wvalid <= 1'b1;
      wdata <= 32'h1111_3333;
      wready <= 1'b1;
      @(posedge aclk);
      wvalid <= 1'b0;
      wready <= 1'b0;

    `uvm_info(name,$sformatf("When_transferOccur_Then_nextClkWreadyWillGoDefaultStateLow_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_transferOccur_Then_nextClkBreadyWillGoDefaultStateLow_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_transferOccur_Then_nextClkBreadyWillGoDefaultStateLow_Expect_AssertionPass Task started"),UVM_NONE);
      aresetn <= 1'b1;
      bvalid <= 1'b0;
      bready <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      bvalid <= 1'b1;
      bready <= 1'b1;
      @(posedge aclk);
      bvalid <= 1'b0;
      bready <= 1'b0;

    `uvm_info(name,$sformatf("When_transferOccur_Then_nextClkBreadyWillGoDefaultStateLow_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_transferOccur_Then_nextClkAwreadyWillNotGoDefaultStateHigh_Expect_AssertionFail();
    `uvm_info(name,$sformatf("When_transferOccur_Then_nextClkAwreadyWillNotGoDefaultStateHigh_Expect_AssertionFail Task started"),UVM_NONE);
      aresetn <= 1'b1;
      awvalid <= 1'b0;
      awready <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      awvalid <= 1'b1;
      awaddr <= 32'h1122_3344;
      awready <= 1'b1;
      @(posedge aclk);
      awvalid <= 1'b0;
      awready <= 1'b0;

    `uvm_info(name,$sformatf("When_transferOccur_Then_nextClkAwreadyWillNotGoDefaultStateHigh_Expect_AssertionFail Task Ended"),UVM_NONE);
  endtask

  task When_transferOccur_Then_nextClkWreadyWillNotGoDefaultStateHigh_Expect_AssertionFail();
    `uvm_info(name,$sformatf("When_transferOccur_Then_nextClkWreadyWillNotGoDefaultStateHigh_Expect_AssertionFail Task started"),UVM_NONE);
      aresetn <= 1'b1;
      wvalid <= 1'b0;
      wready <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      wvalid <= 1'b1;
      wdata <= 32'h1111_3333;
      wready <= 1'b1;
      @(posedge aclk);
      wvalid <= 1'b0;
      wready <= 1'b0;

    `uvm_info(name,$sformatf("When_transferOccur_Then_nextClkWreadyWillNotGoDefaultStateHigh_Expect_AssertionFail Task Ended"),UVM_NONE);
  endtask

  task When_transferOccur_Then_nextClkBreadyWillNotGoDefaultStateHigh_Expect_AssertionFail();
    `uvm_info(name,$sformatf("When_transferOccur_Then_nextClkBreadyWillNotGoDefaultStateHigh_Expect_AssertionFail Task started"),UVM_NONE);
      aresetn <= 1'b1;
      bvalid <= 1'b0;
      bready <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      bvalid <= 1'b1;
      bready <= 1'b1;
      @(posedge aclk);
      bvalid <= 1'b0;
      bready <= 1'b0;

    `uvm_info(name,$sformatf("When_transferOccur_Then_nextClkBreadyWillNotGoDefaultStateHigh_Expect_AssertionFail Task Ended"),UVM_NONE);
  endtask

  task When_transferOccur_Then_nextClkAwreadyWillNotGoDefaultStateLow_Expect_AssertionFail();
    `uvm_info(name,$sformatf("When_transferOccur_Then_nextClkAwreadyWillNotGoDefaultStateLow_Expect_AssertionFail Task started"),UVM_NONE);
      aresetn <= 1'b1;
      awvalid <= 1'b0;
      awready <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      awvalid <= 1'b1;
      awaddr <= 32'h1122_3344;
      awready <= 1'b1;
      @(posedge aclk);
      awvalid <= 1'b0;
      awready <= 1'b1;

    `uvm_info(name,$sformatf("When_transferOccur_Then_nextClkAwreadyWillNotGoDefaultStateLow_Expect_AssertionFail Task Ended"),UVM_NONE);
  endtask

  task When_transferOccur_Then_nextClkWreadyWillNotGoDefaultStateLow_Expect_AssertionFail();
    `uvm_info(name,$sformatf("When_transferOccur_Then_nextClkWreadyWillNotGoDefaultStateLow_Expect_AssertionFail Task started"),UVM_NONE);
      aresetn <= 1'b1;
      wvalid <= 1'b0;
      wready <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      wvalid <= 1'b1;
      wdata <= 32'h1111_3333;
      wready <= 1'b1;
      @(posedge aclk);
      wvalid <= 1'b0;
      wready <= 1'b1;

    `uvm_info(name,$sformatf("When_transferOccur_Then_nextClkWreadyWillNotGoDefaultStateLow_Expect_AssertionFail Task Ended"),UVM_NONE);
  endtask

  task When_transferOccur_Then_nextClkBreadyWillNotGoDefaultStateLow_Expect_AssertionFail();
    `uvm_info(name,$sformatf("When_transferOccur_Then_nextClkBreadyWillNotGoDefaultStateLow_Expect_AssertionFail Task started"),UVM_NONE);
      aresetn <= 1'b1;
      bvalid <= 1'b0;
      bready <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      bvalid <= 1'b1;
      bready <= 1'b1;
      @(posedge aclk);
      bvalid <= 1'b0;
      bready <= 1'b1;

    `uvm_info(name,$sformatf("When_transferOccur_Then_nextClkBreadyWillNotGoDefaultStateLow_Expect_AssertionFail Task Ended"),UVM_NONE);
  endtask

  task When_awvalidIsHigh_Then_awvalidAndAwaddrAndAwprotStableUntilAwreadyAsserted_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_awvalidIsHigh_Then_awvalidAndAwaddrAndAwprotStableUntilAwreadyAsserted_Expect_AssertionPass Task started"),UVM_NONE);
      aresetn <= 1'b1;
      awvalid <= 1'b0;
      awready <= 1'b0;
      @(posedge aclk);
      awvalid <= 1'b1;
      awaddr <= 32'h1122_3344;
      awprot <= 1'b0;
      repeat(2) begin
        @(posedge aclk);
      end
      awready <= 1'b1;

    `uvm_info(name,$sformatf("When_awvalidIsHigh_Then_awvalidAndAwaddrAndAwprotStableUntilAwreadyAsserted_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_wvalidIsHigh_Then_wvalidAndWdataAndWstrbStableUntilWreadyAsserted_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_wvalidIsHigh_Then_wvalidAndWdataAndWstrbStableUntilWreadyAsserted_Expect_AssertionPass Task started"),UVM_NONE);
      aresetn <= 1'b1;
      wvalid <= 1'b0;
      wready <= 1'b0;
      @(posedge aclk);
      wvalid <= 1'b1;
      wdata <= 32'h1122_3344;
      wstrb <= 4'hf;
      repeat(2) begin
        @(posedge aclk);
      end
      wready <= 1'b1;

    `uvm_info(name,$sformatf("When_wvalidIsHigh_Then_wvalidAndWdataAndWstrbStableUntilWreadyAsserted_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_bvalidIsHigh_Then_bvalidAndBrespStableUntilBreadyAsserted_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_bvalidIsHigh_Then_bvalidAndBrespStableUntilBreadyAsserted_Expect_AssertionPass Task started"),UVM_NONE);
      aresetn <= 1'b1;
      bvalid <= 1'b0;
      bready <= 1'b0;
      @(posedge aclk);
      bvalid <= 1'b1;
      bresp <= 2'b00;
      repeat(2) begin
        @(posedge aclk);
      end
      bready <= 1'b1;

    `uvm_info(name,$sformatf("When_bvalidIsHigh_Then_bvalidAndBrespStableUntilBreadyAsserted_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_awvalidIsHigh_Then_awaddrAndAwprotStable2ClkThenNextClkAwreadyAsserted_Expect_AssertionFail();
    `uvm_info(name,$sformatf("When_awvalidIsHigh_Then_awaddrAndAwprotStable2ClkThenNextClkAwreadyAsserted_Expect_AssertionFail Task started"),UVM_NONE);
      aresetn <= 1'b1;
      awvalid <= 1'b0;
      awready <= 1'b0;
      @(posedge aclk);
      awvalid <= 1'b1;
      awaddr <= 32'h1122_3344;
      awprot <= 3'b000;
      repeat(2) begin
        @(posedge aclk);
      end
      awaddr <= 32'h0000_0000;
      awprot <= 3'b001;
      @(posedge aclk);
      awready <= 1'b1;

    `uvm_info(name,$sformatf("When_awvalidIsHigh_Then_awaddrAndAwprotStable2ClkThenNextClkAwreadyAsserted_Expect_AssertionFail Task Ended"),UVM_NONE);
  endtask

  task When_wvalidIsHigh_Then_wdataAndWstrbStable2ClkThenNextClkWreadyAsserted_Expect_AssertionFail();
    `uvm_info(name,$sformatf("When_wvalidIsHigh_Then_wdataAndWstrbStable2ClkThenNextClkWreadyAsserted_Expect_AssertionFail Task started"),UVM_NONE);
      aresetn <= 1'b1;
      wvalid <= 1'b0;
      wready <= 1'b0;
      @(posedge aclk);
      wvalid <= 1'b1;
      wdata <= 32'h1122_3344;
      wstrb <= 4'hf;
      repeat(2) begin
        @(posedge aclk);
      end
      wdata <= 32'hffff_ffff;
      wstrb <= 4'he;
      @(posedge aclk);
      wready <= 1'b1;

    `uvm_info(name,$sformatf("When_wvalidIsHigh_Then_wdataAndWstrbStable2ClkThenNextClkWreadyAsserted_Expect_AssertionFail Task Ended"),UVM_NONE);
  endtask

 task When_bvalidIsHigh_Then_brespStable2ClkThenNextClkBreadyAsserted_Expect_AssertionFail();
    `uvm_info(name,$sformatf("When_bvalidIsHigh_Then_brespStable2ClkThenNextClkBreadyAsserted_Expect_AssertionFail Task started"),UVM_NONE);
      aresetn <= 1'b1;
      bvalid <= 1'b0;
      bready <= 1'b0;
      @(posedge aclk);
      bvalid <= 1'b1;
      bresp <= 2'b00;
      repeat(2) begin
        @(posedge aclk);
      end
      bresp <= 2'b10;
      @(posedge aclk);
      bready <= 1'b1;

    `uvm_info(name,$sformatf("When_bvalidIsHigh_Then_brespStable2ClkThenNextClkBreadyAsserted_Expect_AssertionFail Task Ended"),UVM_NONE);
  endtask

  task When_awvalidAndAwreadyAsserted_Then_awaddrAndAwprotNotUnknownAndTransferOccur_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_awvalidAndAwreadyAsserted_Then_awaddrAndAwprotNotUnknownAndTransferOccur_Expect_AssertionPass Task started"),UVM_NONE);
      aresetn <= 1'b1;
      awvalid <= 1'b0;
      awready <= 1'b0;
      @(posedge aclk);
      awvalid <= 1'b1;
      awready <= 1'b1;
      awaddr <= 32'h1122_3344;
      awprot <= 3'b000;
      @(posedge aclk);
      awvalid <= 1'b0;

    `uvm_info(name,$sformatf("When_awvalidAndAwreadyAsserted_Then_awaddrAndAwprotNotUnknownAndTransferOccur_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_wvalidAndWreadyAsserted_Then_wdataAndWstrbNotUnknownAndTransferOccur_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_wvalidAndWreadyAsserted_Then_wdataAndWstrbNotUnknownAndTransferOccur_Expect_AssertionPass Task started"),UVM_NONE);
      aresetn <= 1'b1;
      wvalid <= 1'b0;
      wready <= 1'b0;
      @(posedge aclk);
      wvalid <= 1'b1;
      wready <= 1'b1;
      wdata <= 32'h1122_3344;
      wstrb <= 4'hf;
      @(posedge aclk);
      wvalid <= 1'b0;

    `uvm_info(name,$sformatf("When_wvalidAndWreadyAsserted_Then_wdataAndWstrbNotUnknownAndTransferOccur_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_bvalidAndBreadyAsserted_Then_brespNotUnknownAndTransferOccur_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_bvalidAndBreadyAsserted_Then_brespNotUnknownAndTransferOccur_Expect_AssertionPass Task started"),UVM_NONE);
      aresetn <= 1'b1;
      bvalid <= 1'b0;
      bready <= 1'b0;
      @(posedge aclk);
      bvalid <= 1'b1;
      bready <= 1'b1;
      bresp <= 2'b00;
      @(posedge aclk);
      bvalid <= 1'b0;

    `uvm_info(name,$sformatf("When_bvalidAndBreadyAsserted_Then_brespNotUnknownAndTransferOccur_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_awvalidAndAwreadyAsserted_Then_awaddrAndAwprotUnknown_Expect_AssertionFail();
    `uvm_info(name,$sformatf("When_awvalidAndAwreadyAsserted_Then_awaddrAndAwprotUnknown_Expect_AssertionFail Task started"),UVM_NONE);
      aresetn <= 1'b1;
      awvalid <= 1'b0;
      awready <= 1'b0;
      @(posedge aclk);
      awvalid <= 1'b1;
      awready <= 1'b1;
      awaddr <= 32'hxxxx_xxxx;
      awprot <= 3'bxxx;
      @(posedge aclk);
      awvalid <= 1'b0;

    `uvm_info(name,$sformatf("When_awvalidAndAwreadyAsserted_Then_awaddrAndAwprotUnknown_Expect_AssertionFail Task Ended"),UVM_NONE);
  endtask

  task When_wvalidAndWreadyAsserted_Then_wdataAndWstrbUnknown_Expect_AssertionFail();
    `uvm_info(name,$sformatf("When_wvalidAndWreadyAsserted_Then_wdataAndWstrbUnknown_Expect_AssertionFail Task started"),UVM_NONE);
      aresetn <= 1'b1;
      wvalid <= 1'b0;
      wready <= 1'b0;
      @(posedge aclk);
      wvalid <= 1'b1;
      wready <= 1'b1;
      wdata <= 32'hxxxx_xxxx;
      wstrb <= 4'hx;
      @(posedge aclk);
      wvalid <= 1'b0;

    `uvm_info(name,$sformatf("When_wvalidAndWreadyAsserted_Then_wdataAndWstrbUnknown_Expect_AssertionFail Task Ended"),UVM_NONE);
  endtask

  task When_bvalidAndBreadyAsserted_Then_brespUnknown_Expect_AssertionFail();
    `uvm_info(name,$sformatf("When_bvalidAndBreadyAsserted_Then_brespUnknown_Expect_AssertionFail Task started"),UVM_NONE);
      aresetn <= 1'b1;
      bvalid <= 1'b0;
      bready <= 1'b0;
      @(posedge aclk);
      bvalid <= 1'b1;
      bready <= 1'b1;
      bresp <= 2'bxx;
      @(posedge aclk);
      bvalid <= 1'b0;

    `uvm_info(name,$sformatf("When_bvalidAndBreadyAsserted_Then_brespUnknown_Expect_AssertionFail Task Ended"),UVM_NONE);
  endtask

  task When_awvalidAwreadyHighAndWithin10ClkWvalidHighAndWreadyAsserted_Then_wthin12ClkBValidAsserted_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_awvalidAwreadyHighAndWithin10ClkWvalidHighAndWreadyAsserted_Then_wthin12ClkBValidAsserted_Expect_AssertionPass Task started"),UVM_NONE);
      awvalid <= 1'b0;
      awready <= 1'b0;
      wvalid <= 1'b0;
      wready <= 1'b0;
      bvalid <= 1'b0;
      aresetn <= 1'b1;
      @(posedge aclk);
      awvalid <= 1'b1;
      awready <= 1'b1;
      awaddr <= 32'h1111_2222;
      awprot <= 3'b000;
      repeat(5) begin
        @(posedge aclk);
      end
      wvalid <= 1'b1;
      wready <= 1'b1;
      wdata <= 32'haabb_1234;
      wstrb <= 4'hf;
      repeat(6) begin
        @(posedge aclk);
      end
      bvalid <= 1'b1;
      bresp <= 2'b00;
      @(posedge aclk);
      awvalid <= 1'b0;
      awready <= 1'b0;
      wvalid <= 1'b0;
      wready <= 1'b0;
      bvalid <= 1'b0;

    `uvm_info(name,$sformatf("When_awvalidAwreadyHighAndWithin10ClkWvalidHighAndWreadyAsserted_Then_wthin12ClkBValidAsserted_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_awvalidAwreadyHighSameClkBvalidHighAndWithin10ClkWvalidHighAndWreadyAsserted_Expect_AssertionFail();
    `uvm_info(name,$sformatf("When_awvalidAwreadyHighSameClkBvalidHighAndWithin10ClkWvalidHighAndWreadyAsserted_Expect_AssertionFail Task started"),UVM_NONE);
      awvalid <= 1'b0;
      awready <= 1'b0;
      wvalid <= 1'b0;
      wready <= 1'b0;
      bvalid <= 1'b0;
      aresetn <= 1'b1;
      @(posedge aclk);
      awvalid <= 1'b1;
      awready <= 1'b1;
      awaddr <= 32'h1111_2222;
      awprot <= 3'b000;
      bvalid <= 1'b1;
      repeat(5) begin
        @(posedge aclk);
      end
      wvalid <= 1'b1;
      wready <= 1'b1;
      wdata <= 32'haabb_1234;
      wstrb <= 4'hf;
      @(posedge aclk);
      awvalid <= 1'b0;
      awready <= 1'b0;
      wvalid <= 1'b0;
      wready <= 1'b0;
      bvalid <= 1'b0;

    `uvm_info(name,$sformatf("When_awvalidAwreadyHighSameClkBvalidHighAndWithin10ClkWvalidHighAndWreadyAsserted_Expect_AssertionFail Task Ended"),UVM_NONE);
  endtask

  task When_wvalidWreadyAsserted_Then_within12ClkKBValidAsserted_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_wvalidWreadyAsserted_Then_within12ClkKBValidAsserted_Expect_AssertionPass Task started"),UVM_NONE);
      aresetn <= 1'b1;
      wvalid <= 1'b0;
      wready <= 1'b0;
      bvalid <= 1'b0;
      @(posedge aclk);
      wvalid <= 1'b1;
      wready <= 1'b1;
      wdata <= 32'haabb_1234;
      wstrb <= 4'hf;
      repeat(8) begin
        @(posedge aclk);
      end
      bvalid <= 1'b1;
      bresp <= 2'b00;
      @(posedge aclk);
      wvalid <= 1'b0;
      wready <= 1'b0;
      bvalid <= 1'b0;

    `uvm_info(name,$sformatf("When_wvalidWreadyAsserted_Then_within12ClkKBValidAsserted_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_wvalidWreadyAsserted_Then_after12ClkBValidAsserted_Expect_AssertionFail();
    `uvm_info(name,$sformatf("When_wvalidWreadyAsserted_Then_after12ClkBValidAsserted_Expect_AssertionFail Task started"),UVM_NONE);
      aresetn <= 1'b1;
      wvalid <= 1'b0;
      wready <= 1'b0;
      bvalid <= 1'b0;
      @(posedge aclk);
      wvalid <= 1'b1;
      wready <= 1'b1;
      wdata <= 32'haabb_1234;
      wstrb <= 4'hf;
      repeat(14) begin
        @(posedge aclk);
      end
      bvalid <= 1'b1;
      @(posedge aclk);
      wvalid <= 1'b0;
      wready <= 1'b0;
      bvalid <= 1'b0;

    `uvm_info(name,$sformatf("When_wvalidWreadyAsserted_Then_after12ClkBValidAsserted_Expect_AssertionFail Task Ended"),UVM_NONE);
  endtask

  task When_awvalidIsAsserted_Then_within10ClkWValidIsAsserted_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_within10ClkWValidIsAsserted_Expect_AssertionPass Task started"),UVM_NONE);
      aresetn <= 1'b1;
      awvalid <= 1'b0;
      awready <= 1'b0;
      wvalid <= 1'b0;
      wready <= 1'b0;
      bvalid <= 1'b0;
      aresetn <= 1'b1;
      @(posedge aclk);
      awvalid <= 1'b1;
      awready <= 1'b1;
      awaddr <= 32'h1111_2222;
      awprot <= 3'b000;
      repeat(7) begin
        @(posedge aclk);
      end
      wvalid <= 1'b1;
      wready <= 1'b1;
      wdata <= 32'haabb_1234;
      wstrb <= 4'hf;
      @(posedge aclk);
      bvalid <= 1'b1;
      bresp <= 2'b00;
      @(posedge aclk);
      awvalid <= 1'b0;
      awready <= 1'b0;
      wvalid <= 1'b0;
      wready <= 1'b0;
      bvalid <= 1'b0;

    `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_within10ClkWValidIsAsserted_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_awvalidIsAsserted_Then_after10ClkWValidIsAsserted_Expect_AssertionFail();
    `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_after10ClkWValidIsAsserted_Expect_AssertionFail Task started"),UVM_NONE);
      aresetn <= 1'b1;
      awvalid <= 1'b0;
      awready <= 1'b0;
      wvalid <= 1'b0;
      wready <= 1'b0;
      bvalid <= 1'b0;
      aresetn <= 1'b1;
      @(posedge aclk);
      awvalid <= 1'b1;
      awready <= 1'b1;
      awaddr <= 32'h1111_2222;
      awprot <= 3'b000;
      repeat(12) begin
        @(posedge aclk);
      end
      wvalid <= 1'b1;
      wready <= 1'b1;
      wdata <= 32'haabb_1234;
      wstrb <= 4'hf;
      @(posedge aclk);
      bvalid <= 1'b1;
      bresp <= 2'b00;
      @(posedge aclk);
      awvalid <= 1'b0;
      awready <= 1'b0;
      wvalid <= 1'b0;
      wready <= 1'b0;
      bvalid <= 1'b0;

    `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_after10ClkWValidIsAsserted_Expect_AssertionFail Task Ended"),UVM_NONE);
  endtask

  task When_bvalidAndBreadyAsserted_Then_ResponseIsNotExokay_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_bvalidAndBreadyAsserted_Then_ResponseIsNotExokay_Expect_AssertionPass Task started"),UVM_NONE);
      aresetn <= 1'b1;
      bvalid <= 1'b0;
      bready <= 1'b0;
      repeat(2) begin
        @(posedge aclk);
      end
      bvalid <= 1'b1;
      bready <= 1'b1;
      bresp <= 2'b00;
      @(posedge aclk);
      bvalid <= 1'b0;

    `uvm_info(name,$sformatf("When_bvalidAndBreadyAsserted_Then_ResponseIsNotExokay_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_bvalidAndBreadyAsserted_Then_ResponseIsExokay_Expect_AssertionFail();
    `uvm_info(name,$sformatf("When_bvalidAndBreadyAsserted_Then_ResponseIsExokay_Expect_AssertionFail Task started"),UVM_NONE);
      aresetn <= 1'b1;
      bvalid <= 1'b0;
      bready <= 1'b0;
      repeat(2) begin
        @(posedge aclk);
      end
      bvalid <= 1'b1;
      bready <= 1'b1;
      bresp <= 2'b01;
      @(posedge aclk);
      bvalid <= 1'b0;

    `uvm_info(name,$sformatf("When_bvalidAndBreadyAsserted_Then_ResponseIsExokay_Expect_AssertionFail Task Ended"),UVM_NONE);
  endtask

endmodule : Axi4LiteMasterWriteAssertPropertyTB

`endif


