`ifndef AXI4LITEMASTERWRITEHVLTOP_INCLUDED_
`define AXI4LITEMASTERWRITEHVLTOP_INCLUDED_

module Axi4LiteMasterWriteHvlTop;

  import Axi4LiteWriteMasterGlobalPkg::*;
  import Axi4LiteMasterWriteTestPkg::*;
  import uvm_pkg::*;

  initial begin : START_TEST 
    
    run_test("Axi4LiteMasterWriteBaseTest");

  end

endmodule : Axi4LiteMasterWriteHvlTop

`endif
