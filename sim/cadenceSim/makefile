# -s means silent mode
# The command executed along with the output will be displayed on the terminal
# To get only the ouput use 'silent' mode
#
# make target -s


# -n or --just-print 
# The first test I perform on a new makefile target is to invoke make with the --just-print (-n) option. 
# This causes make to read the makefile and print every command it would normally execute to 
# update the target but without executing them.
#
# make target -n


# When you run make with the -i or --ignore-errors flag, 
# errors are ignored in all recipes of all rules. 
# A rule in the makefile for the special target .IGNORE has the same effect, 
# if there are no prerequisites. This is less flexible but sometimes useful.
# When errors are to be ignored, because of -i flag, make treats an error return just like success,
# except that it prints out a message that tells you the status code the shell exited with, 
# and says that the error has been ignored.
#
# make target -i 


.IGNORE:
	compile
	simulate

# WE can also use the target where we WANT the silent mode 
.SILENT:
	compile
	simulate
	usage

# First target will be executed incase the user doesn't mention
# the target to execute
# In this case, usage will be executed
# Usage
usage:
	@echo "";
	@echo "-----------------------------------------------------------------";
	@echo "------------------------- Usage ---------------------------------";
	@echo "";
	@echo "make target <options> <variable>=<value>";
	@echo "";
	@echo "To compile use:"
	@echo "make compile";
	@echo "";
	@echo "To provide compilation argument:";
	@echo "make compile comp_args=\"+define+<macro_name>=<width> +define+<macro_name>=<width> +define+<macro_name>=<value> +define+<macro_name>=<value> +define+<macro_name>=<value> +define+<macro_name>=<value> +define+<macro_name>=<value>\"";
	@echo "";
	@echo "Example:":
	@echo "make compile comp_args=\"+define+ADDRESS_WIDTH=64 +define+DATA_WIDTH=64 +define+DEFAULT_AWREADY=1 +define+DEFAULT_WREADY=1 +define+DEFAULT_BREADY=1 +define+DEFAULT_ARREADY=1 +define+DEFAULT_RREADY=1\"";
	@echo "";
	@echo "To simulate individual test:"
	@echo "make simulate test=<test_name> uvm_verbosity=<VERBOSITY_LEVEL>";
	@echo "";
	@echo "Example:":
	@echo "make simulate test=base_test uvm_verbosity=UVM_HIGH";
	@echo "";
	@echo "To provide seed number (default is random):"
	@echo "make simulate test=<test_name> uvm_verbosity=<VERBOSITY_LEVEL> seed=<value>";
	@echo "";
	@echo "To run regression:"
	@echo "make regression testlist_name=<regression_testlist_name.list>";
	@echo "";
	@echo "Example:":
	@echo "make regression testlist_name=axi4LiteRegression.list";
	@echo "";
	@echo "To provide compilation argument in the regression:";
	@echo "make regression comp_args=\"+define+<macro_name>=<width> +define+<macro_name>=<width> +define+<macro_name>=<value> +define+<macro_name>=<value> +define+<macro_name>=<value> +define+<macro_name>=<value> +define+<macro_name>=<value>\" testlist_name=axi4LiteRegression.list";
	@echo "";
	@echo "Example:":
	@echo "make regression comp_args=\"+define+ADDRESS_WIDTH=64 +define+DATA_WIDTH=64 +define+DEFAULT_AWREADY=1 +define+DEFAULT_WREADY=1 +define+DEFAULT_BREADY=1 +define+DEFAULT_ARREADY=1 +define+DEFAULT_RREADY=1\" testlist_name=axi4LiteRegression.list";
	@echo "";
	@echo "-----------------------------------------------------------------";
	@echo "-----------------------------------------------------------------";
	@echo "";

all:
	make clean_compile; make compile; make simulate;

clean_compile: 
	rm -rf *_compile.log *_compile.history xcelium.d

clean_sim: 
	rm -rf *Test


