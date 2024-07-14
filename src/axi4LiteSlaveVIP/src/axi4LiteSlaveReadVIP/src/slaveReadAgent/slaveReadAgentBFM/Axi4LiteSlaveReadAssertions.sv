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

  initial begin
    `uvm_info("Axi4LiteSlaveReadAssertions","Axi4LiteSlaveReadAssertions",UVM_LOW);
  end

property ifValidHighThenInformationAreNotUnknown(logic valid, logic information, logic controlSignal);
	  @(posedge aclk) disable iff (!aresetn)
      valid |-> (!($isunknown(information)) && !($isunknown(controlSignal)));
  endproperty

IFARVALIDASSERTED_THEN_ARADDRARPROT_NOTUNKNOWN: assert property (ifValidHighThenInformationAreNotUnknown(arvalid,araddr,arprot))
  $info("IFARVALIDASSERTED_THEN_ARADDRARPROT_NOTUNKNOWN : ASSERTED");
  else
    $error("IFARVALIDASSERTED_THEN_ARADDRARPROT_NOTUNKNOWN : NOT ASSERTED");

IFRVALIDASSERTED_THEN_RDATARRESP_NOTUNKNOWN: assert property (ifValidHighThenInformationAreNotUnknown(rvalid,rdata,rresp))
  $info("IFRVALIDASSERTED_THEN_RDATARRESP_NOTUNKNOWN : ASSERTED");
  else
    $error("IFRVALIDASSERTED_THEN_RDATARRESP_NOTUNKNOWN : NOT ASSERTED");

    property validAssertedAndStableWithin16ClkReadyAsserted(logic valid, logic ready);
      @(posedge aclk) disable iff (!aresetn)
        ($rose(valid) && !ready) |=> ($stable(valid) throughout (##[0:MAX_DELAY_READY] $rose(ready)));
    endproperty

IFARVALIDASSERTED_ANDREMAINHIGH_THENWITHIN16CLK_ARREADYASSERTED: assert property (validAssertedAndStableWithin16ClkReadyAsserted(arvalid, arready))
  $info("IFARVALIDASSERTED_ANDREMAINHIGH_THENWITHIN16CLK_ARREADYASSERTED : ASSERTED");
  else
    $error("IFARVALIDASSERTED_ANDREMAINHIGH_THENWITHIN16CLK_ARREADYASSERTED : NOT ASSERTED");

IFRVALIDASSERTED_ANDREMAINHIGH_THENWITHIN16CLK_RREADYASSERTED: assert property (validAssertedAndStableWithin16ClkReadyAsserted(rvalid, rready))
  $info("IFRVALIDASSERTED_ANDREMAINHIGH_THENWITHIN16CLK_RREADYASSERTED : ASSERTED");
  else
    $error("IFRVALIDASSERTED_ANDREMAINHIGH_THENWITHIN16CLK_RREADYASSERTED : NOT ASSERTED");

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

    property WhenResetAssertedThenReadyWillGoDefaultState(logic ready);
     @(negedge aresetn) disable iff (aresetn === 1)
      ##1  1 |-> (ready===DEFAULT_READY);
    endproperty

IFRESETASSERTED_THENARREADY_WILLGODEFAULTSTATE: assert property(WhenResetAssertedThenReadyWillGoDefaultState(arready))
  $info("IFRESETASSERTED_THENARREADY_WILLGODEFAULTSTATE : ASSERTED");
  else
    $error("IFRESETASSERTED_THENARREADY_WILLGODEFAULTSTATE : NOT ASSERTED");

IFRESETASSERTED_THENRREADY_WILLGODEFAULTSTATE: assert property(WhenResetAssertedThenReadyWillGoDefaultState(rready))
  $info("IFRESETASSERTED_THENRREADY_WILLGODEFAULTSTATE : ASSERTED");
  else
    $error("IFRESETASSERTED_THENRREADY_WILLGODEFAULTSTATE : NOT ASSERTED");

    property WhenTransferOccurThenNextCLKReadyWillGoDefaultState(logic valid, logic ready);
     @(posedge aclk) disable iff (!aresetn)
         (ready && valid) |=> (ready == DEFAULT_READY);
    endproperty

IFTRANSFEROCCUR_THENARREADY_WILLGODEFAULTSTATE: assert property(WhenTransferOccurThenNextCLKReadyWillGoDefaultState(arvalid,arready))
  $info("IFTRANSFEROCCUR_THENARREADY_WILLGODEFAULTSTATE : ASSERTED");
  else
    $error("IFTRANSFEROCCUR_THENARREADY_WILLGODEFAULTSTATE : NOT ASSERTED");

IFTRANSFEROCCUR_THENRREADY_WILLGODEFAULTSTATE: assert property(WhenTransferOccurThenNextCLKReadyWillGoDefaultState(rvalid,rready))
  $info("IFTRANSFEROCCUR_THENRREADY_WILLGODEFAULTSTATE : ASSERTED");
  else
    $error("IFTRANSFEROCCUR_THENRREADY_WILLGODEFAULTSTATE : NOT ASSERTED");

    property arvalidIsHighThenInformationStableUntilTransferOccur(logic arvalid, logic arready, logic araddr, logic arprot);
     @(posedge aclk) disable iff (!aresetn)
      (arvalid && !arready) |=> (($stable(arvalid) && $stable(araddr) && $stable(arprot)) s_until_with arready);
    endproperty

IFARVALIDISHIGH_THEN_INFORMATIONSTABLE_UNTILTRANSFEROCCUR : assert property(arvalidIsHighThenInformationStableUntilTransferOccur(arvalid, arready, araddr, arprot))
  $info("IFARVALIDISHIGH_THEN_INFORMATIONSTABLE_UNTILTRANSFEROCCUR : ASSERTED");
  else
    $error("IFARVALIDISHIGH_THEN_INFORMATIONSTABLE_UNTILTRANSFEROCCUR : NOT ASSERTED");

    property rvalidIsHighThenInformationStableUntilTransferOccur(logic rvalid, logic rready, 
                                                                  logic rdata, logic rresp);
     @(posedge aclk) disable iff (!aresetn)
        (rvalid && !rready) |=> (($stable(rvalid) && $stable(rdata) && $stable(rresp)) s_until_with rready);
    endproperty

IFRVALIDISHIGH_THEN_INFORMATIONSTABLE_UNTILTRANSFEROCCUR : assert property(rvalidIsHighThenInformationStableUntilTransferOccur(rvalid, rready, rdata, rresp))
  $info("IFRVALIDISHIGH_THEN_INFORMATIONSTABLE_UNTILTRANSFEROCCUR : ASSERTED");
  else
    $error("IFRVALIDISHIGH_THEN_INFORMATIONSTABLE_UNTILTRANSFEROCCUR : NOT ASSERTED");

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

    property rvalidWillAssertAfterMasterSenttheRequest; 
      @(posedge aclk) disable iff (!aresetn)
        (arvalid && arready && !($isunknown(araddr)) && !rvalid) |=> (rvalid && !($isunknown(rdata)));
    endproperty  

EVEN_SUBORDINATEONLYONESOURCERDATA_THEN_MASTERNEEDTOSENDTHEREQUEST_FORRDATA : assert property(rvalidWillAssertAfterMasterSenttheRequest)
  $info("EVEN_SUBORDINATEONLYONESOURCERDATA_THEN_MASTERNEEDTOSENDTHEREQUEST_FORRDATA : ASSERTED");
  else
    $error("EVEN_SUBORDINATEONLYONESOURCERDATA_THEN_MASTERNEEDTOSENDTHEREQUEST_FORRDATA : NOT ASSERTED");

    property arvalidAndArreadyAssertedThenWithin10ClkRvalidAsserted;
      @(posedge aclk) disable iff (!aresetn)
        (arvalid && arready && !rvalid) |=> ##[0:MAX_DELAY_RVALID] (rvalid);
    endproperty

IFARVALIDANDARREADYAREASSERTED_THEN_WITHIN10CLK_RVALIDASSERTED: assert property(arvalidAndArreadyAssertedThenWithin10ClkRvalidAsserted)
  $info("IFARVALIDANDARREADYAREASSERTED_THEN_WITHIN10CLK_RVALIDASSERTED : ASSERTED");
  else
    $error("IFARVALIDANDARREADYAREASSERTED_THEN_WITHIN10CLK_RVALIDASSERTED : NOT ASSERTED");

    property arvalidAndArreadyAssertedThenWithin10ClkRvalidAssertedAndRdataNotUnknown;
      @(posedge aclk) disable iff (!aresetn)
        (arvalid && arready && !rvalid) |=> ##[0:10] (rvalid && !($isunknown(rdata)));
    endproperty

IFARVALIDANDARREADYAREASSERTED_THEN_WITHIN10CLK_RVALIDASSERTEDANDRDATANOTUNKNOWN: assert property(arvalidAndArreadyAssertedThenWithin10ClkRvalidAssertedAndRdataNotUnknown)
  $info("IFARVALIDANDARREADYAREASSERTED_THEN_WITHIN10CLK_RVALIDASSERTEDANDRDATANOTUNKNOWN : ASSERTED");
  else
    $error("IFARVALIDANDARREADYAREASSERTED_THEN_WITHIN10CLK_RVALIDASSERTEDANDRDATANOTUNKNOWN : NOT ASSERTED");

endinterface : Axi4LiteSlaveReadAssertions

`endif

