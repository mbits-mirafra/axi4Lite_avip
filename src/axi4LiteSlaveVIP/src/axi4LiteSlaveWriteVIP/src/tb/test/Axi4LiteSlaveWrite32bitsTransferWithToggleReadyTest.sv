`ifndef AXI4LITESLAVEWRITE32BITSTRANSFERWITHTOGGLEREADYTEST_INCLUDED_
`define AXI4LITESLAVEWRITE32BITSTRANSFERWITHTOGGLEREADYTEST_INCLUDED_

class Axi4LiteSlaveWrite32bitsTransferWithToggleReadyTest extends Axi4LiteSlaveWriteBaseTest;
  `uvm_component_utils(Axi4LiteSlaveWrite32bitsTransferWithToggleReadyTest)

  Axi4LiteSlaveWrite32bitsTransferWithToggleReadySeq axi4LiteSlaveWrite32bitsTransferWithToggleReadySeq;
  extern function new(string name = "Axi4LiteSlaveWrite32bitsTransferWithToggleReadyTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern function void setupAxi4LiteSlaveWriteAgentConfig();
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteSlaveWrite32bitsTransferWithToggleReadyTest

function Axi4LiteSlaveWrite32bitsTransferWithToggleReadyTest::new(string name = "Axi4LiteSlaveWrite32bitsTransferWithToggleReadyTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteSlaveWrite32bitsTransferWithToggleReadyTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
  axi4LiteSlaveWrite32bitsTransferWithToggleReadySeq = Axi4LiteSlaveWrite32bitsTransferWithToggleReadySeq ::type_id::create("axi4LiteSlaveWrite32bitsTransferWithToggleReadySeq");
endfunction : build_phase

function void Axi4LiteSlaveWrite32bitsTransferWithToggleReadyTest::setupAxi4LiteSlaveWriteAgentConfig();
  super.setupAxi4LiteSlaveWriteAgentConfig();
  foreach(axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i]) begin
    axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i].toggleReady   = 1;

   uvm_config_db#(Axi4LiteSlaveWriteAgentConfig)::set( this, "*", $sformatf("Axi4LiteSlaveWriteAgentConfig[%0d]", i),
          axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i]);
    `uvm_info(get_type_name(), $sformatf("\nAXI4LITE_SLAVE_WRITE_AGENT_CONFIG[%0d]\n%s",i,
                 axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i].sprint()),UVM_LOW);
  end
endfunction

task Axi4LiteSlaveWrite32bitsTransferWithToggleReadyTest::run_phase(uvm_phase phase);

  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteSlaveWrite32bitsTransferWithToggleReadyTest"),UVM_LOW);
    
   if(!axi4LiteSlaveWrite32bitsTransferWithToggleReadySeq.randomize()) begin
       `uvm_error(get_type_name(), "Randomization failed")
   end

  phase.raise_objection(this);
  super.run_phase(phase);
  axi4LiteSlaveWrite32bitsTransferWithToggleReadySeq.start(axi4LiteWriteSlaveEnv.axi4LiteSlaveWriteAgent[0].axi4LiteSlaveWriteSequencer); 
  #10;
  phase.drop_objection(this);
  `uvm_info(get_type_name(),$sformatf("After drop_objection Axi4LiteSlaveWrite32bitsTransferWithToggleReadyTest"),UVM_LOW);

endtask : run_phase

`endif


