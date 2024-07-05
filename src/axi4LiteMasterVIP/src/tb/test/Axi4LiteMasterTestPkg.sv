`ifndef AXI4LITEMASTERTESTPKG_INCLUDED_
`define AXI4LITEMASTERTESTPKG_INCLUDED_

package Axi4LiteMasterTestPkg;
  
  `include "uvm_macros.svh"
  import uvm_pkg::*;
  import Axi4LiteWriteMasterGlobalPkg::*;
  import Axi4LiteReadMasterGlobalPkg::*;
  import Axi4LiteMasterWriteAssertCoverParameter::*;
  import Axi4LiteMasterReadAssertCoverParameter::*;
  import Axi4LiteMasterWritePkg::*;
  import Axi4LiteMasterReadPkg::*;
  import Axi4LiteWriteMasterEnvPkg::*;
  import Axi4LiteReadMasterEnvPkg::*;
  import Axi4LiteMasterEnvPkg::*;

  import Axi4LiteMasterVirtualSeqPkg::*;

  //including base_test for testing
  `include "Axi4LiteMasterBaseTest.sv"
  `include "Axi4LiteMasterRandomWriteReadTransferTest.sv"

endpackage : Axi4LiteMasterTestPkg

`endif
