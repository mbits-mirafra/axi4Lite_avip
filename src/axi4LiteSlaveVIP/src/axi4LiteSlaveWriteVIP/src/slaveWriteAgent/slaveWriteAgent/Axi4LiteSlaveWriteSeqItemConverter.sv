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

/*  outputConv.awaddr = inputConv.awaddr;
  `uvm_info("axi4Lite_slaveWrite_seq_item_conv_class",$sformatf("After converting fromWriteClass awaddr =  %0h",outputConv.awaddr),UVM_HIGH);

  outputConv.awprot = awprotEnum'(inputConv.awprot);
  `uvm_info("axi4Lite_slaveWrite_seq_item_conv_class",$sformatf("After converting fromWriteClass awprot =  %0b",outputConv.awprot),UVM_HIGH);

  outputConv.wdata = inputConv.wdata;
  `uvm_info("axi4Lite_slaveWrite_seq_item_conv_class",$sformatf("After converting fromWriteClass wdata =  %0h",outputConv.wdata),UVM_HIGH);

  outputConv.wstrb = inputConv.wstrb;
  `uvm_info("axi4Lite_slaveWrite_seq_item_conv_class",$sformatf("After converting fromWriteClass wstrb =  %0b",outputConv.wstrb),UVM_HIGH);

  outputConv.bresp = brespEnum'(inputConv.bresp);
  `uvm_info("axi4Lite_slaveWrite_seq_item_conv_class",$sformatf("After converting fromWriteClass bresp =  %0b",outputConv.bresp),UVM_HIGH);

  outputConv.delayForAwready = inputConv.delayForAwready;
  `uvm_info("axi4Lite_slaveWrite_seq_item_conv_class",$sformatf("After converting fromWriteClass delayForAwready =  %0d",outputConv.delayForAwready),UVM_HIGH);
  
  outputConv.delayForWready = inputConv.delayForWready;
  `uvm_info("axi4Lite_masterWrite_seq_item_conv_class",$sformatf("After converting fromWriteClass delayForWready =  %0d",outputConv.delayForWready),UVM_HIGH);

  outputConv.waitCounterForAwready = inputConv.waitCounterForAwready;
  `uvm_info("axi4Lite_masterWrite_seq_item_conv_class",$sformatf("After converting fromWriteClass waitCounterForAwready =  %0d",outputConv.waitCounterForAwready),UVM_HIGH);

  outputConv.waitCounterForWready = inputConv.waitCounterForWready;
  `uvm_info("axi4Lite_masterWrite_seq_item_conv_class",$sformatf("After converting fromWriteClass waitCounterForWready =  %0d",outputConv.waitCounterForWready),UVM_HIGH);
  
  outputConv.waitCounterForBvalid = inputConv.waitCounterForBvalid;
  `uvm_info("axi4Lite_masterWrite_seq_item_conv_class",$sformatf("After converting fromWriteClass waitCounterForBvalid =  %0d",outputConv.waitCounterForBvalid),UVM_HIGH);
*/
  outputConv.delayForAwready = inputConv.delayForAwready;
  outputConv.delayForWready  = inputConv.delayForWready;

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
