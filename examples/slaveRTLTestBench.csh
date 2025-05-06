# Get destination folder name from argument 
# $srgv keyword for command line argument
cp -r VIPMasterRTLSlave $argv

sed -i "s/VIPMasterRTLSlave/$argv/g" "$argv/sim/questasim/makefile"
sed -i "s/VIPMasterRTLSlave/$argv/g" "$argv/sim/project.f"

rm -rf "$argv/rtl/slaveRTL.v"
sed -i "s/slaveRTL.v/<RTLFileName.v>/g" "$argv/sim/project.f"
