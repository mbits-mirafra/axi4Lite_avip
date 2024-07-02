`ifndef AXI4LITEMASTERWRITESEQPKG_INCLUDED
`define AXI4LITEMASTERWRITESEQPKG_INCLUDED

package Axi4LiteMasterWriteSeqPkg;

  `include "uvm_macros.svh"
  import uvm_pkg::*;
  import Axi4LiteWriteMasterGlobalPkg::*;
  import Axi4LiteMasterWriteAssertCoverParameter::*;
  import Axi4LiteMasterWritePkg::*;
 
  `include "Axi4LiteMasterWriteBaseSeq.sv"
  `include "Axi4LiteMasterWriteRandomTransferSeq.sv"
  `include "Axi4LiteMasterWriteDelayForWvalidSeq.sv"
  `include "Axi4LiteMasterWriteDelayForBreadySeq.sv"

endpackage : Axi4LiteMasterWriteSeqPkg
`endif
