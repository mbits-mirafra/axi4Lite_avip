`ifndef AXI4LITEMASTERREADAGENTBFM_INCLUDED_
`define AXI4LITEMASTERREADAGENTBFM_INCLUDED_

 import Axi4LiteReadMasterGlobalPkg::*;

module Axi4LiteMasterReadAgentBFM #(parameter int ADDR_WIDTH = 32,
                                    parameter int DATA_WIDTH = 32
                                   )
                                   (input bit  aclk,
                                    input bit  aresetn,
                                    //Read Address Channel Signals
                                    output reg                     arvalid,
                                    input    	                     arready,
                                    output reg [ADDRESS_WIDTH-1:0] araddr,
                                    output reg               [2:0] arprot,
                                    //Read Data Channel Signals
                                    input                          rvalid,
                                    output reg                     rready,
                                    input         [DATA_WIDTH-1:0] rdata,
                                    input                    [1:0] rresp
                                   );  
   
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  Axi4LiteMasterReadDriverBFM axi4LiteMasterReadDriverBFM (.aclk(aclk), 
                                                           .aresetn(aresetn),
                                                           .arvalid(arvalid),
                                                           .arready(arready),
                                                           .araddr(araddr),
                                                           .arprot(arprot),
                                                           .rvalid(rvalid),
                                                           .rready(rready),
                                                           .rdata(rdata),
                                                           .rresp(rresp)
                                                          );

  Axi4LiteMasterReadMonitorBFM axi4LiteMasterReadMonitorBFM (.aclk(aclk),
                                                             .aresetn(aresetn),
                                                             .arvalid(arvalid),
                                                             .arready(arready),
                                                             .araddr(araddr),
                                                             .arprot(arprot),
                                                             .rvalid(rvalid),
                                                             .rready(rready),
                                                             .rdata(rdata),
                                                             .rresp(rresp)
                                                            );
                                                            
  initial begin
    uvm_config_db#(virtual Axi4LiteMasterReadDriverBFM)::set(null,"*", "Axi4LiteMasterReadDriverBFM", axi4LiteMasterReadDriverBFM); 
    uvm_config_db#(virtual Axi4LiteMasterReadMonitorBFM)::set(null,"*", "Axi4LiteMasterReadMonitorBFM", axi4LiteMasterReadMonitorBFM);
  end

  bind axi4LiteMasterReadMonitorBFM Axi4LiteMasterReadAssertions WRITEMASTERM_ASSERTPROPERTY (.aclk(aclk),
                                                                                              .aresetn(aresetn),
                                                                                              .arvalid(arvalid),
                                                                                              .arready(arready),
                                                                                              .araddr(araddr),
                                                                                              .arprot(arprot),
                                                                                              .rvalid(rvalid),
                                                                                              .rready(rready),
                                                                                              .rdata(rdata),
                                                                                              .rresp(rresp)
                                                                                             );

  bind axi4LiteMasterReadMonitorBFM Axi4LiteMasterReadCoverProperty WRITEMASTER_COVERPROPERTY (.aclk(aclk),
                                                                                               .aresetn(aresetn),
                                                                                               .arvalid(arvalid),
                                                                                               .arready(arready),
                                                                                               .araddr(araddr),
                                                                                               .arprot(arprot),
                                                                                               .rvalid(rvalid),
                                                                                               .rready(rready),
                                                                                               .rdata(rdata),
                                                                                               .rresp(rresp)
                                                                                              );

  initial begin
    `uvm_info("Axi4LiteMasterReadAgentBFM",$sformatf("AXI4LITE MASTERREADAGENTBFM"),UVM_LOW);
  end
   
endmodule : Axi4LiteMasterReadAgentBFM
`endif
