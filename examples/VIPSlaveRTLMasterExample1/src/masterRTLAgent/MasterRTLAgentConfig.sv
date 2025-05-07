`ifndef MASTERRTLAGENTCONFIG_INCLUDED_
`define MASTERRTLAGENTCONFIG_INCLUDED_

class MasterRTLAgentConfig extends uvm_object;
  `uvm_object_utils(MasterRTLAgentConfig)

  //Used for creating the agent in either passive or active mode
  uvm_active_passive_enum isActive=UVM_ACTIVE;  
  
  bit [ADDRESS_WIDTH-1:0] maxAddressRange;
  bit [ADDRESS_WIDTH-1:0] minAddressRange;

  extern function new(string name = "MasterRTLAgentConfig");
  extern function void do_print(uvm_printer printer);
endclass : MasterRTLAgentConfig

function MasterRTLAgentConfig::new(string name = "MasterRTLAgentConfig");
  super.new(name);
endfunction : new

function void MasterRTLAgentConfig::do_print(uvm_printer printer);
  super.do_print(printer);
  
  printer.print_string ("isActive",isActive.name());
  printer.print_field ("maxAddressRange", maxAddressRange, 32, UVM_DEC);
  printer.print_field ("minAddressRange", minAddressRange, 32, UVM_DEC);
endfunction : do_print

`endif

