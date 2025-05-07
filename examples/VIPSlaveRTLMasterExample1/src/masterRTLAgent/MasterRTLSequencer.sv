`ifndef MASTERRTLSEQUENCER_INCLUDED_
`define MASTERRTLSEQUENCER_INCLUDED_

class MasterRTLSequencer extends uvm_sequencer#(MasterRTLTransaction);
  `uvm_component_utils(MasterRTLSequencer)

  MasterRTLAgentConfig masterRTLAgentConfig;

  extern function new(string name = "MasterRTLSequencer", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void connect_phase(uvm_phase phase);
  extern virtual function void end_of_elaboration_phase(uvm_phase phase);
  extern virtual function void start_of_simulation_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : MasterRTLSequencer

function MasterRTLSequencer::new(string name = "MasterRTLSequencer",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void MasterRTLSequencer::build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction : build_phase

function void MasterRTLSequencer::connect_phase(uvm_phase phase);
  super.connect_phase(phase);
endfunction : connect_phase

function void MasterRTLSequencer::end_of_elaboration_phase(uvm_phase phase);
  super.end_of_elaboration_phase(phase);
endfunction  : end_of_elaboration_phase

function void MasterRTLSequencer::start_of_simulation_phase(uvm_phase phase);
  super.start_of_simulation_phase(phase);
endfunction : start_of_simulation_phase

task MasterRTLSequencer::run_phase(uvm_phase phase);

  `uvm_info("MasterRTLSequencer", "Sequencer run_phase started", UVM_LOW)

endtask : run_phase

`endif

