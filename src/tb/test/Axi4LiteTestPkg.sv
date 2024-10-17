`ifndef AXI4LITETESTPKG_INCLUDED_
`define AXI4LITETESTPKG_INCLUDED_

package Axi4LiteTestPkg;
  
  `include "uvm_macros.svh"
  import uvm_pkg::*;
  import Axi4LiteWriteMasterGlobalPkg::*;
  import Axi4LiteReadMasterGlobalPkg::*;
  import Axi4LiteWriteSlaveGlobalPkg::*;
  import Axi4LiteReadSlaveGlobalPkg::*;
  import Axi4LiteMasterWriteAssertCoverParameter::*;
  import Axi4LiteMasterReadAssertCoverParameter::*;
  import Axi4LiteSlaveWriteAssertCoverParameter::*;
  import Axi4LiteSlaveReadAssertCoverParameter::*;
  import Axi4LiteMasterWritePkg::*;
  import Axi4LiteMasterReadPkg::*;
  import Axi4LiteSlaveWritePkg::*;
  import Axi4LiteSlaveReadPkg::*;
  import Axi4LiteWriteMasterEnvPkg::*;
  import Axi4LiteReadMasterEnvPkg::*;
  import Axi4LiteWriteSlaveEnvPkg::*;
  import Axi4LiteReadSlaveEnvPkg::*;
  import Axi4LiteMasterEnvPkg::*;
  import Axi4LiteSlaveEnvPkg::*;
  import Axi4LiteEnvPkg::*;

  import Axi4LiteVirtualSeqPkg::*;

  //including base_test for testing
  `include "Axi4LiteBaseTest.sv"
  `include "Axi4LiteRandomWriteReadTransferTest.sv"
  `include "Axi4LiteDelayForAwvalidAndAwreadyTest.sv"
  `include "Axi4LiteDelayForWvalidAndWreadyTest.sv"
  `include "Axi4LiteDelayForBvalidAndBreadyTest.sv"
  `include "Axi4LiteDelayForArvalidAndArreadyTest.sv"
  `include "Axi4LiteDelayForRvalidAndRreadyTest.sv"
  `include "Axi4LiteAwvalidAssertedAndSameClkAwreadyAssertedTest.sv"
  `include "Axi4LiteAwvalidAssertedAndNextClkAwreadyAssertedTest.sv"
  `include "Axi4LiteWvalidAssertedAndSameClkWreadyAssertedTest.sv"
  `include "Axi4LiteWvalidAssertedAndNextClkWreadyAssertedTest.sv"
  `include "Axi4LiteBvalidAssertedAndSameClkBreadyAssertedTest.sv"
  `include "Axi4LiteBvalidAssertedAndNextClkBreadyAssertedTest.sv"
  `include "Axi4LiteArvalidAssertedAndSameClkArreadyAssertedTest.sv"
  `include "Axi4LiteArvalidAssertedAndNextClkArreadyAssertedTest.sv"
  `include "Axi4LiteRvalidAssertedAndSameClkRreadyAssertedTest.sv"
  `include "Axi4LiteRvalidAssertedAndNextClkRreadyAssertedTest.sv"
  `include "Axi4Lite32bitWriteDataTest.sv"
  `include "Axi4Lite32bitReadDataTest.sv"
  `include "Axi4LiteAwvalidAssertedInbetween2To5ClkAwreadyAssertedTest.sv"
  `include "Axi4LiteWvalidAssertedInbetween2To5ClkWreadyAssertedTest.sv"
  `include "Axi4LiteBvalidAssertedInbetween2To5ClkBreadyAssertedTest.sv"
  `include "Axi4LiteArvalidAssertedInbetween2To5ClkArreadyAssertedTest.sv"
  `include "Axi4LiteRvalidAssertedInbetween2To5ClkRreadyAssertedTest.sv"
  `include "Axi4Lite32bitWriteDataWithDelayForValidReadyTest.sv"
  `include "Axi4LiteAwvalidAwreadyAndWvalidWreadyAssertedSameClkNextClkBvalidAssertedTest.sv"
  `include "Axi4LiteAwvalidAwreadyNextClkWvalidWreadyAssertedNextClkBvalidAssertedTest.sv"
  `include "Axi4LiteAwvalidAwreadyNextClkWvalidWreadyAssertedThen1To12ClkBvalidAssertedTest.sv"
  `include "Axi4Lite32bitWriteAndReadRandomAddressAndDataTest.sv"
  `include "Axi4LiteArvalidArreadyAndNextClkRvalidRreadyAssertedTest.sv"
  `include "Axi4LiteDelayForRvalidInside0To3Test.sv"
  `include "Axi4LiteAddressOutsideMinAndMaxRangeTest.sv"
  `include "Axi4Lite32bitWriteAndReadSameAddressAndDataTest.sv"
  `include "Axi4LiteToggleReadyTest.sv"
  `include "Axi4LiteReadyAssertedNextClkValidAssertedTest.sv"
  `include "Axi4LiteReadyAssertedAndDeAssertedAndNextClkValidAssertedTest.sv"
  `include "Axi4LiteReadyAssertedAndDeAsserted3TimesAndNextClkValidAssertedTest.sv"
  `include "Axi4LiteWriteDataWithWstrbTest.sv"
  `include "Axi4Lite32bitDataWithAnyValueTest.sv"
  `include "Axi4LiteBackToBackTransfersWithoutDelayTest.sv"
  `include "Axi4LiteBackToBackTransfersWith1ClkDelayTest.sv"
  `include "Axi4LiteBackToBackTransfersWith2ClkDelayTest.sv"
  `include "Axi4LiteBackToBackTransfersWith3To16ClkDelayTest.sv"
  `include "Axi4LiteMasterAndSlaveNotSupportReadOutstandingTransactionTest.sv"
  `include "Axi4LiteMasterAndSlaveNotSupportWriteOutstandingTransactionTest.sv"
  `include "Axi4LiteMasterAndSlaveSupportReadOutstandingTransactionTest.sv"
  `include "Axi4LiteMasterAndSlaveSupportWriteOutstandingTransactionTest.sv"
  `include "Axi4LiteMasterSupportAndSlaveNotSupportReadOutstandingTransactionTest.sv"
  `include "Axi4LiteMasterSupportAndSlaveNotSupportWriteOutstandingTransactionTest.sv"
  `include "Axi4LiteWriteTest.sv"

endpackage : Axi4LiteTestPkg

`endif
