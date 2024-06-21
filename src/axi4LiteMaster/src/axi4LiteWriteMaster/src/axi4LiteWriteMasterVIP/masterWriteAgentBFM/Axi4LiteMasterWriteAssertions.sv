`ifndef AXI4LITEMASTERWRITEASSERTIONS_INCLUDED_
`define AXI4LITEMASTERWRITEASSERTIONS_INCLUDED_

import Axi4LiteWriteMasterGlobalPkg::*;

interface Axi4LiteMasterWriteAssertions (input  aclk,
                                         input  aresetn,
                                         //Write Address Channel Signals
                                         input  awvalid,
                                         input  awready,
                                         input  awaddr,
                                         input  awprot,
                                         //Write Data Channel Signals
                                         input  wvalid,
                                         input  wready,
                                         input  wdata,
                                         input  wstrb,
                                         //Write Response Channel
                                         input  bvalid,
                                         input  bready,
                                         input  bresp
                                        );  

  import uvm_pkg::*;
  `include "uvm_macros.svh";

  initial begin
    `uvm_info("Axi4LiteMasterWriteAssertions","Axi4LiteMasterWriteAssertions",UVM_LOW);
  end

  property ifValidHighThenInformationNotUnknown(logic valid, logic information);
	  @(posedge aclk) disable iff (!aresetn)
      valid |-> !($isunknown(information));
  endproperty

IFAWVALIDASSERTED_THEN_AWADDR_NOTUNKNOWN: assert property (ifValidHighThenInformationNotUnknown(awvalid,awaddr))
  $info("IFAWVALIDASSERTED_THEN_AWADDR_NOTUNKNOWN : ASSERTED");
  else
    $error("IFAWVALIDASSERTED_THEN_AWADDR_NOTUNKNOWN : NOT ASSERTED");

