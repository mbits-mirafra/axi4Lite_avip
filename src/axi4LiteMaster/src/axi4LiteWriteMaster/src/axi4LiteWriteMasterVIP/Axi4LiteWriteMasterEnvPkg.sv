`ifndef AXI4LITEWRITEMASTERENVPKG_INCLUDED_
`define AXI4LITEWRITEMASTERENVPKG_INCLUDED_

package Axi4LiteWriteMasterEnvPkg;
  
  `include "uvm_macros.svh"
  import uvm_pkg::*;

  import axi4LiteWriteMasterGlobalPkg::*;
  import Axi4LiteMasterWritePkg::*;
  import Axi4LiteMasterWriteSeqrPkg::*;
  
  `include "Axi4LiteWriteMasterEnvConfig.sv"
  `include "Axi4LiteWriteMasterSequencer.sv"
  `include "Axi4LiteWriteMasterEnv.sv"

endpackage : Axi4LiteWriteMasterEnvPkg

`endif
