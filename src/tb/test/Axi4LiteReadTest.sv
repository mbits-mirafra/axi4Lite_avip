`ifndef AXI4LITEREADTEST_INCLUDED_
`define AXI4LITEREADTEST_INCLUDED_

class Axi4LiteReadTest extends Axi4LiteBaseTest;
  `uvm_component_utils(Axi4LiteReadTest)

  Axi4LiteVirtualReadSeq axi4LiteVirtualReadSeq;
  
  extern function new(string name = "Axi4LiteReadTest", uvm_component parent = null);
  extern function void setupAxi4LiteEnvConfig();
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteReadTest

function Axi4LiteReadTest::new(string name = "Axi4LiteReadTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteReadTest::setupAxi4LiteEnvConfig();
 super.setupAxi4LiteEnvConfig();
 axi4LiteEnvConfig.transactionType = Axi4LiteReadMasterGlobalPkg::READ;
endfunction : setupAxi4LiteEnvConfig

task Axi4LiteReadTest::run_phase(uvm_phase phase);

  axi4LiteVirtualReadSeq=Axi4LiteVirtualReadSeq::type_id::create("axi4LiteVirtualReadSeq");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteReadTest"),UVM_LOW);
    phase.raise_objection(this);

    while(axi4LiteEnv.axi4LiteMasterEnv.axi4LiteReadMasterEnv.axi4LiteMasterReadAgent[0].axi4LiteMasterReadCoverage.axi4LiteMasterReadTransactionCovergroup.get_inst_coverage() < 95) begin
     axi4LiteVirtualReadSeq.start(axi4LiteEnv.axi4LiteVirtualSequencer);
     #10;
    end

  phase.drop_objection(this);

endtask : run_phase

`endif

