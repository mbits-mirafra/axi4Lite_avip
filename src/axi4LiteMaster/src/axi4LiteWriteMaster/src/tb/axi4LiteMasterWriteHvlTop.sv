`ifndef HVLTOP_INCLUDED_
`define HVLTOP_INCLUDED_

module HvlTop;

  import Axi4LiteWriteMasterGlobalPkg::*;
  import Axi4LiteWriteMasterTestPkg::*;
  import uvm_pkg::*;

  initial begin : START_TEST 
    
    run_test("Axi4LiteWriteMasterBaseTest");

  end

endmodule : HvlTop

`endif
