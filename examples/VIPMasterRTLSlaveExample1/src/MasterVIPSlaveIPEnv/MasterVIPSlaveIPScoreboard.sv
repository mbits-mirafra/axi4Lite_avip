`ifndef MASTERVIPSLAVEIPSCOREBOARD_INCLUDED_
`define MASTERVIPSLAVEIPSCOREBOARD_INCLUDED_

class MasterVIPSlaveIPScoreboard extends uvm_scoreboard;
  `uvm_component_utils(MasterVIPSlaveIPScoreboard)

  Axi4LiteMasterWriteTransaction axi4LiteMasterWriteTxAddress;
  Axi4LiteMasterWriteTransaction axi4LiteMasterWriteTxData;
  Axi4LiteMasterWriteTransaction axi4LiteMasterWriteTxResponse;
  Axi4LiteMasterReadTransaction axi4LiteMasterReadTxAddress;
  Axi4LiteMasterReadTransaction axi4LiteMasterReadTxData;
  
  Axi4LiteSlaveWriteTransaction axi4LiteSlaveWriteTxAddress;
  Axi4LiteSlaveWriteTransaction axi4LiteSlaveWriteTxData; 
  Axi4LiteSlaveWriteTransaction axi4LiteSlaveWriteTxResponse;
  Axi4LiteSlaveReadTransaction axi4LiteSlaveReadTxAddress;
  Axi4LiteSlaveReadTransaction axi4LiteSlaveReadTxData; 

  Axi4LiteMasterReadTransaction axi4LiteMasterReadTransaction; 
  Axi4LiteSlaveReadTransaction axi4LiteSlaveReadTransaction;

  MasterVIPSlaveIPEnvConfig masterVIPSlaveIPEnvConfig;

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

  semaphore writeAddressKey;
  semaphore writeDataKey;
  semaphore writeResponseKey;
  semaphore readAddressKey;
  semaphore readDataKey;


  int axi4LiteMasterWriteAddressChannelCount;
  int axi4LiteMasterWriteDataChannelCount;
  int axi4LiteMasterWriteResponseChannelCount; 
  int axi4LiteMasterReadAddressChannelCount;
  int axi4LiteMasterReadDataChannelCount;

  int axi4LiteSlaveWriteAddressChannelCount;
  int axi4LiteSlaveWriteDataChannelCount;
  int axi4LiteSlaveWriteResponseChannelCount;
  int axi4LiteSlaveReadAddressChannelCount;
  int axi4LiteSlaveReadDataChannelCount;

  int writeAddressComparisonSuccessCount; 
  int writeAddressComparisonFailedCount;
  int writeProtComparisonSuccessCount;
  int writeProtComparisonFailedCount; 
  int writeDataComparisonSuccessCount; 
  int writeDataComparisonFailedCount;
  int writeStrbComparisonSuccessCount; 
  int writeStrbComparisonFailedCount;
  int writeRespComparisonSuccessCount; 
  int writeRespComparisonFailedCount;
  
  int readAddressComparisonSuccessCount; 
  int readAddressComparisonFailedCount;
  int readProtComparisonSuccessCount;
  int readProtComparisonFailedCount;
  int readDataComparisonSuccessCount; 
  int readDataComparisonFailedCount;
  int readRespComparisonSuccessCount; 
  int readRespComparisonFailedCount; 
 

  extern function new(string name = "MasterVIPSlaveIPScoreboard", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void connect_phase(uvm_phase phase);
  extern virtual function void end_of_elaboration_phase(uvm_phase phase);
  extern virtual function void start_of_simulation_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);
  extern virtual task axi4LiteWriteAddress();
  extern virtual task axi4LiteWriteData();
  extern virtual task axi4LiteWriteResponse();
  extern virtual task axi4LiteReadAddress();
  extern virtual task axi4LiteReadData();
  extern virtual task axi4LiteWriteAddressComparision(input Axi4LiteMasterWriteTransaction axi4LiteMasterWriteTxAddress, input Axi4LiteSlaveWriteTransaction axi4LiteSlaveWriteTxAddress);
  extern virtual task axi4LiteWriteDataComparision(input Axi4LiteMasterWriteTransaction axi4LiteMasterWriteTxData, input Axi4LiteSlaveWriteTransaction axi4LiteSlaveWriteTxData);
  extern virtual task axi4LiteWriteResponseComparision(input Axi4LiteMasterWriteTransaction axi4LiteMasterWriteTxResponse, input Axi4LiteSlaveWriteTransaction axi4LiteSlaveWriteTxResponse);
  extern virtual task axi4LiteReadAddressComparision(input Axi4LiteMasterReadTransaction axi4LiteMasterReadTxAddress, input Axi4LiteSlaveReadTransaction axi4LiteSlaveReadTxAddress);
  extern virtual task axi4LiteReadDataComparision(input Axi4LiteMasterReadTransaction axi4LiteMasterReadTxData, input Axi4LiteSlaveReadTransaction axi4LiteSlaveReadTxData);
  extern virtual function void check_phase (uvm_phase phase);
  extern virtual function void report_phase(uvm_phase phase);

endclass : MasterVIPSlaveIPScoreboard

function MasterVIPSlaveIPScoreboard::new(string name = "MasterVIPSlaveIPScoreboard",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void MasterVIPSlaveIPScoreboard::build_phase(uvm_phase phase);
  super.build_phase(phase);
  axi4LiteMasterWriteEnvAddressFIFO  = new("axi4LiteMasterWriteEnvAddressFIFO",this);
  axi4LiteMasterWriteEnvDataFIFO     = new("axi4LiteMasterWriteEnvDataFIFO",this);
  axi4LiteMasterWriteEnvResponseFIFO = new("axi4LiteMasterWriteEnvResponseFIFO",this);
  axi4LiteMasterReadEnvAddressFIFO   = new("axi4LiteMasterReadEnvAddressFIFO",this);
  axi4LiteMasterReadEnvDataFIFO      = new("axi4LiteMasterReadEnvDataFIFO",this);

  axi4LiteSlaveWriteEnvAddressFIFO   = new("axi4LiteSlaveWriteEnvAddressFIFO",this);
  axi4LiteSlaveWriteEnvDataFIFO      = new("axi4LiteSlaveWriteEnvDataFIFO",this);
  axi4LiteSlaveWriteEnvResponseFIFO  = new("axi4LiteSlaveWriteEnvResponseFIFO",this);
  axi4LiteSlaveReadEnvAddressFIFO    = new("axi4LiteSlaveReadEnvAddressFIFO",this);
  axi4LiteSlaveReadEnvDataFIFO       = new("axi4LiteSlaveReadEnvDataFIFO",this);
  
  if(!uvm_config_db #(MasterVIPSlaveIPEnvConfig)::get(this,"","MasterVIPSlaveIPEnvConfig",masterVIPSlaveIPEnvConfig)) begin
    `uvm_fatal("FATAL_ENV_CONFIG", $sformatf("Scoreboard :: Couldn't get the env_config from config_db"))
  end
    
  writeAddressKey     = new(1);
  writeDataKey        = new(1);
  writeResponseKey    = new(1);
  readAddressKey      = new(1);
  readDataKey         = new(1);
