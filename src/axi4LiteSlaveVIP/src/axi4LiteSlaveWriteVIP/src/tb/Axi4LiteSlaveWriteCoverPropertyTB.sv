`ifndef AXI4LITESLAVEWRITECOVERPROPERTYTB_INCLUDED_
`define AXI4LITESLAVEWRITECOVERPROPERTYTB_INCLUDED_

`include "uvm_macros.svh"
import uvm_pkg::*;
import Axi4LiteWriteSlaveGlobalPkg::*;

module Axi4LiteSlaveWriteCoverPropertyTB;
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

  
  Axi4LiteSlaveWriteCoverProperty Axi4LiteSlaveWriteCoverPropertys(.aclk(aclk),
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
  
  Axi4LiteMasterWriteCoverPropertyTB axi4LiteMasterWriteCoverPropertyTB();

  initial begin
  axi4LiteMasterWriteCoverPropertyTB.When_awvalidIsAsserted_Then_awaddrIsNotUnknown();
  axi4LiteMasterWriteCoverPropertyTB.When_wvalidIsAsserted_Then_wdataIsNotUnknown();
  axi4LiteMasterWriteCoverPropertyTB.When_awvalidIsAsserted_Then_awaddrIsNotUnknownAndPrevious2ClkAwaddrIsUnknown();
  axi4LiteMasterWriteCoverPropertyTB.When_wvalidIsAsserted_Then_wdataIsNotUnknownAndPrevious2ClkWdataIsUnknown();
  axi4LiteMasterWriteCoverPropertyTB.When_awreadyIsLow_Then_awvalidIsAssertedAfter3Clk();
  axi4LiteMasterWriteCoverPropertyTB.When_wreadyIsLow_Then_wvalidIsAssertedAfter3Clk();
  axi4LiteMasterWriteCoverPropertyTB.When_breadyIsLow_Then_bvalidIsAssertedAfter3Clk();
  axi4LiteMasterWriteCoverPropertyTB.When_awreadyIsLow_Then_anyClkAwvalidIsAssertedThenAwreadyCanBeAssertAnyTime();
  axi4LiteMasterWriteCoverPropertyTB.When_wreadyIsLow_Then_anyClkWvalidIsAssertedThenWreadyCanBeAssertAnyTime();
  axi4LiteMasterWriteCoverPropertyTB.When_breadyIsLow_Then_anyClkBvalidIsAssertedThenBreadyCanBeAssertAnyTime();
  axi4LiteMasterWriteCoverPropertyTB.When_awvalidIsAsserted_Then_sameClkAwreadyIsAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_wvalidIsAsserted_Then_sameClkWreadyIsAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_bvalidIsAsserted_Then_sameClkBreadyIsAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_awvalidIsAsserted_Then_remainsHigh_NextClkAwreadyIsAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_wvalidIsAsserted_Then_remainsHigh_NextClkWreadyIsAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_bvalidIsAsserted_Then_remainsHigh_NextClkBreadyIsAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_awvalidIsAsserted_Then_remainsHigh_Then_Within1To16ClkAwreadyIsAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_wvalidIsAsserted_Then_remainsHigh_Then_Within1To16ClkWreadyIsAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_bvalidIsAsserted_Then_remainsHigh_Then_Within1To16ClkBreadyIsAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_awvalidIsAsserted_Then_remainsHigh_Then_awreadyIsAlwaysLow();
  axi4LiteMasterWriteCoverPropertyTB.When_wvalidIsAsserted_Then_remainsHigh_Then_wreadyIsAlwaysLow();
  axi4LiteMasterWriteCoverPropertyTB.When_bvalidIsAsserted_Then_remainsHigh_Then_breadyIsAlwaysLow();
  axi4LiteMasterWriteCoverPropertyTB.When_BackToBackAwvalidAndAwreadyAsserted_Then_noDelayInbetween2Transfer();
  axi4LiteMasterWriteCoverPropertyTB.When_BackToBackWvalidAndWreadyAsserted_Then_noDelayInbetween2Transfer();
  axi4LiteMasterWriteCoverPropertyTB.When_BackToBackBvalidAndBreadyAsserted_Then_noDelayInbetween2Transfer();
  axi4LiteMasterWriteCoverPropertyTB.When_BackToBackAwvalidAndAwreadyAsserted_Then_1ClkDelayInbetween2Transfer();
  axi4LiteMasterWriteCoverPropertyTB.When_BackToBackWvalidAndWreadyAsserted_Then_1ClkDelayInbetween2Transfer();
  axi4LiteMasterWriteCoverPropertyTB.When_BackToBackBvalidAndBreadyAsserted_Then_1ClkDelayInbetween2Transfer();
  axi4LiteMasterWriteCoverPropertyTB.When_BackToBackAwvalidAndAwreadyAsserted_Then_2ClkDelayInbetween2Transfer();
  axi4LiteMasterWriteCoverPropertyTB.When_BackToBackWvalidAndWreadyAsserted_Then_2ClkDelayInbetween2Transfer();
  axi4LiteMasterWriteCoverPropertyTB.When_BackToBackBvalidAndBreadyAsserted_Then_2ClkDelayInbetween2Transfer();
  axi4LiteMasterWriteCoverPropertyTB.When_BackToBackAwvalidAndAwreadyAsserted_Then_3To16ClkDelayInbetween2Transfer();
  axi4LiteMasterWriteCoverPropertyTB.When_BackToBackWvalidAndWreadyAsserted_Then_3To16ClkDelayInbetween2Transfer();
  axi4LiteMasterWriteCoverPropertyTB.When_BackToBackBvalidAndBreadyAsserted_Then_3To16ClkDelayInbetween2Transfer();
  axi4LiteMasterWriteCoverPropertyTB.When_BackToBackAwvalidAndAwreadyAsserted_Then_moreThan16ClkDelayInbetween2Transfer();
  axi4LiteMasterWriteCoverPropertyTB.When_BackToBackWvalidAndWreadyAsserted_Then_moreThan16ClkDelayInbetween2Transfer();
  axi4LiteMasterWriteCoverPropertyTB.When_BackToBackBvalidAndBreadyAsserted_Then_moreThan16ClkDelayInbetween2Transfer();
  axi4LiteMasterWriteCoverPropertyTB.When_awreadyNeedToAsserted_atleastOnce();
  axi4LiteMasterWriteCoverPropertyTB.When_wreadyNeedToAsserted_atleastOnce();
  axi4LiteMasterWriteCoverPropertyTB.When_breadyNeedToAsserted_atleastOnce();
  axi4LiteMasterWriteCoverPropertyTB.When_awreadyIsAsserted_Then_sameClkDeasserted();
  axi4LiteMasterWriteCoverPropertyTB.When_wreadyIsAsserted_Then_sameClkDeasserted();
  axi4LiteMasterWriteCoverPropertyTB.When_breadyIsAsserted_Then_sameClkDeasserted();
  axi4LiteMasterWriteCoverPropertyTB.When_awvalidIsAsserted_Then_nextClkAwreadyIsAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_wvalidIsAsserted_Then_nextClkWreadyIsAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_bvalidIsAsserted_Then_nextClkBreadyIsAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_awvalidIsAsserted_Then_inbetween2To5ClkAwreadyIsAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_wvalidIsAsserted_Then_inbetween2To5ClkWreadyIsAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_bvalidIsAsserted_Then_inbetween2To5ClkBreadyIsAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_awvalidIsAsserted_Then_within16ClkAwreadyIsAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_wvalidIsAsserted_Then_within16ClkWreadyIsAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_bvalidIsAsserted_Then_within16ClkBreadyIsAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_awreadyIsAssertedAndDeasserted_Then_nextClkAwvalidIsAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_wreadyIsAssertedAndDeasserted_Then_nextClkWvalidIsAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_breadyIsAssertedAndDeasserted_Then_nextClkBvalidIsAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_awreadyIsAssertedAndDeasserted3Times_Then_nextClkAwvalidIsAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_wreadyIsAssertedAndDeasserted3Times_Then_nextClkWvalidIsAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_breadyIsAssertedAndDeasserted3Times_Then_nextClkBvalidIsAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_awreadyIsAsserted_Then_nextClkAwvalidIsAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_wreadyIsAsserted_Then_nextClkWvalidIsAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_breadyIsAsserted_Then_nextClkBvalidIsAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_awreadyIsAsserted_Then_inbetween2To5ClkAwvalidIsAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_wreadyIsAsserted_Then_inbetween2To5ClkWvalidIsAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_breadyIsAsserted_Then_inbetween2To5ClkBvalidIsAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_awreadyIsAsserted_Then_anyClkAwvalidIsAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_wreadyIsAsserted_Then_anyClkWvalidIsAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_breadyIsAsserted_Then_anyClkBvalidIsAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_awreadyDefaultValueIs1AndTransferOccur_Then_nextClkAwreadyValueWillGoDefaultState();
  axi4LiteMasterWriteCoverPropertyTB.When_wreadyDefaultValueIs1AndTransferOccur_Then_nextClkWreadyValueWillGoDefaultState();
  axi4LiteMasterWriteCoverPropertyTB.When_breadyDefaultValueIs1AndTransferOccur_Then_nextClkBreadyValueWillGoDefaultState();
  axi4LiteMasterWriteCoverPropertyTB.When_awreadyDefaultValueIs0AndTransferOccur_Then_nextClkAwreadyValueWillGoDefaultState();
  axi4LiteMasterWriteCoverPropertyTB.When_wreadyDefaultValueIs0AndTransferOccur_Then_nextClkWreadyValueWillGoDefaultState();
  axi4LiteMasterWriteCoverPropertyTB.When_breadyDefaultValueIs0AndTransferOccur_Then_nextClkBreadyValueWillGoDefaultState();
  axi4LiteMasterWriteCoverPropertyTB.When_awreadyIsHighAndWritingValidAwaddrAndWdataOnSlaveLocation_Then_brespWillGiveOkayResponse();
  axi4LiteMasterWriteCoverPropertyTB.When_awvalidAwreadyWvalidWreadyAreAssertedSameClk_Then_NextClkBvalidIsAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_awvalidAwreadyAreAsserted_Then_nextClkWvalidWreadyAreAsserted_Then_nextClkBvalidIsAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_awvalidAwreadyAreAsserted_Then_nextClkWvalidWreadyAreAsserted_Then_inbetween1To16ClkBvalidIsAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_awvalidAwreadyAreAsserted_Then_anyClkWvalidWreadyAreAsserted_Then_anyClkBvalidIsAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_awvalidAwreadyAreAsserted_Then_anyClkWvalidWreadyAreAsserted_Then_BvalidIsLow();
  axi4LiteMasterWriteCoverPropertyTB.When_awaddrIsAsserted_Then_sameClkWdataIsAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_awaddrIsAsserted_Then_sameClkWdataIsAssertedButWdataIsUnknownValue();
  axi4LiteMasterWriteCoverPropertyTB.When_awaddrIsAsserted_Then_sameClkWdataIsAssertedButWvalidIsLow();
  axi4LiteMasterWriteCoverPropertyTB.When_awaddrIsAsserted_Then_nextClkWdataIsAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_awaddrIsAsserted_Then_inbetween1To10ClkWdataIsAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_awaddrIsAsserted_Then_anyClkWdataIsAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_wdataIsAsserted_Then_nextClkAwaddrIsAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_wdataIsAsserted_Then_inbetween1To10ClkAwaddrIsAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_wdataIsAsserted_Then_anyClkAwaddrIsAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_awvalidIsAsserted_Then_nextClkAwreadyAndWreadyAreAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_awvalidIsAsserted_Then_anyClkAwreadyAndWreadyAreAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_awvalidIsAsserted_Then_sameClkAwreadyAndWreadyAreAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_awvalidIsAsserted_Then_awreadyAndWreadyAreLow();
  axi4LiteMasterWriteCoverPropertyTB.When_awvalidAndAwreadyAreAsserted_Then_wreadyIsLow();
  axi4LiteMasterWriteCoverPropertyTB.When_awvalidAndWreadyAreAsserted_Then_awreadyIsLow();
  axi4LiteMasterWriteCoverPropertyTB.When_awreadyIsAsserted_Then_nextClkWvalidIsAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_awreadyIsAsserted_Then_anyClkWvalidIsAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_awreadyIsAsserted_Then_sameClkWvalidIsAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_awreadyIsAsserted_Then_nextClkAwvalidAndWvalidAreAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_awreadyIsAsserted_Then_anyClkAwvalidAndWvalidAreAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_awreadyIsAsserted_Then_sameClkAwvalidAndWvalidAreAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_wvalidIsAsserted_Then_nextClkAwreadyIsAsserted(); 
  axi4LiteMasterWriteCoverPropertyTB.When_wvalidIsAsserted_Then_anyClkAwreadyIsAsserted(); 
  axi4LiteMasterWriteCoverPropertyTB.When_awvalidIsAsserted_Then_nextClkAwreadyIsAsserted_Then_nextClkWvalidIsAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_wvalidIsAsserted_Then_nextClkAwvalidIsAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_wvalidIsAsserted_Then_anyClkAwvalidIsAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_wvalidIsAsserted_Then_sameClkAwvalidIsAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_awvalidIsAsserted_Then_anyClkWvalidIsAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_awvalidIsAsserted_Then_nextClkWvalidIsAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_wvalidIsAsserted_Then_nextClkAwreadyAndWreadyAreAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_wvalidIsAsserted_Then_anyClkAwreadyAndWreadyAreAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_wvalidIsAsserted_Then_sameClkAwreadyAndWreadyAreAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_wvalidIsAsserted_Then_awreadyAndWreadyAreLow();
  axi4LiteMasterWriteCoverPropertyTB.When_wvalidAndAwreadyAreAsserted_Then_wreadyIsLow();
  axi4LiteMasterWriteCoverPropertyTB.When_wvalidAndWreadyAreAsserted_Then_awreadyIsLow();
  axi4LiteMasterWriteCoverPropertyTB.When_wvalidIsAsserted_Then_wstrbOfL3AndL2AreAsserted();
  axi4LiteMasterWriteCoverPropertyTB.When_wvalidIsAsserted_Then_wstrbOfL1AndL0AreAsserted();
end

endmodule : Axi4LiteSlaveWriteCoverPropertyTB

`endif


