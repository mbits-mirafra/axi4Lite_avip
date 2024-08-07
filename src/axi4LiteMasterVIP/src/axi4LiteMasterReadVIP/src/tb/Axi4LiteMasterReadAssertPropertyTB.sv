`ifndef AXI4LITEMASTERREADASSERTPROPERTYTB_INCLUDED_
`define AXI4LITEMASTERREADASSERTPROPERTYTB_INCLUDED_

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
  logic [2:0] arprot;
  //Read Data Channel Signals
  logic rvalid;
  logic [DATA_WIDTH-1:0] rdata;
  logic rready;
  logic [1:0] rresp;
  
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
                                                            .arprot(arprot),
                                                            .rvalid(rvalid),
                                                            .rdata(rdata),
                                                            .rready(rready),
                                                            .rresp(rresp)
                                                           );

  initial begin
    #15000;
    $finish;
  end

  initial begin
    When_arvalidIsAsserted_Then_sameClkAraddrIsNotUnknown_Expect_AssertionPass();
    When_arvalidIsAsserted_Then_sameClkArprotIsNotUnknown_Expect_AssertionPass();
    When_rvalidIsAsserted_Then_sameClkRdataIsNotUnknown_Expect_AssertionPass();
    When_rvalidIsAsserted_Then_sameClkRrespIsNotUnknown_Expect_AssertionPass();
    When_arvalidIsAsserted_Then_sameClkAraddrIsUnknown_Expect_AssertionFail();
    When_arvalidIsAsserted_Then_sameClkArprotIsUnknown_Expect_AssertionFail();
    When_rvalidIsAsserted_Then_sameClkRdataIsUnknown_Expect_AssertionFail();
    When_rvalidIsAsserted_Then_sameClkRrespIsUnknown_Expect_AssertionFail();

    When_arvalidAsserted_Then_arvalidHighAndWithin16ClkArreadyAsserted_Expect_AssertionPass();
    When_rvalidAsserted_Then_rvalidHighAndWithin16ClkRreadyAsserted_Expect_AssertionPass();
    When_arvalidAsserted_Then_arvalidHighAndAfter16ClkArreadyAsserted_Expect_AssertionFail();
    When_rvalidAsserted_Then_rvalidHighAndAfter16ClkRreadyAsserted_Expect_AssertionFail();

    When_arvalidAsserted_Then_sameClkArreadyAsserted_Expect_AssertionPass();
    When_rvalidAsserted_Then_sameClkRreadyAsserted_Expect_AssertionPass();

    When_aresetnAsserted_Then_arvalidWillGoLow_Expect_AssertionPass();
    When_aresetnAsserted_Then_rvalidWillGoLow_Expect_AssertionPass();
    When_aresetnAsserted_Then_arvalidWillNotGoLow_Expect_AssertionFail();
    When_aresetnAsserted_Then_rvalidWillNotGoLow_Expect_AssertionFail();

    When_aresetnAsserted_Then_arreadyWillGoDefaultState1_Expect_AssertionPass();
    When_aresetnAsserted_Then_rreadyWillGoDefaultState1_Expect_AssertionPass();
    When_aresetnAsserted_Then_arreadyWillNotGoDefaultState1_Expect_AssertionFail();
    When_aresetnAsserted_Then_rreadyWillNotGoDefaultState1_Expect_AssertionFail();
  //  When_aresetnAsserted_Then_arreadyWillGoDefaultState0_Expect_AssertionPass();
  //  When_aresetnAsserted_Then_rreadyWillGoDefaultState0_Expect_AssertionPass();
  //  When_aresetnAsserted_Then_arreadyWillNotGoDefaultState0_Expect_AssertionFail();
  //  When_aresetnAsserted_Then_rreadyWillNotGoDefaultState0_Expect_AssertionFail();

    When_transferOccur_Then_nextClkArreadyWillGoDefaultStateHigh_Expect_AssertionPass();
    When_transferOccur_Then_nextClkRreadyWillGoDefaultStateHigh_Expect_AssertionPass();
  //  When_transferOccur_Then_nextClkArreadyWillGoDefaultStateLow_Expect_AssertionPass();
  //  When_transferOccur_Then_nextClkRreadyWillGoDefaultStateLow_Expect_AssertionPass();
    When_transferOccur_Then_nextClkArreadyWillNotGoDefaultStateHigh_Expect_AssertionFail();
    When_transferOccur_Then_nextClkRreadyWillNotGoDefaultStateHigh_Expect_AssertionFail();
  //  When_transferOccur_Then_nextClkArreadyWillNotGoDefaultStateLow_Expect_AssertionFail();
  //  When_transferOccur_Then_nextClkRreadyWillNotGoDefaultStateLow_Expect_AssertionFail();
  

    When_arvalidIsHigh_Then_arvalidAndAraddrAndArprotStableUntilArreadyAsserted_Expect_AssertionPass();
    When_rvalidIsHigh_Then_rvalidAndRdataAndRrespStableUntilRreadyAsserted_Expect_AssertionPass();
    When_arvalidIsHigh_Then_araddrAndArprotStable2ClkThenNextClkArreadyAsserted_Expect_AssertionFail();
    When_rvalidIsHigh_Then_rdataAndRrespStable2ClkThenNextClkRreadyAsserted_Expect_AssertionFail();

    When_arvalidAndArreadyAsserted_Then_araddrAndArprotNotUnknownAndTransferOccur_Expect_AssertionPass();
    When_rvalidAndRreadyAsserted_Then_rdataAndRrespNotUnknownAndTransferOccur_Expect_AssertionPass();
    When_arvalidAndArreadyAsserted_Then_araddrAndArprotUnknown_Expect_AssertionFail();
    When_rvalidAndRreadyAsserted_Then_rdataAndRrespUnknown_Expect_AssertionFail();

    When_readAddressPhaseOccur_Then_nextClkRvalidAssertedRdataNotUnknown_Expect_AssertionPass();
    When_readAddressPhaseOccur_Before_oneClkRvalidAssertedRdataNotUnknown_Expect_AssertionFail();

    When_arvalidAndArreadyAsserted_Then_within10ClkRvalidAsserted_Expect_AssertionPass();
    When_arvalidAndArreadyAsserted_Then_after10ClkRvalidAsserted_Expect_AssertionFail();

    When_arvalidAndArreadyAsserted_Then_within10ClkRvalidAssertedAndRdataNotUnknown_Expect_AssertionPass();
    When_arvalidAndArreadyAsserted_Then_after10ClkRvalidAssertedAndRdataNotUnknown_Expect_AssertionFail();
  
    When_rvalidAndRreadyAsserted_Then_ResponseIsNotExokay_Expect_AssertionPass();
    When_rvalidAndRreadyAsserted_Then_ResponseIsExokay_Expect_AssertionFail();
  end

  task When_arvalidIsAsserted_Then_sameClkAraddrIsNotUnknown_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_arvalidIsAsserted_Then_sameClkAraddrIsNotUnknown_Expect_AssertionPass Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      araddr <= 32'bx;
      repeat(2) begin
      @(posedge aclk);
      end
      arvalid <= 1'b1;
      araddr <= 32'h1122_3344;

      repeat(2) begin
       @(posedge aclk);
      end
      arvalid <= 1'b0;
    `uvm_info(name,$sformatf("When_arvalidIsAsserted_Then_sameClkAraddrIsNotUnknown_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_rvalidIsAsserted_Then_sameClkRdataIsNotUnknown_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_rvalidIsAsserted_Then_sameClkRdataIsNotUnknown_Expect_AssertionPass Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      rvalid <= 1'b0;
      rdata <= 32'bx;
      repeat(2) begin
      @(posedge aclk);
      end
      rvalid <= 1'b1;
      rdata <= 32'h1111_3333;

      repeat(2) begin
       @(posedge aclk);
      end
      rvalid <= 1'b0;
    `uvm_info(name,$sformatf("When_rvalidIsAsserted_Then_sameClkRdataIsNotUnknown_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_arvalidIsAsserted_Then_sameClkArprotIsNotUnknown_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_arvalidIsAsserted_Then_sameClkArprotIsNotUnknown_Expect_AssertionPass Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      arprot <= 3'bxxx;
      repeat(2) begin
      @(posedge aclk);
      end
      arvalid <= 1'b1;
      arprot <= 3'b000;

      repeat(2) begin
       @(posedge aclk);
      end
      arvalid <= 1'b0;
    `uvm_info(name,$sformatf("When_arvalidIsAsserted_Then_sameClkArprotIsNotUnknown_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_rvalidIsAsserted_Then_sameClkRrespIsNotUnknown_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_rvalidIsAsserted_Then_sameClkRrespIsNotUnknown_Expect_AssertionPass Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      rvalid <= 1'b0;
      rresp <= 2'bxx;
      repeat(2) begin
      @(posedge aclk);
      end
      rvalid <= 1'b1;
      rresp <= 2'b00;

      repeat(2) begin
       @(posedge aclk);
      end
      rvalid <= 1'b0;
    `uvm_info(name,$sformatf("When_rvalidIsAsserted_Then_sameClkRrespIsNotUnknown_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_arvalidIsAsserted_Then_sameClkAraddrIsUnknown_Expect_AssertionFail();
    `uvm_info(name,$sformatf("When_arvalidIsAsserted_Then_sameClkAraddrIsUnknown_Expect_AssertionFail Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      araddr <= 32'bx;
      repeat(2) begin
      @(posedge aclk);
      end
      arvalid <= 1'b1;

      repeat(2) begin
       @(posedge aclk);
      end
      arvalid <= 1'b0;
    `uvm_info(name,$sformatf("When_arvalidIsAsserted_Then_sameClkAraddrIsUnknown_Expect_AssertionFail Task Ended"),UVM_NONE);
  endtask

  task When_rvalidIsAsserted_Then_sameClkRdataIsUnknown_Expect_AssertionFail();
    `uvm_info(name,$sformatf("When_rvalidIsAsserted_Then_sameClkRdataIsUnknown_Expect_AssertionFail Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      rvalid <= 1'b0;
      rdata <= 32'bx;
      repeat(2) begin
      @(posedge aclk);
      end
      rvalid <= 1'b1;

      repeat(2) begin
       @(posedge aclk);
      end
      rvalid <= 1'b0;
    `uvm_info(name,$sformatf("When_rvalidIsAsserted_Then_sameClkRdataIsUnknown_Expect_AssertionFail Task Ended"),UVM_NONE);
  endtask

  task When_arvalidIsAsserted_Then_sameClkArprotIsUnknown_Expect_AssertionFail();
    `uvm_info(name,$sformatf("When_arvalidIsAsserted_Then_sameClkArprotIsUnknown_Expect_AssertionFail Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      arprot <= 3'bxxx;
      repeat(2) begin
      @(posedge aclk);
      end
      arvalid <= 1'b1;

      repeat(2) begin
       @(posedge aclk);
      end
      arvalid <= 1'b0;
    `uvm_info(name,$sformatf("When_arvalidIsAsserted_Then_sameClkArprotIsUnknown_Expect_AssertionFail Task Ended"),UVM_NONE);
  endtask

  task When_rvalidIsAsserted_Then_sameClkRrespIsUnknown_Expect_AssertionFail();
    `uvm_info(name,$sformatf("When_rvalidIsAsserted_Then_sameClkRrespIsUnknown_Expect_AssertionFail Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      rvalid <= 1'b0;
      rresp <= 2'bxx;
      repeat(2) begin
      @(posedge aclk);
      end
      rvalid <= 1'b1;

      repeat(2) begin
       @(posedge aclk);
      end
      rvalid <= 1'b0;
    `uvm_info(name,$sformatf("When_rvalidIsAsserted_Then_sameClkRrespIsUnknown_Expect_AssertionFail Task Ended"),UVM_NONE);
  endtask

  task When_arvalidAsserted_Then_arvalidHighAndWithin16ClkArreadyAsserted_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_arvalidAsserted_Then_arvalidHighAndWithin16ClkArreadyAsserted_Expect_AssertionPass Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      arready <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      arvalid <= 1'b1;
      araddr <= 32'h1122_3344;

      repeat(8) begin
       @(posedge aclk);
      end
      arready <= 1'b1;
      @(posedge aclk);
      arvalid <= 1'b0;
      arready <= 1'b0;
    `uvm_info(name,$sformatf("When_arvalidAsserted_Then_arvalidHighAndWithin16ClkArreadyAsserted_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_rvalidAsserted_Then_rvalidHighAndWithin16ClkRreadyAsserted_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_rvalidAsserted_Then_rvalidHighAndWithin16ClkRreadyAsserted_Expect_AssertionPass Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      rvalid <= 1'b0;
      rready <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      rvalid <= 1'b1;
      rdata <= 32'h1111_3333;

      repeat(8) begin
       @(posedge aclk);
      end
      rready <= 1'b1;
      @(posedge aclk);
      rvalid <= 1'b0;
      rready <= 1'b0;
    `uvm_info(name,$sformatf("When_rvalidAsserted_Then_rvalidHighAndWithin16ClkRreadyAsserted_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_arvalidAsserted_Then_arvalidHighAndAfter16ClkArreadyAsserted_Expect_AssertionFail();
    `uvm_info(name,$sformatf("When_arvalidAsserted_Then_arvalidHighAndAfter16ClkArreadyAsserted_Expect_AssertionFail Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      arready <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      arvalid <= 1'b1;
      araddr <= 32'h1122_3344;

      repeat(18) begin
       @(posedge aclk);
      end
      arready <= 1'b1;
      @(posedge aclk);
      arvalid <= 1'b0;
      arready <= 1'b0;
    `uvm_info(name,$sformatf("When_arvalidAsserted_Then_arvalidHighAndAfter16ClkArreadyAsserted_Expect_AssertionFail Task Ended"),UVM_NONE);
  endtask

  task When_rvalidAsserted_Then_rvalidHighAndAfter16ClkRreadyAsserted_Expect_AssertionFail();
    `uvm_info(name,$sformatf("When_rvalidAsserted_Then_rvalidHighAndAfter16ClkRreadyAsserted_Expect_AssertionFail Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      rvalid <= 1'b0;
      rready <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      rvalid <= 1'b1;
      rdata <= 32'h1111_3333;

      repeat(18) begin
       @(posedge aclk);
      end
      rready <= 1'b1;
      @(posedge aclk);
      rvalid <= 1'b0;
      rready <= 1'b0;
    `uvm_info(name,$sformatf("When_rvalidAsserted_Then_rvalidHighAndAfter16ClkRreadyAsserted_Expect_AssertionFail Task Ended"),UVM_NONE);
  endtask

  task When_arvalidAsserted_Then_sameClkArreadyAsserted_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_arvalidAsserted_Then_sameClkArreadyAsserted_Expect_AssertionPass Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      arready <= 1'b0;
      repeat(3) begin
      @(posedge aclk);
      end
      arvalid <= 1'b1;
      araddr <= 32'h1122_3344;
      arready <= 1'b1;
      @(posedge aclk);
      arvalid <= 1'b0;
      arready <= 1'b0;

    `uvm_info(name,$sformatf("When_arvalidAsserted_Then_sameClkArreadyAsserted_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_rvalidAsserted_Then_sameClkRreadyAsserted_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_rvalidAsserted_Then_sameClkRreadyAsserted_Expect_AssertionPass Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      rvalid <= 1'b0;
      rready <= 1'b0;
      repeat(3) begin
      @(posedge aclk);
      end
      rvalid <= 1'b1;
      rdata <= 32'h1111_3333;
      rready <= 1'b1;
      @(posedge aclk);
      rvalid <= 1'b0;
      rready <= 1'b0;

    `uvm_info(name,$sformatf("When_rvalidAsserted_Then_sameClkRreadyAsserted_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_aresetnAsserted_Then_arvalidWillGoLow_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_aresetnAsserted_Then_arvalidWillGoLow_Expect_AssertionPass Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      arvalid <= 1'bx;
      repeat(2) begin
      @(posedge aclk);
      end
      aresetn <= 1'b0;
      arvalid <= 1'b0;

    `uvm_info(name,$sformatf("When_aresetnAsserted_Then_arvalidWillGoLow_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_aresetnAsserted_Then_rvalidWillGoLow_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_aresetnAsserted_Then_rvalidWillGoLow_Expect_AssertionPass Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      rvalid <= 1'bx;
      repeat(2) begin
      @(posedge aclk);
      end
      aresetn <= 1'b0;
      rvalid <= 1'b0;

    `uvm_info(name,$sformatf("When_aresetnAsserted_Then_rvalidWillGoLow_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_aresetnAsserted_Then_arvalidWillNotGoLow_Expect_AssertionFail();
    `uvm_info(name,$sformatf("When_aresetnAsserted_Then_arvalidWillNotGoLow_Expect_AssertionFail Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      arvalid <= 1'bx;
      repeat(2) begin
      @(posedge aclk);
      end
      aresetn <= 1'b0;
      arvalid <= 1'b1;

    `uvm_info(name,$sformatf("When_aresetnAsserted_Then_arvalidWillNotGoLow_Expect_AssertionFail Task Ended"),UVM_NONE);
  endtask

  task When_aresetnAsserted_Then_rvalidWillNotGoLow_Expect_AssertionFail();
    `uvm_info(name,$sformatf("When_aresetnAsserted_Then_rvalidWillNotGoLow_Expect_AssertionFail Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      rvalid <= 1'bx;
      repeat(2) begin
      @(posedge aclk);
      end
      aresetn <= 1'b0;
      rvalid <= 1'b1;

    `uvm_info(name,$sformatf("When_aresetnAsserted_Then_rvalidWillNotGoLow_Expect_AssertionFail Task Ended"),UVM_NONE);
  endtask

  task When_aresetnAsserted_Then_arreadyWillGoDefaultState1_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_aresetnAsserted_Then_arreadyWillGoDefaultState1_Expect_AssertionPass Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      arready <= 1'bx;
      repeat(2) begin
      @(posedge aclk);
      end
      aresetn <= 1'b0;
      arready <= 1'b1;

    `uvm_info(name,$sformatf("When_aresetnAsserted_Then_arreadyWillGoDefaultState1_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_aresetnAsserted_Then_rreadyWillGoDefaultState1_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_aresetnAsserted_Then_rreadyWillGoDefaultState1_Expect_AssertionPass Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      rready <= 1'bx;
      repeat(2) begin
      @(posedge aclk);
      end
      aresetn <= 1'b0;
      rready <= 1'b1;

    `uvm_info(name,$sformatf("When_aresetnAsserted_Then_rreadyWillGoDefaultState1_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_aresetnAsserted_Then_arreadyWillGoDefaultState0_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_aresetnAsserted_Then_arreadyWillGoDefaultState0_Expect_AssertionPass Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      arready <= 1'bx;
      repeat(2) begin
      @(posedge aclk);
      end
      aresetn <= 1'b0;
      arready <= 1'b0;

    `uvm_info(name,$sformatf("When_aresetnAsserted_Then_arreadyWillGoDefaultState0_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_aresetnAsserted_Then_rreadyWillGoDefaultState0_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_aresetnAsserted_Then_rreadyWillGoDefaultState0_Expect_AssertionPass Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      rready <= 1'bx;
      repeat(2) begin
      @(posedge aclk);
      end
      aresetn <= 1'b0;
      rready <= 1'b0;

    `uvm_info(name,$sformatf("When_aresetnAsserted_Then_rreadyWillGoDefaultState0_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_aresetnAsserted_Then_arreadyWillNotGoDefaultState1_Expect_AssertionFail();
    `uvm_info(name,$sformatf("When_aresetnAsserted_Then_arreadyWillNotGoDefaultState1_Expect_AssertionFail Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      arready <= 1'bx;
      repeat(2) begin
      @(posedge aclk);
      end
      aresetn <= 1'b0;
      @(posedge aclk);
      arready <= 1'b1;

    `uvm_info(name,$sformatf("When_aresetnAsserted_Then_arreadyWillNotGoDefaultState1_Expect_AssertionFail Task Ended"),UVM_NONE);
  endtask

  task When_aresetnAsserted_Then_rreadyWillNotGoDefaultState1_Expect_AssertionFail();
    `uvm_info(name,$sformatf("When_aresetnAsserted_Then_rreadyWillNotGoDefaultState1_Expect_AssertionFail Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      rready <= 1'bx;
      repeat(2) begin
      @(posedge aclk);
      end
      aresetn <= 1'b0;
      @(posedge aclk);
      rready <= 1'b1;

    `uvm_info(name,$sformatf("When_aresetnAsserted_Then_rreadyWillNotGoDefaultState1_Expect_AssertionFail Task Ended"),UVM_NONE);
  endtask

  task When_aresetnAsserted_Then_arreadyWillNotGoDefaultState0_Expect_AssertionFail();
    `uvm_info(name,$sformatf("When_aresetnAsserted_Then_arreadyWillNotGoDefaultState0_Expect_AssertionFail Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      arready <= 1'bx;
      repeat(2) begin
      @(posedge aclk);
      end
      aresetn <= 1'b0;
      @(posedge aclk);
      arready <= 1'b0;

    `uvm_info(name,$sformatf("When_aresetnAsserted_Then_arreadyWillNotGoDefaultState0_Expect_AssertionFail Task Ended"),UVM_NONE);
  endtask

  task When_aresetnAsserted_Then_rreadyWillNotGoDefaultState0_Expect_AssertionFail();
    `uvm_info(name,$sformatf("When_aresetnAsserted_Then_rreadyWillNotGoDefaultState0_Expect_AssertionFail Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      rready <= 1'bx;
      repeat(2) begin
      @(posedge aclk);
      end
      aresetn <= 1'b0;
      @(posedge aclk);
      rready <= 1'b0;

    `uvm_info(name,$sformatf("When_aresetnAsserted_Then_rreadyWillNotGoDefaultState0_Expect_AssertionFail Task Ended"),UVM_NONE);
  endtask

  task When_transferOccur_Then_nextClkArreadyWillGoDefaultStateHigh_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_transferOccur_Then_nextClkArreadyWillGoDefaultStateHigh_Expect_AssertionPass Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      arready <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      arvalid <= 1'b1;
      araddr <= 32'h1122_3344;
      arready <= 1'b1;
      @(posedge aclk);
      arvalid <= 1'b0;

    `uvm_info(name,$sformatf("When_transferOccur_Then_nextClkArreadyWillGoDefaultStateHigh_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_transferOccur_Then_nextClkRreadyWillGoDefaultStateHigh_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_transferOccur_Then_nextClkRreadyWillGoDefaultStateHigh_Expect_AssertionPass Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      rvalid <= 1'b0;
      rready <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      rvalid <= 1'b1;
      rdata <= 32'h1111_3333;
      rready <= 1'b1;
      @(posedge aclk);
      rvalid <= 1'b0;

    `uvm_info(name,$sformatf("When_transferOccur_Then_nextClkRreadyWillGoDefaultStateHigh_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_transferOccur_Then_nextClkArreadyWillGoDefaultStateLow_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_transferOccur_Then_nextClkArreadyWillGoDefaultStateLow_Expect_AssertionPass Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      arready <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      arvalid <= 1'b1;
      araddr <= 32'h1122_3344;
      arready <= 1'b1;
      @(posedge aclk);
      arvalid <= 1'b0;
      arready <= 1'b0;

    `uvm_info(name,$sformatf("When_transferOccur_Then_nextClkArreadyWillGoDefaultStateLow_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_transferOccur_Then_nextClkRreadyWillGoDefaultStateLow_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_transferOccur_Then_nextClkRreadyWillGoDefaultStateLow_Expect_AssertionPass Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      rvalid <= 1'b0;
      rready <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      rvalid <= 1'b1;
      rdata <= 32'h1111_3333;
      rready <= 1'b1;
      @(posedge aclk);
      rvalid <= 1'b0;
      rready <= 1'b0;

    `uvm_info(name,$sformatf("When_transferOccur_Then_nextClkRreadyWillGoDefaultStateLow_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_transferOccur_Then_nextClkArreadyWillNotGoDefaultStateHigh_Expect_AssertionFail();
    `uvm_info(name,$sformatf("When_transferOccur_Then_nextClkArreadyWillNotGoDefaultStateHigh_Expect_AssertionFail Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      arready <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      arvalid <= 1'b1;
      araddr <= 32'h1122_3344;
      arready <= 1'b1;
      @(posedge aclk);
      arvalid <= 1'b0;
      arready <= 1'b0;

    `uvm_info(name,$sformatf("When_transferOccur_Then_nextClkArreadyWillNotGoDefaultStateHigh_Expect_AssertionFail Task Ended"),UVM_NONE);
  endtask

  task When_transferOccur_Then_nextClkRreadyWillNotGoDefaultStateHigh_Expect_AssertionFail();
    `uvm_info(name,$sformatf("When_transferOccur_Then_nextClkRreadyWillNotGoDefaultStateHigh_Expect_AssertionFail Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      rvalid <= 1'b0;
      rready <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      rvalid <= 1'b1;
      rdata <= 32'h1111_3333;
      rready <= 1'b1;
      @(posedge aclk);
      rvalid <= 1'b0;
      rready <= 1'b0;

    `uvm_info(name,$sformatf("When_transferOccur_Then_nextClkRreadyWillNotGoDefaultStateHigh_Expect_AssertionFail Task Ended"),UVM_NONE);
  endtask

  task When_transferOccur_Then_nextClkArreadyWillNotGoDefaultStateLow_Expect_AssertionFail();
    `uvm_info(name,$sformatf("When_transferOccur_Then_nextClkArreadyWillNotGoDefaultStateLow_Expect_AssertionFail Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      arready <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      arvalid <= 1'b1;
      araddr <= 32'h1122_3344;
      arready <= 1'b1;
      @(posedge aclk);
      arvalid <= 1'b0;
      arready <= 1'b1;

    `uvm_info(name,$sformatf("When_transferOccur_Then_nextClkArreadyWillNotGoDefaultStateLow_Expect_AssertionFail Task Ended"),UVM_NONE);
  endtask

  task When_transferOccur_Then_nextClkRreadyWillNotGoDefaultStateLow_Expect_AssertionFail();
    `uvm_info(name,$sformatf("When_transferOccur_Then_nextClkRreadyWillNotGoDefaultStateLow_Expect_AssertionFail Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      rvalid <= 1'b0;
      rready <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      rvalid <= 1'b1;
      rdata <= 32'h1111_3333;
      rready <= 1'b1;
      @(posedge aclk);
      rvalid <= 1'b0;
      rready <= 1'b1;

    `uvm_info(name,$sformatf("When_transferOccur_Then_nextClkRreadyWillNotGoDefaultStateLow_Expect_AssertionFail Task Ended"),UVM_NONE);
  endtask

  task When_arvalidIsHigh_Then_arvalidAndAraddrAndArprotStableUntilArreadyAsserted_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_arvalidIsHigh_Then_arvalidAndAraddrAndArprotStableUntilArreadyAsserted_Expect_AssertionPass Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      arready <= 1'b0;
      @(posedge aclk);
      arvalid <= 1'b1;
      araddr <= 32'h1122_3344;
      arprot <= 1'b0;
      repeat(2) begin
        @(posedge aclk);
      end
      arready <= 1'b1;

    `uvm_info(name,$sformatf("When_arvalidIsHigh_Then_arvalidAndAraddrAndArprotStableUntilArreadyAsserted_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_rvalidIsHigh_Then_rvalidAndRdataAndRrespStableUntilRreadyAsserted_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_rvalidIsHigh_Then_rvalidAndRdataAndRrespStableUntilRreadyAsserted_Expect_AssertionPass Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      rvalid <= 1'b0;
      rready <= 1'b0;
      @(posedge aclk);
      rvalid <= 1'b1;
      rdata <= 32'h1122_3344;
      rresp <= 2'b00;
      repeat(2) begin
        @(posedge aclk);
      end
      rready <= 1'b1;

    `uvm_info(name,$sformatf("When_rvalidIsHigh_Then_rvalidAndRdataAndRrespStableUntilRreadyAsserted_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_arvalidIsHigh_Then_araddrAndArprotStable2ClkThenNextClkArreadyAsserted_Expect_AssertionFail();
    `uvm_info(name,$sformatf("When_arvalidIsHigh_Then_araddrAndArprotStable2ClkThenNextClkArreadyAsserted_Expect_AssertionFail Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      arready <= 1'b0;
      @(posedge aclk);
      arvalid <= 1'b1;
      araddr <= 32'h1122_3344;
      arprot <= 3'b000;
      repeat(2) begin
        @(posedge aclk);
      end
      araddr <= 32'h0000_0000;
      arprot <= 3'b001;
      @(posedge aclk);
      arready <= 1'b1;

    `uvm_info(name,$sformatf("When_arvalidIsHigh_Then_araddrAndArprotStable2ClkThenNextClkArreadyAsserted_Expect_AssertionFail Task Ended"),UVM_NONE);
  endtask

  task When_rvalidIsHigh_Then_rdataAndRrespStable2ClkThenNextClkRreadyAsserted_Expect_AssertionFail();
    `uvm_info(name,$sformatf("When_rvalidIsHigh_Then_rdataAndRrespStable2ClkThenNextClkRreadyAsserted_Expect_AssertionFail Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      rvalid <= 1'b0;
      rready <= 1'b0;
      @(posedge aclk);
      rvalid <= 1'b1;
      rdata <= 32'h1122_3344;
      rresp <= 2'b00;
      repeat(2) begin
        @(posedge aclk);
      end
      rdata <= 32'hffff_ffff;
      rresp <= 2'b10;
      @(posedge aclk);
      rready <= 1'b1;

    `uvm_info(name,$sformatf("When_rvalidIsHigh_Then_rdataAndRrespStable2ClkThenNextClkRreadyAsserted_Expect_AssertionFail Task Ended"),UVM_NONE);
  endtask

  task When_arvalidAndArreadyAsserted_Then_araddrAndArprotNotUnknownAndTransferOccur_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_arvalidAndArreadyAsserted_Then_araddrAndArprotNotUnknownAndTransferOccur_Expect_AssertionPass Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      arready <= 1'b0;
      @(posedge aclk);
      arvalid <= 1'b1;
      arready <= 1'b1;
      araddr <= 32'h1122_3344;
      arprot <= 3'b000;
      @(posedge aclk);
      arvalid <= 1'b0;

    `uvm_info(name,$sformatf("When_arvalidAndArreadyAsserted_Then_araddrAndArprotNotUnknownAndTransferOccur_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_rvalidAndRreadyAsserted_Then_rdataAndRrespNotUnknownAndTransferOccur_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_rvalidAndRreadyAsserted_Then_rdataAndRrespNotUnknownAndTransferOccur_Expect_AssertionPass Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      rvalid <= 1'b0;
      rready <= 1'b0;
      @(posedge aclk);
      rvalid <= 1'b1;
      rready <= 1'b1;
      rdata <= 32'h1122_3344;
      rresp <= 2'b00;
      @(posedge aclk);
      rvalid <= 1'b0;

    `uvm_info(name,$sformatf("When_rvalidAndRreadyAsserted_Then_rdataAndRrespNotUnknownAndTransferOccur_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_arvalidAndArreadyAsserted_Then_araddrAndArprotUnknown_Expect_AssertionFail();
    `uvm_info(name,$sformatf("When_arvalidAndArreadyAsserted_Then_araddrAndArprotUnknown_Expect_AssertionFail Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      arready <= 1'b0;
      @(posedge aclk);
      arvalid <= 1'b1;
      arready <= 1'b1;
      araddr <= 32'hxxxx_xxxx;
      arprot <= 3'bxxx;
      @(posedge aclk);
      arvalid <= 1'b0;

    `uvm_info(name,$sformatf("When_arvalidAndArreadyAsserted_Then_araddrAndArprotUnknown_Expect_AssertionFail Task Ended"),UVM_NONE);
  endtask

  task When_rvalidAndRreadyAsserted_Then_rdataAndRrespUnknown_Expect_AssertionFail();
    `uvm_info(name,$sformatf("When_rvalidAndRreadyAsserted_Then_rdataAndRrespUnknown_Expect_AssertionFail Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      rvalid <= 1'b0;
      rready <= 1'b0;
      @(posedge aclk);
      rvalid <= 1'b1;
      rready <= 1'b1;
      rdata <= 32'hxxxx_xxxx;
      rresp <= 2'bxx;
      @(posedge aclk);
      rvalid <= 1'b0;

    `uvm_info(name,$sformatf("When_rvalidAndRreadyAsserted_Then_rdataAndRrespUnknown_Expect_AssertionFail Task Ended"),UVM_NONE);
  endtask

  task When_readAddressPhaseOccur_Then_nextClkRvalidAssertedRdataNotUnknown_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_readAddressPhaseOccur_Then_nextClkRvalidAssertedRdataNotUnknown_Expect_AssertionPass Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      arready <= 1'b0;
      rvalid <=1'b0;
      rready <=1'b0;
      @(posedge aclk);
      arvalid <= 1'b1;
      arready <= 1'b1;
      araddr <= 32'h1122_3344;
      arprot <= 3'b000;
      @(posedge aclk);
      arvalid <= 1'b0;
      arready <= 1'b0;

      rvalid <= 1'b1;
      rready <= 1'b1;
      rdata <= 32'h1122_3344;
      rresp <= 2'b00;
      @(posedge aclk);
      rvalid <= 1'b0;
      rready <= 1'b0;
    `uvm_info(name,$sformatf("When_readAddressPhaseOccur_Then_nextClkRvalidAssertedRdataNotUnknown_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_readAddressPhaseOccur_Before_oneClkRvalidAssertedRdataNotUnknown_Expect_AssertionFail();
    `uvm_info(name,$sformatf("When_readAddressPhaseOccur_Before_oneClkRvalidAssertedRdataNotUnknown_Expect_AssertionFail Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      arready <= 1'b0;
      rvalid <=1'b0;
      rready <=1'b0;
      @(posedge aclk);
      rvalid <= 1'b1;
      rready <= 1'b1;
      rdata <= 32'h1122_3344;
      rresp <= 2'b00;
      @(posedge aclk);
      rvalid <= 1'b0;
      rready <= 1'b0;

      arvalid <= 1'b1;
      arready <= 1'b1;
      araddr <= 32'h1122_3344;
      arprot <= 3'b000;
      @(posedge aclk);
      arvalid <= 1'b0;
      arready <= 1'b0;

    `uvm_info(name,$sformatf("When_readAddressPhaseOccur_Before_oneClkRvalidAssertedRdataNotUnknown_Expect_AssertionFail Task Ended"),UVM_NONE);
  endtask

  task When_arvalidAndArreadyAsserted_Then_within10ClkRvalidAsserted_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_arvalidAndArreadyAsserted_Then_within10ClkRvalidAsserted_Expect_AssertionPass Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      arready <= 1'b0;
      rvalid <=1'b0;
      rready <=1'b0;
      @(posedge aclk);
      arvalid <= 1'b1;
      arready <= 1'b1;
      araddr <= 32'h1122_3344;
      arprot <= 3'b000;
      @(posedge aclk);
      arvalid <= 1'b0;
      arready <= 1'b0;
      repeat(6) begin
        @(posedge aclk);
      end
      rvalid <= 1'b1;
      rready <= 1'b1;
      rdata <= 32'h1122_3344;
      rresp <= 2'b00;
      @(posedge aclk);
      rvalid <= 1'b0;
      rready <= 1'b0;
    `uvm_info(name,$sformatf("When_arvalidAndArreadyAsserted_Then_within10ClkRvalidAsserted_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_arvalidAndArreadyAsserted_Then_after10ClkRvalidAsserted_Expect_AssertionFail();
    `uvm_info(name,$sformatf("When_arvalidAndArreadyAsserted_Then_after10ClkRvalidAsserted_Expect_AssertionFail Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      arready <= 1'b0;
      rvalid <=1'b0;
      rready <=1'b0;
      @(posedge aclk);
      arvalid <= 1'b1;
      arready <= 1'b1;
      araddr <= 32'h1122_3344;
      arprot <= 3'b000;
      @(posedge aclk);
      arvalid <= 1'b0;
      arready <= 1'b0;
      repeat(12) begin
        @(posedge aclk);
      end
      rvalid <= 1'b1;
      rready <= 1'b1;
      rdata <= 32'h1122_3344;
      rresp <= 2'b00;
      @(posedge aclk);
      rvalid <= 1'b0;
      rready <= 1'b0;
    `uvm_info(name,$sformatf("When_arvalidAndArreadyAsserted_Then_after10ClkRvalidAsserted_Expect_AssertionFail Task Ended"),UVM_NONE);
  endtask

  task When_arvalidAndArreadyAsserted_Then_within10ClkRvalidAssertedAndRdataNotUnknown_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_arvalidAndArreadyAsserted_Then_within10ClkRvalidAssertedAndRdataNotUnknown_Expect_AssertionPass Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      arready <= 1'b0;
      rvalid <=1'b0;
      rready <=1'b0;
      @(posedge aclk);
      arvalid <= 1'b1;
      arready <= 1'b1;
      araddr <= 32'h1122_3344;
      arprot <= 3'b000;
      @(posedge aclk);
      arvalid <= 1'b0;
      arready <= 1'b0;
      repeat(6) begin
        @(posedge aclk);
      end
      rvalid <= 1'b1;
      rready <= 1'b1;
      rdata <= 32'h1122_3344;
      rresp <= 2'b00;
      @(posedge aclk);
      rvalid <= 1'b0;
      rready <= 1'b0;
    `uvm_info(name,$sformatf("When_arvalidAndArreadyAsserted_Then_within10ClkRvalidAssertedAndRdataNotUnknown_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_arvalidAndArreadyAsserted_Then_after10ClkRvalidAssertedAndRdataNotUnknown_Expect_AssertionFail();
    `uvm_info(name,$sformatf("When_arvalidAndArreadyAsserted_Then_after10ClkRvalidAssertedAndRdataNotUnknown_Expect_AssertionFail Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      arready <= 1'b0;
      rvalid <=1'b0;
      rready <=1'b0;
      @(posedge aclk);
      arvalid <= 1'b1;
      arready <= 1'b1;
      araddr <= 32'h1122_3344;
      arprot <= 3'b000;
      @(posedge aclk);
      arvalid <= 1'b0;
      arready <= 1'b0;
      repeat(12) begin
        @(posedge aclk);
      end
      rvalid <= 1'b1;
      rready <= 1'b1;
      rdata <= 32'h1122_3344;
      rresp <= 2'b00;
      @(posedge aclk);
      rvalid <= 1'b0;
      rready <= 1'b0;
    `uvm_info(name,$sformatf("When_arvalidAndArreadyAsserted_Then_after10ClkRvalidAssertedAndRdataNotUnknown_Expect_AssertionFail Task Ended"),UVM_NONE);
  endtask

  task When_rvalidAndRreadyAsserted_Then_ResponseIsNotExokay_Expect_AssertionPass();
    `uvm_info(name,$sformatf("When_rvalidAndRreadyAsserted_Then_ResponseIsNotExokay_Expect_AssertionPass Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      rvalid <= 1'b0;
      rready <= 1'b0;
      repeat(2) begin
        @(posedge aclk);
      end
      rvalid <= 1'b1;
      rready <= 1'b1;
      rresp <= 2'b00;
      @(posedge aclk);
      rvalid <= 1'b0;

    `uvm_info(name,$sformatf("When_rvalidAndRreadyAsserted_Then_ResponseIsNotExokay_Expect_AssertionPass Task Ended"),UVM_NONE);
  endtask

  task When_rvalidAndRreadyAsserted_Then_ResponseIsExokay_Expect_AssertionFail();
    `uvm_info(name,$sformatf("When_rvalidAndRreadyAsserted_Then_ResponseIsExokay_Expect_AssertionFail Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      rvalid <= 1'b0;
      rready <= 1'b0;
      repeat(2) begin
        @(posedge aclk);
      end
      rvalid <= 1'b1;
      rready <= 1'b1;
      rresp <= 2'b01;
      @(posedge aclk);
      rvalid <= 1'b0;

    `uvm_info(name,$sformatf("When_rvalidAndRreadyAsserted_Then_ResponseIsExokay_Expect_AssertionFail Task Ended"),UVM_NONE);
  endtask

endmodule : Axi4LiteMasterReadAssertPropertyTB

`endif


