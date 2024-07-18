`ifndef AXI4LITEVIRTUALSEQPKG_INCLUDED_
`define AXI4LITEVIRTUALSEQPKG_INCLUDED_

package Axi4LiteVirtualSeqPkg;

  `include "uvm_macros.svh"
  import uvm_pkg::*;
  import Axi4LiteMasterWritePkg::*;
  import Axi4LiteMasterReadPkg::*;
  import Axi4LiteSlaveWritePkg::*;
  import Axi4LiteSlaveReadPkg::*;

  import Axi4LiteMasterWriteSeqPkg::*;
  import Axi4LiteMasterReadSeqPkg::*;
  import Axi4LiteSlaveWriteSeqPkg::*;
  import Axi4LiteSlaveReadSeqPkg::*;

  import Axi4LiteMasterVirtualSeqrPkg::*;
  import Axi4LiteSlaveVirtualSeqrPkg::*;

  import Axi4LiteEnvPkg::*;

  `include "Axi4LiteVirtualBaseSeq.sv"
  `include "Axi4LiteVirtualRandomWriteReadTransferSeq.sv"
  `include "Axi4LiteVirtualDelayForAwvalidAndAwreadySeq.sv"
  `include "Axi4LiteVirtualDelayForWvalidAndWreadySeq.sv"
  `include "Axi4LiteVirtualDelayForBvalidAndBreadySeq.sv"
  `include "Axi4LiteVirtualDelayForArvalidAndArreadySeq.sv"
  `include "Axi4LiteVirtualDelayForRvalidAndRreadySeq.sv"
  `include "Axi4LiteVirtualAwvalidAssertedAndSameClkAwreadyAssertedSeq.sv"
  `include "Axi4LiteVirtualAwvalidAssertedAndNextClkAwreadyAssertedSeq.sv"
  `include "Axi4LiteVirtualWvalidAssertedAndSameClkWreadyAssertedSeq.sv"
  `include "Axi4LiteVirtualWvalidAssertedAndNextClkWreadyAssertedSeq.sv"
  `include "Axi4LiteVirtualBvalidAssertedAndSameClkBreadyAssertedSeq.sv"
  `include "Axi4LiteVirtualBvalidAssertedAndNextClkBreadyAssertedSeq.sv"
  `include "Axi4LiteVirtualArvalidAssertedAndSameClkArreadyAssertedSeq.sv"
  `include "Axi4LiteVirtualArvalidAssertedAndNextClkArreadyAssertedSeq.sv"
  `include "Axi4LiteVirtualRvalidAssertedAndSameClkRreadyAssertedSeq.sv"
  `include "Axi4LiteVirtualRvalidAssertedAndNextClkRreadyAssertedSeq.sv"

endpackage : Axi4LiteVirtualSeqPkg

`endif