IFWVALIDASSERTED_THEN_WDATA_NOTUNKNOWN: assert property (ifValidHighThenInformationNotUnknown(wvalid,wdata))
  $info("IFWVALIDASSERTED_THEN_WDATA_NOTUNKNOWN : ASSERTED");
  else
    $error("IFWVALIDASSERTED_THEN_WDATA_NOTUNKNOWN : NOT ASSERTED");

    property validAssertedAndStableWithin16ClkReadyAsserted(logic valid, logic ready);
      @(posedge aclk) disable iff (!aresetn)
        ($rose(valid) && !ready) |=> ($stable(valid) throughout (##[0:15] $rose(ready)));  //TODO add maxDelayForReday config value
    endproperty

IFAWVALIDASSERTED_ANDREMAINHIGH_THENWITHIN16CLK_AWREADYASSERTED: assert property (validAssertedAndStableWithin16ClkReadyAsserted(awvalid, awready))
  $info("IFAWVALIDASSERTED_ANDREMAINHIGH_THENWITHIN16CLK_AWREADYASSERTED : ASSERTED");
  else
    $error("IFAWVALIDASSERTED_ANDREMAINHIGH_THENWITHIN16CLK_AWREADYASSERTED : NOT ASSERTED");

IFWVALIDASSERTED_ANDREMAINHIGH_THENWITHIN16CLK_WREADYASSERTED: assert property (validAssertedAndStableWithin16ClkReadyAsserted(wvalid, wready))
  $info("IFWVALIDASSERTED_ANDREMAINHIGH_THENWITHIN16CLK_WREADYASSERTED : ASSERTED");
  else
    $error("IFWVALIDASSERTED_ANDREMAINHIGH_THENWITHIN16CLK_WREADYASSERTED : NOT ASSERTED");

IFBVALIDASSERTED_ANDREMAINHIGH_THENWITHIN16CLK_BREADYASSERTED: assert property (validAssertedAndStableWithin16ClkReadyAsserted(bvalid, bready))
  $info("IFBVALIDASSERTED_ANDREMAINHIGH_THENWITHIN16CLK_BREADYASSERTED : ASSERTED");
  else
    $error("IFBVALIDASSERTED_ANDREMAINHIGH_THENWITHIN16CLK_BREADYASSERTED : NOT ASSERTED");

    property validAssertedThenWithin16ClkReadyAsserted(logic valid, logic ready);
      @(posedge aclk) disable iff (!aresetn)
        $rose(valid) |-> ##[0:16] ready;  //TODO add maxDelayForReday config value
    endproperty

IFAWVALIDASSERTED_THENWITHIN16CLK_AWREADYASSERTED: assert property (validAssertedThenWithin16ClkReadyAsserted(awvalid, awready)) 
  $info("IFAWVALIDASSERTED_THENWITHIN16CLK_AWREADYASSERTED : ASSERTED");
  else
    $error("IFAWVALIDASSERTED_THENWITHIN16CLK_AWREADYASSERTED : NOT ASSERTED");

IFWVALIDASSERTED_THENWITHIN16CLK_WREADYASSERTED: assert property (validAssertedThenWithin16ClkReadyAsserted(wvalid, wready)) 
  $info("IFWVALIDASSERTED_THENWITHIN16CLK_WREADYASSERTED : ASSERTED");
  else
    $error("IFWVALIDASSERTED_THENWITHIN16CLK_WREADYASSERTED : NOT ASSERTED");

IFBVALIDASSERTED_THENWITHIN16CLK_BREADYASSERTED: assert property (validAssertedThenWithin16ClkReadyAsserted(bvalid, bready)) 
  $info("IFBVALIDASSERTED_THENWITHIN16CLK_BREADYASSERTED : ASSERTED");
  else
    $error("IFBVALIDASSERTED_THENWITHIN16CLK_BREADYASSERTED : NOT ASSERTED");


/*    property WhenResetAssertedThenReadyWillGoDefaultState1(logic ready);
     @(negedge aresetn) disable iff (aresetn === 1)
         1 |-> (ready===1);
    endproperty

IFAWREADYDEFAULTVALUEHIGH_ANDRESETASSERTED_THENAWREADY_WILLGODEFAULTSTATE: assert property(WhenResetAssertedThenReadyWillGoDefaultState1(awready))
  $info("IFAWREADYDEFAULTVALUEHIGH_ANDRESETASSERTED_THENAWREADY_WILLGODEFAULTSTATE : ASSERTED");
  else
    $error("IFAWREADYDEFAULTVALUEHIGH_ANDRESETASSERTED_THENAWREADY_WILLGODEFAULTSTATE : NOT ASSERTED");

IFWREADYDEFAULTVALUEHIGH_ANDRESETASSERTED_THENWREADY_WILLGODEFAULTSTATE: assert property(WhenResetAssertedThenReadyWillGoDefaultState1(wready))
  $info("IFWREADYDEFAULTVALUEHIGH_ANDRESETASSERTED_THENWREADY_WILLGODEFAULTSTATE : ASSERTED");
  else
    $error("IFWREADYDEFAULTVALUEHIGH_ANDRESETASSERTED_THENWREADY_WILLGODEFAULTSTATE : NOT ASSERTED");

IFBREADYDEFAULTVALUEHIGH_ANDRESETASSERTED_THENBREADY_WILLGODEFAULTSTATE: assert property(WhenResetAssertedThenReadyWillGoDefaultState1(bready))
  $info("IFBREADYDEFAULTVALUEHIGH_ANDRESETASSERTED_THENBREADY_WILLGODEFAULTSTATE : ASSERTED");
  else
    $error("IFBREADYDEFAULTVALUEHIGH_ANDRESETASSERTED_THENBREADY_WILLGODEFAULTSTATE : NOT ASSERTED");

    property WhenResetAssertedThenReadyWillGoDefaultState0(logic ready); 
     @(negedge aresetn) disable iff (aresetn === 1)
         1 |-> (ready===0);
    endproperty  

IFAWREADYDEFAULTVALUELOW_ANDRESETASSERTED_THENAWREADY_WILLGODEFAULTSTATE: assert property(WhenResetAssertedThenReadyWillGoDefaultState0(awready)) 
  $info("IFAWREADYDEFAULTVALUELOW_ANDRESETASSERTED_THENAWREADY_WILLGODEFAULTSTATE : ASSERTED");
  else
    $error("IFAWREADYDEFAULTVALUELOW_ANDRESETASSERTED_THENAWREADY_WILLGODEFAULTSTATE : NOT ASSERTED");

IFWREADYDEFAULTVALUELOW_ANDRESETASSERTED_THENWREADY_WILLGODEFAULTSTATE: assert property(WhenResetAssertedThenReadyWillGoDefaultState0(wready)) 
  $info("IFWREADYDEFAULTVALUELOW_ANDRESETASSERTED_THENWREADY_WILLGODEFAULTSTATE : ASSERTED");
  else
    $error("IFWREADYDEFAULTVALUELOW_ANDRESETASSERTED_THENWREADY_WILLGODEFAULTSTATE : NOT ASSERTED");

IFBREADYDEFAULTVALUELOW_ANDRESETASSERTED_THENBREADY_WILLGODEFAULTSTATE: assert property(WhenResetAssertedThenReadyWillGoDefaultState0(bready)) 
  $info("IFBREADYDEFAULTVALUELOW_ANDRESETASSERTED_THENBREADY_WILLGODEFAULTSTATE : ASSERTED");
  else
    $error("IFBREADYDEFAULTVALUELOW_ANDRESETASSERTED_THENBREADY_WILLGODEFAULTSTATE : NOT ASSERTED");
*/
    property  WhenTransferOccurThenNextCLKReadyWillGoDefaultStateHigh(logic valid, logic ready);
     @(posedge aclk) disable iff (!aresetn)
         (ready && valid) |=> (ready == 1);
    endproperty

IFAWREADYDEFAULTVALUEHIGH_ANDTRANSFEROCCUR_THENAWREADY_WILLGODEFAULTSTATE: assert property(WhenTransferOccurThenNextCLKReadyWillGoDefaultStateHigh(awvalid,awready))
  $info("IFAWREADYDEFAULTVALUEHIGH_ANDTRANSFEROCCUR_THENAWREADY_WILLGODEFAULTSTATE : ASSERTED");
  else
    $error("IFAWREADYDEFAULTVALUEHIGH_ANDTRANSFEROCCUR_THENAWREADY_WILLGODEFAULTSTATE : NOT ASSERTED");

IFWREADYDEFAULTVALUEHIGH_ANDTRANSFEROCCUR_THENWREADY_WILLGODEFAULTSTATE: assert property(WhenTransferOccurThenNextCLKReadyWillGoDefaultStateHigh(wvalid,wready))
  $info("IFWREADYDEFAULTVALUEHIGH_ANDTRANSFEROCCUR_THENWREADY_WILLGODEFAULTSTATE : ASSERTED");
  else
    $error("IFWREADYDEFAULTVALUEHIGH_ANDTRANSFEROCCUR_THENWREADY_WILLGODEFAULTSTATE : NOT ASSERTED");

IFBREADYDEFAULTVALUEHIGH_ANDTRANSFEROCCUR_THENBREADY_WILLGODEFAULTSTATE: assert property(WhenTransferOccurThenNextCLKReadyWillGoDefaultStateHigh(bvalid,bready))
  $info("IFBREADYDEFAULTVALUEHIGH_ANDTRANSFEROCCUR_THENBREADY_WILLGODEFAULTSTATE : ASSERTED");
  else
    $error("IFBREADYDEFAULTVALUEHIGH_ANDTRANSFEROCCUR_THENBREADY_WILLGODEFAULTSTATE : NOT ASSERTED");
/*
    property  WhenTransferOccurThenNextCLKReadyWillGoDefaultStateLow(logic valid, logic ready);
     @(posedge aclk) disable iff (!aresetn)
         (ready && valid) |=> (ready !== 1);
    endproperty  

IFAWREADYDEFAULTVALUELOW_ANDTRANSFEROCCUR_THENAWREADY_WILLGODEFAULTSTATE: assert property(WhenTransferOccurThenNextCLKReadyWillGoDefaultStateLow(awvalid,awready))
  $info("IFAWREADYDEFAULTVALUELOW_ANDTRANSFEROCCUR_THENAWREADY_WILLGODEFAULTSTATE : ASSERTED");
  else
    $error("IFAWREADYDEFAULTVALUELOW_ANDTRANSFEROCCUR_THENAWREADY_WILLGODEFAULTSTATE : NOT ASSERTED");

IFWREADYDEFAULTVALUELOW_ANDTRANSFEROCCUR_THENWREADY_WILLGODEFAULTSTATE: assert property(WhenTransferOccurThenNextCLKReadyWillGoDefaultStateLow(wvalid,wready))
  $info("IFWREADYDEFAULTVALUELOW_ANDTRANSFEROCCUR_THENWREADY_WILLGODEFAULTSTATE : ASSERTED");
  else
    $error("IFWREADYDEFAULTVALUELOW_ANDTRANSFEROCCUR_THENWREADY_WILLGODEFAULTSTATE : NOT ASSERTED");

IFBREADYDEFAULTVALUELOW_ANDTRANSFEROCCUR_THENBREADY_WILLGODEFAULTSTATE: assert property(WhenTransferOccurThenNextCLKReadyWillGoDefaultStateLow(bvalid,bready))
  $info("IFBREADYDEFAULTVALUELOW_ANDTRANSFEROCCUR_THENBREADY_WILLGODEFAULTSTATE : ASSERTED");
  else
    $error("IFBREADYDEFAULTVALUELOW_ANDTRANSFEROCCUR_THENBREADY_WILLGODEFAULTSTATE : NOT ASSERTED");
*/

  
    property awvalidIsHighThenInformationStableUntilTransferOccur(logic awvalid, logic awready, logic awaddr, logic awprot);
     @(posedge aclk) disable iff (!aresetn)
      (awvalid && !awready) |=> (($stable(awvalid) && $stable(awaddr) && $stable(awprot)) s_until_with awready);
    endproperty

IFAWVALIDISHIGH_THEN_INFORMATIONSTABLE_UNTILTRANSFEROCCUR : assert property(awvalidIsHighThenInformationStableUntilTransferOccur(awvalid, awready, awaddr, awprot))
  $info("IFAWVALIDISHIGH_THEN_INFORMATIONSTABLE_UNTILTRANSFEROCCUR : ASSERTED");
  else
    $error("IFAWVALIDISHIGH_THEN_INFORMATIONSTABLE_UNTILTRANSFEROCCUR : NOT ASSERTED");

    property wvalidIsHighThenInformationStableUntilTransferOccur(logic wvalid, logic wready, 
                                                                  logic wdata, logic wstrb);
     @(posedge aclk) disable iff (!aresetn)
        (wvalid && !wready) |=> (($stable(wvalid) && $stable(wdata) && $stable(wstrb)) s_until_with wready);
    endproperty

IFWVALIDISHIGH_THEN_INFORMATIONSTABLE_UNTILTRANSFEROCCUR : assert property(wvalidIsHighThenInformationStableUntilTransferOccur(wvalid, wready, wdata, wstrb))
  $info("IFWVALIDISHIGH_THEN_INFORMATIONSTABLE_UNTILTRANSFEROCCUR : ASSERTED");
  else
    $error("IFWVALIDISHIGH_THEN_INFORMATIONSTABLE_UNTILTRANSFEROCCUR : NOT ASSERTED");

    property bvalidIsHighThenInformationStableUntilTransferOccur(logic bvalid, logic bready, logic bresp);
     @(posedge aclk) disable iff (!aresetn)
        (bvalid && !bready) |=> (($stable(bvalid) && $stable(bresp)) s_until_with bready);
    endproperty

IFBVALIDISHIGH_THEN_INFORMATIONSTABLE_UNTILTRANSFEROCCUR : assert property(bvalidIsHighThenInformationStableUntilTransferOccur(bvalid, bready, bresp))
  $info("IFBVALIDISHIGH_THEN_INFORMATIONSTABLE_UNTILTRANSFEROCCUR : ASSERTED");
  else
    $error("IFBVALIDISHIGH_THEN_INFORMATIONSTABLE_UNTILTRANSFEROCCUR : NOT ASSERTED");

    property awvalidAndAwreadyAssertedThenTransferOccur(logic awvalid, logic awready, 
                                                        logic awaddr, logic awprot);
     @(posedge aclk) disable iff (!aresetn)
        (awvalid && awready) |-> !($isunknown(awaddr)) && !($isunknown(awprot));
    endproperty

IFAWVALIDANDAWREADYASSERTED_THEN_INFORMATIONNOTUNKNOWN_THENTRANSFEROCCUR : assert property(awvalidAndAwreadyAssertedThenTransferOccur(awvalid, awready, awaddr, awprot))
  $info("IFAWVALIDANDAWREADYASSERTED_THEN_INFORMATIONNOTUNKNOWN_THENTRANSFEROCCUR : ASSERTED");
  else
    $error("IFAWVALIDANDAWREADYASSERTED_THEN_INFORMATIONNOTUNKNOWN_THENTRANSFEROCCUR : NOT ASSERTED");

    property wvalidAndWreadyAssertedThenTransferOccur(logic wvalid, logic wready, 
                                                      logic wdata, logic wstrb);
     @(posedge aclk) disable iff (!aresetn)
        (wvalid && wready) |-> !($isunknown(wdata)) && !($isunknown(wstrb));
    endproperty

IFWVALIDANDWREADYASSERTED_THEN_INFORMATIONNOTUNKNOWN_THENTRANSFEROCCUR : assert property(wvalidAndWreadyAssertedThenTransferOccur(wvalid, wready, wdata, wstrb))
  $info("IFWVALIDANDWREADYASSERTED_THEN_INFORMATIONNOTUNKNOWN_THENTRANSFEROCCUR : ASSERTED");
  else
    $error("IFWVALIDANDWREADYASSERTED_THEN_INFORMATIONNOTUNKNOWN_THENTRANSFEROCCUR : NOT ASSERTED");

    property bvalidAndBreadyAssertedThenTransferOccur(logic bvalid, logic bready, logic bresp);
     @(posedge aclk) disable iff (!aresetn)
        (bvalid && bready) |-> !($isunknown(bresp));
    endproperty

IFBVALIDANDBREADYASSERTED_THEN_INFORMATIONNOTUNKNOWN_THENTRANSFEROCCUR : assert property(bvalidAndBreadyAssertedThenTransferOccur(bvalid, bready, bresp))
  $info("IFBVALIDANDBREADYASSERTED_THEN_INFORMATIONNOTUNKNOWN_THENTRANSFEROCCUR : ASSERTED");
  else
    $error("IFBVALIDANDBREADYASSERTED_THEN_INFORMATIONNOTUNKNOWN_THENTRANSFEROCCUR : NOT ASSERTED");

    property awvalidAwreadyAndWvalidWreadyAssertedThenBValidAsserted;
     @(posedge aclk) disable iff (!aresetn)
        (awvalid && awready && !bvalid) |-> ##[0:10] (wvalid && !bvalid) ##[0:16] (wready && !bvalid) ##[1:12] bvalid;
    endproperty

AWVALIDAWREADYHIGH_THENWITHIN10CLK_WVALIDANDWREADYASSERTED_THENWHITHIN12CLK_BVALIDASSERTED: assert property(awvalidAwreadyAndWvalidWreadyAssertedThenBValidAsserted)
  $info("AWVALIDAWREADYHIGH_THENWITHIN10CLK_WVALIDANDWREADYASSERTED_THENWHITHIN12CLK_BVALIDASSERTED : ASSERTED");
  else
    $error("AWVALIDAWREADYHIGH_THENWITHIN10CLK_WVALIDANDWREADYASSERTED_THENWHITHIN12CLK_BVALIDASSERTED : NOT ASSERTED");

   property wvalidWreadyAssertedThenWithin12ClkBValidAsserted;
     @(posedge aclk) disable iff (!aresetn)
       (wvalid && wready && !bvalid) |-> ##[1:12] bvalid;
   endproperty

WVALIDANDWREADYASSERTED_THENWITHIN12CLK_BVALIDASSERTED: assert property(wvalidWreadyAssertedThenWithin12ClkBValidAsserted)
  $info("WVALIDANDWREADYASSERTED_THENWITHIN12CLK_BVALIDASSERTED : ASSERTED");
  else
    $error("WVALIDANDWREADYASSERTED_THENWITHIN12CLK_BVALIDASSERTED : NOT ASSERTED");

    property awvalidIsAssertedThenWithin10ClkWValidIsAsserted;
     @(posedge aclk) disable iff (!aresetn)
        awvalid |-> ##[0:10] (wvalid);
    endproperty

IFAWVALIDISASSERTED_THEN_WITHIN10CLK_WVALIDWILLASSERT: assert property(awvalidIsAssertedThenWithin10ClkWValidIsAsserted) 
  $info("IFAWVALIDISASSERTED_THEN_WITHIN10CLK_WVALIDWILLASSERT : ASSERTED");
  else
    $error("IFAWVALIDISASSERTED_THEN_WITHIN10CLK_WVALIDWILLASSERT : NOT ASSERTED");

endinterface : Axi4LiteMasterWriteAssertions

`endif

