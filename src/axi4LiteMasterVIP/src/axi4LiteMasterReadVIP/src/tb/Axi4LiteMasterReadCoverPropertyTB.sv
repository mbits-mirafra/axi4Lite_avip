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
  logic [2:0] arprot;
  //Read Data Channel Signals
  logic rvalid;
  logic [DATA_WIDTH-1:0] rdata;
  logic rready;
  logic [1:0] rresp;
  
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
                                                                    .arprot(arprot),
                                                                    .rvalid(rvalid),
                                                                    .rdata(rdata),
                                                                    .rready(rready),
                                                                    .rresp(rresp)
                                                                  );

  initial begin
    #8000;
    $finish;
  end

  initial begin
    When_arvalidIsAsserted_Then_araddrIsNotUnknownAndPrevious1ClkAraddrIsUnknown();
    When_arvalidIsAsserted_Then_arprotIsNotUnknownAndPrevious1ClkArprotIsUnknown();
    When_arvalidIsAsserted_Then_araddrIsNotUnknownAndPrevious2ClkAraddrIsUnknown();
    When_arvalidIsAsserted_Then_arprotIsNotUnknownAndPrevious2ClkArprotIsUnknown();
    When_rvalidIsAsserted_Then_rdataIsNotUnknownAndPrevious1ClkRdataIsUnknown();
    When_rvalidIsAsserted_Then_rrespIsNotUnknownAndPrevious1ClkRrespIsUnknown();
    When_rvalidIsAsserted_Then_rdataIsNotUnknownAndPrevious2ClkRdataIsUnknown();
    When_rvalidIsAsserted_Then_rrespIsNotUnknownAndPrevious2ClkRrespIsUnknown();
    When_arreadyIsLow_Then_arvalidIsAssertedAfter3Clk();
    When_rreadyIsLow_Then_rvalidIsAssertedAfter3Clk();
    When_arreadyIsLow_Then_anyClkArvalidIsAssertedThenArreadyCanBeAssertAnyTime();
    When_rreadyIsLow_Then_anyClkRvalidIsAssertedThenRreadyCanBeAssertAnyTime();
    When_arvalidIsAsserted_Then_sameClkArreadyIsAsserted();
    When_rvalidIsAsserted_Then_sameClkRreadyIsAsserted();
    When_arvalidIsAsserted_Then_remainsHigh_NextClkArreadyIsAsserted();
    When_rvalidIsAsserted_Then_remainsHigh_NextClkRreadyIsAsserted();
    When_arvalidIsAsserted_Then_remainsHigh_Then_Within1To16ClkArreadyIsAsserted();
    When_rvalidIsAsserted_Then_remainsHigh_Then_Within1To16ClkRreadyIsAsserted();
    When_arvalidIsAsserted_Then_remainsHigh_Then_arreadyIsAlwaysLow();
    When_rvalidIsAsserted_Then_remainsHigh_Then_rreadyIsAlwaysLow();
    When_BackToBackArvalidAndArreadyAsserted_Then_noDelayInbetween2Transfer();
    When_BackToBackRvalidAndRreadyAsserted_Then_noDelayInbetween2Transfer();
    When_BackToBackArvalidAndArreadyAsserted_Then_1ClkDelayInbetween2Transfer();
    When_BackToBackRvalidAndRreadyAsserted_Then_1ClkDelayInbetween2Transfer();
    When_BackToBackArvalidAndArreadyAsserted_Then_2ClkDelayInbetween2Transfer();
    When_BackToBackRvalidAndRreadyAsserted_Then_2ClkDelayInbetween2Transfer();
    When_BackToBackArvalidAndArreadyAsserted_Then_3To16ClkDelayInbetween2Transfer();
    When_BackToBackRvalidAndRreadyAsserted_Then_3To16ClkDelayInbetween2Transfer();
    When_BackToBackArvalidAndArreadyAsserted_Then_moreThan16ClkDelayInbetween2Transfer();
    When_BackToBackRvalidAndRreadyAsserted_Then_moreThan16ClkDelayInbetween2Transfer();
    When_arreadyNeedToAsserted_atleastOnce();
    When_rreadyNeedToAsserted_atleastOnce();
    When_arreadyIsAsserted_Then_sameClkDeasserted();
    When_rreadyIsAsserted_Then_sameClkDeasserted();
    When_arvalidIsAsserted_Then_nextClkArreadyIsAsserted();
    When_rvalidIsAsserted_Then_nextClkRreadyIsAsserted();
    When_arvalidIsAsserted_Then_inbetween2To5ClkArreadyIsAsserted();
    When_rvalidIsAsserted_Then_inbetween2To5ClkRreadyIsAsserted();
    When_arvalidIsAsserted_Then_within16ClkArreadyIsAsserted();
    When_rvalidIsAsserted_Then_within16ClkRreadyIsAsserted();
    When_arreadyIsAssertedAndDeasserted_Then_nextClkArvalidIsAsserted();
    When_rreadyIsAssertedAndDeasserted_Then_nextClkRvalidIsAsserted();
   
    When_arreadyIsAssertedAndDeasserted3Times_Then_nextClkArvalidIsAsserted();
    When_rreadyIsAssertedAndDeasserted3Times_Then_nextClkRvalidIsAsserted();
    
    When_arreadyIsAsserted_Then_nextClkArvalidIsAsserted();
    When_rreadyIsAsserted_Then_nextClkRvalidIsAsserted();
    When_arreadyIsAsserted_Then_inbetween2To5ClkArvalidIsAsserted();
    When_rreadyIsAsserted_Then_inbetween2To5ClkRvalidIsAsserted();
    When_arreadyIsAsserted_Then_inbetween1To15ClkArvalidIsAsserted();
    When_rreadyIsAsserted_Then_inbetween1To15ClkRvalidIsAsserted();

    When_arreadyDefaultValueIs1AndTransferOccur_Then_nextClkArreadyValueWillGoDefaultState();
    When_rreadyDefaultValueIs1AndTransferOccur_Then_nextClkRreadyValueWillGoDefaultState();
    When_arreadyDefaultValueIs0AndTransferOccur_Then_nextClkArreadyValueWillGoDefaultState();
    When_rreadyDefaultValueIs0AndTransferOccur_Then_nextClkRreadyValueWillGoDefaultState();
    When_arreadyIsHighAndSendingValidAraddrAndRdataOnSlaveLocation_Then_slaveWillGiveOkayResponse();
    When_arvalidAndArreadyAsserted_Then_nextClkRvalidIsAsserted();
    When_arvalidAndArreadyAsserted_Then_at3ClkRvalidIsAsserted();
    When_arvalidAndArreadyAsserted_Then_inbetween1To10ClkRvalidIsAsserted();
    When_arvalidAndArreadyAsserted_Then_anyClkRvalidIsLow();
    When_arvalidAndArreadyAreAsserted_Then_inbetween1To10ClkRvalidIsAssertedAndRdataIsNotUnknown();
    When_arvalidAndArreadyAreAsserted_Then_rdataOflowerLanesIsValidData();
    When_araddrIsAsserted_Then_nextClkRdataIsAsserted();
    When_araddrIsAsserted_Then_inbetween1To10ClkRdataIsAsserted();
    When_rdataIsAsserted_Then_nextClkAraddrIsAsserted();
    When_rdataIsAsserted_Then_inbetween1To10ClkAraddrIsAsserted(); 
    When_masterIssuesMulipleTxThenSlaveNeedToSupportsMultipleOutstanding();
    When_masterIssuesMulipleTxThenSlaveIsNotSupportsMultipleOutstanding();
    When_masterAndSlaveIsNotSupportsMultipleOutstanding();
