`ifndef SLAVEVIPMASTERIPENVCONFIG_INCLUDED_
`define SLAVEVIPMASTERIPENVCONFIG_INCLUDED_

class SlaveVIPMasterIPEnvConfig extends uvm_object;
  `uvm_object_utils(SlaveVIPMasterIPEnvConfig)
  
  bit hasScoreboard;
  bit hasVirtualSequencer;

  bit [1:0] transactionType;

  Axi4LiteMasterEnvConfig axi4LiteMasterEnvConfig;
  Axi4LiteSlaveEnvConfig axi4LiteSlaveEnvConfig;

  extern function new(string name = "SlaveVIPMasterIPEnvConfig");
  extern function void do_print(uvm_printer printer);

endclass : SlaveVIPMasterIPEnvConfig

function SlaveVIPMasterIPEnvConfig::new(string name = "SlaveVIPMasterIPEnvConfig");
  super.new(name);
endfunction : new

function void SlaveVIPMasterIPEnvConfig::do_print(uvm_printer printer);
  super.do_print(printer);
  
  printer.print_field ("hasScoreboard",hasScoreboard,1, UVM_DEC);
  printer.print_field ("hasVirtualSequencer",hasVirtualSequencer,1, UVM_DEC);
  printer.print_field ("transactionType",transactionType,2,UVM_DEC);

endfunction : do_print

`endif

