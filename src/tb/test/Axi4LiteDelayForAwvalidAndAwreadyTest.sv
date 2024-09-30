`ifndef AXI4LITEDELAYFORAWVALIDANDAWREADYTEST_INCLUDED_
`define AXI4LITEDELAYFORAWVALIDANDAWREADYTEST_INCLUDED_

class Axi4LiteDelayForAwvalidAndAwreadyTest extends Axi4LiteBaseTest;
  `uvm_component_utils(Axi4LiteDelayForAwvalidAndAwreadyTest)

  Axi4LiteVirtualDelayForAwvalidAndAwreadySeq axi4LiteVirtualDelayForAwvalidAndAwreadySeq;
  
  extern function new(string name = "Axi4LiteDelayForAwvalidAndAwreadyTest", uvm_component parent = null);
  extern function void setupAxi4LiteEnvConfig();
  extern virtual task run_phase(uvm_phase phase);


endclass : Axi4LiteDelayForAwvalidAndAwreadyTest

function Axi4LiteDelayForAwvalidAndAwreadyTest::new(string name = "Axi4LiteDelayForAwvalidAndAwreadyTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteDelayForAwvalidAndAwreadyTest::setupAxi4LiteEnvConfig();
 super.setupAxi4LiteEnvConfig();
 axi4LiteEnvConfig.transactionType = Axi4LiteWriteMasterGlobalPkg::WRITE;
endfunction : setupAxi4LiteEnvConfig

task Axi4LiteDelayForAwvalidAndAwreadyTest::run_phase(uvm_phase phase);

  axi4LiteVirtualDelayForAwvalidAndAwreadySeq=Axi4LiteVirtualDelayForAwvalidAndAwreadySeq::type_id::create("axi4LiteVirtualDelayForAwvalidAndAwreadySeq");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteDelayForAwvalidAndAwreadyTest"),UVM_LOW);
  phase.raise_objection(this);
  axi4LiteVirtualDelayForAwvalidAndAwreadySeq.start(axi4LiteEnv.axi4LiteVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

