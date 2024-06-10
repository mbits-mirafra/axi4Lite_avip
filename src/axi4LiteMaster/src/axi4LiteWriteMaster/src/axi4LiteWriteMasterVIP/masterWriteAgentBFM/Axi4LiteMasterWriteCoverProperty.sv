`ifndef AXI4LITEMASTERWRITECOVERPROPERTY_INCLUDED_
`define AXI4LITEMASTERWRITECOVERPROPERTY_INCLUDED_

interface Axi4LiteMasterWriteCoverProperty (input  aclk,
                                         input  aresetn,
                                         //Write Address Channel Signals
                                         input  awvalid,
                                         input  awaddr,
                                         input  awready,
                                         //Write Data Channel Signals
                                         input  wvalid,
                                         input  wdata,
                                         input  wready,
                                         //Write Response Channel
                                         input  bvalid,
                                         input  bready
                                        );  

  import uvm_pkg::*;
  import Axi4LiteWriteMasterGlobalPkg::*;
  `include "uvm_macros.svh";

  initial begin
    `uvm_info("Axi4LiteMasterWriteCoverProperty","Axi4LiteMasterWriteCoverProperty",UVM_LOW);
  end
  
  property WhenValidGoesHighThenInformationNotUnknownAndPreviousClkInformationUnknown(logic valid, logic information); 
   @(posedge aclk) 
    $rose(valid) |-> !($isunknown(information)) && ($past(information,1) == 1'bx); 
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
  $info("IFAWVALIDGOESHIGH_THEN_AWADDR_IS_NOTUNKNOWN_AND_PREVIOUS_2CLK_AWADDR_IS_UNKNOWN : COVERED");


endinterface : Axi4LiteMasterWriteCoverProperty

`endif

