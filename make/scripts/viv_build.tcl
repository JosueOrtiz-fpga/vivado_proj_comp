# proj_name passed as an arg
set proj_name [lindex $argv 0]
# have separate variables for better clarity
set outputDir ./

create_project -force $proj_name $outputDir
set_property board_part digilentinc.com:cora-z7-07s:part0:1.1 [current_project]
# import the hdl files
set src_path "../../top/$proj_name/src/"
add_files -fileset sources_1 [ glob $src_path/*.v $src_path/*.vhd $src_path/*.sv]
# recreate any block design .tcl scripts
set bd_path "$src_path/bd/"
foreach bd [glob $bd_path/*.tcl] {
    source $bd
}
# import the constraint files
set xdc_path "../../top/$proj_name/xdc/"
add_files -fileset constrs_1  [ glob $xdc_path/*.xdc]
# update the compile order
update_compile_order
# launch the runs
launch_runs synth_1
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream
wait_on_run impl_1