endfunction : build_phase

function void MasterVIPSlaveIPScoreboard::connect_phase(uvm_phase phase);
  super.connect_phase(phase);
endfunction : connect_phase

function void MasterVIPSlaveIPScoreboard::end_of_elaboration_phase(uvm_phase phase);
  super.end_of_elaboration_phase(phase);
endfunction  : end_of_elaboration_phase

function void MasterVIPSlaveIPScoreboard::start_of_simulation_phase(uvm_phase phase);
  super.start_of_simulation_phase(phase);
endfunction : start_of_simulation_phase


task MasterVIPSlaveIPScoreboard::run_phase(uvm_phase phase);

  super.run_phase(phase);

  fork
    axi4LiteWriteAddress();
    axi4LiteWriteData();
    axi4LiteWriteResponse();
    axi4LiteReadAddress();
    axi4LiteReadData();
  join

endtask : run_phase

task MasterVIPSlaveIPScoreboard::axi4LiteWriteAddress();

  forever begin
    writeAddressKey.get(1);

    axi4LiteMasterWriteEnvAddressFIFO.get(axi4LiteMasterWriteTxAddress);
    `uvm_info(get_type_name(),$sformatf("scoreboard axi4LiteMasterWriteAddressChannel \n%s",axi4LiteMasterWriteTxAddress.sprint()),UVM_HIGH)

    axi4LiteSlaveWriteEnvAddressFIFO.get(axi4LiteSlaveWriteTxAddress);
    `uvm_info(get_type_name(),$sformatf("scoreboard axi4LiteSlaveWriteAddressChannel \n%s",axi4LiteSlaveWriteTxAddress.sprint()),UVM_HIGH)

    axi4LiteWriteAddressComparision(axi4LiteMasterWriteTxAddress,axi4LiteSlaveWriteTxAddress); 
   
    axi4LiteMasterWriteAddressChannelCount++;
    `uvm_info(get_type_name(),$sformatf("scoreboard's axi4LiteMasterWriteAddressChannel count: \n %0d",axi4LiteMasterWriteAddressChannelCount),UVM_HIGH)

    axi4LiteSlaveWriteAddressChannelCount++;
    `uvm_info(get_type_name(),$sformatf("scoreboard's axi4LiteSlaveWriteAddressChannel count: \n %0d",axi4LiteSlaveWriteAddressChannelCount),UVM_HIGH)
    writeAddressKey.put(1);
  end

endtask : axi4LiteWriteAddress

task MasterVIPSlaveIPScoreboard::axi4LiteWriteData();

  forever begin
    writeDataKey.get(1);
    
    axi4LiteMasterWriteEnvDataFIFO.get(axi4LiteMasterWriteTxData);
    `uvm_info(get_type_name(),$sformatf("scoreboard axi4LiteMasterWriteDataChannel \n%s",axi4LiteMasterWriteTxData.sprint()),UVM_HIGH)

    axi4LiteSlaveWriteEnvDataFIFO.get(axi4LiteSlaveWriteTxData);
    `uvm_info(get_type_name(),$sformatf("scoreboard axi4LiteSlaveWriteDataChannel \n%s",axi4LiteSlaveWriteTxData.sprint()),UVM_HIGH)

    axi4LiteWriteDataComparision(axi4LiteMasterWriteTxData,axi4LiteSlaveWriteTxData); 
   
    axi4LiteMasterWriteDataChannelCount++;
    `uvm_info(get_type_name(),$sformatf("scoreboard's axi4LiteMasterWriteDataChannel count: \n %0d",axi4LiteMasterWriteDataChannelCount),UVM_HIGH)

    axi4LiteSlaveWriteDataChannelCount++;
    `uvm_info(get_type_name(),$sformatf("scoreboard's axi4LiteSlaveWriteDataChannel count: \n %0d",axi4LiteSlaveWriteDataChannelCount),UVM_HIGH)
    writeDataKey.put(1);
  end

endtask : axi4LiteWriteData

task MasterVIPSlaveIPScoreboard::axi4LiteWriteResponse();

  forever begin
    writeResponseKey.get(1);
    
    axi4LiteMasterWriteEnvResponseFIFO.get(axi4LiteMasterWriteTxResponse);
    `uvm_info(get_type_name(),$sformatf("scoreboard axi4LiteMasterWriteResponseChannel \n%s",axi4LiteMasterWriteTxResponse.sprint()),UVM_HIGH)

    axi4LiteSlaveWriteEnvResponseFIFO.get(axi4LiteSlaveWriteTxResponse);
    `uvm_info(get_type_name(),$sformatf("scoreboard axi4LiteSlaveWriteResponseChannel \n%s",axi4LiteSlaveWriteTxResponse.sprint()),UVM_HIGH)

    axi4LiteWriteResponseComparision(axi4LiteMasterWriteTxResponse,axi4LiteSlaveWriteTxResponse); 
   
    axi4LiteMasterWriteResponseChannelCount++;
    `uvm_info(get_type_name(),$sformatf("scoreboard's axi4LiteMasterWriteResponseChannel count: \n %0d",axi4LiteMasterWriteResponseChannelCount),UVM_HIGH)

    axi4LiteSlaveWriteResponseChannelCount++;
    `uvm_info(get_type_name(),$sformatf("scoreboard's axi4LiteSlaveWriteResponseChannel count: \n %0d",axi4LiteSlaveWriteResponseChannelCount),UVM_HIGH)
    writeResponseKey.put(1);
  end

