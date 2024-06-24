`ifndef AXI4LITEMASTERREADSEQITEMCONVERTER_INCLUDED_
`define AXI4LITEMASTERREADSEQITEMCONVERTER_INCLUDED_

class Axi4LiteMasterReadSeqItemConverter extends uvm_object;
  `uvm_object_utils(Axi4LiteMasterReadSeqItemConverter)
  
  extern function new(string name = "Axi4LiteMasterReadSeqItemConverter");
  extern static function void fromReadClass(input Axi4LiteMasterReadTransaction inputConv, output axi4LiteReadMasterTransferPacketStruct outputConv);
  extern static function void toReadClass(input axi4LiteReadMasterTransferPacketStruct inputConv, output Axi4LiteMasterReadTransaction outputConv);
  extern function void do_print(uvm_printer printer);
endclass : Axi4LiteMasterReadSeqItemConverter

function Axi4LiteMasterReadSeqItemConverter::new(string name = "Axi4LiteMasterReadSeqItemConverter");
  super.new(name);
endfunction : new


function void Axi4LiteMasterReadSeqItemConverter::fromReadClass(input Axi4LiteMasterReadTransaction inputConv, output axi4LiteReadMasterTransferPacketStruct outputConv);
  `uvm_info("axi4_master_seq_item_conv_class",$sformatf("----------------------------------------------------------------------"),UVM_HIGH);

endfunction : fromReadClass

function void Axi4LiteMasterReadSeqItemConverter::toReadClass(input axi4LiteReadMasterTransferPacketStruct inputConv, output Axi4LiteMasterReadTransaction outputConv);

  `uvm_info("axi4_master_seq_item_conv_class",$sformatf("----------------------------------------------------------------------"),UVM_HIGH);
 
  outputConv = new();
endfunction : toReadClass


function void Axi4LiteMasterReadSeqItemConverter::do_print(uvm_printer printer);
  axi4LiteReadMasterTransferPacketStruct readPacketStruct; 
  super.do_print(printer);

endfunction : do_print

`endif
