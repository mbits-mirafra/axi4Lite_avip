`ifndef AXI4LITESLAVEWRITEHVLTOP_INCLUDED_
`define AXI4LITESLAVEWRITEHVLTOP_INCLUDED_

module Axi4LiteSlaveWriteHvlTop;

  import Axi4LiteWriteSlaveGlobalPkg::*;
  import Axi4LiteWriteSlaveTestPkg::*;
  import uvm_pkg::*;

  initial begin : START_TEST 
    
    run_test("Axi4LiteWriteSlaveBaseTest");

  end

endmodule : Axi4LiteSlaveWriteHvlTop

`endif
