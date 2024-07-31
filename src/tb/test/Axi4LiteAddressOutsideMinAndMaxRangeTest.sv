`ifndef AXI4LITEADDRESSOUTSIDEMINANDMAXRANGETEST_INCLUDED_
`define AXI4LITEADDRESSOUTSIDEMINANDMAXRANGETEST_INCLUDED_

class Axi4LiteAddressOutsideMinAndMaxRangeTest extends Axi4LiteBaseTest;
  `uvm_component_utils(Axi4LiteAddressOutsideMinAndMaxRangeTest)

  Axi4LiteVirtualAddressOutsideMinAndMaxRangeSeq axi4LiteVirtualAddressOutsideMinAndMaxRangeSeq;
  
  extern function new(string name = "Axi4LiteAddressOutsideMinAndMaxRangeTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteAddressOutsideMinAndMaxRangeTest

function Axi4LiteAddressOutsideMinAndMaxRangeTest::new(string name = "Axi4LiteAddressOutsideMinAndMaxRangeTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

task Axi4LiteAddressOutsideMinAndMaxRangeTest::run_phase(uvm_phase phase);

  axi4LiteVirtualAddressOutsideMinAndMaxRangeSeq=Axi4LiteVirtualAddressOutsideMinAndMaxRangeSeq::type_id::create("axi4LiteVirtualAddressOutsideMinAndMaxRangeSeq");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteAddressOutsideMinAndMaxRangeTest"),UVM_LOW);
    phase.raise_objection(this);
    axi4LiteVirtualAddressOutsideMinAndMaxRangeSeq.start(axi4LiteEnv.axi4LiteVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

