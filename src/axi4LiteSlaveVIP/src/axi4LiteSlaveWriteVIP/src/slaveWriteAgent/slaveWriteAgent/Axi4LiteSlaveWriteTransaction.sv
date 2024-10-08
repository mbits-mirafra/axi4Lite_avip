`ifndef AXI4LITESLAVEWRITETRANSACTION_INCLUDED_
`define AXI4LITESLAVEWRITETRANSACTION_INCLUDED_

class Axi4LiteSlaveWriteTransaction extends uvm_sequence_item;
  `uvm_object_utils(Axi4LiteSlaveWriteTransaction)
  
  logic [ADDRESS_WIDTH-1:0] awaddr;
  awprotEnum awprot;
  logic [DATA_WIDTH-1:0] wdata;
  logic [(DATA_WIDTH/8)-1:0] wstrb;
  rand brespEnum bresp;

  rand bit [DELAY_WIDTH-1:0] delayForAwready;
  rand bit [DELAY_WIDTH-1:0] delayForWready;
  rand bit [DELAY_WIDTH-1:0] delayForBvalid;
  rand int repeatToggleAwready;
  rand int repeatToggleWready;

  int waitCounterForWvalid;
  int waitCounterForBready;

  extern function new(string name = "Axi4LiteSlaveWriteTransaction");
  extern function void do_copy(uvm_object rhs);
  extern function bit do_compare (uvm_object rhs, uvm_comparer comparer);
  extern function void do_print(uvm_printer printer);

endclass : Axi4LiteSlaveWriteTransaction

function Axi4LiteSlaveWriteTransaction::new(string name = "Axi4LiteSlaveWriteTransaction");
  super.new(name);
endfunction : new

function void Axi4LiteSlaveWriteTransaction::do_copy (uvm_object rhs);
  Axi4LiteSlaveWriteTransaction axi4LiteSlaveWriteTxCopyObj;

  if(!$cast(axi4LiteSlaveWriteTxCopyObj,rhs )) begin
    `uvm_fatal("do_copy","cast of the rhs object failed")
  end
  super.do_copy(rhs);
  awaddr  = axi4LiteSlaveWriteTxCopyObj.awaddr;
  awprot  = axi4LiteSlaveWriteTxCopyObj.awprot;
  wdata   = axi4LiteSlaveWriteTxCopyObj.wdata;
  wstrb   = axi4LiteSlaveWriteTxCopyObj.wstrb;
  bresp   = axi4LiteSlaveWriteTxCopyObj.bresp;
  delayForAwready = axi4LiteSlaveWriteTxCopyObj.delayForAwready; 
  delayForWready = axi4LiteSlaveWriteTxCopyObj.delayForWready; 
  delayForBvalid = axi4LiteSlaveWriteTxCopyObj.delayForBvalid; 
  repeatToggleAwready = axi4LiteSlaveWriteTxCopyObj.repeatToggleAwready; 
  repeatToggleWready = axi4LiteSlaveWriteTxCopyObj.repeatToggleWready; 
endfunction : do_copy

function bit Axi4LiteSlaveWriteTransaction::do_compare (uvm_object rhs, uvm_comparer comparer);
  Axi4LiteSlaveWriteTransaction axi4LiteSlaveWriteTxCompareObj;

  if(!$cast(axi4LiteSlaveWriteTxCompareObj,rhs)) begin
    `uvm_fatal("FATAL_axi_SLAVE_TX_DO_COMPARE_FAILED","cast of the rhs object failed")
  return 0;
  end

  return super.do_compare(axi4LiteSlaveWriteTxCompareObj, comparer) &&
  awaddr  == axi4LiteSlaveWriteTxCompareObj.awaddr  &&
  awprot  == axi4LiteSlaveWriteTxCompareObj.awprot  &&
  wdata   == axi4LiteSlaveWriteTxCompareObj.wdata   &&
  wstrb   == axi4LiteSlaveWriteTxCompareObj.wstrb   &&
  bresp   == axi4LiteSlaveWriteTxCompareObj.bresp   &&
  delayForAwready == axi4LiteSlaveWriteTxCompareObj.delayForAwready &&
  delayForWready == axi4LiteSlaveWriteTxCompareObj.delayForWready &&
  delayForBvalid == axi4LiteSlaveWriteTxCompareObj.delayForBvalid &&
  repeatToggleAwready == axi4LiteSlaveWriteTxCompareObj.repeatToggleAwready &&
  repeatToggleWready == axi4LiteSlaveWriteTxCompareObj.repeatToggleWready;

endfunction : do_compare

function void Axi4LiteSlaveWriteTransaction::do_print(uvm_printer printer);
  printer.print_field("awaddr",awaddr,$bits(awaddr),UVM_HEX);
  printer.print_string("awprot",awprot.name());
  printer.print_field("wdata",wdata,$bits(wdata),UVM_HEX);
  printer.print_field("wstrb",wstrb,$bits(wstrb),UVM_HEX);
  printer.print_string("bresp",bresp.name());
  printer.print_field($sformatf("delayForAwready"),this.delayForAwready,$bits(delayForAwready),UVM_HEX);
  printer.print_field($sformatf("delayForWready"),this.delayForWready,$bits(delayForWready),UVM_HEX);
  printer.print_field($sformatf("delayForBvalid"),this.delayForBvalid,$bits(delayForBvalid),UVM_HEX);
  printer.print_field($sformatf("repeatToggleAwready"),this.repeatToggleAwready,$bits(repeatToggleAwready),UVM_HEX);
  printer.print_field($sformatf("repeatToggleWready"),this.repeatToggleWready,$bits(repeatToggleWready),UVM_HEX);
endfunction : do_print

`endif

