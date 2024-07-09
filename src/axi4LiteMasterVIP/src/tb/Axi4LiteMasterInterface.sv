`ifndef AXI4LITEMASTERINTERFACE_INCLUDED_
`define AXI4LITEMASTERINTERFACE_INCLUDED_

interface Axi4LiteMasterInterface(input aclk, input aresetn);

  Axi4LiteMasterWriteInterface axi4LiteMasterWriteInterface(.aclk(aclk),
                                                            .aresetn(aresetn)
                                                            );

  Axi4LiteMasterReadInterface axi4LiteMasterReadInterface(.aclk(aclk),
                                                          .aresetn(aresetn)
                                                          );

endinterface: Axi4LiteMasterInterface 

`endif
