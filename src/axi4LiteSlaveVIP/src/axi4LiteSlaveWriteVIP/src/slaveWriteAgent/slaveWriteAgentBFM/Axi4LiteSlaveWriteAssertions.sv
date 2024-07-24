`ifndef AXI4LITESLAVEWRITEASSERTIONS_INCLUDED_
`define AXI4LITESLAVEWRITEASSERTIONS_INCLUDED_

import Axi4LiteWriteSlaveGlobalPkg::*;
import Axi4LiteSlaveWriteAssertCoverParameter::*;

interface Axi4LiteSlaveWriteAssertions (input  aclk,
                                         input  aresetn,
                                         //Write Address Channel Signals
                                         input  awvalid,
                                         input  awready,
                                         input  [ADDRESS_WIDTH-1:0] awaddr,
                                         input  [2:0] awprot,
                                         //Write Data Channel Signals
                                         input  wvalid,
                                         input  wready,
                                         input  [DATA_WIDTH-1:0] wdata,
                                         input  [(DATA_WIDTH/8)-1:0] wstrb,
                                         //Write Response Channel
                                         input  bvalid,
                                         input  bready,
                                         input  [1:0] bresp
                                        );  

  import uvm_pkg::*;
  `include "uvm_macros.svh";

  initial begin
    `uvm_info("Axi4LiteSlaveWriteAssertions","Axi4LiteSlaveWriteAssertions",UVM_LOW);
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

  property ifValidHighThenControlSignalsNotUnknown(logic valid, logic controlSignal);
	  @(posedge aclk) disable iff (!aresetn)
      valid |-> !($isunknown(controlSignal));
  endproperty

IFAWVALIDASSERTED_THEN_AWPROT_NOTUNKNOWN: assert property (ifValidHighThenControlSignalsNotUnknown(awvalid,awprot))
  $info("IFAWVALIDASSERTED_THEN_AWPROT_NOTUNKNOWN : ASSERTED");
  else
    $error("IFAWVALIDASSERTED_THEN_AWPROT_NOTUNKNOWN : NOT ASSERTED");

IFWVALIDASSERTED_THEN_WSTRB_NOTUNKNOWN: assert property (ifValidHighThenControlSignalsNotUnknown(wvalid,wstrb))
  $info("IFWVALIDASSERTED_THEN_WSTRB_NOTUNKNOWN : ASSERTED");
  else
    $error("IFWVALIDASSERTED_THEN_WSTRB_NOTUNKNOWN : NOT ASSERTED");

  property ifBvalidHighThenBrespNotUnknown(logic bvalid, logic bresp);
	  @(posedge aclk) disable iff (!aresetn)
      bvalid |-> !($isunknown(bresp));
  endproperty

