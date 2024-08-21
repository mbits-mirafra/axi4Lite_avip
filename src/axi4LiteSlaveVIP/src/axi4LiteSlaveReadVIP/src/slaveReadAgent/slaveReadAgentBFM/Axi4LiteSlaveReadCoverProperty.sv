`ifndef AXI4LITESLAVEREADCOVERPROPERTY_INCLUDED_
`define AXI4LITESLAVEREADCOVERPROPERTY_INCLUDED_

 import Axi4LiteReadSlaveGlobalPkg::*;
  
interface Axi4LiteSlaveReadCoverProperty (input aclk,
                                          input aresetn,
                                          //Read Address Channel Signals
                                          input arvalid,
                                          input arready,
                                          input [ADDRESS_WIDTH-1:0] araddr,
                                          input [2:0] arprot,
                                          //Read Data Channel Signals
                                          input rvalid,
                                          input rready,
                                          input [DATA_WIDTH-1:0] rdata,
                                          input [1:0] rresp
                                         );  

  import uvm_pkg::*;
  import Axi4LiteSlaveReadAssertCoverParameter::*; 
  `include "uvm_macros.svh";

  initial begin
    `uvm_info("Axi4LiteSlaveReadCoverProperty","Axi4LiteSlaveReadCoverProperty",UVM_LOW);
  end

  property WhenValidGoesHighThenInformationIsNotUnknownAndPreviousClkInformationIsUnknown(logic valid, logic information); 
   @(posedge aclk) disable iff (!aresetn) 
       $rose(valid) |-> !($isunknown(information)) 
                    &&  ($isunknown($past(information,1)));
 endproperty 

  IFARVALIDGOESHIGH_THEN_ARADDR_IS_NOTUNKNOWN_AND_PREVIOUS_CLK_ARADDR_IS_UNKNOWN : cover property
  (WhenValidGoesHighThenInformationIsNotUnknownAndPreviousClkInformationIsUnknown (arvalid, araddr))
  $info("IFARVALIDGOESHIGH_THEN_ARADDR_IS_NOTUNKNOWN_AND_PREVIOUS_CLK_ARADDR_IS_UNKNOWN : COVERED");

  IFRVALIDGOESHIGH_THEN_RDATA_IS_NOTUNKNOWN_AND_PREVIOUS_CLK_RDATA_IS_UNKNOWN : cover property  
  (WhenValidGoesHighThenInformationIsNotUnknownAndPreviousClkInformationIsUnknown (rvalid, rdata))
  $info("IFRVALIDGOESHIGH_THEN_RDATA_IS_NOTUNKNOWN_AND_PREVIOUS_CLK_RDATA_IS_UNKNOWN : COVERED");

  property WhenValidGoesHighThenInformationIsNotUnknownAndPrevious2ClkInformationIsUnknown(logic valid, logic information); 
   @(posedge aclk) disable iff (!aresetn) 
       $rose(valid) |-> !($isunknown(information)) 
                    &&  ($isunknown($past(information,2)));
 endproperty 

  IFARVALIDGOESHIGH_THEN_ARADDR_IS_NOTUNKNOWN_AND_PREVIOUS_2CLK_ARADDR_IS_UNKNOWN : cover property
  (WhenValidGoesHighThenInformationIsNotUnknownAndPrevious2ClkInformationIsUnknown (arvalid, araddr))
  $info("IFARVALIDGOESHIGH_THEN_ARADDR_IS_NOTUNKNOWN_AND_PREVIOUS_2CLK_ARADDR_IS_UNKNOWN : COVERED");

  IFRVALIDGOESHIGH_THEN_RDATA_IS_NOTUNKNOWN_AND_PREVIOUS_2CLK_RDATA_IS_UNKNOWN : cover property  
  (WhenValidGoesHighThenInformationIsNotUnknownAndPrevious2ClkInformationIsUnknown (rvalid, rdata))
  $info("IFRVALIDGOESHIGH_THEN_RDATA_IS_NOTUNKNOWN_AND_PREVIOUS_2CLK_RDATA_IS_UNKNOWN : COVERED");

   property WhenValidGoesHighThenControlSignalIsNotUnknownAndPreviousClkControlSignalIsUnknown(logic valid, logic controlSignal); 
   @(posedge aclk) disable iff (!aresetn) 
       $rose(valid) |-> !($isunknown(controlSignal))  
        &&  ($isunknown($past(controlSignal,1)));
   endproperty 

  IFARVALIDGOESHIGH_THEN_ARPROT_IS_NOTUNKNOWN_AND_PREVIOUS_CLK_ARPROT_IS_UNKNOWN : cover property
  (WhenValidGoesHighThenControlSignalIsNotUnknownAndPreviousClkControlSignalIsUnknown (arvalid, arprot))
  $info("IFARVALIDGOESHIGH_THEN_ARPROT_IS_NOTUNKNOWN_AND_PREVIOUS_CLK_ARPROT_IS_UNKNOWN :COVERED");
  
  IFRVALIDGOESHIGH_THEN_RRESP_IS_NOTUNKNOWN_AND_PREVIOUS_CLK_RRESP_IS_UNKNOWN : cover property  
  (WhenValidGoesHighThenInformationIsNotUnknownAndPreviousClkInformationIsUnknown (rvalid, rresp))
  $info("IFRVALIDGOESHIGH_THEN_RRESP_IS_NOTUNKNOWN_AND_PREVIOUS_CLK_RRESP_IS_UNKNOWN : COVERED");

  property WhenValidGoesHighThenControlSignalIsNotUnknownAndPrevious2ClkControlSignalIsUnknown(logic valid, logic controlSignal); 
   @(posedge aclk) disable iff (!aresetn) 
       $rose(valid) |-> !($isunknown(controlSignal))  
        &&  ($isunknown($past(controlSignal,2)));
 endproperty 

  IFARVALIDGOESHIGH_THEN_ARPROT_IS_NOTUNKNOWN_AND_PREVIOUS_2CLK_ARPROT_IS_UNKNOWN : cover property
  (WhenValidGoesHighThenControlSignalIsNotUnknownAndPrevious2ClkControlSignalIsUnknown (arvalid, arprot))
  $info("IFARVALIDGOESHIGH_THEN_ARPROT_IS_NOTUNKNOWN_AND_PREVIOUS_2CLK_ARPROT_IS_UNKNOWN :COVERED");
  
  IFRVALIDGOESHIGH_THEN_RRESP_IS_NOTUNKNOWN_AND_PREVIOUS_2CLK_RRESP_IS_UNKNOWN : cover property  
  (WhenValidGoesHighThenInformationIsNotUnknownAndPrevious2ClkInformationIsUnknown (rvalid, rresp))
  $info("IFRVALIDGOESHIGH_THEN_RRESP_IS_NOTUNKNOWN_AND_PREVIOUS_2CLK_RRESP_IS_UNKNOWN : COVERED");

  property WhenReadyLowAndValidAssertedAfter3Clk(logic valid, logic ready);
   @(posedge aclk) disable iff (!aresetn)
    !ready |-> ##3 (valid && !ready);
  endproperty

  IFARREADYLOW_THEN_AFTER3CLK_ARVALIDASSERTED: cover property
  (WhenReadyLowAndValidAssertedAfter3Clk(arvalid, arready))
  $info("IFARREADYISLOW_THEN_ARVALIDIS_ASSERTED_AFTER3CLK : COVERED");
  
  IFRREADYLOW_THEN_AFTER3CLK_RVALIDASSERTED: cover property
  (WhenReadyLowAndValidAssertedAfter3Clk(rvalid, rready))
  $info("IFRREADYISLOW_THEN_RVALIDIS_ASSERTED_AFTER3CLK : COVERED");
 
  property WhenReadyLowAndValidAssertedAfterAnyClkThenReadyWillAssertedAnyClk(logic valid, logic ready);
   @(posedge aclk) disable iff (!aresetn)
   !ready |-> ##[1:MAX_DELAY_VALID] (valid && !ready) ##[1:MAX_DELAY_READY] ready;
  endproperty
  
  IFARREADYLOW_THEN_AFTERANYCLK_ARVALIDASSERTED_THENARREADYWILLASSERTEDANYCLK: cover property
  (WhenReadyLowAndValidAssertedAfterAnyClkThenReadyWillAssertedAnyClk(arvalid, arready))
  $info("IFARREADYLOW_THEN_ANYCLK_ARVALIDIS_ASSERTED_THEN_ARREADYWILL_ASSERTED_ANYCLK :COVERED");

  IFRREADYLOW_THEN_AFTERANYCLK_RVALIDASSERTED_THENRREADYWILLASSERTEDANYCLK: cover property
  (WhenReadyLowAndValidAssertedAfterAnyClkThenReadyWillAssertedAnyClk(rvalid, rready))
  $info("IFRREADYLOW_THEN_ANYCLK_RVALIDIS_ASSERTED_THEN_RREADYWILL_ASSERTED_ANYCLK :COVERED");

  property WhenValidAssertedThenSameClkReadyAsserted(logic valid, logic ready);
   @(posedge aclk) disable iff (!aresetn)
   (valid) |-> ready;
  endproperty

  IFARVALIDASSERTED_THEN_SAMECLK_ARREADYASSERTED: cover property
  (WhenValidAssertedThenSameClkReadyAsserted(arvalid, arready))
  $info("IFARVALIDISASSERTED_THENSAMECLK_ARREADYISASSERTED :COVERED");

  IFRVALIDASSERTED_THEN_SAMECLK_RREADYASSERTED: cover property
  (WhenValidAssertedThenSameClkReadyAsserted(rvalid, rready))
  $info("IFRVALIDISASSERTED_THENSAMECLK_RREADYISASSERTED :COVERED");

  property WhenValidAssertedThenValidHighAndNextClkReadyAsserted(logic valid, logic ready); 
   @(posedge aclk) disable iff (!aresetn) 
    $rose(valid) |=> $stable(valid) && ready; 
  endproperty  

   IFARVALIDASSERTED_ANDREMAINHIGH_THEN_NEXTCLK_ARREADYASSERTED: cover property  
   (WhenValidAssertedThenValidHighAndNextClkReadyAsserted(arvalid, arready)) 
   $info("IFARVALIDASSERTED_ANDREMAINHIGH_THEN_NEXTCLK_ARREADYASSERTED : COVERED");

   IFRVALIDASSERTED_ANDREMAINHIGH_THEN_NEXTCLK_RREADYASSERTED: cover property  
   (WhenValidAssertedThenValidHighAndNextClkReadyAsserted(rvalid, rready))
   $info("IFRVALIDASSERTED_ANDREMAINHIGH_THEN_NEXTCLK_RREADYASSERTED : COVERED");

   property WhenValidAssertedThenValidHighAndWithin1To16ClkReadyAsserted(logic valid, logic ready);
   @(posedge aclk) disable iff (!aresetn) 
    $rose(valid) |=> ($stable(valid) throughout (##[1:MAX_DELAY_READY] $rose(ready))); 
  endproperty  

  IFARVALIDASSERTED_ANDREMAINHIGH_THENWITHIN1TO16CLK_ARREADYASSERTED: cover property 
  (WhenValidAssertedThenValidHighAndWithin1To16ClkReadyAsserted(arvalid, arready)) 
  $info("IFARVALIDASSERTED_ANDREMAINHIGH_THENWITHIN1TO16CLK_ARREADYASSERTED : COVERED");

  IFRVALIDASSERTED_ANDREMAINHIGH_THENWITHIN1TO16CLK_RREADYASSERTED: cover property 
  (WhenValidAssertedThenValidHighAndWithin1To16ClkReadyAsserted(rvalid, rready)) 
  $info("IFRVALIDASSERTED_ANDREMAINHIGH_THENWITHIN1TO16CLK_RREADYASSERTED : COVERED");

  `ifdef DEFAULT_READY == 1 

  property WhenBackToBackValidAndReadyAssertedWithoutDelayInbetween2Transfer(logic valid, logic ready);
   @(posedge aclk) disable iff (!aresetn)
    (valid && ready) |=> ($stable(valid) && $stable(ready));
  endproperty

  IFBACKTOBACK_ARVALIDANDARREADYASSERTED_WITHOUTDELAY_INBETWEEN2TRANSFER: cover property
  (WhenBackToBackValidAndReadyAssertedWithoutDelayInbetween2Transfer(arvalid, arready))
  $info("IFBACKTOBACK_ARVALIDANDARREADYASSERTED_WITHOUTDELAY_INBETWEEN2TRANSFER : COVERED");

  IFBACKTOBACK_RVALIDANDRREADYASSERTED_WITHOUTDELAY_INBETWEEN2TRANSFER: cover property
  (WhenBackToBackValidAndReadyAssertedWithoutDelayInbetween2Transfer(rvalid, rready))
  $info("IFBACKTOBACK_RVALIDANDRREADYASSERTED_WITHOUTDELAY_INBETWEEN2TRANSFER : COVERED");

  property WhenBackToBackValidAndReadyAssertedWith1ClkDelayInbetween2Transfer(logic valid, logic ready);
   @(posedge aclk) disable iff (!aresetn)
    (valid && ready) |=> ##1 (valid && ready);
  endproperty

  IFBACKTOBACK_ARVALIDANDARREADYASSERTED_WITH1CLKDELAY_INBETWEEN2TRANSFER: cover property
  (WhenBackToBackValidAndReadyAssertedWith1ClkDelayInbetween2Transfer(arvalid, arready))
  $info("IFBACKTOBACK_ARVALIDANDARREADYASSERTED_WITH1CLKDELAY_INBETWEEN2TRANSFER : COVERED");

  IFBACKTOBACK_RVALIDANDRREADYASSERTED_WITH1CLKDELAY_INBETWEEN2TRANSFER: cover property
  (WhenBackToBackValidAndReadyAssertedWith1ClkDelayInbetween2Transfer(rvalid, rready))
  $info("IFBACKTOBACK_RVALIDANDRREADYASSERTED_WITH1CLKDELAY_INBETWEEN2TRANSFER : COVERED");

  property WhenBackToBackValidAndReadyAssertedWith2ClkDelayInbetween2Transfer(logic valid, logic ready); 
   @(posedge aclk) disable iff (!aresetn) 
    (valid && ready) |=> ##2 (valid && ready); 
  endproperty  

  IFBACKTOBACK_ARVALIDANDARREADYASSERTED_WITH2CLKDELAY_INBETWEEN2TRANSFER: cover property  
  (WhenBackToBackValidAndReadyAssertedWith2ClkDelayInbetween2Transfer(arvalid, arready))
  $info("IFBACKTOBACK_ARVALIDANDARREADYASSERTED_WITH2CLKDELAY_INBETWEEN2TRANSFER  :COVERED");

  IFBACKTOBACK_RVALIDANDRREADYASSERTED_WITH2CLKDELAY_INBETWEEN2TRANSFER: cover property  
  (WhenBackToBackValidAndReadyAssertedWith2ClkDelayInbetween2Transfer(rvalid, rready))
  $info("IFBACKTOBACK_RVALIDANDRREADYASSERTED_WITH2CLKDELAY_INBETWEEN2TRANSFER  :COVERED");
 
  property WhenBackToBackValidAndReadyAssertedWithin3To16ClkDelayInbetween2Transfer(logic valid, logic ready);
   @(posedge aclk) disable iff (!aresetn)
    (valid && ready) |=> ##[3:DELAY_FOR_SECOND_TRANSFER] (valid && ready);
  endproperty

  IFBACKTOBACK_ARVALIDANDARREADYASSERTED_WITHIN3TO16CLKDELAY_INBETWEEN2TRANSFER: cover property
  (WhenBackToBackValidAndReadyAssertedWithin3To16ClkDelayInbetween2Transfer(arvalid, arready))
  $info("IFBACKTOBACK_ARVALIDANDARREADYASSERTED_WITHIN3TO16CLKDELAY_INBETWEEN2TRANSFER : COVERED");

  IFBACKTOBACK_RVALIDANDRREADYASSERTED_WITHIN3TO16CLKDELAY_INBETWEEN2TRANSFER: cover property
  (WhenBackToBackValidAndReadyAssertedWithin3To16ClkDelayInbetween2Transfer(rvalid, rready))
  $info("IFBACKTOBACK_RVALIDANDRREADYASSERTED_WITHIN3TO16CLKDELAY_INBETWEEN2TRANSFER : COVERED");

  property WhenBackToBackValidAndReadyAssertedWithMoreThan16ClkDelayInbetween2Transfer(logic valid, logic ready);
   @(posedge aclk) disable iff (!aresetn)
   (valid && ready) |=> ##[DELAY_FOR_SECOND_TRANSFER:$] (valid && ready);
  endproperty

  IFBACKTOBACK_ARVALIDANDARREADYASSERTED_WITHMORETHAN16CLKDELAY_INBETWEEN2TRANSFER: cover property
  (WhenBackToBackValidAndReadyAssertedWithMoreThan16ClkDelayInbetween2Transfer(arvalid, arready))
  $info("IFBACKTOBACK_ARVALIDANDARREADYASSERTED_WITHMORETHAN16CLKDELAY_INBETWEEN2TRANSFER : COVERED");

  IFBACKTOBACK_RVALIDANDRREADYASSERTED_WITHMORETHAN16CLKDELAY_INBETWEEN2TRANSFER: cover property
  (WhenBackToBackValidAndReadyAssertedWithMoreThan16ClkDelayInbetween2Transfer(rvalid, rready))
  $info("IFBACKTOBACK_RVALIDANDRREADYASSERTED_WITHMORETHAN16CLKDELAY_INBETWEEN2TRANSFER : COVERED");

  `endif

  property readyAssertAtleastOnce(logic ready); 
  @(posedge aclk) disable iff (!aresetn) ready; 
  endproperty 

  IFARREADY_NEEDTOASSERTED_ATLEASTONCE: cover property
  (readyAssertAtleastOnce(arready)) 
  $info("IFARREADY_NEEDTOASSERTED_ATLEASTONCE : COVERED");
  
  IFRREADY_NEEDTOASSERTED_ATLEASTONCE: cover property
  (readyAssertAtleastOnce(rready)) 
  $info("IFRREADY_NEEDTOASSERTED_ATLEASTONCE : COVERED");
 
  property WhenValidAssertedThenReadyAssertedNextClk(logic valid, logic ready);
  @(posedge aclk) disable iff (!aresetn) valid |-> !ready ##1 (valid && ready);
  endproperty

  IFARVALIDASSERTED_THEN_NEXTCLK_ARREADYASSERTED: cover property 
  (WhenValidAssertedThenReadyAssertedNextClk(arvalid, arready))
  $info("IFARVALIDASSERTED_THEN_NEXTCLK_ARREADYASSERTED : COVERED");

  IFRVALIDASSERTED_THEN_NEXTCLK_RREADYASSERTED: cover property 
  (WhenValidAssertedThenReadyAssertedNextClk(rvalid,rready))
  $info("IFRVALIDASSERTED_THEN_NEXTCLK_RREADYASSERTED : COVERED");

  property WhenValidAssertedThenInbetween2To5ClkReadyAsserted(logic valid, logic ready);
  @(posedge aclk) disable iff (!aresetn) valid |-> ##[2:5] ready; 
  endproperty  

   IFARVALIDASSERTED_THEN_INBETWEEN2TO5CLK_ARREADYASSERTED: cover property 
   (WhenValidAssertedThenInbetween2To5ClkReadyAsserted(arvalid, arready)) 
   $info("IFARVALIDASSERTED_THEN_INBETWEEN2TO5CLK_ARREADYASSERTED : COVERED");

   IFRVALIDASSERTED_THEN_INBETWEEN2TO5CLK_RREADYASSERTED: cover property 
   (WhenValidAssertedThenInbetween2To5ClkReadyAsserted(rvalid, rready))
   $info("IFRVALIDASSERTED_THEN_INBETWEEN2TO5CLK_RREADYASSERTED : COVERED");

   property WhenValidAssertedThenWithin16ClkReadyAsserted(logic valid, logic ready);
   @(posedge aclk) disable iff (!aresetn) valid |-> ##[0:MAX_DELAY_READY] ready;
   endproperty

   IFARVALIDASSERTED_THEN_WITH16CLK_ARREADYASSERTED: cover property 
   (WhenValidAssertedThenWithin16ClkReadyAsserted(arvalid, arready)) 
   $info("IFARVALIDASSERTED_THEN_WITH16CLK_ARREADYASSERTED : COVERED");

   IFRVALIDASSERTED_THEN_WITH16CLK_RREADYASSERTED: cover property 
   (WhenValidAssertedThenWithin16ClkReadyAsserted(rvalid, rready)) 
   $info("IFRVALIDASSERTED_THEN_WITH16CLK_RREADYASSERTED : COVERED");

    property WhenReadyAssertedAndDeassertedThenNextClkValidAsserted(logic valid, logic ready);
     @(posedge aclk) disable iff (!aresetn) $fell(ready) |-> !valid ##1 valid;
    endproperty

    IFARREADYASSERTED_DEASSERTED_THEN_NEXTCLK_ARVALIDASSERTED: cover property
    (WhenReadyAssertedAndDeassertedThenNextClkValidAsserted(arvalid , arready))
    $info("IFARREADYASSERTED_DEASSERTED_THEN_NEXTCLK_ARVALIDASSERTED: COVERED");

    IFRREADYASSERTED_DEASSERTED_THEN_NEXTCLK_RVALIDASSERTED: cover property
    (WhenReadyAssertedAndDeassertedThenNextClkValidAsserted(rvalid , rready))
    $info("IFRREADYASSERTED_DEASSERTED_THEN_NEXTCLK_RVALIDASSERTED: COVERED");

    property WhenReadyAssertedAndDeasserted3TimesThenNextClkValidAsserted(logic valid, logic ready);
    @(posedge aclk) disable iff (!aresetn) (ready && !valid) |-> !valid s_until_with $fell(ready)[->3] ##1 $rose(valid);
    endproperty

    IFARREADYASSERTED_DEASSERTED3TIMES_THEN_NEXTCLK_ARVALIDASSERTED: cover property
    (WhenReadyAssertedAndDeasserted3TimesThenNextClkValidAsserted(arvalid , arready))
    $info("IFARREADYASSERTED_DEASSERTED3TIMES_THEN_NEXTCLK_ARVALIDASSERTED : COVERED");

    IFRREADYASSERTED_DEASSERTED3TIMES_THEN_NEXTCLK_RVALIDASSERTED: cover property
    (WhenReadyAssertedAndDeasserted3TimesThenNextClkValidAsserted(rvalid , rready))
    $info("IFRREADYASSERTED_DEASSERTED3TIMES_THEN_NEXTCLK_RVALIDASSERTED : COVERED");

    property WhenReadyAssertedThenNextClkValidAsserted(logic valid, logic ready);
     @(posedge aclk) disable iff (!aresetn) ready |-> !valid ##1 valid;
    endproperty

    IFARREADYASSERTED_THEN_NEXTCLK_ARVALIDASSERTED: cover property
    (WhenReadyAssertedThenNextClkValidAsserted(arvalid,arready))
    $info("IFARREADYASSERTED_THEN_NEXTCLK_ARVALIDASSERTED: COVERED");

    IFRREADYASSERTED_THEN_NEXTCLK_RVALIDASSERTED: cover property
    (WhenReadyAssertedThenNextClkValidAsserted(rvalid,rready))
    $info("IFRREADYASSERTED_THEN_NEXTCLK_RVALIDASSERTED: COVERED");
 
    property WhenReadyAssertedThenInbetween2To5ClkValidAsserted(logic valid, logic ready);
     @(posedge aclk) disable iff (!aresetn) ready |-> !valid ##[2:5] valid;
    endproperty

    IFARREADYASSERTED_THEN_INBETWEEN2TO5CLK_ARVALIDASSERTED: cover property
    (WhenReadyAssertedThenInbetween2To5ClkValidAsserted(arvalid,arready))
    $info("IFARREADYASSERTED_THEN_INBETWEEN2TO5CLK_ARVALIDASSERTED: COVERED");

    IFRREADYASSERTED_THEN_INBETWEEN2TO5CLK_RVALIDASSERTED: cover property
    (WhenReadyAssertedThenInbetween2To5ClkValidAsserted(rvalid,rready))
    $info("IFRREADYASSERTED_THEN_INBETWEEN2TO5CLK_RVALIDASSERTED: COVERED");

    property WhenReadyAssertedThenInbetween1To15ClkValidAsserted(logic valid, logic ready);
     @(posedge aclk) disable iff (!aresetn) 
      ready |-> !valid ##[1:MAX_DELAY_VALID] valid;
    endproperty

    IFARREADYASSERTED_THEN_INBETWEEN1TO15CLK_ARVALIDASSERTED: cover property
    (WhenReadyAssertedThenInbetween1To15ClkValidAsserted(arvalid,arready))
    $info("IFARREADYASSERTED_THEN_INBETWEEN1TO15CLK_ARVALIDASSERTED : COVERED");

    IFRREADYASSERTED_THEN_INBETWEEN1TO15CLK_RVALIDASSERTED: cover property
    (WhenReadyAssertedThenInbetween1To15ClkValidAsserted(rvalid,rready))
    $info("IFRREADYASSERTED_THEN_INBETWEEN1TO15CLK_RVALIDASSERTED : COVERED");

    property WhenREADYDefaultValueIs1AndTransferOccurThenNextClkREADYValueWillGoDefaultState(logic valid, logic ready); 
     @(posedge aclk) disable iff (!aresetn)
         (ready && valid) |=> (ready== DEFAULT_READY);
    endproperty  

    IFARREADYDEFAULTVALUEISHIGH_ANDTRANSFEROCCUR_THEN_NEXTCLK_ARREADY_WILLGODEFAULTSTATE: cover property  
    (WhenREADYDefaultValueIs1AndTransferOccurThenNextClkREADYValueWillGoDefaultState(arvalid, arready))
    $info("IFARREADYDEFAULTVALUEISHIGH_ANDTRANSFEROCCUR_THEN_NEXTCLK_ARREADY_WILLGODEFAULTSTATE : COVERED");

    IFRREADYDEFAULTVALUEISHIGH_ANDTRANSFEROCCUR_THEN_NEXTCLK_RREADY_WILLGODEFAULTSTATE: cover property  
    (WhenREADYDefaultValueIs1AndTransferOccurThenNextClkREADYValueWillGoDefaultState(rvalid, rready))
    $info("IFRREADYDEFAULTVALUEISHIGH_ANDTRANSFEROCCUR_THEN_NEXTCLK_RREADY_WILLGODEFAULTSTATE : COVERED");

    property WhenArreadyHighAndSendingValidAddressAndReadingDataOnSlaveLocationThenSlaveWillGiveOkayResponse; 
      @(posedge aclk) disable iff (!aresetn) 
      (arvalid && arready && !($isunknown(araddr))) |-> 
       ##[1:MAX_DELAY_RVALID] (rvalid && rready) ##0 (!($isunknown(rdata)) && (rresp == 2'b00));
    endproperty  

    IFARREADYHIGH_THEN_READINGTHERDATAONSLAVEADDRESS_AND_IFSLAVEACCEPTTHEVALIDARADDR_THEN_SLAVEWILLGIVEOKAYRESPONSE : cover property (WhenArreadyHighAndSendingValidAddressAndReadingDataOnSlaveLocationThenSlaveWillGiveOkayResponse)
    $info("IFARREADYHIGH_THEN_READINGTHERDATAONSLAVEADDRESS_AND_IFSLAVEACCEPTTHEVALIDARADDR_THEN_SLAVEWILLGIVEOKAYRESPONSE : COVERED");

    property WhenArvalidAndArreadyAreAssertedThenNextClkRvalidWillBeAssert;
     @(posedge aclk) disable iff (!aresetn) 
     (arvalid && arready && !rvalid) |=> rvalid;
    endproperty

    IFARVALIDANDARREADYBOTHAREASSERTED_THEN_NEXTCLK_RVALIDWILLBEASSERT: cover property
    (WhenArvalidAndArreadyAreAssertedThenNextClkRvalidWillBeAssert)
    $info("IFARVALIDANDARREADYBOTHAREASSERTED_THEN_NEXTCLK_RVALIDWILLBEASSERT :  COVERED");

    property WhenArvalidAndArreadyAreAssertedThenAt3ClkRvalidWillBeAsserted;
     @(posedge aclk) disable iff (!aresetn) 
     (arvalid && arready && !rvalid) |-> ##3 rvalid;
    endproperty

    IFARVALIDANDARREADYBOTHAREASSERTED_THEN_AT3CLK_RVALIDWILLBEASSERT: cover property
    (WhenArvalidAndArreadyAreAssertedThenAt3ClkRvalidWillBeAsserted)
    $info("IFARVALIDANDARREADYBOTHAREASSERTED_THEN_AT3CLK_RVALIDWILLBEASSERT :  COVERED");

     property WhenArvalidAndArreadyAreAssertedThenInbetween1To10ClkRvalidWillBeAsserted;
     @(posedge aclk) disable iff (!aresetn) 
     (arvalid && arready && !rvalid) |-> ##[1:MAX_DELAY_RVALID] rvalid;
    endproperty

    IFARVALIDANDARREADYBOTHAREASSERTED_THEN_INBETWEEN1TO10CLK_RVALIDWILLBEASSERT: cover property
    (WhenArvalidAndArreadyAreAssertedThenInbetween1To10ClkRvalidWillBeAsserted)
    $info("IFARVALIDANDARREADYBOTHAREASSERTED_THEN_INBETWEEN1TO10CLK_RVALIDWILLBEASSERT :  COVERED");

    //TODO need to add logic for internal data lanes calculation
   
 //  property WhenRvalidAndRreadyIsAssertedThenRdataOflowerLanesIsValidData;
 //  @(posedge aclk) disable iff (!aresetn) 
 //   (rvalid && rready) |-> (!($isunknown(rdata)) && (rdata[31:16] === 16'b0)); 
 //  endproperty

 //  IFRVALIDANDRREADYISASSERTED_THEN_RDATAOFLOWERLANES_L1ANDL0ISVALIDDATA: cover property
 //  (WhenRvalidAndRreadyIsAssertedThenRdataOflowerLanesIsValidData)
 //  $info("IFRVALIDANDRREADYISASSERTED_THEN_RDATAOFLOWERLANES_L1ANDL0ISVALIDDATA : COVERED");

   property WhenAraddressIsGeneratedThenNextClkRdataWillBeGenerated;
    @(posedge aclk) disable iff (!aresetn)
   (arvalid && arready && !($isunknown(araddr))) |=> (rvalid && !($isunknown(rdata)));
   endproperty

   IFARADDRESISASSERTED_THEN_NEXTCLK_RDATAWILLBEASSERTED: cover property
   (WhenAraddressIsGeneratedThenNextClkRdataWillBeGenerated)
   $info("IFARADDRESISASSERTED_THEN_NEXTCLK_RDATAWILLBEASSERTED : COVERED");

   property WhenAraddressIsGeneratedThenInbetween1To10ClkRdataWillBeGenerated; 
    @(posedge aclk) disable iff (!aresetn)
   (arvalid && arready && !($isunknown(araddr))) |-> ##[1:MAX_DELAY_RVALID] (rvalid && !($isunknown(rdata)));
   endproperty  
   
   IFARADDRESISASSERTED_THEN_INBETWEEN1TO10CLKRDATAWILLBEASSERTED: cover property
   (WhenAraddressIsGeneratedThenInbetween1To10ClkRdataWillBeGenerated)
   $info("IFARADDRESISASSERTED_THEN_INBETWEEN1TO10CLKRDATAWILLBEASSERTED : COVERED");

endinterface : Axi4LiteSlaveReadCoverProperty

`endif

