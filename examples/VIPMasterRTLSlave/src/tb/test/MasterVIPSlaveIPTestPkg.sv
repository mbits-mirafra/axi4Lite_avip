`ifndef MASTERVIPSLAVEIPTESTPKG_INCLUDED_
`define MASTERVIPSLAVEIPTESTPKG_INCLUDED_

package MasterVIPSlaveIPTestPkg;
  
  `include "uvm_macros.svh"
  import uvm_pkg::*;
  import Axi4LiteWriteMasterGlobalPkg::*;
  import Axi4LiteReadMasterGlobalPkg::*;
  import Axi4LiteWriteSlaveGlobalPkg::*;
  import Axi4LiteReadSlaveGlobalPkg::*;
  import Axi4LiteMasterWriteSeqPkg::*;
  import Axi4LiteMasterReadSeqPkg::*;
  import Axi4LiteMasterWritePkg::*;
  import Axi4LiteMasterReadPkg::*;
  import Axi4LiteSlaveWritePkg::*;
  import Axi4LiteSlaveReadPkg::*;
  import Axi4LiteWriteMasterEnvPkg::*;
  import Axi4LiteReadMasterEnvPkg::*;
  import Axi4LiteWriteSlaveEnvPkg::*;
  import Axi4LiteReadSlaveEnvPkg::*;
  import Axi4LiteMasterEnvPkg::*;
  import Axi4LiteSlaveEnvPkg::*;
  import MasterVIPSlaveIPEnvPkg::*;
  import MasterVIPSlaveIPVirtualSeqPkg::*;

  //including base_test for testing
  `include "MasterVIPSlaveIPBaseTest.sv"
  `include "MasterVIPSlaveIPWriteTest.sv"
  `include "MasterVIPSlaveIPReadTest.sv"
  `include "MasterVIPSlaveIPWriteFollowedByReadTest.sv"
//  `include "MasterVIPSlaveIPAddressIsOutOfRangeTest.sv"
//  `include "MasterVIPSlaveIPWriteDataWithWstrbTest.sv"



endpackage : MasterVIPSlaveIPTestPkg

`endif
