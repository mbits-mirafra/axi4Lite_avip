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

endinterface : Axi4LiteMasterWriteAssertions

`endif

