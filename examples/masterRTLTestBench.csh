# Get destination folder name from argument 
# $srgv keyword for command line argument
cp -r VIPSlaveRTLMasterExample1 $argv

sed -i "s/VIPSlaveRTLMasterExample1/$argv/g" "$argv/sim/questasim/makefile"
sed -i "s/VIPSlaveRTLMasterExample1/$argv/g" "$argv/sim/project.f"

rm -rf "$argv/rtl/MasterRTL.v"
sed -i "s/MasterRTL.v/<RTLFileName.v>/g" "$argv/sim/project.f"
