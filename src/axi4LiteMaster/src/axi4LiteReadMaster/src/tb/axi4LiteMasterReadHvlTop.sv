`ifndef HVLTOP_INCLUDED_
`define HVLTOP_INCLUDED_

module HvlTop;

  import Axi4LiteReadMasterGlobalPkg::*;
  import Axi4LiteReadMasterTestPkg::*;
  import uvm_pkg::*;

  initial begin : START_TEST 
    
    run_test("Axi4LiteReadMasterBaseTest");

  end

endmodule : HvlTop

`endif
