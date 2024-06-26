`ifndef AXI4LITEMASTERWRITETRANSACTION_INCLUDED_
`define AXI4LITEMASTERWRITETRANSACTION_INCLUDED_

class Axi4LiteMasterWriteTransaction extends uvm_sequence_item;
  `uvm_object_utils(Axi4LiteMasterWriteTransaction)

  Axi4LiteMasterWriteAgentConfig axi4LiteMasterWriteAgentConfig; 

  rand bit [ADDRESS_WIDTH-1:0] awaddr;
  brespEnum bresp;
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
  awaddr = axi4LiteMasterWriteTxCopyObj.awaddr;
  bresp  = axi4LiteMasterWriteTxCopyObj.bresp;

endfunction : do_copy

function bit Axi4LiteMasterWriteTransaction::do_compare (uvm_object rhs, uvm_comparer comparer);
  Axi4LiteMasterWriteTransaction axi4LiteMasterWriteTxCompareObj;

  if(!$cast(axi4LiteMasterWriteTxCompareObj,rhs)) begin
    `uvm_fatal("FATAL_axi_MASTER_TX_DO_COMPARE_FAILED","cast of the rhs object failed")
    return 0;
  end
  
  return super.do_compare(axi4LiteMasterWriteTxCompareObj, comparer) && 
  awaddr  == axi4LiteMasterWriteTxCompareObj.awaddr  &&
  bresp   == axi4LiteMasterWriteTxCompareObj.bresp; 

endfunction : do_compare

function void Axi4LiteMasterWriteTransaction::do_print(uvm_printer printer);

   printer.print_field("awaddr",awaddr,$bits(awaddr),UVM_HEX);
   printer.print_string("bresp",bresp.name());

endfunction : do_print

`endif

