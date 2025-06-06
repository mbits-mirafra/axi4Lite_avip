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
	echo "";
	echo "-----------------------------------------------------------------";
	echo "------------------------- Usage ---------------------------------";
	echo "";
	echo "make target <options> <variable>=<value>";
	echo "";
	echo "To compile use:"
	echo "make compile";
	echo "";
	echo "To provide compilation argument:";
	echo "make compile comp_args=\"+define+<macro_name>=<width> +define+<macro_name>=<width> +define+<macro_name>=<value>\"";
	echo "";
	echo "Example:":
	echo "make compile comp_args=\"+define+ADDRESS_WIDTH=64 +define+DATA_WIDTH=64 +define+DEFAULT_READY=1\"";
	echo "";
	echo "To simulate individual test:"
	echo "make simulate test=<test_name> uvm_verbosity=<VERBOSITY_LEVEL>";
	echo "";
	echo "Example:":
	echo "make simulate test=base_test uvm_verbosity=UVM_HIGH";
	echo "";
	echo "To provide seed number (default is random):"
	echo "make simulate test=<test_name> uvm_verbosity=<VERBOSITY_LEVEL> seed=<value>";
	echo "";
	echo "To run regression:"
	echo "make regression testlist_name=<regression_testlist_name.list>";
	echo "";
	echo "Example:":
	echo "make regression testlist_name=regression.list";
	echo "";
	echo "To provide compilation argument in the regression:";
	echo "make regression comp_args=\"+define+<macro_name>=<width> +define+<macro_name>=<width> +define+<macro_name>=<value>\" testlist_name=regression.list";
	echo "";
	echo "Example:":
	echo "make regression comp_args=\"+define+ADDRESS_WIDTH=64 +define+DATA_WIDTH=64 +define+DEFAULT_READY=1\" testlist_name=regression.list";
	echo "";
	echo "-----------------------------------------------------------------";
	echo "-----------------------------------------------------------------";
	echo "";

all:
	make clean; make compile; make simulate;

# For Assertions use +acc options
#  +cover=becstf

VCS_CMD_RAND = vcs -full64 -sverilog +v2k -cm assert -debug_access+all -debug_acc+pp+dmptf -ntb_opts uvm-1.2 +ntb_random_seed_automatic +memcbk +vcs+fsdbon+all -override_timescale=1ns/1ps 

 
compile:
	${VCS_CMD_RAND} \
	$(comp_args) \
	-l MasterVIPSlaveIPCompile.log \
	+plusarg_ignore \
	-f $(AXI4LITE_PROJECT)/src/axi4LiteMasterVIP/src/axi4LiteMasterWriteVIP/sim/Axi4LiteWriteMaster.f \
	-f $(AXI4LITE_PROJECT)/src/axi4LiteMasterVIP/src/axi4LiteMasterReadVIP/sim/Axi4LiteReadMaster.f \
	-f $(AXI4LITE_PROJECT)/src/axi4LiteSlaveVIP/src/axi4LiteSlaveWriteVIP/sim/Axi4LiteWriteSlave.f \
	-f $(AXI4LITE_PROJECT)/src/axi4LiteSlaveVIP/src/axi4LiteSlaveReadVIP/sim/Axi4LiteReadSlave.f \
	-f $(AXI4LITE_PROJECT)/examples/VIPMasterRTLSlaveExample2/sim/project.f

	# -s means silent mode
	#  The command executed along with the output will be displayed on the terminal
	#  To get only the ouput use 'silent' mode
	# make compile_war_err -s
	# or use .SILENT
	make compile_war_err

# Setting a default test as base_test
ifndef test
override test = MasterVIPSlaveIPBaseTest
endif

# Setting the default uvm_verbosity to UVM_MEDIUM
ifndef uvm_verbosity
override uvm_verbosity = UVM_MEDIUM
endif

# Setting the default seed value to random
ifndef seed
override seed = random
endif

# Setting the default test folder to test name 
ifndef test_folder
override test_folder = $(test)
endif

simulate:
	mkdir $(test_folder)

	# Use -novopt for no optimization - Makes the simulation slower
	./simv \
	-cm assert \
	+UVM_TESTNAME=$(test) \
	+UVM_VERBOSITY=$(uvm_verbosity) \
	-sv_seed $(seed) \
	-cm_dir $(test_folder)/coverage \
	-l $(test_folder)/$(test).log
	urg -report $(test_folder) -dir simv.vdb

	# For checking and reporting simulation errors
	make simulate_war_err

clean:
	rm -rf csrc simv* work *.bak *.vpd transcript waves.shm *.wlf mylib lib *.vstf .restart* urgReport *.so vc_hdrs.h *.log *.fsdb *.key nWaveLog vfastLog *.conf  *.vcd

##
## For Regression and coverage merge
##
regression:
	# Run compilation
	make compile comp_args="$(comp_args)"
	# Run simualtion - regression 
	python regression_handling.py $(testlist_name)
	#	Merge coverage
	make merge_cov_report
		
merge_cov_report:
	# Merging all the coverage
	urg -report regressionReport -dir coverage.vdb -dir */*.vdb

	echo "";
	echo "-----------------------------------------------------------------";
	echo "Coverage report: firefox regressionReport/grp0.html &"
	echo "-----------------------------------------------------------------";
	echo "";

		
compile_war_err:
	echo "";
	echo "-----------------------------------------------------------------";
	echo "------------------- Compilation Report --------------------------";
	echo "";
	grep "^** " MasterVIPSlaveIPCompile.log;
	echo "";
	grep "^Error" MasterVIPSlaveIPCompile.log;
	echo "";
	echo "Log file path: MasterVIPSlaveIPCompile.log"
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
	echo "Waveform: verdi -ssf novas.fsdb"
	echo "";
	echo "Coverage: firefox $(test_folder)/grp0.html &"
	echo "-----------------------------------------------------------------";
	echo "-----------------------------------------------------------------";
	echo "";
