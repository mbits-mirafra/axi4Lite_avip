`ifndef SLAVEVIPMASTERIPHVLTOP_INCLUDED_
`define SLAVEVIPMASTERIPHVLTOP_INCLUDED_

module SlaveVIPMasterIPHvlTop;

  import SlaveVIPMasterIPTestPkg::*;
  import uvm_pkg::*;

  initial begin : START_TEST 
    
    run_test("SlaveVIPMasterIPBaseTest");

  end

endmodule : SlaveVIPMasterIPHvlTop

`endif
