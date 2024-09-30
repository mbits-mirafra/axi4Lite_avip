`ifndef AXI4LITEMASTERWRITETRANSACTION_INCLUDED_
`define AXI4LITEMASTERWRITETRANSACTION_INCLUDED_

class Axi4LiteMasterWriteTransaction extends uvm_sequence_item;
  `uvm_object_utils(Axi4LiteMasterWriteTransaction)

  Axi4LiteMasterWriteAgentConfig axi4LiteMasterWriteAgentConfig; 

  rand bit [ADDRESS_WIDTH-1:0] awaddr;
  rand awprotEnum awprot;
  rand bit [DATA_WIDTH-1:0] wdata;
  rand bit [(DATA_WIDTH/8)-1:0] wstrb;
  brespEnum bresp;

  int waitCounterForAwready;
  int waitCounterForWready;
  int waitCounterForBvalid;

  rand bit [DELAY_WIDTH-1:0] delayForAwvalid;
  rand bit [DELAY_WIDTH-1:0] delayForWvalid;
  rand bit [DELAY_WIDTH-1:0] delayForBready;
  rand int repeatToggleBready;

  constraint awaddr_c {soft awaddr <= MAX_ADDRESS;}
  constraint awprot_c {soft awprot inside {[0:3]};}
  constraint delayForWvalid_c {soft delayForWvalid <= MAX_DELAY_WVALID;}
  constraint delayForBready_c {soft delayForBready <= MAX_DELAY_READY;}

  extern function new (string name = "Axi4LiteMasterWriteTransaction");
  extern function void do_copy(uvm_object rhs);
  extern function void post_randomize();
  extern function bit do_compare(uvm_object rhs, uvm_comparer comparer);
  extern function void do_print(uvm_printer printer);
endclass : Axi4LiteMasterWriteTransaction

function Axi4LiteMasterWriteTransaction::new(string name = "Axi4LiteMasterWriteTransaction");
  super.new(name);
endfunction : new

function void Axi4LiteMasterWriteTransaction::post_randomize();

endfunction : post_randomize

function void Axi4LiteMasterWriteTransaction::do_copy(uvm_object rhs);
  Axi4LiteMasterWriteTransaction axi4LiteMasterWriteTxCopyObj;

  if(!$cast(axi4LiteMasterWriteTxCopyObj,rhs)) begin
    `uvm_fatal("do_copy","cast of the rhs object failed")
  end
  super.do_copy(rhs);
  awaddr  = axi4LiteMasterWriteTxCopyObj.awaddr;
  awprot  = axi4LiteMasterWriteTxCopyObj.awprot;
  wdata   = axi4LiteMasterWriteTxCopyObj.wdata;
  wstrb   = axi4LiteMasterWriteTxCopyObj.wstrb;
  bresp   = axi4LiteMasterWriteTxCopyObj.bresp;
  delayForAwvalid = axi4LiteMasterWriteTxCopyObj.delayForAwvalid;
  delayForWvalid = axi4LiteMasterWriteTxCopyObj.delayForWvalid;
  delayForBready = axi4LiteMasterWriteTxCopyObj.delayForBready;
  repeatToggleBready = axi4LiteMasterWriteTxCopyObj.repeatToggleBready;

endfunction : do_copy

function bit Axi4LiteMasterWriteTransaction::do_compare (uvm_object rhs, uvm_comparer comparer);
  Axi4LiteMasterWriteTransaction axi4LiteMasterWriteTxCompareObj;

  if(!$cast(axi4LiteMasterWriteTxCompareObj,rhs)) begin
    `uvm_fatal("FATAL_axi_MASTER_TX_DO_COMPARE_FAILED","cast of the rhs object failed")
    return 0;
  end
  
  return super.do_compare(axi4LiteMasterWriteTxCompareObj, comparer) && 
  awaddr  == axi4LiteMasterWriteTxCompareObj.awaddr  &&
  awprot  == axi4LiteMasterWriteTxCompareObj.awprot  &&
  wdata   == axi4LiteMasterWriteTxCompareObj.wdata   &&
  wstrb   == axi4LiteMasterWriteTxCompareObj.wstrb   &&
  bresp   == axi4LiteMasterWriteTxCompareObj.bresp   &&
  delayForAwvalid == axi4LiteMasterWriteTxCompareObj.delayForAwvalid &&
  delayForWvalid == axi4LiteMasterWriteTxCompareObj.delayForWvalid &&
  delayForBready == axi4LiteMasterWriteTxCompareObj.delayForBready &&
  repeatToggleBready == axi4LiteMasterWriteTxCompareObj.repeatToggleBready;

endfunction : do_compare

function void Axi4LiteMasterWriteTransaction::do_print(uvm_printer printer);

   printer.print_field("awaddr",awaddr,$bits(awaddr),UVM_HEX);
   printer.print_string("awprot",awprot.name());
   printer.print_field("wdata",wdata,$bits(wdata),UVM_HEX);
   printer.print_field("wstrb",wstrb,$bits(wstrb),UVM_HEX);
   printer.print_string("bresp",bresp.name());
   printer.print_field("delayForAwvalid",delayForAwvalid,$bits(delayForAwvalid),UVM_HEX);
   printer.print_field("delayForWvalid",delayForWvalid,$bits(delayForWvalid),UVM_HEX);
   printer.print_field("delayForBready",delayForBready,$bits(delayForBready),UVM_HEX);
   printer.print_field("repeatToggleBready",repeatToggleBready,$bits(repeatToggleBready),UVM_HEX);

endfunction : do_print
`endif

