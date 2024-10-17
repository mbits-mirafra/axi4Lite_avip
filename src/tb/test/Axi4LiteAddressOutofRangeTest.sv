`ifndef AXI4LITEADDRESSOUTOFRANGETEST_INCLUDED_
`define AXI4LITEADDRESSOUTOFRANGETEST_INCLUDED_

class Axi4LiteAddressOutofRangeTest extends Axi4LiteBaseTest;
  `uvm_component_utils(Axi4LiteAddressOutofRangeTest)

  Axi4LiteVirtualAddressOutofRangeSeq axi4LiteVirtualAddressOutofRangeSeq;
  
  extern function new(string name = "Axi4LiteAddressOutofRangeTest", uvm_component parent = null);
 
  extern function void setupAxi4LiteMasterWriteAgentConfig();
  extern function void setupAxi4LiteMasterReadAgentConfig();
  extern function void setupAxi4LiteSlaveWriteAgentConfig();
  extern function void setupAxi4LiteSlaveReadAgentConfig();
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteAddressOutofRangeTest

function Axi4LiteAddressOutofRangeTest::new(string name = "Axi4LiteAddressOutofRangeTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteAddressOutofRangeTest::setupAxi4LiteMasterWriteAgentConfig();
  super.setupAxi4LiteMasterWriteAgentConfig();
  foreach(axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i]) begin
  axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i].minAddressRange = 1'b1;
  axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i].maxAddressRange = 16'hffff;
end 
endfunction

function void Axi4LiteAddressOutofRangeTest::setupAxi4LiteMasterReadAgentConfig();
  super.setupAxi4LiteMasterReadAgentConfig();
  foreach(axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i]) begin
  axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i].minAddressRange = 1'b1;
  axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i].maxAddressRange = 16'hffff;
end 
endfunction

function void Axi4LiteAddressOutofRangeTest::setupAxi4LiteSlaveWriteAgentConfig();
  super.setupAxi4LiteSlaveWriteAgentConfig();
  foreach(axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i]) begin
  axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i].minAddressRange = 1'b1;
  axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i].maxAddressRange = 16'hffff;
end 
endfunction

function void Axi4LiteAddressOutofRangeTest::setupAxi4LiteSlaveReadAgentConfig();
  super.setupAxi4LiteSlaveReadAgentConfig();
  foreach(axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i]) begin
  axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i].minAddressRange = 1'b1;
  axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i].maxAddressRange = 16'hffff;
end 
endfunction

task Axi4LiteAddressOutofRangeTest::run_phase(uvm_phase phase);

  axi4LiteVirtualAddressOutofRangeSeq=Axi4LiteVirtualAddressOutofRangeSeq::type_id::create("axi4LiteVirtualAddressOutofRangeSeq");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteAddressOutofRangeTest"),UVM_LOW);
    phase.raise_objection(this);
    axi4LiteVirtualAddressOutofRangeSeq.start(axi4LiteEnv.axi4LiteVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

