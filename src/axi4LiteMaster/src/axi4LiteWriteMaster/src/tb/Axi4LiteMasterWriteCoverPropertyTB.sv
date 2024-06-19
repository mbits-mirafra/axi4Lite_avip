`ifndef AXI4LITEMASTERWRITECOVERPROPERTYTB_INCLUDED_
`define AXI4LITEMASTERWRITECOVERPROPERTYTB_INCLUDED_

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
  logic bresp;

  
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
                                                                    .wready(wready),
                                                                    .bvalid(bvalid),
                                                                    .bready(bready),
                                                                    .bresp(bresp));

  initial begin
    #10000;
    $finish;
  end

  initial begin
    When_awvalidIsAsserted_Then_awaddrIsNotUnknown();
    When_wvalidIsAsserted_Then_wdataIsNotUnknown();
    When_awvalidIsAsserted_Then_awaddrIsNotUnknownAndPrevious2ClkAwaddrIsUnknown();
    When_wvalidIsAsserted_Then_wdataIsNotUnknownAndPrevious2ClkWdataIsUnknown();
    When_awreadyIsLow_Then_awvalidIsAssertedAfter3Clk();
    When_wreadyIsLow_Then_wvalidIsAssertedAfter3Clk();
    When_breadyIsLow_Then_bvalidIsAssertedAfter3Clk();
    When_awreadyIsLow_Then_anyClkAwvalidIsAssertedThenAwreadyCanBeAssertAnyTime();
    When_wreadyIsLow_Then_anyClkWvalidIsAssertedThenWreadyCanBeAssertAnyTime();
    When_breadyIsLow_Then_anyClkBvalidIsAssertedThenBreadyCanBeAssertAnyTime();
    When_awvalidIsAsserted_Then_sameClkAwreadyIsAsserted();
    When_wvalidIsAsserted_Then_sameClkWreadyIsAsserted();
    When_bvalidIsAsserted_Then_sameClkBreadyIsAsserted();
    When_awvalidIsAsserted_Then_remainsHigh_NextClkAwreadyIsAsserted();
    When_wvalidIsAsserted_Then_remainsHigh_NextClkWreadyIsAsserted();
    When_bvalidIsAsserted_Then_remainsHigh_NextClkBreadyIsAsserted();
    When_awvalidIsAsserted_Then_remainsHigh_Then_Within1To16ClkAwreadyIsAsserted();
    When_wvalidIsAsserted_Then_remainsHigh_Then_Within1To16ClkWreadyIsAsserted();
    When_bvalidIsAsserted_Then_remainsHigh_Then_Within1To16ClkBreadyIsAsserted();
    When_awvalidIsAsserted_Then_remainsHigh_Then_awreadyIsAlwaysLow();
    When_wvalidIsAsserted_Then_remainsHigh_Then_wreadyIsAlwaysLow();
    When_bvalidIsAsserted_Then_remainsHigh_Then_breadyIsAlwaysLow();
    When_BackToBackAwvalidAndAwreadyAsserted_Then_noDelayInbetween2Transfer();
    When_BackToBackWvalidAndWreadyAsserted_Then_noDelayInbetween2Transfer();
    When_BackToBackBvalidAndBreadyAsserted_Then_noDelayInbetween2Transfer();
    When_BackToBackAwvalidAndAwreadyAsserted_Then_1ClkDelayInbetween2Transfer();
    When_BackToBackWvalidAndWreadyAsserted_Then_1ClkDelayInbetween2Transfer();
    When_BackToBackBvalidAndBreadyAsserted_Then_1ClkDelayInbetween2Transfer();
    When_BackToBackAwvalidAndAwreadyAsserted_Then_2ClkDelayInbetween2Transfer();
    When_BackToBackWvalidAndWreadyAsserted_Then_2ClkDelayInbetween2Transfer();
    When_BackToBackBvalidAndBreadyAsserted_Then_2ClkDelayInbetween2Transfer();
    When_BackToBackAwvalidAndAwreadyAsserted_Then_3To16ClkDelayInbetween2Transfer();
    When_BackToBackWvalidAndWreadyAsserted_Then_3To16ClkDelayInbetween2Transfer();
    When_BackToBackBvalidAndBreadyAsserted_Then_3To16ClkDelayInbetween2Transfer();
    When_BackToBackAwvalidAndAwreadyAsserted_Then_moreThan16ClkDelayInbetween2Transfer();
    When_BackToBackWvalidAndWreadyAsserted_Then_moreThan16ClkDelayInbetween2Transfer();
    When_BackToBackBvalidAndBreadyAsserted_Then_moreThan16ClkDelayInbetween2Transfer();
    When_awreadyNeedToAsserted_atleastOnce();
    When_wreadyNeedToAsserted_atleastOnce();
    When_breadyNeedToAsserted_atleastOnce();
    When_awreadyIsAsserted_Then_sameClkDeasserted();
    When_wreadyIsAsserted_Then_sameClkDeasserted();
    When_breadyIsAsserted_Then_sameClkDeasserted();
    When_awvalidIsAsserted_Then_nextClkAwreadyIsAsserted();
    When_wvalidIsAsserted_Then_nextClkWreadyIsAsserted();
    When_bvalidIsAsserted_Then_nextClkBreadyIsAsserted();
    When_awvalidIsAsserted_Then_inbetween2To5ClkAwreadyIsAsserted();
    When_wvalidIsAsserted_Then_inbetween2To5ClkWreadyIsAsserted();
    When_bvalidIsAsserted_Then_inbetween2To5ClkBreadyIsAsserted();
    When_awvalidIsAsserted_Then_within16ClkAwreadyIsAsserted();
    When_wvalidIsAsserted_Then_within16ClkWreadyIsAsserted();
    When_bvalidIsAsserted_Then_within16ClkBreadyIsAsserted();
    When_awreadyIsAssertedAndDeasserted_Then_nextClkAwvalidIsAsserted();
    When_wreadyIsAssertedAndDeasserted_Then_nextClkWvalidIsAsserted();
    When_breadyIsAssertedAndDeasserted_Then_nextClkBvalidIsAsserted();
   
    When_awreadyIsAssertedAndDeasserted3Times_Then_nextClkAwvalidIsAsserted();
    When_wreadyIsAssertedAndDeasserted3Times_Then_nextClkWvalidIsAsserted();
    When_breadyIsAssertedAndDeasserted3Times_Then_nextClkBvalidIsAsserted();

    When_awreadyIsAsserted_Then_nextClkAwvalidIsAsserted();
    When_wreadyIsAsserted_Then_nextClkWvalidIsAsserted();
    When_breadyIsAsserted_Then_nextClkBvalidIsAsserted();
    When_awreadyIsAsserted_Then_inbetween2To5ClkAwvalidIsAsserted();
    When_wreadyIsAsserted_Then_inbetween2To5ClkWvalidIsAsserted();
    When_breadyIsAsserted_Then_inbetween2To5ClkBvalidIsAsserted();
    When_awreadyIsAsserted_Then_anyClkAwvalidIsAsserted();
    When_wreadyIsAsserted_Then_anyClkWvalidIsAsserted();
    When_breadyIsAsserted_Then_anyClkBvalidIsAsserted();
    When_awreadyDefaultValueIs1AndTransferOccur_Then_SameClkAwreadyValueWillGoDefaultState();
    When_wreadyDefaultValueIs1AndTransferOccur_Then_SameClkWreadyValueWillGoDefaultState();
    When_breadyDefaultValueIs1AndTransferOccur_Then_SameClkBreadyValueWillGoDefaultState();
    When_awreadyDefaultValueIs0AndTransferOccur_Then_SameClkAwreadyValueWillGoDefaultState();
    When_wreadyDefaultValueIs0AndTransferOccur_Then_SameClkWreadyValueWillGoDefaultState();
    When_breadyDefaultValueIs0AndTransferOccur_Then_SameClkBreadyValueWillGoDefaultState();
    When_awreadyIsHighAndWritingValidAwaddrAndWdataOnSlaveLocation_Then_brespWillGiveOkayResponse();
    When_awvalidAwreadyWvalidWreadyAreAssertedSameClk_Then_NextClkBvalidIsAsserted();
    When_awvalidAwreadyAreAsserted_Then_nextClkWvalidWreadyAreAsserted_Then_nextClkBvalidIsAsserted();
    When_awvalidAwreadyAreAsserted_Then_nextClkWvalidWreadyAreAsserted_Then_inbetween1To16ClkBvalidIsAsserted();
    When_awvalidAwreadyAreAsserted_Then_anyClkWvalidWreadyAreAsserted_Then_anyClkBvalidIsAsserted();
    When_awvalidAwreadyAreAsserted_Then_anyClkWvalidWreadyAreAsserted_Then_BvalidIsLow();
