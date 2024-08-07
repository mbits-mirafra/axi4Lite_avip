`ifndef AXI4LITEMASTERWRITEAGENTBFM_INCLUDED_
`define AXI4LITEMASTERWRITEAGENTBFM_INCLUDED_

 import Axi4LiteWriteMasterGlobalPkg::*;

module Axi4LiteMasterWriteAgentBFM #(parameter int ADDR_WIDTH = 32,
                                     parameter int DATA_WIDTH = 32
                                    )
                                    (input                           aclk,
                                     input                           aresetn,
                                     output reg                      awvalid,
                                     input                           awready,
                                     output reg  [ADDRESS_WIDTH-1:0] awaddr,
                                     output reg                [2:0] awprot,
                                     output reg                      wvalid,
                                     input                           wready,
                                     output reg     [DATA_WIDTH-1:0] wdata,
                                     output reg [(DATA_WIDTH/8)-1:0] wstrb,
                                     input                           bvalid,
                                     output reg                      bready,
                                     input                     [1:0] bresp
                                     );
   
  import uvm_pkg::*;
  `include "uvm_macros.svh"
  Axi4LiteMasterWriteDriverBFM axi4LiteMasterWriteDriverBFM (.aclk(aclk), 
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

  Axi4LiteMasterWriteMonitorBFM axi4LiteMasterWriteMonitorBFM (.aclk(aclk),
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

  //-------------------------------------------------------
  // Setting the virtual handle of BMFs into config_db
  //-------------------------------------------------------
  initial begin
    uvm_config_db#(virtual Axi4LiteMasterWriteDriverBFM)::set(null,"*", "Axi4LiteMasterWriteDriverBFM", axi4LiteMasterWriteDriverBFM); 
    uvm_config_db#(virtual Axi4LiteMasterWriteMonitorBFM)::set(null,"*", "Axi4LiteMasterWriteMonitorBFM", axi4LiteMasterWriteMonitorBFM);
  end

  bind axi4LiteMasterWriteMonitorBFM Axi4LiteMasterWriteAssertions WRITEMASTER_ASSERTPROPERTY (.aclk(aclk),
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

  bind axi4LiteMasterWriteMonitorBFM Axi4LiteMasterWriteCoverProperty WRITEMASTER_COVERPROPERTY (.aclk(aclk),
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
    `uvm_info("Axi4LiteMasterWriteAgentBFM",$sformatf("AXI4LITE MASTERWRITEAGENTBFM"),UVM_LOW);
  end
   
endmodule : Axi4LiteMasterWriteAgentBFM
`endif
