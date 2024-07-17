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
  `uvm_info("axi4_masterWrite_Config_conv_class",$sformatf("----------------------------------------------------------------------"),UVM_HIGH);

  outputConv.defaultStateReady  = inputConv.defaultStateReady;
  outputConv.maxDelayForAwready = inputConv.maxDelayForAwready;
  outputConv.maxDelayForWready  = inputConv.maxDelayForWready;
  outputConv.maxDelayForBvalid  = inputConv.maxDelayForBvalid;

endfunction: fromClass

function void Axi4LiteMasterWriteConfigConverter:: do_print(uvm_printer printer); 
  axi4LiteWriteMasterTransferCfgStruct ConfigStruct;
  printer.print_field("defaultStateReady",ConfigStruct.defaultStateReady,$bits(ConfigStruct.defaultStateReady),UVM_DEC);
  printer.print_field("maxDelayForAwready",ConfigStruct.maxDelayForAwready,$bits(ConfigStruct.maxDelayForAwready),UVM_DEC);
  printer.print_field("maxDelayForWready",ConfigStruct.maxDelayForWready,$bits(ConfigStruct.maxDelayForWready),UVM_DEC);
  printer.print_field("maxDelayForBvalid",ConfigStruct.maxDelayForBvalid,$bits(ConfigStruct.maxDelayForBvalid),UVM_DEC);
endfunction : do_print

`endif

