`ifndef AXI4LITESLAVEWRITEAGENTCONFIG_INCLUDED_
`define AXI4LITESLAVEWRITEAGENTCONFIG_INCLUDED_

class Axi4LiteSlaveWriteAgentConfig extends uvm_object;
  `uvm_object_utils(Axi4LiteSlaveWriteAgentConfig)

  uvm_active_passive_enum isActive = UVM_ACTIVE;  
  
  bit hasCoverage;

  int maxDelayForWvalid;
  int maxDelayForBready;

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
  printer.print_field ("maxDelayForWvalid", maxDelayForWvalid, $bits(maxDelayForWvalid), UVM_DEC);
  printer.print_field ("maxDelayForBready", maxDelayForBready, $bits(maxDelayForBready), UVM_DEC);
endfunction : do_print

`endif

