`ifndef AXI4LITEMASTERENVCONFIG_INCLUDED_
`define AXI4LITEMASTERENVCONFIG_INCLUDED_

class Axi4LiteMasterEnvConfig extends uvm_object;
  `uvm_object_utils(Axi4LiteMasterEnvConfig)
  
  bit hasMasterVirtualSequencer = 1;

  Axi4LiteWriteMasterEnvConfig axi4LiteWriteMasterEnvConfig;
  Axi4LiteReadMasterEnvConfig axi4LiteReadMasterEnvConfig;

  extern function new(string name = "Axi4LiteMasterEnvConfig");
  extern function void do_print(uvm_printer printer);

endclass : Axi4LiteMasterEnvConfig

function Axi4LiteMasterEnvConfig::new(string name = "Axi4LiteMasterEnvConfig");
  super.new(name);
endfunction : new

function void Axi4LiteMasterEnvConfig::do_print(uvm_printer printer);
  super.do_print(printer);
  
  printer.print_field ("hasMasterVirtualSequencer",hasMasterVirtualSequencer,1, UVM_DEC);

endfunction : do_print

`endif