end


  task When_arvalidIsAsserted_Then_araddrIsNotUnknownAndPrevious1ClkAraddrIsUnknown();
    `uvm_info(name,$sformatf("When_arvalidIsAsserted_Then_araddrIsNotUnknownAndPrevious1ClkAraddrIsUnknown Task started"),UVM_NONE);
      @(posedge aclk);  
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      araddr  <= 32'hxxxx_xxxx;
      repeat(1) begin
      @(posedge aclk);
      end
      arvalid <= 1'b1;
      araddr  <= 32'h2222_1234;
   `uvm_info(name,$sformatf("When_arvalidIsAsserted_Then_araddrIsNotUnknownAndPrevious1ClkAraddrIsUnknown Task Ended"),UVM_NONE);
  endtask

  task When_arvalidIsAsserted_Then_arprotIsNotUnknownAndPrevious1ClkArprotIsUnknown();
    `uvm_info(name,$sformatf("When_arvalidIsAsserted_Then_arprotIsNotUnknownAndPrevious1ClkArprotIsUnknown Task started"),UVM_NONE);
      @(posedge aclk);  
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      arprot  <= 3'bxxx;
      repeat(1) begin
      @(posedge aclk);
      end
      arvalid <= 1'b1;
      arprot  <= 3'b111;
   `uvm_info(name,$sformatf("When_arvalidIsAsserted_Then_arprotIsNotUnknownAndPrevious1ClkArprotIsUnknown Task Ended"),UVM_NONE);
  endtask

  task When_arvalidIsAsserted_Then_araddrIsNotUnknownAndPrevious2ClkAraddrIsUnknown();
    `uvm_info(name,$sformatf("When_arvalidIsAsserted_Then_araddrIsNotUnknownAndPrevious2ClkAraddrIsUnknown Task started"),UVM_NONE);
      @(posedge aclk);  
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      araddr  <= 32'hxxxx_xxxx;
      repeat(2) begin
      @(posedge aclk);
      end
      arvalid <= 1'b1;
      araddr  <= 32'h2222_1234;
   `uvm_info(name,$sformatf("When_arvalidIsAsserted_Then_araddrIsNotUnknownAndPrevious2ClkAraddrIsUnknown Task Ended"),UVM_NONE);
  endtask

  task When_arvalidIsAsserted_Then_arprotIsNotUnknownAndPrevious2ClkArprotIsUnknown();
    `uvm_info(name,$sformatf("When_arvalidIsAsserted_Then_arprotIsNotUnknownAndPrevious2ClkArprotIsUnknown Task started"),UVM_NONE);
      @(posedge aclk);  
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      arprot  <= 3'bxxx;
      repeat(2) begin
      @(posedge aclk);
      end
      arvalid <= 1'b1;
      arprot  <= 3'b111;
   `uvm_info(name,$sformatf("When_arvalidIsAsserted_Then_arprotIsNotUnknownAndPrevious2ClkArprotIsUnknown Task Ended"),UVM_NONE);
  endtask


  task When_rvalidIsAsserted_Then_rdataIsNotUnknownAndPrevious1ClkRdataIsUnknown();
    `uvm_info(name,$sformatf("When_rvalidIsAsserted_Then_rdataIsNotUnknownAndPrevious1ClkRdataIsUnknown  Task started"),UVM_NONE);
      @(posedge aclk);  
      aresetn <= 1'b1;
      rvalid  <= 1'b0;
      rdata   <= 32'hxxxx_xxxx;
      repeat(1) begin
      @(posedge aclk);
      end
      rvalid  <= 1'b1;
      rdata   <= 32'h2222_3333;
    `uvm_info(name,$sformatf("When_rvalidIsAsserted_Then_rdataIsNotUnknownAndPrevious1ClkRdataIsUnknown Task Ended"),UVM_NONE);
  endtask

  task When_rvalidIsAsserted_Then_rrespIsNotUnknownAndPrevious1ClkRrespIsUnknown();
    `uvm_info(name,$sformatf("When_rvalidIsAsserted_Then_rrespIsNotUnknownAndPrevious1ClkRrespIsUnknown Task started"),UVM_NONE);
      @(posedge aclk);  
      aresetn <= 1'b1;
      rvalid  <= 1'b0;
      rresp   <= 2'bxx;
      repeat(1) begin
      @(posedge aclk);
      end
      rvalid  <= 1'b1;
      rresp   <= 2'b00;
    `uvm_info(name,$sformatf("When_rvalidIsAsserted_Then_rrespIsNotUnknownAndPrevious1ClkRrespIsUnknown Task Ended"),UVM_NONE);
  endtask

  task When_rvalidIsAsserted_Then_rdataIsNotUnknownAndPrevious2ClkRdataIsUnknown();
    `uvm_info(name,$sformatf("When_rvalidIsAsserted_Then_rdataIsNotUnknownAndPrevious2ClkRdataIsUnknown  Task started"),UVM_NONE);
      @(posedge aclk);  
      aresetn <= 1'b1;
      rvalid  <= 1'b0;
      rdata   <= 32'hxxxx_xxxx;
      repeat(2) begin
      @(posedge aclk);
      end
      rvalid  <= 1'b1;
      rdata   <= 32'h2222_3333;
    `uvm_info(name,$sformatf("When_rvalidIsAsserted_Then_rdataIsNotUnknownAndPrevious2ClkRdataIsUnknown Task Ended"),UVM_NONE);
  endtask

  task When_rvalidIsAsserted_Then_rrespIsNotUnknownAndPrevious2ClkRrespIsUnknown();
    `uvm_info(name,$sformatf("When_rvalidIsAsserted_Then_rrespIsNotUnknownAndPrevious2ClkRrespIsUnknown Task started"),UVM_NONE);
      @(posedge aclk);  
      aresetn <= 1'b1;
      rvalid  <= 1'b0;
      rresp   <= 2'bxx;
      repeat(2) begin
      @(posedge aclk);
      end
      rvalid  <= 1'b1;
      rresp   <= 2'b00;
    `uvm_info(name,$sformatf("When_rvalidIsAsserted_Then_rrespIsNotUnknownAndPrevious2ClkRrespIsUnknown Task Ended"),UVM_NONE);
  endtask

  task When_arreadyIsLow_Then_arvalidIsAssertedAfter3Clk();
    `uvm_info(name,$sformatf("When_arreadyIsLow_Then_arvalidIsAssertedAfter3Clk Task started"),UVM_NONE);
      @(posedge aclk);  
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      arready <= 1'b0;
      repeat(3) begin
      @(posedge aclk);
      end
      arvalid <= 1'b1;
    `uvm_info(name,$sformatf("When_arreadyIsLow_Then_arvalidIsAssertedAfter3Clk Task Ended"),UVM_NONE);
  endtask

  task When_rreadyIsLow_Then_rvalidIsAssertedAfter3Clk();
    `uvm_info(name,$sformatf("When_rreadyIsLow_Then_rvalidIsAssertedAfter3Clk Task started"),UVM_NONE);
     @(posedge aclk);
     aresetn <= 1'b1;
      rvalid <= 1'b0;
      rready <= 1'b0;
      repeat(3) begin
      @(posedge aclk);
      end
      rvalid <= 1'b1;
    `uvm_info(name,$sformatf("When_rreadyIsLow_Then_rvalidIsAssertedAfter3Clk Task Ended"),UVM_NONE);
  endtask
 
  task When_arreadyIsLow_Then_anyClkArvalidIsAssertedThenArreadyCanBeAssertAnyTime();
    `uvm_info(name,$sformatf("When_arreadyIsLow_Then_anyClkArvalidIsAssertedThenArreadyCanBeAssertAnyTime Task started"),UVM_NONE);
     @(posedge aclk);
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      arready <= 1'b0;
      repeat(4) begin
      @(posedge aclk);
      end
      arvalid <= 1'b1;
      repeat(2) begin
      @(posedge aclk);
      end
      arready <= 1'b1;
    `uvm_info(name,$sformatf("When_arreadyIsLow_Then_anyClkArvalidIsAssertedThenArreadyCanBeAssertAnyTime  Task Ended"),UVM_NONE);
  endtask

  task When_rreadyIsLow_Then_anyClkRvalidIsAssertedThenRreadyCanBeAssertAnyTime();
    `uvm_info(name,$sformatf("When_rreadyIsLow_Then_anyClkRvalidIsAssertedThenRreadyCanBeAssertAnyTime Task started"),UVM_NONE);
     @(posedge aclk);
      aresetn <= 1'b1;
      rvalid  <= 1'b0;
      rready  <= 1'b0;
      repeat(4) begin
      @(posedge aclk);
      end
      rvalid  <= 1'b1;
      repeat(2) begin
      @(posedge aclk);
      end
      rready  <= 1'b1;
    `uvm_info(name,$sformatf("When_rreadyIsLow_Then_anyClkRvalidIsAssertedThenRreadyCanBeAssertAnyTime Task Ended"),UVM_NONE);
  endtask

 task When_arvalidIsAsserted_Then_sameClkArreadyIsAsserted();
    `uvm_info(name,$sformatf("When_arvalidIsAsserted_Then_sameClkArreadyIsAsserted Task started"),UVM_NONE);
     @(posedge aclk);
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      arready <= 1'b0;
      @(posedge aclk);
      arvalid <= 1'b1;
      arready <= 1'b1;
    `uvm_info(name,$sformatf("When_arvalidIsAsserted_Then_sameClkArreadyIsAsserted Task Ended"),UVM_NONE);
 endtask

 task When_rvalidIsAsserted_Then_sameClkRreadyIsAsserted();
    `uvm_info(name,$sformatf("When_rvalidIsAsserted_Then_sameClkRreadyIsAsserted Task started"),UVM_NONE);
     @(posedge aclk);
     aresetn <= 1'b1;
      rvalid <= 1'b0;
      rready <= 1'b0;
      @(posedge aclk);
      rvalid <= 1'b1;
      rready <= 1'b1;
    `uvm_info(name,$sformatf("When_rvalidIsAsserted_Then_sameClkRreadyIsAsserted Task Ended"),UVM_NONE);
 endtask

  task When_arvalidIsAsserted_Then_remainsHigh_NextClkArreadyIsAsserted();
    `uvm_info(name,$sformatf("When_arvalidIsAsserted_Then_remainsHigh_NextClkArreadyIsAsserted Task started"),UVM_NONE);
     @(posedge aclk);
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      arready <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      arvalid <= 1'b1;
      @(posedge aclk);
      arready <= 1'b1;
    `uvm_info(name,$sformatf("When_arvalidIsAsserted_Then_remainsHigh_NextClkArreadyIsAsserted  Task Ended"),UVM_NONE);
  endtask

  task When_rvalidIsAsserted_Then_remainsHigh_NextClkRreadyIsAsserted();
    `uvm_info(name,$sformatf("When_rvalidIsAsserted_Then_remainsHigh_NextClkRreadyIsAsserted Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      rvalid  <= 1'b0;
      rready  <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      rvalid  <= 1'b1;
      @(posedge aclk);
      rready  <= 1'b1;
    `uvm_info(name,$sformatf("When_rvalidIsAsserted_Then_remainsHigh_NextClkRreadyIsAsserted  Task Ended"),UVM_NONE);
  endtask

  task When_arvalidIsAsserted_Then_remainsHigh_Then_Within1To16ClkArreadyIsAsserted();
   `uvm_info(name,$sformatf("When_arvalidIsAsserted_Then_remainsHigh_Then_Within1To16ClkArreadyIsAsserted Task started"),UVM_NONE);
     @(posedge aclk);
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      arready <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      arvalid <= 1'b1;
      repeat(10) begin
      @(posedge aclk);
      end
      arready <= 1'b1;
    `uvm_info(name,$sformatf("When_arvalidIsAsserted_Then_remainsHigh_Then_Within1To16ClkArreadyIsAsserted Task Ended"),UVM_NONE);
  endtask

 task When_rvalidIsAsserted_Then_remainsHigh_Then_Within1To16ClkRreadyIsAsserted();
   `uvm_info(name,$sformatf("When_rvalidIsAsserted_Then_remainsHigh_Then_Within1To16ClkRreadyIsAsserted Task started"),UVM_NONE);
     @(posedge aclk);
      aresetn<= 1'b1;
      rvalid <= 1'b0;
      rready <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      rvalid <= 1'b1;
      repeat(10) begin
      @(posedge aclk);
      end
      rready <= 1'b1;
    `uvm_info(name,$sformatf("When_rvalidIsAsserted_Then_remainsHigh_Then_Within1To16ClkRreadyIsAsserted Task Ended"),UVM_NONE);
  endtask

  task When_arvalidIsAsserted_Then_remainsHigh_Then_arreadyIsAlwaysLow();
   `uvm_info(name,$sformatf("When_arvalidIsAsserted_Then_remainsHigh_Then_arreadyIsAlwaysLow Task started"),UVM_NONE);
     @(posedge aclk);
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      arready <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      arvalid <= 1'b1;
    `uvm_info(name,$sformatf("When_arvalidIsAsserted_Then_remainsHigh_Then_arreadyIsAlwaysLow  Task Ended"),UVM_NONE);
  endtask

  task When_rvalidIsAsserted_Then_remainsHigh_Then_rreadyIsAlwaysLow();
   `uvm_info(name,$sformatf("When_rvalidIsAsserted_Then_remainsHigh_Then_rreadyIsAlwaysLow Task started"),UVM_NONE);
     @(posedge aclk);
      aresetn <= 1'b1;
      rvalid  <= 1'b0;
      rready  <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      rvalid  <= 1'b1;
    `uvm_info(name,$sformatf("When_rvalidIsAsserted_Then_remainsHigh_Then_rreadyIsAlwaysLow  Task Ended"),UVM_NONE);
  endtask

  task When_BackToBackArvalidAndArreadyAsserted_Then_noDelayInbetween2Transfer();
   `uvm_info(name,$sformatf("When_BackToBackArvalidAndArreadyAsserted_Then_noDelayInbetween2Transfer Task started"),UVM_NONE);
     @(posedge aclk);
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      arready <= 1'b0;
      @(posedge aclk);
      arvalid <= 1'b1;
      @(posedge aclk);
      arready <= 1'b1;
      repeat(2) begin
      @(posedge aclk);
      end
      arvalid <= 1'b0;
      arready <= 1'b0;
    `uvm_info(name,$sformatf("When_BackToBackArvalidAndArreadyAsserted_Then_noDelayInbetween2Transfer Task Ended"),UVM_NONE);
  endtask

  task When_BackToBackRvalidAndRreadyAsserted_Then_noDelayInbetween2Transfer();
   `uvm_info(name,$sformatf("When_BackToBackRvalidAndRreadyAsserted_Then_noDelayInbetween2Transfer Task started"),UVM_NONE);
     @(posedge aclk);
      aresetn <= 1'b1;
      rvalid  <= 1'b0;
      rready  <= 1'b0;
      @(posedge aclk);
      rvalid  <= 1'b1;
      @(posedge aclk);
      rready  <= 1'b1;
      repeat(2) begin
      @(posedge aclk);
      end
      rvalid  <= 1'b0;
      rready  <= 1'b0;
    `uvm_info(name,$sformatf("When_BackToBackRvalidAndRreadyAsserted_Then_noDelayInbetween2Transfer Task Ended"),UVM_NONE);
  endtask

  task When_BackToBackArvalidAndArreadyAsserted_Then_1ClkDelayInbetween2Transfer();
   `uvm_info(name,$sformatf("When_BackToBackArvalidAndArreadyAsserted_Then_1ClkDelayInbetween2Transfer Task started"),UVM_NONE);
     @(posedge aclk);
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      arready <= 1'b0;
      @(posedge aclk);
      arvalid <= 1'b1;
      arready <= 1'b1;
      @(posedge aclk);
      arvalid <= 1'b0;
      arready <= 1'b0;
      @(posedge aclk);
      arvalid <= 1'b1;
      arready <= 1'b1;
    `uvm_info(name,$sformatf("When_BackToBackArvalidAndArreadyAsserted_Then_1ClkDelayInbetween2Transfer  Task Ended"),UVM_NONE);
  endtask

  task When_BackToBackRvalidAndRreadyAsserted_Then_1ClkDelayInbetween2Transfer();
   `uvm_info(name,$sformatf("When_BackToBackRvalidAndRreadyAsserted_Then_1ClkDelayInbetween2Transfer Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      rvalid  <= 1'b0;
      rready  <= 1'b0;
      @(posedge aclk);
      rvalid  <= 1'b1;
      rready  <= 1'b1;
      @(posedge aclk);
      rvalid  <= 1'b0;
      rready  <= 1'b0;
      @(posedge aclk);
      rvalid  <= 1'b1;
      rready  <= 1'b1;
    `uvm_info(name,$sformatf("When_BackToBackRvalidAndRreadyAsserted_Then_1ClkDelayInbetween2Transfer Task Ended"),UVM_NONE);
  endtask

  task When_BackToBackArvalidAndArreadyAsserted_Then_2ClkDelayInbetween2Transfer();
   `uvm_info(name,$sformatf("When_BackToBackArvalidAndArreadyAsserted_Then_2ClkDelayInbetween2Transfer Task started"),UVM_NONE);
     @(posedge aclk);
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      arready <= 1'b0;
      @(posedge aclk);
      arvalid <= 1'b1;
      arready <= 1'b1;
      @(posedge aclk);
      arvalid <= 1'b0;
      arready <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      arvalid <= 1'b1;
      arready <= 1'b1;
    `uvm_info(name,$sformatf("When_BackToBackArvalidAndArreadyAsserted_Then_2ClkDelayInbetween2Transfer  Task Ended"),UVM_NONE);
  endtask

  task When_BackToBackRvalidAndRreadyAsserted_Then_2ClkDelayInbetween2Transfer();
   `uvm_info(name,$sformatf("When_BackToBackRvalidAndRreadyAsserted_Then_2ClkDelayInbetween2Transfer Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      rvalid  <= 1'b0;
      rready  <= 1'b0;
      @(posedge aclk);
      rvalid  <= 1'b1;
      rready  <= 1'b1;
      @(posedge aclk);
      rvalid  <= 1'b0;
      rready  <= 1'b0;
      repeat(2) begin
      @(posedge aclk);
      end
      rvalid  <= 1'b1;
      rready  <= 1'b1;
    `uvm_info(name,$sformatf("When_BackToBackRvalidAndRreadyAsserted_Then_2ClkDelayInbetween2Transfer  Task Ended"),UVM_NONE);
  endtask

 task When_BackToBackArvalidAndArreadyAsserted_Then_3To16ClkDelayInbetween2Transfer();
  `uvm_info(name,$sformatf("When_BackToBackArvalidAndArreadyAsserted_Then_3To16ClkDelayInbetween2Transfer Task started"),UVM_NONE);
     @(posedge aclk);
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      arready <= 1'b0;
      @(posedge aclk);
      arvalid <= 1'b1;
      arready <= 1'b1;
      @(posedge aclk);
      arvalid <= 1'b0;
      arready <= 1'b0;
      repeat(8) begin  //Delay We can give anything inbetween 3 to 16 
      @(posedge aclk);
      end
      arvalid <= 1'b1;
      arready <= 1'b1;
    `uvm_info(name,$sformatf("When_BackToBackArvalidAndArreadyAsserted_Then_3To16ClkDelayInbetween2Transfer  Task Ended"),UVM_NONE);
  endtask

  task When_BackToBackRvalidAndRreadyAsserted_Then_3To16ClkDelayInbetween2Transfer();
   `uvm_info(name,$sformatf("When_BackToBackRvalidAndRreadyAsserted_Then_3To16ClkDelayInbetween2Transfer Task started"),UVM_NONE);
     @(posedge aclk);
      aresetn<= 1'b1;
      rvalid <= 1'b0;
      rready <= 1'b0;
      @(posedge aclk);
      rvalid <= 1'b1;
      rready <= 1'b1;
      @(posedge aclk);
      rvalid <= 1'b0;
      rready <= 1'b0;  
      repeat(8) begin //Delay We can give anything inbetween 3 to 16
      @(posedge aclk);
      end
      rvalid <= 1'b1;
      rready <= 1'b1;
    `uvm_info(name,$sformatf("When_BackToBackRvalidAndRreadyAsserted_Then_3To16ClkDelayInbetween2Transfer  Task Ended"),UVM_NONE);
  endtask

  task When_BackToBackArvalidAndArreadyAsserted_Then_moreThan16ClkDelayInbetween2Transfer();
  `uvm_info(name,$sformatf("When_BackToBackArvalidAndArreadyAsserted_Then_moreThan16ClkDelayInbetween2Transfer Task started"),UVM_NONE);
    @(posedge aclk);
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      arready <= 1'b0;
      @(posedge aclk);
      arvalid <= 1'b1;
      arready <= 1'b1;
      @(posedge aclk);
      arvalid <= 1'b0;
      arready <= 1'b0;
      repeat(18) begin  //Delay We can give anything like more than 16 
      @(posedge aclk);
      end
      arvalid <= 1'b1;
      arready <= 1'b1;
    `uvm_info(name,$sformatf("When_BackToBackArvalidAndArreadyAsserted_Then_moreThan16ClkDelayInbetween2Transfer  Task Ended"),UVM_NONE);
  endtask

  task When_BackToBackRvalidAndRreadyAsserted_Then_moreThan16ClkDelayInbetween2Transfer();
     `uvm_info(name,$sformatf("When_BackToBackRvalidAndRreadyAsserted_Then_moreThan16ClkDelayInbetween2Transfer Task started"),UVM_NONE);
      @(posedge aclk);  
      aresetn <= 1'b1;
      rvalid  <= 1'b0;
      rready  <= 1'b0;
      @(posedge aclk);
      rvalid  <= 1'b1;
      rready  <= 1'b1;
      @(posedge aclk);
      rvalid  <= 1'b0;
      rready  <= 1'b0;
      repeat(18) begin  //Delay We can give anything like more than 16 
      @(posedge aclk);
      end
      rvalid  <= 1'b1;
      rready  <= 1'b1;
    `uvm_info(name,$sformatf("When_BackToBackRvalidAndRreadyAsserted_Then_moreThan16ClkDelayInbetween2Transfer  Task Ended"),UVM_NONE);
  endtask

  task When_arreadyNeedToAsserted_atleastOnce();
  `uvm_info(name,$sformatf("When_arreadyNeedToAsserted_atleastOnce Task started"),UVM_NONE);
     @(posedge aclk);
      aresetn <= 1'b1;
      arready <= 1'b0;
      @(posedge aclk);
      arready <= 1'b1;
    `uvm_info(name,$sformatf("When_arreadyNeedToAsserted_atleastOnce Task Ended"),UVM_NONE);
  endtask

 task When_rreadyNeedToAsserted_atleastOnce();
  `uvm_info(name,$sformatf("When_rreadyNeedToAsserted_atleastOnce Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      rready  <= 1'b0;
      @(posedge aclk);
      rready  <= 1'b1;
    `uvm_info(name,$sformatf("When_rreadyNeedToAsserted_atleastOnce Task Ended"),UVM_NONE);
 endtask

 task When_arreadyIsAsserted_Then_sameClkDeasserted();
  `uvm_info(name,$sformatf("When_arreadyIsAsserted_Then_sameClkDeasserted Task started"),UVM_NONE);
     @(posedge aclk);
      aresetn <= 1'b1;
      arready <= 1'b0;
      @(posedge aclk);
      arready <= 1'b1;
      #2;
      arready <= 1'b0;
    `uvm_info(name,$sformatf("When_arreadyIsAsserted_Then_sameClkDeasserted Task Ended"),UVM_NONE);
  endtask

  task When_rreadyIsAsserted_Then_sameClkDeasserted();
  `uvm_info(name,$sformatf("When_rreadyIsAsserted_Then_sameClkDeasserted Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn<= 1'b1;
      rready <= 1'b0;
      @(posedge aclk);
      rready <= 1'b1;
      #2;
      rready <= 1'b0;
    `uvm_info(name,$sformatf("When_rreadyIsAsserted_Then_sameClkDeasserted Task Ended"),UVM_NONE);
  endtask
 
  task When_arvalidIsAsserted_Then_nextClkArreadyIsAsserted();
   `uvm_info(name,$sformatf("When_arvalidIsAsserted_Then_nextClkArreadyIsAsserted Task started"),UVM_NONE);
    @(posedge aclk);
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      arready <= 1'b0;
      @(posedge aclk);
      arvalid <= 1'b1;
      @(posedge aclk);
      arready <= 1'b1;
    `uvm_info(name,$sformatf("When_arvalidIsAsserted_Then_nextClkArreadyIsAsserted Task Ended"),UVM_NONE);
  endtask

  task When_rvalidIsAsserted_Then_nextClkRreadyIsAsserted();
   `uvm_info(name,$sformatf("When_rvalidIsAsserted_Then_nextClkRreadyIsAsserted Task started"),UVM_NONE);
    @(posedge aclk);
      aresetn <= 1'b1;
      rvalid  <= 1'b0;
      rready  <= 1'b0;
      @(posedge aclk);
      rvalid  <= 1'b1;
      @(posedge aclk);
      rready  <= 1'b1;
    `uvm_info(name,$sformatf("When_rvalidIsAsserted_Then_nextClkRreadyIsAsserted Task Ended"),UVM_NONE);
  endtask

  task When_arvalidIsAsserted_Then_inbetween2To5ClkArreadyIsAsserted();
   `uvm_info(name,$sformatf("When_arvalidIsAsserted_Then_inbetween2To5ClkArreadyIsAsserted Task started"),UVM_NONE);
     @(posedge aclk);
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      arready <= 1'b0;
      @(posedge aclk);
      arvalid <= 1'b1;
      repeat(3) begin
      @(posedge aclk);
      end
      arready <= 1'b1;
    `uvm_info(name,$sformatf("When_arvalidIsAsserted_Then_inbetween2To5ClkArreadyIsAsserted Task Ended"),UVM_NONE);
  endtask
 
  task When_rvalidIsAsserted_Then_inbetween2To5ClkRreadyIsAsserted();
   `uvm_info(name,$sformatf("When_rvalidIsAsserted_Then_inbetween2To5ClkRreadyIsAsserted Task started"),UVM_NONE);
     @(posedge aclk);
      aresetn <= 1'b1;
      rvalid  <= 1'b0;
      rready  <= 1'b0;
      @(posedge aclk);
      rvalid  <= 1'b1;
      repeat(3) begin
      @(posedge aclk);
      end
      rready  <= 1'b1;
    `uvm_info(name,$sformatf("When_rvalidIsAsserted_Then_inbetween2To5ClkRreadyIsAsserted Task Ended"),UVM_NONE);
  endtask

  task When_arvalidIsAsserted_Then_within16ClkArreadyIsAsserted();
   `uvm_info(name,$sformatf("When_arvalidIsAsserted_Then_within16ClkArreadyIsAsserted task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      arready <= 1'b0;
      @(posedge aclk);
      arvalid <= 1'b1;
      repeat(10) begin //here instead of 10 we can give anything in between 1 to 16
      @(posedge aclk);
      end
      arready <= 1'b1;
    `uvm_info(name,$sformatf("When_arvalidIsAsserted_Then_within16ClkArreadyIsAsserted task ended"),UVM_NONE);
  endtask

  task When_rvalidIsAsserted_Then_within16ClkRreadyIsAsserted();
   `uvm_info(name,$sformatf("When_rvalidIsAsserted_Then_within16ClkRreadyIsAsserted task started"),UVM_NONE);
    @(posedge aclk);
    aresetn<= 1'b1;
    rvalid <= 1'b0;
    rready <= 1'b0;
    @(posedge aclk);
    rvalid <= 1'b1;
    repeat(10) begin //here instead of 10 we can give anything in between 1 to 16
    @(posedge aclk);
    end
    rready <= 1'b1;
    `uvm_info(name,$sformatf("When_rvalidIsAsserted_Then_within16ClkRreadyIsAsserted task ended"),UVM_NONE);
  endtask

  task When_arreadyIsAssertedAndDeasserted_Then_nextClkArvalidIsAsserted();
   `uvm_info(name,$sformatf("When_arreadyIsAssertedAndDeasserted_Then_nextClkArvalidIsAsserted task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      arready <= 1'b0;
      @(posedge aclk);
      arready <= 1'b1;
      @(posedge aclk);
      arready <= 1'b0;
      @(posedge aclk);
      arvalid <= 1'b1;
    `uvm_info(name,$sformatf("When_arreadyIsAssertedAndDeasserted_Then_nextClkArvalidIsAsserted task ended"),UVM_NONE);
  endtask

  task When_rreadyIsAssertedAndDeasserted_Then_nextClkRvalidIsAsserted();
   `uvm_info(name,$sformatf("When_rreadyIsAssertedAndDeasserted_Then_nextClkRvalidIsAsserted task started"),UVM_NONE);
      @(posedge aclk);
      aresetn<= 1'b1;
      rvalid <= 1'b0;
      rready <= 1'b0;
      @(posedge aclk);
      rready <= 1'b1;
      @(posedge aclk);
      rready <= 1'b0;
      @(posedge aclk);
      rvalid <= 1'b1;
    `uvm_info(name,$sformatf("When_rreadyIsAssertedAndDeasserted_Then_nextClkRvalidIsAsserted task ended"),UVM_NONE);
  endtask

  task When_arreadyIsAssertedAndDeasserted3Times_Then_nextClkArvalidIsAsserted();
   `uvm_info(name,$sformatf("When_arreadyIsAssertedAndDeasserted3Times_Then_nextClkArvalidIsAsserted task started"),UVM_NONE);
     @(posedge aclk);
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      arready <= 1'b0;
      @(posedge aclk);
      arready <= 1'b1;
      @(posedge aclk);
      arready <= 1'b0;
      @(posedge aclk);
      arready <= 1'b1;
      @(posedge aclk);
      arready <= 1'b0;
      @(posedge aclk);
      arready <= 1'b1;
      @(posedge aclk);
      arready <= 1'b0;
      @(posedge aclk);
      arvalid <= 1'b1;
    `uvm_info(name,$sformatf("When_arreadyIsAssertedAndDeasserted3Times_Then_nextClkArvalidIsAsserted task ended"),UVM_NONE);
  endtask

  task When_rreadyIsAssertedAndDeasserted3Times_Then_nextClkRvalidIsAsserted();
   `uvm_info(name,$sformatf("When_rreadyIsAssertedAndDeasserted3Times_Then_nextClkRvalidIsAsserted Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      rvalid  <= 1'b0;
      rready  <= 1'b0;
      @(posedge aclk);
      rready  <= 1'b1;
      @(posedge aclk);
      rready  <= 1'b0;
      @(posedge aclk);
      rready  <= 1'b1;
      @(posedge aclk);
      rready  <= 1'b0;
      @(posedge aclk);
      rready  <= 1'b1;
      @(posedge aclk);
      rready  <= 1'b0;
      @(posedge aclk);
      rvalid  <= 1'b1;
    `uvm_info(name,$sformatf("When_rreadyIsAssertedAndDeasserted3Times_Then_nextClkRvalidIsAsserted task ended"),UVM_NONE);
  endtask

  task When_arreadyIsAsserted_Then_nextClkArvalidIsAsserted();
   `uvm_info(name,$sformatf("When_arreadyIsAsserted_Then_nextClkArvalidIsAsserted task started"),UVM_NONE);
     @(posedge aclk);
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      arready <= 1'b0;
      @(posedge aclk);
      arready <= 1'b1;
      @(posedge aclk);
      arvalid <= 1'b1;
    `uvm_info(name,$sformatf("When_arreadyIsAsserted_Then_nextClkArvalidIsAsserted task ended"),UVM_NONE);
  endtask

  task When_rreadyIsAsserted_Then_nextClkRvalidIsAsserted();
   `uvm_info(name,$sformatf("When_rreadyIsAsserted_Then_nextClkRvalidIsAsserted Task started"),UVM_NONE);
     @(posedge aclk);
      aresetn <= 1'b1;
      rvalid  <= 1'b0;
      rready  <= 1'b0;
      @(posedge aclk);
      rready  <= 1'b1;
      @(posedge aclk);
      rvalid  <= 1'b1;
    `uvm_info(name,$sformatf("When_rreadyIsAsserted_Then_nextClkRvalidIsAsserted task ended"),UVM_NONE);
  endtask

  task When_arreadyIsAsserted_Then_inbetween2To5ClkArvalidIsAsserted();
   `uvm_info(name,$sformatf("When_arreadyIsAsserted_Then_inbetween2To5ClkArvalidIsAsserted task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      arready <= 1'b0;
      @(posedge aclk);
      arready <= 1'b1;
      repeat(3) begin //Here inbetween 2 to 5 anyvalue you can give
      @(posedge aclk);
      end
      arvalid <= 1'b1;
    `uvm_info(name,$sformatf("When_arreadyIsAsserted_Then_inbetween2To5ClkArvalidIsAsserted task ended"),UVM_NONE);
  endtask

  task When_rreadyIsAsserted_Then_inbetween2To5ClkRvalidIsAsserted();
   `uvm_info(name,$sformatf("When_rreadyIsAsserted_Then_inbetween2To5ClkRvalidIsAsserted task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      rvalid  <= 1'b0;
      rready  <= 1'b0;
      @(posedge aclk);
      rready  <= 1'b1;
      repeat(3) begin //Here inbetween 2 to 5 anyvalue you can give
      @(posedge aclk);
      end
      rvalid  <= 1'b1;
    `uvm_info(name,$sformatf("When_rreadyIsAsserted_Then_inbetween2To5ClkRvalidIsAsserted task ended"),UVM_NONE);
  endtask

    task When_arreadyIsAsserted_Then_inbetween1To15ClkArvalidIsAsserted();
   `uvm_info(name,$sformatf("When_arreadyIsAsserted_Then_inbetween1To15ClkArvalidIsAsserted task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      arready <= 1'b0;
      @(posedge aclk);
      arready <= 1'b1;
      repeat(5) begin //Here anyvalue between the 1 to 15 you can give example 5
      @(posedge aclk);
      end
      arvalid <= 1'b1;
    `uvm_info(name,$sformatf("When_arreadyIsAsserted_Then_inbetween1To15ClkArvalidIsAsserted task ended"),UVM_NONE);
  endtask

  task When_rreadyIsAsserted_Then_inbetween1To15ClkRvalidIsAsserted();
   `uvm_info(name,$sformatf("When_rreadyIsAsserted_Then_inbetween1To15ClkRvalidIsAsserted task started"),UVM_NONE);
     @(posedge aclk);
      aresetn<= 1'b1;
      rvalid <= 1'b0;
      rready <= 1'b0;
      @(posedge aclk);
      rready <= 1'b1;
      repeat(5) begin //Here anyvalue between the 1 to 15 you can give example 5
      @(posedge aclk);
      end
      rvalid <= 1'b1;
    `uvm_info(name,$sformatf("When_rreadyIsAsserted_Then_inbetween1To15ClkRvalidIsAsserted task ended"),UVM_NONE);
  endtask

