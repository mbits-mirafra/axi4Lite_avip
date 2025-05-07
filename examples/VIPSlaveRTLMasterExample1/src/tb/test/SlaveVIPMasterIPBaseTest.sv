`ifndef SLAVEVIPMASTERIPBASETEST_INCLUDED_
`define SLAVEVIPMASTERIPBASETEST_INCLUDED_

class SlaveVIPMasterIPBaseTest extends uvm_test;
  `uvm_component_utils(SlaveVIPMasterIPBaseTest)

  SlaveVIPMasterIPVirtualBaseSeq slaveVIPMasterIPVirtualBaseSeq;
  SlaveVIPMasterIPEnv slaveVIPMasterIPEnv;
  SlaveVIPMasterIPEnvConfig slaveVIPMasterIPEnvConfig;
  Axi4LiteMasterWriteAgentConfig axi4LiteMasterWriteAgentConfigLocal[];
  Axi4LiteMasterReadAgentConfig axi4LiteMasterReadAgentConfigLocal[];
  Axi4LiteSlaveWriteAgentConfig axi4LiteSlaveWriteAgentConfigLocal[];
  Axi4LiteSlaveReadAgentConfig axi4LiteSlaveReadAgentConfigLocal[];

  extern function new(string name = "SlaveVIPMasterIPBaseTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void setupSlaveVIPMasterIPEnvConfig();
  extern virtual function void setupAxi4LiteMasterEnvConfig();
  extern virtual function void setupAxi4LiteWriteMasterEnvConfig();
  extern virtual function void setupAxi4LiteMasterWriteAgentConfig();
  extern virtual function void setupAxi4LiteReadMasterEnvConfig();
  extern virtual function void setupAxi4LiteMasterReadAgentConfig();
  extern virtual function void setupAxi4LiteSlaveEnvConfig();
  extern virtual function void setupAxi4LiteWriteSlaveEnvConfig();
  extern virtual function void setupAxi4LiteSlaveWriteAgentConfig();
  extern virtual function void setupAxi4LiteReadSlaveEnvConfig();
  extern virtual function void setupAxi4LiteSlaveReadAgentConfig();
  extern virtual function void setupMasterRTLAgentConfig();
  extern virtual function void end_of_elaboration_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : SlaveVIPMasterIPBaseTest

function SlaveVIPMasterIPBaseTest::new(string name = "SlaveVIPMasterIPBaseTest", uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void SlaveVIPMasterIPBaseTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
  slaveVIPMasterIPEnv = SlaveVIPMasterIPEnv::type_id::create("slaveVIPMasterIPEnv",this);
  setupSlaveVIPMasterIPEnvConfig();
endfunction : build_phase

function void SlaveVIPMasterIPBaseTest::setupSlaveVIPMasterIPEnvConfig();
 slaveVIPMasterIPEnvConfig = SlaveVIPMasterIPEnvConfig::type_id::create("slaveVIPMasterIPEnvConfig",this);

 slaveVIPMasterIPEnvConfig.hasVirtualSequencer = 1;
 slaveVIPMasterIPEnvConfig.hasScoreboard = 1;
 slaveVIPMasterIPEnvConfig.transactionType = 2;

 setupAxi4LiteMasterEnvConfig();
 setupAxi4LiteSlaveEnvConfig();
 setupMasterRTLAgentConfig();

   uvm_config_db#(MasterRTLAgentConfig)::set( this, "*", $sformatf("MasterRTLAgentConfig"),
          slaveVIPMasterIPEnvConfig.masterRTLAgentConfig);
    `uvm_info(get_type_name(), $sformatf("\nMASTER_RTL_AGENT_CONFIG\n%s",
                 slaveVIPMasterIPEnvConfig.masterRTLAgentConfig.sprint()),UVM_LOW);

 uvm_config_db#(SlaveVIPMasterIPEnvConfig)::set(this, "*", "SlaveVIPMasterIPEnvConfig",
                                                   slaveVIPMasterIPEnvConfig);
  `uvm_info(get_type_name(), $sformatf("\nAXI4LITE_MASTER_ENV_CONFIG\n%s", 
                slaveVIPMasterIPEnvConfig.sprint()),UVM_LOW);
endfunction : setupSlaveVIPMasterIPEnvConfig

function void SlaveVIPMasterIPBaseTest::setupAxi4LiteMasterEnvConfig();
 slaveVIPMasterIPEnvConfig.axi4LiteMasterEnvConfig = Axi4LiteMasterEnvConfig::type_id::create("axi4LiteMasterEnvConfig",this);

 slaveVIPMasterIPEnvConfig.axi4LiteMasterEnvConfig.hasMasterVirtualSequencer = 1;

 setupAxi4LiteWriteMasterEnvConfig();
 setupAxi4LiteReadMasterEnvConfig();

 uvm_config_db#(Axi4LiteMasterEnvConfig)::set(this, "*", "Axi4LiteMasterEnvConfig",
                                                   slaveVIPMasterIPEnvConfig.axi4LiteMasterEnvConfig);
  `uvm_info(get_type_name(), $sformatf("\nAXI4LITE_MASTER_ENV_CONFIG\n%s", 
                slaveVIPMasterIPEnvConfig.axi4LiteMasterEnvConfig.sprint()),UVM_LOW);
