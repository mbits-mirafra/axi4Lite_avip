`ifndef AXI4LITESLAVEREADSEQPKG_INCLUDED
`define AXI4LITESLAVEREADSEQPKG_INCLUDED

package Axi4LiteSlaveReadSeqPkg;

  `include "uvm_macros.svh"
  import uvm_pkg::*;
  import Axi4LiteSlaveReadPkg::*;
  import Axi4LiteReadSlaveGlobalPkg::*; 
 
  `include "Axi4LiteSlaveReadBaseSeq.sv"
  `include "Axi4LiteSlaveReadRandomTransferSeq.sv"

endpackage : Axi4LiteSlaveReadSeqPkg
`endif
