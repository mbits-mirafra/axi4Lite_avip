`ifndef AXI4LITESLAVEREADSEQITEMCONVERTER_INCLUDED_
`define AXI4LITESLAVEREADSEQITEMCONVERTER_INCLUDED_

class Axi4LiteSlaveReadSeqItemConverter extends uvm_object;
  `uvm_object_utils(Axi4LiteSlaveReadSeqItemConverter)

  extern function new(string name = "Axi4LiteSlaveReadSeqItemConverter");
  extern static function void fromReadClass(input Axi4LiteSlaveReadTransaction inputConv, output axi4LiteReadSlaveTransferPacketStruct outputConv);
  extern static function void toReadClass(input axi4LiteReadSlaveTransferPacketStruct inputConv, output Axi4LiteSlaveReadTransaction outputConv);
  extern static function void toReadAddrRespClass(input Axi4LiteSlaveReadTransaction addressInputConv, input axi4LiteReadSlaveTransferPacketStruct inputConv, output Axi4LiteSlaveReadTransaction outputConv);
   
  extern function void do_print(uvm_printer printer);

endclass : Axi4LiteSlaveReadSeqItemConverter

function Axi4LiteSlaveReadSeqItemConverter::new(string name = "Axi4LiteSlaveReadSeqItemConverter");
  super.new(name);
endfunction : new

function void Axi4LiteSlaveReadSeqItemConverter::fromReadClass(input Axi4LiteSlaveReadTransaction inputConv,output axi4LiteReadSlaveTransferPacketStruct outputConv);

  `uvm_info("axi4Lite_Slave_Read_Seq_item_conv_class",$sformatf("------------------------------------fromReadClass----------------------------------"),UVM_HIGH);

   outputConv.rdata                 =  inputConv.rdata;
  `uvm_info("axi4Lite_slaveRead_seq_item_conv_class",$sformatf("After converting fromReadClass rdata =  %0h",outputConv.rdata),UVM_HIGH);

  outputConv.rresp                  =  rrespEnum'(inputConv.rresp);
  `uvm_info("axi4Lite_slaveRead_seq_item_conv_class",$sformatf("After converting fromReadClass rresp =  %0b",outputConv.rresp),UVM_HIGH);

outputConv.delayForArready          =  inputConv.delayForArready;
  `uvm_info("axi4Lite_slaveRead_seq_item_conv_class",$sformatf("After converting fromReadClass delayForArready =  %0d",outputConv.delayForArready),UVM_HIGH);

  outputConv.delayForRvalid         = inputConv.delayForRvalid;
  `uvm_info("axi4Lite_slaveRead_seq_item_conv_class",$sformatf("After converting fromReadClass delayForRvalid =  %0d",outputConv.delayForRvalid),UVM_HIGH);

  outputConv.repeatToggleReady         = inputConv.repeatToggleReady;
endfunction : fromReadClass

function void Axi4LiteSlaveReadSeqItemConverter::toReadClass(input axi4LiteReadSlaveTransferPacketStruct inputConv, output Axi4LiteSlaveReadTransaction outputConv);

  `uvm_info("axi4Lite_Slave_Read_Seq_item_conv_class",$sformatf("--------------------------------------------toReadClass--------------------------"),UVM_HIGH);
 
    outputConv = new();

    outputConv.araddr               =  inputConv.araddr;
    outputConv.arprot                =  arprotEnum'(inputConv.arprot);
    outputConv.rdata                 =  inputConv.rdata;
    outputConv.rresp                 = rrespEnum'(inputConv.rresp);
    outputConv.delayForArready       = inputConv.delayForArready;
    outputConv.delayForRvalid        = inputConv.delayForRvalid;
  
endfunction : toReadClass

function void Axi4LiteSlaveReadSeqItemConverter::toReadAddrRespClass(input Axi4LiteSlaveReadTransaction addressInputConv, input axi4LiteReadSlaveTransferPacketStruct inputConv, output Axi4LiteSlaveReadTransaction outputConv);

  `uvm_info("axi4Lite_slaveRead_seq_item_conv_class",$sformatf("----------------------------------------------------------------------"),UVM_HIGH);

  outputConv = new();
  
  outputConv.araddr = addressInputConv.araddr; 
  `uvm_info("axi4Lite_slaveRead_seq_item_conv_class",$sformatf("After converting toReadAddrRespClass araddr =  %0h",outputConv.araddr),UVM_HIGH);
  
  outputConv.arprot = addressInputConv.arprot;
  `uvm_info("axi4Lite_slaveRead_seq_item_conv_class",$sformatf("After converting toReadAddrRespClass arprot =  %0d",outputConv.arprot),UVM_HIGH);
 
  outputConv.rdata = inputConv.rdata; 
  `uvm_info("axi4Lite_slaveRead_seq_item_conv_class",$sformatf("After converting toReadAddrRespClass rdata =  %0h",outputConv.rdata),UVM_HIGH);
  
  outputConv.rresp = rrespEnum'(inputConv.rresp);
  `uvm_info("axi4Lite_slaveRead_seq_item_conv_class",$sformatf("After converting toReadAddrRespClass rresp =  %0d",outputConv.rresp),UVM_HIGH);

endfunction : toReadAddrRespClass


function void Axi4LiteSlaveReadSeqItemConverter::do_print(uvm_printer printer);
  axi4LiteReadSlaveTransferPacketStruct readPacketStruct; 
  super.do_print(printer);
  printer.print_field("delayForArready",readPacketStruct.delayForArready,$bits(readPacketStruct.delayForArready),UVM_DEC);
  printer.print_field("delayForRvalid",readPacketStruct.delayForRvalid,$bits(readPacketStruct.delayForRvalid),UVM_DEC);
  printer.print_field("rdata",readPacketStruct.rdata,$bits(readPacketStruct.rdata),UVM_DEC);
  printer.print_field("rresp",readPacketStruct.rresp,$bits(readPacketStruct.rresp),UVM_DEC);
  printer.print_field("araddr",readPacketStruct.araddr,$bits(readPacketStruct.araddr),UVM_HEX);
  printer.print_field("arprot",readPacketStruct.arprot,$bits(readPacketStruct.arprot),UVM_DEC);
endfunction : do_print

`endif
