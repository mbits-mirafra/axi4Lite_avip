`ifndef AXI4LITESLAVEWRITECOVERAGE_INCLUDED_
`define AXI4LITESLAVEWRITECOVERAGE_INCLUDED_

class Axi4LiteSlaveWriteCoverage extends uvm_subscriber#(Axi4LiteSlaveWriteTransaction);
  `uvm_component_utils(Axi4LiteSlaveWriteCoverage)

   Axi4LiteSlaveWriteAgentConfig axi4LiteSlaveWriteAgentConfig;

   bit [ADDRESS_WIDTH-1:0] maxAddressRangeCov;
   bit [ADDRESS_WIDTH-1:0] minAddressRangeCov;

   covergroup axi4LiteSlaveWriteTransactionCovergroup with function sample (Axi4LiteSlaveWriteTransaction packet);
   option.per_instance = 1;
   
   WRITEADDR_EVENODD_CP : coverpoint packet.awaddr[0] {
   option.comment                                   = "writeAddress For Odd and Even address";
   bins WRITE_EVENADDR                              = {0}; 
   bins WRITE_ODDADDR                               = {1};
   }

   WRITEADDR_MODEOF4_CP: coverpoint packet.awaddr[00] { 
   option.comment                                   = "writeAddress For Mode of 4 address";
   bins WRITE_MODEOF4ADDR                           = {00};
   }
 
   WRITEADDR_RANGE_CP: coverpoint packet.awaddr { 
   option.comment                                   = "writeAddress Values";
   bins WRITE_ADDRRANGE                             = {[MIN_ADDRESS:MAX_ADDRESS]}; 
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
   bins WRITE_OKAY                                  = {2'b00};
   illegal_bins WRITE_EXOKAY                        = {2'b01};
   bins WRITE_SLVERR                                = {2'b10};
   illegal_bins WRITE_DECERR                        = {2'b11};
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

   WRITEADDR_EVENODD_CP_X_BRESP_CP : cross WRITEADDR_EVENODD_CP,BRESP_CP{ 
// Questa sim tool will not support this cross_auto_bin_max So but Synopsys tool will support it.
// option.cross_auto_bin_max=0;
   ignore_bins b1 = (( binsof (WRITEADDR_EVENODD_CP.WRITE_EVENADDR) || 
                       binsof (WRITEADDR_EVENODD_CP.WRITE_ODDADDR)) 
                       && binsof (BRESP_CP.WRITE_SLVERR));
 }
   WRITEADDR_MODEOF4_CP_X_BRESP_CP : cross WRITEADDR_MODEOF4_CP,BRESP_CP{ 
   ignore_bins b2 = (( binsof(WRITEADDR_MODEOF4_CP.WRITE_MODEOF4ADDR)) && binsof(BRESP_CP.WRITE_SLVERR));
 }
   WRITEADDR_RANGE_CP_X_BRESP_CP : cross WRITEADDR_RANGE_CP,BRESP_CP{ 
   ignore_bins b3 = (( binsof(WRITEADDR_RANGE_CP.WRITE_ADDRRANGE)) && binsof(BRESP_CP.WRITE_SLVERR));
  }

  endgroup: axi4LiteSlaveWriteTransactionCovergroup

   covergroup axi4LiteSlaveWriteConfigCovergroup with function sample (Axi4LiteSlaveWriteAgentConfig cfg);
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
  endgroup: axi4LiteSlaveWriteConfigCovergroup
 
  extern function new(string name = "Axi4LiteSlaveWriteCoverage", uvm_component parent = null);
  extern virtual function void write(Axi4LiteSlaveWriteTransaction t);
  extern virtual function void start_of_simulation_phase(uvm_phase phase);
  extern virtual function void report_phase(uvm_phase phase);
endclass : Axi4LiteSlaveWriteCoverage

function Axi4LiteSlaveWriteCoverage::new(string name = "Axi4LiteSlaveWriteCoverage",uvm_component parent = null);
  super.new(name, parent);
  axi4LiteSlaveWriteTransactionCovergroup = new();
  axi4LiteSlaveWriteConfigCovergroup      = new();
endfunction : new

function void Axi4LiteSlaveWriteCoverage::write(Axi4LiteSlaveWriteTransaction t);
 `uvm_info(get_type_name(),$sformatf("Before calling SAMPLE METHOD"),UVM_HIGH);

  axi4LiteSlaveWriteTransactionCovergroup.sample(t);
  axi4LiteSlaveWriteConfigCovergroup.sample(axi4LiteSlaveWriteAgentConfig);

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
  `uvm_info(get_type_name(),$sformatf("AXI4LITE Slave Agent Transaction Coverage = %0.2f %%", axi4LiteSlaveWriteTransactionCovergroup.get_coverage()), UVM_NONE);
  `uvm_info(get_type_name(),$sformatf("AXI4LITE Slave Agent Config Coverage = %0.2f %%", axi4LiteSlaveWriteConfigCovergroup.get_coverage()), UVM_NONE);
endfunction: report_phase

`endif

