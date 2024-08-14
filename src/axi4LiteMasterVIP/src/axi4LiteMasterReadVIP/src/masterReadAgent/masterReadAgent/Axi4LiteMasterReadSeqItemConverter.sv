`ifndef AXI4LITEMASTERREADSEQITEMCONVERTER_INCLUDED_
`define AXI4LITEMASTERREADSEQITEMCONVERTER_INCLUDED_

class Axi4LiteMasterReadSeqItemConverter extends uvm_object;
  `uvm_object_utils(Axi4LiteMasterReadSeqItemConverter)
  
  extern function new(string name = "Axi4LiteMasterReadSeqItemConverter");
  extern static function void fromReadClass(input Axi4LiteMasterReadTransaction inputConv, output axi4LiteReadMasterTransferPacketStruct outputConv);
  extern static function void toReadClass(input axi4LiteReadMasterTransferPacketStruct inputConv, output Axi4LiteMasterReadTransaction outputConv);
  extern static function void toReadAddrRespClass(input Axi4LiteMasterReadTransaction addressInputConv, input axi4LiteReadMasterTransferPacketStruct inputConv, output Axi4LiteMasterReadTransaction outputConv);

  extern function void do_print(uvm_printer printer);
endclass : Axi4LiteMasterReadSeqItemConverter

function Axi4LiteMasterReadSeqItemConverter::new(string name = "Axi4LiteMasterReadSeqItemConverter");
  super.new(name);
endfunction : new


function void Axi4LiteMasterReadSeqItemConverter::fromReadClass(input Axi4LiteMasterReadTransaction inputConv, output axi4LiteReadMasterTransferPacketStruct outputConv);
  `uvm_info("axi4_master_seq_item_conv_class",$sformatf("----------------------------------------------------------------------"),UVM_HIGH);

  outputConv.araddr = inputConv.araddr;
  `uvm_info("axi4Lite_masterRead_seq_item_conv_class",$sformatf("After converting fromReadClass araddr =  %0h",outputConv.araddr),UVM_HIGH);

  outputConv.arprot = arprotEnum'(inputConv.arprot);
  `uvm_info("axi4Lite_masterRead_seq_item_conv_class",$sformatf("After converting fromReadClass arprot =  %0b",outputConv.arprot),UVM_HIGH);

  outputConv.rdata = inputConv.rdata;
  `uvm_info("axi4Lite_masterRead_seq_item_conv_class",$sformatf("After converting fromReadClass rdata =  %0h",outputConv.rdata),UVM_HIGH);

  outputConv.rresp = rrespEnum'(inputConv.rresp);
  `uvm_info("axi4Lite_masterRead_seq_item_conv_class",$sformatf("After converting fromReadClass rresp =  %0b",outputConv.rresp),UVM_HIGH);

  outputConv.delayForArvalid = inputConv.delayForArvalid;
  `uvm_info("axi4Lite_masterRead_seq_item_conv_class",$sformatf("After converting fromReadClass delayForArvalid =  %0d",outputConv.delayForArvalid),UVM_HIGH);

  outputConv.delayForRready = inputConv.delayForRready;
  `uvm_info("axi4Lite_masterRead_seq_item_conv_class",$sformatf("After converting fromReadClass delayForRready =  %0d",outputConv.delayForRready),UVM_HIGH);

  outputConv.waitCounterForArready = inputConv.waitCounterForArready;
  `uvm_info("axi4Lite_masterRead_seq_item_conv_class",$sformatf("After converting fromReadClass waitCounterForArready =  %0d",outputConv.waitCounterForArready),UVM_HIGH);

  outputConv.waitCounterForRvalid = inputConv.waitCounterForRvalid;
  `uvm_info("axi4Lite_masterRead_seq_item_conv_class",$sformatf("After converting fromReadClass waitCounterForRvalid =  %0d",outputConv.waitCounterForRvalid),UVM_HIGH);

  outputConv.repeatToggleReady = inputConv.repeatToggleReady;
endfunction : fromReadClass

