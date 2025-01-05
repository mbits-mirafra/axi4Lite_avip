`ifndef MASTERRTLSEQPKG_INCLUDED
`define MASTERRTLSEQPKG_INCLUDED

package MasterRTLSeqPkg;

  `include "uvm_macros.svh"
  import uvm_pkg::*;
  import MasterRTLGlobalPkg::*;
  import MasterRTLPkg::*;
 
  `include "MasterRTLBaseSeq.sv"
  `include "MasterRTLWrite32bitsSeq.sv"
  `include "MasterRTLRead32bitsSeq.sv"
  
endpackage : MasterRTLSeqPkg
`endif
