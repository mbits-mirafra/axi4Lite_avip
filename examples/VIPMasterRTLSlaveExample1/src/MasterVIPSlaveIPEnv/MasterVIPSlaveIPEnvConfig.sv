`ifndef MASTERVIPSLAVEIPENVCONFIG_INCLUDED_
`define MASTERVIPSLAVEIPENVCONFIG_INCLUDED_

class MasterVIPSlaveIPEnvConfig extends uvm_object;
  `uvm_object_utils(MasterVIPSlaveIPEnvConfig)
  
  bit hasScoreboard;
  bit hasVirtualSequencer;

  bit [1:0] transactionType;

  Axi4LiteMasterEnvConfig axi4LiteMasterEnvConfig;
  Axi4LiteSlaveEnvConfig axi4LiteSlaveEnvConfig;

  extern function new(string name = "MasterVIPSlaveIPEnvConfig");
  extern function void do_print(uvm_printer printer);

endclass : MasterVIPSlaveIPEnvConfig

function MasterVIPSlaveIPEnvConfig::new(string name = "MasterVIPSlaveIPEnvConfig");
  super.new(name);
endfunction : new

function void MasterVIPSlaveIPEnvConfig::do_print(uvm_printer printer);
  super.do_print(printer);
  
  printer.print_field ("hasScoreboard",hasScoreboard,1, UVM_DEC);
  printer.print_field ("hasVirtualSequencer",hasVirtualSequencer,1, UVM_DEC);
  printer.print_field ("transactionType",transactionType,2,UVM_DEC);

endfunction : do_print

`endif