endfunction : setupAxi4LiteMasterEnvConfig

function void SlaveVIPMasterIPBaseTest::setupAxi4LiteSlaveEnvConfig();
 slaveVIPMasterIPEnvConfig.axi4LiteSlaveEnvConfig = Axi4LiteSlaveEnvConfig::type_id::create("axi4LiteSlaveEnvConfig",this);

 slaveVIPMasterIPEnvConfig.axi4LiteSlaveEnvConfig.hasSlaveVirtualSequencer = 1;

 setupAxi4LiteWriteSlaveEnvConfig();
 setupAxi4LiteReadSlaveEnvConfig();

 uvm_config_db#(Axi4LiteSlaveEnvConfig)::set(this, "*", "Axi4LiteSlaveEnvConfig",
                                                   slaveVIPMasterIPEnvConfig.axi4LiteSlaveEnvConfig);
  `uvm_info(get_type_name(), $sformatf("\nAXI4LITE_SLAVE_ENV_CONFIG\n%s", 
                slaveVIPMasterIPEnvConfig.axi4LiteSlaveEnvConfig.sprint()),UVM_LOW);
endfunction : setupAxi4LiteSlaveEnvConfig

function void SlaveVIPMasterIPBaseTest::setupAxi4LiteWriteMasterEnvConfig();
  slaveVIPMasterIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig = Axi4LiteWriteMasterEnvConfig::type_id::create("axi4LiteWriteMasterEnvConfig",this);
  slaveVIPMasterIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.no_of_masters = NO_OF_WRITEMASTERS;
  setupAxi4LiteMasterWriteAgentConfig();

  foreach(slaveVIPMasterIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i]) begin 
   uvm_config_db#(Axi4LiteMasterWriteAgentConfig)::set( this, "*", $sformatf("Axi4LiteMasterWriteAgentConfig[%0d]", i),
          slaveVIPMasterIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i]);
    `uvm_info(get_type_name(), $sformatf("\nAXI4LITE_MASTER_WRITE_AGENT_CONFIG[%0d]\n%s",i,
                 slaveVIPMasterIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i].sprint()),UVM_LOW);
  end

  uvm_config_db#(Axi4LiteWriteMasterEnvConfig)::set(this, "*", "Axi4LiteWriteMasterEnvConfig",
                                                   slaveVIPMasterIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig);
  `uvm_info(get_type_name(), $sformatf("\nAXI4LITE_WRITE_MASTER_ENV_CONFIG\n%s", 
                slaveVIPMasterIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.sprint()),UVM_LOW);
endfunction : setupAxi4LiteWriteMasterEnvConfig

function void SlaveVIPMasterIPBaseTest::setupAxi4LiteMasterWriteAgentConfig();
  slaveVIPMasterIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig = new[slaveVIPMasterIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.no_of_masters];
  foreach(slaveVIPMasterIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i]) begin
  slaveVIPMasterIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i] = Axi4LiteMasterWriteAgentConfig::type_id::create($sformatf("axi4LiteMasterWriteAgentConfig[%0d]",i));
                                end
  axi4LiteMasterWriteAgentConfigLocal = new[slaveVIPMasterIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.no_of_masters];
  foreach(axi4LiteMasterWriteAgentConfigLocal[i]) begin
  axi4LiteMasterWriteAgentConfigLocal[i] = Axi4LiteMasterWriteAgentConfig::type_id::create($sformatf("axi4LiteMasterWriteAgentConfigLocal[%0d]",i));

  axi4LiteMasterWriteAgentConfigLocal[i].isActive = uvm_active_passive_enum'(UVM_PASSIVE);
  axi4LiteMasterWriteAgentConfigLocal[i].hasCoverage = Axi4LiteWriteMasterGlobalPkg::HAS_COVERAGE;
  axi4LiteMasterWriteAgentConfigLocal[i].defaultStateBready = Axi4LiteWriteMasterGlobalPkg::DEFAULT_BREADY;
  axi4LiteMasterWriteAgentConfigLocal[i].minAddressRange = Axi4LiteWriteMasterGlobalPkg::MIN_ADDRESS;
  axi4LiteMasterWriteAgentConfigLocal[i].maxAddressRange = Axi4LiteWriteMasterGlobalPkg::MAX_ADDRESS;
  axi4LiteMasterWriteAgentConfigLocal[i].maxDelayForAwready = Axi4LiteMasterWriteAssertCoverParameter::MAX_DELAY_READY;
  axi4LiteMasterWriteAgentConfigLocal[i].maxDelayForWready = Axi4LiteMasterWriteAssertCoverParameter::MAX_DELAY_READY;
  axi4LiteMasterWriteAgentConfigLocal[i].maxDelayForBvalid = Axi4LiteMasterWriteAssertCoverParameter::MAX_DELAY_BVALID;
  axi4LiteMasterWriteAgentConfigLocal[i].toggleBready = Axi4LiteWriteMasterGlobalPkg::TOGGLE_BREADY;
  axi4LiteMasterWriteAgentConfigLocal[i].enableOutstandingTransaction = Axi4LiteWriteMasterGlobalPkg::ENABLE_OUTSTANDINGTX;
  axi4LiteMasterWriteAgentConfigLocal[i].maxLimitOfOutstandingTx = Axi4LiteWriteMasterGlobalPkg::MAXLIMITOF_OUTSTANDINGTX;
  axi4LiteMasterWriteAgentConfigLocal[i].noOfOutstandingTx = Axi4LiteWriteMasterGlobalPkg::NO_OF_OUTSTANDINGTX;
  
  end
  slaveVIPMasterIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig = axi4LiteMasterWriteAgentConfigLocal;
endfunction : setupAxi4LiteMasterWriteAgentConfig
 
function void SlaveVIPMasterIPBaseTest::setupAxi4LiteReadMasterEnvConfig();
  slaveVIPMasterIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig = Axi4LiteReadMasterEnvConfig::type_id::create("axi4LiteReadMasterEnvConfig",this);
  slaveVIPMasterIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.no_of_masters = NO_OF_WRITEMASTERS;
  setupAxi4LiteMasterReadAgentConfig();

  foreach(slaveVIPMasterIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i]) begin
    uvm_config_db#(Axi4LiteMasterReadAgentConfig)::set( this, "*", $sformatf("Axi4LiteMasterReadAgentConfig[%0d]", i),
          slaveVIPMasterIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i]);
    `uvm_info(get_type_name(), $sformatf("\nAXI4LITE_MASTER_WRITE_AGENT_CONFIG[%0d]\n%s",i,
                 slaveVIPMasterIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i].sprint()),UVM_LOW);
  end

 uvm_config_db#(Axi4LiteReadMasterEnvConfig)::set(this, "*", "Axi4LiteReadMasterEnvConfig",
                                                   slaveVIPMasterIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig);
  `uvm_info(get_type_name(), $sformatf("\nAXI4LITE_WRITE_MASTER_ENV_CONFIG\n%s", 
                slaveVIPMasterIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.sprint()),UVM_LOW);
endfunction : setupAxi4LiteReadMasterEnvConfig

function void SlaveVIPMasterIPBaseTest::setupAxi4LiteMasterReadAgentConfig();
  slaveVIPMasterIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig = new[slaveVIPMasterIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.no_of_masters];
  foreach(slaveVIPMasterIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i]) begin
  slaveVIPMasterIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i] = Axi4LiteMasterReadAgentConfig::type_id::create(
                                                              $sformatf("axi4LiteMasterReadAgentConfig[%0d]",i));
  end 
  axi4LiteMasterReadAgentConfigLocal = new[slaveVIPMasterIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.no_of_masters];
  foreach(axi4LiteMasterReadAgentConfigLocal[i]) begin
  axi4LiteMasterReadAgentConfigLocal[i] = Axi4LiteMasterReadAgentConfig::type_id::create($sformatf("axi4LiteMasterReadAgentConfigLocal[%0d]",i));
  
  axi4LiteMasterReadAgentConfigLocal[i].isActive           = uvm_active_passive_enum'(UVM_PASSIVE);
  axi4LiteMasterReadAgentConfigLocal[i].hasCoverage        = Axi4LiteReadMasterGlobalPkg::HAS_COVERAGE;
  axi4LiteMasterReadAgentConfigLocal[i].defaultStateRready = Axi4LiteReadMasterGlobalPkg::DEFAULT_RREADY;
  axi4LiteMasterReadAgentConfigLocal[i].minAddressRange    = Axi4LiteReadMasterGlobalPkg::MIN_ADDRESS;
  axi4LiteMasterReadAgentConfigLocal[i].maxAddressRange    = Axi4LiteReadMasterGlobalPkg::MAX_ADDRESS;
  axi4LiteMasterReadAgentConfigLocal[i].maxDelayForArready = Axi4LiteMasterReadAssertCoverParameter::MAX_DELAY_READY;
  axi4LiteMasterReadAgentConfigLocal[i].maxDelayForRvalid  = Axi4LiteMasterReadAssertCoverParameter::MAX_DELAY_RVALID;
  axi4LiteMasterReadAgentConfigLocal[i].toggleRready       = Axi4LiteReadMasterGlobalPkg::TOGGLE_RREADY;
  axi4LiteMasterReadAgentConfigLocal[i].enableOutstandingTransaction = Axi4LiteReadMasterGlobalPkg::ENABLE_OUTSTANDINGTX;
  axi4LiteMasterReadAgentConfigLocal[i].maxLimitOfOutstandingTx = Axi4LiteReadMasterGlobalPkg::MAXLIMITOF_OUTSTANDINGTX;
  axi4LiteMasterReadAgentConfigLocal[i].noOfOutstandingTx = Axi4LiteReadMasterGlobalPkg::NO_OF_OUTSTANDINGTX;
 end
 slaveVIPMasterIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig = axi4LiteMasterReadAgentConfigLocal;
endfunction : setupAxi4LiteMasterReadAgentConfig

function void SlaveVIPMasterIPBaseTest::setupAxi4LiteWriteSlaveEnvConfig();
  slaveVIPMasterIPEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig = Axi4LiteWriteSlaveEnvConfig::type_id::create("axi4LiteWriteSlaveEnvConfig",this);
  slaveVIPMasterIPEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.no_of_slaves = NO_OF_WRITESLAVES;
  setupAxi4LiteSlaveWriteAgentConfig();

  foreach(slaveVIPMasterIPEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i]) begin
    uvm_config_db#(Axi4LiteSlaveWriteAgentConfig)::set( this, "*", $sformatf("Axi4LiteSlaveWriteAgentConfig[%0d]", i),
          slaveVIPMasterIPEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i]);
     `uvm_info(get_type_name(), $sformatf("\nAXI4LITE_SLAVE_WRITE_AGENT_CONFIG[%0d]\n%s",i,
                 slaveVIPMasterIPEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i].sprint()),UVM_LOW);
  end

  uvm_config_db#(Axi4LiteWriteSlaveEnvConfig)::set(this, "*", "Axi4LiteWriteSlaveEnvConfig",
                                                   slaveVIPMasterIPEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig);
  `uvm_info(get_type_name(), $sformatf("\nAXI4LITE_WRITE_SLAVE_ENV_CONFIG\n%s", 
                slaveVIPMasterIPEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.sprint()),UVM_LOW);
endfunction : setupAxi4LiteWriteSlaveEnvConfig

function void SlaveVIPMasterIPBaseTest::setupAxi4LiteSlaveWriteAgentConfig();
  slaveVIPMasterIPEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig = new[slaveVIPMasterIPEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.no_of_slaves];
  foreach(slaveVIPMasterIPEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i]) begin
  slaveVIPMasterIPEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i] = Axi4LiteSlaveWriteAgentConfig::type_id::create(
                                                              $sformatf("axi4LiteSlaveWriteAgentConfig[%0d]",i));
                                                            end
  axi4LiteSlaveWriteAgentConfigLocal = new[slaveVIPMasterIPEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.no_of_slaves];
  foreach(axi4LiteSlaveWriteAgentConfigLocal[i]) begin
  axi4LiteSlaveWriteAgentConfigLocal[i] = Axi4LiteSlaveWriteAgentConfig::type_id::create($sformatf("axi4LiteSlaveWriteAgentConfigLocal[%0d]",i));
  axi4LiteSlaveWriteAgentConfigLocal[i].isActive = uvm_active_passive_enum'(UVM_ACTIVE);
  axi4LiteSlaveWriteAgentConfigLocal[i].hasCoverage = Axi4LiteWriteSlaveGlobalPkg::HAS_COVERAGE;
  axi4LiteSlaveWriteAgentConfigLocal[i].defaultStateAwready = Axi4LiteWriteSlaveGlobalPkg::DEFAULT_AWREADY;
  axi4LiteSlaveWriteAgentConfigLocal[i].defaultStateWready = Axi4LiteWriteSlaveGlobalPkg::DEFAULT_WREADY;
  axi4LiteSlaveWriteAgentConfigLocal[i].minAddressRange = Axi4LiteWriteSlaveGlobalPkg::MIN_ADDRESS;
  axi4LiteSlaveWriteAgentConfigLocal[i].maxAddressRange = Axi4LiteWriteSlaveGlobalPkg::MAX_ADDRESS;
  axi4LiteSlaveWriteAgentConfigLocal[i].maxDelayForWvalid = Axi4LiteSlaveWriteAssertCoverParameter::MAX_DELAY_WVALID;
  axi4LiteSlaveWriteAgentConfigLocal[i].maxDelayForBready = Axi4LiteSlaveWriteAssertCoverParameter::MAX_DELAY_READY;
  axi4LiteSlaveWriteAgentConfigLocal[i].toggleAwready = Axi4LiteWriteSlaveGlobalPkg::TOGGLE_AWREADY;
  axi4LiteSlaveWriteAgentConfigLocal[i].toggleWready = Axi4LiteWriteSlaveGlobalPkg::TOGGLE_WREADY;
  axi4LiteSlaveWriteAgentConfigLocal[i].enableOutstandingTransaction = Axi4LiteWriteSlaveGlobalPkg::ENABLE_OUTSTANDINGTX;
  end
  slaveVIPMasterIPEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig = axi4LiteSlaveWriteAgentConfigLocal;
endfunction : setupAxi4LiteSlaveWriteAgentConfig
 
function void SlaveVIPMasterIPBaseTest::setupAxi4LiteReadSlaveEnvConfig();
  slaveVIPMasterIPEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig = Axi4LiteReadSlaveEnvConfig::type_id::create("axi4LiteReadSlaveEnvConfig",this);
  slaveVIPMasterIPEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.no_of_slaves = NO_OF_READSLAVES;
  setupAxi4LiteSlaveReadAgentConfig();

  foreach(slaveVIPMasterIPEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i]) begin 
    uvm_config_db#(Axi4LiteSlaveReadAgentConfig)::set( this, "*", $sformatf("Axi4LiteSlaveReadAgentConfig[%0d]", i),
          slaveVIPMasterIPEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i]);
    `uvm_info(get_type_name(), $sformatf("\nAXI4LITE_SLAVE_WRITE_AGENT_CONFIG[%0d]\n%s",i,
                 slaveVIPMasterIPEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i].sprint()),UVM_LOW);
  end

   uvm_config_db#(Axi4LiteReadSlaveEnvConfig)::set(this, "*", "Axi4LiteReadSlaveEnvConfig",
                                                   slaveVIPMasterIPEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig);
  `uvm_info(get_type_name(), $sformatf("\nAXI4LITE_WRITE_SLAVE_ENV_CONFIG\n%s", 
                slaveVIPMasterIPEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.sprint()),UVM_LOW);
endfunction : setupAxi4LiteReadSlaveEnvConfig

function void SlaveVIPMasterIPBaseTest::setupAxi4LiteSlaveReadAgentConfig();
  slaveVIPMasterIPEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig = new[slaveVIPMasterIPEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.no_of_slaves];
  foreach(slaveVIPMasterIPEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i]) begin
  slaveVIPMasterIPEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i] = Axi4LiteSlaveReadAgentConfig::type_id::create(
                                                              $sformatf("axi4LiteSlaveReadAgentConfig[%0d]",i));
                                                            end
  axi4LiteSlaveReadAgentConfigLocal = new[slaveVIPMasterIPEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.no_of_slaves];
  foreach(axi4LiteSlaveReadAgentConfigLocal[i]) begin
  axi4LiteSlaveReadAgentConfigLocal[i] = Axi4LiteSlaveReadAgentConfig::type_id::create($sformatf("axi4LiteSlaveReadAgentConfigLocal[%0d]",i));
  axi4LiteSlaveReadAgentConfigLocal[i].isActive = uvm_active_passive_enum'(UVM_ACTIVE);
  axi4LiteSlaveReadAgentConfigLocal[i].hasCoverage = Axi4LiteReadSlaveGlobalPkg::HAS_COVERAGE;
  axi4LiteSlaveReadAgentConfigLocal[i].defaultStateArready = Axi4LiteReadSlaveGlobalPkg::DEFAULT_ARREADY;
  axi4LiteSlaveReadAgentConfigLocal[i].minAddressRange = Axi4LiteReadSlaveGlobalPkg::MIN_ADDRESS;
  axi4LiteSlaveReadAgentConfigLocal[i].maxAddressRange = Axi4LiteReadSlaveGlobalPkg::MAX_ADDRESS;
  axi4LiteSlaveReadAgentConfigLocal[i].maxDelayForRready = Axi4LiteSlaveReadAssertCoverParameter::MAX_DELAY_READY;
  axi4LiteSlaveReadAgentConfigLocal[i].toggleArready = Axi4LiteReadSlaveGlobalPkg::TOGGLE_ARREADY;
  axi4LiteSlaveReadAgentConfigLocal[i].enableOutstandingTransaction = Axi4LiteReadSlaveGlobalPkg::ENABLE_OUTSTANDINGTX;
  end
  slaveVIPMasterIPEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig = axi4LiteSlaveReadAgentConfigLocal;
endfunction : setupAxi4LiteSlaveReadAgentConfig

function void SlaveVIPMasterIPBaseTest::setupMasterRTLAgentConfig();
  slaveVIPMasterIPEnvConfig.masterRTLAgentConfig = MasterRTLAgentConfig::type_id::create("masterRTLAgentConfig",this);

  slaveVIPMasterIPEnvConfig.masterRTLAgentConfig.isActive = uvm_active_passive_enum'(UVM_ACTIVE);
  slaveVIPMasterIPEnvConfig.masterRTLAgentConfig.minAddressRange = MasterRTLGlobalPkg::MIN_ADDRESS;
  slaveVIPMasterIPEnvConfig.masterRTLAgentConfig.maxAddressRange = MasterRTLGlobalPkg::MAX_ADDRESS;
endfunction : setupMasterRTLAgentConfig
 

function void SlaveVIPMasterIPBaseTest::end_of_elaboration_phase(uvm_phase phase);
  uvm_top.print_topology();
  uvm_test_done.set_drain_time(this,3000ns);
endfunction : end_of_elaboration_phase


task SlaveVIPMasterIPBaseTest::run_phase(uvm_phase phase);
  slaveVIPMasterIPVirtualBaseSeq = SlaveVIPMasterIPVirtualBaseSeq::type_id::create("slaveVIPMasterIPVirtualBaseSeq");
  phase.raise_objection(this, "SlaveVIPMasterIPBaseTest");

  `uvm_info(get_type_name(), $sformatf("Inside MASTER_BASE_TEST"), UVM_NONE);
  #10;
  `uvm_info(get_type_name(), $sformatf("Done MASTER_BASE_TEST"), UVM_NONE);
  phase.drop_objection(this);

endtask : run_phase

`endif

