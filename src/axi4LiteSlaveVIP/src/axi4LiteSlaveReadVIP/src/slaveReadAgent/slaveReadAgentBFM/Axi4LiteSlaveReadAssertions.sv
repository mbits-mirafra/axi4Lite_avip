`ifndef AXI4LITESLAVEREADASSERTIONS_INCLUDED_
`define AXI4LITESLAVEREADASSERTIONS_INCLUDED_

import Axi4LiteReadSlaveGlobalPkg::*;
import Axi4LiteSlaveReadAssertCoverParameter::*;

interface Axi4LiteSlaveReadAssertions (input aclk,
                                       input aresetn,
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
  `include "uvm_macros.svh";

  initial begin
    `uvm_info("Axi4LiteSlaveReadAssertions","Axi4LiteSlaveReadAssertions",UVM_LOW);
  end

endinterface : Axi4LiteSlaveReadAssertions

`endif

