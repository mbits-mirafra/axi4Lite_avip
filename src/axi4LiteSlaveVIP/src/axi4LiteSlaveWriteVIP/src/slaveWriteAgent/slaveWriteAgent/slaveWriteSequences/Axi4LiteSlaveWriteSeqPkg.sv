`ifndef AXI4LITESLAVEWRITESEQPKG_INCLUDED
`define AXI4LITESLAVEWRITESEQPKG_INCLUDED

package Axi4LiteSlaveWriteSeqPkg;

  `include "uvm_macros.svh"
  import uvm_pkg::*;
  import Axi4LiteWriteSlaveGlobalPkg::*; 
  import Axi4LiteSlaveWriteAssertCoverParameter::*;
  import Axi4LiteSlaveWritePkg::*;
 
  `include "Axi4LiteSlaveWriteBaseSeq.sv"
  `include "Axi4LiteSlaveWrite32bitsTransferSeq.sv"
  `include "Axi4LiteSlaveWrite32bitsTransferWithToggleReadySeq.sv"

endpackage : Axi4LiteSlaveWriteSeqPkg
`endif
