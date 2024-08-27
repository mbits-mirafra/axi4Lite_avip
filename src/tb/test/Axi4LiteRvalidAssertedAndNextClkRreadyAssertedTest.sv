`ifndef AXI4LITERVALIDASSERTEDANDNEXTCLKRREADYASSERTEDTEST_INCLUDED_
`define AXI4LITERVALIDASSERTEDANDNEXTCLKRREADYASSERTEDTEST_INCLUDED_

class Axi4LiteRvalidAssertedAndNextClkRreadyAssertedTest extends Axi4LiteBaseTest;
  `uvm_component_utils(Axi4LiteRvalidAssertedAndNextClkRreadyAssertedTest)

  Axi4LiteVirtualRvalidAssertedAndNextClkRreadyAssertedSeq axi4LiteVirtualRvalidAssertedAndNextClkRreadyAssertedSeq;
  
  extern function new(string name = "Axi4LiteRvalidAssertedAndNextClkRreadyAssertedTest", uvm_component parent = null);
  extern function void setupAxi4LiteEnvConfig();
  extern function void setupAxi4LiteMasterReadAgentConfig();
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteRvalidAssertedAndNextClkRreadyAssertedTest

function Axi4LiteRvalidAssertedAndNextClkRreadyAssertedTest::new(string name = "Axi4LiteRvalidAssertedAndNextClkRreadyAssertedTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteRvalidAssertedAndNextClkRreadyAssertedTest::setupAxi4LiteEnvConfig();
 super.setupAxi4LiteEnvConfig();
 axi4LiteEnvConfig.transactionType = Axi4LiteReadMasterGlobalPkg::READ;
endfunction : setupAxi4LiteEnvConfig

function void Axi4LiteRvalidAssertedAndNextClkRreadyAssertedTest::setupAxi4LiteMasterReadAgentConfig();
  super.setupAxi4LiteMasterReadAgentConfig();
  
  foreach(axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i]) begin
   axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i].defaultStateReady = 0; 
  end
endfunction

task Axi4LiteRvalidAssertedAndNextClkRreadyAssertedTest::run_phase(uvm_phase phase);

  axi4LiteVirtualRvalidAssertedAndNextClkRreadyAssertedSeq=Axi4LiteVirtualRvalidAssertedAndNextClkRreadyAssertedSeq::type_id::create("axi4LiteVirtualRvalidAssertedAndNextClkRreadyAssertedSeq");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteRvalidAssertedAndNextClkRreadyAssertedTest"),UVM_LOW);
  phase.raise_objection(this);
  axi4LiteVirtualRvalidAssertedAndNextClkRreadyAssertedSeq.start(axi4LiteEnv.axi4LiteVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

