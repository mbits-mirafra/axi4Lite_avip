onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /MasterVIPSlaveIPHdlTop/masterVIPSlaveIPInterface/axi4LiteMasterInterface/axi4LiteMasterReadInterface/aclk
add wave -noupdate /MasterVIPSlaveIPHdlTop/masterVIPSlaveIPInterface/axi4LiteMasterInterface/axi4LiteMasterReadInterface/aresetn
add wave -noupdate /MasterVIPSlaveIPHdlTop/masterVIPSlaveIPInterface/axi4LiteMasterInterface/axi4LiteMasterReadInterface/arvalid
add wave -noupdate /MasterVIPSlaveIPHdlTop/masterVIPSlaveIPInterface/axi4LiteMasterInterface/axi4LiteMasterReadInterface/arready
add wave -noupdate /MasterVIPSlaveIPHdlTop/masterVIPSlaveIPInterface/axi4LiteMasterInterface/axi4LiteMasterReadInterface/araddr
add wave -noupdate /MasterVIPSlaveIPHdlTop/masterVIPSlaveIPInterface/axi4LiteMasterInterface/axi4LiteMasterReadInterface/arprot
add wave -noupdate /MasterVIPSlaveIPHdlTop/masterVIPSlaveIPInterface/axi4LiteMasterInterface/axi4LiteMasterReadInterface/rvalid
add wave -noupdate /MasterVIPSlaveIPHdlTop/masterVIPSlaveIPInterface/axi4LiteMasterInterface/axi4LiteMasterReadInterface/rready
add wave -noupdate /MasterVIPSlaveIPHdlTop/masterVIPSlaveIPInterface/axi4LiteMasterInterface/axi4LiteMasterReadInterface/rdata
add wave -noupdate /MasterVIPSlaveIPHdlTop/masterVIPSlaveIPInterface/axi4LiteMasterInterface/axi4LiteMasterReadInterface/rresp
add wave -noupdate /MasterVIPSlaveIPHdlTop/slaveRTL/read_outstanding_count
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {991 ns}
