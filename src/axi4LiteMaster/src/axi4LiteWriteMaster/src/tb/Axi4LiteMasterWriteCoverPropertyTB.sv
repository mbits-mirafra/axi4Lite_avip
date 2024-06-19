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
                                                                    .bready(bready));

  initial begin
    #3000;
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


  endmodule : Axi4LiteMasterWriteCoverPropertyTB

`endif


