# How to setup new RTL with the reuse VIP

## Setup environment variable path
```
For setenv path source Axi4LiteMasterSetEnvPath.csh file
This file is preset inside the axi4Lite_avip and parallel to the example folder.

#Run command:
source Axi4LiteMasterSetEnvPath.csh
```

### So first create a new directory inside the example folder (axi4Lite_avip/examples/).  

![image](https://github.com/user-attachments/assets/e1d56070-2473-443a-af7e-41c234a75763)  


### So here we created a new directory using VIPMasterRTLSlaveExample2 name, and cd to this directory.  
![image](https://github.com/user-attachments/assets/5ffbdf84-ccbb-4872-9609-c96010e47811)  

### Now Copy the sim and src directory from VIPMasterRTLSlave.  
![image](https://github.com/user-attachments/assets/e75cc920-b230-4c25-b089-e28ebe54c801)  


### Now you can create the rtl directory and add your rtl file inside that directory.  
![image](https://github.com/user-attachments/assets/e7b1fe35-07ed-435c-8097-30bd9755b065)  


### Now do instantiation for the SlaveRTL inside the MasterVIPSlaveIPHdlTop file.

![image](https://github.com/user-attachments/assets/8cd24661-126c-4614-bd2a-b00c183683a2)

### Now add the slaveRTL and other required files path inside the project.f file and this file is present inside the sim directory.
![image](https://github.com/user-attachments/assets/9431961d-287c-40eb-bec8-354fa116a270)

### After all setup is done just run regression and check the output using coverage file and other checks.
```
#Run regression using the below command :
make regression testlist_name=MasterVIPSlaveIPTestSuite.list
```
