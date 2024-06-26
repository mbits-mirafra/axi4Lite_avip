`ifndef AXI4LITEMASTERWRITETESTPKG_INCLUDED_
`define AXI4LITEMASTERWRITETESTPKG_INCLUDED_

package Axi4LiteMasterWriteTestPkg;
  
  `include "uvm_macros.svh"
  import uvm_pkg::*;
  import Axi4LiteWriteMasterGlobalPkg::*;
  import Axi4LiteMasterWritePkg::*;
  import Axi4LiteWriteMasterEnvPkg::*;

  import Axi4LiteMasterWriteSeqPkg::*;

  //including base_test for testing
  `include "Axi4LiteMasterWriteBaseTest.sv"
  `include "Axi4LiteMasterWriteRandomTransferTest.sv"

endpackage : Axi4LiteMasterWriteTestPkg

`endif
