`ifndef AXI4LITEARVALIDASSERTEDANDSAMECLKARREADYASSERTEDTEST_INCLUDED_
`define AXI4LITEARVALIDASSERTEDANDSAMECLKARREADYASSERTEDTEST_INCLUDED_

class Axi4LiteArvalidAssertedAndSameClkArreadyAssertedTest extends Axi4LiteBaseTest;
  `uvm_component_utils(Axi4LiteArvalidAssertedAndSameClkArreadyAssertedTest)

  Axi4LiteVirtualArvalidAssertedAndSameClkArreadyAssertedSeq axi4LiteVirtualArvalidAssertedAndSameClkArreadyAssertedSeq;
  
  extern function new(string name = "Axi4LiteArvalidAssertedAndSameClkArreadyAssertedTest", uvm_component parent = null);
  extern function void setupAxi4LiteEnvConfig();
  extern virtual task run_phase(uvm_phase phase);
endclass : Axi4LiteArvalidAssertedAndSameClkArreadyAssertedTest

function Axi4LiteArvalidAssertedAndSameClkArreadyAssertedTest::new(string name = "Axi4LiteArvalidAssertedAndSameClkArreadyAssertedTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteArvalidAssertedAndSameClkArreadyAssertedTest::setupAxi4LiteEnvConfig();
 super.setupAxi4LiteEnvConfig();
 axi4LiteEnvConfig.transactionType = 0;
endfunction : setupAxi4LiteEnvConfig

task Axi4LiteArvalidAssertedAndSameClkArreadyAssertedTest::run_phase(uvm_phase phase);

  axi4LiteVirtualArvalidAssertedAndSameClkArreadyAssertedSeq=Axi4LiteVirtualArvalidAssertedAndSameClkArreadyAssertedSeq::type_id::create("axi4LiteVirtualArvalidAssertedAndSameClkArreadyAssertedSeq");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteArvalidAssertedAndSameClkArreadyAssertedTest"),UVM_LOW);
  phase.raise_objection(this);
  axi4LiteVirtualArvalidAssertedAndSameClkArreadyAssertedSeq.start(axi4LiteEnv.axi4LiteVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

