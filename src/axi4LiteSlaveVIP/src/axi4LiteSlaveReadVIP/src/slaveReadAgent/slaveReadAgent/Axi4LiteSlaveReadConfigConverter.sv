`ifndef AXI4LITESLAVEREADCONFIGCONVERTER_INCLUDED_
`define AXI4LITESLAVEREADCONFIGCONVERTER_INCLUDED_                                                                                             
class Axi4LiteSlaveReadConfigConverter extends uvm_object;                                                 
`uvm_object_utils(Axi4LiteSlaveReadConfigConverter)                                                      
                                                                                                     
  extern function new(string name = "Axi4LiteSlaveReadConfigConverter");                                   
  extern static function void fromClass(input Axi4LiteSlaveReadAgentConfig inputConv, output axi4LiteReadSlaveTransferCfgStruct outputConv);
  extern function void do_print(uvm_printer printer);  

endclass : Axi4LiteSlaveReadConfigConverter                                                                
                                                                                                     
function Axi4LiteSlaveReadConfigConverter::new(string name = "Axi4LiteSlaveReadConfigConverter");                 
  super.new(name);                                                                                  
endfunction : new                                                                                   

function void Axi4LiteSlaveReadConfigConverter::fromClass(input Axi4LiteSlaveReadAgentConfig inputConv, output axi4LiteReadSlaveTransferCfgStruct outputConv);
  outputConv.maxDelayForRready = inputConv.maxDelayForRready;
endfunction: fromClass  
 
 function void Axi4LiteSlaveReadConfigConverter:: do_print(uvm_printer printer);                            
   axi4LiteReadSlaveTransferCfgStruct configStruct;
   printer.print_field("maxDelayForRready",configStruct.maxDelayForRready,$bits(configStruct.maxDelayForRready),UVM_HEX);
 endfunction : do_print                                                                              
                                                                                                
`endif
