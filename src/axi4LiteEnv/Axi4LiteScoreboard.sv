`ifndef AXI4LITESCOREBOARD_INCLUDED_
`define AXI4LITESCOREBOARD_INCLUDED_

class Axi4LiteScoreboard extends uvm_scoreboard;
  `uvm_component_utils(Axi4LiteScoreboard)

  Axi4LiteMasterWriteTransaction axi4LiteMasterWriteTransaction;

  uvm_tlm_analysis_fifo #(Axi4LiteMasterWriteTransaction) axi4LiteMasterWriteEnvAddressFIFO;
  uvm_tlm_analysis_fifo #(Axi4LiteMasterWriteTransaction) axi4LiteMasterWriteEnvDataFIFO;
  uvm_tlm_analysis_fifo #(Axi4LiteMasterWriteTransaction) axi4LiteMasterWriteEnvResponseFIFO;
  uvm_tlm_analysis_fifo #(Axi4LiteMasterReadTransaction) axi4LiteMasterReadEnvAddressFIFO;
  uvm_tlm_analysis_fifo #(Axi4LiteMasterReadTransaction) axi4LiteMasterReadEnvDataFIFO;

  uvm_tlm_analysis_fifo #(Axi4LiteSlaveWriteTransaction) axi4LiteSlaveWriteEnvAddressFIFO;
  uvm_tlm_analysis_fifo #(Axi4LiteSlaveWriteTransaction) axi4LiteSlaveWriteEnvDataFIFO;
  uvm_tlm_analysis_fifo #(Axi4LiteSlaveWriteTransaction) axi4LiteSlaveWriteEnvResponseFIFO;
  uvm_tlm_analysis_fifo #(Axi4LiteSlaveReadTransaction) axi4LiteSlaveReadEnvAddressFIFO;
  uvm_tlm_analysis_fifo #(Axi4LiteSlaveReadTransaction) axi4LiteSlaveReadEnvDataFIFO;

  extern function new(string name = "Axi4LiteScoreboard", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void connect_phase(uvm_phase phase);
  extern virtual function void end_of_elaboration_phase(uvm_phase phase);
  extern virtual function void start_of_simulation_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);
  extern virtual function void check_phase (uvm_phase phase);
  extern virtual function void report_phase(uvm_phase phase);

endclass : Axi4LiteScoreboard

function Axi4LiteScoreboard::new(string name = "Axi4LiteScoreboard",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteScoreboard::build_phase(uvm_phase phase);
  super.build_phase(phase);
  axi4LiteMasterWriteEnvAddressFIFO = new("axi4LiteMasterWriteEnvAddressFIFO",this);
  axi4LiteMasterWriteEnvDataFIFO = new("axi4LiteMasterWriteEnvDataFIFO",this);
  axi4LiteMasterWriteEnvResponseFIFO = new("axi4LiteMasterWriteEnvResponseFIFO",this);
  axi4LiteMasterReadEnvAddressFIFO = new("axi4LiteMasterReadEnvAddressFIFO",this);
  axi4LiteMasterReadEnvDataFIFO = new("axi4LiteMasterReadEnvDataFIFO",this);

  axi4LiteSlaveWriteEnvAddressFIFO = new("axi4LiteSlaveWriteEnvAddressFIFO",this);
  axi4LiteSlaveWriteEnvDataFIFO = new("axi4LiteSlaveWriteEnvDataFIFO",this);
  axi4LiteSlaveWriteEnvResponseFIFO = new("axi4LiteSlaveWriteEnvResponseFIFO",this);
  axi4LiteSlaveReadEnvAddressFIFO = new("axi4LiteSlaveReadEnvAddressFIFO",this);
  axi4LiteSlaveReadEnvDataFIFO = new("axi4LiteSlaveReadEnvDataFIFO",this);
endfunction : build_phase

function void Axi4LiteScoreboard::connect_phase(uvm_phase phase);
  super.connect_phase(phase);
endfunction : connect_phase

function void Axi4LiteScoreboard::end_of_elaboration_phase(uvm_phase phase);
  super.end_of_elaboration_phase(phase);
endfunction  : end_of_elaboration_phase

function void Axi4LiteScoreboard::start_of_simulation_phase(uvm_phase phase);
  super.start_of_simulation_phase(phase);
endfunction : start_of_simulation_phase


task Axi4LiteScoreboard::run_phase(uvm_phase phase);

  super.run_phase(phase);
/*
  fork
    axi4_write_address();
    axi4_write_data();
    axi4_write_response();
    axi4_read_address();
    axi4_read_data();
  join
*/
endtask : run_phase

function void Axi4LiteScoreboard::check_phase(uvm_phase phase);
  super.check_phase(phase);

  `uvm_info(get_type_name(),$sformatf("--\n----------------------------------------------SCOREBOARD CHECK PHASE---------------------------------------"),UVM_HIGH) 
  
  `uvm_info (get_type_name(),$sformatf(" Scoreboard Check Phase is starting"),UVM_HIGH); 
  `uvm_info(get_type_name(),$sformatf("--\n----------------------------------------------END OF SCOREBOARD CHECK PHASE---------------------------------------"),UVM_HIGH)

endfunction : check_phase

function void Axi4LiteScoreboard::report_phase(uvm_phase phase);
  super.report_phase(phase);
  
  $display(" ");
  $display("-------------------------------------------- ");
  $display("SCOREBOARD REPORT PHASE");
  $display("-------------------------------------------- ");
  $display(" ");
endfunction : report_phase

`endif

