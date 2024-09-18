`ifndef MASTERVIPSLAVEIPTESTPKG_INCLUDED_
`define MASTERVIPSLAVEIPTESTPKG_INCLUDED_

package MasterVIPSlaveIPTestPkg;
  
  `include "uvm_macros.svh"
  import uvm_pkg::*;
  import Axi4LiteWriteMasterGlobalPkg::*;
  import Axi4LiteReadMasterGlobalPkg::*;
  import Axi4LiteMasterWritePkg::*;
  import Axi4LiteMasterReadPkg::*;
  import Axi4LiteWriteMasterEnvPkg::*;
  import Axi4LiteReadMasterEnvPkg::*;
  import Axi4LiteMasterEnvPkg::*;
  import MasterVIPSlaveIPEnvPkg::*;

  //including base_test for testing
  `include "MasterVIPSlaveIPBaseTest.sv"

endpackage : MasterVIPSlaveIPTestPkg

`endif
