`ifndef SLAVEVIPMASTERIPVIRTUALBASESEQ_INCLUDED_
`define SLAVEVIPMASTERIPVIRTUALBASESEQ_INCLUDED_

class SlaveVIPMasterIPVirtualBaseSeq extends uvm_sequence#(uvm_sequence_item);
  `uvm_object_utils(SlaveVIPMasterIPVirtualBaseSeq)

  `uvm_declare_p_sequencer(SlaveVIPMasterIPVirtualSequencer);

  SlaveVIPMasterIPEnvConfig slaveVIPMasterIPEnvConfig;

  extern function new(string name = "SlaveVIPMasterIPVirtualBaseSeq");
  extern task pre_body();
  extern task body();
  extern task post_body();

endclass : SlaveVIPMasterIPVirtualBaseSeq

function SlaveVIPMasterIPVirtualBaseSeq::new(string name = "SlaveVIPMasterIPVirtualBaseSeq");
  super.new(name);
endfunction : new

task SlaveVIPMasterIPVirtualBaseSeq::pre_body();

endtask : pre_body

task SlaveVIPMasterIPVirtualBaseSeq::body();

  if (!uvm_config_db#(SlaveVIPMasterIPEnvConfig)::get(
          null, get_full_name(), "SlaveVIPMasterIPEnvConfig", slaveVIPMasterIPEnvConfig
      )) begin
    `uvm_fatal("ENVCONFIG", "cannot get() ENV_cfg from uvm_config_db.Have you set() it?")
  end
  if (!$cast(p_sequencer, m_sequencer)) begin
    `uvm_error(get_full_name(), "Virtual sequencer pointer cast failed")
  end

endtask : body

task SlaveVIPMasterIPVirtualBaseSeq::post_body();


endtask : post_body

`endif
