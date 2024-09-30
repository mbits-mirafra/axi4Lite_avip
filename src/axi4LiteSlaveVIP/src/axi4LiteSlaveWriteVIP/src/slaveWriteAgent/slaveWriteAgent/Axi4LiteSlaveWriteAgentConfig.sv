`ifndef AXI4LITESLAVEWRITEAGENTCONFIG_INCLUDED_
`define AXI4LITESLAVEWRITEAGENTCONFIG_INCLUDED_

class Axi4LiteSlaveWriteAgentConfig extends uvm_object;
  `uvm_object_utils(Axi4LiteSlaveWriteAgentConfig)

  uvm_active_passive_enum isActive = UVM_ACTIVE;  
  
  bit hasCoverage;
  bit defaultStateAwready;
  bit defaultStateWready;

  bit [ADDRESS_WIDTH-1:0] maxAddressRange;
  bit [ADDRESS_WIDTH-1:0] minAddressRange;

  int maxDelayForWvalid;
  int maxDelayForBready;

  bit toggleAwready;
  bit toggleWready;
  bit enableOutstandingTransaction;

  extern function new(string name = "Axi4LiteSlaveWriteAgentConfig");
  extern function void do_print(uvm_printer printer);
endclass : Axi4LiteSlaveWriteAgentConfig

function Axi4LiteSlaveWriteAgentConfig::new(string name = "Axi4LiteSlaveWriteAgentConfig");
  super.new(name); 
endfunction : new

function void Axi4LiteSlaveWriteAgentConfig::do_print(uvm_printer printer);
  super.do_print(printer);

  printer.print_string ("isActive",   isActive.name());
  printer.print_field ("hasCoverage", hasCoverage, $bits(hasCoverage), UVM_DEC);
  printer.print_field ("defaultStateAwready", defaultStateAwready, $bits(defaultStateAwready), UVM_DEC);
  printer.print_field ("defaultStateWready", defaultStateWready, $bits(defaultStateWready), UVM_DEC);
  printer.print_field ("maxAddressRange", maxAddressRange, 32, UVM_DEC);
  printer.print_field ("minAddressRange", minAddressRange, 32, UVM_DEC); 
  printer.print_field ("maxDelayForWvalid", maxDelayForWvalid, $bits(maxDelayForWvalid), UVM_DEC);
  printer.print_field ("maxDelayForBready", maxDelayForBready, $bits(maxDelayForBready), UVM_DEC);
  printer.print_field ("toggleReady", toggleAwready, $bits(toggleAwready), UVM_DEC);
  printer.print_field ("toggleReady", toggleWready, $bits(toggleWready), UVM_DEC);
  printer.print_field ("enableOutstandingTransaction",  enableOutstandingTransaction, $bits(enableOutstandingTransaction),  UVM_DEC);
endfunction : do_print

`endif

