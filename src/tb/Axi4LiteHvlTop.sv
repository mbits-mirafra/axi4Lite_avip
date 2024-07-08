`ifndef AXI4LITEHVLTOP_INCLUDED_
`define AXI4LITEHVLTOP_INCLUDED_

module Axi4LiteHvlTop;

  import Axi4LiteTestPkg::*;
  import uvm_pkg::*;

  initial begin : START_TEST 
    
    run_test("Axi4LiteBaseTest");

  end

endmodule : Axi4LiteHvlTop

`endif
