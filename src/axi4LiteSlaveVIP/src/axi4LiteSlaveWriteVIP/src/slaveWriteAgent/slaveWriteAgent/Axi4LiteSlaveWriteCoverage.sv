`ifndef AXI4LITESLAVEWRITECOVERAGE_INCLUDED_
`define AXI4LITESLAVEWRITECOVERAGE_INCLUDED_

class Axi4LiteSlaveWriteCoverage extends uvm_subscriber#(Axi4LiteSlaveWriteTransaction);
  `uvm_component_utils(Axi4LiteSlaveWriteCoverage)

   Axi4LiteSlaveWriteAgentConfig axi4LiteSlaveWriteAgentConfig;

   bit [ADDRESS_WIDTH-1:0] maxAddressRangeCov;
   bit [ADDRESS_WIDTH-1:0] minAddressRangeCov;

   covergroup axi4LiteSlaveWriteCovergroup with function sample (Axi4LiteSlaveWriteAgentConfig cfg, Axi4LiteSlaveWriteTransaction packet);
   option.per_instance = 1;

   DEFAULTAWREADY_CP : coverpoint cfg.defaultStateAwready {
   option.comment                                    = "defaultStateAwready value";
   bins DEFAULT_AWREADY_LOW                          = {0}; 
   bins DEFAULT_AWREADY_HIGH                         = {1}; 
   }
   
   DEFAULTWREADY_CP : coverpoint cfg.defaultStateWready {
   option.comment                                   = "defaultStateWready value";
   bins DEFAULT_WREADY_LOW                          = {0}; 
   bins DEFAULT_WREADY_HIGH                         = {1}; 
   }
   
   TOGGLE_AWREADY_CP : coverpoint cfg.toggleAwready  {
   option.comment                                    = "toggleAwready value";
   bins TOGGLE_AWREADY_LOW                           = {0};
   bins TOGGLE_AWREADY_HIGH                          = {1};
   }

   TOGGLE_WREADY_CP : coverpoint cfg.toggleWready  {
   option.comment                                   = "toggleWready value";
   bins TOGGLE_WREADY_LOW                           = {0};
   bins TOGGLE_WREADY_HIGH                          = {1};
   }

   ENABLE_OUTSTANDINGTX_CP : coverpoint cfg.enableOutstandingTransaction {
   option.comment                                   = "enableOutstandingTransaction value";
   bins DISABLE_OUTSTANDING_TX                      = {0};
   bins ENABLE_OUTSTANDING_TX                       = {1};
   }

   WRITEADDR_CP : coverpoint packet.awaddr {
   option.comment                                  = "writeAddress value";
   bins WRITE_ADDRRANGE                            = {[MIN_ADDRESS:MAX_ADDRESS]};
   bins WRITE_EVENADDR                             = {[MIN_ADDRESS:MAX_ADDRESS]} with (item %2 == 0);
   bins WRITE_ODDADDR                              = {[MIN_ADDRESS:MAX_ADDRESS]} with (item %2 == 1);
   bins WRITE_MODEOF4ADDR                          = {[MIN_ADDRESS:MAX_ADDRESS]} with (item %4 == 0);
   bins WRITE_ADDROUTOFRANGE                       = {[minAddressRangeCov:maxAddressRangeCov]};
   }

   WRITEDATA_CP : coverpoint packet.wdata {
   option.comment                                  = "writeDATA value";
   bins WRITE_DATAMAX                              = {32'hFFFF_FFFF};
   bins WRITE_DATAZERO                             = {32'h0000_0000};
   bins WRITE_DATATOGGLE                           = {32'hAAAA_AAAA};
   bins WRITE_ANYDATA                              = {[1:$]};
  }

   WSTRB_CP : coverpoint packet.wstrb{
   option.comment                                  = "writeStrobe value";
   bins SINGLE_BIT                                 = {4'b0001, 4'b0010, 4'b0100, 4'b1000};
   bins TWO_BITS                                   = {4'b0011, 4'b0110, 4'b1100, 4'b1001, 4'b0101, 4'b1010};
   bins THREE_BITS                                 = {4'b0111, 4'b1110, 4'b1101, 4'b1011};
   bins ALL_ZEROS                                  = {4'b0000};
   bins ALL_ONES                                   = {4'b1111};
  }

   BRESP_CP : coverpoint packet.bresp {
   option.comment                                   = "Write Response values";
   bins WRITE_OKAY                                  = {WRITE_OKAY};
   illegal_bins WRITE_EXOKAY                        = {WRITE_EXOKAY};
   bins WRITE_SLVERR                                = {WRITE_SLVERR};
   illegal_bins WRITE_DECERR                        = {WRITE_DECERR};
  }

   AWPROT_CP : coverpoint packet.awprot {
   option.comment                                   = "Write Address Protection Values" ;
   bins DATA_SECURE_UNPRIVILEGED                    = {WRITE_DATA_SECURE_UNPRIVILEGED};  
	 bins DATA_SECURE_PRIVILEGED                      = {WRITE_DATA_SECURE_PRIVILEGED};  
	 bins DATA_NONSECURE_UNPRIVILEGED                 = {WRITE_DATA_NONSECURE_UNPRIVILEGED};  
	 bins DATA_NONSECURE_PRIVILEGED                   = {WRITE_DATA_NONSECURE_PRIVILEGED};  
	 illegal_bins INSTRUCTION_SECURE_UNPRIVILEGED     = {WRITE_INSTRUCTION_SECURE_UNPRIVILEGED};  
	 illegal_bins INSTRUCTION_SECURE_PRIVILEGED       = {WRITE_INSTRUCTION_SECURE_PRIVILEGED};  
	 illegal_bins INSTRUCTION_NONSECURE_UNPRIVILEGED  = {WRITE_INSTRUCTION_NONSECURE_UNPRIVILEGED};  
	 illegal_bins INSTRUCTION_NONSECURE_PRIVILEGED    = {WRITE_INSTRUCTION_NONSECURE_PRIVILEGED};  
	}

   AWPROT_CP_X_BRESP_CP    : cross AWPROT_CP, BRESP_CP{
   ignore_bins b1 = (( binsof(AWPROT_CP.DATA_SECURE_UNPRIVILEGED) || binsof(AWPROT_CP.DATA_SECURE_PRIVILEGED) ||
                       binsof(AWPROT_CP.DATA_NONSECURE_UNPRIVILEGED) || binsof(AWPROT_CP.DATA_NONSECURE_PRIVILEGED))
                       && binsof (BRESP_CP.WRITE_SLVERR));
  }
   WRITEDATA_CP_X_WSTRB_CP : cross WRITEDATA_CP, WSTRB_CP {
   ignore_bins b1 = (( binsof(WSTRB_CP.THREE_BITS) || binsof(WSTRB_CP.TWO_BITS) || 
                       binsof(WSTRB_CP.SINGLE_BIT) || binsof(WSTRB_CP.ALL_ZEROS)) 
                    && binsof(WRITEDATA_CP.WRITE_DATAMAX)); 
   ignore_bins b4 = (( binsof(WSTRB_CP.THREE_BITS) || binsof(WSTRB_CP.TWO_BITS) || 
                       binsof(WSTRB_CP.SINGLE_BIT) || binsof(WSTRB_CP.ALL_ZEROS)) 
                    && binsof(WRITEDATA_CP.WRITE_DATATOGGLE));
   ignore_bins b2 = (( binsof(WSTRB_CP.THREE_BITS) || binsof(WSTRB_CP.TWO_BITS) ||
                       binsof(WSTRB_CP.SINGLE_BIT) || binsof(WSTRB_CP.ALL_ONES)) &&
                       binsof(WRITEDATA_CP.WRITE_DATAZERO));
   ignore_bins b3 = (( binsof(WSTRB_CP.ALL_ZEROS)) && binsof(WRITEDATA_CP.WRITE_ANYDATA));
  }

   WRITEADDR_CP_X_BRESP_CP : cross WRITEADDR_CP,BRESP_CP{ 
   ignore_bins b1 = binsof(WRITEADDR_CP.WRITE_ADDROUTOFRANGE) && binsof (BRESP_CP.WRITE_OKAY);
   ignore_bins b2 = ((binsof(WRITEADDR_CP.WRITE_ADDRRANGE) || binsof(WRITEADDR_CP.WRITE_EVENADDR) || 
                        binsof(WRITEADDR_CP.WRITE_ODDADDR) || binsof(WRITEADDR_CP.WRITE_MODEOF4ADDR)) 
                        && binsof (BRESP_CP.WRITE_SLVERR));
  }

  endgroup: axi4LiteSlaveWriteCovergroup
 
  extern function new(string name = "Axi4LiteSlaveWriteCoverage", uvm_component parent = null);
  extern virtual function void write(Axi4LiteSlaveWriteTransaction t);
  extern virtual function void start_of_simulation_phase(uvm_phase phase);
  extern virtual function void report_phase(uvm_phase phase);
endclass : Axi4LiteSlaveWriteCoverage

function Axi4LiteSlaveWriteCoverage::new(string name = "Axi4LiteSlaveWriteCoverage",uvm_component parent = null);
  super.new(name, parent);
  axi4LiteSlaveWriteCovergroup =new();
endfunction : new

function void Axi4LiteSlaveWriteCoverage::write(Axi4LiteSlaveWriteTransaction t);
 `uvm_info(get_type_name(),$sformatf("Before calling SAMPLE METHOD"),UVM_HIGH);

  axi4LiteSlaveWriteCovergroup.sample(axi4LiteSlaveWriteAgentConfig,t);

  `uvm_info(get_type_name(),"After calling SAMPLE METHOD",UVM_HIGH);

endfunction: write

function void Axi4LiteSlaveWriteCoverage::start_of_simulation_phase(uvm_phase phase);
   uvm_config_db#(Axi4LiteSlaveWriteAgentConfig)::get(null, "*", "Axi4LiteSlaveWriteAgentConfig",axi4LiteSlaveWriteAgentConfig);
    `uvm_info(get_type_name(), $sformatf("\nAXI4LITE_SLAVE_WRITE_AGENT_CONFIG\n%s",
                 axi4LiteSlaveWriteAgentConfig.sprint()),UVM_LOW);
   minAddressRangeCov = axi4LiteSlaveWriteAgentConfig.minAddressRange;
   maxAddressRangeCov = axi4LiteSlaveWriteAgentConfig.maxAddressRange;
endfunction: start_of_simulation_phase

function void Axi4LiteSlaveWriteCoverage::report_phase(uvm_phase phase);
  `uvm_info(get_type_name(),$sformatf("AXI4LITE Slave Agent Coverage = %0.2f %%", axi4LiteSlaveWriteCovergroup.get_coverage()), UVM_NONE);
endfunction: report_phase

`endif

