`ifndef AXI4LITEMASTERBASETEST_INCLUDED_
`define AXI4LITEMASTERBASETEST_INCLUDED_

class Axi4LiteMasterBaseTest extends uvm_test;
  `uvm_component_utils(Axi4LiteMasterBaseTest)

  Axi4LiteMasterVirtualBaseSeq axi4LiteMasterVirtualBaseSeq;
  Axi4LiteMasterEnv axi4LiteMasterEnv;
  Axi4LiteMasterEnvConfig axi4LiteMasterEnvConfig;

  extern function new(string name = "Axi4LiteMasterBaseTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void setupAxi4LiteMasterEnvConfig();
  extern virtual function void setupAxi4LiteMasterWriteAgentConfig();
  extern virtual function void setupAxi4LiteMasterReadAgentConfig();
  extern virtual function void end_of_elaboration_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteMasterBaseTest

function Axi4LiteMasterBaseTest::new(string name = "Axi4LiteMasterBaseTest", uvm_component parent = null);
  super.new(name, parent);
endfunction : new


function void Axi4LiteMasterBaseTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
  axi4LiteMasterEnv = Axi4LiteMasterEnv::type_id::create("axi4LiteMasterEnv",this);
  setupAxi4LiteMasterEnvConfig();
endfunction : build_phase

function void Axi4LiteMasterBaseTest::setupAxi4LiteMasterEnvConfig();
 axi4LiteMasterEnvConfig = Axi4LiteMasterEnvConfig::type_id::create("axi4LiteMasterEnvConfig",this);
 axi4LiteMasterEnvConfig.noOfWriteMasters = NO_OF_WRITEMASTERS;
 axi4LiteMasterEnvConfig.noOfReadMasters = NO_OF_READMASTERS;
 setupAxi4LiteMasterWriteAgentConfig();
 setupAxi4LiteMasterReadAgentConfig();

 uvm_config_db#(Axi4LiteMasterEnvConfig)::set(this, "*", "Axi4LiteMasterEnvConfig",
                                                   axi4LiteMasterEnvConfig);
  `uvm_info(get_type_name(), $sformatf("\nAXI4LITE_MASTER_ENV_CONFIG\n%s", 
                axi4LiteMasterEnvConfig.sprint()),UVM_LOW);
endfunction : setupAxi4LiteMasterEnvConfig

function void Axi4LiteMasterBaseTest::setupAxi4LiteMasterWriteAgentConfig();
  axi4LiteMasterEnvConfig.axi4LiteMasterWriteAgentConfig = new[axi4LiteMasterEnvConfig.noOfWriteMasters];
  foreach(axi4LiteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i]) begin
  axi4LiteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i] = Axi4LiteMasterWriteAgentConfig::type_id::create(
                                                              $sformatf("axi4LiteMasterWriteAgentConfig[%0d]",i));

  axi4LiteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i].isActive = uvm_active_passive_enum'(UVM_ACTIVE);
  axi4LiteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i].hasCoverage = 1;

   uvm_config_db#(Axi4LiteMasterWriteAgentConfig)::set( this, "*", $sformatf("Axi4LiteMasterWriteAgentConfig[%0d]", i),
          axi4LiteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i]);
    `uvm_info(get_type_name(), $sformatf("\nAXI4LITE_MASTER_WRITE_AGENT_CONFIG[%0d]\n%s",i,
                 axi4LiteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i].sprint()),UVM_LOW);
  end
endfunction
 
function void Axi4LiteMasterBaseTest::setupAxi4LiteMasterReadAgentConfig();
  axi4LiteMasterEnvConfig.axi4LiteMasterReadAgentConfig = new[axi4LiteMasterEnvConfig.noOfReadMasters];
  foreach(axi4LiteMasterEnvConfig.axi4LiteMasterReadAgentConfig[i]) begin
  axi4LiteMasterEnvConfig.axi4LiteMasterReadAgentConfig[i] = Axi4LiteMasterReadAgentConfig::type_id::create(
                                                              $sformatf("axi4LiteMasterReadAgentConfig[%0d]",i));

  axi4LiteMasterEnvConfig.axi4LiteMasterReadAgentConfig[i].isActive = uvm_active_passive_enum'(UVM_ACTIVE);
  axi4LiteMasterEnvConfig.axi4LiteMasterReadAgentConfig[i].hasCoverage = 1;

   uvm_config_db#(Axi4LiteMasterReadAgentConfig)::set( this, "*", $sformatf("Axi4LiteMasterReadAgentConfig[%0d]", i),
          axi4LiteMasterEnvConfig.axi4LiteMasterReadAgentConfig[i]);
    `uvm_info(get_type_name(), $sformatf("\nAXI4LITE_MASTER_READ_AGENT_CONFIG[%0d]\n%s",i,
                 axi4LiteMasterEnvConfig.axi4LiteMasterReadAgentConfig[i].sprint()),UVM_LOW);
  end
endfunction

function void Axi4LiteMasterBaseTest::end_of_elaboration_phase(uvm_phase phase);
  uvm_top.print_topology();
  uvm_test_done.set_drain_time(this,10ns);
endfunction : end_of_elaboration_phase


task Axi4LiteMasterBaseTest::run_phase(uvm_phase phase);
  phase.raise_objection(this, "Axi4LiteMasterBaseTest");

  `uvm_info(get_type_name(), $sformatf("Inside BASE_TEST"), UVM_NONE);
   super.run_phase(phase);
   //axi4LiteMasterWriteBaseSeq.start(axi4LiteMasterEnv.axi4LiteWriteMasterAgent.axi4LiteMasterWriteSequencer);
  #10;
  `uvm_info(get_type_name(), $sformatf("Done BASE_TEST"), UVM_NONE);
  phase.drop_objection(this);

endtask : run_phase

`endif

