`ifndef AXI4LITESLAVEWRITEBASETEST_INCLUDED_
`define AXI4LITESLAVEWRITEBASETEST_INCLUDED_

class Axi4LiteSlaveWriteBaseTest extends uvm_test;
  `uvm_component_utils(Axi4LiteSlaveWriteBaseTest)

  Axi4LiteSlaveWriteBaseSeq axi4LiteSlaveWriteBaseSeq;
  Axi4LiteWriteSlaveEnv axi4LiteWriteSlaveEnv;
  Axi4LiteWriteSlaveEnvConfig axi4LiteWriteSlaveEnvConfig;

  extern function new(string name = "Axi4LiteSlaveWriteBaseTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void setupAxi4LiteWriteSlaveEnvConfig();
  extern virtual function void setupAxi4LiteSlaveWriteAgentConfig();
  extern virtual function void end_of_elaboration_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteSlaveWriteBaseTest

function Axi4LiteSlaveWriteBaseTest::new(string name = "Axi4LiteSlaveWriteBaseTest", uvm_component parent = null);
  super.new(name, parent);
endfunction : new


function void Axi4LiteSlaveWriteBaseTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
  axi4LiteWriteSlaveEnv = Axi4LiteWriteSlaveEnv::type_id::create("axi4LiteWriteSlaveEnv",this);
  setupAxi4LiteWriteSlaveEnvConfig();
endfunction : build_phase

function void Axi4LiteSlaveWriteBaseTest::setupAxi4LiteWriteSlaveEnvConfig();
  axi4LiteWriteSlaveEnvConfig = Axi4LiteWriteSlaveEnvConfig::type_id::create("axi4LiteWriteSlaveEnvConfig",this);
 axi4LiteWriteSlaveEnvConfig.no_of_slaves = NO_OF_WRITESLAVES;
 setupAxi4LiteSlaveWriteAgentConfig();

 uvm_config_db#(Axi4LiteWriteSlaveEnvConfig)::set(this, "*", "Axi4LiteWriteSlaveEnvConfig",
                                                   axi4LiteWriteSlaveEnvConfig);
  `uvm_info(get_type_name(), $sformatf("\nAXI4LITE_WRITE_SLAVE_ENV_CONFIG\n%s", 
                axi4LiteWriteSlaveEnvConfig.sprint()),UVM_LOW);
endfunction : setupAxi4LiteWriteSlaveEnvConfig

function void Axi4LiteSlaveWriteBaseTest::setupAxi4LiteSlaveWriteAgentConfig();
  axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig = new[axi4LiteWriteSlaveEnvConfig.no_of_slaves];
  foreach(axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i]) begin
  axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i] = Axi4LiteSlaveWriteAgentConfig::type_id::create(
                                                              $sformatf("axi4LiteSlaveWriteAgentConfig[%0d]",i));

  axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i].isActive = uvm_active_passive_enum'(UVM_ACTIVE);
  axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i].hasCoverage = 1;
  axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i].defaultStateReady = 1;
  axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i].maxDelayForWvalid = MAX_DELAY_WVALID;
  axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i].maxDelayForBready = MAX_DELAY_READY;
  axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i].minAddressRange   = MIN_ADDRESS;
  axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i].maxAddressRange   = MAX_ADDRESS;

   uvm_config_db#(Axi4LiteSlaveWriteAgentConfig)::set( this, "*", $sformatf("Axi4LiteSlaveWriteAgentConfig[%0d]", i),
          axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i]);
    `uvm_info(get_type_name(), $sformatf("\nAXI4LITE_SLAVE_WRITE_AGENT_CONFIG[%0d]\n%s",i,
                 axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i].sprint()),UVM_LOW);
  end
endfunction


function void Axi4LiteSlaveWriteBaseTest::end_of_elaboration_phase(uvm_phase phase);
  uvm_top.print_topology();
  uvm_test_done.set_drain_time(this,1000ns);
endfunction : end_of_elaboration_phase

task Axi4LiteSlaveWriteBaseTest::run_phase(uvm_phase phase);
  axi4LiteSlaveWriteBaseSeq = Axi4LiteSlaveWriteBaseSeq::type_id::create("axi4LiteSlaveWriteBaseSeq",this);
  phase.raise_objection(this, "Axi4LiteSlaveWriteBaseTest");

  `uvm_info(get_type_name(), $sformatf("Inside BASE_TEST"), UVM_NONE);
   super.run_phase(phase);
  
   axi4LiteSlaveWriteBaseSeq.start(axi4LiteWriteSlaveEnv.axi4LiteSlaveWriteAgent[0].axi4LiteSlaveWriteSequencer);
  #10;
  `uvm_info(get_type_name(), $sformatf("Done BASE_TEST"), UVM_NONE);
  phase.drop_objection(this);

endtask : run_phase

`endif

