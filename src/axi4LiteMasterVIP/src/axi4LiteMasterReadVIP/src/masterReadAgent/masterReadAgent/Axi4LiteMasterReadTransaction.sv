`ifndef AXI4LITEMASTERREADTRANSACTION_INCLUDED_
`define AXI4LITEMASTERREADTRANSACTION_INCLUDED_

class Axi4LiteMasterReadTransaction extends uvm_sequence_item;
  `uvm_object_utils(Axi4LiteMasterReadTransaction)

  Axi4LiteMasterReadAgentConfig axi4LiteMasterReadAgentConfig; 

  rand bit [ADDRESS_WIDTH-1:0] araddr;
  rand arprotEnum arprot;
  bit [DATA_WIDTH-1:0] rdata;
  rrespEnum rresp;

  int waitCounterForArready;
  int waitCounterForRvalid;

  rand bit [DELAY_WIDTH-1:0] delayForArvalid;
  rand bit [DELAY_WIDTH-1:0] delayForRready;
  rand int repeatToggleRready;

  constraint arprot_c {soft arprot inside {[0:3]};}
  constraint delayForArvalid_c {soft delayForArvalid <= MAX_DELAY_READY;}
  constraint delayForRready_c  {soft delayForRready  <= MAX_DELAY_READY;}

  extern function new (string name = "Axi4LiteMasterReadTransaction");
  extern function void do_copy(uvm_object rhs);
  extern function void post_randomize();
  extern function bit do_compare(uvm_object rhs, uvm_comparer comparer);
  extern function void do_print(uvm_printer printer);
endclass : Axi4LiteMasterReadTransaction

function Axi4LiteMasterReadTransaction::new(string name = "Axi4LiteMasterReadTransaction");
  super.new(name);
endfunction : new

function void Axi4LiteMasterReadTransaction::post_randomize();

endfunction : post_randomize

function void Axi4LiteMasterReadTransaction::do_copy(uvm_object rhs);
  Axi4LiteMasterReadTransaction axi4LiteMasterReadTxCopyObj;

  if(!$cast(axi4LiteMasterReadTxCopyObj,rhs)) begin
    `uvm_fatal("do_copy","cast of the rhs object failed")
  end
  super.do_copy(rhs);

  araddr = axi4LiteMasterReadTxCopyObj.araddr;
  arprot = axi4LiteMasterReadTxCopyObj.arprot;
  rdata = axi4LiteMasterReadTxCopyObj.rdata;
  rresp = axi4LiteMasterReadTxCopyObj.rresp;
  delayForArvalid = axi4LiteMasterReadTxCopyObj.delayForArvalid;
  delayForRready  = axi4LiteMasterReadTxCopyObj.delayForRready;
  repeatToggleRready  = axi4LiteMasterReadTxCopyObj.repeatToggleRready;

  endfunction : do_copy

function bit Axi4LiteMasterReadTransaction::do_compare (uvm_object rhs, uvm_comparer comparer);
  Axi4LiteMasterReadTransaction axi4LiteMasterReadTxCompareObj;

  if(!$cast(axi4LiteMasterReadTxCompareObj,rhs)) begin
    `uvm_fatal("FATAL_axi_MASTER_TX_DO_COMPARE_FAILED","cast of the rhs object failed")
    return 0;
  end
  
  return super.do_compare(axi4LiteMasterReadTxCompareObj, comparer) && 
  araddr   == axi4LiteMasterReadTxCompareObj.araddr   &&
  arprot   == axi4LiteMasterReadTxCompareObj.arprot   &&
  rresp   == axi4LiteMasterReadTxCompareObj.rresp   &&
  rdata   == axi4LiteMasterReadTxCompareObj.rdata   &&
  delayForArvalid == axi4LiteMasterReadTxCompareObj.delayForArvalid &&
  delayForRready  == axi4LiteMasterReadTxCompareObj.delayForRready &&
  repeatToggleRready  == axi4LiteMasterReadTxCompareObj.repeatToggleRready;

endfunction : do_compare

function void Axi4LiteMasterReadTransaction::do_print(uvm_printer printer);

   printer.print_field("araddr",araddr,$bits(araddr),UVM_HEX);
   printer.print_string("arprot",arprot.name());
   printer.print_field("rdata",rdata,$bits(rdata),UVM_HEX);
   printer.print_string("rresp",rresp.name());
   printer.print_field("delayForArvalid",delayForArvalid,$bits(delayForArvalid),UVM_HEX);
   printer.print_field("delayForRready",delayForRready,$bits(delayForRready),UVM_HEX);
   printer.print_field("repeatToggleRready",repeatToggleRready,$bits(repeatToggleRready),UVM_HEX);
endfunction : do_print

`endif