task When_arreadyDefaultValueIs1AndTransferOccur_Then_nextClkArreadyValueWillGoDefaultState();
   `uvm_info(name,$sformatf("When_arreadyDefaultValueIs1AndTransferOccur_Then_nextClkArreadyValueWillGoDefaultState"),UVM_NONE);
     @(posedge aclk);
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      arready <= 1'b1;
      @(posedge aclk);
      arready <= 1'b0;
      @(posedge aclk);
      arready <= 1'b1;
      arvalid <= 1'b1;
      @(posedge aclk);
      arvalid <= 1'b0;
    `uvm_info(name,$sformatf("When_arreadyDefaultValueIs1AndTransferOccur_Then_nextClkArreadyValueWillGoDefaultState Task ended"),UVM_NONE);
  endtask

  task When_rreadyDefaultValueIs1AndTransferOccur_Then_nextClkRreadyValueWillGoDefaultState();
   `uvm_info(name,$sformatf("When_rreadyDefaultValueIs1AndTransferOccur_Then_nextClkRreadyValueWillGoDefaultState task started"),UVM_NONE);
      @(posedge aclk);
      aresetn<= 1'b1;
      rvalid <= 1'b0;
      rready <= 1'b1;
      @(posedge aclk);
      rready <= 1'b0;
      @(posedge aclk);
      rready <= 1'b1;
      rvalid <= 1'b1;
      @(posedge aclk);
      rvalid <= 1'b0;
    `uvm_info(name,$sformatf("When_rreadyDefaultValueIs1AndTransferOccur_Then_nextClkRreadyValueWillGoDefaultState task ended"),UVM_NONE);
  endtask

  task When_arreadyDefaultValueIs0AndTransferOccur_Then_nextClkArreadyValueWillGoDefaultState();
   `uvm_info(name,$sformatf("When_arreadyDefaultValueIs0AndTransferOccur_Then_nextClkArreadyValueWillGoDefaultState task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      arready <= 1'b0;
      @(posedge aclk);
      arready <= 1'b1;
      arvalid <= 1'b1;
      @(posedge aclk);
      arready <= 1'b0;
    `uvm_info(name,$sformatf("When_arreadyDefaultValueIs0AndTransferOccur_Then_nextClkArreadyValueWillGoDefaultState task ended"),UVM_NONE);
  endtask

  task When_rreadyDefaultValueIs0AndTransferOccur_Then_nextClkRreadyValueWillGoDefaultState();
   `uvm_info(name,$sformatf("When_rreadyDefaultValueIs0AndTransferOccur_Then_nextClkRreadyValueWillGoDefaultState task started"),UVM_NONE);
    @(posedge aclk);
     aresetn <= 1'b1;
      rvalid <= 1'b0;
      rready <= 1'b0;
      @(posedge aclk);
      rready <= 1'b1;
      rvalid <= 1'b1;
      @(posedge aclk);
      rready  <= 1'b0;
    `uvm_info(name,$sformatf("When_rreadyDefaultValueIs0AndTransferOccur_Then_nextClkRreadyValueWillGoDefaultState task ended"),UVM_NONE);
  endtask
    
  task When_arreadyIsHighAndSendingValidAraddrAndRdataOnSlaveLocation_Then_slaveWillGiveOkayResponse();