IFBVALIDASSERTED_THEN_BRESP_NOTUNKNOWN: assert property (ifBvalidHighThenBrespNotUnknown(bvalid,bresp))
  $info("IFBVALIDASSERTED_THEN_BRESP_NOTUNKNOWN : ASSERTED");
  else
    $error("IFBVALIDASSERTED_THEN_BRESP_NOTUNKNOWN : NOT ASSERTED");

    property validAssertedAndStableWithin16ClkReadyAsserted(logic valid, logic ready);
      @(posedge aclk) disable iff (!aresetn)
        ($rose(valid) && !ready) |=> ($stable(valid) throughout (##[0:MAX_DELAY_READY] $rose(ready)));
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
        $rose(valid) |-> ##[0:MAX_DELAY_READY] ready;  //TODO add maxDelayForReday config value
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


    property WhenResetAssertedThenReadyWillGoDefaultState(logic ready);
     @(negedge aresetn) disable iff (aresetn === 1)
       ##1  1 |-> (ready===DEFAULT_READY);
    endproperty

IFRESETASSERTED_THENAWREADY_WILLGODEFAULTSTATE: assert property(WhenResetAssertedThenReadyWillGoDefaultState(awready))
  $info("IFRESETASSERTED_THENAWREADY_WILLGODEFAULTSTATE : ASSERTED");
  else
    $error("IFRESETASSERTED_THENAWREADY_WILLGODEFAULTSTATE : NOT ASSERTED");

IFRESETASSERTED_THENWREADY_WILLGODEFAULTSTATE: assert property(WhenResetAssertedThenReadyWillGoDefaultState(wready))
  $info("IFRESETASSERTED_THENWREADY_WILLGODEFAULTSTATE : ASSERTED");
  else
    $error("IFRESETASSERTED_THENWREADY_WILLGODEFAULTSTATE : NOT ASSERTED");

IFRESETASSERTED_THENBREADY_WILLGODEFAULTSTATE: assert property(WhenResetAssertedThenReadyWillGoDefaultState(bready))
  $info("IFRESETASSERTED_THENBREADY_WILLGODEFAULTSTATE : ASSERTED");
  else
    $error("IFRESETASSERTED_THENBREADY_WILLGODEFAULTSTATE : NOT ASSERTED");

    property WhenTransferOccurThenNextCLKReadyWillGoDefaultState(logic valid, logic ready);
     @(posedge aclk) disable iff (!aresetn)
         (ready && valid) |=> (ready == DEFAULT_READY);
    endproperty

IFTRANSFEROCCUR_THENAWREADY_WILLGODEFAULTSTATE: assert property(WhenTransferOccurThenNextCLKReadyWillGoDefaultState(awvalid,awready))
  $info("IFTRANSFEROCCUR_THENAWREADY_WILLGODEFAULTSTATE : ASSERTED");
  else
    $error("IFTRANSFEROCCUR_THENAWREADY_WILLGODEFAULTSTATE : NOT ASSERTED");

IFTRANSFEROCCUR_THENWREADY_WILLGODEFAULTSTATE: assert property(WhenTransferOccurThenNextCLKReadyWillGoDefaultState(wvalid,wready))
  $info("IFTRANSFEROCCUR_THENWREADY_WILLGODEFAULTSTATE : ASSERTED");
  else
    $error("IFTRANSFEROCCUR_THENWREADY_WILLGODEFAULTSTATE : NOT ASSERTED");

IFTRANSFEROCCUR_THENBREADY_WILLGODEFAULTSTATE: assert property(WhenTransferOccurThenNextCLKReadyWillGoDefaultState(bvalid,bready))
  $info("IFTRANSFEROCCUR_THENBREADY_WILLGODEFAULTSTATE : ASSERTED");
  else
    $error("IFTRANSFEROCCUR_THENBREADY_WILLGODEFAULTSTATE : NOT ASSERTED");

  
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
        (awvalid && awready && !bvalid) |-> ##[0:MAX_DELAY_WVALID] (wvalid && !bvalid) ##[0:MAX_DELAY_READY] (wready && !bvalid) ##[1:MAX_DELAY_BVALID] bvalid;
    endproperty

AWVALIDAWREADYHIGH_THENWITHIN10CLK_WVALIDANDWREADYASSERTED_THENWHITHIN12CLK_BVALIDASSERTED: assert property(awvalidAwreadyAndWvalidWreadyAssertedThenBValidAsserted)
  $info("AWVALIDAWREADYHIGH_THENWITHIN10CLK_WVALIDANDWREADYASSERTED_THENWHITHIN12CLK_BVALIDASSERTED : ASSERTED");
  else
    $error("AWVALIDAWREADYHIGH_THENWITHIN10CLK_WVALIDANDWREADYASSERTED_THENWHITHIN12CLK_BVALIDASSERTED : NOT ASSERTED");

   property wvalidWreadyAssertedThenWithin12ClkBValidAsserted;
     @(posedge aclk) disable iff (!aresetn)
       (wvalid && wready && !bvalid) |-> ##[1:MAX_DELAY_BVALID] bvalid;
   endproperty

WVALIDANDWREADYASSERTED_THENWITHIN12CLK_BVALIDASSERTED: assert property(wvalidWreadyAssertedThenWithin12ClkBValidAsserted)
  $info("WVALIDANDWREADYASSERTED_THENWITHIN12CLK_BVALIDASSERTED : ASSERTED");
  else
    $error("WVALIDANDWREADYASSERTED_THENWITHIN12CLK_BVALIDASSERTED : NOT ASSERTED");

    property awvalidIsAssertedThenWithin10ClkWValidIsAsserted;
     @(posedge aclk) disable iff (!aresetn)
        awvalid |-> ##[0:MAX_DELAY_WVALID] (wvalid);
    endproperty

IFAWVALIDISASSERTED_THEN_WITHIN10CLK_WVALIDWILLASSERT: assert property(awvalidIsAssertedThenWithin10ClkWValidIsAsserted) 
  $info("IFAWVALIDISASSERTED_THEN_WITHIN10CLK_WVALIDWILLASSERT : ASSERTED");
  else
    $error("IFAWVALIDISASSERTED_THEN_WITHIN10CLK_WVALIDWILLASSERT : NOT ASSERTED");

    property bvalidAndBreadyAssertedThenResponseIsNotExokay;
      @(posedge aclk) disable iff (!aresetn)
       (bvalid && bready) |-> (bresp !== 2'b01);
    endproperty

IFBVALIDANDBREADY_ISASSERTED_THEN_RESPONSEISNOTEXOKAY: assert property(bvalidAndBreadyAssertedThenResponseIsNotExokay)
  $info("IFBVALIDANDBREADY_ISASSERTED_THEN_RESPONSEISNOTEXOKAY : ASSERTED");
  else
    $error("IFBVALIDANDBREADY_ISASSERTED_THEN_RESPONSEISNOTEXOKAY : NOT ASSERTED");

endinterface : Axi4LiteSlaveWriteAssertions

`endif

