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

  Axi4LiteMasterWriteCoverProperty Axi4LiteMasterWriteCoverPropertys(.aclk(aclk),
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

  initial begin
    When_awvalidIsAsserted_Then_awaddrIsNotUnknownAndPrevious1ClkAwaddrIsUnknown();
    When_awvalidIsAsserted_Then_awprotIsNotUnknownAndPrevious1ClkAwprotIsUnknown();
    When_wvalidIsAsserted_Then_wdataIsNotUnknownAndPrevious1ClkWdataIsUnknown();
    When_wvalidIsAsserted_Then_wstrbIsNotUnknownAndPrevious1ClkWstrbIsUnknown();
    When_bvalidIsAsserted_Then_brespIsNotUnknownAndPrevious1ClkBrespIsUnknown();
    When_awvalidIsAsserted_Then_awaddrIsNotUnknownAndPrevious2ClkAwaddrIsUnknown();
    When_awvalidIsAsserted_Then_awprotIsNotUnknownAndPrevious2ClkAwprotIsUnknown();
    When_wvalidIsAsserted_Then_wdataIsNotUnknownAndPrevious2ClkWdataIsUnknown();
    When_wvalidIsAsserted_Then_wstrbIsNotUnknownAndPrevious2ClkWstrbIsUnknown();
    When_bvalidIsAsserted_Then_brespIsNotUnknownAndPrevious2ClkBrespIsUnknown();
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
    When_awreadyIsAsserted_Then_inbetween1To15ClkAwvalidIsAsserted();
    When_wreadyIsAsserted_Then_inbetween1To15ClkWvalidIsAsserted();
    When_breadyIsAsserted_Then_inbetween1To15ClkBvalidIsAsserted();
    When_awreadyDefaultValueIs1AndTransferOccur_Then_nextClkAwreadyValueWillGoDefaultState();
    When_wreadyDefaultValueIs1AndTransferOccur_Then_nextClkWreadyValueWillGoDefaultState();
    When_breadyDefaultValueIs1AndTransferOccur_Then_nextClkBreadyValueWillGoDefaultState();
    When_awreadyDefaultValueIs0AndTransferOccur_Then_nextClkAwreadyValueWillGoDefaultState();
    When_wreadyDefaultValueIs0AndTransferOccur_Then_nextClkWreadyValueWillGoDefaultState();
    When_awreadyIsHighAndWritingValidAwaddrAndWdataOnSlaveLocation_Then_brespWillGiveOkayResponse();
    When_awvalidAwreadyWvalidWreadyAreAssertedSameClk_Then_NextClkBvalidIsAsserted();
    When_awvalidAwreadyAreAsserted_Then_nextClkWvalidWreadyAreAsserted_Then_nextClkBvalidIsAsserted();
    When_awvalidAwreadyAreAsserted_Then_nextClkWvalidWreadyAreAsserted_Then_inbetween1To12ClkBvalidIsAsserted();
    When_awvalidAwreadyAreAsserted_Then_inbetween1To10ClkWvalidWreadyAreAsserted_Then_inbetween1To12ClkBvalidIsAsserted();
    When_awaddrIsAsserted_Then_sameClkWdataIsAsserted();
    When_awaddrIsAsserted_Then_sameClkWdataIsAssertedButWdataIsUnknownValue();
    When_awaddrIsAsserted_Then_sameClkWdataIsAssertedButWvalidIsLow();
    When_awaddrIsAsserted_Then_nextClkWdataIsAsserted();
    When_awaddrIsAsserted_Then_inbetween1To10ClkWdataIsAsserted();
    When_wdataIsAsserted_Then_nextClkAwaddrIsAsserted();
    When_wdataIsAsserted_Then_inbetween1To10ClkAwaddrIsAsserted();
    When_awvalidIsAsserted_Then_nextClkAwreadyAndWreadyAreAsserted();
    When_awvalidIsAsserted_Then_inbetween1To15ClkAwreadyAndWreadyAreAsserted();
    When_awvalidIsAsserted_Then_sameClkAwreadyAndWreadyAreAsserted();
    When_awvalidIsAsserted_Then_awreadyAndWreadyAreLow();
    When_awvalidAndAwreadyAreAsserted_Then_wreadyIsLow();
    When_awvalidAndWreadyAreAsserted_Then_awreadyIsLow();
    When_awreadyIsAsserted_Then_nextClkWvalidIsAsserted();
    When_awreadyIsAsserted_Then_inbetween1To10ClkWvalidIsAsserted();
    When_awreadyIsAsserted_Then_sameClkWvalidIsAsserted();
    When_awreadyIsAsserted_Then_nextClkAwvalidAndWvalidAreAsserted();
    When_awreadyIsAsserted_Then_inbetween1To16ClkAwvalidAndWvalidAreAsserted();
    When_awreadyIsAsserted_Then_sameClkAwvalidAndWvalidAreAsserted();
    When_wvalidIsAsserted_Then_nextClkAwreadyIsAsserted(); 
    When_wvalidIsAsserted_Then_inbetween1To16ClkAwreadyIsAsserted(); 
    When_awvalidIsAsserted_Then_nextClkAwreadyIsAsserted_Then_nextClkWvalidIsAsserted();
    When_wvalidIsAsserted_Then_nextClkAwvalidIsAsserted();
    When_wvalidIsAsserted_Then_inbetween1To16ClkAwvalidIsAsserted();
    When_wvalidIsAsserted_Then_sameClkAwvalidIsAsserted();
    When_awvalidIsAsserted_Then_nextClkWvalidIsAsserted();
    When_awvalidIsAsserted_Then_inbetween1To10ClkWvalidIsAsserted();
    When_wvalidIsAsserted_Then_nextClkAwreadyAndWreadyAreAsserted();
    When_wvalidIsAsserted_Then_inbetween1To16ClkAwreadyAndWreadyAreAsserted();
    When_wvalidIsAsserted_Then_sameClkAwreadyAndWreadyAreAsserted();
    When_wvalidIsAsserted_Then_awreadyAndWreadyAreLow();
    When_wvalidAndAwreadyAreAsserted_Then_wreadyIsLow();
    When_wvalidAndWreadyAreAsserted_Then_awreadyIsLow();
    When_wvalidAndWreadyAreAsserted_Then_wstrbOfL3AndL2AreAsserted();
    When_wvalidAndWreadyAreAsserted_Then_wstrbOfL1AndL0AreAsserted();
    When_wvalidAndWreadyAreAsserted_Then_wstrbValueIsAllOnes_Then_wdataIsNotUnknown();
    When_wvalidAndWreadyAreAsserted_Then_sameClkWstrbIsActiveByte_Then_inbetween1To15ClkWdataIsPreviousValues();
end

  task When_awvalidIsAsserted_Then_awaddrIsNotUnknownAndPrevious1ClkAwaddrIsUnknown();
    `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_awaddrIsNotUnknownAndPrevious1ClkAwaddrIsUnknown Task started"),UVM_NONE);
      @(posedge aclk);  
      aresetn <= 1'b1;
      awvalid <= 1'b0;
      awaddr  <= 32'hxxxx_xxxx;
      repeat(1) begin
      @(posedge aclk);
      end
      awvalid <= 1'b1;
      awaddr  <= 32'h2222_1234;
    `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_awaddrIsNotUnknownAndPrevious1ClkAwaddrIsUnknown Task Ended"),UVM_NONE);
  endtask

  task When_awvalidIsAsserted_Then_awprotIsNotUnknownAndPrevious1ClkAwprotIsUnknown();
    `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_awprotIsNotUnknownAndPrevious1ClkAwprotIsUnknown Task started"),UVM_NONE);
      @(posedge aclk);  
      aresetn <= 1'b1;
      awvalid <= 1'b0;
      awprot  <= 3'bxxx;
      repeat(1) begin
      @(posedge aclk);
      end
      awvalid <= 1'b1;
      awprot  <= 3'b111;
    `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_awprotIsNotUnknownAndPrevious1ClkAwprotIsUnknown Task Ended"),UVM_NONE);
  endtask
   
  task When_wvalidIsAsserted_Then_wdataIsNotUnknownAndPrevious1ClkWdataIsUnknown();
    `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_wdataIsNotUnknownAndPrevious1ClkWdataIsUnknown Task started"),UVM_NONE);
      @(posedge aclk);  
      aresetn<= 1'b1;
      wvalid <= 1'b0;
      wdata  <= 32'hxxxx_xxxx;
      repeat(1) begin
      @(posedge aclk);
      end
      wvalid <= 1'b1;
      wdata  <= 32'h2222_3333;
    `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_wdataIsNotUnknownAndPrevious1ClkWdataIsUnknown Task Ended"),UVM_NONE);
  endtask
    
  task When_wvalidIsAsserted_Then_wstrbIsNotUnknownAndPrevious1ClkWstrbIsUnknown();
    `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_wstrbIsNotUnknownAndPrevious1ClkWstrbIsUnknown Task started"),UVM_NONE);
      @(posedge aclk);  
      aresetn<= 1'b1;
      wvalid <= 1'b0;
      wstrb  <= 4'bxxxx;
      repeat(1) begin
      @(posedge aclk);
      end
      wvalid <= 1'b1;
      wstrb  <= 4'b1111;
    `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_wstrbIsNotUnknownAndPrevious1ClkWstrbIsUnknown Task Ended"),UVM_NONE);
  endtask

    task When_bvalidIsAsserted_Then_brespIsNotUnknownAndPrevious1ClkBrespIsUnknown();
      `uvm_info(name,$sformatf("When_bvalidIsAsserted_Then_BrespIsNotUnknownAndPrevious1ClkBrespIsUnknown Task started"),UVM_NONE);
      aresetn <= 1'b1;
      bvalid <= 1'b0;
      bresp  <= 2'bxx;
      repeat(1) begin
      @(posedge aclk);
      end
      bvalid <= 1'b1;
      bresp  <= 2'b00;
      repeat(1) begin
       @(posedge aclk);
      end
      bvalid <= 1'b0;
     `uvm_info(name,$sformatf("When_bvalidIsAsserted_Then_BrespIsNotUnknownAndPrevious1ClkBrespIsUnknown Task Ended"),UVM_NONE); 
   endtask

  task When_awvalidIsAsserted_Then_awaddrIsNotUnknownAndPrevious2ClkAwaddrIsUnknown();
    `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_awaddrIsNotUnknownAndPrevious2ClkAwaddrIsUnknown Task started"),UVM_NONE);
      @(posedge aclk);  
      aresetn <= 1'b1;
      awvalid <= 1'b0;
      awaddr  <= 32'hxxxx_xxxx;
      repeat(2) begin
      @(posedge aclk);
      end
      awvalid <= 1'b1;
      awaddr  <= 32'h2222_1234;
    `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_awaddrIsNotUnknownAndPrevious2ClkAwaddrIsUnknown Task Ended"),UVM_NONE);
  endtask

  task When_awvalidIsAsserted_Then_awprotIsNotUnknownAndPrevious2ClkAwprotIsUnknown();
    `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_awprotIsNotUnknownAndPrevious2ClkAwprotIsUnknown Task started"),UVM_NONE);
      @(posedge aclk);  
      aresetn <= 1'b1;
      awvalid <= 1'b0;
      awprot  <= 3'bxxx;
      repeat(2) begin
      @(posedge aclk);
      end
      awvalid <= 1'b1;
      awprot  <= 3'b111;
    `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_awprotIsNotUnknownAndPrevious2ClkAwprotIsUnknown Task Ended"),UVM_NONE);
  endtask
   
  task When_wvalidIsAsserted_Then_wdataIsNotUnknownAndPrevious2ClkWdataIsUnknown();
    `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_wdataIsNotUnknownAndPrevious2ClkWdataIsUnknown Task started"),UVM_NONE);
      @(posedge aclk);  
      aresetn<= 1'b1;
      wvalid <= 1'b0;
      wdata  <= 32'hxxxx_xxxx;
      repeat(2) begin
      @(posedge aclk);
      end
      wvalid <= 1'b1;
      wdata  <= 32'h2222_3333;
    `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_wdataIsNotUnknownAndPrevious2ClkWdataIsUnknown Task Ended"),UVM_NONE);
  endtask
    
  task When_wvalidIsAsserted_Then_wstrbIsNotUnknownAndPrevious2ClkWstrbIsUnknown();
    `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_wstrbIsNotUnknownAndPrevious2ClkWstrbIsUnknown Task started"),UVM_NONE);
      @(posedge aclk);  
      aresetn<= 1'b1;
      wvalid <= 1'b0;
      wstrb  <= 4'bxxxx;
      repeat(1) begin
      @(posedge aclk);
      end
      wvalid <= 1'b1;
      wstrb  <= 4'b1111;
    `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_wstrbIsNotUnknownAndPrevious2ClkWstrbIsUnknown Task Ended"),UVM_NONE);
  endtask

  task When_awvalidIsAsserted_Then_awaddrAwprotAreNotUnknownAndPrevious2ClkAwaddrAwprotAreUnknown();
    `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_awaddrAwprotAreNotUnknownAndPrevious2ClkAwaddrAwprotAreUnknown Task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
      awvalid <= 1'b0;
      awaddr  <= 32'hxxxx_xxxx;
      awprot  <= 3'bxxx;
      repeat(3) begin
      @(posedge aclk);
      end
      awvalid <= 1'b1;
      awaddr  <= 32'h1122_3344;
      awprot  <= 3'b101;
    `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_awaddrAwprotAreNotUnknownAndPrevious2ClkAwaddrAwprotAreUnknown Task Ended"),UVM_NONE);
  endtask

  task When_wvalidIsAsserted_Then_wdataWstrbIsNotUnknownAndPrevious2ClkWdataWstrbIsUnknown();
    `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_wdataWstrbIsNotUnknownAndPrevious2ClkWdataWstrbIsUnknown Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn<= 1'b1;
      wvalid <= 1'b0;
      wdata  <= 32'hxxxx_xxxx;
      wstrb  <= 4'bxxxx;
      repeat(3) begin
      @(posedge aclk);
      end
      wvalid <= 1'b1;
      wdata  <= 32'h2222_3333;
      wstrb  <= 4'b1111;
    `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_wdataWstrbIsNotUnknownAndPrevious2ClkWdataWstrbIsUnknown Task Ended"),UVM_NONE);
  endtask

   task When_bvalidIsAsserted_Then_brespIsNotUnknownAndPrevious2ClkBrespIsUnknown();
      `uvm_info(name,$sformatf("When_bvalidIsAsserted_Then_brespIsNotUnknownAndPrevious2ClkBrespIsUnknown Task started"),UVM_NONE);
      aresetn <= 1'b1;
      bvalid <= 1'b0;
      bresp  <= 2'bxx;
      repeat(2) begin
      @(posedge aclk);
      end
      bvalid <= 1'b1;
      bresp <= 2'b00;
      repeat(3) begin
       @(posedge aclk);
      end
      bvalid <= 1'b0;
     `uvm_info(name,$sformatf("When_bvalidIsAsserted_Then_brespIsNotUnknownAndPrevious2ClkBrespIsUnknown Task Ended"),UVM_NONE); 
   endtask

  task When_awreadyIsLow_Then_awvalidIsAssertedAfter3Clk();
    `uvm_info(name,$sformatf("When_awreadyIsLow_Then_awvalidIsAssertedAfter3Clk Task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
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
      @(posedge aclk); 
      aresetn <= 1'b1;
      wvalid  <= 1'b0;
      wready  <= 1'b0;
      repeat(3) begin
      @(posedge aclk);
      end
      wvalid  <= 1'b1;
    `uvm_info(name,$sformatf("When_wreadyIsLow_Then_wvalidIsAssertedAfter3Clk Task Ended"),UVM_NONE);
  endtask
 
  task When_breadyIsLow_Then_bvalidIsAssertedAfter3Clk();
    `uvm_info(name,$sformatf("When_breadyIsLow_Then_bvalidIsAssertedAfter3Clk Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      bvalid  <= 1'b0;
      bready  <= 1'b0;
      repeat(3) begin
      @(posedge aclk);
      end
      bvalid  <= 1'b1;
    `uvm_info(name,$sformatf("When_breadyIsLow_Then_bvalidIsAssertedAfter3Clk Task Ended"),UVM_NONE);
  endtask
 
  task When_awreadyIsLow_Then_anyClkAwvalidIsAssertedThenAwreadyCanBeAssertAnyTime();
    `uvm_info(name,$sformatf("When_awreadyIsLow_Then_anyClkAwvalidIsAssertedThenAwreadyCanBeAssertAnyTime Task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
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
      @(posedge aclk);
      aresetn <= 1'b1;
      wvalid  <= 1'b0;
      wready  <= 1'b0;
      repeat(4) begin
      @(posedge aclk);
      end
      wvalid  <= 1'b1;
      repeat(2) begin
      @(posedge aclk);
      end
      wready  <= 1'b1;
    `uvm_info(name,$sformatf("When_wreadyIsLow_Then_anyClkWvalidIsAssertedThenWreadyCanBeAssertAnyTime Task Ended"),UVM_NONE);
  endtask

  task When_breadyIsLow_Then_anyClkBvalidIsAssertedThenBreadyCanBeAssertAnyTime();
    `uvm_info(name,$sformatf("When_breadyIsLow_Then_anyClkBvalidIsAssertedThenBreadyCanBeAssertAnyTime Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      bvalid  <= 1'b0;
      bready  <= 1'b0;
      repeat(4) begin
      @(posedge aclk);
      end
      bvalid  <= 1'b1;
      repeat(2) begin
      @(posedge aclk);
      end
      bready  <= 1'b1;
    `uvm_info(name,$sformatf("When_breadyIsLow_Then_anyClkBvalidIsAssertedThenBreadyCanBeAssertAnyTime Task Ended"),UVM_NONE);
  endtask

 task When_awvalidIsAsserted_Then_sameClkAwreadyIsAsserted();
    `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_sameClkAwreadyIsAsserted Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      awvalid <= 1'b0;
      awready <= 1'b0;
      @(posedge aclk);
      awvalid <= 1'b1;
      awready <= 1'b1;
    `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_sameClkAwreadyIsAsserted Task Ended"),UVM_NONE);
 endtask

 task When_wvalidIsAsserted_Then_sameClkWreadyIsAsserted();
    `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_sameClkWreadyIsAsserted Task started"),UVM_NONE);
     @(posedge aclk); 
     aresetn <= 1'b1;
      wvalid <= 1'b0;
      wready <= 1'b0;
      @(posedge aclk);
      wvalid <= 1'b1;
      wready <= 1'b1;
    `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_sameClkWreadyIsAsserted Task Ended"),UVM_NONE);
 endtask

 task When_bvalidIsAsserted_Then_sameClkBreadyIsAsserted();
    `uvm_info(name,$sformatf("When_bvalidIsAsserted_Then_sameClkBreadyIsAsserted Task started"),UVM_NONE);
     @(posedge aclk); 
     aresetn <= 1'b1;
      bvalid <= 1'b0;
      bready <= 1'b0;
      @(posedge aclk);
      bvalid <= 1'b1;
      bready <= 1'b1;
    `uvm_info(name,$sformatf("When_bvalidIsAsserted_Then_sameClkBreadyIsAsserted Task Ended"),UVM_NONE);
 endtask

  task When_awvalidIsAsserted_Then_remainsHigh_NextClkAwreadyIsAsserted();
    `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_remainsHigh_NextClkAwreadyIsAsserted Task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
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
     @(posedge aclk); 
     aresetn <= 1'b1;
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
      @(posedge aclk); 
      aresetn <= 1'b1; 
      bvalid  <= 1'b0;
      bready  <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      bvalid  <= 1'b1;
      @(posedge aclk);
      bready  <= 1'b1;
    `uvm_info(name,$sformatf("When_bvalidIsAsserted_Then_remainsHigh_NextClkBreadyIsAsserted  Task Ended"),UVM_NONE);
  endtask

  task When_awvalidIsAsserted_Then_remainsHigh_Then_Within1To16ClkAwreadyIsAsserted();
   `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_remainsHigh_Then_Within1To16ClkAwreadyIsAsserted Task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
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
      @(posedge aclk); 
      aresetn <= 1'b1;
      wvalid  <= 1'b0;
      wready  <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      wvalid  <= 1'b1;
      repeat(10) begin
      @(posedge aclk);
      end
      wready  <= 1'b1;
    `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_remainsHigh_Then_Within1To16ClkWreadyIsAsserted Task Ended"),UVM_NONE);
  endtask

 task When_bvalidIsAsserted_Then_remainsHigh_Then_Within1To16ClkBreadyIsAsserted();
   `uvm_info(name,$sformatf("When_bvalidIsAsserted_Then_remainsHigh_Then_Within1To16ClkBreadyIsAsserted Task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
      bvalid  <= 1'b0;
      bready  <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      bvalid  <= 1'b1;
      repeat(10) begin
      @(posedge aclk);
      end
      bready  <= 1'b1;
    `uvm_info(name,$sformatf("When_bvalidIsAsserted_Then_remainsHigh_Then_Within1To16ClkBreadyIsAsserted Task Ended"),UVM_NONE);
  endtask

  task When_awvalidIsAsserted_Then_remainsHigh_Then_awreadyIsAlwaysLow();
   `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_remainsHigh_Then_awreadyIsAlwaysLow Task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;  
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
     @(posedge aclk); 
     aresetn <= 1'b1;
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
     @(posedge aclk); 
     aresetn <= 1'b1;
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
      @(posedge aclk); 
      aresetn <= 1'b1;
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
     @(posedge aclk); 
     aresetn <= 1'b1;
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
     @(posedge aclk); 
     aresetn <= 1'b1;
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
      @(posedge aclk); 
      aresetn <= 1'b1;
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
      @(posedge aclk); 
      aresetn <= 1'b1;
      wvalid  <= 1'b0;
      wready  <= 1'b0;
      @(posedge aclk);
      wvalid  <= 1'b1;
      wready  <= 1'b1;
      @(posedge aclk);
      wvalid  <= 1'b0;
      wready  <= 1'b0;
      @(posedge aclk);
      wvalid  <= 1'b1;
      wready  <= 1'b1;
    `uvm_info(name,$sformatf("When_BackToBackWvalidAndWreadyAsserted_Then_1ClkDelayInbetween2Transfer  Task Ended"),UVM_NONE);
  endtask

  task When_BackToBackBvalidAndBreadyAsserted_Then_1ClkDelayInbetween2Transfer();
   `uvm_info(name,$sformatf("When_BackToBackBvalidAndBreadyAsserted_Then_1ClkDelayInbetween2Transfer Task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
      bvalid  <= 1'b0;
      bready  <= 1'b0;
      @(posedge aclk);
      bvalid  <= 1'b1;
      bready  <= 1'b1;
      @(posedge aclk);
      bvalid  <= 1'b0;
      bready  <= 1'b0;
      @(posedge aclk);
      bvalid  <= 1'b1;
      bready  <= 1'b1;
    `uvm_info(name,$sformatf("When_BackToBackBvalidAndBreadyAsserted_Then_1ClkDelayInbetween2Transfer  Task Ended"),UVM_NONE);
  endtask
 
  task When_BackToBackAwvalidAndAwreadyAsserted_Then_2ClkDelayInbetween2Transfer();
   `uvm_info(name,$sformatf("When_BackToBackAwvalidAndAwreadyAsserted_Then_2ClkDelayInbetween2Transfer Task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
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
     @(posedge aclk); 
     aresetn <= 1'b1;
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
     @(posedge aclk); 
     aresetn <= 1'b1;
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
      @(posedge aclk); 
      aresetn <= 1'b1;
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
     @(posedge aclk); 
     aresetn <= 1'b1;
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
      @(posedge aclk); 
      aresetn <= 1'b1;
      bvalid  <= 1'b0;
      bready  <= 1'b0;
      @(posedge aclk);
      bvalid  <= 1'b1;
      bready  <= 1'b1;
      @(posedge aclk);
      bvalid  <= 1'b0;
      bready  <= 1'b0;
      repeat(8) begin //Delay We can give anything inbetween 3 to 16
      @(posedge aclk);
      end
      bvalid  <= 1'b1;
      bready  <= 1'b1;
    `uvm_info(name,$sformatf("When_BackToBackBvalidAndBreadyAsserted_Then_3To16ClkDelayInbetween2Transfer  Task Ended"),UVM_NONE);
  endtask

  task When_BackToBackAwvalidAndAwreadyAsserted_Then_moreThan16ClkDelayInbetween2Transfer();
  `uvm_info(name,$sformatf("When_BackToBackAwvalidAndAwreadyAsserted_Then_moreThan16ClkDelayInbetween2Transfer Task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
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
      @(posedge aclk);
      aresetn<= 1'b1;
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
     @(posedge aclk);
     aresetn <= 1'b1;
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
      @(posedge aclk); 
      aresetn <= 1'b1;
      awready <= 1'b0;
      @(posedge aclk);
      awready <= 1'b1;
    `uvm_info(name,$sformatf("When_awreadyNeedToAsserted_atleastOnce Task Ended"),UVM_NONE);
  endtask

 task When_wreadyNeedToAsserted_atleastOnce();
  `uvm_info(name,$sformatf("When_wreadyNeedToAsserted_atleastOnce Task started"),UVM_NONE);
     @(posedge aclk); 
     aresetn <= 1'b1;
      wready <= 1'b0;
      @(posedge aclk);
      wready <= 1'b1;
    `uvm_info(name,$sformatf("When_wreadyNeedToAsserted_atleastOnce Task Ended"),UVM_NONE);
 endtask

 task When_breadyNeedToAsserted_atleastOnce();
  `uvm_info(name,$sformatf("When_breadyNeedToAsserted_atleastOnce Task started"),UVM_NONE);
    @(posedge aclk); 
    aresetn <= 1'b1;
     bready <= 1'b0;
     @(posedge aclk);
     bready <= 1'b1;
    `uvm_info(name,$sformatf("When_breadyNeedToAsserted_atleastOnce Task Ended"),UVM_NONE);
  endtask

  task When_awreadyIsAsserted_Then_sameClkDeasserted();
  `uvm_info(name,$sformatf("When_awreadyIsAsserted_Then_sameClkDeasserted Task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
      awready <= 1'b0;
      @(posedge aclk);
      awready <= 1'b1;
      #2;
      awready <= 1'b0;
    `uvm_info(name,$sformatf("When_awreadyIsAsserted_Then_sameClkDeasserted Task Ended"),UVM_NONE);
  endtask

  task When_wreadyIsAsserted_Then_sameClkDeasserted();
  `uvm_info(name,$sformatf("When_wreadyIsAsserted_Then_sameClkDeasserted Task started"),UVM_NONE);
     @(posedge aclk); 
     aresetn <= 1'b1;
      wready <= 1'b0;
      @(posedge aclk);
      wready <= 1'b1;
      #2;
      wready <= 1'b0;
    `uvm_info(name,$sformatf("When_wreadyIsAsserted_Then_sameClkDeasserted Task Ended"),UVM_NONE);
  endtask

  task When_breadyIsAsserted_Then_sameClkDeasserted();
  `uvm_info(name,$sformatf("When_breadyIsAsserted_Then_sameClkDeasserted Task started"),UVM_NONE);
     @(posedge aclk); 
     aresetn <= 1'b1;
      bready <= 1'b0;
      @(posedge aclk);
      bready <= 1'b1;
      #2;
      bready <= 1'b0;
    `uvm_info(name,$sformatf("When_breadyIsAsserted_Then_sameClkDeasserted Task Ended"),UVM_NONE);
  endtask

  task When_awvalidIsAsserted_Then_nextClkAwreadyIsAsserted();
   `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_nextClkAwreadyIsAsserted Task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
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
      @(posedge aclk); 
      aresetn <= 1'b1;
      wvalid  <= 1'b0;
      wready  <= 1'b0;
      @(posedge aclk);
      wvalid  <= 1'b1;
      @(posedge aclk);
      wready  <= 1'b1;
    `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_nextClkWreadyIsAsserted Task Ended"),UVM_NONE);
  endtask

  task When_bvalidIsAsserted_Then_nextClkBreadyIsAsserted();
   `uvm_info(name,$sformatf("When_bvalidIsAsserted_Then_nextClkBreadyIsAsserted Task started"),UVM_NONE);
     @(posedge aclk); 
     aresetn <= 1'b1;
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
      @(posedge aclk); 
      aresetn <= 1'b1;
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
     @(posedge aclk); 
     aresetn <= 1'b1;
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
     @(posedge aclk); 
     aresetn <= 1'b1;
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
      @(posedge aclk); 
      aresetn <= 1'b1;
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
   @(posedge aclk); 
   aresetn <= 1'b1;
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
   @(posedge aclk); 
   aresetn <= 1'b1;
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
      @(posedge aclk); 
      aresetn <= 1'b1;
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
     @(posedge aclk); 
     aresetn <= 1'b1;
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
      @(posedge aclk); 
      aresetn <= 1'b1;
      bvalid  <= 1'b0;
      bready  <= 1'b0;
      @(posedge aclk);
      bready  <= 1'b1;
      @(posedge aclk);
      bready  <= 1'b0;
      @(posedge aclk);
      bvalid  <= 1'b1;
    `uvm_info(name,$sformatf("When_breadyIsAssertedAndDeasserted_Then_nextClkBvalidIsAsserted task ended"),UVM_NONE);
  endtask


  task When_awreadyIsAssertedAndDeasserted3Times_Then_nextClkAwvalidIsAsserted();
   `uvm_info(name,$sformatf("When_awreadyIsAssertedAndDeasserted3Times_Then_nextClkAwvalidIsAsserted task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;  
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
     @(posedge aclk); 
     aresetn <= 1'b1;
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
     @(posedge aclk); 
     aresetn <= 1'b1;
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
      @(posedge aclk); 
      aresetn <= 1'b1;
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
     @(posedge aclk); 
     aresetn <= 1'b1;
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
    @(posedge aclk); 
    aresetn <= 1'b1;
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
     @(posedge aclk); 
     aresetn <= 1'b1;   
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
    @(posedge aclk); 
    aresetn <= 1'b1;
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
     @(posedge aclk); 
     aresetn <= 1'b1;
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

  task When_awreadyIsAsserted_Then_inbetween1To15ClkAwvalidIsAsserted();
   `uvm_info(name,$sformatf("When_awreadyIsAsserted_Then_inbetween1To15ClkAwvalidIsAsserted task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
      awvalid <= 1'b0;
      awready <= 1'b0;
      @(posedge aclk);
      awready <= 1'b1;
      repeat(5) begin ///Here anyvalue you can give that is inbetween 1To15
      @(posedge aclk);
      end
      awvalid <= 1'b1;
    `uvm_info(name,$sformatf("When_awreadyIsAsserted_Then_inbetween1To15ClkAwvalidIsAsserted task ended"),UVM_NONE);
  endtask

  task When_wreadyIsAsserted_Then_inbetween1To15ClkWvalidIsAsserted();
   `uvm_info(name,$sformatf("When_wreadyIsAsserted_Then_inbetween1To15ClkWvalidIsAsserted task started"),UVM_NONE);
     @(posedge aclk); 
     aresetn <= 1'b1;
      wvalid <= 1'b0;
      wready <= 1'b0;
      @(posedge aclk);
      wready <= 1'b1;
      repeat(5) begin //Here anyvalue you can give that is inbetween 1To15
      @(posedge aclk);
      end
      wvalid <= 1'b1;
    `uvm_info(name,$sformatf("When_wreadyIsAsserted_Then_inbetween1To15ClkWvalidIsAsserted task ended"),UVM_NONE);
  endtask

  task When_breadyIsAsserted_Then_inbetween1To15ClkBvalidIsAsserted();
   `uvm_info(name,$sformatf("When_breadyIsAsserted_Then_inbetween1To15ClkBvalidIsAsserted task started"),UVM_NONE);
     @(posedge aclk); 
     aresetn <= 1'b1;
      bvalid <= 1'b0;
      bready <= 1'b0;
      @(posedge aclk);
      bready <= 1'b1;
      repeat(5) begin // //Here anyvalue you can give that is inbetween 1To15
      @(posedge aclk);
      end
      bvalid <= 1'b1;
    `uvm_info(name,$sformatf("When_breadyIsAsserted_Then_inbetween1To15ClkBvalidIsAsserted task ended"),UVM_NONE);
  endtask

  task When_awreadyDefaultValueIs1AndTransferOccur_Then_nextClkAwreadyValueWillGoDefaultState();
   `uvm_info(name,$sformatf("When_awreadyDefaultValueIs1AndTransferOccur_Then_nextClkAwreadyValueWillGoDefaultState"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
      awvalid <= 1'b0;
      awready <= 1'b1;
      @(posedge aclk);
      awready <= 1'b0;
      @(posedge aclk);
      awready <= 1'b1;
      awvalid <= 1'b1;
      @(posedge aclk);
      awvalid <= 1'b0;
    `uvm_info(name,$sformatf("When_awreadyDefaultValueIs1AndTransferOccur_Then_nextClkAwreadyValueWillGoDefaultState Task ended"),UVM_NONE);
  endtask

  task When_wreadyDefaultValueIs1AndTransferOccur_Then_nextClkWreadyValueWillGoDefaultState();
   `uvm_info(name,$sformatf("When_wreadyDefaultValueIs1AndTransferOccur_Then_nextClkWreadyValueWillGoDefaultState task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
      wvalid <= 1'b0;
      wready <= 1'b1;
      @(posedge aclk);
      wready <= 1'b0;
      @(posedge aclk);
      wready <= 1'b1;
      wvalid <= 1'b1;
      @(posedge aclk);
      wvalid <= 1'b0;
    `uvm_info(name,$sformatf("When_wreadyDefaultValueIs1AndTransferOccur_Then_nextClkWreadyValueWillGoDefaultState task ended"),UVM_NONE);
  endtask

  task When_breadyDefaultValueIs1AndTransferOccur_Then_nextClkBreadyValueWillGoDefaultState();
   `uvm_info(name,$sformatf("When_breadyDefaultValueIs1AndTransferOccur_Then_nextClkBreadyValueWillGoDefaultState task started"),UVM_NONE);
     @(posedge aclk); 
     aresetn <= 1'b1;
      bvalid <= 1'b0;
      bready <= 1'b1;
      @(posedge aclk);
      bready <= 1'b0;
      @(posedge aclk);
      bready <= 1'b1;
      bvalid <= 1'b1;
      @(posedge aclk);
      bvalid <= 1'b0;
    `uvm_info(name,$sformatf("When_breadyDefaultValueIs1AndTransferOccur_Then_nextClkBreadyValueWillGoDefaultState task ended"),UVM_NONE);
  endtask

  task When_awreadyDefaultValueIs0AndTransferOccur_Then_nextClkAwreadyValueWillGoDefaultState();
   `uvm_info(name,$sformatf("When_awreadyDefaultValueIs0AndTransferOccur_Then_nextClkAwreadyValueWillGoDefaultState task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
      awvalid <= 1'b0;
      awready <= 1'b0;
      @(posedge aclk);
      awready <= 1'b1;
      awvalid <= 1'b1;
      @(posedge aclk);
      awready <= 1'b0;
    `uvm_info(name,$sformatf("When_awreadyDefaultValueIs0AndTransferOccur_Then_nextClkAwreadyValueWillGoDefaultState task ended"),UVM_NONE);
  endtask

  task When_wreadyDefaultValueIs0AndTransferOccur_Then_nextClkWreadyValueWillGoDefaultState();
   `uvm_info(name,$sformatf("When_wreadyDefaultValueIs0AndTransferOccur_Then_nextClkWreadyValueWillGoDefaultState task started"),UVM_NONE);
     @(posedge aclk); 
     aresetn <= 1'b1;
      wvalid <= 1'b0;
      wready <= 1'b0;
      @(posedge aclk);
      wready <= 1'b1;
      wvalid <= 1'b1;
      @(posedge aclk);
      wready <= 1'b0;
    `uvm_info(name,$sformatf("When_wreadyDefaultValueIs0AndTransferOccur_Then_nextClkWreadyValueWillGoDefaultState task ended"),UVM_NONE);
  endtask

  task When_breadyDefaultValueIs0AndTransferOccur_Then_nextClkBreadyValueWillGoDefaultState();
   `uvm_info(name,$sformatf("When_breadyDefaultValueIs0AndTransferOccur_Then_nextClkBreadyValueWillGoDefaultState task started"),UVM_NONE);
     @(posedge aclk); 
     aresetn <= 1'b1;
      bvalid <= 1'b0;
      bready <= 1'b0;
      @(posedge aclk);
      bready <= 1'b1;
      bvalid <= 1'b1;
      @(posedge aclk);
      bready  <= 1'b0;
    `uvm_info(name,$sformatf("When_breadyDefaultValueIs0AndTransferOccur_Then_nextClkBreadyValueWillGoDefaultState task ended"),UVM_NONE);
  endtask

  task When_awreadyIsHighAndWritingValidAwaddrAndWdataOnSlaveLocation_Then_brespWillGiveOkayResponse();
   `uvm_info(name,$sformatf("When_awreadyIsHighAndWritingValidAwaddrAndWdataOnSlaveLocation_Then_brespWillGiveOkayResponse task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
      awvalid <= 1'b0;
      awready <= 1'b0;
      awaddr  <= 32'hxxxx_xxxx;
      wvalid  <= 1'b0;
      wready  <= 1'b0;
      wdata   <= 32'hxxxx_xxxx;
      bvalid  <= 1'b0;
      bready  <= 1'b0;
      bresp   <= 2'bxx;
      @(posedge aclk);
      awvalid <= 1'b1;
      awready <= 1'b1;
      awaddr  <= 32'h1234_5678;
      repeat(5) begin;
      @(posedge aclk);
      end 
      wvalid  <= 1'b1;
      wready  <= 1'b1;
      wdata   <= 32'h1122_3344;
      repeat(5) begin;
      @(posedge aclk);
      end
      bvalid  <= 1'b1;
      bready  <= 1'b1;
      bresp   <= 2'b00;
    `uvm_info(name,$sformatf("When_awreadyIsHighAndWritingValidAwaddrAndWdataOnSlaveLocation_Then_brespWillGiveOkayResponse task ended"),UVM_NONE);
  endtask

  task When_awvalidAwreadyWvalidWreadyAreAssertedSameClk_Then_NextClkBvalidIsAsserted();
   `uvm_info(name,$sformatf("When_awvalidAwreadyWvalidWreadyAreAssertedSameClk_Then_NextClkBvalidIsAsserted task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
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
      @(posedge aclk); 
      aresetn <= 1'b1;
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

  task When_awvalidAwreadyAreAsserted_Then_nextClkWvalidWreadyAreAsserted_Then_inbetween1To12ClkBvalidIsAsserted();
  `uvm_info(name,$sformatf("When_awvalidAwreadyAreAsserted_Then_nextClkWvalidWreadyAreAsserted_Then_inbetween1To12ClkBvalidIsAsserted task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
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
      repeat(11) begin //Here inbetween 1 to 12 clk you can give anything example 11
      @(posedge aclk);
      end
      bvalid  <= 1'b1;
    `uvm_info(name,$sformatf("When_awvalidAwreadyAreAsserted_Then_nextClkWvalidWreadyAreAsserted_Then_inbetween1To12ClkBvalidIsAsserted task ended"),UVM_NONE);
  endtask

  task When_awvalidAwreadyAreAsserted_Then_inbetween1To10ClkWvalidWreadyAreAsserted_Then_inbetween1To12ClkBvalidIsAsserted();
  `uvm_info(name,$sformatf("When_awvalidAwreadyAreAsserted_Then_inbetween1To10ClkWvalidWreadyAreAsserted_Then_inbetween1To12ClkBvalidIsAsserted task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
      awvalid <= 1'b0;
      awready <= 1'b0;
      wvalid  <= 1'b0;
      wready  <= 1'b0;
      bvalid  <= 1'b0;
      @(posedge aclk);
      awvalid <= 1'b1;
      awready <= 1'b1;
      repeat(9) begin //Here inbetween 1 to 10 clk you can give anything example 9
      @(posedge aclk);
      end
      wvalid  <= 1'b1;
      wready  <= 1'b1;
      repeat(11) begin //Here inbetween 1 to 12 clk you can give anything example 11
      @(posedge aclk);
      end
      bvalid  <= 1'b1;
    `uvm_info(name,$sformatf("When_awvalidAwreadyAreAsserted_Then_inbetween1To10ClkWvalidWreadyAreAsserted_Then_inbetween1To12ClkBvalidIsAsserted Task  ended"),UVM_NONE);
  endtask

  task When_awaddrIsAsserted_Then_sameClkWdataIsAsserted();
  `uvm_info(name,$sformatf("When_awaddrIsAsserted_Then_sameClkWdataIsAsserted Task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
      awvalid <= 1'b0;
      awready <= 1'b0;
      awaddr  <= 32'hxxxx_xxxx;
      wvalid  <= 1'b0;
      wready  <= 1'b0;
      wdata   <= 32'hxxxx_xxxx;
      @(posedge aclk);
      awvalid <= 1'b1;
      awready <= 1'b1;
      awaddr  <= 32'h1000_1002;
      wvalid  <= 1'b1;
      wready  <= 1'b1;
      wdata   <= 32'h1234_5678;
    `uvm_info(name,$sformatf("When_awaddrIsAsserted_Then_sameClkWdataIsAsserted Task  ended"),UVM_NONE);
  endtask

  task When_awaddrIsAsserted_Then_sameClkWdataIsAssertedButWdataIsUnknownValue();
  `uvm_info(name,$sformatf("When_awaddrIsAsserted_Then_sameClkWdataIsAssertedButWdataIsUnknownValue Fail Task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
      awvalid <= 1'b0;
      awready <= 1'b0;
      awaddr  <= 32'hxxxx_xxxx;
      wvalid  <= 1'b0;
      wready  <= 1'b0;
      wdata   <= 32'hxxxx_xxxx;
      @(posedge aclk);
      awvalid <= 1'b1;
      awready <= 1'b1;
      awaddr  <= 32'h1000_1002;
      wvalid  <= 1'b1;
      wready  <= 1'b1;
      wdata   <= 32'hxxxx_xxxx;
    `uvm_info(name,$sformatf("When_awaddrIsAsserted_Then_sameClkWdataIsAssertedButWdataIsUnknownValue Fail Task ended"),UVM_NONE);
  endtask
   
  task When_awaddrIsAsserted_Then_sameClkWdataIsAssertedButWvalidIsLow();
  `uvm_info(name,$sformatf("When_awaddrIsAsserted_Then_sameClkWdataIsAssertedButWvalidIsLow Fail Task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
      awvalid <= 1'b0;
      awready <= 1'b0;
      awaddr  <= 32'hxxxx_xxxx;
      wvalid  <= 1'b0;
      wready  <= 1'b0;
      wdata   <= 32'hxxxx_xxxx;
      @(posedge aclk);
      awvalid <= 1'b1;
      awready <= 1'b1;
      awaddr  <= 32'h1000_1002;
      wvalid  <= 1'b0;
      wready  <= 1'b1;
      wdata   <= 32'h1122_3344;
    `uvm_info(name,$sformatf("When_awaddrIsAsserted_Then_sameClkWdataIsAssertedButWvalidIsLow Fail Task ended"),UVM_NONE);
  endtask
   
  task When_awaddrIsAsserted_Then_nextClkWdataIsAsserted();
  `uvm_info(name,$sformatf("When_awaddrIsAsserted_Then_nextClkWdataIsAsserted Task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
      awvalid <= 1'b0;
      awready <= 1'b0;
      awaddr  <= 32'hxxxx_xxxx;
      wvalid  <= 1'b0;
      wready  <= 1'b0;
      wdata   <= 32'hxxxx_xxxx;
      @(posedge aclk);
      awvalid <= 1'b1;
      awready <= 1'b1;
      awaddr  <= 32'h1000_1002;
      @(posedge aclk);
      wvalid  <= 1'b1;
      wready  <= 1'b1;
      wdata   <= 32'h1234_5678;
    `uvm_info(name,$sformatf("When_awaddrIsAsserted_Then_nextClkWdataIsAsserted Task  ended"),UVM_NONE);
  endtask

  task When_awaddrIsAsserted_Then_inbetween1To10ClkWdataIsAsserted();
  `uvm_info(name,$sformatf(" When_awaddrIsAsserted_Then_inbetween1To10ClkWdataIsAsserted Task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
      awvalid <= 1'b0;
      awready <= 1'b0;
      awaddr  <= 32'hxxxx_xxxx;
      wvalid  <= 1'b0;
      wready  <= 1'b0;
      wdata   <= 32'hxxxx_xxxx;
      @(posedge aclk);
      awvalid <= 1'b1;
      awready <= 1'b1;
      awaddr  <= 32'h1000_1002;
      repeat(8) begin //Here you can give any value inbetween 1-10 example 8
      @(posedge aclk);
      end
      wvalid  <= 1'b1;
      wready  <= 1'b1;
      wdata   <= 32'h1234_5678;
    `uvm_info(name,$sformatf("When_awaddrIsAsserted_Then_inbetween1To10ClkWdataIsAsserted Task  ended"),UVM_NONE);
  endtask

  task When_wdataIsAsserted_Then_nextClkAwaddrIsAsserted();
  `uvm_info(name,$sformatf("When_wdataIsAsserted_Then_nextClkAwaddrIsAsserted Task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
      awvalid <= 1'b0;
      awready <= 1'b0;
      awaddr  <= 32'hxxxx_xxxx;
      wvalid  <= 1'b0;
      wready  <= 1'b0;
      wdata   <= 32'hxxxx_xxxx;
      @(posedge aclk);
      wvalid  <= 1'b1;
      wready  <= 1'b1;
      wdata   <= 32'h1234_5678;
      @(posedge aclk);
      awvalid <= 1'b1;
      awready <= 1'b1;
      awaddr  <= 32'h1000_1002;
    `uvm_info(name,$sformatf("When_wdataIsAsserted_Then_nextClkAwaddrIsAsserted Task  ended"),UVM_NONE);
  endtask

  task When_wdataIsAsserted_Then_inbetween1To10ClkAwaddrIsAsserted();
  `uvm_info(name,$sformatf("When_wdataIsAsserted_Then_inbetween1To10ClkAwaddrIsAsserted Task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
      awvalid <= 1'b0;
      awready <= 1'b0;
      awaddr  <= 32'hxxxx_xxxx;
      wvalid  <= 1'b0;
      wready  <= 1'b0;
      wdata   <= 32'hxxxx_xxxx;
      @(posedge aclk);
      wvalid  <= 1'b1;
      wready  <= 1'b1;
      wdata   <= 32'h1234_5678;
      repeat(8) begin //Here you can give any value inbetween 1-10 example 8
      @(posedge aclk);
      end
      awvalid <= 1'b1;
      awready <= 1'b1;
      awaddr  <= 32'h1000_1002;
    `uvm_info(name,$sformatf("When_wdataIsAsserted_Then_inbetween1To10ClkAwaddrIsAsserted Task  ended"),UVM_NONE);
  endtask

  task When_wdataIsAsserted_Then_anyClkAwaddrIsAsserted();
  `uvm_info(name,$sformatf("When_wdataIsAsserted_Then_anyClkAwaddrIsAsserted Task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
      awvalid <= 1'b0;
      awready <= 1'b0;
      awaddr  <= 32'hxxxx_xxxx;
      wvalid  <= 1'b0;
      wready  <= 1'b0;
      wdata   <= 32'hxxxx_xxxx;
      @(posedge aclk);
      wvalid  <= 1'b1;
      wready  <= 1'b1;
      wdata   <= 32'h1234_5678;
      repeat(5) begin //Here you can give any value example 5
      @(posedge aclk);
      end
      awvalid <= 1'b1;
      awready <= 1'b1;
      awaddr  <= 32'h1000_1002; 
      `uvm_info(name,$sformatf("When_wdataIsAsserted_Then_anyClkAwaddrIsAsserted Task  ended"),UVM_NONE);
  endtask

  task When_awvalidIsAsserted_Then_nextClkAwreadyAndWreadyAreAsserted();
   `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_nextClkAwreadyAndWreadyAreAsserted Task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
      awvalid <= 1'b0;
      awready <= 1'b0;
      wready  <= 1'b0;
      @(posedge aclk);
      awvalid <= 1'b1;
      @(posedge aclk);
      awready <= 1'b1;
      wready  <= 1'b1;
      `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_nextClkAwreadyAndWreadyAreAsserted Task  ended"),UVM_NONE);
  endtask

  task When_awvalidIsAsserted_Then_inbetween1To15ClkAwreadyAndWreadyAreAsserted();
   `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_inbetween1To15ClkAwreadyAndWreadyAreAsserted Task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
      awvalid <= 1'b0;
      awready <= 1'b0;
      wready  <= 1'b0;
      @(posedge aclk);
      awvalid <= 1'b1;
      repeat(5) begin  //here we can give any value between the 1 to 15
      @(posedge aclk);
      end
      awready <= 1'b1;
      wready  <= 1'b1;
      `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_inbetween1To15ClkAwreadyAndWreadyAreAsserted Task  ended"),UVM_NONE);
  endtask

  task When_awvalidIsAsserted_Then_sameClkAwreadyAndWreadyAreAsserted();
   `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_sameClkAwreadyAndWreadyAreAsserted Task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
      awvalid <= 1'b0;
      awready <= 1'b0;
      wready  <= 1'b0;
      @(posedge aclk);
      awvalid <= 1'b1;
      awready <= 1'b1;
      wready  <= 1'b1;
      `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_sameClkAwreadyAndWreadyAreAsserted Task  ended"),UVM_NONE);
  endtask

   task When_awvalidIsAsserted_Then_awreadyAndWreadyAreLow();
   `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_awreadyAndWreadyAreLow Fail Scenario Task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
      awvalid <= 1'b0;
      awready <= 1'b0;
      wready  <= 1'b0;
      @(posedge aclk);
      awvalid <= 1'b1;
      `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_awreadyAndWreadyAreLow Fail Scenario Task  ended"),UVM_NONE);
  endtask


    task When_awvalidAndAwreadyAreAsserted_Then_wreadyIsLow();
   `uvm_info(name,$sformatf("When_awvalidAndAwreadyAreAsserted_Then_wreadyIsLow Fail Scenario Task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
      awvalid <= 1'b0;
      awready <= 1'b0;
      wready  <= 1'b0;
      @(posedge aclk);
      awvalid <= 1'b1;
      awready <= 1'b1;
      `uvm_info(name,$sformatf("When_awvalidAndAwreadyAreAsserted_Then_wreadyIsLow Fail Scenario Task  ended"),UVM_NONE);
  endtask

    task When_awvalidAndWreadyAreAsserted_Then_awreadyIsLow();
   `uvm_info(name,$sformatf("When_awvalidAndWreadyAreAsserted_Then_awreadyIsLow Fail Scenario Task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
      awvalid <= 1'b0;
      awready <= 1'b0;
      wready  <= 1'b0;
      @(posedge aclk);
      awvalid <= 1'b1;
      wready  <= 1'b1;
      `uvm_info(name,$sformatf("When_awvalidAndWreadyAreAsserted_Then_awreadyIsLow Fail Scenario Task  ended"),UVM_NONE);
  endtask

  task When_awreadyIsAsserted_Then_nextClkWvalidIsAsserted();
   `uvm_info(name,$sformatf(" When_awreadyIsAsserted_Then_nextClkWvalidIsAsserted Task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
      awready <= 1'b0;
      wvalid  <= 1'b0;
      @(posedge aclk);
      awready <= 1'b1;
      @(posedge aclk);
      wvalid  <= 1'b1;
      `uvm_info(name,$sformatf("When_awreadyIsAsserted_Then_nextClkWvalidIsAsserted Task  ended"),UVM_NONE);
  endtask

  task When_awreadyIsAsserted_Then_inbetween1To10ClkWvalidIsAsserted();
   `uvm_info(name,$sformatf("When_awreadyIsAsserted_Then_inbetween1To10ClkWvalidIsAsserted Task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
      awready <= 1'b0;
      wvalid  <= 1'b0;
      @(posedge aclk);
      awready <= 1'b1;
      repeat(5) begin //Here we can give any value between the 1 to 10
      @(posedge aclk);
      end
      wvalid  <= 1'b1;
      `uvm_info(name,$sformatf("When_awreadyIsAsserted_Then_sameClkWvalidIsAsserted Task  ended"),UVM_NONE);
  endtask


  task When_awreadyIsAsserted_Then_sameClkWvalidIsAsserted();
   `uvm_info(name,$sformatf(" When_awreadyIsAsserted_Then_sameClkWvalidIsAsserted Task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
      awready <= 1'b0;
      wvalid  <= 1'b0;
      @(posedge aclk);
      awready <= 1'b1;
      wvalid  <= 1'b1;
      `uvm_info(name,$sformatf("When_awreadyIsAsserted_Then_sameClkWvalidIsAsserted Task  ended"),UVM_NONE);
  endtask


  task When_awreadyIsAsserted_Then_nextClkAwvalidAndWvalidAreAsserted();
   `uvm_info(name,$sformatf(" When_awreadyIsAsserted_Then_nextClkAwvalidAndWvalidAreAsserted Task started"),UVM_NONE);
      @(posedge aclk); aresetn <= 1'b1;
      awready <= 1'b0;
      awvalid <= 1'b0;
      wvalid  <= 1'b0;
      @(posedge aclk);
      awready  <= 1'b1;
      @(posedge aclk);
      awvalid  <= 1'b1;
      wvalid  <= 1'b1;
      `uvm_info(name,$sformatf("When_awreadyIsAsserted_Then_nextClkAwvalidAndWvalidAreAsserted Task  ended"),UVM_NONE);
  endtask

  task When_awreadyIsAsserted_Then_inbetween1To16ClkAwvalidAndWvalidAreAsserted();
   `uvm_info(name,$sformatf("When_awreadyIsAsserted_Then_inbetween1To16ClkAwvalidAndWvalidAreAsserted Task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
      awready <= 1'b0;
      awvalid <= 1'b0;
      wvalid  <= 1'b0;
      @(posedge aclk);
      awready  <= 1'b1;
      repeat(5) begin //Here we can give any value example 5
      @(posedge aclk);
      end
      awvalid <= 1'b1;
      wvalid  <= 1'b1;
      `uvm_info(name,$sformatf("When_awreadyIsAsserted_Then_inbetween1To16ClkAwvalidAndWvalidAreAsserted Task  ended"),UVM_NONE);
  endtask

   task When_awreadyIsAsserted_Then_sameClkAwvalidAndWvalidAreAsserted();
   `uvm_info(name,$sformatf(" When_awreadyIsAsserted_Then_sameClkAwvalidAndWvalidAreAsserted Task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
      awready <= 1'b0;
      awvalid <= 1'b0;
      wvalid  <= 1'b0;
      @(posedge aclk);
      awready  <= 1'b1;
      awvalid  <= 1'b1;
      wvalid   <= 1'b1;
      `uvm_info(name,$sformatf("When_awreadyIsAsserted_Then_sameClkAwvalidAndWvalidAreAsserted Task  ended"),UVM_NONE);
  endtask

  task When_wvalidIsAsserted_Then_nextClkAwreadyIsAsserted(); 
   `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_nextClkAwreadyIsAsserted Task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
      awready <= 1'b0;
      wvalid  <= 1'b0;
      @(posedge aclk);
      wvalid  <= 1'b1;
      @(posedge aclk);
      awready <= 1'b1;
      `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_nextClkAwreadyIsAsserted Task  ended"),UVM_NONE);
  endtask

  task When_wvalidIsAsserted_Then_inbetween1To16ClkAwreadyIsAsserted(); 
   `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_inbetween1To16ClkAwreadyIsAsserted Task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
      awready <= 1'b0;
      wvalid  <= 1'b0;
      @(posedge aclk);
      wvalid  <= 1'b1;
      repeat(5) begin //Here we can give any value example 5
      @(posedge aclk);
      end
      awready <= 1'b1;
      `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_inbetween1To16ClkAwreadyIsAsserted Task  ended"),UVM_NONE);
    endtask

  task When_awvalidIsAsserted_Then_nextClkAwreadyIsAsserted_Then_nextClkWvalidIsAsserted(); 
   `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_nextClkAwreadyIsAsserted_Then_nextClkWvalidIsAsserted Task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
      awready <= 1'b0;
      awvalid <= 1'b0;
      wvalid  <= 1'b0;
      @(posedge aclk);
      awvalid <= 1'b1;
      @(posedge aclk);
      awready <= 1'b1;
      @(posedge aclk);
      wvalid  <= 1'b1;
      `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_nextClkAwreadyIsAsserted_Then_nextClkWvalidIsAsserted Task  ended"),UVM_NONE);
  endtask

  task When_wvalidIsAsserted_Then_nextClkAwvalidIsAsserted();
   `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_nextClkAwvalidIsAsserted Task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
      awvalid <= 1'b0;
      wvalid  <= 1'b0;
      @(posedge aclk);
      wvalid <= 1'b1;
      @(posedge aclk);
      awvalid  <= 1'b1;
      `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_nextClkAwvalidIsAsserted Task  ended"),UVM_NONE);
    endtask

    task When_wvalidIsAsserted_Then_inbetween1To16ClkAwvalidIsAsserted();
      `uvm_info(name,$sformatf(" When_wvalidIsAsserted_Then_inbetween1To16ClkAwvalidIsAsserted Task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
      awvalid <= 1'b0;
      wvalid  <= 1'b0;
      repeat(5) begin //Any value between the 1 To 15  
      @(posedge aclk);
      end
      wvalid <= 1'b1;
      awvalid  <= 1'b1;
      `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_inbetween1To16ClkAwvalidIsAsserted Task  ended"),UVM_NONE);
    endtask

    task When_wvalidIsAsserted_Then_sameClkAwvalidIsAsserted();
   `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_sameClkAwvalidIsAsserted Task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
      awvalid <= 1'b0;
      wvalid  <= 1'b0;
      @(posedge aclk);
      wvalid <= 1'b1;
      awvalid  <= 1'b1;
      `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_sameClkAwvalidIsAsserted Task  ended"),UVM_NONE);
    endtask


    task When_awvalidIsAsserted_Then_nextClkWvalidIsAsserted();
   `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_nextClkWvalidIsAsserted Task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
      awvalid <= 1'b0;
      wvalid  <= 1'b0;
      @(posedge aclk);
      awvalid <= 1'b1;
      @(posedge aclk);
      wvalid  <= 1'b1;
      `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_nextClkWvalidIsAsserted Task  ended"),UVM_NONE);
    endtask

    task When_awvalidIsAsserted_Then_inbetween1To10ClkWvalidIsAsserted();
   `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_inbetween1To10ClkWvalidIsAsserted Task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
      awvalid <= 1'b0;
      wvalid  <= 1'b0;
      @(posedge aclk);
      awvalid <= 1'b1;
      repeat(5) begin
      @(posedge aclk);
      end
      wvalid  <= 1'b1;
      `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_inbetween1To10ClkWvalidIsAsserted Task  ended"),UVM_NONE);
    endtask

  task When_wvalidIsAsserted_Then_nextClkAwreadyAndWreadyAreAsserted();
   `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_nextClkAwreadyAndWreadyAreAsserted Task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
      wvalid  <= 1'b0;
      awready <= 1'b0;
      wready  <= 1'b0;
      @(posedge aclk);
      wvalid  <= 1'b1;
      @(posedge aclk);
      awready <= 1'b1;
      wready  <= 1'b1;
      `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_nextClkAwreadyAndWreadyAreAsserted Task  ended"),UVM_NONE);
  endtask

  task When_wvalidIsAsserted_Then_inbetween1To16ClkAwreadyAndWreadyAreAsserted();
   `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_inbetween1To16ClkAwreadyAndWreadyAreAsserted Task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
      wvalid  <= 1'b0;
      awready <= 1'b0;
      wready  <= 1'b0;
      @(posedge aclk);
      wvalid  <= 1'b1;
      repeat(5) begin //We can give any value between the 1 to 15 - exampe 5
      @(posedge aclk);
      end
      awready <= 1'b1;
      wready  <= 1'b1;
      `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_inbetween1To16ClkAwreadyAndWreadyAreAsserted Task  ended"),UVM_NONE);
  endtask

  task When_wvalidIsAsserted_Then_sameClkAwreadyAndWreadyAreAsserted();
   `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_sameClkAwreadyAndWreadyAreAsserted Task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
      wvalid  <= 1'b0;
      awready <= 1'b0;
      wready  <= 1'b0;
      @(posedge aclk);
      wvalid  <= 1'b1;
      awready <= 1'b1;
      wready  <= 1'b1;
      `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_sameClkAwreadyAndWreadyAreAsserted Task  ended"),UVM_NONE);
  endtask

   task When_wvalidIsAsserted_Then_awreadyAndWreadyAreLow();
   `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_awreadyAndWreadyAreLow Fail Scenario Task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
      wvalid  <= 1'b0;
      awready <= 1'b0;
      wready  <= 1'b0;
      @(posedge aclk);
      wvalid  <= 1'b1;
      `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_awreadyAndWreadyAreLow Fail Scenario Task  ended"),UVM_NONE);
  endtask


    task When_wvalidAndAwreadyAreAsserted_Then_wreadyIsLow();
   `uvm_info(name,$sformatf("When_wvalidAndAwreadyAreAsserted_Then_wreadyIsLow Fail Scenario Task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
      wvalid  <= 1'b0;
      awready <= 1'b0;
      wready  <= 1'b0;
      @(posedge aclk);
      wvalid  <= 1'b1;
      awready <= 1'b1;
      `uvm_info(name,$sformatf("When_wvalidAndAwreadyAreAsserted_Then_wreadyIsLow Fail Scenario Task  ended"),UVM_NONE);
  endtask

    task When_wvalidAndWreadyAreAsserted_Then_awreadyIsLow();
   `uvm_info(name,$sformatf("When_wvalidAndWreadyAreAsserted_Then_awreadyIsLow Fail Scenario Task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
      wvalid  <= 1'b0;
      awready <= 1'b0;
      wready  <= 1'b0;
      @(posedge aclk);
      wvalid  <= 1'b1;
      wready  <= 1'b1;
      `uvm_info(name,$sformatf("When_wvalidAndWreadyAreAsserted_Then_awreadyIsLow Fail Scenario Task  ended"),UVM_NONE);
  endtask

    task When_wvalidAndWreadyAreAsserted_Then_wstrbOfL3AndL2AreAsserted();
   `uvm_info(name,$sformatf(" When_wvalidAndWreadyAreAsserted_Then_wstrbOfL3AndL2AreAsserted Task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
      wvalid  <= 1'b0;
      wready  <= 1'b0;
      wstrb   <= 4'b0000;
      wdata   <= 32'h0000_0000;
      @(posedge aclk);
      wvalid  <= 1'b1;
      wready  <= 1'b1;
      wstrb   <= 4'b1100;
      wdata[15:0]   <= 16'h0000;
      wdata[31:16]   <= 16'hffff;
      @(posedge aclk);
      wvalid  <= 1'b0;
      wready  <= 1'b0;
      wstrb   <= 4'b0000;
      wdata   <= 32'h0000_0000;
      `uvm_info(name,$sformatf("When_wvalidAndWreadyAreAsserted_Then_wstrbOfL3AndL2AreAsserted Task  ended"),UVM_NONE);
  endtask

    task When_wvalidAndWreadyAreAsserted_Then_wstrbOfL1AndL0AreAsserted();
   `uvm_info(name,$sformatf(" When_wvalidAndWreadyAreAsserted_Then_wstrbOfL1AndL0AreAsserted Task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
      wvalid  <= 1'b0;
      wready  <= 1'b0;
      wstrb   <= 4'b0000;
      wdata   <= 32'h0000_0000;
      @(posedge aclk);
      wvalid  <= 1'b1;
      wready  <= 1'b1;
      wstrb   <= 4'b0011;
      wdata[31:16]   <= 16'h0000;
      wdata[15:0]   <= 16'h1234;
      @(posedge aclk);
      wvalid  <= 1'b0;
      wready  <= 1'b0;
      wstrb   <= 4'b0000;
      wdata   <= 32'h0000_0000;
      `uvm_info(name,$sformatf("When_wvalidAndWreadyAreAsserted_Then_wstrbOfL1AndL0AreAsserted Task  ended"),UVM_NONE);
  endtask

  task When_wvalidAndWreadyAreAsserted_Then_wstrbValueIsAllOnes_Then_wdataIsNotUnknown();
   `uvm_info(name,$sformatf("When_wvalidAndWreadyAreAsserted_Then_wstrbValueIsAllOnes_Then_wdataIsNotUnknown Task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
      wvalid  <= 1'b0;
      wready  <= 1'b0;
      wstrb   <= 4'b0000;
      wdata   <= 32'hxxxx_xxxx;
      @(posedge aclk);
      wvalid  <= 1'b1;
      wready  <= 1'b1;
      wstrb   <= 4'b1111;
      wdata   <= 32'h4433_2211; 
      `uvm_info(name,$sformatf("When_wvalidAndWreadyAreAsserted_Then_wstrbValueIsAllOnes_Then_wdataIsNotUnknown Task  ended"),UVM_NONE);
  endtask
 
  task When_wvalidAndWreadyAreAsserted_Then_sameClkWstrbIsActiveByte_Then_inbetween1To15ClkWdataIsPreviousValues();
   `uvm_info(name,$sformatf("When_wvalidAndWreadyAreAsserted_Then_sameClkWstrbIsActiveByte_Then_inbetween1To15ClkWdataIsPreviousValues( Task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
      wvalid  <= 1'b0;
      wready  <= 1'b0;
      wstrb   <= 4'b0000;
      wdata   <= 32'hxxxx_xxxx;
      @(posedge aclk);
      wvalid  <= 1'b1;
      wready  <= 1'b1;
      wstrb   <= 4'b1111;
      wdata   <= 32'h4433_2211; 
      @(posedge aclk);
      wvalid  <= 1'b0;
      wready  <= 1'b0;
      wstrb   <= 4'b0000;
      wdata   <= 32'hxxxx_xxxx; 
      repeat(10) begin
      @(posedge aclk);
      end
      wvalid  <= 1'b1;
      wready  <= 1'b1;
      wstrb   <= 4'b0101;
      wdata   <= 32'h4455_2255; 
      `uvm_info(name,$sformatf("When_wvalidAndWreadyAreAsserted_Then_sameClkWstrbIsActiveByte_Then_inbetween1To15ClkWdataIsPreviousValues  Task ended"),UVM_NONE);
  endtask


endmodule : Axi4LiteMasterWriteCoverPropertyTB

`endif