endtask : axi4LiteWriteResponse

task MasterVIPSlaveIPScoreboard::axi4LiteReadAddress();

  forever begin
    readAddressKey.get(1);

    axi4LiteMasterReadEnvAddressFIFO.get(axi4LiteMasterReadTxAddress);
    `uvm_info(get_type_name(),$sformatf("scoreboard axi4LiteMasterReadAddressChannel \n%s",axi4LiteMasterReadTxAddress.sprint()),UVM_HIGH)

    axi4LiteSlaveReadEnvAddressFIFO.get(axi4LiteSlaveReadTxAddress);
    `uvm_info(get_type_name(),$sformatf("scoreboard axi4LiteSlaveReadAddressChannel \n%s",axi4LiteSlaveReadTxAddress.sprint()),UVM_HIGH)

    axi4LiteReadAddressComparision(axi4LiteMasterReadTxAddress,axi4LiteSlaveReadTxAddress); 
   
    axi4LiteMasterReadAddressChannelCount++;
    `uvm_info(get_type_name(),$sformatf("scoreboard's axi4LiteMasterReadAddressChannel count: \n %0d",axi4LiteMasterReadAddressChannelCount),UVM_HIGH)

    axi4LiteSlaveReadAddressChannelCount++;
    `uvm_info(get_type_name(),$sformatf("scoreboard's axi4LiteSlaveReadAddressChannel count: \n %0d",axi4LiteSlaveReadAddressChannelCount),UVM_HIGH)
    readAddressKey.put(1);
  end

endtask : axi4LiteReadAddress

task MasterVIPSlaveIPScoreboard::axi4LiteReadData();

  forever begin
    readDataKey.get(1);
    
    axi4LiteMasterReadEnvDataFIFO.get(axi4LiteMasterReadTxData);
    `uvm_info(get_type_name(),$sformatf("scoreboard axi4LiteMasterReadDataChannel \n%s",axi4LiteMasterReadTxData.sprint()),UVM_HIGH)

    axi4LiteSlaveReadEnvDataFIFO.get(axi4LiteSlaveReadTxData);
    `uvm_info(get_type_name(),$sformatf("scoreboard axi4LiteSlaveReadDataChannel \n%s",axi4LiteSlaveReadTxData.sprint()),UVM_HIGH)

    axi4LiteReadDataComparision(axi4LiteMasterReadTxData,axi4LiteSlaveReadTxData); 
   
    axi4LiteMasterReadDataChannelCount++;
    `uvm_info(get_type_name(),$sformatf("scoreboard's axi4LiteMasterReadDataChannel count: \n %0d",axi4LiteMasterReadDataChannelCount),UVM_HIGH)

    axi4LiteSlaveReadDataChannelCount++;
    `uvm_info(get_type_name(),$sformatf("scoreboard's axi4LiteSlaveReadDataChannel count: \n %0d",axi4LiteSlaveReadDataChannelCount),UVM_HIGH)
    readDataKey.put(1);
  end

endtask : axi4LiteReadData

task MasterVIPSlaveIPScoreboard::axi4LiteWriteAddressComparision(input Axi4LiteMasterWriteTransaction axi4LiteMasterWriteTxAddress, input Axi4LiteSlaveWriteTransaction axi4LiteSlaveWriteTxAddress);

  if(axi4LiteMasterWriteTxAddress.awaddr == axi4LiteSlaveWriteTxAddress.awaddr) begin
    `uvm_info(get_type_name(),$sformatf("axi4LiteWriteAddress from masterWrite and slaveWrite is equal"),UVM_HIGH);
    `uvm_info("SB_AWADDR_MATCHED", $sformatf("masterWrite AWADDR = 'h%0x and slaveWrite AWADDR = 'h%0x",axi4LiteMasterWriteTxAddress.awaddr, axi4LiteSlaveWriteTxAddress.awaddr), UVM_HIGH);
     writeAddressComparisonSuccessCount++; 
  end
  else begin
    `uvm_info(get_type_name(),$sformatf("axi4LiteWriteAddress from masterWrite and slaveWrite is not equal"),UVM_HIGH);
    `uvm_info("SB_AWADDR_NOT_MATCHED",$sformatf("masterWrite AWADDR = 'h%0x and slaveWrite AWADDR = 'h%0x",axi4LiteMasterWriteTxAddress.awaddr, axi4LiteSlaveWriteTxAddress.awaddr), UVM_HIGH);
     writeAddressComparisonFailedCount++;
  end
  
  if(axi4LiteMasterWriteTxAddress.awprot == axi4LiteSlaveWriteTxAddress.awprot) begin
    `uvm_info(get_type_name(),$sformatf("axi4LiteWriteProt from masterWrite and slaveWrite is equal"),UVM_HIGH);
    `uvm_info("SB_AWPROT_MATCHED", $sformatf("masterWrite AWPROT = %0d and slaveWrite AWPROT = %0d",axi4LiteMasterWriteTxAddress.awprot, axi4LiteSlaveWriteTxAddress.awprot), UVM_HIGH);
     writeProtComparisonSuccessCount++;
  end
  else begin
    `uvm_info(get_type_name(),$sformatf("axi4LiteWriteProt from masterWrite and slaveWrite is not equal"),UVM_HIGH);
    `uvm_info("SB_AWPROT_NOT_MATCHED",$sformatf("masterWrite AWPROT = %0d and slaveWrite AWPROT = %0d",axi4LiteMasterWriteTxAddress.awprot, axi4LiteSlaveWriteTxAddress.awprot), UVM_HIGH);
     writeProtComparisonFailedCount++;
  end

endtask : axi4LiteWriteAddressComparision


