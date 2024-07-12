`ifndef AXI4LITESLAVEREADSEQPKG_INCLUDED
`define AXI4LITESLAVEREADSEQPKG_INCLUDED

package Axi4LiteSlaveReadSeqPkg;

  `include "uvm_macros.svh"
  import uvm_pkg::*;
  import Axi4LiteReadSlaveGlobalPkg::*; 
  import Axi4LiteSlaveReadAssertCoverParameter::*;
  import Axi4LiteSlaveReadPkg::*;
 
  `include "Axi4LiteSlaveReadBaseSeq.sv"
  `include "Axi4LiteSlaveReadRandomTransferSeq.sv"
  `include "Axi4LiteSlaveReadDelayForArreadySeq.sv"
  `include "Axi4LiteSlaveReadDelayForRvalidSeq.sv"

endpackage : Axi4LiteSlaveReadSeqPkg
`endif
