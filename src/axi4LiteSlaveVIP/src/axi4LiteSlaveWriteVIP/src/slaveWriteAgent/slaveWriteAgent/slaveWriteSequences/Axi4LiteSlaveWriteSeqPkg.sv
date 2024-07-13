`ifndef AXI4LITESLAVEWRITESEQPKG_INCLUDED
`define AXI4LITESLAVEWRITESEQPKG_INCLUDED

package Axi4LiteSlaveWriteSeqPkg;

  `include "uvm_macros.svh"
  import uvm_pkg::*;
  import Axi4LiteWriteSlaveGlobalPkg::*; 
  import Axi4LiteSlaveWriteAssertCoverParameter::*;
  import Axi4LiteSlaveWritePkg::*;
 
  `include "Axi4LiteSlaveWriteBaseSeq.sv"
  `include "Axi4LiteSlaveWriteRandomTransferSeq.sv"
  `include "Axi4LiteSlaveWriteDelayForAwreadySeq.sv"
  `include "Axi4LiteSlaveWriteDelayForWreadySeq.sv"
  `include "Axi4LiteSlaveWriteDelayForBvalidSeq.sv"
  `include "Axi4LiteSlaveWriteAddressInsideMinAndMaxRangeSeq.sv"

endpackage : Axi4LiteSlaveWriteSeqPkg
`endif
