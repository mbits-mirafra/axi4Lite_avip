`ifndef AXI4LITEMASTERWRITEBASETEST_INCLUDED_
`define AXI4LITEMASTERWRITEBASETEST_INCLUDED_

class Axi4LiteMasterWriteBaseTest extends uvm_test;
  `uvm_component_utils(Axi4LiteMasterWriteBaseTest)

  Axi4LiteMasterWriteBaseSeq axi4LiteMasterWriteBaseSeq;
  Axi4LiteWriteMasterEnv axi4LiteWriteMasterEnv;
  Axi4LiteWriteMasterEnvConfig axi4LiteWriteMasterEnvConfig;

  extern function new(string name = "Axi4LiteMasterWriteBaseTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void setupAxi4LiteWriteMasterEnvConfig();
  extern virtual function void setupAxi4LiteMasterWriteAgentConfig();
  extern virtual function void end_of_elaboration_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteMasterWriteBaseTest

function Axi4LiteMasterWriteBaseTest::new(string name = "Axi4LiteMasterWriteBaseTest", uvm_component parent = null);
  super.new(name, parent);
endfunction : new


function void Axi4LiteMasterWriteBaseTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
  axi4LiteWriteMasterEnv = Axi4LiteWriteMasterEnv::type_id::create("axi4LiteWriteMasterEnv",this);
  setupAxi4LiteWriteMasterEnvConfig();
endfunction : build_phase

function void Axi4LiteMasterWriteBaseTest::setupAxi4LiteWriteMasterEnvConfig();
  axi4LiteWriteMasterEnvConfig = Axi4LiteWriteMasterEnvConfig::type_id::create("axi4LiteWriteMasterEnvConfig",this);
 axi4LiteWriteMasterEnvConfig.no_of_masters = NO_OF_WRITEMASTERS;
 setupAxi4LiteMasterWriteAgentConfig();

 uvm_config_db#(Axi4LiteWriteMasterEnvConfig)::set(this, "*", "Axi4LiteWriteMasterEnvConfig",
                                                   axi4LiteWriteMasterEnvConfig);
  `uvm_info(get_type_name(), $sformatf("\nAXI4LITE_WRITE_MASTER_ENV_CONFIG\n%s", 
                axi4LiteWriteMasterEnvConfig.sprint()),UVM_LOW);
endfunction : setupAxi4LiteWriteMasterEnvConfig

function void Axi4LiteMasterWriteBaseTest::setupAxi4LiteMasterWriteAgentConfig();
  axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig = new[axi4LiteWriteMasterEnvConfig.no_of_masters];
  foreach(axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i]) begin
  axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i] = Axi4LiteMasterWriteAgentConfig::type_id::create(
                                                              $sformatf("axi4LiteMasterWriteAgentConfig[%0d]",i));

  axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i].isActive = uvm_active_passive_enum'(UVM_ACTIVE);
  axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i].hasCoverage = 1;
  axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i].minAddressRange = MIN_ADDRESS;
  axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i].maxAddressRange = MAX_ADDRESS;
  axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i].maxDelayForAwready = MAX_DELAY_READY;
  axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i].maxDelayForWready = MAX_DELAY_READY;
  axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i].maxDelayForBvalid = MAX_DELAY_BVALID;

   uvm_config_db#(Axi4LiteMasterWriteAgentConfig)::set( this, "*", $sformatf("Axi4LiteMasterWriteAgentConfig[%0d]", i),
          axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i]);
    `uvm_info(get_type_name(), $sformatf("\nAXI4LITE_MASTER_WRITE_AGENT_CONFIG[%0d]\n%s",i,
                 axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i].sprint()),UVM_LOW);
  end
endfunction


function void Axi4LiteMasterWriteBaseTest::end_of_elaboration_phase(uvm_phase phase);
  uvm_top.print_topology();
  uvm_test_done.set_drain_time(this,3000ns);
endfunction : end_of_elaboration_phase

task Axi4LiteMasterWriteBaseTest::run_phase(uvm_phase phase);
  axi4LiteMasterWriteBaseSeq = Axi4LiteMasterWriteBaseSeq::type_id::create("axi4LiteMasterWriteBaseSeq",this);
  phase.raise_objection(this, "Axi4LiteMasterWriteBaseTest");

  `uvm_info(get_type_name(), $sformatf("Inside BASE_TEST"), UVM_NONE);
   super.run_phase(phase);
  
//   axi4LiteMasterWriteBaseSeq.start(axi4LiteWriteMasterEnv.axi4LiteMasterWriteAgent[0].axi4LiteMasterWriteSequencer);
  #10;
  `uvm_info(get_type_name(), $sformatf("Done BASE_TEST"), UVM_NONE);
  phase.drop_objection(this);

endtask : run_phase

`endif

