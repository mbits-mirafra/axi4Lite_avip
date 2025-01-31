`ifndef AXI4LITEMASTERREADHVLTOP_INCLUDED_
`define AXI4LITEMASTERREADHVLTOP_INCLUDED_

module Axi4LiteMasterReadHvlTop;

  import Axi4LiteReadMasterGlobalPkg::*;
  import Axi4LiteMasterReadTestPkg::*;
  import uvm_pkg::*;

  initial begin : START_TEST 
    
    run_test("Axi4LiteMasterReadBaseTest");

  end

endmodule : Axi4LiteMasterReadHvlTop

`endif
