`ifndef MASTERVIPSLAVEIPBASETEST_INCLUDED_
`define MASTERVIPSLAVEIPBASETEST_INCLUDED_

class MasterVIPSlaveIPBaseTest extends uvm_test;
  `uvm_component_utils(MasterVIPSlaveIPBaseTest)

  MasterVIPSlaveIPEnv masterVIPSlaveIPEnv;
  MasterVIPSlaveIPEnvConfig masterVIPSlaveIPEnvConfig;

  extern function new(string name = "MasterVIPSlaveIPBaseTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void setupMasterVIPSlaveIPEnvConfig();
  extern virtual function void setupAxi4LiteMasterEnvConfig();
  extern virtual function void setupAxi4LiteWriteMasterEnvConfig();
  extern virtual function void setupAxi4LiteMasterWriteAgentConfig();
  extern virtual function void setupAxi4LiteReadMasterEnvConfig();
  extern virtual function void setupAxi4LiteMasterReadAgentConfig();
  extern virtual function void end_of_elaboration_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : MasterVIPSlaveIPBaseTest

function MasterVIPSlaveIPBaseTest::new(string name = "MasterVIPSlaveIPBaseTest", uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void MasterVIPSlaveIPBaseTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
  masterVIPSlaveIPEnv = MasterVIPSlaveIPEnv::type_id::create("masterVIPSlaveIPEnv",this);
  setupMasterVIPSlaveIPEnvConfig();
endfunction : build_phase

function void MasterVIPSlaveIPBaseTest::setupMasterVIPSlaveIPEnvConfig();
 masterVIPSlaveIPEnvConfig = MasterVIPSlaveIPEnvConfig::type_id::create("masterVIPSlaveIPEnvConfig",this);

// masterVIPSlaveIPEnvConfig.hasScoreboard = 1;

 setupAxi4LiteMasterEnvConfig();

 uvm_config_db#(MasterVIPSlaveIPEnvConfig)::set(this, "*", "MasterVIPSlaveIPEnvConfig",
                                                   masterVIPSlaveIPEnvConfig);
  `uvm_info(get_type_name(), $sformatf("\nAXI4LITE_MASTER_ENV_CONFIG\n%s", 
                masterVIPSlaveIPEnvConfig.sprint()),UVM_LOW);
endfunction : setupMasterVIPSlaveIPEnvConfig

