`ifndef AXI4LITEARVALIDASSERTEDINBETWEEN2TO5CLKARREADYASSERTEDTEST_INCLUDED_
`define AXI4LITEARVALIDASSERTEDINBETWEEN2TO5CLKARREADYASSERTEDTEST_INCLUDED_

class Axi4LiteArvalidAssertedInbetween2To5ClkArreadyAssertedTest extends Axi4LiteBaseTest;
  `uvm_component_utils(Axi4LiteArvalidAssertedInbetween2To5ClkArreadyAssertedTest)

  Axi4LiteVirtualArvalidAssertedInbetween2To5ClkArreadyAssertedSeq axi4LiteVirtualArvalidAssertedInbetween2To5ClkArreadyAssertedSeq;
  
  extern function new(string name = "Axi4LiteArvalidAssertedInbetween2To5ClkArreadyAssertedTest", uvm_component parent = null);
  extern function void setupAxi4LiteEnvConfig();
  extern function void setupAxi4LiteSlaveReadAgentConfig();
  extern virtual task run_phase(uvm_phase phase);


endclass : Axi4LiteArvalidAssertedInbetween2To5ClkArreadyAssertedTest

function Axi4LiteArvalidAssertedInbetween2To5ClkArreadyAssertedTest::new(string name = "Axi4LiteArvalidAssertedInbetween2To5ClkArreadyAssertedTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteArvalidAssertedInbetween2To5ClkArreadyAssertedTest::setupAxi4LiteEnvConfig();
 super.setupAxi4LiteEnvConfig();
 axi4LiteEnvConfig.transactionType = 0;
endfunction : setupAxi4LiteEnvConfig

function void Axi4LiteArvalidAssertedInbetween2To5ClkArreadyAssertedTest::setupAxi4LiteSlaveReadAgentConfig();
  super.setupAxi4LiteSlaveReadAgentConfig();
  
  foreach(axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i]) begin
     axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i].defaultStateReady = 0; 
  end
endfunction

task Axi4LiteArvalidAssertedInbetween2To5ClkArreadyAssertedTest::run_phase(uvm_phase phase);

  axi4LiteVirtualArvalidAssertedInbetween2To5ClkArreadyAssertedSeq=Axi4LiteVirtualArvalidAssertedInbetween2To5ClkArreadyAssertedSeq::type_id::create("axi4LiteVirtualArvalidAssertedInbetween2To5ClkArreadyAssertedSeq");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteArvalidAssertedInbetween2To5ClkArreadyAssertedTest"),UVM_LOW);
  phase.raise_objection(this);
  axi4LiteVirtualArvalidAssertedInbetween2To5ClkArreadyAssertedSeq.start(axi4LiteEnv.axi4LiteVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

