`ifndef MASTERVIPSLAVEIPENVCONFIG_INCLUDED_
`define MASTERVIPSLAVEIPENVCONFIG_INCLUDED_

class MasterVIPSlaveIPEnvConfig extends uvm_object;
  `uvm_object_utils(MasterVIPSlaveIPEnvConfig)
  
  bit hasScoreboard;

  Axi4LiteMasterEnvConfig axi4LiteMasterEnvConfig;

  extern function new(string name = "MasterVIPSlaveIPEnvConfig");
  extern function void do_print(uvm_printer printer);

endclass : MasterVIPSlaveIPEnvConfig

function MasterVIPSlaveIPEnvConfig::new(string name = "MasterVIPSlaveIPEnvConfig");
  super.new(name);
endfunction : new

function void MasterVIPSlaveIPEnvConfig::do_print(uvm_printer printer);
  super.do_print(printer);
  
  printer.print_field ("hasScoreboard",hasScoreboard,1, UVM_DEC);

endfunction : do_print

`endif

