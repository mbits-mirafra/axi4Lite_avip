`ifndef AXI4LITEMASTERWRITESEQPKG_INCLUDED
`define AXI4LITEMASTERWRITESEQPKG_INCLUDED

package Axi4LiteMasterWriteSeqPkg;

  `include "uvm_macros.svh"
  import uvm_pkg::*;
  import Axi4LiteMasterWritePkg::*;
//  import Axi4LiteMasterWriteBFMPkg::*;
 
  `include "Axi4LiteMasterWriteBaseSeq.sv"
  `include "Axi4LiteMasterWriteRandomAddressTransferSeq.sv"

endpackage : Axi4LiteMasterWriteSeqPkg
`endif
