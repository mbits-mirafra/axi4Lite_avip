`ifndef AXI4LITESLAVEVIRTUALSEQRPKG_INCLUDED_
`define AXI4LITESLAVEVIRTUALSEQRPKG_INCLUDED_

package Axi4LiteSlaveVirtualSeqrPkg;
  
 `include "uvm_macros.svh"
  import uvm_pkg::*;
  import Axi4LiteSlaveWritePkg::*;
  import Axi4LiteSlaveReadPkg::*;

 `include "Axi4LiteSlaveVirtualSequencer.sv"

endpackage : Axi4LiteSlaveVirtualSeqrPkg

`endif
