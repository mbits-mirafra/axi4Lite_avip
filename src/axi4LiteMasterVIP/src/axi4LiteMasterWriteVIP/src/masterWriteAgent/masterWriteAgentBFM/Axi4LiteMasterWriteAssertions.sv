`ifndef AXI4LITEMASTERWRITEASSERTIONS_INCLUDED_
`define AXI4LITEMASTERWRITEASSERTIONS_INCLUDED_

import Axi4LiteWriteMasterGlobalPkg::*;
import Axi4LiteMasterWriteAssertCoverParameter::*;

interface Axi4LiteMasterWriteAssertions (input  aclk,
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

  import Axi4LiteMasterWritePkg::Axi4LiteMasterWriteAgentConfig;

  Axi4LiteMasterWriteAgentConfig axi4LiteMasterWriteAgentConfig;

  initial begin
    `uvm_info("Axi4LiteMasterWriteAssertions","Axi4LiteMasterWriteAssertions",UVM_LOW);
  end

  bit defaultStateBready;
  bit enableOutstandingTransaction;

  initial begin
    start_of_simulation_ph.wait_for_state(UVM_PHASE_STARTED);

    if(!uvm_config_db#(Axi4LiteMasterWriteAgentConfig)::get(null, "*", "Axi4LiteMasterWriteAgentConfig",axi4LiteMasterWriteAgentConfig)) begin
    `uvm_fatal("FATAL_WRITEMASTER_ASSERTION_CANNOT_GET","cannot get() axi4LiteMasterWriteAgentConfig");

    end
    defaultStateBready = axi4LiteMasterWriteAgentConfig.defaultStateBready;
    enableOutstandingTransaction = axi4LiteMasterWriteAgentConfig.enableOutstandingTransaction;
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
        ($rose(valid) && (ready===0)) |=> ($stable(valid) throughout (##[0:MAX_DELAY_READY] $rose(ready)));
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


    property awvalidIsHighThenInformationStableUntilTransferOccur(logic awvalid, logic awready, logic awaddr, logic awprot);
     @(posedge aclk) disable iff (!aresetn)
      ($rose(awvalid) && (awready===0)) |=> (($stable(awvalid) && $stable(awaddr) && $stable(awprot)) throughout awready[->1]);
    endproperty

IFAWVALIDISHIGH_THEN_INFORMATIONSTABLE_UNTILTRANSFEROCCUR : assert property(awvalidIsHighThenInformationStableUntilTransferOccur(awvalid, awready, awaddr, awprot))
  $info("IFAWVALIDISHIGH_THEN_INFORMATIONSTABLE_UNTILTRANSFEROCCUR : ASSERTED");
  else
    $error("IFAWVALIDISHIGH_THEN_INFORMATIONSTABLE_UNTILTRANSFEROCCUR : NOT ASSERTED");

    property wvalidIsHighThenInformationStableUntilTransferOccur(logic wvalid, logic wready, 
                                                                  logic wdata, logic wstrb);
     @(posedge aclk) disable iff (!aresetn)
        ($rose(wvalid) && (wready===0)) |=> (($stable(wvalid) && $stable(wdata) && $stable(wstrb)) throughout wready[->1]);
    endproperty

IFWVALIDISHIGH_THEN_INFORMATIONSTABLE_UNTILTRANSFEROCCUR : assert property(wvalidIsHighThenInformationStableUntilTransferOccur(wvalid, wready, wdata, wstrb))
  $info("IFWVALIDISHIGH_THEN_INFORMATIONSTABLE_UNTILTRANSFEROCCUR : ASSERTED");
  else
    $error("IFWVALIDISHIGH_THEN_INFORMATIONSTABLE_UNTILTRANSFEROCCUR : NOT ASSERTED");

    property bvalidIsHighThenInformationStableUntilTransferOccur(logic bvalid, logic bready, logic bresp);
     @(posedge aclk) disable iff (!aresetn)
        ($rose(bvalid) && (bready===0)) |=> (($stable(bvalid) && $stable(bresp)) throughout bready[->1]);
    endproperty

IFBVALIDISHIGH_THEN_INFORMATIONSTABLE_UNTILTRANSFEROCCUR : assert property(bvalidIsHighThenInformationStableUntilTransferOccur(bvalid, bready, bresp))
  $info("IFBVALIDISHIGH_THEN_INFORMATIONSTABLE_UNTILTRANSFEROCCUR : ASSERTED");
  else
    $error("IFBVALIDISHIGH_THEN_INFORMATIONSTABLE_UNTILTRANSFEROCCUR : NOT ASSERTED");


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

    //TODO we tried this immediate assrtion and while running assertTb it's working but running test and sequens it's not working
 /*   always @(negedge aresetn) assert (awready===DEFAULT_BREADY)
      $info("IFRESETASSERTED_THENAWREADY_WILLGODEFAULTSTATE : ASSERTED");
    else
      $error("IFRESETASSERTED_THENAWREADY_WILLGODEFAULTSTATE : NOT ASSERTED");
*/
/*    property WhenResetAssertedThenReadyWillGoDefaultState(logic ready);
     @(negedge aresetn) disable iff (aresetn === 1)
        1 |-> (ready===DEFAULT_BREADY);
    endproperty
*/
//TODO above property for asynchronous is not working so here we are going with synchronous reset we need to add asynchronous reset
    property WhenResetAssertedThenReadyWillGoDefaultState(logic ready);
     @(posedge aclk) (aresetn===0) |-> (ready===defaultStateBready);
    endproperty

IFRESETASSERTED_THENBREADY_WILLGODEFAULTSTATE: assert property(WhenResetAssertedThenReadyWillGoDefaultState(bready))
  $info("IFRESETASSERTED_THENBREADY_WILLGODEFAULTSTATE : ASSERTED");
  else
    $error("IFRESETASSERTED_THENBREADY_WILLGODEFAULTSTATE : NOT ASSERTED");

/*
    property WhenResetAssertedThenValidWillGoLow(logic valid);
     @(negedge aresetn) disable iff (aresetn === 1)
        1 |-> (valid == 0);
    endproperty
*/
//TODO above property for asynchronous is not working so here we are going with synchronous reset we need to add asynchronous reset
    property WhenResetAssertedThenValidWillGoLow(logic valid);
     @(posedge aclk) (aresetn===0) |-> (valid === 0);
    endproperty

IFRESETASSERTED_THENAWVALID_WILLGODEFAULTSTATE: assert property(WhenResetAssertedThenValidWillGoLow(awvalid))
  $info("IFRESETASSERTED_THENAWVALID_WILLGODEFAULTSTATE : ASSERTED");
  else
    $error("IFRESETASSERTED_THENAWVALID_WILLGODEFAULTSTATE : NOT ASSERTED");

IFRESETASSERTED_THENWVALID_WILLGODEFAULTSTATE: assert property(WhenResetAssertedThenValidWillGoLow(wvalid))
  $info("IFRESETASSERTED_THENWVALID_WILLGODEFAULTSTATE : ASSERTED");
  else
    $error("IFRESETASSERTED_THENWVALID_WILLGODEFAULTSTATE : NOT ASSERTED");

IFRESETASSERTED_THENBVALID_WILLGODEFAULTSTATE: assert property(WhenResetAssertedThenValidWillGoLow(bvalid))
  $info("IFRESETASSERTED_THENBVALID_WILLGODEFAULTSTATE : ASSERTED");
  else
    $error("IFRESETASSERTED_THENBVALID_WILLGODEFAULTSTATE : NOT ASSERTED");


    property WhenTransferOccurThenNextCLKReadyWillGoDefaultState(logic valid, logic ready);
     @(posedge aclk) disable iff (!aresetn)
         (ready && valid) |=> (ready == defaultStateBready);
    endproperty

IFTRANSFEROCCUR_THENBREADY_WILLGODEFAULTSTATE: assert property(WhenTransferOccurThenNextCLKReadyWillGoDefaultState(bvalid,bready))
  $info("IFTRANSFEROCCUR_THENBREADY_WILLGODEFAULTSTATE : ASSERTED");
  else
    $error("IFTRANSFEROCCUR_THENBREADY_WILLGODEFAULTSTATE : NOT ASSERTED");

  
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

    property awvalidIsAssertedThenWithin10ClkWValidIsAsserted;
     @(posedge aclk) disable iff (!aresetn)
        ($rose(awvalid) || $rose(wvalid))|-> ##[0:MAX_DELAY_WVALID] (wvalid or awvalid);
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

//TODO Below two assertions are not working for multiple outstanding transaction
    property awvalidAwreadyAndWvalidWreadyAssertedThenBValidAsserted;
     @(posedge aclk) disable iff (!aresetn || enableOutstandingTransaction)
        (((awvalid && awready) || (wvalid && wready)) && !bvalid) |-> ##[0:MAX_DELAY_WVALID] ((wvalid || awvalid) && !bvalid) ##[0:MAX_DELAY_READY] ((wready || awready) && !bvalid) ##[1:MAX_DELAY_BVALID] bvalid;
    endproperty

AWVALIDAWREADYHIGH_THENWITHIN10CLK_WVALIDANDWREADYASSERTED_THENWHITHIN12CLK_BVALIDASSERTED: assert property(awvalidAwreadyAndWvalidWreadyAssertedThenBValidAsserted)
  $info("AWVALIDAWREADYHIGH_THENWITHIN10CLK_WVALIDANDWREADYASSERTED_THENWHITHIN12CLK_BVALIDASSERTED : ASSERTED");
  else
    $error("AWVALIDAWREADYHIGH_THENWITHIN10CLK_WVALIDANDWREADYASSERTED_THENWHITHIN12CLK_BVALIDASSERTED : NOT ASSERTED");

   property wvalidWreadyAssertedThenWithin12ClkBValidAsserted;
     @(posedge aclk) disable iff (!aresetn || enableOutstandingTransaction)
       (wvalid && wready && !bvalid) |-> ##[1:MAX_DELAY_BVALID] bvalid;
   endproperty

WVALIDANDWREADYASSERTED_THENWITHIN12CLK_BVALIDASSERTED: assert property(wvalidWreadyAssertedThenWithin12ClkBValidAsserted)
  $info("WVALIDANDWREADYASSERTED_THENWITHIN12CLK_BVALIDASSERTED : ASSERTED");
  else
    $error("WVALIDANDWREADYASSERTED_THENWITHIN12CLK_BVALIDASSERTED : NOT ASSERTED");

endinterface : Axi4LiteMasterWriteAssertions

`endif

