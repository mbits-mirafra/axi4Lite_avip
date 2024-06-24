`ifndef AXI4LITEMASTERVIRTUALBASESEQ_INCLUDED_
`define AXI4LITEMASTERVIRTUALBASESEQ_INCLUDED_

class Axi4LiteMasterVirtualBaseSeq extends uvm_sequence;
  `uvm_object_utils(Axi4LiteMasterVirtualBaseSeq)

  `uvm_declare_p_sequencer(Axi4LiteMasterVirtualSequencer);

  Axi4LiteMasterEnvConfig axi4LiteMasterEnvConfig;

  extern function new(string name = "Axi4LiteMasterVirtualBaseSeq");
  extern task pre_body();
  extern task body();
  extern task post_body();

endclass : Axi4LiteMasterVirtualBaseSeq

function Axi4LiteMasterVirtualBaseSeq::new(string name = "Axi4LiteMasterVirtualBaseSeq");
  super.new(name);
endfunction : new

task Axi4LiteMasterVirtualBaseSeq::pre_body();

endtask : pre_body

task Axi4LiteMasterVirtualBaseSeq::body();

  if (!uvm_config_db#(Axi4LiteMasterEnvConfig)::get(
          null, get_full_name(), "Axi4LiteMasterEnvConfig", axi4LiteMasterEnvConfig
      )) begin
    `uvm_fatal("MASTERENVCONFIG", "cannot get() ENV_cfg from uvm_config_db.Have you set() it?")
  end
  if (!$cast(p_sequencer, m_sequencer)) begin
    `uvm_error(get_full_name(), "Virtual sequencer pointer cast failed")
  end

endtask : body

task Axi4LiteMasterVirtualBaseSeq::post_body();


endtask : post_body

`endif
