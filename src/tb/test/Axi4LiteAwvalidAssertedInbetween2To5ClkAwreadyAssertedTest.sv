`ifndef AXI4LITEAWVALIDASSERTEDINBETWEEN2TO5CLKAWREADYASSERTEDTEST_INCLUDED_
`define AXI4LITEAWVALIDASSERTEDINBETWEEN2TO5CLKAWREADYASSERTEDTEST_INCLUDED_

class Axi4LiteAwvalidAssertedInbetween2To5ClkAwreadyAssertedTest extends Axi4LiteBaseTest;
  `uvm_component_utils(Axi4LiteAwvalidAssertedInbetween2To5ClkAwreadyAssertedTest)

  Axi4LiteVirtualAwvalidAssertedInbetween2To5ClkAwreadyAssertedSeq axi4LiteVirtualAwvalidAssertedInbetween2To5ClkAwreadyAssertedSeq;
  
  extern function new(string name = "Axi4LiteAwvalidAssertedInbetween2To5ClkAwreadyAssertedTest", uvm_component parent = null);
  extern function void setupAxi4LiteEnvConfig();
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteAwvalidAssertedInbetween2To5ClkAwreadyAssertedTest

function Axi4LiteAwvalidAssertedInbetween2To5ClkAwreadyAssertedTest::new(string name = "Axi4LiteAwvalidAssertedInbetween2To5ClkAwreadyAssertedTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteAwvalidAssertedInbetween2To5ClkAwreadyAssertedTest::setupAxi4LiteEnvConfig();
 super.setupAxi4LiteEnvConfig();
 axi4LiteEnvConfig.transactionType = Axi4LiteWriteMasterGlobalPkg::WRITE;
endfunction : setupAxi4LiteEnvConfig

task Axi4LiteAwvalidAssertedInbetween2To5ClkAwreadyAssertedTest::run_phase(uvm_phase phase);

  axi4LiteVirtualAwvalidAssertedInbetween2To5ClkAwreadyAssertedSeq=Axi4LiteVirtualAwvalidAssertedInbetween2To5ClkAwreadyAssertedSeq::type_id::create("axi4LiteVirtualAwvalidAssertedInbetween2To5ClkAwreadyAssertedSeq");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteAwvalidAssertedInbetween2To5ClkAwreadyAssertedTest"),UVM_LOW);
  phase.raise_objection(this);
  axi4LiteVirtualAwvalidAssertedInbetween2To5ClkAwreadyAssertedSeq.start(axi4LiteEnv.axi4LiteVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

