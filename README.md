
# axi4Lite_avip
This project deals with the axi4Lite protocol

# Accelerated VIP for axi4Lite Protocol
The idea of using Accelerated VIP is to push the synthesizable part of the testbench into the separate top module along with the interface and it is named as HDL TOP and the unsynthesizable part is pushed into the HVL TOP. This setup provides the ability to run longer tests quickly. This particular testbench can be used for the simulation as well as the emulation based on the mode of operation.


## Key Features 
1. This will support configurable data widths, typically 32-bit or 64-bit data transfer.
2. it will support the Two-phase Handshaking Mechanism.
3. Support multiple write-read operation
4. Independent Valid and Ready Signals On each channel.
5. it will support the Read and Write Response
6. AXI4-Lite supports back-to-back transactions 
7. Support multiple outstanding transactions.

## Unique feature of VIP 
1. Unit-level testing, like assertions, and cover property.
2. Artificial intelligence test case
3. Exhaustive intelligent Test suite
4. Advanced concepts like UVM sequences layering.
5. Script for automatically generating the violated features
6. Automatic evaluation ability
7. Set up the environment for each IP level.

   
## Testbench Architecture Diagram
![image](https://github.com/user-attachments/assets/208e83bf-25b2-4af0-9d2f-835d27d9d8c6)

## Developers, Welcome
We believe in growing together and if you'd like to contribute, please do check out the contributing guide below:  
https://github.com/mbits-mirafra/axi4Lite_avip/blob/main/contribution_guidelines.md

## Installation - Get the VIP collateral from the GitHub repository

```
# Checking for git software, open the terminal type the command
git version

# Get the VIP collateral
git clone git@github.com:mbits-mirafra/axi4Lite_avip.git
```

# setup environment variable path
```
For setenv path source Axi4LiteMasterSetEnvPath.csh file

#Run command:
source Axi4LiteMasterSetEnvPath.csh
```

## Running the test

### Using Mentor's Questasim simulator 

```
cd axi4Lite_avip/sim/questasim

# Compilation:  
make compile

# Simulation:
make simulate test=<test_name> uvm_verbosity=<VERBOSITY_LEVEL>

ex: make simulate test=Axi4Lite32bitWriteAndReadTest uvm_verbosity=UVM_HIGH

# Note: You can find all the test case names in the path given below
axi4Lite_avip/src/testlists/axi4LiteRegression.list

# Wavefrom:  
vsim -view <test_name>/waveform.wlf &

ex: vsim -view Axi4Lite32bitWriteAndReadTest/waveform.wlf &

# Regression:
make regression testlist_name=<regression_testlist_name.list>
ex: make regression testlist_name=axi4LiteRegression.list

# Coverage: 
 ## Individual test:
 firefox <test_name>/html_cov_report/index.html &
 ex: firefox Axi4Lite32bitWriteAndReadTest/html_cov_report/index.html &

 ## Regression:
 firefox merged_cov_html_report/index.html &

```
### Using Synopsys VCS simulator 
```
cd axi4Lite_avip/sim/synopsysSim

# Compilation:  
make compile

# Simulation:
make simulate test=<test_name> uvm_verbosity=<VERBOSITY_LEVEL>

ex: make simulate test=Axi4Lite32bitWriteAndReadTest uvm_verbosity=UVM_HIGH

# Note: You can find all the test case names in the path given below
axi4Lite_avip/src/testlists/axi4LiteRegression.list

# Wavefrom:
verdi -ssf novas.fsdb

# Regression:
make regression testlist_name=<regression_testlist_name.list>
ex: make regression testlist_name=axi4LiteRegression.list

# Coverage: 
 ## Individual test:
 firefox <test_name>/grp0.html &
 ex: firefox Axi4Lite32bitWriteAndReadTest/grp0.html &

 ## Regression:
 firefox regressionReport/grp0.html &

```
## Latest regression coverage report and How to check report link
[Click here for the report link](https://github.com/mbits-mirafra/axi4Lite_avip/issues/1)

## Contact Mirafra Team  
You can reach out to us over mbits@mirafra.com

For more information regarding Mirafra Technologies please do check out our official website:  
https://mirafra.com/
