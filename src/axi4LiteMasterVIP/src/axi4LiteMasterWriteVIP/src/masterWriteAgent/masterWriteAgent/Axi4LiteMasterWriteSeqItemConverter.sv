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
  `uvm_info("axi4_masterWrite_seq_item_conv_class",$sformatf("----------------------------------------------------------------------"),UVM_HIGH);

  outputConv.awaddr = inputConv.awaddr;
  `uvm_info("axi4Lite_masterWrite_seq_item_conv_class",$sformatf("After converting fromWriteClass awaddr =  %0h",outputConv.awaddr),UVM_HIGH);

  outputConv.awprot = awprotEnum'(inputConv.awprot);
  `uvm_info("axi4Lite_masterWrite_seq_item_conv_class",$sformatf("After converting fromWriteClass awprot =  %0b",outputConv.awprot),UVM_HIGH);

  outputConv.wdata = inputConv.wdata;
  `uvm_info("axi4Lite_masterWrite_seq_item_conv_class",$sformatf("After converting fromWriteClass wdata =  %0h",outputConv.wdata),UVM_HIGH);

  outputConv.wstrb = inputConv.wstrb;
  `uvm_info("axi4Lite_masterWrite_seq_item_conv_class",$sformatf("After converting fromWriteClass wstrb =  %0b",outputConv.wstrb),UVM_HIGH);

  outputConv.bresp = brespEnum'(inputConv.bresp);
  `uvm_info("axi4Lite_masterWrite_seq_item_conv_class",$sformatf("After converting fromWriteClass bresp =  %0b",outputConv.bresp),UVM_HIGH);

  outputConv.delayForAwvalid = inputConv.delayForAwvalid;
  `uvm_info("axi4Lite_masterWrite_seq_item_conv_class",$sformatf("After converting fromWriteClass delayForAwvalid =  %0d",outputConv.delayForAwvalid),UVM_HIGH);

  outputConv.delayForWvalid = inputConv.delayForWvalid;
  `uvm_info("axi4Lite_masterWrite_seq_item_conv_class",$sformatf("After converting fromWriteClass delayForWvalid =  %0d",outputConv.delayForWvalid),UVM_HIGH);

  outputConv.delayForBready = inputConv.delayForBready;
  `uvm_info("axi4Lite_masterWrite_seq_item_conv_class",$sformatf("After converting fromWriteClass delayForBready =  %0d",outputConv.delayForBready),UVM_HIGH);

  outputConv.waitCounterForAwready = inputConv.waitCounterForAwready;
  `uvm_info("axi4Lite_masterWrite_seq_item_conv_class",$sformatf("After converting fromWriteClass waitCounterForAwready =  %0d",outputConv.waitCounterForAwready),UVM_HIGH);

  outputConv.waitCounterForWready = inputConv.waitCounterForWready;
  `uvm_info("axi4Lite_masterWrite_seq_item_conv_class",$sformatf("After converting fromWriteClass waitCounterForWready =  %0d",outputConv.waitCounterForWready),UVM_HIGH);
  
  outputConv.waitCounterForBvalid = inputConv.waitCounterForBvalid;
  `uvm_info("axi4Lite_masterWrite_seq_item_conv_class",$sformatf("After converting fromWriteClass waitCounterForBvalid =  %0d",outputConv.waitCounterForBvalid),UVM_HIGH);

  outputConv.repeatToggleReady  = inputConv.repeatToggleReady;
endfunction : fromWriteClass

function void Axi4LiteMasterWriteSeqItemConverter::toWriteClass(input axi4LiteWriteMasterTransferPacketStruct inputConv, output Axi4LiteMasterWriteTransaction outputConv);

  `uvm_info("axi4_master_seq_item_conv_class",$sformatf("----------------------------------------------------------------------"),UVM_HIGH);
 
  outputConv = new();

  outputConv.awaddr = inputConv.awaddr;
  `uvm_info("axi4_master_seq_item_conv_class",$sformatf("After converting toWriteClass awaddr =  %0h",outputConv.awaddr),UVM_HIGH);

  outputConv.awprot = awprotEnum'(inputConv.awprot);
  `uvm_info("axi4Lite_masterWrite_seq_item_conv_class",$sformatf("After converting toWriteClass awprot =  %0b",outputConv.awprot),UVM_HIGH);

  outputConv.wdata = inputConv.wdata;
  `uvm_info("axi4Lite_masterWrite_seq_item_conv_class",$sformatf("After converting toWriteClass wdata =  %0h",outputConv.wdata),UVM_HIGH);

  outputConv.wstrb = inputConv.wstrb;
  `uvm_info("axi4Lite_masterWrite_seq_item_conv_class",$sformatf("After converting toWriteClass wstrb =  %0b",outputConv.wstrb),UVM_HIGH);

  outputConv.bresp = brespEnum'(inputConv.bresp);
  `uvm_info("axi4Lite_masterWrite_seq_item_conv_class",$sformatf("After converting toWriteClass bresp =  %0b",outputConv.bresp),UVM_HIGH);

  outputConv.delayForAwvalid = inputConv.delayForAwvalid;
  `uvm_info("axi4Lite_masterWrite_seq_item_conv_class",$sformatf("After converting toWriteClass delayForAwvalid =  %0d",outputConv.delayForAwvalid),UVM_HIGH);

 outputConv.delayForWvalid = inputConv.delayForWvalid;
  `uvm_info("axi4Lite_masterWrite_seq_item_conv_class",$sformatf("After converting toWriteClass delayForWvalid =  %0d",outputConv.delayForWvalid),UVM_HIGH);

  outputConv.delayForBready = inputConv.delayForBready;
  `uvm_info("axi4Lite_masterWrite_seq_item_conv_class",$sformatf("After converting toWriteClass delayForBready =  %0d",outputConv.delayForBready),UVM_HIGH);

  outputConv.waitCounterForAwready = inputConv.waitCounterForAwready;
  `uvm_info("axi4Lite_masterWrite_seq_item_conv_class",$sformatf("After converting toWriteClass waitCounterForAwready =  %0d",outputConv.waitCounterForAwready),UVM_HIGH);

  outputConv.waitCounterForWready = inputConv.waitCounterForWready;
  `uvm_info("axi4Lite_masterWrite_seq_item_conv_class",$sformatf("After converting toWriteClass waitCounterForWready =  %0d",outputConv.waitCounterForWready),UVM_HIGH);
  
  outputConv.waitCounterForBvalid = inputConv.waitCounterForBvalid;
  `uvm_info("axi4Lite_masterWrite_seq_item_conv_class",$sformatf("After converting toWriteClass waitCounterForBvalid =  %0d",outputConv.waitCounterForBvalid),UVM_HIGH);

endfunction : toWriteClass


function void Axi4LiteMasterWriteSeqItemConverter::do_print(uvm_printer printer);
  axi4LiteWriteMasterTransferPacketStruct writePacketStruct; 
  super.do_print(printer);
  
  printer.print_field("awaddr",writePacketStruct.awaddr,$bits(writePacketStruct.awaddr),UVM_DEC);
  printer.print_field("awprot",writePacketStruct.awprot,$bits(writePacketStruct.awprot),UVM_DEC);
  printer.print_field("wdatat",writePacketStruct.wdata,$bits(writePacketStruct.wdata),UVM_DEC);
  printer.print_field("wstrb",writePacketStruct.wstrb,$bits(writePacketStruct.wstrb),UVM_DEC);
  printer.print_field("bresp",writePacketStruct.bresp,$bits(writePacketStruct.bresp),UVM_DEC);
endfunction : do_print

`endif
