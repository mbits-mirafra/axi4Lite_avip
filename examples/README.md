# How to set up and evaluate new RTL by reusing the existing VIP

### Step 1. Integration
How to integrate the VIP into the RTL as Master or Slave.
  
**1.Setup environment variable path**
  
 ```systemverilog
For setenv path source Axi4LiteMasterSetEnvPath.csh file
This file is preset inside the axi4Lite_avip and parallel to the example folder.

#Run command:
source Axi4LiteMasterSetEnvPath.csh
```

**2.Setup rtl directory using the script**   
  
Here we have two script, one for the master rtl and another for the slave rtl    
`masterRTLTestBench.csh` or `slaveRTLTestBench.csh`   
To integrate the Master as VIP and the Slave as RTL, use the `masterRTLTestBench.csh` script    
Conversely, to integrate the Slave as VIP and the Master as RTL, use the `slaveRTLTestBench.csh` script.  
  
![image](https://github.com/user-attachments/assets/ea2f4451-6626-483a-90d4-08ae79a103de)

       
Let's say we are integrating the Master as a VIP and the Slave as RTL   
 
Example: `source masterRTLTestBench.csh <argv>`  

When using the script, you need to provide a user-defined name. For example, when integrating the Master as VIP and the Slave as RTL, the name could be `VIPMasterRTLSlaveExample2`. and the script will then create a directory with this name. Please refer to the picture below for further details.

         source masterRTLTestBench.csh VIPMasterRTLSlaveExample2

![image](https://github.com/user-attachments/assets/6afe19c9-c8d8-4333-83f3-dca29512f8de)

**3.You can `cd` to the rtl directory and add/clone your rtl file inside this directory.**   
  
In this case, we have created the file, as shown in the picture below. on the one hand, you can also clone the project that contains the RTL files.   

![image](https://github.com/user-attachments/assets/1e7e3f4e-5a17-4d5b-99fc-bcb6f2b73fd2)

**6.Now add only the slaveRTL file inside the project.f file, which is located in the sim directory** 
  
Here, we have added the path for the RTL file inside the `project.f`, as shown in the picture below. If you clone the RTL directory, you will need to specify the specific path for the RTL file.  
  
![image](https://github.com/user-attachments/assets/49f8761c-43cc-497a-aeb1-33868014fcaf)

**5.Now do instantiation for the SlaveRTL signals inside the MasterVIPSlaveIPHdlTop file**
  
This file is located at `src/tb/MasterVIPSlaveIPHdlTop.sv`  

![image](https://github.com/user-attachments/assets/68379948-d47d-4fde-934a-e64cb4bf4bd0)


### step2. Simulation 
  
**1.command for regressions**  
  
Navigate to the `sim/questasim/` directory using `cd`, then run the make command. This will display the available targets for compilation, simulation, and regression. Choose the appropriate regression target and execute it accordingly.    
Example:-  `make regression testlist_name=MasterVIPSlaveIPTestSuite.list`

![image](https://github.com/user-attachments/assets/1c5289ae-3705-4574-b3bc-6c76ef1ffd23)


**2.Run the regression and check the final reports**   
  
After running the regression, you will get all kinds of reports, as we showed in the images figure number 1. 

![image](https://github.com/user-attachments/assets/df0a3612-46ed-4ab9-b1ee-316ad2fe5925)

                                       Figure.1.All_log report 


The Firefox reports contain the coverage report, assertions checks report, and coverage properties. We have shown this percentage report, you can see an example of the report in the picture below, figure number number 2.   
  
![image](https://github.com/user-attachments/assets/86829ee7-fb0b-4719-acc6-3a924e99cacd)

                                       Figure.1. firefox report 


If you open the file axi4LiteViolatedFeatures.log, it will show the violated features. There are a total of six features, of which two are found to be violating. You can see this illustrated in the picture below, figure number 3 


![image](https://github.com/user-attachments/assets/d482e691-f7cc-4b50-a84e-4817a07445be)

                                       Figure.3. axi4LiteViolatedFeatures.log report 

If you open the axi4LiteViolatedReqIDs.log file, it will show the total number of requirement IDs. After running the regression, 21 ReqIDs failed out of 53 implemented requirements. This is illustrated in the picture below as in figure number 4 

![image](https://github.com/user-attachments/assets/8241b3c4-e8ad-4c43-8768-df97464b01f1)

                                       Figure.4. axi4LiteViolatedReqIDs.log report 

If you open the axi4LiteFinalRTLViolatedFeatures.log file There are Multiple features, sub-features, requirement IDs, Definition of Done(DOD), and different types of metrics. Here we have a violation report in detail, which shows which metrics failed with full detail path in the features list. Shown in Figure 5.

![image](https://github.com/user-attachments/assets/9f1feb8c-57fb-4ce1-967c-610758e8ecfa)

                                       Figure.5. axi4LiteViolatedReqIDs.log report 






