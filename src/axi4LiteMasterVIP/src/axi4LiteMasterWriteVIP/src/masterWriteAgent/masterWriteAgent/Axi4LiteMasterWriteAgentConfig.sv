`ifndef AXI4LITEMASTERWRITEAGENTCONFIG_INCLUDED_
`define AXI4LITEMASTERWRITEAGENTCONFIG_INCLUDED_

class Axi4LiteMasterWriteAgentConfig extends uvm_object;
  `uvm_object_utils(Axi4LiteMasterWriteAgentConfig)

  //Used for creating the agent in either passive or active mode
  uvm_active_passive_enum isActive=UVM_ACTIVE;  
  
  //Used for enabling the master agent coverage
  bit hasCoverage;
  bit defaultStateReady;
  bit [ADDRESS_WIDTH-1:0] maxAddressRange;
  bit [ADDRESS_WIDTH-1:0] minAddressRange;

  int maxDelayForAwready;
  int maxDelayForWready;
  int maxDelayForBvalid;

  extern function new(string name = "Axi4LiteMasterWriteAgentConfig");
  extern function void do_print(uvm_printer printer);
endclass : Axi4LiteMasterWriteAgentConfig

function Axi4LiteMasterWriteAgentConfig::new(string name = "Axi4LiteMasterWriteAgentConfig");
  super.new(name);
endfunction : new

function void Axi4LiteMasterWriteAgentConfig::do_print(uvm_printer printer);
  super.do_print(printer);
  
  printer.print_string ("isActive",isActive.name());
  printer.print_field ("hasCoverage",  hasCoverage, $bits(hasCoverage),  UVM_DEC);
  printer.print_field ("defaultStateReady",  defaultStateReady, $bits(defaultStateReady),  UVM_DEC);
  printer.print_field ("maxAddressRange", maxAddressRange, 32, UVM_DEC);
  printer.print_field ("minAddressRange", minAddressRange, 32, UVM_DEC);
  printer.print_field ("maxDelayForAwready", maxDelayForAwready, 32, UVM_DEC);
  printer.print_field ("maxDelayForWready", maxDelayForWready, 32, UVM_DEC);
  printer.print_field ("maxDelayForBvalid", maxDelayForBvalid, 32, UVM_DEC);
endfunction : do_print

`endif

