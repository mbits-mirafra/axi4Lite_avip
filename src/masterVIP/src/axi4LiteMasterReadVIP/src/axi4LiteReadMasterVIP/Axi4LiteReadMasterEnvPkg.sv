`ifndef AXI4LITEREADMASTERENVPKG_INCLUDED_
`define AXI4LITEREADMASTERENVPKG_INCLUDED_

package Axi4LiteReadMasterEnvPkg;
  
  `include "uvm_macros.svh"
  import uvm_pkg::*;

  import Axi4LiteReadMasterGlobalPkg::*;
  import Axi4LiteMasterReadPkg::*;
  
  `include "Axi4LiteReadMasterEnvConfig.sv"
  `include "Axi4LiteReadMasterEnv.sv"

endpackage : Axi4LiteReadMasterEnvPkg

`endif