function void MasterVIPSlaveIPBaseTest::setupAxi4LiteMasterEnvConfig();
 masterVIPSlaveIPEnvConfig.axi4LiteMasterEnvConfig = Axi4LiteMasterEnvConfig::type_id::create("axi4LiteMasterEnvConfig",this);

 masterVIPSlaveIPEnvConfig.axi4LiteMasterEnvConfig.hasMasterVirtualSequencer = 1;

 setupAxi4LiteWriteMasterEnvConfig();
 setupAxi4LiteReadMasterEnvConfig();

 uvm_config_db#(Axi4LiteMasterEnvConfig)::set(this, "*", "Axi4LiteMasterEnvConfig",
                                                   masterVIPSlaveIPEnvConfig.axi4LiteMasterEnvConfig);
  `uvm_info(get_type_name(), $sformatf("\nAXI4LITE_MASTER_ENV_CONFIG\n%s", 
                masterVIPSlaveIPEnvConfig.axi4LiteMasterEnvConfig.sprint()),UVM_LOW);
endfunction : setupAxi4LiteMasterEnvConfig

function void MasterVIPSlaveIPBaseTest::setupAxi4LiteWriteMasterEnvConfig();
  masterVIPSlaveIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig = Axi4LiteWriteMasterEnvConfig::type_id::create("axi4LiteWriteMasterEnvConfig",this);
  masterVIPSlaveIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.no_of_masters = NO_OF_WRITEMASTERS;
  setupAxi4LiteMasterWriteAgentConfig();

  foreach(masterVIPSlaveIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i]) begin 
   uvm_config_db#(Axi4LiteMasterWriteAgentConfig)::set( this, "*", $sformatf("Axi4LiteMasterWriteAgentConfig[%0d]", i),
          masterVIPSlaveIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i]);
    `uvm_info(get_type_name(), $sformatf("\nAXI4LITE_MASTER_WRITE_AGENT_CONFIG[%0d]\n%s",i,
                 masterVIPSlaveIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i].sprint()),UVM_LOW);
  end

  uvm_config_db#(Axi4LiteWriteMasterEnvConfig)::set(this, "*", "Axi4LiteWriteMasterEnvConfig",
                                                   masterVIPSlaveIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig);
  `uvm_info(get_type_name(), $sformatf("\nAXI4LITE_WRITE_MASTER_ENV_CONFIG\n%s", 
                masterVIPSlaveIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.sprint()),UVM_LOW);
endfunction : setupAxi4LiteWriteMasterEnvConfig

function void MasterVIPSlaveIPBaseTest::setupAxi4LiteMasterWriteAgentConfig();
  masterVIPSlaveIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig = new[masterVIPSlaveIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.no_of_masters];
  foreach(masterVIPSlaveIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i]) begin
  masterVIPSlaveIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i] = Axi4LiteMasterWriteAgentConfig::type_id::create(
                                                              $sformatf("axi4LiteMasterWriteAgentConfig[%0d]",i));

  masterVIPSlaveIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i].isActive = uvm_active_passive_enum'(UVM_ACTIVE);
  masterVIPSlaveIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i].hasCoverage = 1;
  masterVIPSlaveIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i].defaultStateReady = Axi4LiteWriteMasterGlobalPkg::DEFAULT_READY;
  masterVIPSlaveIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i].minAddressRange = Axi4LiteWriteMasterGlobalPkg::MIN_ADDRESS;
  masterVIPSlaveIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i].maxAddressRange = Axi4LiteWriteMasterGlobalPkg::MAX_ADDRESS;
  masterVIPSlaveIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i].maxDelayForAwready = Axi4LiteMasterWriteAssertCoverParameter::MAX_DELAY_READY;
  masterVIPSlaveIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i].maxDelayForWready = Axi4LiteMasterWriteAssertCoverParameter::MAX_DELAY_READY;
  masterVIPSlaveIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i].maxDelayForBvalid = Axi4LiteMasterWriteAssertCoverParameter::MAX_DELAY_BVALID;
  masterVIPSlaveIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i].toggleReady = 0;
  masterVIPSlaveIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i].enableOutstandingTransaction = 0;
  masterVIPSlaveIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i].maxLimitOfOutstandingTx = Axi4LiteWriteMasterGlobalPkg::MAXLIMITOF_OUTSTANDINGTX;
  masterVIPSlaveIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i].noOfOutstandingTx = 3;

  end
endfunction : setupAxi4LiteMasterWriteAgentConfig
 
function void MasterVIPSlaveIPBaseTest::setupAxi4LiteReadMasterEnvConfig();
  masterVIPSlaveIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig = Axi4LiteReadMasterEnvConfig::type_id::create("axi4LiteReadMasterEnvConfig",this);
  masterVIPSlaveIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.no_of_masters = NO_OF_WRITEMASTERS;
  setupAxi4LiteMasterReadAgentConfig();

  foreach(masterVIPSlaveIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i]) begin
    uvm_config_db#(Axi4LiteMasterReadAgentConfig)::set( this, "*", $sformatf("Axi4LiteMasterReadAgentConfig[%0d]", i),
          masterVIPSlaveIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i]);
    `uvm_info(get_type_name(), $sformatf("\nAXI4LITE_MASTER_WRITE_AGENT_CONFIG[%0d]\n%s",i,
                 masterVIPSlaveIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i].sprint()),UVM_LOW);
  end

 uvm_config_db#(Axi4LiteReadMasterEnvConfig)::set(this, "*", "Axi4LiteReadMasterEnvConfig",
                                                   masterVIPSlaveIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig);
  `uvm_info(get_type_name(), $sformatf("\nAXI4LITE_WRITE_MASTER_ENV_CONFIG\n%s", 
                masterVIPSlaveIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.sprint()),UVM_LOW);
endfunction : setupAxi4LiteReadMasterEnvConfig

function void MasterVIPSlaveIPBaseTest::setupAxi4LiteMasterReadAgentConfig();
  masterVIPSlaveIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig = new[masterVIPSlaveIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.no_of_masters];
  foreach(masterVIPSlaveIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i]) begin
  masterVIPSlaveIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i] = Axi4LiteMasterReadAgentConfig::type_id::create(
                                                              $sformatf("axi4LiteMasterReadAgentConfig[%0d]",i));

  masterVIPSlaveIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i].isActive = uvm_active_passive_enum'(UVM_ACTIVE);
  masterVIPSlaveIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i].hasCoverage = 1;
  masterVIPSlaveIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i].defaultStateReady = Axi4LiteReadMasterGlobalPkg::DEFAULT_READY;
  masterVIPSlaveIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i].minAddressRange = Axi4LiteReadMasterGlobalPkg::MIN_ADDRESS;
  masterVIPSlaveIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i].maxAddressRange = Axi4LiteReadMasterGlobalPkg::MAX_ADDRESS;
  masterVIPSlaveIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i].maxDelayForArready = Axi4LiteMasterReadAssertCoverParameter::MAX_DELAY_READY;
  masterVIPSlaveIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i].maxDelayForRvalid = Axi4LiteMasterReadAssertCoverParameter::MAX_DELAY_RVALID;
  masterVIPSlaveIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i].toggleReady = 0;
  masterVIPSlaveIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i].enableOutstandingTransaction = 0;
  masterVIPSlaveIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i].maxLimitOfOutstandingTx = Axi4LiteReadMasterGlobalPkg::MAXLIMITOF_OUTSTANDINGTX;
  masterVIPSlaveIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i].noOfOutstandingTx = 3;

 end
endfunction : setupAxi4LiteMasterReadAgentConfig


function void MasterVIPSlaveIPBaseTest::end_of_elaboration_phase(uvm_phase phase);
  uvm_top.print_topology();
  uvm_test_done.set_drain_time(this,3000ns);
endfunction : end_of_elaboration_phase


task MasterVIPSlaveIPBaseTest::run_phase(uvm_phase phase);
  phase.raise_objection(this, "MasterVIPSlaveIPBaseTest");

  `uvm_info(get_type_name(), $sformatf("Inside MASTER_BASE_TEST"), UVM_NONE);
   super.run_phase(phase);
  #10;
  `uvm_info(get_type_name(), $sformatf("Done MASTER_BASE_TEST"), UVM_NONE);
  phase.drop_objection(this);

endtask : run_phase

`endif

