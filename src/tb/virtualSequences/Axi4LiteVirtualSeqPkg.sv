`ifndef AXI4LITEVIRTUALSEQPKG_INCLUDED_
`define AXI4LITEVIRTUALSEQPKG_INCLUDED_

package Axi4LiteVirtualSeqPkg;

  `include "uvm_macros.svh"
  import uvm_pkg::*;
  import Axi4LiteWriteMasterGlobalPkg::*;
  import Axi4LiteReadMasterGlobalPkg::*;
  import Axi4LiteMasterWritePkg::*;
  import Axi4LiteMasterReadPkg::*;
  import Axi4LiteSlaveWritePkg::*;
  import Axi4LiteSlaveReadPkg::*;

  import Axi4LiteMasterWriteSeqPkg::*;
  import Axi4LiteMasterReadSeqPkg::*;
  import Axi4LiteSlaveWriteSeqPkg::*;
  import Axi4LiteSlaveReadSeqPkg::*;

  import Axi4LiteEnvPkg::*;

  `include "Axi4LiteVirtualBaseSeq.sv"
  `include "Axi4LiteVirtualRandomWriteReadTransferSeq.sv"
  `include "Axi4LiteVirtual32bitWriteDataSeq.sv"
  `include "Axi4LiteVirtual32bitReadDataSeq.sv"
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
  `include "Axi4LiteVirtualAwvalidAssertedInbetween2To5ClkAwreadyAssertedSeq.sv"
  `include "Axi4LiteVirtualWvalidAssertedInbetween2To5ClkWreadyAssertedSeq.sv"
  `include "Axi4LiteVirtualBvalidAssertedInbetween2To5ClkBreadyAssertedSeq.sv"
  `include "Axi4LiteVirtualArvalidAssertedInbetween2To5ClkArreadyAssertedSeq.sv"
  `include "Axi4LiteVirtualRvalidAssertedInbetween2To5ClkRreadyAssertedSeq.sv"
  `include "Axi4LiteVirtual32bitWriteDataWithDelayForValidReadySeq.sv"
  `include "Axi4LiteVirtualAwvalidAwreadyAndWvalidWreadyAssertedSameClkNextClkBvalidAssertedSeq.sv"
  `include "Axi4LiteVirtualAwvalidAwreadyNextClkWvalidWreadyAssertedNextClkBvalidAssertedSeq.sv"
  `include "Axi4LiteVirtualAwvalidAwreadyNextClkWvalidWreadyAssertedThen1To12ClkBvalidAssertedSeq.sv"
  `include "Axi4LiteVirtualBackToBackTransfersWithoutDelaySeq.sv"
  `include "Axi4LiteVirtualBackToBackTransfersWith1ClkDelaySeq.sv"
  `include "Axi4LiteVirtualBackToBackTransfersWith2ClkDelaySeq.sv"
  `include "Axi4LiteVirtualBackToBackTransfersWith3To16ClkDelaySeq.sv"
  `include "Axi4LiteVirtual32bitWriteAndReadRandomAddressAndDataSeq.sv"
  `include "Axi4LiteVirtualArvalidArreadyAndNextClkRvalidRreadyAssertedSeq.sv"
  `include "Axi4LiteVirtualDelayForRvalidInside0To3Seq.sv"
  `include "Axi4LiteVirtualAddressOutsideMinAndMaxRangeSeq.sv"
  `include "Axi4LiteVirtual32bitWriteAndReadSameAddressAndDataSeq.sv"
  `include "Axi4LiteVirtualToggleReadySeq.sv"
  `include "Axi4LiteVirtualReadyAssertedNextClkValidAssertedSeq.sv"
  `include "Axi4LiteVirtualReadyAssertedAndDeAssertedAndNextClkValidAssertedSeq.sv"
  `include "Axi4LiteVirtualReadyAssertedAndDeAsserted3TimesAndNextClkValidAssertedSeq.sv"
  `include "Axi4LiteVirtualWriteDataWithWstrbSeq.sv"
  `include "Axi4LiteVirtual32bitDataWithAnyValueSeq.sv"
  `include "Axi4LiteVirtualMasterAndSlaveNotSupportReadOutstandingTransaction.sv"
  `include "Axi4LiteVirtualMasterAndSlaveNotSupportWriteOutstandingTransaction.sv"
  `include "Axi4LiteVirtualMasterAndSlaveSupportReadOutstandingTransaction.sv"
  `include "Axi4LiteVirtualMasterAndSlaveSupportWriteOutstandingTransaction.sv"
  `include "Axi4LiteVirtualMasterSupportAndSlaveNotSupportReadOutstandingTransaction.sv"
  `include "Axi4LiteVirtualMasterSupportAndSlaveNotSupportWriteOutstandingTransaction.sv"
  `include "Axi4LiteVirtualWriteSeq.sv"

endpackage : Axi4LiteVirtualSeqPkg

`endif

