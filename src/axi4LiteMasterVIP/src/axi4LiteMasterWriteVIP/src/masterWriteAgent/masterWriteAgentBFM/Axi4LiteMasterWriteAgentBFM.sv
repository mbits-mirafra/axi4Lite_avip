`ifndef AXI4LITEMASTERWRITEAGENTBFM_INCLUDED_
`define AXI4LITEMASTERWRITEAGENTBFM_INCLUDED_

 import Axi4LiteWriteMasterGlobalPkg::*;

module Axi4LiteMasterWriteAgentBFM #(parameter int ADDR_WIDTH = 32,
                                     parameter int DATA_WIDTH = 32
                                    )
                                    (input  aclk,
                                     input  aresetn,
                                     output awvalid,
                                     input  awready,
                                     output [ADDRESS_WIDTH-1:0] awaddr,
                                     output [2:0] awprot,
                                     output wvalid,
                                     output [DATA_WIDTH-1:0] wdata,
                                     output [(DATA_WIDTH/8)-1:0] wstrb,
                                     input  wready,
                                     input  bvalid,
                                     output bready,
                                     input  [1:0] bresp
                                     );
   
  import uvm_pkg::*;
  `include "uvm_macros.svh"
  
  Axi4LiteMasterWriteInterface axi4LiteMasterWriteInterface(.aclk(aclk), 
                                                            .aresetn(aresetn)
                                                           );

  Axi4LiteMasterWriteDriverBFM axi4LiteMasterWriteDriverBFM (.aclk(axi4LiteMasterWriteInterface.aclk), 
                                                             .aresetn(axi4LiteMasterWriteInterface.aresetn),
                                                             .awvalid(axi4LiteMasterWriteInterface.awvalid),
                                                             .awready(axi4LiteMasterWriteInterface.awready),
                                                             .awaddr(axi4LiteMasterWriteInterface.awaddr),
                                                             .awprot(axi4LiteMasterWriteInterface.awprot),
                                                             .wvalid(axi4LiteMasterWriteInterface.wvalid),
                                                             .wready(axi4LiteMasterWriteInterface.wready),
                                                             .wdata(axi4LiteMasterWriteInterface.wdata),
                                                             .wstrb(axi4LiteMasterWriteInterface.wstrb),
                                                             .bvalid(axi4LiteMasterWriteInterface.bvalid),
                                                             .bready(axi4LiteMasterWriteInterface.bready),
                                                             .bresp(axi4LiteMasterWriteInterface.bresp)
                                                            );

  Axi4LiteMasterWriteMonitorBFM axi4LiteMasterWriteMonitorBFM (.aclk(axi4LiteMasterWriteInterface.aclk),
                                                               .aresetn(axi4LiteMasterWriteInterface.aresetn),
                                                               .awvalid(axi4LiteMasterWriteInterface.awvalid),
                                                               .awready(axi4LiteMasterWriteInterface.awready),
                                                               .awaddr(axi4LiteMasterWriteInterface.awaddr),
                                                               .awprot(axi4LiteMasterWriteInterface.awprot),
                                                               .wvalid(axi4LiteMasterWriteInterface.wvalid),
                                                               .wready(axi4LiteMasterWriteInterface.wready),
                                                               .wdata(axi4LiteMasterWriteInterface.wdata),
                                                               .wstrb(axi4LiteMasterWriteInterface.wstrb),
                                                               .bvalid(axi4LiteMasterWriteInterface.bvalid),
                                                               .bready(axi4LiteMasterWriteInterface.bready),
                                                               .bresp(axi4LiteMasterWriteInterface.bresp)
                                                               );

  assign awvalid = axi4LiteMasterWriteInterface.awvalid;
  assign wvalid  = axi4LiteMasterWriteInterface.wvalid;
  assign bready  = axi4LiteMasterWriteInterface.bready;

  assign axi4LiteMasterWriteInterface.awready = awready;   
  assign axi4LiteMasterWriteInterface.wready  = wready;  
  assign axi4LiteMasterWriteInterface.bvalid  = bvalid;  

  //-------------------------------------------------------
  // Setting the virtual handle of BMFs into config_db
  //-------------------------------------------------------
  initial begin
    uvm_config_db#(virtual Axi4LiteMasterWriteDriverBFM)::set(null,"*", "Axi4LiteMasterWriteDriverBFM", axi4LiteMasterWriteDriverBFM); 
    uvm_config_db#(virtual Axi4LiteMasterWriteMonitorBFM)::set(null,"*", "Axi4LiteMasterWriteMonitorBFM", axi4LiteMasterWriteMonitorBFM);
  end

  bind axi4LiteMasterWriteMonitorBFM Axi4LiteMasterWriteAssertions M_A (.aclk(aclk),
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