`uvm_info(name,$sformatf("When_arreadyIsHighAndSendingValidAraddrAndRdataOnSlaveLocation_Then_slaveWillGiveOkayResponse Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      arready <= 1'b0;
      araddr  <= 32'hxxxx_xxxx;
      rvalid  <= 1'b0;
      rready  <= 1'b0;
      rdata   <= 32'hxxxx_xxxx;
      rresp   <= 2'bxx;
      @(posedge aclk);
      arvalid <= 1'b1;
      arready <= 1'b1;
      araddr  <= 32'h1234_5678;
      repeat(5) begin;
      @(posedge aclk);
      end
      rvalid  <= 1'b1;
      rready  <= 1'b1;
      rdata   <= 32'h1122_3344;
      rresp   <= 2'b00;
    `uvm_info(name,$sformatf("When_arreadyIsHighAndSendingValidAraddrAndRdataOnSlaveLocation_Then_slaveWillGiveOkayResponse task ended"),UVM_NONE);
  endtask
    
  task When_arvalidAndArreadyAsserted_Then_nextClkRvalidIsAsserted();
    `uvm_info(name,$sformatf("When_arvalidAndArreadyAsserted_Then_nextClkRvalidIsAsserted Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      arready <= 1'b0;
      rvalid  <= 1'b0;
      @(posedge aclk);
      arvalid <= 1'b1;
      arready <= 1'b1;
      @(posedge aclk);
      rvalid  <= 1'b1;
      `uvm_info(name,$sformatf("When_arvalidAndArreadyAsserted_Then_nextClkRvalidIsAsserted Task ended"),UVM_NONE);
    endtask
    
  task When_arvalidAndArreadyAsserted_Then_at3ClkRvalidIsAsserted();
    `uvm_info(name,$sformatf("When_arvalidAndArreadyAsserted_Then_at3ClkRvalidIsAsserted Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      arready <= 1'b0;
      rvalid  <= 1'b0;
      @(posedge aclk);
      arvalid <= 1'b1;
      arready <= 1'b1;
      repeat(3) begin; 
      @(posedge aclk);
      end
      rvalid  <= 1'b1;
      `uvm_info(name,$sformatf("When_arvalidAndArreadyAsserted_Then_at3ClkRvalidIsAsserted Task ended"),UVM_NONE);
    endtask
  
    task When_arvalidAndArreadyAsserted_Then_inbetween1To10ClkRvalidIsAsserted();
    `uvm_info(name,$sformatf("When_arvalidAndArreadyAsserted_Then_inbetween1To10ClkRvalidIsAsserted Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      arready <= 1'b0;
      rvalid  <= 1'b0;
      @(posedge aclk);
      arvalid <= 1'b1;
      arready <= 1'b1;
      repeat(8) begin;  //Here we can give any value inbetween 1 to 10
      @(posedge aclk);
      end
      rvalid  <= 1'b1;
      `uvm_info(name,$sformatf("When_arvalidAndArreadyAsserted_Then_inbetween1To10ClkRvalidIsAsserted Task ended"),UVM_NONE);
    endtask
   
    task  When_arvalidAndArreadyAsserted_Then_anyClkRvalidIsLow();
    `uvm_info(name,$sformatf("When_arvalidAndArreadyAsserted_Then_anyClkRvalidIsLow Fail_Scenario Task started"),UVM_NONE);
      @(posedge aclk);
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      arready <= 1'b0;
      rvalid  <= 1'b0;
      @(posedge aclk);
      arvalid <= 1'b1;
      arready <= 1'b1;
      repeat(10) begin;  //Here we can give any value inbetween 1 to 10
      @(posedge aclk);
      end
      `uvm_info(name,$sformatf("When_arvalidAndArreadyAsserted_Then_anyClkRvalidIsLow Fail_Scenario Task ended"),UVM_NONE);
    endtask    

    task When_arvalidAndArreadyAreAsserted_Then_inbetween1To10ClkRvalidIsAssertedAndRdataIsNotUnknown();
    `uvm_info(name,$sformatf("When_arvalidAndArreadyAreAsserted_Then_inbetween1To10ClkRvalidIsAssertedAndRdataIsNotUnknown Task started"),UVM_NONE);
     @(posedge aclk);
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      arready <= 1'b0;
      rvalid  <= 1'b0;
      rdata   <= 32'hxxxx_xxxx;
      @(posedge aclk);
      arvalid <= 1'b1;
      arready <= 1'b1;
      repeat(10) begin;  //Here we can give any value inbetween 1 to 10
      @(posedge aclk);
      end
      rvalid  <= 1'b1;
      rdata   <= 32'b1;
      `uvm_info(name,$sformatf("When_arvalidAndArreadyAreAsserted_Then_inbetween1To10ClkRvalidIsAssertedAndRdataIsNotUnknown Task ended"),UVM_NONE);
    endtask 

    
    task When_arvalidAndArreadyAreAsserted_Then_rdataOflowerLanesIsValidData();
    `uvm_info(name,$sformatf("When_arvalidAndArreadyAreAsserted_Then_rdataOflowerLanesIsValidData Task started"),UVM_NONE);
     @(posedge aclk);
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      arready <= 1'b0;
      rvalid  <= 1'b0;
      rdata   <= 32'hxxxx_xxxx;
      @(posedge aclk);
      arvalid <= 1'b1;
      arready <= 1'b1;
      rvalid  <= 1'b1;
      rdata[31:16]   <= 16'h0000;;
      rdata[15:0]    <= 16'h1234;;
      `uvm_info(name,$sformatf("When_arvalidAndArreadyAreAsserted_Then_rdataOflowerLanesIsValidData Task ended"),UVM_NONE);
    endtask

     task When_araddrIsAsserted_Then_nextClkRdataIsAsserted();
  `uvm_info(name,$sformatf("When_araddrIsAsserted_Then_nextClkRdataIsAsserted Task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      arready <= 1'b0;
      araddr  <= 32'hxxxx_xxxx;
      rvalid  <= 1'b0;
      rready  <= 1'b0;
      rdata   <= 32'hxxxx_xxxx;
      @(posedge aclk);
      arvalid <= 1'b1;
      arready <= 1'b1;
      araddr  <= 32'h1000_1002;
      @(posedge aclk);
      rvalid  <= 1'b1;
      rready  <= 1'b1;
      rdata   <= 32'h1234_5678;
    `uvm_info(name,$sformatf("When_araddrIsAsserted_Then_nextClkRdataIsAsserted Task  ended"),UVM_NONE);
  endtask

  task When_araddrIsAsserted_Then_inbetween1To10ClkRdataIsAsserted();
  `uvm_info(name,$sformatf("When_araddrIsAsserted_Then_inbetween1To10ClkRdataIsAsserted Task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      arready <= 1'b0;
      araddr  <= 32'hxxxx_xxxx;
      rvalid  <= 1'b0;
      rready  <= 1'b0;
      rdata   <= 32'hxxxx_xxxx;
      @(posedge aclk);
      arvalid <= 1'b1;
      arready <= 1'b1;
      araddr  <= 32'h1000_1002;
      repeat(8) begin //Here you can give any value inbetween 1-10 example 8
      @(posedge aclk);
      end
      rvalid  <= 1'b1;
      rready  <= 1'b1;
      rdata   <= 32'h1234_5678;
    `uvm_info(name,$sformatf("When_araddrIsAsserted_Then_inbetween1To10ClkRdataIsAsserted Task  ended"),UVM_NONE);
  endtask

  task When_rdataIsAsserted_Then_nextClkAraddrIsAsserted();
  `uvm_info(name,$sformatf("When_rdataIsAsserted_Then_nextClkAraddrIsAsserted Task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      arready <= 1'b0;
      araddr  <= 32'hxxxx_xxxx;
      rvalid  <= 1'b0;
      rready  <= 1'b0;
      rdata   <= 32'hxxxx_xxxx;
      @(posedge aclk);
      rvalid  <= 1'b1;
      rready  <= 1'b1;
      rdata   <= 32'h1234_5678;
      @(posedge aclk);
      arvalid <= 1'b1;
      arready <= 1'b1;
      araddr  <= 32'h1000_1002;
    `uvm_info(name,$sformatf("When_rdataIsAsserted_Then_nextClkAraddrIsAsserted Task  ended"),UVM_NONE);
  endtask

  task When_rdataIsAsserted_Then_inbetween1To10ClkAraddrIsAsserted();
  `uvm_info(name,$sformatf("When_rdataIsAsserted_Then_inbetween1To10ClkAraddrIsAsserted Task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      arready <= 1'b0;
      araddr  <= 32'hxxxx_xxxx;
      rvalid  <= 1'b0;
      rready  <= 1'b0;
      rdata   <=  32'hxxxx_xxxx;
      @(posedge aclk);
      rvalid  <= 1'b1;
      rready  <= 1'b1;
      rdata   <= 32'h1234_5678;
      repeat(8) begin //Here you can give any value inbetween 1-10 example 8
      @(posedge aclk);
      end
      arvalid <= 1'b1;
      arready <= 1'b1;
      araddr  <= 32'h1000_1002;
    `uvm_info(name,$sformatf("When_rdataIsAsserted_Then_inbetween1To10ClkAraddrIsAsserted Task  ended"),UVM_NONE);
  endtask

