`ifndef AXI4LITEENVCONFIG_INCLUDED_
`define AXI4LITEENVCONFIG_INCLUDED_

class Axi4LiteEnvConfig extends uvm_object;
  `uvm_object_utils(Axi4LiteEnvConfig)
  
  bit hasScoreboard;
  bit hasVirtualSequencer;

  Axi4LiteMasterEnvConfig axi4LiteMasterEnvConfig;
  Axi4LiteSlaveEnvConfig axi4LiteSlaveEnvConfig;

  extern function new(string name = "Axi4LiteEnvConfig");
  extern function void do_print(uvm_printer printer);

endclass : Axi4LiteEnvConfig

function Axi4LiteEnvConfig::new(string name = "Axi4LiteEnvConfig");
  super.new(name);
endfunction : new

function void Axi4LiteEnvConfig::do_print(uvm_printer printer);
  super.do_print(printer);
  
  printer.print_field ("hasScoreboard",hasScoreboard,1, UVM_DEC);
  printer.print_field ("hasVirtualSequencer",hasVirtualSequencer,1, UVM_DEC);

endfunction : do_print

`endif

