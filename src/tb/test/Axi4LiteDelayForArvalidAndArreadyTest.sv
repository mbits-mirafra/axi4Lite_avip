`ifndef AXI4LITEDELAYFORARVALIDANDARREADYTEST_INCLUDED_
`define AXI4LITEDELAYFORARVALIDANDARREADYTEST_INCLUDED_

class Axi4LiteDelayForArvalidAndArreadyTest extends Axi4LiteBaseTest;
  `uvm_component_utils(Axi4LiteDelayForArvalidAndArreadyTest)

  Axi4LiteVirtualDelayForArvalidAndArreadySeq axi4LiteVirtualDelayForArvalidAndArreadySeq;
  
  extern function new(string name = "Axi4LiteDelayForArvalidAndArreadyTest", uvm_component parent = null);
  extern function void setupAxi4LiteEnvConfig();
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteDelayForArvalidAndArreadyTest

function Axi4LiteDelayForArvalidAndArreadyTest::new(string name = "Axi4LiteDelayForArvalidAndArreadyTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteDelayForArvalidAndArreadyTest::setupAxi4LiteEnvConfig();
 super.setupAxi4LiteEnvConfig();
 axi4LiteEnvConfig.transactionType = Axi4LiteReadMasterGlobalPkg::READ;
endfunction : setupAxi4LiteEnvConfig

task Axi4LiteDelayForArvalidAndArreadyTest::run_phase(uvm_phase phase);

  axi4LiteVirtualDelayForArvalidAndArreadySeq=Axi4LiteVirtualDelayForArvalidAndArreadySeq::type_id::create("axi4LiteVirtualDelayForArvalidAndArreadySeq");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteDelayForArvalidAndArreadyTest"),UVM_LOW);
  phase.raise_objection(this);
  axi4LiteVirtualDelayForArvalidAndArreadySeq.start(axi4LiteEnv.axi4LiteVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

