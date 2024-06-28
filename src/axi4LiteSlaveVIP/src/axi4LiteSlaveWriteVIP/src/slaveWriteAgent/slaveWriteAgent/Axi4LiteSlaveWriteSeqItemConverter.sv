`ifndef AXI4LITESLAVEWRITESEQITEMCONVERTER_INCLUDED_
`define AXI4LITESLAVEWRITESEQITEMCONVERTER_INCLUDED_

class Axi4LiteSlaveWriteSeqItemConverter extends uvm_object;
  `uvm_object_utils(Axi4LiteSlaveWriteSeqItemConverter)

  extern function new(string name = "Axi4LiteSlaveWriteSeqItemConverter");
  extern static function void fromWriteClass(input Axi4LiteSlaveWriteTransaction inputConv, output axi4LiteWriteSlaveTransferPacketStruct outputConv);
  extern static function void toWriteClass(input axi4LiteWriteSlaveTransferPacketStruct inputConv, output Axi4LiteSlaveWriteTransaction outputConv);
  extern function void do_print(uvm_printer printer);

endclass : Axi4LiteSlaveWriteSeqItemConverter

function Axi4LiteSlaveWriteSeqItemConverter::new(string name = "Axi4LiteSlaveWriteSeqItemConverter");
  super.new(name);
endfunction : new

function void Axi4LiteSlaveWriteSeqItemConverter::fromWriteClass(input Axi4LiteSlaveWriteTransaction inputConv,output axi4LiteWriteSlaveTransferPacketStruct outputConv);

  `uvm_info("axi4Lite_Slave_Write_Seq_item_conv_class",$sformatf("------------------------------------fromWriteClass----------------------------------"),UVM_HIGH);
  outputConv.delayForAwready = inputConv.delayForAwready;
  outputConv.delayForWready = inputConv.delayForWready;

endfunction : fromWriteClass

function void  Axi4LiteSlaveWriteSeqItemConverter::toWriteClass(input axi4LiteWriteSlaveTransferPacketStruct inputConv, output Axi4LiteSlaveWriteTransaction outputConv);
  `uvm_info("axi4Lite_Slave_Write_Seq_item_conv_class",$sformatf("--------------------------------------------toWriteClass--------------------------"),UVM_HIGH);
 
  outputConv = new();
  outputConv.delayForAwready = inputConv.delayForAwready;
  outputConv.delayForWready = inputConv.delayForWready;
  outputConv.delayForBvalid = inputConv.delayForBvalid;

endfunction : toWriteClass

function void Axi4LiteSlaveWriteSeqItemConverter::do_print(uvm_printer printer);
  axi4LiteWriteSlaveTransferPacketStruct writePacketStruct; 
  super.do_print(printer);
  printer.print_field("delayForAwready",writePacketStruct.delayForAwready,$bits(writePacketStruct.delayForAwready),UVM_HEX);
  printer.print_field("delayForWready",writePacketStruct.delayForWready,$bits(writePacketStruct.delayForWready),UVM_HEX);
  printer.print_field("delayForBvalid",writePacketStruct.delayForBvalid,$bits(writePacketStruct.delayForBvalid),UVM_HEX);
endfunction : do_print

`endif
