`ifndef AXI4LITESLAVEREADSEQITEMCONVERTER_INCLUDED_
`define AXI4LITESLAVEREADSEQITEMCONVERTER_INCLUDED_

class Axi4LiteSlaveReadSeqItemConverter extends uvm_object;
  `uvm_object_utils(Axi4LiteSlaveReadSeqItemConverter)

  extern function new(string name = "Axi4LiteSlaveReadSeqItemConverter");
  extern static function void fromReadClass(input Axi4LiteSlaveReadTransaction inputConv, output axi4LiteReadSlaveTransferPacketStruct outputConv);
  extern static function void toReadClass(input axi4LiteReadSlaveTransferPacketStruct inputConv, output Axi4LiteSlaveReadTransaction outputConv);
   
  extern function void do_print(uvm_printer printer);

endclass : Axi4LiteSlaveReadSeqItemConverter

function Axi4LiteSlaveReadSeqItemConverter::new(string name = "Axi4LiteSlaveReadSeqItemConverter");
  super.new(name);
endfunction : new

function void Axi4LiteSlaveReadSeqItemConverter::fromReadClass(input Axi4LiteSlaveReadTransaction inputConv,output axi4LiteReadSlaveTransferPacketStruct outputConv);

  `uvm_info("axi4Lite_Slave_Read_Seq_item_conv_class",$sformatf("------------------------------------fromReadClass----------------------------------"),UVM_HIGH);

  outputConv.araddr = inputConv.araddr;
  `uvm_info("axi4Lite_slaveRead_seq_item_conv_class",$sformatf("After converting fromReadClass araddr =  %0h",outputConv.araddr),UVM_HIGH);

  outputConv.arprot = arprotEnum'(inputConv.arprot);
  `uvm_info("axi4Lite_slaveRead_seq_item_conv_class",$sformatf("After converting fromReadClass arprot =  %0b",outputConv.arprot),UVM_HIGH);

  outputConv.rdata = inputConv.rdata;
  `uvm_info("axi4Lite_slaveRead_seq_item_conv_class",$sformatf("After converting fromReadClass rdata =  %0h",outputConv.rdata),UVM_HIGH);

  outputConv.rresp = rrespEnum'(inputConv.rresp);
  `uvm_info("axi4Lite_slaveRead_seq_item_conv_class",$sformatf("After converting fromReadClass rresp =  %0b",outputConv.rresp),UVM_HIGH);

  outputConv.delayForArready = inputConv.delayForArready;
  `uvm_info("axi4Lite_slaveRead_seq_item_conv_class",$sformatf("After converting fromReadClass delayForArready =  %0d",outputConv.delayForArready),UVM_HIGH);

  outputConv.delayForRvalid = inputConv.delayForRvalid;
  `uvm_info("axi4Lite_slaveRead_seq_item_conv_class",$sformatf("After converting fromReadClass delayForRvalid =  %0d",outputConv.delayForRvalid),UVM_HIGH);

  outputConv.waitCounterForRready = inputConv.waitCounterForRready;
  `uvm_info("axi4Lite_slaveRead_seq_item_conv_class",$sformatf("After converting fromReadClass waitCounterForRready =  %0d",outputConv.waitCounterForRready),UVM_HIGH);

endfunction : fromReadClass

function void Axi4LiteSlaveReadSeqItemConverter::toReadClass(input axi4LiteReadSlaveTransferPacketStruct inputConv, output Axi4LiteSlaveReadTransaction outputConv);
  `uvm_info("axi4Lite_Slave_Read_Seq_item_conv_class",$sformatf("--------------------------------------------toReadClass--------------------------"),UVM_HIGH);
 
  outputConv = new();

  outputConv.araddr = inputConv.araddr;
  `uvm_info("axi4Lite_slaveRead_seq_item_conv_class",$sformatf("After converting toReadClass araddr =  %0h",outputConv.araddr),UVM_HIGH);

  outputConv.arprot = arprotEnum'(inputConv.arprot);
  `uvm_info("axi4Lite_slaveRead_seq_item_conv_class",$sformatf("After converting toReadClass arprot =  %0b",outputConv.arprot),UVM_HIGH);

  outputConv.rdata = inputConv.rdata;
  `uvm_info("axi4Lite_slaveRead_seq_item_conv_class",$sformatf("After converting toReadClass rdata =  %0h",outputConv.rdata),UVM_HIGH);

  outputConv.rresp = rrespEnum'(inputConv.rresp);
  `uvm_info("axi4Lite_slaveRead_seq_item_conv_class",$sformatf("After converting toReadClass rresp =  %0b",outputConv.rresp),UVM_HIGH);

  outputConv.delayForArready = inputConv.delayForArready;
  `uvm_info("axi4Lite_slaveRead_seq_item_conv_class",$sformatf("After converting toReadClass delayForArready =  %0d",outputConv.delayForArready),UVM_HIGH);

  outputConv.delayForRvalid = inputConv.delayForRvalid;
  `uvm_info("axi4Lite_slaveRead_seq_item_conv_class",$sformatf("After converting toReadClass delayForRvalid =  %0d",outputConv.delayForRvalid),UVM_HIGH);

  outputConv.waitCounterForRready = inputConv.waitCounterForRready;
  `uvm_info("axi4Lite_slaveRead_seq_item_conv_class",$sformatf("After converting toReadClass waitCounterForRready =  %0d",outputConv.waitCounterForRready),UVM_HIGH);

endfunction : toReadClass

function void Axi4LiteSlaveReadSeqItemConverter::do_print(uvm_printer printer);
  axi4LiteReadSlaveTransferPacketStruct readPacketStruct; 
  super.do_print(printer);
  printer.print_field("araddr",readPacketStruct.araddr,$bits(readPacketStruct.araddr),UVM_DEC);
  printer.print_field("arprot",readPacketStruct.arprot,$bits(readPacketStruct.arprot),UVM_DEC);
  printer.print_field("rdatat",readPacketStruct.rdata,$bits(readPacketStruct.rdata),UVM_DEC);
  printer.print_field("rresp",readPacketStruct.rresp,$bits(readPacketStruct.rresp),UVM_DEC);
  printer.print_field("delayForArready",readPacketStruct.delayForArready,$bits(readPacketStruct.delayForArready),UVM_DEC);
  printer.print_field("delayForRvalid",readPacketStruct.delayForRvalid,$bits(readPacketStruct.delayForRvalid),UVM_DEC);
endfunction : do_print

`endif
