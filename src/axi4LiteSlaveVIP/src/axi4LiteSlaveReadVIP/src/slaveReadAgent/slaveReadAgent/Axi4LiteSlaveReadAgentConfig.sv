`ifndef AXI4LITESLAVEREADAGENTCONFIG_INCLUDED_
`define AXI4LITESLAVEREADAGENTCONFIG_INCLUDED_

class Axi4LiteSlaveReadAgentConfig extends uvm_object;
  `uvm_object_utils(Axi4LiteSlaveReadAgentConfig)

  uvm_active_passive_enum isActive = UVM_ACTIVE;  
  
  bit hasCoverage;

  int maxDelayForRready;
  bit [ADDRESS_WIDTH-1:0] maxAddressRange;
  bit [ADDRESS_WIDTH-1:0] minAddressRange;

  extern function new(string name = "Axi4LiteSlaveReadAgentConfig");
  extern function void do_print(uvm_printer printer);
endclass : Axi4LiteSlaveReadAgentConfig

function Axi4LiteSlaveReadAgentConfig::new(string name = "Axi4LiteSlaveReadAgentConfig");
  super.new(name); 
endfunction : new

function void Axi4LiteSlaveReadAgentConfig::do_print(uvm_printer printer);
  super.do_print(printer);

  printer.print_string ("isActive",   isActive.name());
  printer.print_field ("hasCoverage", hasCoverage, $bits(hasCoverage), UVM_DEC);
  printer.print_field ("maxAddressRange", maxAddressRange, 32, UVM_DEC);
  printer.print_field ("minAddressRange", minAddressRange, 32, UVM_DEC);
  printer.print_field ("maxDelayForRready", maxDelayForRready, $bits(maxDelayForRready), UVM_DEC);
endfunction : do_print

`endif