task MasterVIPSlaveIPScoreboard::axi4LiteWriteDataComparision(input Axi4LiteMasterWriteTransaction axi4LiteMasterWriteTxData, input Axi4LiteSlaveWriteTransaction axi4LiteSlaveWriteTxData);

  if(axi4LiteMasterWriteTxData.wdata == axi4LiteSlaveWriteTxData.wdata) begin
    `uvm_info(get_type_name(),$sformatf("axi4LiteWriteData from masterWrite and slaveWrite is equal"),UVM_HIGH);
    `uvm_info("SB_WDATA_MATCHED", $sformatf("masterWrite WDATA = %0p and slaveWrite WDATA = %0p",axi4LiteMasterWriteTxData.wdata, axi4LiteSlaveWriteTxData.wdata), UVM_HIGH);
     writeDataComparisonSuccessCount++; 
  end
  else begin
    `uvm_info(get_type_name(),$sformatf("axi4LiteWriteData from masterWrite and slaveWrite is not equal"),UVM_HIGH);
    `uvm_info("SB_WDATA_NOT_MATCHED",$sformatf("masterWrite WDATA = %0p and slaveWrite WDATA = %0p",axi4LiteMasterWriteTxData.wdata, axi4LiteSlaveWriteTxData.wdata), UVM_HIGH);
    writeDataComparisonFailedCount++;
  end
  
  if(axi4LiteMasterWriteTxData.wstrb == axi4LiteSlaveWriteTxData.wstrb) begin
    `uvm_info(get_type_name(),$sformatf("axi4LiteWriteStrb from masterWrite and slaveWrite is equal"),UVM_HIGH);
    `uvm_info("SB_WSTRB_MATCHED", $sformatf("masterWrite WSTRB = %0b and slaveWrite WSTRB = %0b",axi4LiteMasterWriteTxData.wstrb, axi4LiteSlaveWriteTxData.wstrb), UVM_HIGH);
     writeStrbComparisonSuccessCount++;
  end
  else begin
    `uvm_info(get_type_name(),$sformatf("axi4LiteWriteStrb from masterWrite and slaveWrite is not equal"),UVM_HIGH);
    `uvm_info("SB_WSTRB_NOT_MATCHED",$sformatf("masterWrite WSTRB = %0b and slaveWrite WSTRB = %0b",axi4LiteMasterWriteTxData.wstrb, axi4LiteSlaveWriteTxData.wstrb), UVM_HIGH);
     writeStrbComparisonFailedCount++;
  end

endtask : axi4LiteWriteDataComparision

task MasterVIPSlaveIPScoreboard::axi4LiteWriteResponseComparision(input Axi4LiteMasterWriteTransaction axi4LiteMasterWriteTxResponse, input Axi4LiteSlaveWriteTransaction axi4LiteSlaveWriteTxResponse);

  if(axi4LiteMasterWriteTxResponse.bresp == axi4LiteSlaveWriteTxResponse.bresp) begin
    `uvm_info(get_type_name(),$sformatf("axi4LiteWriteBresp from masterWrite and slaveWrite is equal"),UVM_HIGH);
    `uvm_info("SB_BRESP_MATCHED", $sformatf("masterWrite BRESP = %0b and slaveWrite WDATA = %0b",axi4LiteMasterWriteTxResponse.bresp, axi4LiteSlaveWriteTxResponse.bresp), UVM_HIGH);
     writeRespComparisonSuccessCount++; 
  end
  else begin
    `uvm_info(get_type_name(),$sformatf("axi4LiteWriteBresp from masterWrite and slaveWrite is not equal"),UVM_HIGH);
    `uvm_info("SB_BRESP_NOT_MATCHED",$sformatf("masterWrite BRESP = %0b and slaveWrite BRESP = %0b",axi4LiteMasterWriteTxResponse.bresp, axi4LiteSlaveWriteTxResponse.bresp), UVM_HIGH);
    writeRespComparisonFailedCount++;
  end

endtask : axi4LiteWriteResponseComparision

task MasterVIPSlaveIPScoreboard::axi4LiteReadAddressComparision(input Axi4LiteMasterReadTransaction axi4LiteMasterReadTxAddress, input Axi4LiteSlaveReadTransaction axi4LiteSlaveReadTxAddress);

  if(axi4LiteMasterReadTxAddress.araddr == axi4LiteSlaveReadTxAddress.araddr) begin
    `uvm_info(get_type_name(),$sformatf("axi4LiteReadAddress from masterRead and slaveRead is equal"),UVM_HIGH);
    `uvm_info("SB_ARADDR_MATCHED", $sformatf("masterRead ARADDR = 'h%0x and slaveRead ARADDR = 'h%0x",axi4LiteMasterReadTxAddress.araddr, axi4LiteSlaveReadTxAddress.araddr), UVM_HIGH);
     readAddressComparisonSuccessCount++; 
  end
  else begin
    `uvm_info(get_type_name(),$sformatf("axi4LiteReadAddress from masterRead and slaveRead is not equal"),UVM_HIGH);
    `uvm_info("SB_ARADDR_NOT_MATCHED",$sformatf("masterRead ARADDR = 'h%0x and slaveRead ARADDR = 'h%0x",axi4LiteMasterReadTxAddress.araddr, axi4LiteSlaveReadTxAddress.araddr), UVM_HIGH);
    readAddressComparisonFailedCount++;
  end
  
  if(axi4LiteMasterReadTxAddress.arprot == axi4LiteSlaveReadTxAddress.arprot) begin
    `uvm_info(get_type_name(),$sformatf("axi4LiteReadProt from masterRead and slaveRead is equal"),UVM_HIGH);
    `uvm_info("SB_ARPROT_MATCHED", $sformatf("masterRead ARPROT = %0d and slaveRead ARPROT = %0d",axi4LiteMasterReadTxAddress.arprot, axi4LiteSlaveReadTxAddress.arprot), UVM_HIGH);
     readProtComparisonSuccessCount++;
  end
  else begin
    `uvm_info(get_type_name(),$sformatf("axi4LiteReadProt from masterRead and slaveRead is not equal"),UVM_HIGH);
    `uvm_info("SB_ARPROT_NOT_MATCHED",$sformatf("masterRead ARPROT = %0d and slaveRead ARPROT = %0d",axi4LiteMasterReadTxAddress.arprot, axi4LiteSlaveReadTxAddress.arprot), UVM_HIGH);
     readProtComparisonFailedCount++;
  end

