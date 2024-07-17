# proj_name passed as an arg
set proj_name [lindex $argv 0]
# have separate variables for better clarity
set outputDir ./

create_project -force $proj_name $outputDir
set_property BOARD_PART [get_boards cora-z7-07s] [current_project]





