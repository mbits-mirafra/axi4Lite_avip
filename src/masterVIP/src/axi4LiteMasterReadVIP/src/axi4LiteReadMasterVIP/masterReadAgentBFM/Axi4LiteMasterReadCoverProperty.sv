`ifndef AXI4LITEMASTERREADCOVERPROPERTY_INCLUDED_
`define AXI4LITEMASTERREADCOVERPROPERTY_INCLUDED_

interface Axi4LiteMasterReadCoverProperty (input  aclk,
                                         input  aresetn,
                                         //Read Address Channel Signals
                                         input  arvalid,
                                         input  araddr,
                                         input  arready,
                                         //Read Data Channel Signals
                                         input  rvalid,
                                         input  rdata,
                                         input  rready
                                         );  

  import uvm_pkg::*;
  import Axi4LiteReadMasterGlobalPkg::*;
  `include "uvm_macros.svh";

  initial begin
    `uvm_info("Axi4LiteMasterReadCoverProperty","Axi4LiteMasterReadCoverProperty",UVM_LOW);
  end
  
  property WhenValidGoesHighThenInformationNotUnknownAndPreviousClkInformationUnknown(logic valid, logic information); 
   @(posedge aclk) 
    $rose(valid) |-> !($isunknown(information)) && ($past(information,1) == 1'bx); 
  endproperty 

  IFARVALIDGOESHIGH_THEN_ARADDR_IS_NOTUNKNOWN_AND_PREVIOUS_CLK_ARADDR_IS_UNKNOWN : cover property
  (WhenValidGoesHighThenInformationNotUnknownAndPreviousClkInformationUnknown(arvalid,araddr))
  $info("IFARVALIDGOESHIGH_THEN_ARADDR_IS_NOTUNKNOWN_AND_PREVIOUS_CLK_ARADDR_IS_UNKNOWN : COVERED");

  IFRVALIDGOESHIGH_THEN_RDATA_IS_NOTUNKNOWN_AND_PREVIOUS_CLK_RDATA_IS_UNKNOWN : cover property  
  (WhenValidGoesHighThenInformationNotUnknownAndPreviousClkInformationUnknown(rvalid, rdata))
  $info("IFRVALIDGOESHIGH_THEN_RDATA_IS_NOTUNKNOWN_AND_PREVIOUS_CLK_RDATA_IS_UNKNOWN : COVERED");

  property WhenValidAssertedThenInformationNotUnknownAndPrevious2ClkInformationUnknwon(logic valid, logic information);
	 @(posedge aclk) 
     valid |-> !($isunknown(information)) && ($past(information,2) == 1'bx); 
 endproperty 

   IFARVALIDGOESHIGH_THEN_ARADDR_IS_NOTUNKNOWN_AND_PREVIOUS_2CLK_ARADDR_IS_UNKNOWN : cover property  
  (WhenValidAssertedThenInformationNotUnknownAndPrevious2ClkInformationUnknwon(arvalid, araddr))
  $info("IFARVALIDGOESHIGH_THEN_ARADDR_IS_NOTUNKNOWN_AND_PREVIOUS_2CLK_ARADDR_IS_UNKNOWN : COVERED");

  IFRVALIDGOESHIGH_THEN_RDATA_IS_NOTUNKNOWN_AND_PREVIOUS_2CLK_RDATA_IS_UNKNOWN : cover property  
  (WhenValidAssertedThenInformationNotUnknownAndPrevious2ClkInformationUnknwon(rvalid, rdata))
  $info("IFRVALIDGOESHIGH_THEN_RDATA_IS_NOTUNKNOWN_AND_PREVIOUS_2CLK_RDATA_IS_UNKNOWN : COVERED");


endinterface : Axi4LiteMasterReadCoverProperty

`endif

