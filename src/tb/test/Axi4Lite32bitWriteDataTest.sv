`ifndef AXI4LITE32BITWRITEDATATEST_INCLUDED_
`define AXI4LITE32BITWRITEDATATEST_INCLUDED_

class Axi4Lite32bitWriteDataTest extends Axi4LiteBaseTest;
  `uvm_component_utils(Axi4Lite32bitWriteDataTest)

  Axi4LiteVirtual32bitWriteDataSeq axi4LiteVirtual32bitWriteDataSeq;
  
  extern function new(string name = "Axi4Lite32bitWriteDataTest", uvm_component parent = null);
  extern function void setupAxi4LiteEnvConfig();
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4Lite32bitWriteDataTest

function Axi4Lite32bitWriteDataTest::new(string name = "Axi4Lite32bitWriteDataTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4Lite32bitWriteDataTest::setupAxi4LiteEnvConfig();
 super.setupAxi4LiteEnvConfig();
 axi4LiteEnvConfig.transactionType = Axi4LiteWriteMasterGlobalPkg::WRITE;
endfunction : setupAxi4LiteEnvConfig

task Axi4Lite32bitWriteDataTest::run_phase(uvm_phase phase);

  axi4LiteVirtual32bitWriteDataSeq=Axi4LiteVirtual32bitWriteDataSeq::type_id::create("axi4LiteVirtual32bitWriteDataSeq");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4Lite32bitWriteDataTest"),UVM_LOW);
    phase.raise_objection(this);
    axi4LiteVirtual32bitWriteDataSeq.start(axi4LiteEnv.axi4LiteVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

