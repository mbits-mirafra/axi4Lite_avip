`ifndef AXI4LITEREADMASTERTESTPKG_INCLUDED_
`define AXI4LITEREADMASTERTESTPKG_INCLUDED_

package Axi4LiteReadMasterTestPkg;
  
  `include "uvm_macros.svh"
  import uvm_pkg::*;
  import Axi4LiteReadMasterGlobalPkg::*;
  import Axi4LiteMasterReadPkg::*;
  import Axi4LiteReadMasterEnvPkg::*;

  import Axi4LiteMasterReadSeqPkg::*;

  //including base_test for testing
  `include "Axi4LiteReadMasterBaseTest.sv"

endpackage : Axi4LiteReadMasterTestPkg

`endif
