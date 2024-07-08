`ifndef AXI4LITEVIRTUALSEQRPKG_INCLUDED_
`define AXI4LITEVIRTUALSEQRPKG_INCLUDED_

package Axi4LiteVirtualSeqrPkg;
  
 `include "uvm_macros.svh"
  import uvm_pkg::*;
  import Axi4LiteMasterWritePkg::*;
  import Axi4LiteMasterReadPkg::*;
  import Axi4LiteMasterVirtualSeqrPkg::*;
  import Axi4LiteSlaveVirtualSeqrPkg::*;

 `include "Axi4LiteVirtualSequencer.sv"

endpackage : Axi4LiteVirtualSeqrPkg

`endif
