`ifndef AXI4LITEMASTERWRITECOVERPROPERTY_INCLUDED_
`define AXI4LITEMASTERWRITECOVERPROPERTY_INCLUDED_
  import uvm_pkg::*;
  import Axi4LiteWriteMasterGlobalPkg::*;
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
                                         input  wready,
                                         //Write Response Channel
                                         input  bvalid,
                                         input  bready
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
     valid |-> !($isunknown(information)) && ($past(information,2) == 1'bx); 
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
   !ready |-> ##[0:$] (valid && !ready);
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
   $info("IFAWVALIDISASSERTED_THEN_REMAINSHIGH_NEXTCLK_AWREADYISASSERTED : COVERED");

   IFWVALIDASSERTED_ANDREMAINHIGH_THEN_NEXTCLK_WREADYASSERTED: cover property  
   (WhenValidAssertedThenValidHighAndNextClkReadyAsserted(wvalid, wready))
   $info("IFWVALIDISASSERTED_THEN_REMAINSHIGH_NEXTCLK_WREADYISASSERTED : COVERED");

   IFBVALIDASSERTED_ANDREMAINHIGH_THEN_NEXTCLK_BREADYASSERTED: cover property  
   (WhenValidAssertedThenValidHighAndNextClkReadyAsserted(bvalid, bready))
   $info("IFBVALIDISASSERTED_THEN_REMAINSHIGH_NEXTCLK_BREADYISASSERTED : COVERED");

  property  WhenValidAssertedThenValidHighAndWithin1To16ClkReadyAsserted(logic valid, logic ready);
   @(posedge aclk) 
    $rose(valid) |=> ($stable(valid) throughout (##[1:16] $rose(ready))); 
  endproperty  

  IFAWVALIDASSERTED_ANDREMAINHIGH_THENWITHIN1TO16CLK_AWREADYASSERTED: cover property 
  (WhenValidAssertedThenValidHighAndWithin1To16ClkReadyAsserted(awvalid, awready)) 
  $info("IFAWVALIDASSERTED_ANDREMANINHIGH_THENWITHIN1TO16CLK_AWREADYWILLASSERTED : COVERED");

  IFWVALIDASSERTED_ANDREMAINHIGH_THENWITHIN1TO16CLK_WREADYASSERTED: cover property 
  (WhenValidAssertedThenValidHighAndWithin1To16ClkReadyAsserted(wvalid, wready)) 
  $info("IFWVALIDASSERTED_ANDREMANINHIGH_THENWITHIN1TO16CLK_WREADYWILLASSERTED : COVERED");

  IFBVALIDASSERTED_ANDREMAINHIGH_THENWITHIN1TO16CLK_BREADYASSERTED: cover property 
  (WhenValidAssertedThenValidHighAndWithin1To16ClkReadyAsserted(bvalid, bready)) 
  $info("IFBVALIDASSERTED_ANDREMANINHIGH_THENWITHIN1TO16CLK_BREADYWILLASSERTED : COVERED");


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
    (valid && ready) |=> ##[3:16] (valid && ready);
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
   (valid && ready) |=> ##[17:$] (valid && ready);
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

endinterface : Axi4LiteMasterWriteCoverProperty

`endif

