`ifndef AXI4LITEWRITEMASTERTESTPKG_INCLUDED_
`define AXI4LITEWRITEMASTERTESTPKG_INCLUDED_

package Axi4LiteWriteMasterTestPkg;
  
  `include "uvm_macros.svh"
  import uvm_pkg::*;
  import Axi4LiteWriteMasterGlobalPkg::*;
  import Axi4LiteMasterWritePkg::*;
  import Axi4LiteWriteMasterEnvPkg::*;

  import Axi4LiteMasterWriteSeqPkg::*;

  //including base_test for testing
  `include "Axi4LiteWriteMasterBaseTest.sv"

endpackage : Axi4LiteWriteMasterTestPkg

`endif
