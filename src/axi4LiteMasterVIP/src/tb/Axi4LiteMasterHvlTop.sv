`ifndef AXI4LITEMASTERHVLTOP_INCLUDED_
`define AXI4LITEMASTERHVLTOP_INCLUDED_

module Axi4LiteMasterHvlTop;

  import Axi4LiteWriteMasterGlobalPkg::*;
  import Axi4LiteMasterTestPkg::*;
  import uvm_pkg::*;

  initial begin : START_TEST 
    
    run_test("Axi4LiteMasterBaseTest");

  end

endmodule : Axi4LiteMasterHvlTop

`endif
