`ifndef AXI4LITEMASTERWRITECOVERPROPERTY_INCLUDED_
`define AXI4LITEMASTERWRITECOVERPROPERTY_INCLUDED_
  import uvm_pkg::*;
  import Axi4LiteWriteMasterGlobalPkg::*;
  import Axi4LiteMasterWriteAssertCoverParameter::*;
  `include "uvm_macros.svh";


interface Axi4LiteMasterWriteCoverProperty (input  aclk,
                                         input  aresetn,
                                         //Write Address Channel Signals
                                         input  awvalid,
                                         input [ADDRESS_WIDTH-1:0] awaddr,
                                         input  awready,
                                         //Write Data Channel Signals
                                         input  wvalid,
                                         input [DATA_WIDTH-1:0] wdata,
                                         input [(DATA_WIDTH/8)-1:0] wstrb,
                                         input  wready,
                                         //Write Response Channel
                                         input  bvalid,
                                         input  bready,
                                         input  bresp
                                        );  

  initial begin
    
    `uvm_info("Axi4LiteMasterWriteCoverProperty","Axi4LiteMasterWriteCoverProperty",UVM_LOW);
  end
  
  property WhenValidGoesHighThenInformationNotUnknownAndPreviousClkInformationUnknown(logic valid, logic information); 
   @(posedge aclk) 
    $rose(valid) |-> !($isunknown(information)) && ($past(information,1) === 1'bx); 
  endproperty 

  IFAWVALIDGOESHIGH_THEN_AWADDR_IS_NOTUNKNOWN_AND_PREVIOUS_CLK_AWADDR_IS_UNKNOWN : cover property
  (WhenValidGoesHighThenInformationNotUnknownAndPreviousClkInformationUnknown(awvalid,awaddr))
  $info("IFAWVALIDGOESHIGH_THEN_AWADDR_IS_NOTUNKNOWN_AND_PREVIOUS_CLK_AWADDR_IS_UNKNOWN : COVERED");

  IFWVALIDGOESHIGH_THEN_WDATA_IS_NOTUNKNOWN_AND_PREVIOUS_CLK_WDATA_IS_UNKNOWN : cover property  
  (WhenValidGoesHighThenInformationNotUnknownAndPreviousClkInformationUnknown(wvalid, wdata))
  $info("IFWVALIDGOESHIGH_THEN_WDATA_IS_NOTUNKNOWN_AND_PREVIOUS_CLK_WDATA_IS_UNKNOWN : COVERED");

  property WhenValidAssertedThenInformationNotUnknownAndPrevious2ClkInformationUnknwon(logic valid, logic information);
	 @(posedge aclk) 
     valid |-> !($isunknown(information)) && ($past(information,2) === 1'bx); 
 endproperty 

  IFAWVALIDASSERTED_THEN_AWADDR_IS_NOTUNKNOWN_AND_PREVIOUS_2CLK_AWADDR_IS_UNKNOWN: cover property  
  (WhenValidAssertedThenInformationNotUnknownAndPrevious2ClkInformationUnknwon(awvalid, awaddr))
  $info("IFAWVALIDGOESHIGH_THEN_AWADDR_IS_NOTUNKNOWN_AND_PREVIOUS_2CLK_AWADDR_IS_UNKNOWN : COVERED");

  IFWVALIDASSERTED_THEN_WDATA_IS_NOTUNKNOWN_AND_PREVIOUS_2CLK_WDATA_IS_UNKNOWN: cover property  
  (WhenValidAssertedThenInformationNotUnknownAndPrevious2ClkInformationUnknwon(wvalid, wdata))
  $info("IFWVALIDGOESHIGH_THEN_WDATA_IS_NOTUNKNOWN_AND_PREVIOUS_2CLK_WDATA_IS_UNKNOWN : COVERED");

  property WhenReadyLowAndValidAssertedAfter3Clk(logic valid, logic ready);
   @(posedge aclk)
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
   @(posedge aclk)
   !ready |-> ##[1:MAX_DELAY_VALID] (valid && !ready);
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

  property WhenValidAssertedThenSameClkReadyAsserted(logic valid, logic ready);
   @(posedge aclk)
   $rose(valid) |-> ready;
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

  property WhenValidAssertedThenValidHighAndNextClkReadyAsserted(logic valid, logic ready); 
   @(posedge aclk) 
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
   @(posedge aclk) 
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


  property WhenBackToBackValidAndReadyAssertedWithoutDelayInbetween2Transfer(logic valid, logic ready);
   @(posedge aclk)
    (valid && ready) |=> ($stable(valid) && $stable(ready));
  endproperty

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
   @(posedge aclk)
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
   @(posedge aclk) 
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
   @(posedge aclk)
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
   @(posedge aclk)
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

  property readyAssertAtleastOnce(logic ready); 
  @(posedge aclk) ready; 
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


  property WhenValidAssertedThenReadyAssertedNextClk(logic valid, logic ready);
  @(posedge aclk) valid |-> !ready ##1 (valid && ready);
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
  @(posedge aclk) valid |-> ##[2:5] ready; 
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
   @(posedge aclk) valid |-> ##[0:MAX_DELAY_READY] ready;
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

    property WhenReadyAssertedAndDeassertedThenNextClkValidAsserted(logic valid, logic ready);
     @(posedge aclk) $fell(ready) |-> !valid ##1 valid;
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
    @(posedge aclk) (ready && !valid) |-> !valid s_until_with $fell(ready)[->3] ##1 $rose(valid);
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

    property WhenReadyAssertedThenNextClkValidAsserted(logic valid, logic ready);
     @(posedge aclk) ready |-> !valid ##1 valid;
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
     @(posedge aclk) ready |-> !valid ##[2:5] valid;
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

    property WhenReadyAssertedThenAnyClkValidAsserted(logic valid, logic ready);
     @(posedge aclk) ready |-> !valid ##[0:$] valid;
    endproperty

    IFAWREADYASSERTED_THEN_ANYCLK_AWVALIDASSERTED: cover property
    (WhenReadyAssertedThenAnyClkValidAsserted(awvalid,awready))
    $info("IFAWREADYASSERTED_THEN_ANYCLK_AWVALIDASSERTED : COVERED");

    IFWREADYASSERTED_THEN_ANYCLK_WVALIDASSERTED: cover property
    (WhenReadyAssertedThenAnyClkValidAsserted(wvalid,wready))
    $info("IFWREADYASSERTED_THEN_ANYCLK_WVALIDASSERTED : COVERED");

    IFBREADYASSERTED_THEN_ANYCLK_BVALIDASSERTED: cover property
    (WhenReadyAssertedThenAnyClkValidAsserted(bvalid,bready))
    $info("IFBREADYASSERTED_THEN_ANYCLK_BVALIDASSERTED : COVERED");

    property WhenREADYDefaultValueIs1AndTransferOccurThenSameClkREADYValueWillGoDefaultState(logic valid, logic ready); 
     @(posedge aclk) disable iff (aresetn)
         (ready && valid) |=> ready;
    endproperty  

    IFAWREADYDEFAULTVALUEISHIGH_ANDTRANSFEROCCUR_THEN_AWREADY_WILLGODEFAULTSTATE: cover property  
    (WhenREADYDefaultValueIs1AndTransferOccurThenSameClkREADYValueWillGoDefaultState(awvalid, awready))
    $info("IFAWREADYDEFAULTVALUEISHIGH_ANDTRANSFEROCCUR_THEN_AWREADY_WILLGODEFAULTSTATE : COVERED");

    IFWREADYDEFAULTVALUEISHIGH_ANDTRANSFEROCCUR_THEN_WREADY_WILLGODEFAULTSTATE: cover property  
    (WhenREADYDefaultValueIs1AndTransferOccurThenSameClkREADYValueWillGoDefaultState(wvalid, wready))
    $info("IFWREADYDEFAULTVALUEISHIGH_ANDTRANSFEROCCUR_THEN_WREADY_WILLGODEFAULTSTATE : COVERED");

    IFBREADYDEFAULTVALUEISHIGH_ANDTRANSFEROCCUR_THEN_BREADY_WILLGODEFAULTSTATE: cover property  
    (WhenREADYDefaultValueIs1AndTransferOccurThenSameClkREADYValueWillGoDefaultState(bvalid, bready))
    $info("IFBREADYDEFAULTVALUEISHIGH_ANDTRANSFEROCCUR_THEN_BREADY_WILLGODEFAULTSTATE : COVERED");

     property WhenREADYDefaultValueIs0AndTransferOccurThenSameClkREADYValueWillGoDefaultState(logic valid, logic ready); 
     @(posedge aclk) disable iff (aresetn)
         (ready && valid) |=> (!ready);
    endproperty  

    IFAWREADYDEFAULTVALUEISLOW_ANDTRANSFEROCCUR_THEN_AWREADY_WILLGODEFAULTSTATE: cover property  
    (WhenREADYDefaultValueIs0AndTransferOccurThenSameClkREADYValueWillGoDefaultState(awvalid, awready))
    $info("IFAWREADYDEFAULTVALUEISLOW_ANDTRANSFEROCCUR_THEN_AWREADY_WILLGODEFAULTSTATE : COVERED");

    IFWREADYDEFAULTVALUEISLOW_ANDTRANSFEROCCUR_THEN_WREADY_WILLGODEFAULTSTATE: cover property  
    (WhenREADYDefaultValueIs0AndTransferOccurThenSameClkREADYValueWillGoDefaultState(wvalid, wready))
    $info("IFWREADYDEFAULTVALUEISLOW_ANDTRANSFEROCCUR_THEN_WREADY_WILLGODEFAULTSTATE : COVERED");

    IFBREADYDEFAULTVALUEISLOW_ANDTRANSFEROCCUR_THEN_BREADY_WILLGODEFAULTSTATE: cover property  
    (WhenREADYDefaultValueIs0AndTransferOccurThenSameClkREADYValueWillGoDefaultState(bvalid, bready))
    $info("IFBREADYDEFAULTVALUEISLOW_ANDTRANSFEROCCUR_THEN_BREADY_WILLGODEFAULTSTATE : COVERED");

    property WhenAwreadyHighAndWritingValidAddressAndDataOnSlaveLocationThenSlaveWillGiveOkayResponse; 
     @(posedge aclk) disable iff (aresetn)
         (awvalid && awready && !($isunknown(awaddr))) |->  ##[0:$] (wvalid && wready && !($isunknown(wdata)))  ##[0:$] (bvalid &&       bready  && (bresp != 2'b10));
    endproperty  

    IFAWREADYHIGH_THEN_WRITINGTHEVALID_AWADDRANDWDATA_ONSLAVELOCATION_THEN_SLAVEWILLGIVEOKAYRESPONSE: cover property 
    (WhenAwreadyHighAndWritingValidAddressAndDataOnSlaveLocationThenSlaveWillGiveOkayResponse) 
    $info("IFAWREADYHIGH_THEN_WRITINGTHEVALID_AWADDRANDWDATA_ONSLAVELOCATION_THEN_SLAVEWILLGIVEOKAYRESPONSE : COVERED");

   property WhenAwvalidAwreadyWvalidAndWreadyAreAssertedSameClkThenNextClkBvalidAsserted; 
   @(posedge aclk) disable iff (aresetn)
   (awvalid && awready && wvalid && wready && !bvalid) |=> bvalid; 
   endproperty  

   AWVALIDANDAWREADY_WVALIDANDWREADY_ASSERTEDATSAMECLK_THEN_BVALIDASSERTEDNEXTCLK: cover property  
   (WhenAwvalidAwreadyWvalidAndWreadyAreAssertedSameClkThenNextClkBvalidAsserted); 
   $info("AWVALIDANDAWREADY_WVALIDANDWREADY_ASSERTEDATSAMECLK_THEN_BVALIDASSERTEDNEXTCLK :COVERED");

   property WhenAwvalidAwreadyAssertedThenNextClkWvalidWreadyAssertedThenNextClkBValidAsserted;
   @(posedge aclk) disable iff (aresetn)
   (awvalid && awready && !bvalid) |=> (wvalid && wready && !bvalid) ##1 bvalid;
   endproperty

   AWVALIDANDAWREADY_THEN_NEXTCLK_WVALIDANDWREADYASSERTED_THEN_NEXTCLK_BVALIDASSERTED: cover property
   (WhenAwvalidAwreadyAssertedThenNextClkWvalidWreadyAssertedThenNextClkBValidAsserted)
   $info("AWVALIDANDAWREADY_THEN_NEXTCLK_WVALIDANDWREADYASSERTED_THEN_NEXTCLK_BVALIDASSERTED :COVERED");

   property WhenAwvalidAwreadyAssertedThenNextClkWvalidWreadyAssertedThenInbetween1To16ClkBValidAsserted;
   @(posedge aclk) disable iff (aresetn)
   (awvalid && awready && !bvalid) |=> (wvalid && wready && !bvalid) ##[1:MAX_DELAY_BVALID] bvalid;
   endproperty

   AWVALIDANDAWREADY_THEN_NEXTCLK_WVALIDANDWREADYASSERTED_THEN_INBETWEEN1TO16CLK_BVALIDASSERTED: cover property
   (WhenAwvalidAwreadyAssertedThenNextClkWvalidWreadyAssertedThenInbetween1To16ClkBValidAsserted)
   $info("AWVALIDANDAWREADY_THEN_NEXTCLK_WVALIDANDWREADYASSERTED_THEN_INBETWEEN1TO16CLK_BVALIDASSERTED :COVERED");

   property WhenAwvalidAwreadyAssertedThenAnyClkWvalidWreadyAssertedThenAnyClkBValidAsserted;
   @(posedge aclk) disable iff (aresetn)
   (awvalid && awready && !bvalid) |-> ##[0:$] (wvalid && wready && !bvalid) ##[1:$] bvalid;
   endproperty

   IFAWVALIDANDAWREADY_THEN_ANYCLK_WVALIDANDWREADYASSERTED_THEN_ANYCLK_BVALIDASSERTED: cover property
   (WhenAwvalidAwreadyAssertedThenAnyClkWvalidWreadyAssertedThenAnyClkBValidAsserted)
   $info("IFAWVALIDANDAWREADY_THEN_ANYCLK_WVALIDANDWREADYASSERTED_THEN_ANYCLK_BVALIDASSERTED :COVERED");

   property WhenAwaddressIsGeneratedOnTheSameClkWdataWillBeGenerated;
    @(posedge aclk) disable iff (aresetn)
   (awvalid && awready && awaddr) |-> (wvalid && wready && wdata)
   endproperty

   IFAWADDRESISASSERTED_THEN_SAMECLK_WDATAWILLBEASSERTED: cover property
   (WhenAwaddressIsGeneratedOnTheSameClkWdataWillBeGenerated)
   $info("IFAWADDRESISASSERTED_THEN_SAMECLK_WDATAWILLBEASSERTED : COVERED");

   property WhenAwaddressIsGeneratedThenNextClkWdataWillBeGenerated;
    @(posedge aclk) disable iff (aresetn)
   (awvalid && awready && awaddr) |=> (wvalid && wready && wdata)
   endproperty

   IFAWADDRESISASSERTED_THEN_NEXTCLK_WDATAWILLBEASSERTED: cover property
   (WhenAwaddressIsGeneratedThenNextClkWdataWillBeGenerated)
   $info("IFAWADDRESISASSERTED_THEN_NEXTCLK_WDATAWILLBEASSERTED : COVERED");

   property WhenAwaddressIsGeneratedThenInbetween1To10ClkWdataWillBeGenerated; 
    @(posedge aclk) disable iff (aresetn)
   (awvalid && awready && awaddr) |-> ##[1:MAX_DELAY_WVALID] (wvalid && wready && wdata)
   endproperty  
   
   IFAWADDRESISASSERTED_THEN_INBETWEEN1TO10CLKWDATAWILLBEASSERTED: cover property
   (WhenAwaddressIsGeneratedThenInbetween1To10ClkWdataWillBeGenerated)
   $info("IFAWADDRESISASSERTED_THEN_INBETWEEN1TO10CLKWDATAWILLBEASSERTED : COVERED");

   property WhenAwaddressIsGeneratedThenAnyClkWdataWillBeGenerated;
    @(posedge aclk) disable iff (aresetn)
   (awvalid && awready && awaddr) |-> ##[0:$] (wvalid && wready && wdata)
   endproperty

   IFAWADDRESISASSERTED_THEN_ANYCLK_WDATAWILLBEASSERTED: cover property
   (WhenAwaddressIsGeneratedThenAnyClkWdataWillBeGenerated)
   $info("IFAWADDRESISASSERTED_THEN_ANYCLK_WDATAWILLBEASSERTED : COVERED");

    property WhenWdataIsGeneratedThenNextClkAwaddressillBeGenerated; 
    @(posedge aclk) disable iff (aresetn)
    (wvalid && wready && wdata) |=> (awvalid && awready && awaddr)
    endproperty  

   IFWDATAISASSERTED_THEN_NEXTCLK_AWADDRWILLBEASSERTED: cover property  
   (WhenWdataIsGeneratedThenNextClkAwaddressillBeGenerated)
   $info("IFWDATAISASSERTED_THEN_NEXTCLK_AWADDRWILLBEASSERTED :COVERED");

   property WhenWdataIsGeneratedThenInbetween1To10ClkAwaddressillBeGenerated;
   @(posedge aclk) disable iff (aresetn)
   (wvalid && wready && wdata) |-> ##[1:MAX_DELAY_AWADDR] (awvalid && awready && awaddr)
   endproperty

   IFWDATAISASSERTED_THEN_INBETWEEN1TO10CLK_AWADDRWILLBEASSERTED: cover property
   (WhenWdataIsGeneratedThenInbetween1To10ClkAwaddressillBeGenerated)
   $info("IFWDATAISASSERTED_THEN_INBETWEEN1TO10CLK_AWADDRWILLBEASSERTED :COVERED");

   property WhenWdataIsGeneratedThenAnyClkAwddressWillBeGenerated;
   @(posedge aclk) disable iff (aresetn)
   (wvalid && wready && wdata) |-> ##[0:$] (awvalid && awready && awaddr)
   endproperty

   IFWDATAISASSERTED_THEN_ANYCLK_AWADDRSWILLBEASSERTED: cover property
   (WhenWdataIsGeneratedThenAnyClkAwddressWillBeGenerated)
   $info("IFWDATAISASSERTED_THEN_ANYCLK_AWADDRSWILLBEASSERTED :COVERED");

   property WhenAwvalidIsAssertedThenNextClkAwreadyAndWreadyWillBeAssert;
     @(posedge aclk)  disable iff (aresetn)
    awvalid |=> (awready && wready);
    //(awvalid && !awready && !wready) |=> (awready && wready);
   endproperty

  IFAWVALIDISASSERTED_THEN_NEXTCLK_AWREADYANDWREADYWILLBEASSERT: cover property
  (WhenAwvalidIsAssertedThenNextClkAwreadyAndWreadyWillBeAssert)
  $info("IFAWVALIDISASSERTED_THEN_NEXTCLK_AWREADYANDWREADYWILLBEASSERT : COVERED");

  property WhenAwvalidIsAssertedThenAnyClkAwreadyAndWreadyWillBeAssert; 
    @(posedge aclk) disable iff (aresetn)
    (awvalid && !awready && !wready) |-> ##[1:$] (awready && wready);
  endproperty  

  IFAWVALIDISASSERTED_THEN_ANYCLK_AWREADYANDWREADYWILLBEASSERT: cover property  
  (WhenAwvalidIsAssertedThenAnyClkAwreadyAndWreadyWillBeAssert)
  $info("IFAWVALIDISASSERTED_THEN_ANYCLK_AWREADYANDWREADYWILLBEASSERT :  COVERED");

   property WhenAwvalidIsAssertedThenSameClkAwreadyAndWreadyWillBeAssert;
   @(posedge aclk)  disable iff (aresetn)
   awvalid |-> (awready && wready);
   endproperty

  IFAWVALIDISASSERTED_THEN_SAMECLK_AWREADYANDWREADYWILLBEASSERT: cover property
  (WhenAwvalidIsAssertedThenSameClkAwreadyAndWreadyWillBeAssert)
  $info("IFAWVALIDISASSERTED_THEN_SAMECLK_AWREADYANDWREADYWILLBEASSERT : COVERED");

  property WhenAwreadyIsAssertedThenNextClkWvalidIsAsserted;
    @(posedge aclk) disable iff (aresetn)
    (awready && !wvalid) |=> wvalid;
  endproperty

  IFAWREADYISASSERTED_THEN_NEXTCLK_WVALIDISASSERTED: cover property
  (WhenAwreadyIsAssertedThenNextClkWvalidIsAsserted)
  $info("IFAWREADYISASSERTED_THEN_NEXTCLK_WVALIDISASSERTED :  COVERED");

  property WhenAwreadyIsAssertedThenAnyClkWvalidIsAsserted;
    @(posedge aclk) disable iff (aresetn)
    awready |-> ##[0:$] wvalid;
  endproperty

  IFAWREADYISASSERTED_THEN_ANYCLK_WVALIDISASSERTED: cover property
  (WhenAwreadyIsAssertedThenAnyClkWvalidIsAsserted)
  $info("IFAWREADYISASSERTED_THEN_ANYCLK_WVALIDISASSERTED :  COVERED");

  property WhenAwreadyIsAssertedThenSameClkWvalidIsAsserted;
    @(posedge aclk) disable iff (aresetn)
    awready |-> wvalid;
  endproperty

  IFAWREADYISASSERTED_THEN_SAMECLK_WVALIDISASSERTED: cover property
  (WhenAwreadyIsAssertedThenSameClkWvalidIsAsserted)
  $info("IFAWREADYISASSERTED_THEN_SAMECLK_WVALIDISASSERTED :  COVERED");

  property WhenAwreadyIsAssertedThenNextClkAwvalidAndWvalidAreAsserted;
    @(posedge aclk) disable iff (aresetn)
    (awready) |-> ##1 (awvalid && wvalid);
//(awready && !awvalid && !wvalid) |-> ##1 (awvalid && wvalid);
  endproperty

  IFAWREADYISASSERTED_THEN_NEXTCLK_AWVALIDANDWVALIDAREASSERTED: cover property
  (WhenAwreadyIsAssertedThenNextClkAwvalidAndWvalidAreAsserted)
  $info("IFAWREADYISASSERTED_THEN_NEXTCLK_AWVALIDANDWVALIDAREASSERTED :  COVERED");


   property WhenAwreadyIsAssertedThenAnyClkAwvalidAndWvalidAreAsserted;
   @(posedge aclk) disable iff (aresetn)
   awready |-> ##[1:$] (awvalid && wvalid);
   endproperty
 
   IFAWREADYISASSERTED_THEN_ANYCLK_AWVALIDANDWVALIDAREASSERTED: cover property
   (WhenAwreadyIsAssertedThenAnyClkAwvalidAndWvalidAreAsserted)
   $info("IFAWREADYISASSERTED_THEN_ANYCLK_AWVALIDANDWVALIDAREASSERTED :  COVERED");

   property WhenAwreadyIsAssertedThenSameClkAwvalidAndWvalidAreAsserted;
   @(posedge aclk) disable iff (aresetn)
   awready |-> (awvalid && wvalid);
   endproperty
 
   IFAWREADYISASSERTED_THEN_SAMECLK_AWVALIDANDWVALIDAREASSERTED: cover property
   (WhenAwreadyIsAssertedThenSameClkAwvalidAndWvalidAreAsserted)
  $info("IFAWREADYISASSERTED_THEN_SAMECLK_AWVALIDANDWVALIDAREASSERTED :  COVERED");

  property WhenWvalidIsAssertedThenNextClkAwreadyAsserted;
    @(posedge aclk) disable iff (aresetn)
    wvalid |=> awready;
  endproperty

  IFWVALIDISASSERTED_THEN_NEXTCLK_AWREADYISASSERTED: cover property
  (WhenWvalidIsAssertedThenNextClkAwreadyAsserted)
  $info("IFWVALIDISASSERTED_THEN_NEXTCLK_AWREADYISASSERTED:  COVERED");


  property WhenWvalidIsAssertedThenAnyClkAwreadyAsserted;
    @(posedge aclk) disable iff (aresetn)
    wvalid |=> ##[0:$] awready;
  endproperty

  IFWVALIDISASSERTED_THEN_ANYCLK_AWREADYISASSERTED: cover property
  (WhenWvalidIsAssertedThenAnyClkAwreadyAsserted)
  $info("IFWVALIDISASSERTED_THEN_ANYCLK_AWREADYISASSERTED:  COVERED");

   property WhenAwvalidIsAssertedThenNextClkAwreadyAssertedThenNextClkWvalidIsAsserted();
   @(posedge aclk) disable iff (aresetn)
    awvalid |=> awready ##1 wvalid;
   endproperty

   IFAWVALIDISASSERTED_THEN_NEXTCLK_AWREADYISASSERTED_THEN_NEXTCLK_WVALIDIASERTED: cover property
   (WhenAwvalidIsAssertedThenNextClkAwreadyAssertedThenNextClkWvalidIsAsserted)
   $info("IFAWVALIDISASSERTED_THEN_NEXTCLK_AWREADYISASSERTED_THEN_NEXTCLK_WVALIDIASERTED  COVERED");

   property WhenWvalidIsAssertedThenNextClkAwvalidIsAsserted();
    @(posedge aclk) disable iff (aresetn)
    wvalid |=> awvalid;
   endproperty 

   IFWVALIDISASSERTED_THEN_NEXTCLK_AWVALIDISASSERTED: cover property
   (WhenWvalidIsAssertedThenNextClkAwvalidIsAsserted)
   $info("IFWVALIDISASSERTED_THEN_NEXTCLK_AWVALIDISASSERTED:  COVERED");

   property WhenWvalidIsAssertedThenAnyClkAwvalidIsAsserted();
   @(posedge aclk) disable iff (aresetn)
   wvalid |=> ## [0:$] awvalid;
   endproperty

   IFWVALIDISASSERTED_THEN_ANYCLK_AWVALIDISASSERTED: cover property
   (WhenWvalidIsAssertedThenAnyClkAwvalidIsAsserted)
   $info("IFWVALIDISASSERTED_THEN_ANYCLK_AWVALIDISASSERTED:  COVERED");


   property WhenWvalidIsAssertedThenSameClkAwvalidIsAsserted();
    @(posedge aclk) disable iff (aresetn)
    wvalid |-> awvalid;
   endproperty 

   IFWVALIDISASSERTED_THEN_SAMECLK_AWVALIDISASSERTED: cover property
   (WhenWvalidIsAssertedThenSameClkAwvalidIsAsserted)
   $info("IFWVALIDISASSERTED_THEN_SAMECLK_AWVALIDISASSERTED:  COVERED");

   property WhenAwvalidIsAssertedThenNextClkWvalidIsAsserted();
    @(posedge aclk) disable iff (aresetn)
    awvalid |=> wvalid;
   endproperty

   IFAWVALIDISASSERTED_THEN_NEXTCLK_WVALIDISASSERTED: cover property
   (WhenAwvalidIsAssertedThenNextClkWvalidIsAsserted)
   $info("IFAWVALIDISASSERTED_THEN_NEXTCLK_WVALIDISASSERTED:  COVERED");

   property WhenAwvalidIsAssertedThenAnyClkWvalidIsAsserted();
    @(posedge aclk) disable iff (aresetn)
    awvalid |=> ##[0:$] wvalid;
   endproperty

   IFAWVALIDISASSERTED_THEN_ANYCLK_WVALIDISASSERTED: cover property
   (WhenAwvalidIsAssertedThenAnyClkWvalidIsAsserted)
   $info("IFAWVALIDISASSERTED_THEN_ANYCLK_WVALIDISASSERTED:  COVERED");

   property WhenWvalidIsAssertedThenNextClkAwreadyAndWreadyWillBeAssert;
     @(posedge aclk)  disable iff (aresetn)
    wvalid |=> (awready && wready);
   endproperty

  IFWVALIDISASSERTED_THEN_NEXTCLK_AWREADYANDWREADYWILLBEASSERT: cover property
  (WhenWvalidIsAssertedThenNextClkAwreadyAndWreadyWillBeAssert)
  $info("IFWVALIDISASSERTED_THEN_NEXTCLK_AWREADYANDWREADYWILLBEASSERT : COVERED");

  property WhenWvalidIsAssertedThenAnyClkAwreadyAndWreadyWillBeAssert; 
    @(posedge aclk) disable iff (aresetn)
    (wvalid && !awready && !wready) |-> ##[1:$] (awready && wready);
  endproperty  

  IFWVALIDISASSERTED_THEN_ANYCLK_AWREADYANDWREADYWILLBEASSERT: cover property  
  (WhenWvalidIsAssertedThenAnyClkAwreadyAndWreadyWillBeAssert)
  $info("IFWVALIDISASSERTED_THEN_ANYCLK_AWREADYANDWREADYWILLBEASSERT :  COVERED");

   property WhenWvalidIsAssertedThenSameClkAwreadyAndWreadyWillBeAssert;
   @(posedge aclk)  disable iff (aresetn)
   wvalid |-> (awready && wready);
   endproperty

  IFWVALIDISASSERTED_THEN_SAMECLK_AWREADYANDWREADYWILLBEASSERT: cover property
  (WhenWvalidIsAssertedThenSameClkAwreadyAndWreadyWillBeAssert)
  $info("IFWVALIDISASSERTED_THEN_SAMECLK_AWREADYANDWREADYWILLBEASSERT : COVERED");

   property WhenWvalidIsAssertedAndWstrbOfHigherLanesOfWdataIsValidData;
   @(posedge aclk) disable iff (aresetn)
    (wvalid && wready) |-> ((wstrb == 4'b1100) && (wdata[15:0] == 16'b0));
   endproperty

   IFWVALIDISASSERTED_THEN_WSTRBOFHIGHERLANESAREASSERTED_THEN_L3ANDL2OFWDATAISVALIDDATA: cover property
   (WhenWvalidIsAssertedAndWstrbOfHigherLanesOfWdataIsValidData)
   $info("IFWVALIDISASSERTED_THEN_WSTRBOFHIGHERLANESAREASSERTED_THEN_L3ANDL2OFWDATAISVALIDDATA : COVERED");


   property WhenWvalidAssertedAndWstrbOfLowerLanesOfWdataIsValidData;
   @(posedge aclk) disable iff (aresetn)
   (wvalid && wready) |-> ((wstrb == 4'b0011) && (wdata[31:16] == 16'h0000));
   endproperty
  
   IFWVALIDISASSERTED_THEN_WSTRBOFHIGHERLANESAREASSERTED_THEN_L1ANDL0OFWDATAISVALIDDATA: cover property
   (WhenWvalidAssertedAndWstrbOfLowerLanesOfWdataIsValidData)
   $info("IFWVALIDISASSERTED_THEN_WSTRBOFHIGHERLANESAREASSERTED_THEN_L1ANDL0OFWDATAISVALIDDATA : COVERED");

 endinterface : Axi4LiteMasterWriteCoverProperty

`endif