function void Axi4LiteMasterReadSeqItemConverter::toReadClass(input axi4LiteReadMasterTransferPacketStruct inputConv, output Axi4LiteMasterReadTransaction outputConv);

  `uvm_info("axi4_master_seq_item_conv_class",$sformatf("----------------------------------------------------------------------"),UVM_HIGH);
 
  outputConv = new();

  outputConv.araddr = inputConv.araddr;
  `uvm_info("axi4_master_seq_item_conv_class",$sformatf("After converting toReadClass araddr =  %0h",outputConv.araddr),UVM_HIGH);

  outputConv.arprot = arprotEnum'(inputConv.arprot);
  `uvm_info("axi4Lite_masterRead_seq_item_conv_class",$sformatf("After converting toReadClass arprot =  %0b",outputConv.arprot),UVM_HIGH);

  outputConv.rdata = inputConv.rdata;
  `uvm_info("axi4Lite_masterRead_seq_item_conv_class",$sformatf("After converting toReadClass rdata =  %0h",outputConv.rdata),UVM_HIGH);

  outputConv.rresp = rrespEnum'(inputConv.rresp);
  `uvm_info("axi4Lite_masterRead_seq_item_conv_class",$sformatf("After converting toReadClass rresp =  %0b",outputConv.rresp),UVM_HIGH);

  outputConv.delayForArvalid = inputConv.delayForArvalid;
  `uvm_info("axi4Lite_masterRead_seq_item_conv_class",$sformatf("After converting toReadClass delayForArvalid =  %0d",outputConv.delayForArvalid),UVM_HIGH);

outputConv.delayForRready = inputConv.delayForRready;
  `uvm_info("axi4Lite_masterRead_seq_item_conv_class",$sformatf("After converting toReadClass delayForRready =  %0d",outputConv.delayForRready),UVM_HIGH);

  outputConv.waitCounterForArready = inputConv.waitCounterForArready;
  `uvm_info("axi4Lite_masterRead_seq_item_conv_class",$sformatf("After converting toReadClass waitCounterForArready =  %0d",outputConv.waitCounterForArready),UVM_HIGH);

  outputConv.waitCounterForRvalid = inputConv.waitCounterForRvalid;
  `uvm_info("axi4Lite_masterRead_seq_item_conv_class",$sformatf("After converting toReadClass waitCounterForRvalid =  %0d",outputConv.waitCounterForRvalid),UVM_HIGH);

endfunction : toReadClass

function void Axi4LiteMasterReadSeqItemConverter::toReadAddrRespClass(input Axi4LiteMasterReadTransaction addressInputConv, input axi4LiteReadMasterTransferPacketStruct inputConv, output Axi4LiteMasterReadTransaction outputConv);

  `uvm_info("axi4Lite_masterRead_seq_item_conv_class",$sformatf("----------------------------------------------------------------------"),UVM_HIGH);

  outputConv = new();
  
  outputConv.araddr = addressInputConv.araddr; 
  `uvm_info("axi4Lite_masterRead_seq_item_conv_class",$sformatf("After converting toReadAddrRespClass araddr =  %0h",outputConv.araddr),UVM_HIGH);
  
  outputConv.arprot = addressInputConv.arprot;
  `uvm_info("axi4Lite_masterRead_seq_item_conv_class",$sformatf("After converting toReadAddrRespClass arprot =  %0d",outputConv.arprot),UVM_HIGH);
  
  outputConv.rdata = inputConv.rdata; 
  `uvm_info("axi4Lite_masterRead_seq_item_conv_class",$sformatf("After converting toReadAddrRespClass rdata =  %0h",outputConv.rdata),UVM_HIGH);
 
  outputConv.rresp = rrespEnum'(inputConv.rresp);
  `uvm_info("axi4Lite_masterRead_seq_item_conv_class",$sformatf("After converting toReadAddrRespClass rresp =  %0d",outputConv.rresp),UVM_HIGH);

endfunction : toReadAddrRespClass


function void Axi4LiteMasterReadSeqItemConverter::do_print(uvm_printer printer);
  axi4LiteReadMasterTransferPacketStruct readPacketStruct; 
  super.do_print(printer);

  printer.print_field("araddr",readPacketStruct.araddr,$bits(readPacketStruct.araddr),UVM_DEC);
  printer.print_field("arprot",readPacketStruct.arprot,$bits(readPacketStruct.arprot),UVM_DEC);
  printer.print_field("rdatat",readPacketStruct.rdata,$bits(readPacketStruct.rdata),UVM_DEC);
  printer.print_field("rresp",readPacketStruct.rresp,$bits(readPacketStruct.rresp),UVM_DEC);
endfunction : do_print

`endif
