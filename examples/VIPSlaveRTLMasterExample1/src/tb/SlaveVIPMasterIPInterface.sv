`ifndef SLAVEVIPMASTERIPINTERFACE_INCLUDED_
`define SLAVEVIPMASTERIPINTERFACE_INCLUDED_

interface SlaveVIPMasterIPInterface(input aclk, input aresetn);


  Axi4LiteMasterInterface axi4LiteMasterInterface(.aclk(aclk),
                                                  .aresetn(aresetn)
                                                 );

  Axi4LiteSlaveInterface axi4LiteSlaveInterface(.aclk(aclk),
                                                .aresetn(aresetn)
                                               );

endinterface: SlaveVIPMasterIPInterface 

`endif
