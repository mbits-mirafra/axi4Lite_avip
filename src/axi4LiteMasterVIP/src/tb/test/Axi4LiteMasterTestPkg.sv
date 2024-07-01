`ifndef AXI4LITEMASTERTESTPKG_INCLUDED_
`define AXI4LITEMASTERTESTPKG_INCLUDED_

package Axi4LiteMasterTestPkg;
  
  `include "uvm_macros.svh"
  import uvm_pkg::*;
  import Axi4LiteWriteMasterGlobalPkg::*;
  import Axi4LiteReadMasterGlobalPkg::*;
  import Axi4LiteMasterWritePkg::*;
  import Axi4LiteMasterReadPkg::*;
  import Axi4LiteMasterEnvPkg::*;

  import Axi4LiteMasterVirtualSeqPkg::*;

  //including base_test for testing
  `include "Axi4LiteMasterBaseTest.sv"
  `include "Axi4LiteMasterRandomTransferTest.sv"

endpackage : Axi4LiteMasterTestPkg

`endif
