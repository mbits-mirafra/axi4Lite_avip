`ifndef AXI4LITEMASTERREADASSERTIONS_INCLUDED_
`define AXI4LITEMASTERREADASSERTIONS_INCLUDED_

import Axi4LiteReadMasterGlobalPkg::*;

interface Axi4LiteMasterReadAssertions (input  aclk,
                                         input  aresetn,
                                         //Read Address Channel Signals
                                         input  arvalid,
                                         input  arready,
                                         input  araddr,
                                         //Read Data Channel Signals
                                         input  rvalid,
                                         input  rready,
                                         input  rdata
                                        );  

  import uvm_pkg::*;
  `include "uvm_macros.svh";

  initial begin
    `uvm_info("Axi4LiteMasterReadAssertions","Axi4LiteMasterReadAssertions",UVM_LOW);
  end

property ifValidHighThenInformationAreNotUnknown(logic valid, logic information);
	  @(posedge aclk)
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

endinterface : Axi4LiteMasterReadAssertions

`endif