endtask : axi4LiteReadAddressComparision

task MasterVIPSlaveIPScoreboard::axi4LiteReadDataComparision(input Axi4LiteMasterReadTransaction axi4LiteMasterReadTxData, input Axi4LiteSlaveReadTransaction axi4LiteSlaveReadTxData);

  if(axi4LiteMasterReadTxData.rdata == axi4LiteSlaveReadTxData.rdata) begin
    `uvm_info(get_type_name(),$sformatf("axi4LiteReadData from masterRead and slaveRead is equal"),UVM_HIGH);
    `uvm_info("SB_RDATA_MATCHED", $sformatf("masterRead RDATA = %0p and slaveRead RDATA = %0p",axi4LiteMasterReadTxData.rdata, axi4LiteSlaveReadTxData.rdata), UVM_HIGH);
     readDataComparisonSuccessCount++; 
  end
  else begin
    `uvm_info(get_type_name(),$sformatf("axi4LiteReadData from masterRead and slaveRead is not equal"),UVM_HIGH);
    `uvm_info("SB_WDATA_NOT_MATCHED",$sformatf("masterRead RDATA = %0p and slaveRead RDATA = %0p",axi4LiteMasterReadTxData.rdata, axi4LiteSlaveReadTxData.rdata), UVM_HIGH);
    readDataComparisonFailedCount++;
  end
  
  if(axi4LiteMasterReadTxData.rresp == axi4LiteSlaveReadTxData.rresp) begin
    `uvm_info(get_type_name(),$sformatf("axi4LiteReadResp from masterRead and slaveRead is equal"),UVM_HIGH);
    `uvm_info("SB_RRESP_MATCHED", $sformatf("masterRead RRESP = %0b and slaveRead RRESP = %0b",axi4LiteMasterReadTxData.rresp, axi4LiteSlaveReadTxData.rresp), UVM_HIGH);
     readRespComparisonSuccessCount++;
  end
  else begin
    `uvm_info(get_type_name(),$sformatf("axi4LiteReadResp from masterRead and slaveRead is not equal"),UVM_HIGH);
    `uvm_info("SB_RRESP_NOT_MATCHED",$sformatf("masterRead RRESP = %0b and slaveRead RRESP = %0b",axi4LiteMasterReadTxData.rresp, axi4LiteSlaveReadTxData.rresp), UVM_HIGH);
     readRespComparisonFailedCount++;
  end

endtask : axi4LiteReadDataComparision

