`ifndef AXI4LITEMASTERENVPKG_INCLUDED_
`define AXI4LITEMASTERENVPKG_INCLUDED_

package Axi4LiteMasterEnvPkg;
  
  `include "uvm_macros.svh"
  import uvm_pkg::*;

  import Axi4LiteWriteMasterGlobalPkg::*;
  import Axi4LiteReadMasterGlobalPkg::*;
  import Axi4LiteMasterWritePkg::*;
  import Axi4LiteMasterReadPkg::*;
  import Axi4LiteWriteMasterEnvPkg::*;
  import Axi4LiteReadMasterEnvPkg::*;
  import Axi4LiteMasterVirtualSeqrPkg::*;
  
  `include "Axi4LiteMasterEnvConfig.sv"
  `include "Axi4LiteMasterEnv.sv"

endpackage : Axi4LiteMasterEnvPkg

`endif
