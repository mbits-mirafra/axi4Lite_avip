`ifndef MASTERVIPSLAVEIPVIRTUALSEQUENCER_INCLUDED_
`define MASTERVIPSLAVEIPVIRTUALSEQUENCER_INCLUDED_

class MasterVIPSlaveIPVirtualSequencer extends uvm_sequencer#(uvm_sequence_item);
  `uvm_component_utils(MasterVIPSlaveIPVirtualSequencer)

  Axi4LiteMasterVirtualSequencer axi4LiteMasterVirtualSequencer;

  extern function new(string name = "MasterVIPSlaveIPVirtualSequencer", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void connect_phase(uvm_phase phase);
  extern virtual function void end_of_elaboration_phase(uvm_phase phase);
  extern virtual function void start_of_simulation_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : MasterVIPSlaveIPVirtualSequencer

function MasterVIPSlaveIPVirtualSequencer::new(string name = "MasterVIPSlaveIPVirtualSequencer",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void MasterVIPSlaveIPVirtualSequencer::build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction : build_phase

function void MasterVIPSlaveIPVirtualSequencer::connect_phase(uvm_phase phase);
  super.connect_phase(phase);
endfunction : connect_phase

function void MasterVIPSlaveIPVirtualSequencer::end_of_elaboration_phase(uvm_phase phase);
  super.end_of_elaboration_phase(phase);
endfunction  : end_of_elaboration_phase

function void MasterVIPSlaveIPVirtualSequencer::start_of_simulation_phase(uvm_phase phase);
  super.start_of_simulation_phase(phase);
endfunction : start_of_simulation_phase


task MasterVIPSlaveIPVirtualSequencer::run_phase(uvm_phase phase);

  // Work here
  // ...

endtask : run_phase

`endif