function void MasterVIPSlaveIPScoreboard::check_phase(uvm_phase phase);
  super.check_phase(phase);

  `uvm_info(get_type_name(),$sformatf("--\n----------------------------------------------SCOREBOARD CHECK PHASE---------------------------------------"),UVM_HIGH) 
  
  `uvm_info (get_type_name(),$sformatf(" Scoreboard Check Phase is starting"),UVM_HIGH); 

  if(masterVIPSlaveIPEnvConfig.transactionType == 2) begin
       
  if((writeAddressComparisonSuccessCount != 0) && (writeAddressComparisonFailedCount == 0)) begin
     `uvm_info (get_type_name(), $sformatf ("awaddr_count_comparisions_are_succesful"),UVM_HIGH);
  end
   else begin
     `uvm_info (get_type_name(), $sformatf ("writeAddressComparisonSuccessCount :%0d",
                                             writeAddressComparisonSuccessCount),UVM_HIGH);
     `uvm_info (get_type_name(), $sformatf ("writeAddressComparisonFailedCount :%0d",
                                             writeAddressComparisonFailedCount),UVM_HIGH);
     `uvm_error (get_type_name(), $sformatf ("awaddr_count_comparisions_are_failed"));
   end

  if((writeProtComparisonSuccessCount != 0) && (writeProtComparisonFailedCount == 0)) begin
     `uvm_info (get_type_name(), $sformatf ("awprot_count_comparisions_are_succesful"),UVM_HIGH);
  end
   else begin
     `uvm_info (get_type_name(), $sformatf ("writeProtComparisonSuccessCount :%0d",
                                             writeProtComparisonSuccessCount),UVM_HIGH);
     `uvm_info (get_type_name(), $sformatf ("writeProtComparisonFailedCount :%0d",
                                             writeProtComparisonFailedCount),UVM_HIGH);
     `uvm_error (get_type_name(), $sformatf ("awprot_count_comparisions_are_failed"));
   end
  
  if((writeDataComparisonSuccessCount != 0) && (writeDataComparisonFailedCount == 0)) begin
     `uvm_info (get_type_name(), $sformatf ("wdata_count_comparisions_are_succesful"),UVM_HIGH);
  end
   else begin
     `uvm_info (get_type_name(), $sformatf ("writeDataComparisonSuccessCount :%0d",
                                             writeDataComparisonSuccessCount),UVM_HIGH);
     `uvm_info (get_type_name(), $sformatf ("writeDataComparisonFailedCount :%0d",
                                             writeDataComparisonFailedCount),UVM_HIGH);
     `uvm_error (get_type_name(), $sformatf ("wdata_count_comparisions_are_failed"));
   end

   if((writeStrbComparisonSuccessCount != 0) && (writeStrbComparisonFailedCount == 0)) begin
     `uvm_info (get_type_name(), $sformatf ("wstrb_count_comparisions_are_succesful"),UVM_HIGH);
  end
   else begin
     `uvm_info (get_type_name(), $sformatf ("writeStrbComparisonSuccessCount :%0d",
                                             writeStrbComparisonSuccessCount),UVM_HIGH);
     `uvm_info (get_type_name(), $sformatf ("writeStrbComparisonFailedCount :%0d",
                                             writeStrbComparisonFailedCount),UVM_HIGH);
     `uvm_error (get_type_name(), $sformatf ("wstrb_count_comparisions_are_failed"));
   end

   if((writeRespComparisonSuccessCount != 0) && (writeRespComparisonFailedCount == 0)) begin
     `uvm_info (get_type_name(), $sformatf ("bresp_count_comparisions_are_succesful"),UVM_HIGH);
  end
   else begin
     `uvm_info (get_type_name(), $sformatf ("writeRespComparisonSuccessCount :%0d",
                                             writeRespComparisonSuccessCount),UVM_HIGH);
     `uvm_info (get_type_name(), $sformatf ("writeRespComparisonFailedCount :%0d",
                                             writeRespComparisonFailedCount),UVM_HIGH);
     `uvm_error (get_type_name(), $sformatf ("bresp_count_comparisions_are_failed"));
   end

  if((readAddressComparisonSuccessCount != 0) && (readAddressComparisonFailedCount == 0)) begin
     `uvm_info (get_type_name(), $sformatf ("araddr_count_comparisions_are_succesful"),UVM_HIGH);
  end
   else begin
     `uvm_info (get_type_name(), $sformatf ("readAddressComparisonSuccessCount:%0d",
                                             readAddressComparisonSuccessCount),UVM_HIGH);
     `uvm_info (get_type_name(), $sformatf ("readAddressComparisonFailedCount :%0d",
                                             readAddressComparisonFailedCount),UVM_HIGH);
     `uvm_error (get_type_name(), $sformatf ("araddr_count_comparisions_are_failed"));
   end
  
   if((readProtComparisonSuccessCount != 0) && (readProtComparisonFailedCount == 0)) begin
     `uvm_info (get_type_name(), $sformatf ("arprot_count_comparisions_are_succesful"),UVM_HIGH);
  end
   else begin
     `uvm_info (get_type_name(), $sformatf ("readProtComparisonSuccessCount :%0d",
                                             readProtComparisonSuccessCount),UVM_HIGH);
     `uvm_info (get_type_name(), $sformatf ("readProtComparisonFailedCount :%0d",
                                             readProtComparisonFailedCount),UVM_HIGH);
     `uvm_error (get_type_name(), $sformatf ("arprot_count_comparisions_are_failed"));
   end

  if((readDataComparisonSuccessCount != 0) && (readDataComparisonFailedCount == 0)) begin
     `uvm_info (get_type_name(), $sformatf ("rdata_count_comparisions_are_succesful"),UVM_HIGH);
  end
   else begin
     `uvm_info (get_type_name(), $sformatf ("readDataComparisonSuccessCount :%0d",
                                             readDataComparisonSuccessCount),UVM_HIGH);
     `uvm_info (get_type_name(), $sformatf ("readDataComparisonFailedCount :%0d",
                                             readDataComparisonFailedCount),UVM_HIGH);
     `uvm_error (get_type_name(), $sformatf ("rdata_count_comparisions_are_failed"));
   end
   
   if((readRespComparisonSuccessCount != 0) && (readRespComparisonFailedCount == 0)) begin
     `uvm_info (get_type_name(), $sformatf ("rresp_count_comparisions_are_succesful"),UVM_HIGH);
  end
   else begin
     `uvm_info (get_type_name(), $sformatf ("readRespComparisonSuccessCount :%0d",
                                             readRespComparisonSuccessCount),UVM_HIGH);
     `uvm_info (get_type_name(), $sformatf ("readRespComparisonFailedCount :%0d",
                                             readRespComparisonFailedCount),UVM_HIGH);
     `uvm_error (get_type_name(), $sformatf ("rresp_count_comparisions_are_failed"));
   end
 end
     
 else if(masterVIPSlaveIPEnvConfig.transactionType ==  Axi4LiteWriteMasterGlobalPkg::WRITE) begin 
  if((writeAddressComparisonSuccessCount != 0) && (writeAddressComparisonFailedCount == 0)) begin
     `uvm_info (get_type_name(), $sformatf ("awaddr_count_comparisions_are_succesful"),UVM_HIGH);
  end
   else begin
     `uvm_info (get_type_name(), $sformatf ("writeAddressComparisonSuccessCount :%0d",
                                             writeAddressComparisonSuccessCount),UVM_HIGH);
     `uvm_info (get_type_name(), $sformatf ("writeAddressComparisonFailedCount :%0d",
                                             writeAddressComparisonFailedCount),UVM_HIGH);
     `uvm_error (get_type_name(), $sformatf ("awaddr_count_comparisions_are_failed"));
   end

  if((writeProtComparisonSuccessCount != 0) && (writeProtComparisonFailedCount == 0)) begin
     `uvm_info (get_type_name(), $sformatf ("awprot_count_comparisions_are_succesful"),UVM_HIGH);
  end
   else begin
     `uvm_info (get_type_name(), $sformatf ("writeProtComparisonSuccessCount :%0d",
                                             writeProtComparisonSuccessCount),UVM_HIGH);
     `uvm_info (get_type_name(), $sformatf ("writeProtComparisonFailedCount :%0d",
                                             writeProtComparisonFailedCount),UVM_HIGH);
     `uvm_error (get_type_name(), $sformatf ("awprot_count_comparisions_are_failed"));
   end
  
  if((writeDataComparisonSuccessCount != 0) && (writeDataComparisonFailedCount == 0)) begin
     `uvm_info (get_type_name(), $sformatf ("wdata_count_comparisions_are_succesful"),UVM_HIGH);
  end
   else begin
     `uvm_info (get_type_name(), $sformatf ("writeDataComparisonSuccessCount :%0d",
                                             writeDataComparisonSuccessCount),UVM_HIGH);
     `uvm_info (get_type_name(), $sformatf ("writeDataComparisonFailedCount :%0d",
                                             writeDataComparisonFailedCount),UVM_HIGH);
     `uvm_error (get_type_name(), $sformatf ("wdata_count_comparisions_are_failed"));
   end

   if((writeStrbComparisonSuccessCount != 0) && (writeStrbComparisonFailedCount == 0)) begin
     `uvm_info (get_type_name(), $sformatf ("wstrb_count_comparisions_are_succesful"),UVM_HIGH);
  end
   else begin
     `uvm_info (get_type_name(), $sformatf ("writeStrbComparisonSuccessCount :%0d",
                                             writeStrbComparisonSuccessCount),UVM_HIGH);
     `uvm_info (get_type_name(), $sformatf ("writeStrbComparisonFailedCount :%0d",
                                             writeStrbComparisonFailedCount),UVM_HIGH);
     `uvm_error (get_type_name(), $sformatf ("wstrb_count_comparisions_are_failed"));
   end

   if((writeRespComparisonSuccessCount != 0) && (writeRespComparisonFailedCount == 0)) begin
     `uvm_info (get_type_name(), $sformatf ("bresp_count_comparisions_are_succesful"),UVM_HIGH);
  end
   else begin
     `uvm_info (get_type_name(), $sformatf ("writeRespComparisonSuccessCount :%0d",
                                             writeRespComparisonSuccessCount),UVM_HIGH);
     `uvm_info (get_type_name(), $sformatf ("writeRespComparisonFailedCount :%0d",
                                             writeRespComparisonFailedCount),UVM_HIGH);
     `uvm_error (get_type_name(), $sformatf ("bresp_count_comparisions_are_failed"));
   end
  end

  else if( masterVIPSlaveIPEnvConfig.transactionType == Axi4LiteReadMasterGlobalPkg::READ) begin 
  if((readAddressComparisonSuccessCount != 0) && (readAddressComparisonFailedCount == 0)) begin
     `uvm_info (get_type_name(), $sformatf ("araddr_count_comparisions_are_succesful"),UVM_HIGH);
  end
   else begin
     `uvm_info (get_type_name(), $sformatf ("readAddressComparisonSuccessCount:%0d",
                                             readAddressComparisonSuccessCount),UVM_HIGH);
     `uvm_info (get_type_name(), $sformatf ("readAddressComparisonFailedCount :%0d",
                                             readAddressComparisonFailedCount),UVM_HIGH);
     `uvm_error (get_type_name(), $sformatf ("araddr_count_comparisions_are_failed"));
   end
  
   if((readProtComparisonSuccessCount != 0) && (readProtComparisonFailedCount == 0)) begin
     `uvm_info (get_type_name(), $sformatf ("arprot_count_comparisions_are_succesful"),UVM_HIGH);
  end
   else begin
     `uvm_info (get_type_name(), $sformatf ("readProtComparisonSuccessCount :%0d",
                                             readProtComparisonSuccessCount),UVM_HIGH);
     `uvm_info (get_type_name(), $sformatf ("readProtComparisonFailedCount :%0d",
                                             readProtComparisonFailedCount),UVM_HIGH);
     `uvm_error (get_type_name(), $sformatf ("arprot_count_comparisions_are_failed"));
   end

  if((readDataComparisonSuccessCount != 0) && (readDataComparisonFailedCount == 0)) begin
     `uvm_info (get_type_name(), $sformatf ("rdata_count_comparisions_are_succesful"),UVM_HIGH);
  end
   else begin
     `uvm_info (get_type_name(), $sformatf ("readDataComparisonSuccessCount :%0d",
                                             readDataComparisonSuccessCount),UVM_HIGH);
     `uvm_info (get_type_name(), $sformatf ("readDataComparisonFailedCount :%0d",
                                             readDataComparisonFailedCount),UVM_HIGH);
     `uvm_error (get_type_name(), $sformatf ("rdata_count_comparisions_are_failed"));
   end
   
   if((readRespComparisonSuccessCount != 0) && (readRespComparisonFailedCount == 0)) begin
     `uvm_info (get_type_name(), $sformatf ("rresp_count_comparisions_are_succesful"),UVM_HIGH);
  end
   else begin
     `uvm_info (get_type_name(), $sformatf ("readRespComparisonSuccessCount :%0d",
                                             readRespComparisonSuccessCount),UVM_HIGH);
     `uvm_info (get_type_name(), $sformatf ("readRespComparisonFailedCount :%0d",
                                             readRespComparisonFailedCount),UVM_HIGH);
     `uvm_error (get_type_name(), $sformatf ("rresp_count_comparisions_are_failed"));
   end
 end

   if(axi4LiteMasterWriteEnvAddressFIFO.size() != 0) begin
    `uvm_error("SC_CheckPhase", $sformatf("axi4Lite masterWriteAddress analysisFIFO is not empty: %0d", axi4LiteMasterWriteEnvAddressFIFO.size()));
  end

  if(axi4LiteMasterWriteEnvDataFIFO.size() != 0) begin
    `uvm_error ("SC_CheckPhase", $sformatf ("axi4Lite masterWriteData analysisFIFO is not empty : %0d", axi4LiteMasterWriteEnvDataFIFO.size()));
  end

  if(axi4LiteMasterWriteEnvResponseFIFO.size() != 0) begin
    `uvm_error ("SC_CheckPhase", $sformatf ("axi4Lite masterWriteResponse analysisFIFO is not empty: %0d",axi4LiteMasterWriteEnvResponseFIFO.size()));
  end
   
  if(axi4LiteMasterReadEnvAddressFIFO.size() != 0) begin
    `uvm_error ("SC_CheckPhase", $sformatf ("axi4Lite masterReadAddress analysisFIFO is not empty : %0d ", axi4LiteMasterReadEnvAddressFIFO.size()));
  end
  
  if(axi4LiteMasterReadEnvDataFIFO.size() != 0) begin
    `uvm_error ("SC_CheckPhase", $sformatf ("axi4Lite masterReadData analysisFIFO is not empty :%0d",axi4LiteMasterReadEnvDataFIFO.size()));
  end

   if(axi4LiteSlaveWriteEnvAddressFIFO.size() != 0) begin
    `uvm_error ("SC_CheckPhase", $sformatf ("axi4Lite slaveWriteAddress analysisFIFO is not empty : %0d", axi4LiteSlaveWriteEnvAddressFIFO.size()));
  end
   
  if(axi4LiteSlaveWriteEnvDataFIFO.size() != 0) begin
    `uvm_error ("SC_CheckPhase", $sformatf ("axi4Lite slaveWriteData analysisFIFO is not empty : %0d", axi4LiteSlaveWriteEnvDataFIFO.size()));
  end
 
  if(axi4LiteSlaveWriteEnvResponseFIFO.size() != 0) begin
    `uvm_error ("SC_CheckPhase", $sformatf ("axi4Lite slaveWriteResponse analysisFIFO is not empty: %0d",axi4LiteSlaveWriteEnvResponseFIFO.size()));
  end
   
  if(axi4LiteSlaveReadEnvAddressFIFO.size() != 0) begin
    `uvm_error ("SC_CheckPhase", $sformatf ("axi4Lite slaveReadAddress analysisFIFO is not empty : %0d ", axi4LiteSlaveReadEnvAddressFIFO.size()));
  end 

  if(axi4LiteSlaveReadEnvDataFIFO.size() != 0) begin
    `uvm_error ("SC_CheckPhase", $sformatf ("axi4Lite slaveReadData analysisFIFO is not empty :%0d",axi4LiteSlaveReadEnvDataFIFO.size()));
  end
  
  `uvm_info(get_type_name(),$sformatf("--\n----------------------------------------------END OF SCOREBOARD CHECK PHASE---------------------------------------"),UVM_HIGH)

endfunction : check_phase

function void MasterVIPSlaveIPScoreboard::report_phase(uvm_phase phase);
  super.report_phase(phase);
  `uvm_info(get_type_name(),$sformatf("--\n----------------------------------------------SCOREBOARD REPORT PHASE---------------------------------------"),UVM_HIGH) 
  $display("-------------------------------------------- ");

  `uvm_info (get_type_name(),$sformatf("Total no of awaddrComparisionsCount:%0d",writeAddressComparisonSuccessCount+writeAddressComparisonFailedCount),UVM_HIGH);
  `uvm_info (get_type_name(),$sformatf("Total no. of writeAddressComparisonFailedCount :%0d",writeAddressComparisonFailedCount),UVM_HIGH);
  `uvm_info (get_type_name(),$sformatf("Total no. of writeAddressComparisonSuccessCount :%0d",writeAddressComparisonSuccessCount),UVM_HIGH);
  
  `uvm_info (get_type_name(),$sformatf("Total no of awprotComparisionsCount:%0d",writeProtComparisonSuccessCount+writeProtComparisonFailedCount),UVM_HIGH);
  `uvm_info (get_type_name(),$sformatf("Total no. of writeProtComparisonFailedCount :%0d",writeProtComparisonFailedCount),UVM_HIGH);
  `uvm_info (get_type_name(),$sformatf("Total no. of writeProtComparisonSuccessCount :%0d",writeProtComparisonSuccessCount),UVM_HIGH);

  `uvm_info (get_type_name(),$sformatf("Total no of wdataComparisionsCount:%0d",writeDataComparisonSuccessCount+writeDataComparisonFailedCount),UVM_HIGH);
  `uvm_info (get_type_name(),$sformatf("Total no. of writeDataComparisonFailedCount :%0d",writeDataComparisonFailedCount),UVM_HIGH);
  `uvm_info (get_type_name(),$sformatf("Total no. of writeDataComparisonSuccessCount :%0d",writeDataComparisonSuccessCount),UVM_HIGH);
  
  `uvm_info (get_type_name(),$sformatf("Total no of wstrbComparisionsCount:%0d",writeStrbComparisonSuccessCount+writeStrbComparisonFailedCount),UVM_HIGH);
  `uvm_info (get_type_name(),$sformatf("Total no. of writeStrbComparisonFailedCount :%0d",writeStrbComparisonFailedCount),UVM_HIGH);
  `uvm_info (get_type_name(),$sformatf("Total no. of writeStrbComparisonSuccessCount :%0d",writeStrbComparisonSuccessCount),UVM_HIGH);

  `uvm_info (get_type_name(),$sformatf("Total no of brespComparisionsCount:%0d",writeRespComparisonSuccessCount+writeRespComparisonFailedCount),UVM_HIGH);
  `uvm_info (get_type_name(),$sformatf("Total no. of writeRespComparisonFailedCount :%0d",writeRespComparisonFailedCount),UVM_HIGH);
  `uvm_info (get_type_name(),$sformatf("Total no. of writeRespComparisonSuccessCount :%0d",writeRespComparisonSuccessCount),UVM_HIGH);

  `uvm_info (get_type_name(),$sformatf("Total no of araddrComparisionsCount:%0d",readAddressComparisonSuccessCount+readAddressComparisonFailedCount),UVM_HIGH);
  `uvm_info (get_type_name(),$sformatf("Total no. of readAddressComparisonFailedCount :%0d",readAddressComparisonFailedCount),UVM_HIGH);
  `uvm_info (get_type_name(),$sformatf("Total no. of readAddressComparisonSuccessCount :%0d",readAddressComparisonSuccessCount),UVM_HIGH);
  
  `uvm_info (get_type_name(),$sformatf("Total no of arprotComparisionsCount:%0d",readProtComparisonSuccessCount+readProtComparisonFailedCount),UVM_HIGH);
  `uvm_info (get_type_name(),$sformatf("Total no. of readProtComparisonFailedCount :%0d",readProtComparisonFailedCount),UVM_HIGH);
  `uvm_info (get_type_name(),$sformatf("Total no. of readProtComparisonSuccessCount :%0d",readProtComparisonSuccessCount),UVM_HIGH);
  
  `uvm_info (get_type_name(),$sformatf("Total no of rdataComparisionsCount:%0d",readDataComparisonSuccessCount+readDataComparisonFailedCount),UVM_HIGH);
  `uvm_info (get_type_name(),$sformatf("Total no. of readDataComparisonFailedCount :%0d",readDataComparisonFailedCount),UVM_HIGH);
  `uvm_info (get_type_name(),$sformatf("Total no. of readDataComparisonSuccessCount :%0d",readDataComparisonSuccessCount),UVM_HIGH);
  
  `uvm_info (get_type_name(),$sformatf("Total no of rrespComparisionsCount:%0d",readRespComparisonSuccessCount+readRespComparisonFailedCount),UVM_HIGH);
  `uvm_info (get_type_name(),$sformatf("Total no. of readRespComparisonFailedCount :%0d",readRespComparisonFailedCount),UVM_HIGH);
  `uvm_info (get_type_name(),$sformatf("Total no. of readRespComparisonSuccessCount :%0d",readRespComparisonSuccessCount),UVM_HIGH);
  `uvm_info(get_type_name(),$sformatf("--\n----------------------------------------------END OF SCOREBOARD REPORT PHASE---------------------------------------"),UVM_HIGH)
endfunction : report_phase

`endif

