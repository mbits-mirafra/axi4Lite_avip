`ifndef MASTERVIPSLAVEIPENVPKG_INCLUDED_
`define MASTERVIPSLAVEIPENVPKG_INCLUDED_

package MasterVIPSlaveIPEnvPkg;

  `include "uvm_macros.svh"
  import uvm_pkg::*;

  import Axi4LiteMasterWritePkg::*;
  import Axi4LiteMasterReadPkg::*;
  import Axi4LiteMasterEnvPkg::*;
  import Axi4LiteMasterVirtualSeqrPkg::*;

  `include "MasterVIPSlaveIPEnvConfig.sv"
//`include "Axi4LiteScoreboard.sv"
  `include "MasterVIPSlaveIPEnv.sv"

endpackage : MasterVIPSlaveIPEnvPkg

`endif
