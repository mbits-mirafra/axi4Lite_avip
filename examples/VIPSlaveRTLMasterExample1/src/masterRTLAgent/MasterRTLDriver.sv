`ifndef MASTERRTLDRIVER_INCLUDED_
`define MASTERRTLDRIVER_INCLUDED_

class MasterRTLDriver extends uvm_driver #(MasterRTLTransaction);
  `uvm_component_utils(MasterRTLDriver)

  uvm_seq_item_pull_port #(REQ,RSP) masterSeqItemPort;
  uvm_analysis_port #(RSP) masterRspPort;

  REQ masterReq;
  RSP masterRsp;

  MasterRTLAgentConfig masterRTLAgentConfig;

  virtual MasterRTLInterface masterRTLInterface;

  extern function new(string name = "MasterRTLDriver", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void end_of_elaboration_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);
  extern virtual task waitForAresetnTask();
  extern virtual task dataTransferTask();

endclass : MasterRTLDriver

function MasterRTLDriver::new(string name = "MasterRTLDriver",
                                             uvm_component parent = null);
  super.new(name, parent);
  masterSeqItemPort  = new("masterSeqItemPort", this);
  masterRspPort      = new("masterRspPort", this);
endfunction : new

function void MasterRTLDriver::build_phase(uvm_phase phase);
  super.build_phase(phase);
  if(!uvm_config_db #(virtual MasterRTLInterface)::get(this,"*","MasterRTLInterface",masterRTLInterface)) begin
    `uvm_fatal("FATAL_MDP_CANNOT_GET_MasterRTLInterface","cannot get() masterRTLInterface");
  end 
endfunction : build_phase

function void MasterRTLDriver::end_of_elaboration_phase(uvm_phase phase);
  super.end_of_elaboration_phase(phase);
endfunction : end_of_elaboration_phase

task MasterRTLDriver::run_phase(uvm_phase phase);
  `uvm_info(get_type_name(),$sformatf("Inside run_phase MasterRTLDriver"),UVM_LOW);
  waitForAresetnTask();
  `uvm_info(get_type_name(),$sformatf("Inside run_phase after waitForAresetn MasterRTLDriver"),UVM_LOW);
  dataTransferTask();
  `uvm_info(get_type_name(),$sformatf("Inside run_phase after dataTransferTask MasterRTLDriver"),UVM_LOW);
endtask : run_phase

task MasterRTLDriver::waitForAresetnTask();
    @(negedge masterRTLInterface.aresetn);
    `uvm_info("MASTER_RTL_DRIVER",$sformatf("SYSTEM RESET DETECTED"),UVM_HIGH)
    @(posedge masterRTLInterface.aresetn);
    `uvm_info("MASTER_RTL_DRIVER",$sformatf("SYSTEM RESET DEACTIVATED"),UVM_HIGH)
endtask : waitForAresetnTask

task MasterRTLDriver::dataTransferTask();
  forever begin
    MasterRTLTransaction masterTx;

  `uvm_info(get_type_name(),$sformatf("Inside dataTransferTask before get_next_item MasterRTLDriver"),UVM_LOW);
    masterSeqItemPort.get_next_item(masterReq);
  `uvm_info(get_type_name(),$sformatf("Inside dataTransferTask after get_next_item MasterRTLDriver"),UVM_LOW);
    `uvm_info(get_type_name(), $sformatf(
              "DATA_TRANSFER_TASK::Before Sending_Req = \n%s", masterReq.sprint()),
              UVM_HIGH);

    if(masterReq.writeEnable) begin
      masterRTLInterface.writeEnable <= masterReq.writeEnable;
      masterRTLInterface.awaddr <= masterReq.awaddr;
      masterRTLInterface.wdata <= masterReq.wdata;
      masterRTLInterface.wstrb <= masterReq.wstrb;
    end 
    else if(masterReq.readEnable) begin
      masterRTLInterface.readEnable <= masterReq.readEnable;
      masterRTLInterface.araddr <= masterReq.araddr;
    end

    masterSeqItemPort.item_done();
  end
endtask : dataTransferTask

`endif

