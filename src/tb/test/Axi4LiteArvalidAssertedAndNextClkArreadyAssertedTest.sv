`ifndef AXI4LITEARVALIDASSERTEDANDNEXTCLKARREADYASSERTEDTEST_INCLUDED_
`define AXI4LITEARVALIDASSERTEDANDNEXTCLKARREADYASSERTEDTEST_INCLUDED_

class Axi4LiteArvalidAssertedAndNextClkArreadyAssertedTest extends Axi4LiteBaseTest;
  `uvm_component_utils(Axi4LiteArvalidAssertedAndNextClkArreadyAssertedTest)

  Axi4LiteVirtualArvalidAssertedAndNextClkArreadyAssertedSeq axi4LiteVirtualArvalidAssertedAndNextClkArreadyAssertedSeq;
  
  extern function new(string name = "Axi4LiteArvalidAssertedAndNextClkArreadyAssertedTest", uvm_component parent = null);
  extern function void setupAxi4LiteEnvConfig();
  extern function void setupAxi4LiteSlaveReadAgentConfig();
  extern virtual task run_phase(uvm_phase phase);


endclass : Axi4LiteArvalidAssertedAndNextClkArreadyAssertedTest

function Axi4LiteArvalidAssertedAndNextClkArreadyAssertedTest::new(string name = "Axi4LiteArvalidAssertedAndNextClkArreadyAssertedTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteArvalidAssertedAndNextClkArreadyAssertedTest::setupAxi4LiteEnvConfig();
 super.setupAxi4LiteEnvConfig();
 axi4LiteEnvConfig.transactionType = Axi4LiteReadMasterGlobalPkg::READ;
endfunction : setupAxi4LiteEnvConfig

function void Axi4LiteArvalidAssertedAndNextClkArreadyAssertedTest::setupAxi4LiteSlaveReadAgentConfig();
  super.setupAxi4LiteSlaveReadAgentConfig();
  
  foreach(axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i]) begin
     axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i].defaultStateReady = 0; 
  end
endfunction

task Axi4LiteArvalidAssertedAndNextClkArreadyAssertedTest::run_phase(uvm_phase phase);

  axi4LiteVirtualArvalidAssertedAndNextClkArreadyAssertedSeq=Axi4LiteVirtualArvalidAssertedAndNextClkArreadyAssertedSeq::type_id::create("axi4LiteVirtualArvalidAssertedAndNextClkArreadyAssertedSeq");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteArvalidAssertedAndNextClkArreadyAssertedTest"),UVM_LOW);
  phase.raise_objection(this);
  axi4LiteVirtualArvalidAssertedAndNextClkArreadyAssertedSeq.start(axi4LiteEnv.axi4LiteVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