task When_masterIssuesMulipleTxThenSlaveNeedToSupportsMultipleOutstanding(); 
  `uvm_info(name,$sformatf("When_masterIssuesMulipleTxThenSlaveNeedToSupportsMultipleOutstanding Task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      arready <= 1'b0;
      rvalid  <= 1'b0;
      rready  <= 1'b0;
      rresp   <= 1'b0;
      @(posedge aclk);
      arvalid <= 1'b1;
      arready <= 1'b1;
      @(posedge aclk);
      arready <= 1'b0;
      @(posedge aclk);
      arready <= 1'b1;
      @(posedge aclk);
      arready <= 1'b0;
      @(posedge aclk);
      arready <= 1'b1;
      @(posedge aclk);
      arready <= 1'b0;
      arvalid <= 1'b0;
      repeat(2) begin
        @(posedge aclk);
      end
      rvalid <= 1'b1;
      rready <= 1'b1;
      rresp  <= 2'b00;
      @(posedge aclk);
      rvalid <= 1'b0;
      rready <= 1'b0;
      @(posedge aclk);
      rvalid <= 1'b1;
      rready <= 1'b1;
      @(posedge aclk);
      rvalid <= 1'b0;
      rready <= 1'b0;
      repeat(2) begin
        @(posedge aclk);
      end
      rvalid  <= 1'b1;
      rready  <= 1'b1;
      @(posedge aclk);
      rvalid  <= 1'b0;
      rready  <= 1'b0;
    `uvm_info(name,$sformatf("When_masterIssuesMulipleTxThenSlaveNeedToSupportsMultipleOutstanding Task  ended"),UVM_NONE);
  endtask 

    task When_masterIssuesMulipleTxThenSlaveIsNotSupportsMultipleOutstanding();
      `uvm_info(name,$sformatf("When_masterIssuesMulipleTxThenSlaveIsNotSupportsMultipleOutstanding Task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      arready <= 1'b0;
      rvalid  <= 1'b0;
      rready  <= 1'b0;
      rresp   <= 1'b0;
      @(posedge aclk);
      arvalid <= 1'b1;
      @(posedge aclk);
      arready <= 1'b1;
      @(posedge aclk);
      arready <= 1'b0;
      @(posedge aclk);
      rvalid <= 1'b1;
      @(posedge aclk);
      rready <= 1'b1;
      @(posedge aclk);
      arready <= 1'b1;
      rvalid <= 1'b0;
      rready <= 1'b0;
      @(posedge aclk);
      arready <= 1'b0;
      rvalid <= 1'b1;
      rready <= 1'b1;
      @(posedge aclk);
      arready <= 1'b1;
      rvalid <= 1'b0;
      rready <= 1'b0;
      @(posedge aclk);
      arvalid <= 1'b0;
      arready <= 1'b0;
      rvalid <= 1'b1;
      @(posedge aclk);
      rready <= 1'b1;
      @(posedge aclk);
      rvalid <= 1'b0;
      rready <= 1'b0;

      `uvm_info(name,$sformatf("When_masterIssuesMulipleTxThenSlaveIsNotSupportsMultipleOutstanding Task  ended"),UVM_NONE);
    endtask

    task When_masterAndSlaveIsNotSupportsMultipleOutstanding();
      `uvm_info(name,$sformatf("When_masterAndSlaveIsNotSupportsMultipleOutstanding Task started"),UVM_NONE);
      @(posedge aclk); 
      aresetn <= 1'b1;
      arvalid <= 1'b0;
      arready <= 1'b0;
      rvalid  <= 1'b0;
      rready  <= 1'b0;
      rresp   <= 1'b0;
      @(posedge aclk);
      arvalid <= 1'b1;
      arready <= 1'b1;
      @(posedge aclk);
      rvalid <= 1'b1;
      rready <= 1'b1;
      arvalid <= 1'b0;
      arready <= 1'b0;
      @(posedge aclk);
      rvalid <= 1'b0;
      rready <= 1'b0;
      @(posedge aclk);
      arvalid <= 1'b1;
      arready <= 1'b1;
      @(posedge aclk);
      rvalid <= 1'b1;
      rready <= 1'b1;
      arvalid <= 1'b0;
      arready <= 1'b0;
      @(posedge aclk);
      rvalid <= 1'b0;
      rready <= 1'b0;
      repeat(5) begin
        @(posedge aclk);
      end
      arvalid <= 1'b1;
      arready <= 1'b1;
      @(posedge aclk);
      rvalid <= 1'b1;
      rready <= 1'b1;
      arvalid <= 1'b0;
      arready <= 1'b0;
      @(posedge aclk);
      rvalid <= 1'b0;
      rready <= 1'b0;

      `uvm_info(name,$sformatf("When_masterAndSlaveIsNotSupportsMultipleOutstanding Task  ended"),UVM_NONE);
    endtask

endmodule : Axi4LiteMasterReadCoverPropertyTB

`endif


