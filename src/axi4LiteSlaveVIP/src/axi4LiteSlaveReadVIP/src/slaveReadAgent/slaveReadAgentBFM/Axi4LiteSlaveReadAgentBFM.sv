`ifndef AXI4LITESLAVEREADAGENTBFM_INCLUDED_
`define AXI4LITESLAVEREADAGENTBFM_INCLUDED_

 import Axi4LiteReadSlaveGlobalPkg::*;

module Axi4LiteSlaveReadAgentBFM #(parameter int ADDR_WIDTH = 32,
                                   parameter int DATA_WIDTH = 32
                                   )
                                   (Axi4LiteSlaveReadInterface axi4LiteSlaveReadInterface);  

                                 
   import uvm_pkg::*;
  `include "uvm_macros.svh"

  Axi4LiteSlaveReadDriverBFM axi4LiteSlaveReadDriverBFM (.aclk(axi4LiteSlaveReadInterface.aclk),
                                                         .aresetn(axi4LiteSlaveReadInterface.aresetn),
                                                         .arvalid(axi4LiteSlaveReadInterface.arvalid),
                                                         .arready(axi4LiteSlaveReadInterface.arready),
                                                         .araddr(axi4LiteSlaveReadInterface.araddr),
                                                         .arprot(axi4LiteSlaveReadInterface.arprot),
                                                         .rvalid(axi4LiteSlaveReadInterface.rvalid),
                                                         .rready(axi4LiteSlaveReadInterface.rready),
                                                         .rdata(axi4LiteSlaveReadInterface.rdata),
                                                         .rresp(axi4LiteSlaveReadInterface.rresp)
                                                         );

 Axi4LiteSlaveReadMonitorBFM axi4LiteSlaveReadMonitorBFM (.aclk(axi4LiteSlaveReadInterface.aclk),
                                                          .aresetn(axi4LiteSlaveReadInterface.aresetn),
                                                          .arvalid(axi4LiteSlaveReadInterface.arvalid),
                                                          .arready(axi4LiteSlaveReadInterface.arready),
                                                          .araddr(axi4LiteSlaveReadInterface.araddr),
                                                          .arprot(axi4LiteSlaveReadInterface.arprot),
                                                          .rvalid(axi4LiteSlaveReadInterface.rvalid),
                                                          .rready(axi4LiteSlaveReadInterface.rready),
                                                          .rdata(axi4LiteSlaveReadInterface.rdata),
                                                          .rresp(axi4LiteSlaveReadInterface.rresp)
                                                         );


  initial begin
    uvm_config_db#(virtual Axi4LiteSlaveReadDriverBFM)::set(null,"*", "Axi4LiteSlaveReadDriverBFM", axi4LiteSlaveReadDriverBFM); 
    uvm_config_db#(virtual Axi4LiteSlaveReadMonitorBFM)::set(null,"*", "Axi4LiteSlaveReadMonitorBFM",axi4LiteSlaveReadMonitorBFM);
  end

  bind Axi4LiteSlaveReadMonitorBFM Axi4LiteSlaveReadAssertions READSLAVE_ASSERTPROPERTY (.aclk(aclk),
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

  bind Axi4LiteSlaveReadMonitorBFM Axi4LiteSlaveReadCoverProperty READSLAVE_COVERPROPERTY (.aclk(aclk),
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
   uvm_config_db#(virtual Axi4LiteSlaveReadDriverBFM)::set(null,"*", "Axi4LiteSlaveReadDriverBFM", axi4LiteSlaveReadDriverBFM); 
    uvm_config_db#(virtual Axi4LiteSlaveReadMonitorBFM)::set(null,"*", "Axi4LiteSlaveReadMonitorBFM", axi4LiteSlaveReadMonitorBFM);
  end

  initial begin
    `uvm_info("Axi4LiteSlaveReadAgentBFM",$sformatf("AXI4LITE SlaveREADAGENTBFM"),UVM_LOW);
  end
   
endmodule : Axi4LiteSlaveReadAgentBFM
`endif
