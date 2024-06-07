`ifndef AXI4LITEMASTERWRITECOVERPROPERTY_INCLUDED_
`define AXI4LITEMASTERWRITECOVERPROPERTY_INCLUDED_

interface Axi4LiteMasterWriteCoverProperty (input  aclk,
                                         input  aresetn,
                                         //Write Address Channel Signals
                                         input  awvalid,
                                         input  awready,
                                         //Write Data Channel Signals
                                         input  wvalid,
                                         input  wready,
                                         //Write Response Channel
                                         input  bvalid,
                                         input  bready
                                        );  

  import uvm_pkg::*;
  import axi4LiteWriteMasterGlobalPkg::*;
  `include "uvm_macros.svh";

  initial begin
    `uvm_info("Axi4LiteMasterWriteCoverProperty","Axi4LiteMasterWriteCoverProperty",UVM_LOW);
  end


endinterface : Axi4LiteMasterWriteCoverProperty

`endif