end

  task When_awvalidIsAsserted_Then_awaddrIsNotUnknown();
    `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_awaddrIsNotUnknown Task started"),UVM_NONE);
      awvalid <= 1'b0;
      awaddr <= 32'bx;
      repeat(2) begin
      @(posedge aclk);
      end
      awvalid <= 1'b1;
      awaddr <= 32'h1122_3344;
    `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_awaddrIsNotUnknown Task Ended"),UVM_NONE);
  endtask

  task When_wvalidIsAsserted_Then_wdataIsNotUnknown();
    `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_wdataIsNotUnknown Task started"),UVM_NONE);
      wvalid <= 1'b0;
      wdata <= 32'bx;
      repeat(2) begin
      @(posedge aclk);
      end
      wvalid <= 1'b1;
      wdata <= 32'h2222_3333;
    `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_wdataIsNotUnknown Task Ended"),UVM_NONE);
  endtask

  task When_awvalidIsAsserted_Then_awaddrIsNotUnknownAndPrevious2ClkAwaddrIsUnknown();
    `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_awaddrIsNotUnknownAndPrevious2ClkAwaddrIsUnknown Task started"),UVM_NONE);
      awvalid <= 1'b0;
      awaddr <= 32'bx;
      repeat(3) begin
      @(posedge aclk);
      end
      awvalid <= 1'b1;
      awaddr <= 32'h1122_3344;
    `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_awaddrIsNotUnknownAndPrevious2ClkAwaddrIsUnknown Task Ended"),UVM_NONE);
  endtask

  task When_wvalidIsAsserted_Then_wdataIsNotUnknownAndPrevious2ClkWdataIsUnknown();
    `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_wdataIsNotUnknownAndPrevious2ClkWdataIsUnknown Task started"),UVM_NONE);
      wvalid <= 1'b0;
      wdata <= 32'bx;
      repeat(3) begin
      @(posedge aclk);
      end
      wvalid <= 1'b1;
      wdata <= 32'h2222_3333;
    `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_wdataIsNotUnknownAndPrevious2ClkWdataIsUnknown Task Ended"),UVM_NONE);
  endtask

  task When_awreadyIsLow_Then_awvalidIsAssertedAfter3Clk();
    `uvm_info(name,$sformatf("When_awreadyIsLow_Then_awvalidIsAssertedAfter3Clk Task started"),UVM_NONE);
      awvalid <= 1'b0;
      awready <= 1'b0;
      repeat(3) begin
      @(posedge aclk);
      end
      awvalid <= 1'b1;
    `uvm_info(name,$sformatf("When_awreadyIsLow_Then_awvalidIsAssertedAfter3Clk Task Ended"),UVM_NONE);
  endtask

  task When_wreadyIsLow_Then_wvalidIsAssertedAfter3Clk();
    `uvm_info(name,$sformatf("When_wreadyIsLow_Then_wvalidIsAssertedAfter3Clk Task started"),UVM_NONE);
      wvalid <= 1'b0;
      wready <= 1'b0;
      repeat(3) begin
      @(posedge aclk);
      end
      wvalid <= 1'b1;
    `uvm_info(name,$sformatf("When_wreadyIsLow_Then_wvalidIsAssertedAfter3Clk Task Ended"),UVM_NONE);
  endtask
 
  task When_breadyIsLow_Then_bvalidIsAssertedAfter3Clk();
    `uvm_info(name,$sformatf("When_breadyIsLow_Then_bvalidIsAssertedAfter3Clk Task started"),UVM_NONE);
      bvalid <= 1'b0;
      bready <= 1'b0;
      repeat(3) begin
      @(posedge aclk);
      end
      bvalid <= 1'b1;
    `uvm_info(name,$sformatf("When_breadyIsLow_Then_bvalidIsAssertedAfter3Clk Task Ended"),UVM_NONE);
  endtask
 
  task When_awreadyIsLow_Then_anyClkAwvalidIsAssertedThenAwreadyCanBeAssertAnyTime();
    `uvm_info(name,$sformatf("When_awreadyIsLow_Then_anyClkAwvalidIsAssertedThenAwreadyCanBeAssertAnyTime Task started"),UVM_NONE);
      awvalid <= 1'b0;
      awready <= 1'b0;
      repeat(4) begin
      @(posedge aclk);
      end
      awvalid <= 1'b1;
      repeat(2) begin
      @(posedge aclk);
      end
      awready <= 1'b1;
    `uvm_info(name,$sformatf("When_awreadyIsLow_Then_anyClkAwvalidIsAssertedThenAwreadyCanBeAssertAnyTime  Task Ended"),UVM_NONE);
  endtask

  task When_wreadyIsLow_Then_anyClkWvalidIsAssertedThenWreadyCanBeAssertAnyTime();
    `uvm_info(name,$sformatf("When_wreadyIsLow_Then_anyClkWvalidIsAssertedThenWreadyCanBeAssertAnyTime Task started"),UVM_NONE);
      wvalid <= 1'b0;
      wready <= 1'b0;
      repeat(4) begin
      @(posedge aclk);
      end
      wvalid <= 1'b1;
      repeat(2) begin
      @(posedge aclk);
      end
      wready <= 1'b1;
    `uvm_info(name,$sformatf("When_wreadyIsLow_Then_anyClkWvalidIsAssertedThenWreadyCanBeAssertAnyTime Task Ended"),UVM_NONE);
  endtask

  task When_breadyIsLow_Then_anyClkBvalidIsAssertedThenBreadyCanBeAssertAnyTime();
    `uvm_info(name,$sformatf("When_breadyIsLow_Then_anyClkBvalidIsAssertedThenBreadyCanBeAssertAnyTime Task started"),UVM_NONE);
      bvalid <= 1'b0;
      bready <= 1'b0;
      repeat(4) begin
      @(posedge aclk);
      end
      bvalid <= 1'b1;
      repeat(2) begin
      @(posedge aclk);
      end
      bready <= 1'b1;
    `uvm_info(name,$sformatf("When_breadyIsLow_Then_anyClkBvalidIsAssertedThenBreadyCanBeAssertAnyTime Task Ended"),UVM_NONE);
  endtask

 task When_awvalidIsAsserted_Then_sameClkAwreadyIsAsserted();
    `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_sameClkAwreadyIsAsserted Task started"),UVM_NONE);
      awvalid <= 1'b0;
      awready <= 1'b0;
      @(posedge aclk);
      awvalid <= 1'b1;
      awready <= 1'b1;
    `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_sameClkAwreadyIsAsserted Task Ended"),UVM_NONE);
 endtask

 task When_wvalidIsAsserted_Then_sameClkWreadyIsAsserted();
    `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_sameClkWreadyIsAsserted Task started"),UVM_NONE);
      wvalid <= 1'b0;
      wready <= 1'b0;
      @(posedge aclk);
      wvalid <= 1'b1;
      wready <= 1'b1;
    `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_sameClkWreadyIsAsserted Task Ended"),UVM_NONE);
 endtask

 task When_bvalidIsAsserted_Then_sameClkBreadyIsAsserted();
    `uvm_info(name,$sformatf("When_bvalidIsAsserted_Then_sameClkBreadyIsAsserted Task started"),UVM_NONE);
      bvalid <= 1'b0;
      bready <= 1'b0;
      @(posedge aclk);
      bvalid <= 1'b1;
      bready <= 1'b1;
    `uvm_info(name,$sformatf("When_bvalidIsAsserted_Then_sameClkBreadyIsAsserted Task Ended"),UVM_NONE);
 endtask

  task When_awvalidIsAsserted_Then_remainsHigh_NextClkAwreadyIsAsserted();
    `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_remainsHigh_NextClkAwreadyIsAsserted Task started"),UVM_NONE);
      awvalid <= 1'b0;
      awready <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      awvalid <= 1'b1;
      @(posedge aclk);
      awready <= 1'b1;
    `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_remainsHigh_NextClkAwreadyIsAsserted  Task Ended"),UVM_NONE);
  endtask

  task When_wvalidIsAsserted_Then_remainsHigh_NextClkWreadyIsAsserted();
    `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_remainsHigh_NextClkWreadyIsAsserted Task started"),UVM_NONE);
      wvalid <= 1'b0;
      wready <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      wvalid <= 1'b1;
      @(posedge aclk);
      wready <= 1'b1;
    `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_remainsHigh_NextClkWreadyIsAsserted  Task Ended"),UVM_NONE);
  endtask

  task When_bvalidIsAsserted_Then_remainsHigh_NextClkBreadyIsAsserted();
    `uvm_info(name,$sformatf("When_bvalidIsAsserted_Then_remainsHigh_NextClkBreadyIsAsserted Task started"),UVM_NONE);
      bvalid <= 1'b0;
      bready <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      bvalid <= 1'b1;
      @(posedge aclk);
      bready <= 1'b1;
    `uvm_info(name,$sformatf("When_bvalidIsAsserted_Then_remainsHigh_NextClkBreadyIsAsserted  Task Ended"),UVM_NONE);
  endtask

  task When_awvalidIsAsserted_Then_remainsHigh_Then_Within1To16ClkAwreadyIsAsserted();
   `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_remainsHigh_Then_Within1To16ClkAwreadyIsAsserted Task started"),UVM_NONE);
      awvalid <= 1'b0;
      awready <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      awvalid <= 1'b1;
      repeat(10) begin
      @(posedge aclk);
      end
      awready <= 1'b1;
    `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_remainsHigh_Then_Within1To16ClkAwreadyIsAsserted Task Ended"),UVM_NONE);
  endtask

 task When_wvalidIsAsserted_Then_remainsHigh_Then_Within1To16ClkWreadyIsAsserted();
   `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_remainsHigh_Then_Within1To16ClkWreadyIsAsserted Task started"),UVM_NONE);
      wvalid <= 1'b0;
      wready <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      wvalid <= 1'b1;
      repeat(10) begin
      @(posedge aclk);
      end
      wready <= 1'b1;
    `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_remainsHigh_Then_Within1To16ClkWreadyIsAsserted Task Ended"),UVM_NONE);
  endtask

 task When_bvalidIsAsserted_Then_remainsHigh_Then_Within1To16ClkBreadyIsAsserted();
   `uvm_info(name,$sformatf("When_bvalidIsAsserted_Then_remainsHigh_Then_Within1To16ClkBreadyIsAsserted Task started"),UVM_NONE);
      bvalid <= 1'b0;
      bready <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      bvalid <= 1'b1;
      repeat(10) begin
      @(posedge aclk);
      end
      bready <= 1'b1;
    `uvm_info(name,$sformatf("When_bvalidIsAsserted_Then_remainsHigh_Then_Within1To16ClkBreadyIsAsserted Task Ended"),UVM_NONE);
  endtask

  task When_awvalidIsAsserted_Then_remainsHigh_Then_awreadyIsAlwaysLow();
   `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_remainsHigh_Then_awreadyIsAlwaysLow Task started"),UVM_NONE);
      awvalid <= 1'b0;
      awready <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      awvalid <= 1'b1;
    `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_remainsHigh_Then_awreadyIsAlwaysLow  Task Ended"),UVM_NONE);
  endtask

  task When_wvalidIsAsserted_Then_remainsHigh_Then_wreadyIsAlwaysLow();
   `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_remainsHigh_Then_wreadyIsAlwaysLow Task started"),UVM_NONE);
      wvalid <= 1'b0;
      wready <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      wvalid <= 1'b1;
    `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_remainsHigh_Then_wreadyIsAlwaysLow  Task Ended"),UVM_NONE);
  endtask

  task When_bvalidIsAsserted_Then_remainsHigh_Then_breadyIsAlwaysLow();
   `uvm_info(name,$sformatf("When_bvalidIsAsserted_Then_remainsHigh_Then_breadyIsAlwaysLow Task started"),UVM_NONE);
      bvalid <= 1'b0;
      bready <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      bvalid <= 1'b1;
    `uvm_info(name,$sformatf("When_bvalidIsAsserted_Then_remainsHigh_Then_breadyIsAlwaysLow  Task Ended"),UVM_NONE);
  endtask

  task When_BackToBackAwvalidAndAwreadyAsserted_Then_noDelayInbetween2Transfer();
   `uvm_info(name,$sformatf("When_BackToBackAwvalidAndAwreadyAsserted_Then_noDelayInbetween2Transfer Task started"),UVM_NONE);
      awvalid <= 1'b0;
      awready <= 1'b0;
      @(posedge aclk);
      awvalid <= 1'b1;
      @(posedge aclk);
      awready <= 1'b1;
      repeat(2) begin
      @(posedge aclk);
      end
      awvalid <= 1'b0;
      awready <= 1'b0;
    `uvm_info(name,$sformatf("When_BackToBackAwvalidAndAwreadyAsserted_Then_noDelayInbetween2Transfer  Task Ended"),UVM_NONE);
  endtask

  task When_BackToBackWvalidAndWreadyAsserted_Then_noDelayInbetween2Transfer();
   `uvm_info(name,$sformatf("When_BackToBackWvalidAndWreadyAsserted_Then_noDelayInbetween2Transfer Task started"),UVM_NONE);
      wvalid <= 1'b0;
      wready <= 1'b0;
      @(posedge aclk);
      wvalid <= 1'b1;
      @(posedge aclk);
      wready <= 1'b1;
      repeat(2) begin
      @(posedge aclk);
      end
      wvalid <= 1'b0;
      wready <= 1'b0;
    `uvm_info(name,$sformatf("When_BackToBackWvalidAndWreadyAsserted_Then_noDelayInbetween2Transfer  Task Ended"),UVM_NONE);
  endtask

  task When_BackToBackBvalidAndBreadyAsserted_Then_noDelayInbetween2Transfer();
   `uvm_info(name,$sformatf("When_BackToBackBvalidAndBreadyAsserted_Then_noDelayInbetween2Transfer Task started"),UVM_NONE);
      bvalid <= 1'b0;
      bready <= 1'b0;
      @(posedge aclk);
      bvalid <= 1'b1;
      @(posedge aclk);
      bready <= 1'b1;
      repeat(2) begin
      @(posedge aclk);
      end
      bvalid <= 1'b0;
      bready <= 1'b0;
    `uvm_info(name,$sformatf("When_BackToBackBvalidAndBreadyAsserted_Then_noDelayInbetween2Transfer  Task Ended"),UVM_NONE);
  endtask

  task When_BackToBackAwvalidAndAwreadyAsserted_Then_1ClkDelayInbetween2Transfer();
   `uvm_info(name,$sformatf("When_BackToBackAwvalidAndAwreadyAsserted_Then_1ClkDelayInbetween2Transfer Task started"),UVM_NONE);
      awvalid <= 1'b0;
      awready <= 1'b0;
      @(posedge aclk);
      awvalid <= 1'b1;
      awready <= 1'b1;
      @(posedge aclk);
      awvalid <= 1'b0;
      awready <= 1'b0;
      @(posedge aclk);
      awvalid <= 1'b1;
      awready <= 1'b1;
    `uvm_info(name,$sformatf("When_BackToBackAwvalidAndAwreadyAsserted_Then_1ClkDelayInbetween2Transfer  Task Ended"),UVM_NONE);
  endtask

  task When_BackToBackWvalidAndWreadyAsserted_Then_1ClkDelayInbetween2Transfer();
   `uvm_info(name,$sformatf("When_BackToBackWvalidAndWreadyAsserted_Then_1ClkDelayInbetween2Transfer Task started"),UVM_NONE);
      wvalid <= 1'b0;
      wready <= 1'b0;
      @(posedge aclk);
      wvalid <= 1'b1;
      wready <= 1'b1;
      @(posedge aclk);
      wvalid <= 1'b0;
      wready <= 1'b0;
      @(posedge aclk);
      wvalid <= 1'b1;
      wready <= 1'b1;
    `uvm_info(name,$sformatf("When_BackToBackWvalidAndWreadyAsserted_Then_1ClkDelayInbetween2Transfer  Task Ended"),UVM_NONE);
  endtask

  task When_BackToBackBvalidAndBreadyAsserted_Then_1ClkDelayInbetween2Transfer();
   `uvm_info(name,$sformatf("When_BackToBackBvalidAndBreadyAsserted_Then_1ClkDelayInbetween2Transfer Task started"),UVM_NONE);
      bvalid <= 1'b0;
      bready <= 1'b0;
      @(posedge aclk);
      bvalid <= 1'b1;
      bready <= 1'b1;
      @(posedge aclk);
      bvalid <= 1'b0;
      bready <= 1'b0;
      @(posedge aclk);
      bvalid <= 1'b1;
      bready <= 1'b1;
    `uvm_info(name,$sformatf("When_BackToBackBvalidAndBreadyAsserted_Then_1ClkDelayInbetween2Transfer  Task Ended"),UVM_NONE);
  endtask
 
  task When_BackToBackAwvalidAndAwreadyAsserted_Then_2ClkDelayInbetween2Transfer();
   `uvm_info(name,$sformatf("When_BackToBackAwvalidAndAwreadyAsserted_Then_2ClkDelayInbetween2Transfer Task started"),UVM_NONE);
      awvalid <= 1'b0;
      awready <= 1'b0;
      @(posedge aclk);
      awvalid <= 1'b1;
      awready <= 1'b1;
      @(posedge aclk);
      awvalid <= 1'b0;
      awready <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      awvalid <= 1'b1;
      awready <= 1'b1;
    
    `uvm_info(name,$sformatf("When_BackToBackAwvalidAndAwreadyAsserted_Then_2ClkDelayInbetween2Transfer  Task Ended"),UVM_NONE);
  endtask

  task When_BackToBackWvalidAndWreadyAsserted_Then_2ClkDelayInbetween2Transfer();
   `uvm_info(name,$sformatf("When_BackToBackWvalidAndWreadyAsserted_Then_2ClkDelayInbetween2Transfer Task started"),UVM_NONE);
      wvalid <= 1'b0;
      wready <= 1'b0;
      @(posedge aclk);
      wvalid <= 1'b1;
      wready <= 1'b1;
      @(posedge aclk);
      wvalid <= 1'b0;
      wready <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      wvalid <= 1'b1;
      wready <= 1'b1;
    `uvm_info(name,$sformatf("When_BackToBackWvalidAndWreadyAsserted_Then_2ClkDelayInbetween2Transfer  Task Ended"),UVM_NONE);
  endtask

  task When_BackToBackBvalidAndBreadyAsserted_Then_2ClkDelayInbetween2Transfer();
   `uvm_info(name,$sformatf("When_BackToBackBvalidAndBreadyAsserted_Then_2ClkDelayInbetween2Transfer Task started"),UVM_NONE);
      bvalid <= 1'b0;
      bready <= 1'b0;
      @(posedge aclk);
      bvalid <= 1'b1;
      bready <= 1'b1;
      @(posedge aclk);
      bvalid <= 1'b0;
      bready <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      bvalid <= 1'b1;
      bready <= 1'b1;     
   `uvm_info(name,$sformatf("When_BackToBackBvalidAndBreadyAsserted_Then_2ClkDelayInbetween2Transfer  Task Ended"),UVM_NONE);
  endtask

 task When_BackToBackAwvalidAndAwreadyAsserted_Then_3To16ClkDelayInbetween2Transfer();
  `uvm_info(name,$sformatf("When_BackToBackAwvalidAndAwreadyAsserted_Then_3To16ClkDelayInbetween2Transfer Task started"),UVM_NONE);
      awvalid <= 1'b0;
      awready <= 1'b0;
      @(posedge aclk);
      awvalid <= 1'b1;
      awready <= 1'b1;
      @(posedge aclk);
      awvalid <= 1'b0;
      awready <= 1'b0;
      repeat(8) begin  //Delay We can give anything inbetween 3 to 16 
      @(posedge aclk);
      end
      awvalid <= 1'b1;
      awready <= 1'b1;
    `uvm_info(name,$sformatf("When_BackToBackAwvalidAndAwreadyAsserted_Then_3To16ClkDelayInbetween2Transfer  Task Ended"),UVM_NONE);
  endtask

  task When_BackToBackWvalidAndWreadyAsserted_Then_3To16ClkDelayInbetween2Transfer();
   `uvm_info(name,$sformatf("When_BackToBackWvalidAndWreadyAsserted_Then_3To16ClkDelayInbetween2Transfer Task started"),UVM_NONE);
      wvalid <= 1'b0;
      wready <= 1'b0;
      @(posedge aclk);
      wvalid <= 1'b1;
      wready <= 1'b1;
      @(posedge aclk);
      wvalid <= 1'b0;
      wready <= 1'b0;  
      repeat(8) begin //Delay We can give anything inbetween 3 to 16
      @(posedge aclk);
      end
      wvalid <= 1'b1;
      wready <= 1'b1;
    `uvm_info(name,$sformatf("When_BackToBackWvalidAndWreadyAsserted_Then_3To16ClkDelayInbetween2Transfer  Task Ended"),UVM_NONE);
  endtask

  task When_BackToBackBvalidAndBreadyAsserted_Then_3To16ClkDelayInbetween2Transfer();
   `uvm_info(name,$sformatf("When_BackToBackBvalidAndBreadyAsserted_Then_3To16ClkDelayInbetween2Transfer Task started"),UVM_NONE);
      bvalid <= 1'b0;
      bready <= 1'b0;
      @(posedge aclk);
      bvalid <= 1'b1;
      bready <= 1'b1;
      @(posedge aclk);
      bvalid <= 1'b0;
      bready <= 1'b0;
      repeat(8) begin //Delay We can give anything inbetween 3 to 16
      @(posedge aclk);
      end
      bvalid <= 1'b1;
      bready <= 1'b1;
    `uvm_info(name,$sformatf("When_BackToBackBvalidAndBreadyAsserted_Then_3To16ClkDelayInbetween2Transfer  Task Ended"),UVM_NONE);
  endtask

  task When_BackToBackAwvalidAndAwreadyAsserted_Then_moreThan16ClkDelayInbetween2Transfer();
  `uvm_info(name,$sformatf("When_BackToBackAwvalidAndAwreadyAsserted_Then_moreThan16ClkDelayInbetween2Transfer Task started"),UVM_NONE);
      awvalid <= 1'b0;
      awready <= 1'b0;
      @(posedge aclk);
      awvalid <= 1'b1;
      awready <= 1'b1;
      @(posedge aclk);
      awvalid <= 1'b0;
      awready <= 1'b0;
      repeat(18) begin  //Delay We can give anything like more than 16 
      @(posedge aclk);
      end
      awvalid <= 1'b1;
      awready <= 1'b1;
    `uvm_info(name,$sformatf("When_BackToBackAwvalidAndAwreadyAsserted_Then_moreThan16ClkDelayInbetween2Transfer  Task Ended"),UVM_NONE);
  endtask

  task When_BackToBackWvalidAndWreadyAsserted_Then_moreThan16ClkDelayInbetween2Transfer();
     `uvm_info(name,$sformatf("When_BackToBackWvalidAndWreadyAsserted_Then_moreThan16ClkDelayInbetween2Transfer Task started"),UVM_NONE);
      wvalid <= 1'b0;
      wready <= 1'b0;
      @(posedge aclk);
      wvalid <= 1'b1;
      wready <= 1'b1;
      @(posedge aclk);
      wvalid <= 1'b0;
      wready <= 1'b0;
      repeat(18) begin  //Delay We can give anything like more than 16 
      @(posedge aclk);
      end
      wvalid <= 1'b1;
      wready <= 1'b1;
    `uvm_info(name,$sformatf("When_BackToBackWvalidAndWreadyAsserted_Then_moreThan16ClkDelayInbetween2Transfer  Task Ended"),UVM_NONE);
  endtask

  task When_BackToBackBvalidAndBreadyAsserted_Then_moreThan16ClkDelayInbetween2Transfer();
   `uvm_info(name,$sformatf("When_BackToBackBvalidAndBreadyAsserted_Then_morethan16ClkDelayInbetween2Transfer Task started"),UVM_NONE);
      bvalid <= 1'b0;
      bready <= 1'b0;
      @(posedge aclk);
      bvalid <= 1'b1;
      bready <= 1'b1;
      @(posedge aclk);
      bvalid <= 1'b0;
      bready <= 1'b0;
      repeat(18) begin //Delay We can give anything like more than 16
      @(posedge aclk);
      end
      bvalid <= 1'b1;
      bready <= 1'b1;
    `uvm_info(name,$sformatf("When_BackToBackBvalidAndBreadyAsserted_Then_moreThan16ClkDelayInbetween2Transfer  Task Ended"),UVM_NONE);
  endtask

  task When_awreadyNeedToAsserted_atleastOnce();
  `uvm_info(name,$sformatf("When_awreadyNeedToAsserted_atleastOnce Task started"),UVM_NONE);
      awready <= 1'b0;
      @(posedge aclk);
      awready <= 1'b1;
    `uvm_info(name,$sformatf("When_awreadyNeedToAsserted_atleastOnce Task Ended"),UVM_NONE);
  endtask

 task When_wreadyNeedToAsserted_atleastOnce();
  `uvm_info(name,$sformatf("When_wreadyNeedToAsserted_atleastOnce Task started"),UVM_NONE);
      wready <= 1'b0;
      @(posedge aclk);
      wready <= 1'b1;
    `uvm_info(name,$sformatf("When_wreadyNeedToAsserted_atleastOnce Task Ended"),UVM_NONE);
 endtask

 task When_breadyNeedToAsserted_atleastOnce();
  `uvm_info(name,$sformatf("When_breadyNeedToAsserted_atleastOnce Task started"),UVM_NONE);
      bready <= 1'b0;
      @(posedge aclk);
      bready <= 1'b1;
    `uvm_info(name,$sformatf("When_breadyNeedToAsserted_atleastOnce Task Ended"),UVM_NONE);
  endtask

  task When_awreadyIsAsserted_Then_sameClkDeasserted();
  `uvm_info(name,$sformatf("When_awreadyIsAsserted_Then_sameClkDeasserted Task started"),UVM_NONE);
      awready <= 1'b0;
      @(posedge aclk);
      awready <= 1'b1;
      #2;
      awready <= 1'b0;
    `uvm_info(name,$sformatf("When_awreadyIsAsserted_Then_sameClkDeasserted Task Ended"),UVM_NONE);
  endtask

  task When_wreadyIsAsserted_Then_sameClkDeasserted();
  `uvm_info(name,$sformatf("When_wreadyIsAsserted_Then_sameClkDeasserted Task started"),UVM_NONE);
      wready <= 1'b0;
      @(posedge aclk);
      wready <= 1'b1;
      #2;
      wready <= 1'b0;
    `uvm_info(name,$sformatf("When_wreadyIsAsserted_Then_sameClkDeasserted Task Ended"),UVM_NONE);
  endtask

  task When_breadyIsAsserted_Then_sameClkDeasserted();
  `uvm_info(name,$sformatf("When_breadyIsAsserted_Then_sameClkDeasserted Task started"),UVM_NONE);
      bready <= 1'b0;
      @(posedge aclk);
      bready <= 1'b1;
      #2;
      bready <= 1'b0;
    `uvm_info(name,$sformatf("When_breadyIsAsserted_Then_sameClkDeasserted Task Ended"),UVM_NONE);
  endtask

  task When_awvalidIsAsserted_Then_nextClkAwreadyIsAsserted();
   `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_nextClkAwreadyIsAsserted Task started"),UVM_NONE);
      awvalid <= 1'b0;
      awready <= 1'b0;
      @(posedge aclk);
      awvalid <= 1'b1;
      @(posedge aclk);
      awready <= 1'b1;
    `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_nextClkAwreadyIsAsserted Task Ended"),UVM_NONE);
  endtask

  task When_wvalidIsAsserted_Then_nextClkWreadyIsAsserted();
   `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_nextClkWreadyIsAsserted Task started"),UVM_NONE);
      wvalid <= 1'b0;
      wready <= 1'b0;
      @(posedge aclk);
      wvalid <= 1'b1;
      @(posedge aclk);
      wready <= 1'b1;
    `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_nextClkWreadyIsAsserted Task Ended"),UVM_NONE);
  endtask

  task When_bvalidIsAsserted_Then_nextClkBreadyIsAsserted();
   `uvm_info(name,$sformatf("When_bvalidIsAsserted_Then_nextClkBreadyIsAsserted Task started"),UVM_NONE);
      bvalid <= 1'b0;
      bready <= 1'b0;
      @(posedge aclk);
      bvalid <= 1'b1;
      @(posedge aclk);
      bready <= 1'b1;
    `uvm_info(name,$sformatf("When_bvalidIsAsserted_Then_nextClkBreadyIsAsserted Task Ended"),UVM_NONE);
  endtask

  task When_awvalidIsAsserted_Then_inbetween2To5ClkAwreadyIsAsserted();
   `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_inbetween2To5ClkAwreadyIsAsserted Task started"),UVM_NONE);
      awvalid <= 1'b0;
      awready <= 1'b0;
      @(posedge aclk);
      awvalid <= 1'b1;
      repeat(3) begin
      @(posedge aclk);
      end
      awready <= 1'b1;
    `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_inbetween2To5ClkAwreadyIsAsserted Task Ended"),UVM_NONE);
  endtask
 
  task When_wvalidIsAsserted_Then_inbetween2To5ClkWreadyIsAsserted();
   `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_inbetween2To5ClkWreadyIsAsserted Task started"),UVM_NONE);
      wvalid <= 1'b0;
      wready <= 1'b0;
      @(posedge aclk);
      wvalid <= 1'b1;
      repeat(3) begin
      @(posedge aclk);
      end
      wready <= 1'b1;
    `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_inbetween2To5ClkWreadyIsAsserted Task Ended"),UVM_NONE);
  endtask
 
  task When_bvalidIsAsserted_Then_inbetween2To5ClkBreadyIsAsserted();
   `uvm_info(name,$sformatf("When_bvalidIsAsserted_Then_inbetween2To5ClkBreadyIsAsserted Task started"),UVM_NONE);
      bvalid <= 1'b0;
      bready <= 1'b0;
      @(posedge aclk);
      bvalid <= 1'b1;
      repeat(3) begin
      @(posedge aclk);
      end
      bready <= 1'b1;
    `uvm_info(name,$sformatf("When_bvalidIsAsserted_Then_inbetween2To5ClkBreadyIsAsserted Task Ended"),UVM_NONE);
  endtask

  task When_awvalidIsAsserted_Then_within16ClkAwreadyIsAsserted();
   `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_within16ClkAwreadyIsAsserted task started"),UVM_NONE);
      awvalid <= 1'b0;
      awready <= 1'b0;
      @(posedge aclk);
      awvalid <= 1'b1;
      repeat(10) begin //here instead of 10 we can give anything in between 1 to 16
      @(posedge aclk);
      end
      awready <= 1'b1;
    `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_within16ClkAwreadyIsAsserted task ended"),UVM_NONE);
  endtask

  task When_wvalidIsAsserted_Then_within16ClkWreadyIsAsserted();
   `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_within16ClkWreadyIsAsserted task started"),UVM_NONE);
    wvalid <= 1'b0;
    wready <= 1'b0;
    @(posedge aclk);
    wvalid <= 1'b1;
    repeat(10) begin //here instead of 10 we can give anything in between 1 to 16
    @(posedge aclk);
    end
    wready <= 1'b1;
    `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_within16ClkWreadyIsAsserted task ended"),UVM_NONE);
  endtask

  task When_bvalidIsAsserted_Then_within16ClkBreadyIsAsserted();
   `uvm_info(name,$sformatf("When_bvalidIsAsserted_Then_within16ClkBreadyIsAsserted task started"),UVM_NONE);
    bvalid <= 1'b0;
    bready <= 1'b0;
    @(posedge aclk);
    bvalid <= 1'b1;
    repeat(10) begin //here instead of 10 we can give anything in between 1 to 16
    @(posedge aclk);
    end
    bready <= 1'b1;
    `uvm_info(name,$sformatf("When_bvalidIsAsserted_Then_within16ClkBreadyIsAsserted task ended"),UVM_NONE);
  endtask

  task When_awreadyIsAssertedAndDeasserted_Then_nextClkAwvalidIsAsserted();
   `uvm_info(name,$sformatf("When_awreadyIsAssertedAndDeasserted_Then_nextClkAwvalidIsAsserted task started"),UVM_NONE);
      awvalid <= 1'b0;
      awready <= 1'b0;
      @(posedge aclk);
      awready <= 1'b1;
      @(posedge aclk);
      awready <= 1'b0;
      @(posedge aclk);
      awvalid <= 1'b1;
    `uvm_info(name,$sformatf("When_awreadyIsAssertedAndDeasserted_Then_nextClkAwvalidIsAsserted task ended"),UVM_NONE);
  endtask

  task When_wreadyIsAssertedAndDeasserted_Then_nextClkWvalidIsAsserted();
   `uvm_info(name,$sformatf("When_wreadyIsAssertedAndDeasserted_Then_nextClkWvalidIsAsserted task started"),UVM_NONE);
      wvalid <= 1'b0;
      wready <= 1'b0;
      @(posedge aclk);
      wready <= 1'b1;
      @(posedge aclk);
      wready <= 1'b0;
      @(posedge aclk);
      wvalid <= 1'b1;
    `uvm_info(name,$sformatf("When_wreadyIsAssertedAndDeasserted_Then_nextClkWvalidIsAsserted task ended"),UVM_NONE);
  endtask

   task When_breadyIsAssertedAndDeasserted_Then_nextClkBvalidIsAsserted();
   `uvm_info(name,$sformatf("When_breadyIsAssertedAndDeasserted_Then_nextClkBvalidIsAsserted task started"),UVM_NONE);
      bvalid <= 1'b0;
      bready <= 1'b0;
      @(posedge aclk);
      bready <= 1'b1;
      @(posedge aclk);
      bready <= 1'b0;
      @(posedge aclk);
      bvalid <= 1'b1;
    `uvm_info(name,$sformatf("When_breadyIsAssertedAndDeasserted_Then_nextClkBvalidIsAsserted task ended"),UVM_NONE);
  endtask


  task When_awreadyIsAssertedAndDeasserted3Times_Then_nextClkAwvalidIsAsserted();
   `uvm_info(name,$sformatf("When_awreadyIsAssertedAndDeasserted3Times_Then_nextClkAwvalidIsAsserted task started"),UVM_NONE);
      awvalid <= 1'b0;
      awready <= 1'b0;
      @(posedge aclk);
      awready <= 1'b1;
      @(posedge aclk);
      awready <= 1'b0;
      @(posedge aclk);
      awready <= 1'b1;
      @(posedge aclk);
      awready <= 1'b0;
      @(posedge aclk);
      awready <= 1'b1;
      @(posedge aclk);
      awready <= 1'b0;
      @(posedge aclk);
      awvalid <= 1'b1;
    `uvm_info(name,$sformatf("When_awreadyIsAssertedAndDeasserted3Times_Then_nextClkAwvalidIsAsserted task ended"),UVM_NONE);
  endtask

  task When_wreadyIsAssertedAndDeasserted3Times_Then_nextClkWvalidIsAsserted();
   `uvm_info(name,$sformatf("When_wreadyIsAssertedAndDeasserted3Times_Then_nextClkWvalidIsAsserted task started"),UVM_NONE);
      wvalid <= 1'b0;
      wready <= 1'b0;
      @(posedge aclk);
      wready <= 1'b1;
      @(posedge aclk);
      wready <= 1'b0;
      @(posedge aclk);
      wready <= 1'b1;
      @(posedge aclk);
      wready <= 1'b0;
      @(posedge aclk);
      wready <= 1'b1;
      @(posedge aclk);
      wready <= 1'b0;
      @(posedge aclk);
      wvalid <= 1'b1;
    `uvm_info(name,$sformatf("When_wreadyIsAssertedAndDeasserted3Times_Then_nextClkWvalidIsAsserted task ended"),UVM_NONE);
  endtask

  task When_breadyIsAssertedAndDeasserted3Times_Then_nextClkBvalidIsAsserted();
   `uvm_info(name,$sformatf("When_breadyIsAssertedAndDeasserted3Times_Then_nextClkBvalidIsAsserted task started"),UVM_NONE);
      bvalid <= 1'b0;
      bready <= 1'b0;
      @(posedge aclk);
      bready <= 1'b1;
      @(posedge aclk);
      bready <= 1'b0;
      @(posedge aclk);
      bready <= 1'b1;
      @(posedge aclk);
      bready <= 1'b0;
      @(posedge aclk);
      bready <= 1'b1;
      @(posedge aclk);
      bready <= 1'b0;
      @(posedge aclk);
      bvalid <= 1'b1;
    `uvm_info(name,$sformatf("When_breadyIsAssertedAndDeasserted3Times_Then_nextClkBvalidIsAsserted task ended"),UVM_NONE);
  endtask

  task When_awreadyIsAsserted_Then_nextClkAwvalidIsAsserted();
   `uvm_info(name,$sformatf("When_awreadyIsAsserted_Then_nextClkAwvalidIsAsserted task started"),UVM_NONE);
      awvalid <= 1'b0;
      awready <= 1'b0;
      @(posedge aclk);
      awready <= 1'b1;
      @(posedge aclk);
      awvalid <= 1'b1;
    `uvm_info(name,$sformatf("When_awreadyIsAsserted_Then_nextClkAwvalidIsAsserted task ended"),UVM_NONE);
  endtask

  task When_wreadyIsAsserted_Then_nextClkWvalidIsAsserted();
   `uvm_info(name,$sformatf("When_wreadyIsAsserted_Then_nextClkWvalidIsAsserted Task started"),UVM_NONE);
      wvalid <= 1'b0;
      wready <= 1'b0;
      @(posedge aclk);
      wready <= 1'b1;
      @(posedge aclk);
      wvalid <= 1'b1;
    `uvm_info(name,$sformatf("When_wreadyIsAsserted_Then_nextClkWvalidIsAsserted task ended"),UVM_NONE);
  endtask

  task When_breadyIsAsserted_Then_nextClkBvalidIsAsserted();
   `uvm_info(name,$sformatf("When_breadyIsAsserted_Then_nextClkBvalidIsAsserted Task started"),UVM_NONE);
      bvalid <= 1'b0;
      bready <= 1'b0;
      @(posedge aclk);
      bready <= 1'b1;
      @(posedge aclk);
      bvalid <= 1'b1;
    `uvm_info(name,$sformatf("When_breadyIsAsserted_Then_nextClkBvalidIsAsserted task ended"),UVM_NONE);
  endtask

  task When_awreadyIsAsserted_Then_inbetween2To5ClkAwvalidIsAsserted();
   `uvm_info(name,$sformatf("When_awreadyIsAsserted_Then_inbetween2To5ClkAwvalidIsAsserted task started"),UVM_NONE);
      awvalid <= 1'b0;
      awready <= 1'b0;
      @(posedge aclk);
      awready <= 1'b1;
      repeat(3) begin //Here inbetween 2 to 5 anyvalue you can give
      @(posedge aclk);
      end
      awvalid <= 1'b1;
    `uvm_info(name,$sformatf("When_awreadyIsAsserted_Then_inbetween2To5ClkAwvalidIsAsserted task ended"),UVM_NONE);
  endtask

  task When_wreadyIsAsserted_Then_inbetween2To5ClkWvalidIsAsserted();
   `uvm_info(name,$sformatf("When_wreadyIsAsserted_Then_inbetween2To5ClkWvalidIsAsserted task started"),UVM_NONE);
      wvalid <= 1'b0;
      wready <= 1'b0;
      @(posedge aclk);
      wready <= 1'b1;
      repeat(3) begin //Here inbetween 2 to 5 anyvalue you can give
      @(posedge aclk);
      end
      wvalid <= 1'b1;
    `uvm_info(name,$sformatf("When_wreadyIsAsserted_Then_inbetween2To5ClkWvalidIsAsserted task ended"),UVM_NONE);
  endtask

  task When_breadyIsAsserted_Then_inbetween2To5ClkBvalidIsAsserted();
   `uvm_info(name,$sformatf("When_breadyIsAsserted_Then_inbetween2To5ClkBvalidIsAsserted task started"),UVM_NONE);
      bvalid <= 1'b0;
      bready <= 1'b0;
      @(posedge aclk);
      bready <= 1'b1;
      repeat(3) begin //Here inbetween 2 to 5 anyvalue you can give
      @(posedge aclk);
      end
      bvalid <= 1'b1;
    `uvm_info(name,$sformatf("When_breadyIsAsserted_Then_inbetween2To5ClkBvalidIsAsserted task ended"),UVM_NONE);
  endtask

    task When_awreadyIsAsserted_Then_anyClkAwvalidIsAsserted();
   `uvm_info(name,$sformatf("When_awreadyIsAsserted_Then_anyClkAwvalidIsAsserted task started"),UVM_NONE);
      awvalid <= 1'b0;
      awready <= 1'b0;
      @(posedge aclk);
      awready <= 1'b1;
      repeat(5) begin //Here anyvalue you can give example 5
      @(posedge aclk);
      end
      awvalid <= 1'b1;
    `uvm_info(name,$sformatf("When_awreadyIsAsserted_Then_anyClkAwvalidIsAsserted task ended"),UVM_NONE);
  endtask

  task When_wreadyIsAsserted_Then_anyClkWvalidIsAsserted();
   `uvm_info(name,$sformatf("When_wreadyIsAsserted_Then_anyClkWvalidIsAsserted task started"),UVM_NONE);
      wvalid <= 1'b0;
      wready <= 1'b0;
      @(posedge aclk);
      wready <= 1'b1;
      repeat(5) begin //Here anyvalue you can give example 5
      @(posedge aclk);
      end
      wvalid <= 1'b1;
    `uvm_info(name,$sformatf("When_wreadyIsAsserted_Then_anyClkWvalidIsAsserted task ended"),UVM_NONE);
  endtask

    task When_breadyIsAsserted_Then_anyClkBvalidIsAsserted();
   `uvm_info(name,$sformatf("When_breadyIsAsserted_Then_anyClkBvalidIsAsserted task started"),UVM_NONE);
      bvalid <= 1'b0;
      bready <= 1'b0;
      @(posedge aclk);
      bready <= 1'b1;
      repeat(5) begin //Here anyvalue you can give example 5
      @(posedge aclk);
      end
      bvalid <= 1'b1;
    `uvm_info(name,$sformatf("When_breadyIsAsserted_Then_anyClkBvalidIsAsserted task ended"),UVM_NONE);
  endtask

   

  task When_awreadyDefaultValueIs1AndTransferOccur_Then_SameClkAwreadyValueWillGoDefaultState();
   `uvm_info(name,$sformatf("When_awreadyDefaultValueIs1AndTransferOccur_Then_SameClkAwreadyValueWillGoDefaultState"),UVM_NONE);
      awvalid <= 1'b0;
      awready <= 1'b1;
      @(posedge aclk);
      awready <= 1'b0;
      @(posedge aclk);
      awready <= 1'b1;
      awvalid <= 1'b1;
      @(posedge aclk);
      awvalid <= 1'b0;
    `uvm_info(name,$sformatf("When_awreadyIsAsserted_Then_anyClkAwvalidIsAsserted task ended"),UVM_NONE);
  endtask

  task When_wreadyDefaultValueIs1AndTransferOccur_Then_SameClkWreadyValueWillGoDefaultState();
   `uvm_info(name,$sformatf("When_wreadyDefaultValueIs1AndTransferOccur_Then_SameClkWreadyValueWillGoDefaultState task started"),UVM_NONE);
      wvalid <= 1'b0;
      wready <= 1'b1;
      @(posedge aclk);
      wready <= 1'b0;
      @(posedge aclk);
      wready <= 1'b1;
      wvalid <= 1'b1;
      @(posedge aclk);
      wvalid <= 1'b0;
    `uvm_info(name,$sformatf("When_wreadyDefaultValueIs1AndTransferOccur_Then_SameClkWreadyValueWillGoDefaultState task ended"),UVM_NONE);
  endtask

  task When_breadyDefaultValueIs1AndTransferOccur_Then_SameClkBreadyValueWillGoDefaultState();
   `uvm_info(name,$sformatf("When_breadyDefaultValueIs1AndTransferOccur_Then_SameClkBreadyValueWillGoDefaultState task started"),UVM_NONE);
      bvalid <= 1'b0;
      bready <= 1'b1;
      @(posedge aclk);
      bready <= 1'b0;
      @(posedge aclk);
      bready <= 1'b1;
      bvalid <= 1'b1;
      @(posedge aclk);
      bvalid <= 1'b0;
    `uvm_info(name,$sformatf("When_breadyDefaultValueIs1AndTransferOccur_Then_SameClkBreadyValueWillGoDefaultState task ended"),UVM_NONE);
  endtask

  task When_awreadyDefaultValueIs0AndTransferOccur_Then_SameClkAwreadyValueWillGoDefaultState();
   `uvm_info(name,$sformatf("When_awreadyDefaultValueIs0AndTransferOccur_Then_SameClkAwreadyValueWillGoDefaultState task started"),UVM_NONE);
      awvalid <= 1'b0;
      awready <= 1'b0;
      @(posedge aclk);
      awready <= 1'b1;
      awvalid <= 1'b1;
      @(posedge aclk);
      awvalid <= 1'b0;
    `uvm_info(name,$sformatf("When_awreadyDefaultValueIs0AndTransferOccur_Then_SameClkAwreadyValueWillGoDefaultState task ended"),UVM_NONE);
  endtask

  task When_wreadyDefaultValueIs0AndTransferOccur_Then_SameClkWreadyValueWillGoDefaultState();
   `uvm_info(name,$sformatf("When_wreadyDefaultValueIs0AndTransferOccur_Then_SameClkWreadyValueWillGoDefaultState task started"),UVM_NONE);
      wvalid <= 1'b0;
      wready <= 1'b0;
      @(posedge aclk);
      wready <= 1'b1;
      wvalid <= 1'b1;
      @(posedge aclk);
      wvalid <= 1'b0;
    `uvm_info(name,$sformatf("When_wreadyDefaultValueIs0AndTransferOccur_Then_SameClkWreadyValueWillGoDefaultState task ended"),UVM_NONE);
  endtask

  task When_breadyDefaultValueIs0AndTransferOccur_Then_SameClkBreadyValueWillGoDefaultState();
   `uvm_info(name,$sformatf("When_breadyDefaultValueIs0AndTransferOccur_Then_SameClkBreadyValueWillGoDefaultState task started"),UVM_NONE);
      bvalid <= 1'b0;
      bready <= 1'b0;
      @(posedge aclk);
      bready <= 1'b1;
      bvalid <= 1'b1;
      @(posedge aclk);
      bvalid <= 1'b0;
    `uvm_info(name,$sformatf("When_breadyDefaultValueIs0AndTransferOccur_Then_SameClkBreadyValueWillGoDefaultState task ended"),UVM_NONE);
  endtask

 task When_awreadyIsHighAndWritingValidAwaddrAndWdataOnSlaveLocation_Then_brespWillGiveOkayResponse();
   `uvm_info(name,$sformatf("When_awreadyIsHighAndWritingValidAwaddrAndWdataOnSlaveLocation_Then_brespWillGiveOkayResponse task started"),UVM_NONE);
      awvalid <= 1'b0;
      awready <= 1'b0;
      awaddr  <= 32'b0;
      wvalid  <= 1'b0;
      wready  <= 1'b0;
      wdata   <= 32'b0;
      bvalid  <= 1'b0;
      bready  <= 1'b0;
      @(posedge aclk);
      awvalid <= 1'b1;
      awready <= 1'b1;
      awaddr  <= 32'h1234_5678;
      @(posedge aclk);
      wvalid  <= 1'b1;
      wready  <= 1'b1;
      wdata   <= 32'h1122_3344;
      @(posedge aclk);
      bvalid  <= 1'b1;
      bready  <= 1'b1;
      bresp   <= 2'b00;
    `uvm_info(name,$sformatf("When_awreadyIsHighAndWritingValidAwaddrAndWdataOnSlaveLocation_Then_brespWillGiveOkayResponse task ended"),UVM_NONE);
  endtask

  task When_awvalidAwreadyWvalidWreadyAreAssertedSameClk_Then_NextClkBvalidIsAsserted();
  `uvm_info(name,$sformatf("When_awvalidAwreadyWvalidWreadyAreAssertedSameClk_Then_NextClkBvalidIsAsserted task started"),UVM_NONE);
      awvalid <= 1'b0;
      awready <= 1'b0;
      wvalid  <= 1'b0;
      wready  <= 1'b0;
      bvalid  <= 1'b0;
      @(posedge aclk);
      awvalid <= 1'b1;
      awready <= 1'b1;
      wvalid  <= 1'b1;
      wready  <= 1'b1;
      @(posedge aclk);
      bvalid  <= 1'b1;
    `uvm_info(name,$sformatf("When_awvalidAwreadyWvalidWreadyAreAssertedSameClk_Then_NextClkBvalidIsAsserted task ended"),UVM_NONE);
  endtask

  task When_awvalidAwreadyAreAsserted_Then_nextClkWvalidWreadyAreAsserted_Then_nextClkBvalidIsAsserted();
  `uvm_info(name,$sformatf("When_awvalidAwreadyAreAsserted_Then_nextClkWvalidWreadyAreAsserted_Then_nextClkBvalidIsAsserted task started"),UVM_NONE);
      awvalid <= 1'b0;
      awready <= 1'b0;
      wvalid  <= 1'b0;
      wready  <= 1'b0;
      bvalid  <= 1'b0;
      @(posedge aclk);
      awvalid <= 1'b1;
      awready <= 1'b1;
      @(posedge aclk);
      wvalid  <= 1'b1;
      wready  <= 1'b1;
      @(posedge aclk);
      bvalid  <= 1'b1;
    `uvm_info(name,$sformatf("When_awvalidAwreadyAreAsserted_Then_nextClkWvalidWreadyAreAsserted_Then_nextClkBvalidIsAsserted task ended"),UVM_NONE);
  endtask

  task When_awvalidAwreadyAreAsserted_Then_nextClkWvalidWreadyAreAsserted_Then_inbetween1To16ClkBvalidIsAsserted();
  `uvm_info(name,$sformatf("When_awvalidAwreadyAreAsserted_Then_nextClkWvalidWreadyAreAsserted_Then_inbetween1To16ClkBvalidIsAsserted task started"),UVM_NONE);
      awvalid <= 1'b0;
      awready <= 1'b0;
      wvalid  <= 1'b0;
      wready  <= 1'b0;
      bvalid  <= 1'b0;
      @(posedge aclk);
      awvalid <= 1'b1;
      awready <= 1'b1;
      @(posedge aclk);
      wvalid  <= 1'b1;
      wready  <= 1'b1;
      repeat(12) begin //Here inbetween 1 to 16 clk you can give anything example 12
      @(posedge aclk);
      end
      bvalid  <= 1'b1;
    `uvm_info(name,$sformatf("When_awvalidAwreadyAreAsserted_Then_nextClkWvalidWreadyAreAsserted_Then_inbetween1To16ClkBvalidIsAsserted task ended"),UVM_NONE);
  endtask

  task When_awvalidAwreadyAreAsserted_Then_anyClkWvalidWreadyAreAsserted_Then_anyClkBvalidIsAsserted();
  `uvm_info(name,$sformatf("When_awvalidAwreadyAreAsserted_Then_anyClkWvalidWreadyAreAsserted_Then_anyClkBvalidIsAsserted task started"),UVM_NONE);
      awvalid <= 1'b0;
      awready <= 1'b0;
      wvalid  <= 1'b0;
      wready  <= 1'b0;
      bvalid  <= 1'b0;
      @(posedge aclk);
      awvalid <= 1'b1;
      awready <= 1'b1;
      repeat(10) begin //Here inbetween 1 to 16 clk you can give anything example 10
      @(posedge aclk);
      end
      wvalid  <= 1'b1;
      wready  <= 1'b1;
      repeat(14) begin //Here inbetween 1 to 16 clk you can give anything example 14
      @(posedge aclk);
      end
      bvalid  <= 1'b1;
    `uvm_info(name,$sformatf("When_awvalidAwreadyAreAsserted_Then_anyClkWvalidWreadyAreAsserted_Then_anyClkBvalidIsAsserted Task  ended"),UVM_NONE);
  endtask

 task When_awvalidAwreadyAreAsserted_Then_anyClkWvalidWreadyAreAsserted_Then_BvalidIsLow();
  `uvm_info(name,$sformatf("When_awvalidAwreadyAreAsserted_Then_anyClkWvalidWreadyAreAsserted_Then_BvalidIsLow task started"),UVM_NONE);
      awvalid <= 1'b0;
      awready <= 1'b0;
      wvalid  <= 1'b0;
      wready  <= 1'b0;
      bvalid  <= 1'b0;
      @(posedge aclk);
      awvalid <= 1'b1;
      awready <= 1'b1;
      repeat(10) begin //Here inbetween 1 to 16 clk you can give anything example 10
      @(posedge aclk);
      end
      wvalid  <= 1'b1;
      wready  <= 1'b1;
    `uvm_info(name,$sformatf("When_awvalidAwreadyAreAsserted_Then_anyClkWvalidWreadyAreAsserted_Then_BvalidIsLow Task  ended"),UVM_NONE);
  endtask
 
  endmodule : Axi4LiteMasterWriteCoverPropertyTB

`endif


