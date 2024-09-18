`ifndef MASTERVIPSLAVEIPINTERFACE_INCLUDED_
`define MASTERVIPSLAVEIPINTERFACE_INCLUDED_

interface MasterVIPSlaveIPInterface(input aclk, input aresetn);


  Axi4LiteMasterInterface axi4LiteMasterInterface(.aclk(aclk),
                                                  .aresetn(aresetn)
                                                 );

endinterface: MasterVIPSlaveIPInterface 

`endif
