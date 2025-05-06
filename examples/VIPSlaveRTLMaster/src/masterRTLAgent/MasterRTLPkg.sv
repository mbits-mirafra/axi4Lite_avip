`ifndef MASTERRTLPKG_INCLUDED_
`define MASTERRTLPKG_INCLUDED_

package MasterRTLPkg;

  `include "uvm_macros.svh"
  import uvm_pkg::*;
 
  import MasterRTLGlobalPkg::*;

  `include "MasterRTLAgentConfig.sv"
  `include "MasterRTLTransaction.sv"
  `include "MasterRTLSequencer.sv"
  `include "MasterRTLDriver.sv"
  `include "MasterRTLMonitor.sv"
  `include "MasterRTLAgent.sv"
  
endpackage : MasterRTLPkg

`endif
