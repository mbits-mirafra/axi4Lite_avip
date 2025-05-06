# Get destination folder name from argument 
# $srgv keyword for command line argument
cp -r VIPSlaveRTLMaster $argv

sed -i "s/VIPSlaveRTLMaster/$argv/g" "$argv/sim/questasim/makefile"
sed -i "s/VIPSlaveRTLMaster/$argv/g" "$argv/sim/project.f"

rm -rf "$argv/rtl/MasterRTL.v"
sed -i "s/MasterRTL.v/<RTLFileName.v>/g" "$argv/sim/project.f"
