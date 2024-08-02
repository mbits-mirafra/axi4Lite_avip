`ifndef AXI4LITESLAVEREADTRANSACTION_INCLUDED_
`define AXI4LITESLAVEREADTRANSACTION_INCLUDED_

class Axi4LiteSlaveReadTransaction extends uvm_sequence_item;
  `uvm_object_utils(Axi4LiteSlaveReadTransaction)
  
  bit [ADDRESS_WIDTH-1:0] araddr;
  arprotEnum arprot;
  rand bit [DATA_WIDTH-1:0] rdata;
  rand rrespEnum rresp;

  int waitCounterForRready;

  rand bit [DELAY_WIDTH-1:0] delayForArready;
  rand bit [DELAY_WIDTH-1:0] delayForRvalid;
  rand int repeatToggleReady;

  constraint delayForArready_c {soft delayForArready <= MAX_DELAY_READY;}
  constraint delayForRvalid_c {soft delayForRvalid <= MAX_DELAY_RVALID;}

  extern function new(string name = "Axi4LiteSlaveReadTransaction");
  extern function void do_copy(uvm_object rhs);
  extern function bit do_compare (uvm_object rhs, uvm_comparer comparer);
  extern function void do_print(uvm_printer printer);

endclass : Axi4LiteSlaveReadTransaction

function Axi4LiteSlaveReadTransaction::new(string name = "Axi4LiteSlaveReadTransaction");
  super.new(name);
endfunction : new

function void Axi4LiteSlaveReadTransaction::do_copy (uvm_object rhs);
  Axi4LiteSlaveReadTransaction axi4LiteSlaveReadTxCopyObj;

  if(!$cast(axi4LiteSlaveReadTxCopyObj,rhs )) begin
    `uvm_fatal("do_copy","cast of the rhs object failed")
  end

  super.do_copy(rhs);

  araddr = axi4LiteSlaveReadTxCopyObj.araddr;
  arprot = axi4LiteSlaveReadTxCopyObj.arprot;
  rdata = axi4LiteSlaveReadTxCopyObj.rdata;
  rresp = axi4LiteSlaveReadTxCopyObj.rresp;
  delayForArready = axi4LiteSlaveReadTxCopyObj.delayForArready;
  delayForRvalid = axi4LiteSlaveReadTxCopyObj.delayForRvalid;
  repeatToggleReady = axi4LiteSlaveReadTxCopyObj.repeatToggleReady;

endfunction : do_copy

function bit Axi4LiteSlaveReadTransaction::do_compare (uvm_object rhs, uvm_comparer comparer);
  Axi4LiteSlaveReadTransaction axi4LiteSlaveReadTxCompareObj;

  if(!$cast(axi4LiteSlaveReadTxCompareObj,rhs)) begin
    `uvm_fatal("FATAL_axi_SLAVE_TX_DO_COMPARE_FAILED","cast of the rhs object failed")
  return 0;
  end

  return super.do_compare(axi4LiteSlaveReadTxCompareObj, comparer) &&
  araddr   == axi4LiteSlaveReadTxCompareObj.araddr   &&
  arprot   == axi4LiteSlaveReadTxCompareObj.arprot   &&
  rresp   == axi4LiteSlaveReadTxCompareObj.rresp   &&
  rdata   == axi4LiteSlaveReadTxCompareObj.rdata   &&
  delayForArready == axi4LiteSlaveReadTxCompareObj.delayForArready &&
  delayForRvalid == axi4LiteSlaveReadTxCompareObj.delayForRvalid &&
  repeatToggleReady == axi4LiteSlaveReadTxCompareObj.repeatToggleReady;

endfunction : do_compare

function void Axi4LiteSlaveReadTransaction::do_print(uvm_printer printer);
   printer.print_field("araddr",araddr,$bits(araddr),UVM_HEX);
   printer.print_string("arprot",arprot.name());
   printer.print_field("rdata",rdata,$bits(rdata),UVM_HEX);
   printer.print_string("rresp",rresp.name());
   printer.print_field("delayForArready",delayForArready,$bits(delayForArready),UVM_HEX);
   printer.print_field("delayForRvalid",delayForRvalid,$bits(delayForRvalid),UVM_HEX);
   printer.print_field("repeatToggleReady",repeatToggleReady,$bits(repeatToggleReady),UVM_HEX);
endfunction : do_print

`endif

