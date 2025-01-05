`ifndef MASTERRTLBASESEQ_INCLUDED_
`define MASTERRTLBASESEQ_INCLUDED_

class MasterRTLBaseSeq extends uvm_sequence #(MasterRTLTransaction);
  `uvm_object_utils(MasterRTLBaseSeq)
  
  `uvm_declare_p_sequencer(MasterRTLSequencer)

  extern function new(string name = "MasterRTLBaseSeq");
  extern task body();

endclass : MasterRTLBaseSeq

function MasterRTLBaseSeq::new(string name = "MasterRTLBaseSeq");
  super.new(name);
endfunction : new

task MasterRTLBaseSeq::body();
  req = MasterRTLTransaction::type_id::create("req"); 
  //dynamic casting of p_sequencer and m_sequencer
  if(!$cast(p_sequencer,m_sequencer))begin
    `uvm_error(get_full_name(),"Virtual sequencer pointer cast failed")
  end
endtask : body

`endif
