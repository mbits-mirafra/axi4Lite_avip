`ifndef AXI4LITESLAVEVIRTUALSEQPKG_INCLUDED_
`define AXI4LITESLAVEVIRTUALSEQPKG_INCLUDED_

package Axi4LiteSlaveVirtualSeqPkg;

  `include "uvm_macros.svh"
  import uvm_pkg::*;
  import Axi4LiteSlaveWritePkg::*;
  import Axi4LiteSlaveReadPkg::*;

  import Axi4LiteSlaveWriteSeqPkg::*;
  import Axi4LiteSlaveReadSeqPkg::*;

  import Axi4LiteSlaveEnvPkg::*;

  `include "Axi4LiteSlaveVirtualBaseSeq.sv"

endpackage : Axi4LiteSlaveVirtualSeqPkg

`endif

