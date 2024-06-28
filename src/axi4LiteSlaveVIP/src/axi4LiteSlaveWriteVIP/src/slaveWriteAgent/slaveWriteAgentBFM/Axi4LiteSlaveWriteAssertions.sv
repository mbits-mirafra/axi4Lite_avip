`ifndef AXI4LITESLAVEWRITEASSERTIONS_INCLUDED_
`define AXI4LITESLAVEWRITEASSERTIONS_INCLUDED_

import Axi4LiteWriteSlaveGlobalPkg::*;

interface Axi4LiteSlaveWriteAssertions (input aclk,
                                        input aresetn,
                                        //Write Address Channel Signals
                                        input  awvalid,
                                        input  awready,
                                        input  [ADDRESS_WIDTH-1:0] awaddr,
                                        input  [2:0] awprot,
                                        //Write Data Channel Signals
                                        input  wvalid,
                                        input  wready,
                                        input  [DATA_WIDTH-1:0] wdata,
                                        input  [(DATA_WIDTH/8)-1:0] wstrb,
                                        //Write Response Channel
                                        input  bvalid,
                                        input  bready,
                                        input  [1:0] bresp
                                       );  

  import uvm_pkg::*;
  `include "uvm_macros.svh";

  initial begin
    `uvm_info("Axi4LiteSlaveWriteAssertions","Axi4LiteSlaveWriteAssertions",UVM_LOW);
  end

 
endinterface : Axi4LiteSlaveWriteAssertions

`endif

