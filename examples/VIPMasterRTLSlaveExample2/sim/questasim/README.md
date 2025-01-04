This RTL is supporting the awready, wready and arready default state as high 

Just follow below run commands for the simulation

make compile comp_args="+define+DEFAULT_AWREADY=1 +define+DEFAULT_WREADY=1 +define+DEFAULT_ARREADY=1" && make simulate test=<TestCase name>

