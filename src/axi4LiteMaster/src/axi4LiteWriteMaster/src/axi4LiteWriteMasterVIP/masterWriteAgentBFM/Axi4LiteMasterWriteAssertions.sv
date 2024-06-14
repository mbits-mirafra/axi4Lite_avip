`ifndef AXI4LITEMASTERWRITEASSERTIONS_INCLUDED_
`define AXI4LITEMASTERWRITEASSERTIONS_INCLUDED_

import Axi4LiteWriteMasterGlobalPkg::*;

interface Axi4LiteMasterWriteAssertions (input  aclk,
                                         input  aresetn,
                                         //Write Address Channel Signals
                                         input  awvalid,
                                         input  awready,
                                         input  awaddr,
                                         //Write Data Channel Signals
                                         input  wvalid,
                                         input  wready,
                                         input  wdata,
                                         //Write Response Channel
                                         input  bvalid,
                                         input  bready
                                        );  

  import uvm_pkg::*;
  `include "uvm_macros.svh";

  initial begin
    `uvm_info("Axi4LiteMasterWriteAssertions","Axi4LiteMasterWriteAssertions",UVM_LOW);
  end

  property ifValidHighThenInformationAreNotUnknown(logic valid, logic information);
	  @(posedge aclk)
      valid |-> !($isunknown(information));
  endproperty

IFAWVALIDASSERTED_THEN_AWADDR_NOTUNKNOWN: assert property (ifValidHighThenInformationAreNotUnknown(awvalid,awaddr))
  $info("IFAWVALIDASSERTED_THEN_AWADDR_NOTUNKNOWN : ASSERTED");
  else
    $error("IFAWVALIDASSERTED_THEN_AWADDR_NOTUNKNOWN : NOT ASSERTED");

IFWVALIDASSERTED_THEN_WDATA_NOTUNKNOWN: assert property (ifValidHighThenInformationAreNotUnknown(wvalid,wdata))
  $info("IFWVALIDASSERTED_THEN_WDATA_NOTUNKNOWN : ASSERTED");
  else
    $error("IFWVALIDASSERTED_THEN_WDATA_NOTUNKNOWN : NOT ASSERTED");

    property WhenValidAssertedThenValidHighAndWithin0To15ClkReadyAsserted(logic valid, logic ready);
      @(posedge aclk)
        ($rose(valid) && !ready) |=> ($stable(valid) throughout (##[0:15] $rose(ready)));  //TODO add maxDelayForReday config value
    endproperty

IFAWVALIDASSERTED_ANDREMAINHIGH_THENWITHIN16CLK_AWREADYASSERTED: assert property (WhenValidAssertedThenValidHighAndWithin0To15ClkReadyAsserted(awvalid, awready))
  $info("IFAWVALIDASSERTED_ANDREMAINHIGH_THENWITHIN16CLK_AWREADYASSERTED : ASSERTED");
  else
    $error("IFAWVALIDASSERTED_ANDREMAINHIGH_THENWITHIN16CLK_AWREADYASSERTED : NOT ASSERTED");

IFWVALIDASSERTED_ANDREMAINHIGH_THENWITHIN16CLK_WREADYASSERTED: assert property (WhenValidAssertedThenValidHighAndWithin0To15ClkReadyAsserted(wvalid, wready))
  $info("IFWVALIDASSERTED_ANDREMAINHIGH_THENWITHIN16CLK_WREADYASSERTED : ASSERTED");
  else
    $error("IFWVALIDASSERTED_ANDREMAINHIGH_THENWITHIN16CLK_WREADYASSERTED : NOT ASSERTED");

IFBVALIDASSERTED_ANDREMAINHIGH_THENWITHIN16CLK_BREADYASSERTED: assert property (WhenValidAssertedThenValidHighAndWithin0To15ClkReadyAsserted(bvalid, bready))
  $info("IFBVALIDASSERTED_ANDREMAINHIGH_THENWITHIN16CLK_BREADYASSERTED : ASSERTED");
  else
    $error("IFBVALIDASSERTED_ANDREMAINHIGH_THENWITHIN16CLK_BREADYASSERTED : NOT ASSERTED");

    property WhenValidAssertedThenWithin0To15ClkReadyAsserted(logic valid, logic ready);
      @(posedge aclk)
        $rose(valid) |-> ##[0:15] ready;  //TODO add maxDelayForReday config value
    endproperty

IFAWVALIDASSERTED_THENWITHIN16CLK_AWREADYASSERTED: assert property (WhenValidAssertedThenWithin0To15ClkReadyAsserted(awvalid, awready)) 
  $info("IFAWVALIDASSERTED_THENWITHIN16CLK_AWREADYASSERTED : ASSERTED");
  else
    $error("IFAWVALIDASSERTED_THENWITHIN16CLK_AWREADYASSERTED : NOT ASSERTED");

IFWVALIDASSERTED_THENWITHIN16CLK_WREADYASSERTED: assert property (WhenValidAssertedThenWithin0To15ClkReadyAsserted(wvalid, wready)) 
  $info("IFWVALIDASSERTED_THENWITHIN16CLK_WREADYASSERTED : ASSERTED");
  else
    $error("IFWVALIDASSERTED_THENWITHIN16CLK_WREADYASSERTED : NOT ASSERTED");

IFBVALIDASSERTED_THENWITHIN16CLK_BREADYASSERTED: assert property (WhenValidAssertedThenWithin0To15ClkReadyAsserted(bvalid, bready)) 
  $info("IFBVALIDASSERTED_THENWITHIN16CLK_BREADYASSERTED : ASSERTED");
  else
    $error("IFBVALIDASSERTED_THENWITHIN16CLK_BREADYASSERTED : NOT ASSERTED");

endinterface : Axi4LiteMasterWriteAssertions

`endif

