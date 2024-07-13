`ifndef AXI4LITEMASTERREADEVENADDRESSTEST_INCLUDED_
`define AXI4LITEMASTERREADEVENADDRESSTEST_INCLUDED_

class Axi4LiteMasterReadEvenAddressTest extends Axi4LiteMasterReadAddressInsideMinAndMaxRangeTest;
  `uvm_component_utils(Axi4LiteMasterReadEvenAddressTest)

  extern function new(string name = "Axi4LiteMasterReadEvenAddressTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteMasterReadEvenAddressTest

function Axi4LiteMasterReadEvenAddressTest::new(string name = "Axi4LiteMasterReadEvenAddressTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteMasterReadEvenAddressTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction : build_phase

task Axi4LiteMasterReadEvenAddressTest::run_phase(uvm_phase phase);
  
  axi4LiteMasterReadAddressInsideMinAndMaxRangeSeq = Axi4LiteMasterReadAddressInsideMinAndMaxRangeSeq ::type_id::create("axi4LiteMasterReadAddressInsideMinAndMaxRangeSeq");
 
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteMasterReadEvenAddressTest"),UVM_LOW);
    
   if(!axi4LiteMasterReadAddressInsideMinAndMaxRangeSeq.randomize()with {araddr == 22;}) begin
       `uvm_error(get_type_name(), "Randomization failed")
   end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteMasterReadEvenAddressTest araddr :%0d", axi4LiteMasterReadAddressInsideMinAndMaxRangeSeq.araddr),UVM_LOW);

  phase.raise_objection(this);
  axi4LiteMasterReadAddressInsideMinAndMaxRangeSeq.start(axi4LiteReadMasterEnv.axi4LiteMasterReadAgent[0].axi4LiteMasterReadSequencer); 
  #10;
  phase.drop_objection(this);
  `uvm_info(get_type_name(),$sformatf("After drop_objection Axi4LiteMasterReadEvenAddressTest"),UVM_LOW);

endtask : run_phase

`endif


