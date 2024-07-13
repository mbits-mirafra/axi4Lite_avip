`ifndef AXI4LITEMASTERREADTESTPKG_INCLUDED_
`define AXI4LITEMASTERREADTESTPKG_INCLUDED_

package Axi4LiteMasterReadTestPkg;
  
  `include "uvm_macros.svh"
  import uvm_pkg::*;
  import Axi4LiteReadMasterGlobalPkg::*;
  import Axi4LiteMasterReadAssertCoverParameter::*;
  import Axi4LiteMasterReadPkg::*;
  import Axi4LiteReadMasterEnvPkg::*;

  import Axi4LiteMasterReadSeqPkg::*;

  //including base_test for testing
  `include "Axi4LiteMasterReadBaseTest.sv"
  `include "Axi4LiteMasterReadRandomTransferTest.sv"
  `include "Axi4LiteMasterReadDelayForRreadyTest.sv"
  `include "Axi4LiteMasterReadDelayForArvalidTest.sv"
  `include "Axi4LiteMasterReadAddressInsideMinAndMaxRangeTest.sv"
  `include "Axi4LiteMasterReadEvenAddressTest.sv"
  `include "Axi4LiteMasterReadOddAddressTest.sv"

endpackage : Axi4LiteMasterReadTestPkg

`endif
