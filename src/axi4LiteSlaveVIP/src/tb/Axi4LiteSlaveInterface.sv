`ifndef AXI4LITESLAVEINTERFACE_INCLUDED_
`define AXI4LITESLAVEINTERFACE_INCLUDED_

interface Axi4LiteSlaveInterface(input aclk, input aresetn);

  Axi4LiteSlaveWriteInterface axi4LiteSlaveWriteInterface(.aclk(aclk),
                                                          .aresetn(aresetn)
                                                          );

  Axi4LiteSlaveReadInterface axi4LiteSlaveReadInterface(.aclk(aclk),
                                                        .aresetn(aresetn)
                                                        );

endinterface: Axi4LiteSlaveInterface 

`endif
