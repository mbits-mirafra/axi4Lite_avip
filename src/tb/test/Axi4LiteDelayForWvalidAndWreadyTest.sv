`ifndef AXI4LITEDELAYFORWVALIDANDWREADYTEST_INCLUDED_
`define AXI4LITEDELAYFORWVALIDANDWREADYTEST_INCLUDED_

class Axi4LiteDelayForWvalidAndWreadyTest extends Axi4LiteBaseTest;
  `uvm_component_utils(Axi4LiteDelayForWvalidAndWreadyTest)

  Axi4LiteVirtualDelayForWvalidAndWreadySeq axi4LiteVirtualDelayForWvalidAndWreadySeq;
  
  extern function new(string name = "Axi4LiteDelayForWvalidAndWreadyTest", uvm_component parent = null);
  extern function void setupAxi4LiteEnvConfig();
  extern function void setupAxi4LiteSlaveWriteAgentConfig();
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteDelayForWvalidAndWreadyTest

function Axi4LiteDelayForWvalidAndWreadyTest::new(string name = "Axi4LiteDelayForWvalidAndWreadyTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteDelayForWvalidAndWreadyTest::setupAxi4LiteEnvConfig();
 super.setupAxi4LiteEnvConfig();
 axi4LiteEnvConfig.transactionType = Axi4LiteWriteMasterGlobalPkg::WRITE;
endfunction : setupAxi4LiteEnvConfig

function void Axi4LiteDelayForWvalidAndWreadyTest::setupAxi4LiteSlaveWriteAgentConfig();
  super.setupAxi4LiteSlaveWriteAgentConfig();
  
  foreach(axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i]) begin
     axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i].defaultStateReady = 0; 
  end
endfunction

task Axi4LiteDelayForWvalidAndWreadyTest::run_phase(uvm_phase phase);

  axi4LiteVirtualDelayForWvalidAndWreadySeq=Axi4LiteVirtualDelayForWvalidAndWreadySeq::type_id::create("axi4LiteVirtualDelayForWvalidAndWreadySeq");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteDelayForWvalidAndWreadyTest"),UVM_LOW);
  phase.raise_objection(this);
  axi4LiteVirtualDelayForWvalidAndWreadySeq.start(axi4LiteEnv.axi4LiteVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

