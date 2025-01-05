`ifndef MASTERRTLMONITOR_INCLUDED_
`define MASTERRTLMONITOR_INCLUDED_

class MasterRTLMonitor extends uvm_driver #(MasterRTLTransaction);
  `uvm_component_utils(MasterRTLMonitor)

  MasterRTLAgentConfig masterRTLAgentConfig;

  virtual MasterRTLInterface masterRTLInterface;

  extern function new(string name = "MasterRTLMonitor", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void end_of_elaboration_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);
  extern virtual task waitForAresetnTask();
  extern virtual task dataSampleTask();

endclass : MasterRTLMonitor

function MasterRTLMonitor::new(string name = "MasterRTLMonitor",
                                             uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void MasterRTLMonitor::build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction : build_phase

function void MasterRTLMonitor::end_of_elaboration_phase(uvm_phase phase);
  super.end_of_elaboration_phase(phase);
endfunction : end_of_elaboration_phase

task MasterRTLMonitor::run_phase(uvm_phase phase);
  `uvm_info(get_type_name(),$sformatf("Inside run_phase MasterRTLMonitor"),UVM_LOW);
  waitForAresetnTask();
  `uvm_info(get_type_name(),$sformatf("Inside run_phase after waitForAresetn MasterRTLMonitor"),UVM_LOW);
  dataSampleTask();
  `uvm_info(get_type_name(),$sformatf("Inside run_phase after dataSampleTask MasterRTLMonitor"),UVM_LOW);
endtask : run_phase

task MasterRTLMonitor::waitForAresetnTask();
    @(negedge masterRTLInterface.aresetn);
    `uvm_info(name,$sformatf("SYSTEM RESET DETECTED"),UVM_HIGH)
    @(posedge masterRTLInterface.aresetn);
    `uvm_info(name,$sformatf("SYSTEM RESET DEACTIVATED"),UVM_HIGH)
endtask : waitForAresetnTask

task MasterRTLMonitor::dataSampleTask();
  forever begin
    MasterRTLTransaction masterTx;

    if(masterRTLInterface.writeEnable) begin
      masterReq.writeEnable <= masterRTLInterface.writeEnable;
      masterReq.awaddr <= masterRTLInterface.awaddr;
      masterReq.wdata <= masterRTLInterface.wdata;
      masterReq.wstrb <= masterRTLInterface.wstrb;
    end 
    else if(masterRTLInterface.readEnable) begin
      masterReq.readEnable <= masterRTLInterface.readEnable;
      masterReq.araddr <= masterRTLInterface.araddr;
    end

  end
endtask : dataSampleTask

`endif

