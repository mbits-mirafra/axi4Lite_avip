`ifndef AXI4LITEWRITEMASTERENVCONFIG_INCLUDED_
`define AXI4LITEWRITEMASTERENVCONFIG_INCLUDED_

class axi4LiteWriteMasterEnvConfig extends uvm_object;
  `uvm_object_utils(axi4LiteWriteMasterEnvConfig)
  
  bit hasMasterWriteVirtualSequencer = 1;
  int no_of_masters;

  Axi4LiteMasterWriteAgentConfig axi4LiteMasterWriteAgentConfig[];

  extern function new(string name = "axi4LiteWriteMasterEnvConfig");
  extern function void do_print(uvm_printer printer);

endclass : axi4LiteWriteMasterEnvConfig

function axi4LiteWriteMasterEnvConfig::new(string name = "axi4LiteWriteMasterEnvConfig");
  super.new(name);
endfunction : new

function void axi4LiteWriteMasterEnvConfig::do_print(uvm_printer printer);
  super.do_print(printer);
  
  printer.print_field ("hasMasterWriteVirtualSequencer",hasMasterWriteVirtualSequencer,1, UVM_DEC);

endfunction : do_print

`endif

