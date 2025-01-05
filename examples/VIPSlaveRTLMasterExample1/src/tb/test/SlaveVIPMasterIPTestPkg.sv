`ifndef SLAVEVIPMASTERIPTESTPKG_INCLUDED_
`define SLAVEVIPMASTERIPTESTPKG_INCLUDED_

package SlaveVIPMasterIPTestPkg;
  
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
  import SlaveVIPMasterIPEnvPkg::*;
  import SlaveVIPMasterIPVirtualSeqPkg::*;

  //including base_test for testing
  `include "SlaveVIPMasterIPBaseTest.sv"
  `include "SlaveVIPMasterIPWriteTest.sv"
  `include "SlaveVIPMasterIPReadTest.sv"
  `include "SlaveVIPMasterIPWriteFollowedByReadTest.sv"
  `include "SlaveVIPMasterIPOutstandingTransactionTest.sv"

endpackage : SlaveVIPMasterIPTestPkg

`endif
