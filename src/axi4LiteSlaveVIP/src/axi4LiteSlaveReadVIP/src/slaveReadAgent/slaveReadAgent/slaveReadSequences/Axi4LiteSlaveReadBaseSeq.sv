`ifndef AXI4LITESLAVEREADBASESEQ_INCLUDED_
`define AXI4LITESLAVEREADBASESEQ_INCLUDED_

class Axi4LiteSlaveReadBaseSeq extends uvm_sequence #(Axi4LiteSlaveReadTransaction);
  `uvm_object_utils(Axi4LiteSlaveReadBaseSeq)
  
  `uvm_declare_p_sequencer(Axi4LiteSlaveReadSequencer)

  extern function new(string name = "Axi4LiteSlaveReadBaseSeq");
  extern task body();
endclass : Axi4LiteSlaveReadBaseSeq

function Axi4LiteSlaveReadBaseSeq::new(string name = "Axi4LiteSlaveReadBaseSeq");
  super.new(name);
endfunction : new

task Axi4LiteSlaveReadBaseSeq::body();
  req = Axi4LiteSlaveReadTransaction::type_id::create("req");
  //dynamic casting of p_sequencer and m_sequencer
  if(!$cast(p_sequencer,m_sequencer))begin
    `uvm_error(get_full_name(),"Virtual sequencer pointer cast failed")
  end
endtask : body

`endif
