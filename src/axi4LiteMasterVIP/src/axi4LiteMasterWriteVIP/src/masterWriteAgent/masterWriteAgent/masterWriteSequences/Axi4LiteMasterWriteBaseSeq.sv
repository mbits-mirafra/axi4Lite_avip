`ifndef AXI4LITEMASTERWRITEBASESEQ_INCLUDED_
`define AXI4LITEMASTERWRITEBASESEQ_INCLUDED_

class Axi4LiteMasterWriteBaseSeq extends uvm_sequence #(Axi4LiteMasterWriteTransaction);
  `uvm_object_utils(Axi4LiteMasterWriteBaseSeq)
  
  extern function new(string name = "Axi4LiteMasterWriteBaseSeq");
  extern task body();

endclass : Axi4LiteMasterWriteBaseSeq

function Axi4LiteMasterWriteBaseSeq::new(string name = "Axi4LiteMasterWriteBaseSeq");
  super.new(name);
endfunction : new

task Axi4LiteMasterWriteBaseSeq::body();

endtask : body

`endif
