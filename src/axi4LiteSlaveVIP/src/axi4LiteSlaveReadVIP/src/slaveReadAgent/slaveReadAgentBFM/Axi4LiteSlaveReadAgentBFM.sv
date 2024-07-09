`ifndef AXI4LITESLAVEREADAGENTBFM_INCLUDED_
`define AXI4LITESLAVEREADAGENTBFM_INCLUDED_

 import Axi4LiteReadSlaveGlobalPkg::*;

module Axi4LiteSlaveReadAgentBFM #(parameter int ADDR_WIDTH = 32,
                                   parameter int DATA_WIDTH = 32
                                   )
                                   (input bit  aclk,
                                    input bit  aresetn,
                                    //Read Address Channel Signals
                                    input                       arvalid,
                                    output reg                  arready,
                                    input   [ADDRESS_WIDTH-1:0] araddr,
                                    input                 [2:0] arprot,
                                    //Read Data Channel Signals
                                    output reg                  rvalid,
                                    input                       rready,
                                    output reg [DATA_WIDTH-1:0] rdata,
                                    output reg            [1:0] rresp
                                   );  

                                 
   import uvm_pkg::*;
  `include "uvm_macros.svh"

  Axi4LiteSlaveReadDriverBFM axi4LiteSlaveReadDriverBFM (.aclk(aclk),
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

 Axi4LiteSlaveReadMonitorBFM axi4LiteSlaveReadMonitorBFM (.aclk(aclk),
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
    uvm_config_db#(virtual Axi4LiteSlaveReadMonitorBFM)::set(null,"*", "Axi4LiteSlaveReadMonitorBFM",axi4LiteSlaveReadMonitorBFM);
  end

  bind axi4LiteSlaveReadMonitorBFM Axi4LiteSlaveReadAssertions M_A (.aclk(aclk),
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
