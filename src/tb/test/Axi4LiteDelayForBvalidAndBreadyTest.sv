`ifndef AXI4LITEDELAYFORBVALIDANDBREADYTEST_INCLUDED_
`define AXI4LITEDELAYFORBVALIDANDBREADYTEST_INCLUDED_

class Axi4LiteDelayForBvalidAndBreadyTest extends Axi4LiteBaseTest;
  `uvm_component_utils(Axi4LiteDelayForBvalidAndBreadyTest)

  Axi4LiteVirtualDelayForBvalidAndBreadySeq axi4LiteVirtualDelayForBvalidAndBreadySeq;
  
  extern function new(string name = "Axi4LiteDelayForBvalidAndBreadyTest", uvm_component parent = null);
  extern function void setupAxi4LiteEnvConfig();
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteDelayForBvalidAndBreadyTest

function Axi4LiteDelayForBvalidAndBreadyTest::new(string name = "Axi4LiteDelayForBvalidAndBreadyTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteDelayForBvalidAndBreadyTest::setupAxi4LiteEnvConfig();
 super.setupAxi4LiteEnvConfig();
 axi4LiteEnvConfig.transactionType = Axi4LiteWriteMasterGlobalPkg::WRITE;
endfunction : setupAxi4LiteEnvConfig

task Axi4LiteDelayForBvalidAndBreadyTest::run_phase(uvm_phase phase);

  axi4LiteVirtualDelayForBvalidAndBreadySeq=Axi4LiteVirtualDelayForBvalidAndBreadySeq::type_id::create("axi4LiteVirtualDelayForBvalidAndBreadySeq");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteDelayForBvalidAndBreadyTest"),UVM_LOW);
  phase.raise_objection(this);
  axi4LiteVirtualDelayForBvalidAndBreadySeq.start(axi4LiteEnv.axi4LiteVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

