`ifndef AXI4LITESLAVEREADCOVERPROPERTY_INCLUDED_
`define AXI4LITESLAVEREADCOVERPROPERTY_INCLUDED_

 import Axi4LiteReadSlaveGlobalPkg::*;
  
interface Axi4LiteSlaveReadCoverProperty (input  aclk,
                                           input  aresetn,
                                           //Read Address Channel Signals
                                           input arvalid,
                                           input  arready,
                                           input [ADDRESS_WIDTH-1:0] araddr,
                                           input [2:0] arprot,
                                           //Read Data Channel Signals
                                           input  rvalid,
                                           input rready,
                                           input  [DATA_WIDTH-1:0] rdata,
                                           input  [1:0] rresp
                                         );  

  import uvm_pkg::*;
  import Axi4LiteSlaveReadAssertCoverParameter::*; 
  `include "uvm_macros.svh";

  initial begin
    `uvm_info("Axi4LiteSlaveReadCoverProperty","Axi4LiteSlaveReadCoverProperty",UVM_LOW);
  end
  
endinterface : Axi4LiteSlaveReadCoverProperty

`endif

