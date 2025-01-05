`ifndef MASTERRTLTRANSACTION_INCLUDED_
`define MASTERRTLTRANSACTION_INCLUDED_

class MasterRTLTransaction extends uvm_sequence_item;
  `uvm_object_utils(MasterRTLTransaction)

  rand bit writeEnable;
  rand bit readEnable;

  rand logic [ADDRESS_WIDTH-1:0] awaddr;
  rand awprotEnum awprot;
  rand logic [DATA_WIDTH-1:0] wdata;
  rand logic [(DATA_WIDTH/8)-1:0] wstrb;

  rand logic [ADDRESS_WIDTH-1:0] araddr;
  rand arprotEnum arprot;

  constraint WRITEENABLE_CP{soft writeEnable == 0;}
  constraint READENABLE_CP{soft readEnable == 0;}

  extern function new (string name = "MasterRTLTransaction");
  extern function void do_copy(uvm_object rhs);
  extern function void post_randomize();
  extern function bit do_compare(uvm_object rhs, uvm_comparer comparer);
  extern function void do_print(uvm_printer printer);
endclass : MasterRTLTransaction

function MasterRTLTransaction::new(string name = "MasterRTLTransaction");
  super.new(name);
endfunction : new

function void MasterRTLTransaction::post_randomize();

endfunction : post_randomize

function void MasterRTLTransaction::do_copy(uvm_object rhs);
  MasterRTLTransaction masterRTLTransactionCopyObj;

  if(!$cast(masterRTLTransactionCopyObj,rhs)) begin
    `uvm_fatal("do_copy","cast of the rhs object failed")
  end
  super.do_copy(rhs);
  awaddr  = masterRTLTransactionCopyObj.awaddr;
  awprot  = masterRTLTransactionCopyObj.awprot;
  wdata   = masterRTLTransactionCopyObj.wdata;
  wstrb   = masterRTLTransactionCopyObj.wstrb;
  araddr  = masterRTLTransactionCopyObj.araddr;
  arprot  = masterRTLTransactionCopyObj.arprot;
  writeEnable = masterRTLTransactionCopyObj.writeEnable;
  readEnable = masterRTLTransactionCopyObj.readEnable;

endfunction : do_copy

function bit MasterRTLTransaction::do_compare (uvm_object rhs, uvm_comparer comparer);
  MasterRTLTransaction masterRTLTransactionCompareObj;

  if(!$cast(masterRTLTransactionCompareObj,rhs)) begin
    `uvm_fatal("FATAL_MASTERRTL_TX_DO_COMPARE_FAILED","cast of the rhs object failed")
    return 0;
  end
  
  return super.do_compare(masterRTLTransactionCompareObj, comparer) && 
  awaddr  == masterRTLTransactionCompareObj.awaddr  &&
  awprot  == masterRTLTransactionCompareObj.awprot  &&
  wdata   == masterRTLTransactionCompareObj.wdata   &&
  wstrb   == masterRTLTransactionCompareObj.wstrb   &&
  araddr  == masterRTLTransactionCompareObj.araddr  &&
  arprot  == masterRTLTransactionCompareObj.arprot  &&
  writeEnable == masterRTLTransactionCompareObj.writeEnable &&
  readEnable == masterRTLTransactionCompareObj.readEnable;

endfunction : do_compare

function void MasterRTLTransaction::do_print(uvm_printer printer);

   printer.print_field("awaddr",awaddr,$bits(awaddr),UVM_HEX);
   printer.print_string("awprot",awprot.name());
   printer.print_field("wdata",wdata,$bits(wdata),UVM_HEX);
   printer.print_field("wstrb",wstrb,$bits(wstrb),UVM_HEX);
   printer.print_field("araddr",araddr,$bits(araddr),UVM_HEX);
   printer.print_string("arprot",arprot.name());
   printer.print_field("writeEnable",writeEnable,$bits(writeEnable),UVM_BIN);
   printer.print_field("readEnable",readEnable,$bits(readEnable),UVM_BIN);

endfunction : do_print
`endif

