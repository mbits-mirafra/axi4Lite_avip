`ifndef AXI4LITEMASTERWRITESEQITEMCONVERTER_INCLUDED_
`define AXI4LITEMASTERWRITESEQITEMCONVERTER_INCLUDED_

class Axi4LiteMasterWriteSeqItemConverter extends uvm_object;
  `uvm_object_utils(Axi4LiteMasterWriteSeqItemConverter)
  
  extern function new(string name = "Axi4LiteMasterWriteSeqItemConverter");
  extern static function void fromWriteClass(input Axi4LiteMasterWriteTransaction inputConv, output axi4LiteWriteMasterTransferPacketStruct outputConv);
  extern static function void toWriteClass(input axi4LiteWriteMasterTransferPacketStruct inputConv, output Axi4LiteMasterWriteTransaction outputConv);
  extern function void do_print(uvm_printer printer);
endclass : Axi4LiteMasterWriteSeqItemConverter

function Axi4LiteMasterWriteSeqItemConverter::new(string name = "Axi4LiteMasterWriteSeqItemConverter");
  super.new(name);
endfunction : new


function void Axi4LiteMasterWriteSeqItemConverter::fromWriteClass(input Axi4LiteMasterWriteTransaction inputConv, output axi4LiteWriteMasterTransferPacketStruct outputConv);
  `uvm_info("axi4_master_seq_item_conv_class",$sformatf("----------------------------------------------------------------------"),UVM_HIGH);

endfunction : fromWriteClass

function void Axi4LiteMasterWriteSeqItemConverter::toWriteClass(input axi4LiteWriteMasterTransferPacketStruct inputConv, output Axi4LiteMasterWriteTransaction outputConv);

  `uvm_info("axi4_master_seq_item_conv_class",$sformatf("----------------------------------------------------------------------"),UVM_HIGH);
 
  outputConv = new();
endfunction : toWriteClass


function void Axi4LiteMasterWriteSeqItemConverter::do_print(uvm_printer printer);
  axi4LiteWriteMasterTransferPacketStruct writePacketStruct; 
  super.do_print(printer);

endfunction : do_print

`endif
