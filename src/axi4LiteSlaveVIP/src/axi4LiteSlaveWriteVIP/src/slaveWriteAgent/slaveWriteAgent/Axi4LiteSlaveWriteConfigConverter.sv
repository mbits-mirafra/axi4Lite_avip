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
  outputConv.defaultStateAwready = inputConv.defaultStateAwready;
  outputConv.defaultStateWready = inputConv.defaultStateWready;
  outputConv.maxDelayForWvalid = inputConv.maxDelayForWvalid;
  outputConv.maxDelayForBready = inputConv.maxDelayForBready;
  outputConv.minAddressRange   = inputConv.minAddressRange;
  outputConv.maxAddressRange   = inputConv.maxAddressRange;
  outputConv.toggleAwready       = inputConv.toggleAwready;
  outputConv.toggleWready       = inputConv.toggleWready;
endfunction: fromClass   

function void Axi4LiteSlaveWriteConfigConverter:: do_print(uvm_printer printer);                            
  axi4LiteWriteSlaveTransferCfgStruct configStruct;
   printer.print_field("defaultStateAwready",configStruct.defaultStateAwready,$bits(configStruct.defaultStateAwready),UVM_HEX);
   printer.print_field("defaultStateWready",configStruct.defaultStateWready,$bits(configStruct.defaultStateWready),UVM_HEX);
   printer.print_field("maxDelayForWvalid",configStruct.maxDelayForWvalid,$bits(configStruct.maxDelayForWvalid),UVM_HEX);
   printer.print_field("maxDelayForBready",configStruct.maxDelayForBready,$bits(configStruct.maxDelayForBready),UVM_HEX);
   printer.print_field("minAddressRange",configStruct.minAddressRange,$bits(configStruct.minAddressRange),UVM_HEX);
   printer.print_field("maxAddressRange",configStruct.maxAddressRange,$bits(configStruct.maxAddressRange),UVM_HEX);
   printer.print_field("toggleAwready",configStruct.toggleAwready,$bits(configStruct.toggleAwready),UVM_HEX);
   printer.print_field("toggleWready",configStruct.toggleWready,$bits(configStruct.toggleWready),UVM_HEX);
endfunction : do_print                                                                              

`endif
