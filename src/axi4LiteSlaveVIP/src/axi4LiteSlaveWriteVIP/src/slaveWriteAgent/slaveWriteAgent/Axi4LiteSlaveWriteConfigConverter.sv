`ifndef AXI4LITESLAVEWRITECONFIGCONVERTER_INCLUDED_
`define AXI4LITESLAVEWRITECONFIGCONVERTER_INCLUDED_                                                                                             
class Axi4LiteSlaveWriteConfigConverter extends uvm_object;                                                 
`uvm_object_utils(Axi4LiteSlaveWriteConfigConverter)                                                      
                                                                                                     
  extern function new(string name = "Axi4LiteSlaveWriteConfigConverter");                                   
  extern static function void fromClass(input Axi4LiteSlaveWriteAgentConfig inputConv,output axi4LiteWriteSlaveTransferCfgStruct outputConv);
  extern function void do_print(uvm_printer printer);  

endclass : Axi4LiteSlaveWriteConfigConverter                                                                
                                                                                                     
function Axi4LiteSlaveWriteConfigConverter::new(string name = "Axi4LiteSlaveWriteConfigConverter");                 
  super.new(name);                                                                                  
endfunction : new                                                                                   

function void Axi4LiteSlaveWriteConfigConverter::fromClass(input Axi4LiteSlaveWriteAgentConfig inputConv,output axi4LiteWriteSlaveTransferCfgStruct outputConv);
  outputConv.defaultStateReady = inputConv.defaultStateReady;
  outputConv.maxDelayForWvalid = inputConv.maxDelayForWvalid;
  outputConv.maxDelayForBready = inputConv.maxDelayForBready;
endfunction: fromClass   

function void Axi4LiteSlaveWriteConfigConverter:: do_print(uvm_printer printer);                            
  axi4LiteWriteSlaveTransferCfgStruct configStruct;
   printer.print_field("defaultStateReady",configStruct.defaultStateReady,$bits(configStruct.defaultStateReady),UVM_HEX);
   printer.print_field("maxDelayForWvalid",configStruct.maxDelayForWvalid,$bits(configStruct.maxDelayForWvalid),UVM_HEX);
   printer.print_field("maxDelayForBready",configStruct.maxDelayForBready,$bits(configStruct.maxDelayForBready),UVM_HEX);
endfunction : do_print                                                                              

`endif
