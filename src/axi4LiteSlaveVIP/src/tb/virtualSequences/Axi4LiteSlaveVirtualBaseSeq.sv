`ifndef AXI4LITESLAVEVIRTUALBASESEQ_INCLUDED_
`define AXI4LITESLAVEVIRTUALBASESEQ_INCLUDED_

class Axi4LiteSlaveVirtualBaseSeq extends uvm_sequence;
  `uvm_object_utils(Axi4LiteSlaveVirtualBaseSeq)

  `uvm_declare_p_sequencer(Axi4LiteSlaveVirtualSequencer);

  Axi4LiteSlaveEnvConfig axi4LiteSlaveEnvConfig;

  extern function new(string name = "Axi4LiteSlaveVirtualBaseSeq");
  extern task pre_body();
  extern task body();
  extern task post_body();

endclass : Axi4LiteSlaveVirtualBaseSeq

function Axi4LiteSlaveVirtualBaseSeq::new(string name = "Axi4LiteSlaveVirtualBaseSeq");
  super.new(name);
endfunction : new

task Axi4LiteSlaveVirtualBaseSeq::pre_body();

endtask : pre_body

task Axi4LiteSlaveVirtualBaseSeq::body();

  if (!uvm_config_db#(Axi4LiteSlaveEnvConfig)::get(
          null, get_full_name(), "Axi4LiteSlaveEnvConfig", axi4LiteSlaveEnvConfig
      )) begin
    `uvm_fatal("SLAVEENVCONFIG", "cannot get() ENV_cfg from uvm_config_db.Have you set() it?")
  end
  if (!$cast(p_sequencer, m_sequencer)) begin
    `uvm_error(get_full_name(), "Virtual sequencer pointer cast failed")
  end

endtask : body

task Axi4LiteSlaveVirtualBaseSeq::post_body();


endtask : post_body

`endif
