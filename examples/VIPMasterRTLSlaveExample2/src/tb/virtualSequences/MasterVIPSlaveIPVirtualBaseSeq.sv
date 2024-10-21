`ifndef MASTERVIPSLAVEIPVIRTUALBASESEQ_INCLUDED_
`define MASTERVIPSLAVEIPVIRTUALBASESEQ_INCLUDED_

class MasterVIPSlaveIPVirtualBaseSeq extends uvm_sequence#(uvm_sequence_item);
  `uvm_object_utils(MasterVIPSlaveIPVirtualBaseSeq)

  `uvm_declare_p_sequencer(MasterVIPSlaveIPVirtualSequencer);

  MasterVIPSlaveIPEnvConfig masterVIPSlaveIPEnvConfig;

  extern function new(string name = "MasterVIPSlaveIPVirtualBaseSeq");
  extern task pre_body();
  extern task body();
  extern task post_body();

endclass : MasterVIPSlaveIPVirtualBaseSeq

function MasterVIPSlaveIPVirtualBaseSeq::new(string name = "MasterVIPSlaveIPVirtualBaseSeq");
  super.new(name);
endfunction : new

task MasterVIPSlaveIPVirtualBaseSeq::pre_body();

endtask : pre_body

task MasterVIPSlaveIPVirtualBaseSeq::body();

  if (!uvm_config_db#(MasterVIPSlaveIPEnvConfig)::get(
          null, get_full_name(), "MasterVIPSlaveIPEnvConfig", masterVIPSlaveIPEnvConfig
      )) begin
    `uvm_fatal("ENVCONFIG", "cannot get() ENV_cfg from uvm_config_db.Have you set() it?")
  end
  if (!$cast(p_sequencer, m_sequencer)) begin
    `uvm_error(get_full_name(), "Virtual sequencer pointer cast failed")
  end

endtask : body

task MasterVIPSlaveIPVirtualBaseSeq::post_body();


endtask : post_body

`endif
