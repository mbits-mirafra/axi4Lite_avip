`ifndef AXI4LITESLAVEWRITEAGENTBFM_INCLUDED_
`define AXI4LITESLAVEWRITEAGENTBFM_INCLUDED_

import Axi4LiteWriteSlaveGlobalPkg::*;
   
module Axi4LiteSlaveWriteAgentBFM #(parameter int ADDR_WIDTH = 32,
                                    parameter int DATA_WIDTH = 32
                                   )
                                   (input                      aclk,
                                    input                      aresetn,
                                    input                      awvalid,
                                    output reg                 awready,
                                    input  [ADDRESS_WIDTH-1:0] awaddr,
                                    input                [2:0] awprot,
                                    input                      wvalid,
                                    output reg                 wready,
                                    input     [DATA_WIDTH-1:0] wdata,
                                    input [(DATA_WIDTH/8)-1:0] wstrb,
                                    output reg                 bvalid,
                                    input                      bready,
                                    output reg           [1:0] bresp
                                   );

  import uvm_pkg::*;
  `include "uvm_macros.svh"

  Axi4LiteSlaveWriteDriverBFM axi4LiteSlaveWriteDriverBFM (.aclk(aclk),
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

  Axi4LiteSlaveWriteMonitorBFM axi4LiteSlaveWriteMonitorBFM (.aclk(aclk),
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
    uvm_config_db#(virtual Axi4LiteSlaveWriteDriverBFM)::set(null,"*", "Axi4LiteSlaveWriteDriverBFM", axi4LiteSlaveWriteDriverBFM); 
    uvm_config_db#(virtual Axi4LiteSlaveWriteMonitorBFM)::set(null,"*", "Axi4LiteSlaveWriteMonitorBFM", axi4LiteSlaveWriteMonitorBFM);
  end

  bind Axi4LiteSlaveWriteMonitorBFM Axi4LiteSlaveWriteAssertions WRITESLAVE_ASSERTPROPERTY (.aclk(aclk),
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


  bind Axi4LiteSlaveWriteMonitorBFM Axi4LiteSlaveWriteCoverProperty WRITESLAVE_COVERPROPERTY  (.aclk(aclk),
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
