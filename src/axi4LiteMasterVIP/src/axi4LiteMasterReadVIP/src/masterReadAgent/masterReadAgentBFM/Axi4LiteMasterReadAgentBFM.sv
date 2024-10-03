`ifndef AXI4LITEMASTERREADAGENTBFM_INCLUDED_
`define AXI4LITEMASTERREADAGENTBFM_INCLUDED_

 import Axi4LiteReadMasterGlobalPkg::*;

module Axi4LiteMasterReadAgentBFM #(parameter int ADDR_WIDTH = 32,
                                    parameter int DATA_WIDTH = 32
                                   )
                                   (Axi4LiteMasterReadInterface axi4LiteMasterReadInterface);  
   
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  Axi4LiteMasterReadDriverBFM axi4LiteMasterReadDriverBFM (.aclk(axi4LiteMasterReadInterface.aclk), 
                                                           .aresetn(axi4LiteMasterReadInterface.aresetn),
                                                           .arvalid(axi4LiteMasterReadInterface.arvalid),
                                                           .arready(axi4LiteMasterReadInterface.arready),
                                                           .araddr(axi4LiteMasterReadInterface.araddr),
                                                           .arprot(axi4LiteMasterReadInterface.arprot),
                                                           .rvalid(axi4LiteMasterReadInterface.rvalid),
                                                           .rready(axi4LiteMasterReadInterface.rready),
                                                           .rdata(axi4LiteMasterReadInterface.rdata),
                                                           .rresp(axi4LiteMasterReadInterface.rresp)
                                                          );

  Axi4LiteMasterReadMonitorBFM axi4LiteMasterReadMonitorBFM (.aclk(axi4LiteMasterReadInterface.aclk),
                                                             .aresetn(axi4LiteMasterReadInterface.aresetn),
                                                             .arvalid(axi4LiteMasterReadInterface.arvalid),
                                                             .arready(axi4LiteMasterReadInterface.arready),
                                                             .araddr(axi4LiteMasterReadInterface.araddr),
                                                             .arprot(axi4LiteMasterReadInterface.arprot),
                                                             .rvalid(axi4LiteMasterReadInterface.rvalid),
                                                             .rready(axi4LiteMasterReadInterface.rready),
                                                             .rdata(axi4LiteMasterReadInterface.rdata),
                                                             .rresp(axi4LiteMasterReadInterface.rresp)
                                                            );
                                                            
  initial begin
    uvm_config_db#(virtual Axi4LiteMasterReadDriverBFM)::set(null,"*", "Axi4LiteMasterReadDriverBFM", axi4LiteMasterReadDriverBFM); 
    uvm_config_db#(virtual Axi4LiteMasterReadMonitorBFM)::set(null,"*", "Axi4LiteMasterReadMonitorBFM", axi4LiteMasterReadMonitorBFM);
  end

  bind Axi4LiteMasterReadMonitorBFM Axi4LiteMasterReadAssertions WRITEMASTERM_ASSERTPROPERTY (.aclk(aclk),
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

  bind Axi4LiteMasterReadMonitorBFM Axi4LiteMasterReadCoverProperty WRITEMASTER_COVERPROPERTY (.aclk(aclk),
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
