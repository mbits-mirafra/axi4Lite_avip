`ifndef AXI4LITEMASTERWRITECOVERPROPERTY_INCLUDED_
`define AXI4LITEMASTERWRITECOVERPROPERTY_INCLUDED_

 import Axi4LiteWriteMasterGlobalPkg::*;

interface Axi4LiteMasterWriteCoverProperty (input  aclk,
                                            input  aresetn,
                                            //Write Address Channel Signals
                                            input  awvalid,
                                            input  [ADDRESS_WIDTH-1:0] awaddr,
                                            input  awready,
                                            input  [2:0] awprot,
                                            //Write Data Channel Signals
                                            input  wvalid,
                                            input  [DATA_WIDTH-1:0] wdata,
                                            input  [(DATA_WIDTH/8)-1:0] wstrb,
                                            input  wready,
                                            //Write Response Channel
                                            input  bvalid,
                                            input  bready,
                                            input  [1:0] bresp
                                           );  

  import uvm_pkg::*;
  import Axi4LiteMasterWriteAssertCoverParameter::*;
  `include "uvm_macros.svh";

  initial begin
    `uvm_info("Axi4LiteMasterWriteCoverProperty","Axi4LiteMasterWriteCoverProperty",UVM_LOW);
  end

  property WhenValidGoesHighThenInformationIsNotUnknownAndPreviousClkInformationIsUnknown(logic valid, logic information); 
   @(posedge aclk) disable iff (!aresetn) 
       $rose(valid) |-> !($isunknown(information)) 
                    &&  ($isunknown($past(information,1)));
 endproperty 

  IFAWVALIDGOESHIGH_THEN_AWADDR_IS_NOTUNKNOWN_AND_PREVIOUS_CLK_AWADDR_IS_UNKNOWN : cover property
  (WhenValidGoesHighThenInformationIsNotUnknownAndPreviousClkInformationIsUnknown (awvalid, awaddr))
  $info("IFAWVALIDGOESHIGH_THEN_AWADDR_IS_NOTUNKNOWN_AND_PREVIOUS_CLK_AWADDR_IS_UNKNOWN : COVERED");

  IFWVALIDGOESHIGH_THEN_WDATA_IS_NOTUNKNOWN_AND_PREVIOUS_CLK_WDATA_IS_UNKNOWN : cover property  
  (WhenValidGoesHighThenInformationIsNotUnknownAndPreviousClkInformationIsUnknown (wvalid, wdata))
  $info("IFWVALIDGOESHIGH_THEN_WDATA_IS_NOTUNKNOWN_AND_PREVIOUS_CLK_WDATA_IS_UNKNOWN : COVERED");

  property WhenValidGoesHighThenInformationIsNotUnknownAndPrevious2ClkInformationIsUnknown(logic valid, logic information); 
   @(posedge aclk) disable iff (!aresetn) 
       $rose(valid) |-> !($isunknown(information)) 
                    &&  ($isunknown($past(information,2)));
 endproperty 

  IFAWVALIDGOESHIGH_THEN_AWADDR_IS_NOTUNKNOWN_AND_PREVIOUS_2CLK_AWADDR_IS_UNKNOWN : cover property
  (WhenValidGoesHighThenInformationIsNotUnknownAndPrevious2ClkInformationIsUnknown (awvalid, awaddr))
  $info("IFAWVALIDGOESHIGH_THEN_AWADDR_IS_NOTUNKNOWN_AND_PREVIOUS_2CLK_AWADDR_IS_UNKNOWN : COVERED");

  IFWVALIDGOESHIGH_THEN_WDATA_IS_NOTUNKNOWN_AND_PREVIOUS_2CLK_WDATA_IS_UNKNOWN : cover property  
  (WhenValidGoesHighThenInformationIsNotUnknownAndPrevious2ClkInformationIsUnknown (wvalid, wdata))
  $info("IFWVALIDGOESHIGH_THEN_WDATA_IS_NOTUNKNOWN_AND_PREVIOUS_2CLK_WDATA_IS_UNKNOWN : COVERED");

  property WhenValidGoesHighThenControlSignalIsNotUnknownAndPreviousClkControlSignalIsUnknown(logic valid, logic controlSignal); 
   @(posedge aclk) disable iff (!aresetn) 
       $rose(valid) |-> !($isunknown(controlSignal))  
        &&  ($isunknown($past(controlSignal,1)));
 endproperty 

  IFAWVALIDGOESHIGH_THEN_AWPROT_IS_NOTUNKNOWN_AND_PREVIOUS_CLK_AWPROT_IS_UNKNOWN : cover property
  (WhenValidGoesHighThenControlSignalIsNotUnknownAndPreviousClkControlSignalIsUnknown (awvalid, awprot))
  $info("IFAWVALIDGOESHIGH_THEN_AWPROT_IS_NOTUNKNOWN_AND_PREVIOUS_CLK_AWPROT_IS_UNKNOWN :COVERED");
  
  IFWVALIDGOESHIGH_THEN_WSTRB_IS_NOTUNKNOWN_AND_PREVIOUS_CLK_WSTRB_IS_UNKNOWN : cover property  
  (WhenValidGoesHighThenInformationIsNotUnknownAndPreviousClkInformationIsUnknown (wvalid, wstrb))
  $info("IFWVALIDGOESHIGH_THEN_WSTRB_IS_NOTUNKNOWN_AND_PREVIOUS_CLK_WSTRB_IS_UNKNOWN : COVERED");

  property WhenValidGoesHighThenControlSignalIsNotUnknownAndPrevious2ClkControlSignalIsUnknown(logic valid, logic controlSignal); 
   @(posedge aclk) disable iff (!aresetn) 
       $rose(valid) |-> !($isunknown(controlSignal))  
        &&  ($isunknown($past(controlSignal,2)));
 endproperty 

  IFAWVALIDGOESHIGH_THEN_AWPROT_IS_NOTUNKNOWN_AND_PREVIOUS_2CLK_AWPROT_IS_UNKNOWN : cover property
  (WhenValidGoesHighThenControlSignalIsNotUnknownAndPrevious2ClkControlSignalIsUnknown (awvalid, awprot))
  $info("IFAWVALIDGOESHIGH_THEN_AWPROT_IS_NOTUNKNOWN_AND_PREVIOUS_2CLK_AWPROT_IS_UNKNOWN :COVERED");
  
  IFWVALIDGOESHIGH_THEN_WSTRB_IS_NOTUNKNOWN_AND_PREVIOUS_2CLK_WSTRB_IS_UNKNOWN : cover property  
  (WhenValidGoesHighThenInformationIsNotUnknownAndPrevious2ClkInformationIsUnknown (wvalid, wstrb))
  $info("IFWVALIDGOESHIGH_THEN_WSTRB_IS_NOTUNKNOWN_AND_PREVIOUS_2CLK_WSTRB_IS_UNKNOWN : COVERED");


  property ifBvalidHighThenBrespNotUnknownAndPreviousClkBrespIsUnknown(logic bvalid, logic bresp);
	  @(posedge aclk) disable iff (!aresetn)
      bvalid |-> !($isunknown(bresp)) 
      && ($isunknown($past(bresp,1)));
  endproperty

  IFBVALIDASSERTED_THEN_BRESP_NOTUNKNOWN_AND_PREVIOUS_CLK_BRESP_IS_UNKNOWN: cover property 
  (ifBvalidHighThenBrespNotUnknownAndPreviousClkBrespIsUnknown(bvalid,bresp))
  $info("IFBVALIDASSERTED_THEN_BRESP_NOTUNKNOWN_AND_PREVIOUS_CLK_BRESP_IS_UNKNOWN : COVERED");

  property ifBvalidHighThenBrespNotUnknownAndPrevious2ClkBrespIsUnknown(logic bvalid, logic bresp);
	  @(posedge aclk) disable iff (!aresetn)
      bvalid |-> !($isunknown(bresp)) 
      && ($isunknown($past(bresp,2)));
  endproperty

  IFBVALIDASSERTED_THEN_BRESP_NOTUNKNOWN_AND_PREVIOUS_2CLK_BRESP_IS_UNKNOWN: cover property 
  (ifBvalidHighThenBrespNotUnknownAndPrevious2ClkBrespIsUnknown(bvalid,bresp))
  $info("IFBVALIDASSERTED_THEN_BRESP_NOTUNKNOWN_AND_PREVIOUS_2CLK_BRESP_IS_UNKNOWN : COVERED");


  if(Axi4LiteWriteMasterGlobalPkg::DEFAULT_BREADY != 1) begin

  property WhenReadyLowAndValidAssertedAfter3Clk(logic valid, logic ready);
   @(posedge aclk) disable iff (!aresetn)
    !ready |-> ##3 (valid && !ready);
  endproperty

  IFAWREADYLOW_THEN_AFTER3CLK_AWVALIDASSERTED: cover property
  (WhenReadyLowAndValidAssertedAfter3Clk(awvalid, awready))
  $info("IFAWREADYISLOW_THEN_AWVALIDIS_ASSERTED_AFTER3CLK : COVERED");
  
  IFWREADYLOW_THEN_AFTER3CLK_WVALIDASSERTED: cover property
  (WhenReadyLowAndValidAssertedAfter3Clk(wvalid, wready))
  $info("IFWREADYISLOW_THEN_WVALIDIS_ASSERTED_AFTER3CLK : COVERED");
 
  IFBREADYLOW_THEN_AFTER3CLK_BVALIDASSERTED: cover property
  (WhenReadyLowAndValidAssertedAfter3Clk(bvalid, bready))
  $info("IFBREADYISLOW_THEN_BVALIDIS_ASSERTED_AFTER3CLK : COVERED");

  property WhenReadyLowAndValidAssertedAfterAnyClkThenReadyWillAssertedAnyClk(logic valid, logic ready);
   @(posedge aclk) disable iff (!aresetn)
   !ready |-> ##[1:MAX_DELAY_VALID] (valid && !ready) ##[1:MAX_DELAY_READY] ready;
  endproperty
  
  IFAWREADYLOW_THEN_AFTERANYCLK_AWVALIDASSERTED_THENAWREADYWILLASSERTEDANYCLK: cover property
  (WhenReadyLowAndValidAssertedAfterAnyClkThenReadyWillAssertedAnyClk(awvalid, awready))
  $info("IFAWREADYLOW_THEN_ANYCLK_AWVALIDIS_ASSERTED_THEN_AWREADYWILL_ASSERTED_ANYCLK :COVERED");

  IFWREADYLOW_THEN_AFTERANYCLK_WVALIDASSERTED_THENWREADYWILLASSERTEDANYCLK: cover property
  (WhenReadyLowAndValidAssertedAfterAnyClkThenReadyWillAssertedAnyClk(wvalid, wready))
  $info("IFWREADYLOW_THEN_ANYCLK_WVALIDIS_ASSERTED_THEN_WREADYWILL_ASSERTED_ANYCLK :COVERED");

  IFBREADYLOW_THEN_AFTERANYCLK_BVALIDASSERTED_THENBREADYWILLASSERTEDANYCLK: cover property
  (WhenReadyLowAndValidAssertedAfterAnyClkThenReadyWillAssertedAnyClk(bvalid, bready))
  $info("IFBREADYLOW_THEN_ANYCLK_BVALIDIS_ASSERTED_THEN_BREADYWILL_ASSERTED_ANYCLK :COVERED");

  property WhenValidAssertedThenReadyAssertedNextClk(logic valid, logic ready);
  @(posedge aclk) disable iff (!aresetn)
   valid |-> !ready ##1 (valid && ready);
  endproperty

  IFAWVALIDASSERTED_THEN_NEXTCLK_AWREADYASSERTED: cover property 
  (WhenValidAssertedThenReadyAssertedNextClk(awvalid, awready))
  $info("IFAWVALIDASSERTED_THEN_NEXTCLK_AWREADYASSERTED : COVERED");

  IFWVALIDASSERTED_THEN_NEXTCLK_WREADYASSERTED: cover property 
  (WhenValidAssertedThenReadyAssertedNextClk(wvalid,wready))
  $info("IFWVALIDASSERTED_THEN_NEXTCLK_WREADYASSERTED : COVERED");

  IFBVALIDASSERTED_THEN_NEXTCLK_BREADYASSERTED: cover property 
  (WhenValidAssertedThenReadyAssertedNextClk(bvalid, bready))
  $info("IFBVALIDASSERTED_THEN_NEXTCLK_BREADYASSERTED : COVERED");

    property WhenValidAssertedThenInbetween2To5ClkReadyAsserted(logic valid, logic ready);
     @(posedge aclk) disable iff (!aresetn)
     valid |-> ##[2:5] ready; 
    endproperty  

   IFAWVALIDASSERTED_THEN_INBETWEEN2TO5CLK_AWREADYASSERTED: cover property 
   (WhenValidAssertedThenInbetween2To5ClkReadyAsserted(awvalid, awready)) 
   $info("IFAWVALIDASSERTED_THEN_INBETWEEN2TO5CLK_AWREADYASSERTED : COVERED");

   IFWVALIDASSERTED_THEN_INBETWEEN2TO5CLK_WREADYASSERTED: cover property 
   (WhenValidAssertedThenInbetween2To5ClkReadyAsserted(wvalid, wready))
   $info("IFWVALIDASSERTED_THEN_INBETWEEN2TO5CLK_WREADYASSERTED : COVERED");

   IFBVALIDASSERTED_THEN_INBETWEEN2TO5CLK_BREADYASSERTED: cover property 
   (WhenValidAssertedThenInbetween2To5ClkReadyAsserted(bvalid, bready))
   $info("IFBVALIDASSERTED_THEN_INBETWEEN2TO5CLK_BREADYASSERTED : COVERED");

   property WhenValidAssertedThenWithin16ClkReadyAsserted(logic valid, logic ready);
     @(posedge aclk) disable iff (!aresetn)
    valid |-> ##[0:MAX_DELAY_READY] ready;
   endproperty

   IFAWVALIDASSERTED_THEN_WITH16CLK_AWREADYASSERTED: cover property 
   (WhenValidAssertedThenWithin16ClkReadyAsserted(awvalid, awready)) 
   $info("IFAWVALIDASSERTED_THEN_WITH16CLK_AWREADYASSERTED : COVERED");

   IFWVALIDASSERTED_THEN_WITH16CLK_WREADYASSERTED: cover property 
   (WhenValidAssertedThenWithin16ClkReadyAsserted(wvalid, wready)) 
   $info("IFWVALIDASSERTED_THEN_WITH16CLK_WREADYASSERTED : COVERED");

   IFBVALIDASSERTED_THEN_WITH16CLK_BREADYASSERTED: cover property 
   (WhenValidAssertedThenWithin16ClkReadyAsserted(bvalid, bready)) 
   $info("IFBVALIDASSERTED_THEN_WITH16CLK_BREADYASSERTED : COVERED");

  property WhenValidAssertedThenValidHighAndNextClkReadyAsserted(logic valid, logic ready); 
   @(posedge aclk) disable iff (!aresetn) 
    $rose(valid) |=> $stable(valid) && ready; 
  endproperty  

   IFAWVALIDASSERTED_ANDREMAINHIGH_THEN_NEXTCLK_AWREADYASSERTED: cover property  
   (WhenValidAssertedThenValidHighAndNextClkReadyAsserted(awvalid, awready)) 
   $info("IFAWVALIDASSERTED_ANDREMAINHIGH_THEN_NEXTCLK_AWREADYASSERTED : COVERED");

   IFWVALIDASSERTED_ANDREMAINHIGH_THEN_NEXTCLK_WREADYASSERTED: cover property  
   (WhenValidAssertedThenValidHighAndNextClkReadyAsserted(wvalid, wready))
   $info("IFWVALIDASSERTED_ANDREMAINHIGH_THEN_NEXTCLK_WREADYASSERTED : COVERED");

   IFBVALIDASSERTED_ANDREMAINHIGH_THEN_NEXTCLK_BREADYASSERTED: cover property  
   (WhenValidAssertedThenValidHighAndNextClkReadyAsserted(bvalid, bready))
   $info("IFBVALIDASSERTED_ANDREMAINHIGH_THEN_NEXTCLK_BREADYASSERTED : COVERED");

  property WhenValidAssertedThenValidHighAndWithin1To16ClkReadyAsserted(logic valid, logic ready);
     @(posedge aclk) disable iff (!aresetn)
    $rose(valid) |=> ($stable(valid) throughout (##[1:MAX_DELAY_READY] $rose(ready))); 
  endproperty  

  IFAWVALIDASSERTED_ANDREMAINHIGH_THENWITHIN1TO16CLK_AWREADYASSERTED: cover property 
  (WhenValidAssertedThenValidHighAndWithin1To16ClkReadyAsserted(awvalid, awready)) 
  $info("IFAWVALIDASSERTED_ANDREMAINHIGH_THENWITHIN1TO16CLK_AWREADYASSERTED : COVERED");

  IFWVALIDASSERTED_ANDREMAINHIGH_THENWITHIN1TO16CLK_WREADYASSERTED: cover property 
  (WhenValidAssertedThenValidHighAndWithin1To16ClkReadyAsserted(wvalid, wready)) 
  $info("IFWVALIDASSERTED_ANDREMAINHIGH_THENWITHIN1TO16CLK_WREADYASSERTED : COVERED");

  IFBVALIDASSERTED_ANDREMAINHIGH_THENWITHIN1TO16CLK_BREADYASSERTED: cover property 
  (WhenValidAssertedThenValidHighAndWithin1To16ClkReadyAsserted(bvalid, bready)) 
  $info("IFBVALIDASSERTED_ANDREMAINHIGH_THENWITHIN1TO16CLK_BREADYASSERTED : COVERED");

    property WhenReadyAssertedAndDeassertedThenNextClkValidAsserted(logic valid, logic ready);
     @(posedge aclk) disable iff (!aresetn)
     $fell(ready) |-> !valid ##1 valid;
    endproperty

    IFAWREADYASSERTED_DEASSERTED_THEN_NEXTCLK_AWVALIDASSERTED: cover property
    (WhenReadyAssertedAndDeassertedThenNextClkValidAsserted(awvalid , awready))
    $info("IFAWREADYASSERTED_DEASSERTED_THEN_NEXTCLK_AWVALIDASSERTED: COVERED");

    IFWREADYASSERTED_DEASSERTED_THEN_NEXTCLK_WVALIDASSERTED: cover property
    (WhenReadyAssertedAndDeassertedThenNextClkValidAsserted(wvalid , wready))
    $info("IFWREADYASSERTED_DEASSERTED_THEN_NEXTCLK_WVALIDASSERTED: COVERED");

    IFBREADYASSERTED_DEASSERTED_THEN_NEXTCLK_BVALIDASSERTED: cover property
    (WhenReadyAssertedAndDeassertedThenNextClkValidAsserted(bvalid , bready))
    $info("IFBREADYASSERTED_DEASSERTED_THEN_NEXTCLK_BVALIDASSERTED: COVERED");

    property WhenReadyAssertedAndDeasserted3TimesThenNextClkValidAsserted(logic valid, logic ready);
       @(posedge aclk) disable iff (!aresetn)
      (ready && !valid) |-> (!valid throughout $fell(ready)[->3]) ##1 $rose(valid);
    endproperty

    IFAWREADYASSERTED_DEASSERTED3TIMES_THEN_NEXTCLK_AWVALIDASSERTED: cover property
    (WhenReadyAssertedAndDeasserted3TimesThenNextClkValidAsserted(awvalid , awready))
    $info("IFAWREADYASSERTED_DEASSERTED3TIMES_THEN_NEXTCLK_AWVALIDASSERTED : COVERED");

    IFWREADYASSERTED_DEASSERTED3TIMES_THEN_NEXTCLK_WVALIDASSERTED: cover property
    (WhenReadyAssertedAndDeasserted3TimesThenNextClkValidAsserted(wvalid , wready))
    $info("IFWREADYASSERTED_DEASSERTED3TIMES_THEN_NEXTCLK_WVALIDASSERTED : COVERED");

    IFBREADYASSERTED_DEASSERTED3TIMES_THEN_NEXTCLK_BVALIDASSERTED: cover property
    (WhenReadyAssertedAndDeasserted3TimesThenNextClkValidAsserted(bvalid , bready))
    $info("IFBREADYASSERTED_DEASSERTED3TIMES_THEN_NEXTCLK_BVALIDASSERTED : COVERED");

   property WhenAwvalidIsAssertedThenNextClkAwreadyAndWreadyWillBeAssert;
     @(posedge aclk)  disable iff (!aresetn)
   (awvalid && !awready && !wready) |=> (awready && wready);
   endproperty

  IFAWVALIDISASSERTED_THEN_NEXTCLK_AWREADYANDWREADYWILLBEASSERT: cover property
  (WhenAwvalidIsAssertedThenNextClkAwreadyAndWreadyWillBeAssert)
  $info("IFAWVALIDISASSERTED_THEN_NEXTCLK_AWREADYANDWREADYWILLBEASSERT : COVERED");

  property WhenAwvalidIsAssertedThenInbetween1To15ClkAwreadyAndWreadyWillBeAssert; 
    @(posedge aclk) disable iff (!aresetn)
    (awvalid && !awready && !wready) |-> ##[1:MAX_DELAY_READY] (awready && wready);
  endproperty  

  IFAWVALIDISASSERTED_THEN_INBETWEEN1TO15CLK_AWREADYANDWREADYWILLBEASSERT: cover property  
  (WhenAwvalidIsAssertedThenInbetween1To15ClkAwreadyAndWreadyWillBeAssert)
  $info("IFAWVALIDISASSERTED_THEN_INBETWEEN1TO15CLK_AWREADYANDWREADYWILLBEASSERT :  COVERED");

  property WhenWvalidIsAssertedThenInbetween1To16ClkAwreadyAndWreadyWillBeAssert; 
    @(posedge aclk) disable iff (!aresetn)
    (wvalid && !awready && !wready) |-> ##[1:MAX_DELAY_READY] (awready && wready);
  endproperty  

  IFWVALIDISASSERTED_THEN_INBETWEEN1TO16CLK_AWREADYANDWREADYWILLBEASSERT : cover property  
  (WhenWvalidIsAssertedThenInbetween1To16ClkAwreadyAndWreadyWillBeAssert)
  $info("IFWVALIDISASSERTED_THEN_INBETWEEN1TO16CLK_AWREADYANDWREADYWILLBEASSERT :  COVERED");

   property WhenMasterIssuesMultipleWriteTxThenSlaveNeedToSupportsMultipleOutstandingTx;
     @(posedge aclk) disable iff(!aresetn)
       (awvalid && awready) |-> ##2 (awvalid && awready) ##2 (awvalid && awready)
       ##3 (bvalid && bready && bresp == 2'b00) [->3];
  endproperty 

   IFMASTERISSUES_MULTIPLEWRITETX_THEN_SLAVENEEDTOSUPPORTS_MULTIPLEOUTSTANDINGTX: cover property
   (WhenMasterIssuesMultipleWriteTxThenSlaveNeedToSupportsMultipleOutstandingTx)
   $info("IFMASTERISSUES_MULTIPLEWRITETX_THEN_SLAVENEEDTOSUPPORTS_MULTIPLEOUTSTANDINGTX :COVERED");

 property WhenMasterIssuesMultipleWriteTxThenSlaveIsNotSupportMultipleOutstandingTx;
    @(posedge aclk) disable iff(!aresetn)
      (awvalid && awready) |=> ($stable(awvalid) && awready == 0)[*3] ##0 (bvalid && bready)
      ##1 (awvalid && awready) ##1 ($stable(awvalid) && awready == 0) ##0 (bvalid && bready)
      ##1 (awvalid && awready) ##2 (bvalid && bready);
endproperty

 IFMASTERISSUES_MULTIPLEWRITETX_THEN_SLAVEISNOTSUPPORTS_MULTIPLEOUTSTANDINGTX : cover property 
 (WhenMasterIssuesMultipleWriteTxThenSlaveIsNotSupportMultipleOutstandingTx) 
 $info("IFMASTERISSUES_MULTIPLETX_THEN_SLAVEISNOTSUPPORTS_MULTIPLEOUTSTANDINGTX : COVERED");

 property WhenMasterAndSlaveIsNotSupportMultipleWriteOutstandingTx;
   @(posedge aclk) disable iff(!aresetn)
    (awvalid && awready) |=> (bvalid && bready)
     ##2 (awvalid && awready) ##1 (bvalid && bready)
     ##6 (awvalid && awready) ##1 (bvalid && bready);
 endproperty

 IFMASTERANDSLAVEISNOTSUPPORTS_MULTIPLEWRITEOUTSTANDINGTX_THEN_NORMALBLOCKINGTX : cover property
 (WhenMasterAndSlaveIsNotSupportMultipleWriteOutstandingTx)
 $info("IFMASTERANDSLAVEISNOTSUPPORTS_MULTIPLEWRITEOUTSTANDINGTX_THEN_NORMALBLOCKINGTX : COVERED");

  end

  property WhenValidAssertedThenSameClkReadyAsserted(logic valid, logic ready);
   @(posedge aclk) disable iff (!aresetn)
   (valid) |-> ready;
  endproperty

  IFAWVALIDASSERTED_THEN_SAMECLK_AWREADYASSERTED: cover property
  (WhenValidAssertedThenSameClkReadyAsserted(awvalid, awready))
  $info("IFAWVALIDISASSERTED_THENSAMECLK_AWREADYISASSERTED :COVERED");

  IFWVALIDASSERTED_THEN_SAMECLK_WREADYASSERTED: cover property
  (WhenValidAssertedThenSameClkReadyAsserted(wvalid, wready))
  $info("IFWVALIDISASSERTED_THENSAMECLK_WREADYISASSERTED :COVERED");

  IFBVALIDASSERTED_THEN_SAMECLK_BREADYASSERTED: cover property
  (WhenValidAssertedThenSameClkReadyAsserted(bvalid, bready))
  $info("IFBVALIDISASSERTED_THENSAMECLK_BREADYISASSERTED :COVERED");


  property WhenBackToBackValidAndReadyAssertedWithoutDelayInbetween2Transfer(logic valid, logic ready);
   @(posedge aclk) disable iff (!aresetn)
    (valid && ready) |=> ($stable(valid) && $stable(ready));
  endproperty

  if(Axi4LiteWriteMasterGlobalPkg::DEFAULT_BREADY == 1) begin

  IFBACKTOBACK_AWVALIDANDAWREADYASSERTED_WITHOUTDELAY_INBETWEEN2TRANSFER: cover property
  (WhenBackToBackValidAndReadyAssertedWithoutDelayInbetween2Transfer(awvalid, awready))
  $info("IFBACKTOBACK_AWVALIDANDAWREADYASSERTED_WITHOUTDELAY_INBETWEEN2TRANSFER : COVERED");

  IFBACKTOBACK_WVALIDANDWREADYASSERTED_WITHOUTDELAY_INBETWEEN2TRANSFER: cover property
  (WhenBackToBackValidAndReadyAssertedWithoutDelayInbetween2Transfer(wvalid, wready))
  $info("IFBACKTOBACK_WVALIDANDWREADYASSERTED_WITHOUTDELAY_INBETWEEN2TRANSFER : COVERED");

  IFBACKTOBACK_BVALIDANDBREADYASSERTED_WITHOUTDELAY_INBETWEEN2TRANSFER: cover property
  (WhenBackToBackValidAndReadyAssertedWithoutDelayInbetween2Transfer(bvalid, bready))
  $info("IFBACKTOBACK_BVALIDANDBREADYASSERTED_WITHOUTDELAY_INBETWEEN2TRANSFER : COVERED");

  property WhenBackToBackValidAndReadyAssertedWith1ClkDelayInbetween2Transfer(logic valid, logic ready);
   @(posedge aclk) disable iff (!aresetn)
    (valid && ready) |=> ##1 (valid && ready);
  endproperty

  IFBACKTOBACK_AWVALIDANDAWREADYASSERTED_WITH1CLKDELAY_INBETWEEN2TRANSFER: cover property
  (WhenBackToBackValidAndReadyAssertedWith1ClkDelayInbetween2Transfer(awvalid, awready))
  $info("IFBACKTOBACK_AWVALIDANDAWREADYASSERTED_WITH1CLKDELAY_INBETWEEN2TRANSFER : COVERED");

  IFBACKTOBACK_WVALIDANDWREADYASSERTED_WITH1CLKDELAY_INBETWEEN2TRANSFER: cover property
  (WhenBackToBackValidAndReadyAssertedWith1ClkDelayInbetween2Transfer(wvalid, wready))
  $info("IFBACKTOBACK_WVALIDANDWREADYASSERTED_WITH1CLKDELAY_INBETWEEN2TRANSFER : COVERED");

  IFBACKTOBACK_BVALIDANDBREADYASSERTED_WITH1CLKDELAY_INBETWEEN2TRANSFER: cover property
  (WhenBackToBackValidAndReadyAssertedWith1ClkDelayInbetween2Transfer(bvalid, bready))
  $info("IFBACKTOBACK_BVALIDANDBREADYASSERTED_WITH1CLKDELAY_INBETWEEN2TRANSFER : COVERED");

  property WhenBackToBackValidAndReadyAssertedWith2ClkDelayInbetween2Transfer(logic valid, logic ready); 
   @(posedge aclk) disable iff (!aresetn) 
    (valid && ready) |=> ##2 (valid && ready); 
  endproperty  

  IFBACKTOBACK_AWVALIDANDAWREADYASSERTED_WITH2CLKDELAY_INBETWEEN2TRANSFER: cover property  
  (WhenBackToBackValidAndReadyAssertedWith2ClkDelayInbetween2Transfer(awvalid, awready))
  $info("IFBACKTOBACK_AWVALIDANDAWREADYASSERTED_WITH2CLKDELAY_INBETWEEN2TRANSFER  :COVERED");

  IFBACKTOBACK_WVALIDANDWREADYASSERTED_WITH2CLKDELAY_INBETWEEN2TRANSFER: cover property  
  (WhenBackToBackValidAndReadyAssertedWith2ClkDelayInbetween2Transfer(wvalid, wready))
  $info("IFBACKTOBACK_WVALIDANDWREADYASSERTED_WITH2CLKDELAY_INBETWEEN2TRANSFER  :COVERED");
 
  IFBACKTOBACK_BVALIDANDBREADYASSERTED_WITH2CLKDELAY_INBETWEEN2TRANSFER: cover property  
  (WhenBackToBackValidAndReadyAssertedWith2ClkDelayInbetween2Transfer(bvalid, bready))
  $info("IFBACKTOBACK_BVALIDANDBREADYASSERTED_WITH2CLKDELAY_INBETWEEN2TRANSFER  :COVERED");

  property WhenBackToBackValidAndReadyAssertedWithin3To16ClkDelayInbetween2Transfer(logic valid, logic ready);
   @(posedge aclk) disable iff (!aresetn)
    (valid && ready) |=> ##[3:DELAY_FOR_SECOND_TRANSFER] (valid && ready);
  endproperty

  IFBACKTOBACK_AWVALIDANDAWREADYASSERTED_WITHIN3TO16CLKDELAY_INBETWEEN2TRANSFER: cover property
  (WhenBackToBackValidAndReadyAssertedWithin3To16ClkDelayInbetween2Transfer(awvalid, awready))
  $info("IFBACKTOBACK_AWVALIDANDAWREADYASSERTED_WITHIN3TO16CLKDELAY_INBETWEEN2TRANSFER : COVERED");

  IFBACKTOBACK_WVALIDANDWREADYASSERTED_WITHIN3TO16CLKDELAY_INBETWEEN2TRANSFER: cover property
  (WhenBackToBackValidAndReadyAssertedWithin3To16ClkDelayInbetween2Transfer(wvalid, wready))
  $info("IFBACKTOBACK_WVALIDANDWREADYASSERTED_WITHIN3TO16CLKDELAY_INBETWEEN2TRANSFER : COVERED");

  IFBACKTOBACK_BVALIDANDBREADYASSERTED_WITHIN3TO16CLKDELAY_INBETWEEN2TRANSFER: cover property
  (WhenBackToBackValidAndReadyAssertedWithin3To16ClkDelayInbetween2Transfer(bvalid, bready))
  $info("IFBACKTOBACK_BVALIDANDBREADYASSERTED_WITHIN3TO16CLKDELAY_INBETWEEN2TRANSFER : COVERED");

  property WhenBackToBackValidAndReadyAssertedWithMoreThan16ClkDelayInbetween2Transfer(logic valid, logic ready);
   @(posedge aclk) disable iff (!aresetn)
   (valid && ready) |=> ##[DELAY_FOR_SECOND_TRANSFER :$] (valid && ready);
  endproperty

  IFBACKTOBACK_AWVALIDANDAWREADYASSERTED_WITHMORETHAN16CLKDELAY_INBETWEEN2TRANSFER: cover property
  (WhenBackToBackValidAndReadyAssertedWithMoreThan16ClkDelayInbetween2Transfer(awvalid, awready))
  $info("IFBACKTOBACK_AWVALIDANDAWREADYASSERTED_WITHMORETHAN16CLKDELAY_INBETWEEN2TRANSFER : COVERED");

  IFBACKTOBACK_WVALIDANDWREADYASSERTED_WITHMORETHAN16CLKDELAY_INBETWEEN2TRANSFER: cover property
  (WhenBackToBackValidAndReadyAssertedWithMoreThan16ClkDelayInbetween2Transfer(wvalid, wready))
  $info("IFBACKTOBACK_WVALIDANDWREADYASSERTED_WITHMORETHAN16CLKDELAY_INBETWEEN2TRANSFER : COVERED");

  IFBACKTOBACK_BVALIDANDBREADYASSERTED_WITHMORETHAN16CLKDELAY_INBETWEEN2TRANSFER: cover property
  (WhenBackToBackValidAndReadyAssertedWithMoreThan16ClkDelayInbetween2Transfer(bvalid, bready))
  $info("IFBACKTOBACK_BVALIDANDBREADYASSERTED_WITHMORETHAN16CLKDELAY_INBETWEEN2TRANSFER : COVERED");

  end

  property readyAssertAtleastOnce(logic ready); 
   @(posedge aclk) disable iff (!aresetn)
   ready; 
  endproperty 

  IFAWREADY_NEEDTOASSERTED_ATLEASTONCE: cover property
  (readyAssertAtleastOnce(awready)) 
  $info("IFAWREADY_NEEDTOASSERTED_ATLEASTONCE : COVERED");
  
  IFWREADY_NEEDTOASSERTED_ATLEASTONCE: cover property
  (readyAssertAtleastOnce(wready)) 
  $info("IFWREADY_NEEDTOASSERTED_ATLEASTONCE : COVERED");
 
  IFBREADY_NEEDTOASSERTED_ATLEASTONCE: cover property
  (readyAssertAtleastOnce(bready))
  $info("IFBREADY_NEEDTOASSERTED_ATLEASTONCE : COVERED");


    property WhenReadyAssertedThenNextClkValidAsserted(logic valid, logic ready);
     @(posedge aclk) disable iff (!aresetn)
     ready |-> !valid ##1 valid;
    endproperty

    IFAWREADYASSERTED_THEN_NEXTCLK_AWVALIDASSERTED: cover property
    (WhenReadyAssertedThenNextClkValidAsserted(awvalid,awready))
    $info("IFAWREADYASSERTED_THEN_NEXTCLK_AWVALIDASSERTED: COVERED");

    IFWREADYASSERTED_THEN_NEXTCLK_WVALIDASSERTED: cover property
    (WhenReadyAssertedThenNextClkValidAsserted(wvalid,wready))
    $info("IFWREADYASSERTED_THEN_NEXTCLK_WVALIDASSERTED: COVERED");

    IFBREADYASSERTED_THEN_NEXTCLK_BVALIDASSERTED: cover property
    (WhenReadyAssertedThenNextClkValidAsserted(bvalid,bready))
    $info("IFBREADYASSERTED_THEN_NEXTCLK_BVALIDASSERTED: COVERED");

    property WhenReadyAssertedThenInbetween2To5ClkValidAsserted(logic valid, logic ready);
     @(posedge aclk) disable iff (!aresetn)
     ready |-> !valid ##[2:5] valid;
    endproperty

    IFAWREADYASSERTED_THEN_INBETWEEN2TO5CLK_AWVALIDASSERTED: cover property
    (WhenReadyAssertedThenInbetween2To5ClkValidAsserted(awvalid,awready))
    $info("IFAWREADYASSERTED_THEN_INBETWEEN2TO5CLK_AWVALIDASSERTED: COVERED");

    IFWREADYASSERTED_THEN_INBETWEEN2TO5CLK_WVALIDASSERTED: cover property
    (WhenReadyAssertedThenInbetween2To5ClkValidAsserted(wvalid,wready))
    $info("IFWREADYASSERTED_THEN_INBETWEEN2TO5CLK_WVALIDASSERTED: COVERED");

    IFBREADYASSERTED_THEN_INBETWEEN2TO5CLK_BVALIDASSERTED: cover property
    (WhenReadyAssertedThenInbetween2To5ClkValidAsserted(bvalid,bready))
    $info("IFBREADYASSERTED_THEN_INBETWEEN2TO5CLK_BVALIDASSERTED: COVERED");

    property WhenReadyAssertedThenInbetween1To15ClkValidAsserted(logic valid, logic ready);
     @(posedge aclk) disable iff (!aresetn)
     ready |-> !valid ##[0:MAX_DELAY_VALID] valid;
    endproperty

    IFAWREADYASSERTED_THEN_INBETWEEN1TO15CLK_AWVALIDASSERTED : cover property
    (WhenReadyAssertedThenInbetween1To15ClkValidAsserted(awvalid,awready))
    $info("IFAWREADYASSERTED_THEN_INBETWEEN1TO15CLK_AWVALIDASSERTED  : COVERED");

    IFWREADYASSERTED_THEN_INBETWEEN1TO15CLK_WVALIDASSERTED : cover property
    (WhenReadyAssertedThenInbetween1To15ClkValidAsserted(wvalid,wready))
    $info("IFWREADYASSERTED_THEN_INBETWEEN1TO15CLK_WVALIDASSERTED : COVERED");

    IFBREADYASSERTED_THEN_INBETWEEN1TO15CLK_BVALIDASSERTED: cover property
    (WhenReadyAssertedThenInbetween1To15ClkValidAsserted (bvalid,bready))
    $info("IFBREADYASSERTED_THEN_INBETWEEN1TO15CLK_BVALIDASSERTED: COVERED");

    property WhenTransferOccurThenNextCLKBreadyWillGoDefaultState(logic valid, logic ready); 
     @(posedge aclk) disable iff (!aresetn)
         (ready && valid) |=> (ready== DEFAULT_BREADY);
    endproperty  

    IFTRANSFEROCCUR_THENBREADY_WILLGODEFAULTSTATE: cover property  
    (WhenTransferOccurThenNextCLKBreadyWillGoDefaultState(bvalid, bready))
    $info("IFTRANSFEROCCUR_THENBREADY_WILLGODEFAULTSTATE : COVERED");

    property WhenAwreadyHighAndWritingValidAddressAndDataOnSlaveLocationThenSlaveWillGiveOkayResponse; 
     @(posedge aclk) disable iff (!aresetn)
         (awvalid && awready && !($isunknown(awaddr))) |->  
              ##[0:MAX_DELAY_WVALID] (wvalid && wready && !($isunknown(wdata)))  
              ##[1:MAX_DELAY_BVALID] (bvalid && bready && (bresp == 2'b00));
    endproperty  

    IFAWREADYHIGH_THEN_WRITINGTHEVALID_AWADDRANDWDATA_ONSLAVELOCATION_THEN_SLAVEWILLGIVEOKAYRESPONSE: cover property 
    (WhenAwreadyHighAndWritingValidAddressAndDataOnSlaveLocationThenSlaveWillGiveOkayResponse) 
    $info("IFAWREADYHIGH_THEN_WRITINGTHEVALID_AWADDRANDWDATA_ONSLAVELOCATION_THEN_SLAVEWILLGIVEOKAYRESPONSE : COVERED");

   property WhenAwvalidAwreadyWvalidAndWreadyAreAssertedSameClkThenNextClkBvalidAsserted; 
   @(posedge aclk) disable iff (!aresetn)
   (awvalid && awready && wvalid && wready && !bvalid) |=> bvalid; 
   endproperty  

   AWVALIDANDAWREADY_WVALIDANDWREADY_ASSERTEDATSAMECLK_THEN_BVALIDASSERTEDNEXTCLK: cover property  
   (WhenAwvalidAwreadyWvalidAndWreadyAreAssertedSameClkThenNextClkBvalidAsserted) 
   $info("AWVALIDANDAWREADY_WVALIDANDWREADY_ASSERTEDATSAMECLK_THEN_BVALIDASSERTEDNEXTCLK :COVERED");

   property WhenAwvalidAwreadyAssertedThenNextClkWvalidWreadyAssertedThenNextClkBValidAsserted;
   @(posedge aclk) disable iff (!aresetn)
   (awvalid && awready && !bvalid) |=> (wvalid && wready && !bvalid) ##1 bvalid;
   endproperty

   AWVALIDANDAWREADY_THEN_NEXTCLK_WVALIDANDWREADYASSERTED_THEN_NEXTCLK_BVALIDASSERTED: cover property
   (WhenAwvalidAwreadyAssertedThenNextClkWvalidWreadyAssertedThenNextClkBValidAsserted)
   $info("AWVALIDANDAWREADY_THEN_NEXTCLK_WVALIDANDWREADYASSERTED_THEN_NEXTCLK_BVALIDASSERTED :COVERED");

   property WhenAwvalidAwreadyAssertedThenNextClkWvalidWreadyAssertedThenInbetween1To12ClkBValidAsserted;
   @(posedge aclk) disable iff (!aresetn)
   (awvalid && awready && !bvalid) |=> (wvalid && wready && !bvalid) ##[1:MAX_DELAY_BVALID] bvalid;
   endproperty

   AWVALIDANDAWREADY_THEN_NEXTCLK_WVALIDANDWREADYASSERTED_THEN_INBETWEEN1TO12CLK_BVALIDASSERTED: cover property
   (WhenAwvalidAwreadyAssertedThenNextClkWvalidWreadyAssertedThenInbetween1To12ClkBValidAsserted)
   $info("AWVALIDANDAWREADY_THEN_NEXTCLK_WVALIDANDWREADYASSERTED_THEN_INBETWEEN1TO12CLK_BVALIDASSERTED :COVERED");

   property WhenAwvalidAwreadyAssertedThenInbetween0To10ClkWvalidWreadyAssertedThenInbetween1To12ClkBValidAsserted;
   @(posedge aclk) disable iff (!aresetn)
   (awvalid && awready && !bvalid) |-> ##[0:MAX_DELAY_WVALID] (wvalid && wready && !bvalid) ##[1:MAX_DELAY_BVALID] bvalid;
   endproperty

   IFAWVALIDANDAWREADYAREASSERTED_THEN_INBETWEEN1TO10CLK_WVALIDANDWREADYASSERTED_THEN_INBETWEEN1TO12CLK_BVALIDASSERTED: cover property
   (WhenAwvalidAwreadyAssertedThenInbetween0To10ClkWvalidWreadyAssertedThenInbetween1To12ClkBValidAsserted) 
   $info("IFAWVALIDANDAWREADYAREASSERTED_THEN_INBETWEEN1TO10CLK_WVALIDANDWREADYASSERTED_THEN_INBETWEEN1TO12CLK_BVALIDASSERTED :COVERED");

   property WhenAwaddressIsGeneratedOnTheSameClkWdataWillBeGenerated;
    @(posedge aclk) disable iff (!aresetn)
   (awvalid && !($isunknown(awaddr))) |-> (wvalid && !($isunknown(wdata)));
   endproperty

   IFAWADDRESISASSERTED_THEN_SAMECLK_WDATAWILLBEASSERTED: cover property
   (WhenAwaddressIsGeneratedOnTheSameClkWdataWillBeGenerated)
   $info("IFAWADDRESISASSERTED_THEN_SAMECLK_WDATAWILLBEASSERTED : COVERED");

   property WhenAwaddressIsGeneratedThenNextClkWdataWillBeGenerated;
    @(posedge aclk) disable iff (!aresetn)
   (awvalid && !($isunknown(awaddr))) |=> (wvalid && !($isunknown(wdata)));
   endproperty

   IFAWADDRESISASSERTED_THEN_NEXTCLK_WDATAWILLBEASSERTED: cover property
   (WhenAwaddressIsGeneratedThenNextClkWdataWillBeGenerated)
   $info("IFAWADDRESISASSERTED_THEN_NEXTCLK_WDATAWILLBEASSERTED : COVERED");

   property WhenAwaddressIsGeneratedThenInbetween1To10ClkWdataWillBeGenerated; 
    @(posedge aclk) disable iff (!aresetn)
   (awvalid && !($isunknown(awaddr))) |-> ##[1:MAX_DELAY_WVALID] (wvalid && !($isunknown(wdata)));
   endproperty  
   
   IFAWADDRESISASSERTED_THEN_INBETWEEN1TO10CLKWDATAWILLBEASSERTED: cover property
   (WhenAwaddressIsGeneratedThenInbetween1To10ClkWdataWillBeGenerated)
   $info("IFAWADDRESISASSERTED_THEN_INBETWEEN1TO10CLKWDATAWILLBEASSERTED : COVERED");

   property WhenWdataIsGeneratedThenNextClkAwaddressillBeGenerated; 
    @(posedge aclk) disable iff (!aresetn)
    (wvalid && !($isunknown(wdata))) |=> (awvalid && !($isunknown(awaddr)));
   endproperty  

   IFWDATAISASSERTED_THEN_NEXTCLK_AWADDRWILLBEASSERTED: cover property  
   (WhenWdataIsGeneratedThenNextClkAwaddressillBeGenerated)
   $info("IFWDATAISASSERTED_THEN_NEXTCLK_AWADDRWILLBEASSERTED :COVERED");

   property WhenWdataIsGeneratedThenInbetween1To10ClkAwaddressillBeGenerated;
   @(posedge aclk) disable iff (!aresetn)
   (wvalid && !($isunknown(wdata))) |-> ##[1:MAX_DELAY_AWVALID] (awvalid && !($isunknown(awaddr)));
   endproperty

   IFWDATAISASSERTED_THEN_INBETWEEN1TO10CLK_AWADDRWILLBEASSERTED: cover property
   (WhenWdataIsGeneratedThenInbetween1To10ClkAwaddressillBeGenerated)
   $info("IFWDATAISASSERTED_THEN_INBETWEEN1TO10CLK_AWADDRWILLBEASSERTED :COVERED");
 
   property WhenAwvalidIsAssertedThenSameClkAwreadyAndWreadyWillBeAssert;
   @(posedge aclk)  disable iff (!aresetn)
   awvalid |-> (awready && wready);
   endproperty

  IFAWVALIDISASSERTED_THEN_SAMECLK_AWREADYANDWREADYWILLBEASSERT: cover property
  (WhenAwvalidIsAssertedThenSameClkAwreadyAndWreadyWillBeAssert)
  $info("IFAWVALIDISASSERTED_THEN_SAMECLK_AWREADYANDWREADYWILLBEASSERT : COVERED");

  property WhenAwreadyIsAssertedThenNextClkWvalidIsAsserted;
    @(posedge aclk) disable iff (!aresetn)
    (awready && !wvalid) |=> wvalid;
  endproperty

  IFAWREADYISASSERTED_THEN_NEXTCLK_WVALIDISASSERTED: cover property
  (WhenAwreadyIsAssertedThenNextClkWvalidIsAsserted)
  $info("IFAWREADYISASSERTED_THEN_NEXTCLK_WVALIDISASSERTED :  COVERED");

  property WhenAwreadyIsAssertedThenInbetween1To10ClkWvalidIsAsserted; 
    @(posedge aclk) disable iff (!aresetn)
    awready |-> ##[1:MAX_DELAY_WVALID] wvalid;
  endproperty  

  IFAWREADYISASSERTED_THEN_INBETWEEN1TO10CLK_WVALIDISASSERTED: cover property
  (WhenAwreadyIsAssertedThenInbetween1To10ClkWvalidIsAsserted)
  $info("IFAWREADYISASSERTED_THEN_INBETWEEN1TO10CLK_WVALIDISASSERTED:  COVERED");
 
  property WhenAwreadyIsAssertedThenSameClkWvalidIsAsserted;
    @(posedge aclk) disable iff (!aresetn)
    awready |-> wvalid;
  endproperty

  IFAWREADYISASSERTED_THEN_SAMECLK_WVALIDISASSERTED: cover property
  (WhenAwreadyIsAssertedThenSameClkWvalidIsAsserted)
  $info("IFAWREADYISASSERTED_THEN_SAMECLK_WVALIDISASSERTED :  COVERED");

  property WhenAwreadyIsAssertedThenNextClkAwvalidAndWvalidAreAsserted;
    @(posedge aclk) disable iff (!aresetn)
    (awready && !awvalid && !wvalid) |-> ##1 (awvalid && wvalid);
  endproperty

  IFAWREADYISASSERTED_THEN_NEXTCLK_AWVALIDANDWVALIDAREASSERTED: cover property
  (WhenAwreadyIsAssertedThenNextClkAwvalidAndWvalidAreAsserted)
  $info("IFAWREADYISASSERTED_THEN_NEXTCLK_AWVALIDANDWVALIDAREASSERTED :  COVERED");

   property WhenAwreadyIsAssertedThenInbetween1To16ClkAwvalidAndWvalidAreAsserted;
   @(posedge aclk) disable iff (!aresetn)
   awready |-> ##[1:MAX_DELAY_VALID] (awvalid && wvalid);
   endproperty
 
   IFAWREADYISASSERTED_THEN_INBETWEEN1TO16CLK_AWVALIDANDWVALIDAREASSERTED: cover property
   (WhenAwreadyIsAssertedThenInbetween1To16ClkAwvalidAndWvalidAreAsserted)
   $info("IFAWREADYISASSERTED_THEN_INBETWEEN1TO16CLK_AWVALIDANDWVALIDAREASSERTED:  COVERED");

   property WhenAwreadyIsAssertedThenSameClkAwvalidAndWvalidAreAsserted;
   @(posedge aclk) disable iff (!aresetn)
   awready |-> (awvalid && wvalid);
   endproperty
 
   IFAWREADYISASSERTED_THEN_SAMECLK_AWVALIDANDWVALIDAREASSERTED: cover property
   (WhenAwreadyIsAssertedThenSameClkAwvalidAndWvalidAreAsserted)
  $info("IFAWREADYISASSERTED_THEN_SAMECLK_AWVALIDANDWVALIDAREASSERTED :  COVERED");


  property WhenWreadyIsAssertedThenNextClkWvalidIsAsserted;
    @(posedge aclk) disable iff (!aresetn)
    (wready && !wvalid) |=> wvalid;
  endproperty

  IFWREADYISASSERTED_THEN_NEXTCLK_WVALIDISASSERTED: cover property
  (WhenWreadyIsAssertedThenNextClkWvalidIsAsserted)
  $info("IFWREADYISASSERTED_THEN_NEXTCLK_WVALIDISASSERTED :  COVERED");

  property WhenWreadyIsAssertedThenInbetween1To10ClkWvalidIsAsserted;
    @(posedge aclk) disable iff (!aresetn)
    wready |-> ##[1:MAX_DELAY_WVALID] wvalid;
  endproperty

  IFWREADYISASSERTED_THEN_INBETWEEN1TO10CLK_WVALIDISASSERTED: cover property
  (WhenWreadyIsAssertedThenInbetween1To10ClkWvalidIsAsserted)
  $info("IFWREADYISASSERTED_THEN_INBETWEEN1TO10CLK_WVALIDISASSERTED:  COVERED");

  property WhenWreadyIsAssertedThenSameClkWvalidIsAsserted;
    @(posedge aclk) disable iff (!aresetn)
    wready |-> wvalid;
  endproperty

  IFWREADYISASSERTED_THEN_SAMECLK_WVALIDISASSERTED: cover property
  (WhenWreadyIsAssertedThenSameClkWvalidIsAsserted)
  $info("IFWREADYISASSERTED_THEN_SAMECLK_WVALIDISASSERTED :  COVERED");

  property WhenWreadyIsAssertedThenNextClkAwvalidAndWvalidAreAsserted;
    @(posedge aclk) disable iff (!aresetn)
    (wready && !awvalid && !wvalid) |-> ##1 (awvalid && wvalid);
  endproperty

  IFWREADYISASSERTED_THEN_NEXTCLK_AWVALIDANDWVALIDAREASSERTED: cover property
  (WhenWreadyIsAssertedThenNextClkAwvalidAndWvalidAreAsserted)
  $info("IFWREADYISASSERTED_THEN_NEXTCLK_AWVALIDANDWVALIDAREASSERTED :  COVERED");

   property WhenWreadyIsAssertedThenInbetween1To16ClkAwvalidAndWvalidAreAsserted;
   @(posedge aclk) disable iff (!aresetn)
   wready |-> ##[1:MAX_DELAY_VALID] (awvalid && wvalid);
   endproperty

   IFWREADYISASSERTED_THEN_INBETWEEN1TO16CLK_AWVALIDANDWVALIDAREASSERTED: cover property
   (WhenWreadyIsAssertedThenInbetween1To16ClkAwvalidAndWvalidAreAsserted)
   $info("IFWREADYISASSERTED_THEN_INBETWEEN1TO16CLK_AWVALIDANDWVALIDAREASSERTED:  COVERED");

   property WhenWreadyIsAssertedThenSameClkAwvalidAndWvalidAreAsserted;
   @(posedge aclk) disable iff (!aresetn)
   wready |-> (awvalid && wvalid);
   endproperty
 
   IFWREADYISASSERTED_THEN_SAMECLK_AWVALIDANDWVALIDAREASSERTED: cover property
   (WhenWreadyIsAssertedThenSameClkAwvalidAndWvalidAreAsserted)
  $info("IFWREADYISASSERTED_THEN_SAMECLK_AWVALIDANDWVALIDAREASSERTED :  COVERED");


  property WhenWvalidIsAssertedThenNextClkAwreadyAsserted;
    @(posedge aclk) disable iff (!aresetn)
    wvalid |=> awready;
  endproperty

  IFWVALIDISASSERTED_THEN_NEXTCLK_AWREADYISASSERTED: cover property
  (WhenWvalidIsAssertedThenNextClkAwreadyAsserted)
  $info("IFWVALIDISASSERTED_THEN_NEXTCLK_AWREADYISASSERTED:  COVERED");

   property WhenWvalidIsAssertedThenInbetween1To16ClkClkAwreadyAsserted;
    @(posedge aclk) disable iff (!aresetn)
    wvalid |=> ##[0:MAX_DELAY_READY] awready;
  endproperty

  IFWVALIDISASSERTED_THEN_INBETWEEN1TO16CLK_AWREADYISASSERTED: cover property
  (WhenWvalidIsAssertedThenInbetween1To16ClkClkAwreadyAsserted)
  $info("IFWVALIDISASSERTED_THEN_INBETWEEN1TO16CLK_AWREADYISASSERTED:  COVERED");

   property WhenAwvalidIsAssertedThenNextClkAwreadyAssertedThenNextClkWvalidIsAsserted();
   @(posedge aclk) disable iff (!aresetn)
    awvalid |=> awready ##1 wvalid;
   endproperty

   IFAWVALIDISASSERTED_THEN_NEXTCLK_AWREADYISASSERTED_THEN_NEXTCLK_WVALIDIASERTED: cover property
   (WhenAwvalidIsAssertedThenNextClkAwreadyAssertedThenNextClkWvalidIsAsserted)
   $info("IFAWVALIDISASSERTED_THEN_NEXTCLK_AWREADYISASSERTED_THEN_NEXTCLK_WVALIDIASERTED  COVERED");

   property WhenWvalidIsAssertedThenNextClkAwvalidIsAsserted();
    @(posedge aclk) disable iff (!aresetn)
    wvalid |=> awvalid;
   endproperty 

  property WhenWvalidIsAssertedThenNextClkWreadyAsserted;
    @(posedge aclk) disable iff (!aresetn)
    wvalid |=> wready;
  endproperty

  IFWVALIDISASSERTED_THEN_NEXTCLK_WREADYISASSERTED: cover property
  (WhenWvalidIsAssertedThenNextClkWreadyAsserted)
  $info("IFWVALIDISASSERTED_THEN_NEXTCLK_WREADYISASSERTED:  COVERED");

   property WhenWvalidIsAssertedThenInbetween1To16ClkClkWreadyAsserted;
    @(posedge aclk) disable iff (!aresetn)
    wvalid |=> ##[0:MAX_DELAY_READY] wready;
  endproperty

  IFWVALIDISASSERTED_THEN_INBETWEEN1TO16CLK_WREADYISASSERTED: cover property
  (WhenWvalidIsAssertedThenInbetween1To16ClkClkWreadyAsserted)
  $info("IFWVALIDISASSERTED_THEN_INBETWEEN1TO16CLK_WREADYISASSERTED:  COVERED");

   property WhenAwvalidIsAssertedThenNextClkWvalidIsAssertedThenNextClkWreadyIsAsserted();
   @(posedge aclk) disable iff (!aresetn)
    awvalid |=> wvalid ##1 wready;
   endproperty

   IFAWVALIDISASSERTED_THEN_NEXTCLK_WVALIDISASSERTED_THEN_NEXTCLK_WREADYISASSERTED: cover property
   (WhenAwvalidIsAssertedThenNextClkWvalidIsAssertedThenNextClkWreadyIsAsserted)
   $info("IFAWVALIDISASSERTED_THEN_NEXTCLK_WVALIDISASSERTED_THEN_NEXTCLK_WREADYISASSERTED  COVERED");


   IFWVALIDISASSERTED_THEN_NEXTCLK_AWVALIDISASSERTED: cover property
   (WhenWvalidIsAssertedThenNextClkAwvalidIsAsserted)
   $info("IFWVALIDISASSERTED_THEN_NEXTCLK_AWVALIDISASSERTED:  COVERED");

   property WhenWvalidIsAssertedThenInbetween1To16ClkAwvalidIsAsserted();
   @(posedge aclk) disable iff (!aresetn)
   wvalid |-> ##[1:MAX_DELAY_VALID] awvalid;
   endproperty

   IFWVALIDISASSERTED_THEN_INBETWEEN1TO16CLK_AWVALIDISASSERTED: cover property
   (WhenWvalidIsAssertedThenInbetween1To16ClkAwvalidIsAsserted)
   $info("IFWVALIDISASSERTED_THEN_INBETWEEN1TO16CLK_AWVALIDISASSERTED :  COVERED");

   property WhenWvalidIsAssertedThenSameClkAwvalidIsAsserted();
    @(posedge aclk) disable iff (!aresetn)
    wvalid |-> awvalid;
   endproperty 

   IFWVALIDISASSERTED_THEN_SAMECLK_AWVALIDISASSERTED: cover property
   (WhenWvalidIsAssertedThenSameClkAwvalidIsAsserted)
   $info("IFWVALIDISASSERTED_THEN_SAMECLK_AWVALIDISASSERTED:  COVERED");

   property WhenAwvalidIsAssertedThenNextClkWvalidIsAsserted();
    @(posedge aclk) disable iff (!aresetn)
    awvalid |=> wvalid;
   endproperty

   IFAWVALIDISASSERTED_THEN_NEXTCLK_WVALIDISASSERTED: cover property
   (WhenAwvalidIsAssertedThenNextClkWvalidIsAsserted)
   $info("IFAWVALIDISASSERTED_THEN_NEXTCLK_WVALIDISASSERTED:  COVERED");

   property WhenAwvalidIsAssertedThenInbewteen1TO10ClkWvalidIsAsserted();
    @(posedge aclk) disable iff (!aresetn)
    awvalid |=> ##[0:MAX_DELAY_WVALID] wvalid;
   endproperty

   IFAWVALIDISASSERTED_THEN_INBETWEEN1TO10CLK_WVALIDISASSERTED: cover property
   (WhenAwvalidIsAssertedThenInbewteen1TO10ClkWvalidIsAsserted)
   $info("IFAWVALIDISASSERTED_THEN_INBETWEEN1TO10CLK_WVALIDISASSERTED:  COVERED");

   property WhenWvalidIsAssertedThenNextClkAwreadyAndWreadyWillBeAssert;
     @(posedge aclk)  disable iff (!aresetn)
    wvalid |=> (awready && wready);
   endproperty

  IFWVALIDISASSERTED_THEN_NEXTCLK_AWREADYANDWREADYWILLBEASSERT: cover property
  (WhenWvalidIsAssertedThenNextClkAwreadyAndWreadyWillBeAssert)
  $info("IFWVALIDISASSERTED_THEN_NEXTCLK_AWREADYANDWREADYWILLBEASSERT : COVERED");

   property WhenWvalidIsAssertedThenSameClkAwreadyAndWreadyWillBeAssert;
   @(posedge aclk)  disable iff (!aresetn)
   wvalid |-> (awready && wready);
   endproperty

  IFWVALIDISASSERTED_THEN_SAMECLK_AWREADYANDWREADYWILLBEASSERT: cover property
  (WhenWvalidIsAssertedThenSameClkAwreadyAndWreadyWillBeAssert)
  $info("IFWVALIDISASSERTED_THEN_SAMECLK_AWREADYANDWREADYWILLBEASSERT : COVERED");

   property WhenWvalidAndWreadyAreAssertedAndWstrbOfHigherLanesOfWdataIsValidData;
   @(posedge aclk) disable iff (!aresetn)
    (wvalid && wready) |-> ((wstrb === 4'b1100) && (wdata[15:0] === 16'b0));
   endproperty

   property WhenWvalidAndWreadyAreAssertedAndWstrbOfLowerLanesOfWdataIsValidData;
   @(posedge aclk) disable iff (!aresetn)
   (wvalid && wready) |-> ((wstrb == 4'b0011) && (wdata[31:16] == 16'h0000));
   endproperty
   
   property WhenWvalidAndWreadyAreAssertedThenSameClkWstrbValueIsAllOnesThenWdataIsNotUnknown; 
     @(posedge aclk) disable iff (!aresetn)
     (wvalid && wready) |-> ((wstrb == 4'b1111) && (!$isunknown(wdata)));
   endproperty 
   
   property WhenWvalidAndWreadyAreAssertedAndWstrbValueIsAllOnesThenNextClkWstrbIsInactiveByteThenWdataIsPreviousValues;
     @(posedge aclk) disable iff (!aresetn)
     (wvalid && wready) |-> ((wstrb == 4'b1111) && (!$isunknown(wdata))) 
      ##1 ((wvalid && wready) && (wstrb == 4'b0101) && (wdata[31:24] == $past(wdata[31:24])) 
      && wdata[15:8] == $past(wdata[15:8]));   
   endproperty 

   property WhenWvalidIsAssertedAndWstrbOfAllBitAreHighThenNextClkWvalidGoesToLowThenWstrbValueIsContinuesWithPreviousWstrbValues;
    @(posedge aclk) disable iff (!aresetn)
     wvalid |-> ((wstrb == 4'b1111) && (!$isunknown(wdata)))
     ##1 $fell(wvalid) && (wstrb == $past(wstrb));
   endproperty

   property WhenWvalidIsAssertedAndWstrbOfAllBitAreHighThenNextClkWvalidGoesToLowThenWstrbValuesWillZeros;
    @(posedge aclk) disable iff (!aresetn)
     wvalid |-> ((wstrb == 4'b1111) && (!$isunknown(wdata)))
     ##1 $fell(wvalid) && (wstrb == 4'b0000);
   endproperty
    

    property WhenWvalidAndWreadyAreAssertedAndWdataIs64BitsAndWstrbLanesOfL2AndL0AreValidData;
     @(posedge aclk) disable iff (!aresetn)
     (wvalid && wready) |-> ((wstrb === 8'b0000_0101) 
      && (wdata[63:24] === 40'b0) && (wdata[15:8] === 8'b0));
    endproperty
   
   property WhenWvalidAndWreadyAreAssertedAndWstrbValueIsAllOnesThenNextClkWstrbIsInactiveByteThen64BitsOfWdataIsPreviousValues;
     @(posedge aclk) disable iff (!aresetn)
     (wvalid && wready) |-> ((wstrb == 8'b1111_1111) && (!$isunknown(wdata))) 
      ##1 ((wvalid && wready) && (wstrb == 8'b0111_0000) && (wdata[63:56] == $past(wdata[63:56])) 
      && wdata[31:0] == $past(wdata[31:0]));   
   endproperty 
   
   property WhenWvalidAndWreadyAreAssertedThenSameClkWstrbValueIsAllOnesThen64BitsOfWdataIsNotUnknown; 
     @(posedge aclk) disable iff (!aresetn)
       (wvalid && wready) |-> ((wstrb == 8'b1111_1111) && (!$isunknown(wdata)));
   endproperty 

  if(Axi4LiteWriteMasterGlobalPkg::ADDRESS_WIDTH == 32 &&  Axi4LiteWriteMasterGlobalPkg::DATA_WIDTH == 32) begin

   IFWVALIDANDWREADYAREASSERTED_THEN_WSTRBOFHIGHERLANESAREASSERTED_THEN_L3ANDL2OFWDATAISVALIDDATA: cover property
   (WhenWvalidAndWreadyAreAssertedAndWstrbOfHigherLanesOfWdataIsValidData)
   $info("IFWVALIDANDWREADYAREASSERTED_THEN_WSTRBOFHIGHERLANESAREASSERTED_THEN_L3ANDL2OFWDATAISVALIDDATA : COVERED");

   IFWVALIDANDWREADYAREASSERTED_THEN_WSTRBOFLOWERLANESAREASSERTED_THEN_L1ANDL0OFWDATAISVALIDDATA: cover property
   (WhenWvalidAndWreadyAreAssertedAndWstrbOfLowerLanesOfWdataIsValidData)
   $info("IFWVALIDANDWREADYAREASSERTED_THEN_WSTRBOFLOWERLANESAREASSERTED_THEN_L1ANDL0OFWDATAISVALIDDATA : COVERED");
   
   IFWVALIDANDWREADYAREASSERTED_THEN_SAMECLK_WSTRBVALUEISF_THENWDATAISNOTUNKNOWNVALUE: cover property 
   (WhenWvalidAndWreadyAreAssertedThenSameClkWstrbValueIsAllOnesThenWdataIsNotUnknown)
   $info("IFWVALIDANDWREADYAREASSERTED_THEN_SAMECLK_WSTRBVALUEISF_THENWDATAISNOTUNKNOWNVALUE :COVERED");
  
   IFWVALIDISASSERTED_THEN_SAMECLK_WSTRBISALLONES_THEN_NEXTCLK_WVALIDISDISASSERTED_THEN_WSTRBVALUEISPREVIOUSVALUES: cover property
   (WhenWvalidIsAssertedAndWstrbOfAllBitAreHighThenNextClkWvalidGoesToLowThenWstrbValueIsContinuesWithPreviousWstrbValues)
   $info("IFWVALIDISASSERTED_THEN_SAMECLK_WSTRBISALLONES_THEN_NEXTCLK_WVALIDISDISASSERTED_THEN_WSTRBVALUEISPREVIOUSVALUES :COVERED");
   
   //TODO below property
   //IFWVALIDANDWREADYAREASSERTED_THEN_SAMECLK_WSTRBVALUEISF_THEN_NEXTCLK_WSTRBISINACTIVEBYTE_THEN_WDATAISPREVIOUSVALUES: cover property
   //(WhenWvalidAndWreadyAreAssertedAndWstrbValueIsAllOnesThenNextClkWstrbIsInactiveByteThenWdataIsPreviousValues)
  //$info("IFWVALIDANDWREADYAREASSERTED_THEN_SAMECLK_WSTRBVALUEISF_THEN_NEXTCLK_WSTRBISINACTIVEBYTE_THEN_WDATAISPREVIOUSVALUES : COVERED");
   //
   //IFWVALIDISASSERTED_THEN_SAMECLK_WSTRBISALLONES_THEN_NEXTCLK_WVALIDISDISASSERTED_THEN_WSTRBVALUEISZEROS: cover property
   //(WhenWvalidIsAssertedAndWstrbOfAllBitAreHighThenNextClkWvalidGoesToLowThenWstrbValuesWillZeros)
   //$info("IFWVALIDISASSERTED_THEN_SAMECLK_WSTRBISALLONES_THEN_NEXTCLK_WVALIDISDISASSERTED_THEN_WSTRBVALUEISZEROS :COVERED");
 end

  if(Axi4LiteWriteMasterGlobalPkg::ADDRESS_WIDTH == 64 &&  Axi4LiteWriteMasterGlobalPkg::DATA_WIDTH == 64) begin
    
    IFWVALIDANDWREADYAREASSERTED_THEN_WDATA_IS_64BITS_THEN_WSTRBLANESOF_L2ANDL0ARE_VALIDWDATA :cover property
    (WhenWvalidAndWreadyAreAssertedAndWdataIs64BitsAndWstrbLanesOfL2AndL0AreValidData)
    $info("IFWVALIDANDWREADYAREASSERTED_THEN_WDATA_IS_64BITS_THEN_WSTRBLANESOF_L2ANDL0ARE_VALIDWDATA : COVERED");

    IFWVALIDANDWREADYAREASSERTED_THEN_SAMECLK_WSTRBVALUEIS_FF_THEN_64BITSOF_WDATAISNOTUNKNOWNVALUE: cover property 
    (WhenWvalidAndWreadyAreAssertedThenSameClkWstrbValueIsAllOnesThen64BitsOfWdataIsNotUnknown)
    $info("IFWVALIDANDWREADYAREASSERTED_THEN_SAMECLK_WSTRBVALUEIS_FF_THEN_64BITSOF_WDATAISNOTUNKNOWNVALUE :COVERED");

    //TODO below property
   // IFWVALIDANDWREADYAREASSERTED_THEN_SAMECLK_WSTRBVALUEISF_THEN_NEXTCLK_WSTRBISINACTIVEBYTE_THEN_64BITSOFWDATAISPREVIOUSVALUES: cover property
   //(WhenWvalidAndWreadyAreAssertedAndWstrbValueIsAllOnesThenNextClkWstrbIsInactiveByteThen64BitsOfWdataIsPreviousValues)
   // $info("IFWVALIDANDWREADYAREASSERTED_THEN_SAMECLK_WSTRBVALUEISF_THEN_NEXTCLK_WSTRBISINACTIVEBYTE_THEN_64BITSOFWDATAISPREVIOUSVALUES: COVERED");

  end

 endinterface : Axi4LiteMasterWriteCoverProperty

`endif

