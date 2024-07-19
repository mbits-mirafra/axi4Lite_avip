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
  `include "Axi4LiteBackToBackTransfersWith1ClkDelayTest.sv"
  `include "Axi4Lite32bitWriteDataTest.sv"
  `include "Axi4Lite32bitReadDataTest.sv"

endpackage : Axi4LiteTestPkg

`endif
