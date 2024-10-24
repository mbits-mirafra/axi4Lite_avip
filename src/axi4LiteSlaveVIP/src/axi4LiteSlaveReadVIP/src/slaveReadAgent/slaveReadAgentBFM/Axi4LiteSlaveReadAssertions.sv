`ifndef AXI4LITESLAVEREADASSERTIONS_INCLUDED_
`define AXI4LITESLAVEREADASSERTIONS_INCLUDED_

import Axi4LiteReadSlaveGlobalPkg::*;
import Axi4LiteSlaveReadAssertCoverParameter::*;

interface Axi4LiteSlaveReadAssertions (input aclk,
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
  `include "uvm_macros.svh";

  import Axi4LiteSlaveReadPkg::Axi4LiteSlaveReadAgentConfig;

  Axi4LiteSlaveReadAgentConfig axi4LiteSlaveReadAgentConfig;

  initial begin
    `uvm_info("Axi4LiteSlaveReadAssertions","Axi4LiteSlaveReadAssertions",UVM_LOW);
  end

  bit defaultStateArready;
  bit enableOutstandingTransaction;

  initial begin
    start_of_simulation_ph.wait_for_state(UVM_PHASE_STARTED);

    if(!uvm_config_db#(Axi4LiteSlaveReadAgentConfig)::get(null, "*", "Axi4LiteSlaveReadAgentConfig",axi4LiteSlaveReadAgentConfig)) begin
    `uvm_fatal("FATAL_READSLAVE_ASSERTION_CANNOT_GET","cannot get() axi4LiteSlaveReadAgentConfig");

    end
    defaultStateArready = axi4LiteSlaveReadAgentConfig.defaultStateArready;
    enableOutstandingTransaction = axi4LiteSlaveReadAgentConfig.enableOutstandingTransaction;
  end

property ifValidHighThenInformationAreNotUnknown(logic valid, logic information);
	  @(posedge aclk) disable iff (!aresetn)
      valid |-> !($isunknown(information));
  endproperty

IFARVALIDASSERTED_THEN_ARADDR_NOTUNKNOWN: assert property (ifValidHighThenInformationAreNotUnknown(arvalid,araddr))
  $info("IFARVALIDASSERTED_THEN_ARADDR_NOTUNKNOWN : ASSERTED");
  else
    $error("IFARVALIDASSERTED_THEN_ARADDR_NOTUNKNOWN : NOT ASSERTED");

IFRVALIDASSERTED_THEN_RDATA_NOTUNKNOWN: assert property (ifValidHighThenInformationAreNotUnknown(rvalid,rdata))
  $info("IFRVALIDASSERTED_THEN_RDATA_NOTUNKNOWN : ASSERTED");
  else
    $error("IFRVALIDASSERTED_THEN_RDATA_NOTUNKNOWN : NOT ASSERTED");

IFRVALIDASSERTED_THEN_RRESP_NOTUNKNOWN: assert property (ifValidHighThenInformationAreNotUnknown(rvalid,rresp))
  $info("IFRVALIDASSERTED_THEN_RRESP_NOTUNKNOWN : ASSERTED");
  else
    $error("IFRVALIDASSERTED_THEN_RRESP_NOTUNKNOWN : NOT ASSERTED");

property ifValidHighThenControlSignalsAreNotUnknown(logic valid, logic controlSignal);
	  @(posedge aclk) disable iff (!aresetn)
      valid |-> !($isunknown(controlSignal));
  endproperty

IFARVALIDASSERTED_THEN_ARPROT_NOTUNKNOWN: assert property (ifValidHighThenControlSignalsAreNotUnknown(arvalid,arprot))
  $info("IFARVALIDASSERTED_THEN_ARPROT_NOTUNKNOWN : ASSERTED");
  else
    $error("IFARVALIDASSERTED_THEN_ARPROT_NOTUNKNOWN : NOT ASSERTED");


    property validAssertedAndStableWithin16ClkReadyAsserted(logic valid, logic ready);
      @(posedge aclk) disable iff (!aresetn)
        ($rose(valid) && (ready===0)) |=> ($stable(valid) throughout (##[0:MAX_DELAY_READY] $rose(ready)));
    endproperty

IFARVALIDASSERTED_ANDREMAINHIGH_THENWITHIN16CLK_ARREADYASSERTED: assert property (validAssertedAndStableWithin16ClkReadyAsserted(arvalid, arready))
  $info("IFARVALIDASSERTED_ANDREMAINHIGH_THENWITHIN16CLK_ARREADYASSERTED : ASSERTED");
  else
    $error("IFARVALIDASSERTED_ANDREMAINHIGH_THENWITHIN16CLK_ARREADYASSERTED : NOT ASSERTED");

IFRVALIDASSERTED_ANDREMAINHIGH_THENWITHIN16CLK_RREADYASSERTED: assert property (validAssertedAndStableWithin16ClkReadyAsserted(rvalid, rready))
  $info("IFRVALIDASSERTED_ANDREMAINHIGH_THENWITHIN16CLK_RREADYASSERTED : ASSERTED");
  else
    $error("IFRVALIDASSERTED_ANDREMAINHIGH_THENWITHIN16CLK_RREADYASSERTED : NOT ASSERTED");

    property arvalidIsHighThenInformationStableUntilTransferOccur(logic arvalid, logic arready, logic araddr, logic arprot);
     @(posedge aclk) disable iff (!aresetn)
      ($rose(arvalid) && (arready===0)) |=> (($stable(arvalid) && $stable(araddr) && $stable(arprot)) throughout arready[->1]);
    endproperty

IFARVALIDISHIGH_THEN_INFORMATIONSTABLE_UNTILTRANSFEROCCUR : assert property(arvalidIsHighThenInformationStableUntilTransferOccur(arvalid, arready, araddr, arprot))
  $info("IFARVALIDISHIGH_THEN_INFORMATIONSTABLE_UNTILTRANSFEROCCUR : ASSERTED");
  else
    $error("IFARVALIDISHIGH_THEN_INFORMATIONSTABLE_UNTILTRANSFEROCCUR : NOT ASSERTED");

    property rvalidIsHighThenInformationStableUntilTransferOccur(logic rvalid, logic rready, 
                                                                  logic rdata, logic rresp);
     @(posedge aclk) disable iff (!aresetn)
        ($rose(rvalid) && (rready===0)) |=> (($stable(rvalid) && $stable(rdata) && $stable(rresp)) throughout rready[->1]);
    endproperty

IFRVALIDISHIGH_THEN_INFORMATIONSTABLE_UNTILTRANSFEROCCUR : assert property(rvalidIsHighThenInformationStableUntilTransferOccur(rvalid, rready, rdata, rresp))
  $info("IFRVALIDISHIGH_THEN_INFORMATIONSTABLE_UNTILTRANSFEROCCUR : ASSERTED");
  else
    $error("IFRVALIDISHIGH_THEN_INFORMATIONSTABLE_UNTILTRANSFEROCCUR : NOT ASSERTED");


    property validAssertedThenWithin16ClkReadyAsserted(logic valid, logic ready);
      @(posedge aclk) disable iff (!aresetn)
        $rose(valid) |-> ##[0:MAX_DELAY_READY] ready; 
    endproperty

IFARVALIDASSERTED_THENWITHIN16CLK_ARREADYASSERTED: assert property (validAssertedThenWithin16ClkReadyAsserted(arvalid, arready)) 
  $info("IFARVALIDASSERTED_THENWITHIN16CLK_ARREADYASSERTED : ASSERTED");
  else
    $error("IFARVALIDASSERTED_THENWITHIN16CLK_ARREADYASSERTED : NOT ASSERTED");

IFRVALIDASSERTED_THENWITHIN16CLK_RREADYASSERTED: assert property (validAssertedThenWithin16ClkReadyAsserted(rvalid, rready)) 
  $info("IFRVALIDASSERTED_THENWITHIN16CLK_RREADYASSERTED : ASSERTED");
  else
    $error("IFRVALIDASSERTED_THENWITHIN16CLK_RREADYASSERTED : NOT ASSERTED");

/*
    property WhenResetAssertedThenReadyWillGoDefaultState(logic ready);
     @(negedge aresetn) disable iff (aresetn === 1)
       1 |-> (ready===DEFAULT_ARREADY);
    endproperty
*/
//TODO above property for asynchronous is not working so here we are going with synchronous reset we need to add asynchronous reset
    property WhenResetAssertedThenReadyWillGoDefaultState(logic ready);
     @(posedge aclk) (aresetn===0) |-> (ready===defaultStateArready);
    endproperty

IFRESETASSERTED_THENARREADY_WILLGODEFAULTSTATE: assert property(WhenResetAssertedThenReadyWillGoDefaultState(arready))
  $info("IFRESETASSERTED_THENARREADY_WILLGODEFAULTSTATE : ASSERTED");
  else
    $error("IFRESETASSERTED_THENARREADY_WILLGODEFAULTSTATE : NOT ASSERTED");

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

IFRESETASSERTED_THENARVALID_WILLGODEFAULTSTATE: assert property(WhenResetAssertedThenValidWillGoLow(arvalid))
  $info("IFRESETASSERTED_THENARVALID_WILLGODEFAULTSTATE : ASSERTED");
  else
    $error("IFRESETASSERTED_THENARVALID_WILLGODEFAULTSTATE : NOT ASSERTED");

IFRESETASSERTED_THENRVALID_WILLGODEFAULTSTATE: assert property(WhenResetAssertedThenValidWillGoLow(rvalid))
  $info("IFRESETASSERTED_THENRVALID_WILLGODEFAULTSTATE : ASSERTED");
  else
    $error("IFRESETASSERTED_THENRVALID_WILLGODEFAULTSTATE : NOT ASSERTED");


    property WhenTransferOccurThenNextCLKReadyWillGoDefaultState(logic valid, logic ready);
     @(posedge aclk) disable iff (!aresetn)
         (ready && valid) |=> (ready == defaultStateArready);
    endproperty


IFTRANSFEROCCUR_THENARREADY_WILLGODEFAULTSTATE: assert property(WhenTransferOccurThenNextCLKReadyWillGoDefaultState(arvalid,arready))
  $info("IFTRANSFEROCCUR_THENARREADY_WILLGODEFAULTSTATE : ASSERTED");
  else
    $error("IFTRANSFEROCCUR_THENARREADY_WILLGODEFAULTSTATE : NOT ASSERTED");

    property arvalidAndArreadyAssertedThenTransferOccur(logic arvalid, logic arready, 
                                                        logic araddr, logic arprot);
     @(posedge aclk) disable iff (!aresetn)
        (arvalid && arready) |-> !($isunknown(araddr)) && !($isunknown(arprot));
    endproperty

IFARVALIDANDARREADYASSERTED_THEN_INFORMATIONNOTUNKNOWN_THENTRANSFEROCCUR : assert property(arvalidAndArreadyAssertedThenTransferOccur(arvalid, arready, araddr, arprot))
  $info("IFARVALIDANDARREADYASSERTED_THEN_INFORMATIONNOTUNKNOWN_THENTRANSFEROCCUR : ASSERTED");
  else
    $error("IFARVALIDANDARREADYASSERTED_THEN_INFORMATIONNOTUNKNOWN_THENTRANSFEROCCUR : NOT ASSERTED");

    property rvalidAndRreadyAssertedThenTransferOccur(logic rvalid, logic rready, 
                                                      logic rdata, logic rresp);
     @(posedge aclk) disable iff (!aresetn)
        (rvalid && rready) |-> !($isunknown(rdata)) && !($isunknown(rresp));
    endproperty

IFRVALIDANDRREADYASSERTED_THEN_INFORMATIONNOTUNKNOWN_THENTRANSFEROCCUR : assert property(rvalidAndRreadyAssertedThenTransferOccur(rvalid, rready, rdata, rresp))
  $info("IFRVALIDANDRREADYASSERTED_THEN_INFORMATIONNOTUNKNOWN_THENTRANSFEROCCUR : ASSERTED");
  else
    $error("IFRVALIDANDRREADYASSERTED_THEN_INFORMATIONNOTUNKNOWN_THENTRANSFEROCCUR : NOT ASSERTED");

    property rvalidAndRreadyAssertedThenResponseIsNotExokay;
      @(posedge aclk) disable iff (!aresetn)
       (rvalid && rready) |-> (rresp !== 2'b01);
    endproperty

IFRVALIDANDRREADY_ISASSERTED_THEN_RESPONSEISNOTEXOKAY: assert property(rvalidAndRreadyAssertedThenResponseIsNotExokay)
  $info("IFRVALIDANDRREADY_ISASSERTED_THEN_RESPONSEISNOTEXOKAY : ASSERTED");
  else
    $error("IFRVALIDANDRREADY_ISASSERTED_THEN_RESPONSEISNOTEXOKAY : NOT ASSERTED");


  //TODO Below three assertions are not working for multiple outstanding transaction
    property rvalidWillAssertAfterMasterSenttheRequest; 
      @(posedge aclk) disable iff (!aresetn || enableOutstandingTransaction)
        (arvalid && arready && !($isunknown(araddr)) && !rvalid) |=> ##[0:MAX_DELAY_RVALID] (rvalid && !($isunknown(rdata)));
    endproperty  

EVEN_SUBORDINATEONLYONESOURCERDATA_THEN_MASTERNEEDTOSENDTHEREQUEST_FORRDATA : assert property(rvalidWillAssertAfterMasterSenttheRequest)
  $info("EVEN_SUBORDINATEONLYONESOURCERDATA_THEN_MASTERNEEDTOSENDTHEREQUEST_FORRDATA : ASSERTED");
  else
    $error("EVEN_SUBORDINATEONLYONESOURCERDATA_THEN_MASTERNEEDTOSENDTHEREQUEST_FORRDATA : NOT ASSERTED");

    property arvalidAndArreadyAssertedThenWithin10ClkRvalidAsserted;
      @(posedge aclk) disable iff (!aresetn || enableOutstandingTransaction)
        (arvalid && arready && !rvalid) |=> ##[0:MAX_DELAY_RVALID] (rvalid);
    endproperty

IFARVALIDANDARREADYAREASSERTED_THEN_WITHIN10CLK_RVALIDASSERTED: assert property(arvalidAndArreadyAssertedThenWithin10ClkRvalidAsserted)
  $info("IFARVALIDANDARREADYAREASSERTED_THEN_WITHIN10CLK_RVALIDASSERTED : ASSERTED");
  else
    $error("IFARVALIDANDARREADYAREASSERTED_THEN_WITHIN10CLK_RVALIDASSERTED : NOT ASSERTED");

    property arvalidAndArreadyAssertedThenWithin10ClkRvalidAssertedAndRdataNotUnknown;
      @(posedge aclk) disable iff (!aresetn || enableOutstandingTransaction)
        (arvalid && arready && !rvalid) |=> ##[0:MAX_DELAY_RVALID] (rvalid && !($isunknown(rdata)));
    endproperty

IFARVALIDANDARREADYAREASSERTED_THEN_WITHIN10CLK_RVALIDASSERTEDANDRDATANOTUNKNOWN: assert property(arvalidAndArreadyAssertedThenWithin10ClkRvalidAssertedAndRdataNotUnknown)
  $info("IFARVALIDANDARREADYAREASSERTED_THEN_WITHIN10CLK_RVALIDASSERTEDANDRDATANOTUNKNOWN : ASSERTED");
  else
    $error("IFARVALIDANDARREADYAREASSERTED_THEN_WITHIN10CLK_RVALIDASSERTEDANDRDATANOTUNKNOWN : NOT ASSERTED");

endinterface : Axi4LiteSlaveReadAssertions

`endif