compile:
	make clean_compile;

	xrun -c \
	-elaborate \
	-access +rwc \
	-64 \
	-sv \
	-uvm \
	+access+rw \
	-f $(AXI4LITE_PROJECT)/src/axi4LiteMasterVIP/src/axi4LiteMasterWriteVIP/sim/Axi4LiteWriteMaster.f \
  -f $(AXI4LITE_PROJECT)/src/axi4LiteMasterVIP/src/axi4LiteMasterReadVIP/sim/Axi4LiteReadMaster.f \
  -f $(AXI4LITE_PROJECT)/src/axi4LiteSlaveVIP/src/axi4LiteSlaveWriteVIP/sim/Axi4LiteWriteSlave.f \
  -f $(AXI4LITE_PROJECT)/src/axi4LiteSlaveVIP/src/axi4LiteSlaveReadVIP/sim/Axi4LiteReadSlave.f \
  -f $(AXI4LITE_PROJECT)/sim/Axi4LiteProject.f \
  -access +r +vcd \
	-l Axi4LiteCompile.log \
	-top work.Axi4LiteHvlTop $(AXI4LITE_PROJECT)/src/tb/Axi4LiteHvlTop.sv \
	-top work.Axi4LiteHdlTop $(AXI4LITE_PROJECT)/src/tb/Axi4LiteHdlTop.sv \
	-coverage all \
	-sva 

	# -s means silent mode
	#  The command executed along with the output will be displayed on the terminal
	#  To get only the ouput use 'silent' mode
	# make compile_war_err -s
	# or use .SILENT
	make compile_war_err

# setting the comamnd for the commmand line argumnet for the test
ifndef test
override test := Axi4LiteBaseTest
endif

ifndef test_folder
override test_folder := $(test)
endif

ifndef uvm_verbosity
override uvm_verbosity := UVM_MEDIUM
endif

# Setting the default seed value to random
ifndef seed
override seed = random
endif


simulate:
	mkdir $(test_folder)
	xrun -R \
	-64 \
	-sv \
	-uvm \
  +sv_seed=$(seed) \
	+UVM_TESTNAME=$(test) \
	+UVM_VERBOSITY=$(uvm_verbosity) \
	-l $(test_folder)/$(test).log \
	-coverage all \
	-covoverwrite \
	-covtest $(test_folder)/ \
  +plusarg_ignore \

	mv *.vcd $(test_folder)/$(test).vcd
	# For checking and reporting simulation errors
	make simulate_war_err

#	-l transcript_vcs.log

	
	## For Regression and coverage merge
##
regression:
	#Run compilation
	make compile
	#Run simualtion - regression
	python regression_handling.py $(testlist_name)
	#	# Get the tests from regression list
	#	Merge coverage
	#make merge_cov_report
 ## make clean

clean_all:
	make clean_compile;
	make clean_simulate;


compile_war_err:
	echo "";
	echo "-----------------------------------------------------------------";
	echo "------------------- Compilation Report --------------------------";
	echo "";
	grep "** " Axi4LiteCompile.log;
	echo "";
	grep "Error" Axi4LiteCompile.log;
	echo "";
	echo "Log file path: Axi4LiteCompile.log"
	echo "";
	echo "-----------------------------------------------------------------";
	echo "-----------------------------------------------------------------";
	echo "";

simulate_war_err:
	echo "";
	echo "-----------------------------------------------------------------";
	echo "-------------------- Simulation Report --------------------------";
	echo "";
	echo "Simulator Errors";
	grep "Error" $(test_folder)/$(test).log;
	echo "";
	echo "UVM Fatal";
	grep "UVM_FATAL" $(test_folder)/$(test).log;
	echo "";
	echo "UVM Errors";
	grep "UVM_ERROR" $(test_folder)/$(test).log;
	echo "";
	echo "UVM Warnings";
	grep "UVM_WARNING" $(test_folder)/$(test).log;
	echo "";
	echo "Testname: $(test)"
	echo "";
	echo "Log file path: $(test_folder)/$(test).log"
	echo "";
	echo "Waveform: simvision $(test_folder)/$(test).vcd &"
	echo "";
	echo "-----------------------------------------------------------------";
	echo "-----------------------------------------------------------------";
	echo "";
