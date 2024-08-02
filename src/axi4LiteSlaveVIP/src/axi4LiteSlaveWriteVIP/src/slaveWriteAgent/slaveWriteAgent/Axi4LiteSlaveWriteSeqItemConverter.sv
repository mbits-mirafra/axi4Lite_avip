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


  outputConv.bresp = brespEnum'(inputConv.bresp);
  `uvm_info("axi4Lite_masterWrite_seq_item_conv_class",$sformatf("After converting fromWriteClass bresp =  %0b",outputConv.bresp),UVM_HIGH);

  outputConv.delayForAwready = inputConv.delayForAwready;
  `uvm_info("axi4Lite_masterWrite_seq_item_conv_class",$sformatf("After converting fromWriteClass delayForAwready =  %0h",outputConv.delayForAwready),UVM_HIGH);

  outputConv.delayForWready  = inputConv.delayForWready;
  `uvm_info("axi4Lite_masterWrite_seq_item_conv_class",$sformatf("After converting fromWriteClass delayForWready =  %0h",outputConv.delayForWready),UVM_HIGH);

  outputConv.delayForBvalid  = inputConv.delayForBvalid;
  `uvm_info("axi4Lite_masterWrite_seq_item_conv_class",$sformatf("After converting fromWriteClass delayForBvalid =  %0h",outputConv.delayForBvalid),UVM_HIGH);

  outputConv.repeatToggleReady  = inputConv.repeatToggleReady;
endfunction : fromWriteClass

function void  Axi4LiteSlaveWriteSeqItemConverter::toWriteClass(input axi4LiteWriteSlaveTransferPacketStruct inputConv, output Axi4LiteSlaveWriteTransaction outputConv);
  `uvm_info("axi4Lite_Slave_Write_Seq_item_conv_class",$sformatf("--------------------------------------------toWriteClass--------------------------"),UVM_HIGH);
 
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

  outputConv.delayForAwready = inputConv.delayForAwready;
  `uvm_info("axi4Lite_masterWrite_seq_item_conv_class",$sformatf("After converting toWriteClass delayForAwready =  %0d",outputConv.delayForAwready),UVM_HIGH);

  outputConv.delayForWready = inputConv.delayForWready;
  `uvm_info("axi4Lite_masterWrite_seq_item_conv_class",$sformatf("After converting toWriteClass delayForWready =  %0d",outputConv.delayForWready),UVM_HIGH);

  outputConv.delayForBvalid = inputConv.delayForBvalid;
  `uvm_info("axi4Lite_masterWrite_seq_item_conv_class",$sformatf("After converting toWriteClass delayForBvalid =  %0d",outputConv.delayForBvalid),UVM_HIGH);

  outputConv.waitCounterForWvalid = inputConv.waitCounterForWvalid;
  `uvm_info("axi4Lite_masterWrite_seq_item_conv_class",$sformatf("After converting toWriteClass waitCounterForWvalid =  %0d",outputConv.waitCounterForWvalid),UVM_HIGH);

 outputConv.waitCounterForBready = inputConv.waitCounterForBready;
  `uvm_info("axi4Lite_masterWrite_seq_item_conv_class",$sformatf("After converting toWriteClass waitCounterForBready =  %0d",outputConv.waitCounterForBready),UVM_HIGH);


endfunction : toWriteClass

function void Axi4LiteSlaveWriteSeqItemConverter::do_print(uvm_printer printer);
  axi4LiteWriteSlaveTransferPacketStruct writePacketStruct; 
  super.do_print(printer);
  printer.print_field("awaddr",writePacketStruct.awaddr,$bits(writePacketStruct.awaddr),UVM_DEC);
  printer.print_field("awprot",writePacketStruct.awprot,$bits(writePacketStruct.awprot),UVM_DEC);
  printer.print_field("wdatat",writePacketStruct.wdata,$bits(writePacketStruct.wdata),UVM_DEC);
  printer.print_field("wstrb",writePacketStruct.wstrb,$bits(writePacketStruct.wstrb),UVM_DEC);
  printer.print_field("bresp",writePacketStruct.bresp,$bits(writePacketStruct.bresp),UVM_DEC);
  printer.print_field("delayForAwready",writePacketStruct.delayForAwready,$bits(writePacketStruct.delayForAwready),UVM_HEX);
  printer.print_field("delayForWready",writePacketStruct.delayForWready,$bits(writePacketStruct.delayForWready),UVM_HEX);
  printer.print_field("delayForBvalid",writePacketStruct.delayForBvalid,$bits(writePacketStruct.delayForBvalid),UVM_HEX);
endfunction : do_print

`endif
