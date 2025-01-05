`ifndef SLAVEVIPMASTERIPVIRTUALSEQUENCER_INCLUDED_
`define SLAVEVIPMASTERIPVIRTUALSEQUENCER_INCLUDED_

class SlaveVIPMasterIPVirtualSequencer extends uvm_sequencer#(uvm_sequence_item);
  `uvm_component_utils(SlaveVIPMasterIPVirtualSequencer)

  Axi4LiteSlaveVirtualSequencer axi4LiteSlaveVirtualSequencer;

  extern function new(string name = "SlaveVIPMasterIPVirtualSequencer", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void connect_phase(uvm_phase phase);
  extern virtual function void end_of_elaboration_phase(uvm_phase phase);
  extern virtual function void start_of_simulation_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : SlaveVIPMasterIPVirtualSequencer

function SlaveVIPMasterIPVirtualSequencer::new(string name = "SlaveVIPMasterIPVirtualSequencer",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void SlaveVIPMasterIPVirtualSequencer::build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction : build_phase

function void SlaveVIPMasterIPVirtualSequencer::connect_phase(uvm_phase phase);
  super.connect_phase(phase);
endfunction : connect_phase

function void SlaveVIPMasterIPVirtualSequencer::end_of_elaboration_phase(uvm_phase phase);
  super.end_of_elaboration_phase(phase);
endfunction  : end_of_elaboration_phase

function void SlaveVIPMasterIPVirtualSequencer::start_of_simulation_phase(uvm_phase phase);
  super.start_of_simulation_phase(phase);
endfunction : start_of_simulation_phase


task SlaveVIPMasterIPVirtualSequencer::run_phase(uvm_phase phase);

  // Work here
  // ...

endtask : run_phase

`endif

