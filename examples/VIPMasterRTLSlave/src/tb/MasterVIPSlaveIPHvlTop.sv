`ifndef MASTERVIPSLAVEIPHVLTOP_INCLUDED_
`define MASTERVIPSLAVEIPHVLTOP_INCLUDED_

module MasterVIPSlaveIPHvlTop;

  import MasterVIPSlaveIPTestPkg::*;
  import uvm_pkg::*;

  initial begin : START_TEST 
    
    run_test("MasterVIPSlaveIPBaseTest");

  end

endmodule : MasterVIPSlaveIPHvlTop

`endif
