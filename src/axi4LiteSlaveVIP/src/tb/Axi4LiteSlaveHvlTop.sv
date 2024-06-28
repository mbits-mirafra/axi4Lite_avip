`ifndef AXI4LITESLAVEHVLTOP_INCLUDED_
`define AXI4LITESLAVEHVLTOP_INCLUDED_

module Axi4LiteSlaveHvlTop;

  import Axi4LiteWriteSlaveGlobalPkg::*;
  import Axi4LiteSlaveTestPkg::*;
  import uvm_pkg::*;

  initial begin : START_TEST 
    
    run_test("Axi4LiteSlaveBaseTest");

  end

endmodule : Axi4LiteSlaveHvlTop

`endif
