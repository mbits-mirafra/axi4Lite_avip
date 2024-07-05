`ifndef AXI4LITESLAVEREADHVLTOP_INCLUDED_
`define AXI4LITESLAVEREADHVLTOP_INCLUDED_

module Axi4LiteSlaveReadHvlTop;

  import Axi4LiteReadSlaveGlobalPkg::*;
  import Axi4LiteSlaveReadTestPkg::*;
  import uvm_pkg::*;

  initial begin : START_TEST 
    
    run_test("Axi4LiteSlaveReadBaseTest");

  end

endmodule : Axi4LiteSlaveReadHvlTop

`endif
