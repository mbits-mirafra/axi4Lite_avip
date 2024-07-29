`ifndef AXI4LITEINTERFACE_INCLUDED_
`define AXI4LITEINTERFACE_INCLUDED_

interface Axi4LiteInterface(input aclk, input aresetn);


  Axi4LiteMasterInterface axi4LiteMasterInterface(.aclk(aclk),
                                                  .aresetn(aresetn)
                                                 );

  Axi4LiteSlaveInterface axi4LiteSlaveInterface(.aclk(aclk),
                                                .aresetn(aresetn)
                                               );

endinterface: Axi4LiteInterface 

`endif
