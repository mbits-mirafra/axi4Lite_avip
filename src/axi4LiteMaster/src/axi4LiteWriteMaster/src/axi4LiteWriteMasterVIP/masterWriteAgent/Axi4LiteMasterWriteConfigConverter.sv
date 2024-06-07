`ifndef AXI4LITEMASTERWRITECONFIGCONVERTER_INCLUDED_
`define AXI4LITEMASTERWRITECONFIGCONVERTER_INCLUDED_

class Axi4LiteMasterWriteConfigConverter extends uvm_object;
  `uvm_object_utils(Axi4LiteMasterWriteConfigConverter)

  extern function new(string name = "Axi4LiteMasterWriteConfigConverter");
  extern static function void fromClass(input Axi4LiteMasterWriteAgentConfig inputConv, output axi4LiteWriteMasterTransferCfgStruct outputConv);
  extern function void do_print(uvm_printer printer);

endclass : Axi4LiteMasterWriteConfigConverter

function Axi4LiteMasterWriteConfigConverter::new(string name = "Axi4LiteMasterWriteConfigConverter");
  super.new(name);
endfunction : new

function void Axi4LiteMasterWriteConfigConverter::fromClass(input Axi4LiteMasterWriteAgentConfig inputConv, output axi4LiteWriteMasterTransferCfgStruct outputConv);
endfunction: fromClass

function void Axi4LiteMasterWriteConfigConverter:: do_print(uvm_printer printer); 
  axi4LiteWriteMasterTransferCfgStruct ConfigStruct;
endfunction : do_print

`endif

