`ifndef AXI4LITEMASTERREADCONFIGCONVERTER_INCLUDED_
`define AXI4LITEMASTERREADCONFIGCONVERTER_INCLUDED_

class Axi4LiteMasterReadConfigConverter extends uvm_object;
  `uvm_object_utils(Axi4LiteMasterReadConfigConverter)

  extern function new(string name = "Axi4LiteMasterReadConfigConverter");
  extern static function void fromClass(input Axi4LiteMasterReadAgentConfig inputConv, output axi4LiteReadMasterTransferCfgStruct outputConv);
  extern function void do_print(uvm_printer printer);

endclass : Axi4LiteMasterReadConfigConverter

function Axi4LiteMasterReadConfigConverter::new(string name = "Axi4LiteMasterReadConfigConverter");
  super.new(name);
endfunction : new

function void Axi4LiteMasterReadConfigConverter::fromClass(input Axi4LiteMasterReadAgentConfig inputConv, output axi4LiteReadMasterTransferCfgStruct outputConv);

  outputConv.defaultStateRready = inputConv.defaultStateRready;
  outputConv.maxDelayForArready = inputConv.maxDelayForArready;
  outputConv.maxDelayForRvalid = inputConv.maxDelayForRvalid;
  outputConv.toggleRready = inputConv.toggleRready;
endfunction: fromClass

function void Axi4LiteMasterReadConfigConverter:: do_print(uvm_printer printer); 
  axi4LiteReadMasterTransferCfgStruct ConfigStruct;
  printer.print_field("defaultStateRready",ConfigStruct.defaultStateRready,$bits(ConfigStruct.defaultStateRready),UVM_DEC);
  printer.print_field("maxDelayForArready",ConfigStruct.maxDelayForArready,$bits(ConfigStruct.maxDelayForArready),UVM_DEC);
  printer.print_field("maxDelayForRvalid",ConfigStruct.maxDelayForRvalid,$bits(ConfigStruct.maxDelayForRvalid),UVM_DEC);
endfunction : do_print

`endif

