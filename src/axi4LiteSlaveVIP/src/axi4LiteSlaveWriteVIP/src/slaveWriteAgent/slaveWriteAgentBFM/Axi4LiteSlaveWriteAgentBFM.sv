`ifndef AXI4LITESLAVEWRITEAGENTBFM_INCLUDED_
`define AXI4LITESLAVEWRITEAGENTBFM_INCLUDED_

import Axi4LiteWriteSlaveGlobalPkg::*;
   
module Axi4LiteSlaveWriteAgentBFM #(parameter int ADDR_WIDTH = 32,
                                    parameter int DATA_WIDTH = 32
                                   )
                                   (Axi4LiteSlaveWriteInterface axi4LiteSlaveWriteInterface);

  import uvm_pkg::*;
  `include "uvm_macros.svh"

  Axi4LiteSlaveWriteDriverBFM axi4LiteSlaveWriteDriverBFM (.aclk(axi4LiteSlaveWriteInterface.aclk),
                                                           .aresetn(axi4LiteSlaveWriteInterface.aresetn),
                                                           .awvalid(axi4LiteSlaveWriteInterface.awvalid),
                                                           .awready(axi4LiteSlaveWriteInterface.awready),
                                                           .awaddr(axi4LiteSlaveWriteInterface.awaddr),
                                                           .awprot(axi4LiteSlaveWriteInterface.awprot),
                                                           .wvalid(axi4LiteSlaveWriteInterface.wvalid),
                                                           .wready(axi4LiteSlaveWriteInterface.wready),
                                                           .wdata(axi4LiteSlaveWriteInterface.wdata),
                                                           .wstrb(axi4LiteSlaveWriteInterface.wstrb),
                                                           .bvalid(axi4LiteSlaveWriteInterface.bvalid),
                                                           .bready(axi4LiteSlaveWriteInterface.bready),
                                                           .bresp(axi4LiteSlaveWriteInterface.bresp)
                                                          );

  Axi4LiteSlaveWriteMonitorBFM axi4LiteSlaveWriteMonitorBFM (.aclk(axi4LiteSlaveWriteInterface.aclk),
                                                             .aresetn(axi4LiteSlaveWriteInterface.aresetn),
                                                             .awvalid(axi4LiteSlaveWriteInterface.awvalid),
                                                             .awready(axi4LiteSlaveWriteInterface.awready),
                                                             .awaddr(axi4LiteSlaveWriteInterface.awaddr),
                                                             .awprot(axi4LiteSlaveWriteInterface.awprot),
                                                             .wvalid(axi4LiteSlaveWriteInterface.wvalid),
                                                             .wready(axi4LiteSlaveWriteInterface.wready),
                                                             .wdata(axi4LiteSlaveWriteInterface.wdata),
                                                             .wstrb(axi4LiteSlaveWriteInterface.wstrb),
                                                             .bvalid(axi4LiteSlaveWriteInterface.bvalid),
                                                             .bready(axi4LiteSlaveWriteInterface.bready),
                                                             .bresp(axi4LiteSlaveWriteInterface.bresp)
                                                            );


  initial begin
    uvm_config_db#(virtual Axi4LiteSlaveWriteDriverBFM)::set(null,"*", "Axi4LiteSlaveWriteDriverBFM", axi4LiteSlaveWriteDriverBFM); 
    uvm_config_db#(virtual Axi4LiteSlaveWriteMonitorBFM)::set(null,"*", "Axi4LiteSlaveWriteMonitorBFM", axi4LiteSlaveWriteMonitorBFM);
  end

  bind axi4LiteSlaveWriteMonitorBFM Axi4LiteSlaveWriteAssertions WRITESLAVE_ASSERTPROPERTY (.aclk(aclk),
                                                                                            .aresetn(aresetn),
                                                                                            .awvalid(awvalid),
                                                                                            .awready(awready),
                                                                                            .awaddr(awaddr),
                                                                                            .awprot(awprot),
                                                                                            .wvalid(wvalid),
                                                                                            .wready(wready),
                                                                                            .wdata(wdata),
                                                                                            .wstrb(wstrb),
                                                                                            .bvalid(bvalid),
                                                                                            .bready(bready),
                                                                                            .bresp(bresp)
                                                                                            );


  bind axi4LiteSlaveWriteMonitorBFM Axi4LiteSlaveWriteCoverProperty WRITESLAVE_COVERPROPERTY  (.aclk(aclk),
                                                                                               .aresetn(aresetn),
                                                                                               .awvalid(awvalid),
                                                                                               .awready(awready),
                                                                                               .awaddr(awaddr),
                                                                                               .awprot(awprot),
                                                                                               .wvalid(wvalid),
                                                                                               .wready(wready),
                                                                                               .wdata(wdata),
                                                                                               .wstrb(wstrb),
                                                                                               .bvalid(bvalid),
                                                                                               .bready(bready),
                                                                                               .bresp(bresp)
                                                                                             );

                                                                     
  initial begin
    `uvm_info("Axi4LiteSlaveWriteAgentBFM",$sformatf("AXI4LITE SLAVEWRITEAGENTBFM"),UVM_LOW);
  end
   
endmodule : Axi4LiteSlaveWriteAgentBFM
`endif
