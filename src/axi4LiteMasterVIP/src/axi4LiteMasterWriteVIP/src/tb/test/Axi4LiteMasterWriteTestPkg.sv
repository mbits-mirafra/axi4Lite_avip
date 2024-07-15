`ifndef AXI4LITEMASTERWRITETESTPKG_INCLUDED_
`define AXI4LITEMASTERWRITETESTPKG_INCLUDED_

package Axi4LiteMasterWriteTestPkg;
  
  `include "uvm_macros.svh"
  import uvm_pkg::*;
  import Axi4LiteWriteMasterGlobalPkg::*;
  import Axi4LiteMasterWritePkg::*;
  import Axi4LiteWriteMasterEnvPkg::*;
  import Axi4LiteMasterWriteAssertCoverParameter::*;

  import Axi4LiteMasterWriteSeqPkg::*;

  //including base_test for testing
  `include "Axi4LiteMasterWriteBaseTest.sv"
  `include "Axi4LiteMasterWriteRandomTransferTest.sv"
  `include "Axi4LiteMasterWriteDelayForWvalidTest.sv"
  `include "Axi4LiteMasterWriteDelayForBreadyTest.sv"
  `include "Axi4LiteMasterWriteAddressInsideMinAndMaxRangeTest.sv"
  `include "Axi4LiteMasterWriteAwreadyLowAfter3ClkAwvalidHighTest.sv"
  `include "Axi4LiteMasterWriteEvenAddressTest.sv"
  `include "Axi4LiteMasterWriteOddAddressTest.sv"
  `include "Axi4LiteMasterWriteWdataMaxValueTest.sv"
  `include "Axi4LiteMasterWriteWdataToggleValueTest.sv"
  `include "Axi4LiteMasterWriteWstrbSingleBitOneTest.sv"
  `include "Axi4LiteMasterWriteWstrbAnyTwoBitsOneTest.sv"
  `include "Axi4LiteMasterWriteWstrbAnyThreeBitsOneTest.sv"
  `include "Axi4LiteMasterWriteWstrbAllBitsOneTest.sv"
  `include "Axi4LiteMasterWriteModBy4AddressTest.sv"

endpackage : Axi4LiteMasterWriteTestPkg

`endif
