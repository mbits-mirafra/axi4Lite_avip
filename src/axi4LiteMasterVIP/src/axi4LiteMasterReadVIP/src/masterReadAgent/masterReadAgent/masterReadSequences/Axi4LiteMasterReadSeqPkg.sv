`ifndef AXI4LITEMASTERREADSEQPKG_INCLUDED
`define AXI4LITEMASTERREADSEQPKG_INCLUDED

package Axi4LiteMasterReadSeqPkg;

  `include "uvm_macros.svh"
  import uvm_pkg::*;
  import Axi4LiteReadMasterGlobalPkg::*;
  import Axi4LiteMasterReadAssertCoverParameter::*;
  import Axi4LiteMasterReadPkg::*;
 
  `include "Axi4LiteMasterReadBaseSeq.sv"
  `include "Axi4LiteMasterReadRandomTransferSeq.sv"
  `include "Axi4LiteMasterRead32bitsTransferSeq.sv"
  
endpackage : Axi4LiteMasterReadSeqPkg
`endif
