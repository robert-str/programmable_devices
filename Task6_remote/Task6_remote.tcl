
########## Tcl recorder starts at 11/12/20 11:11:31 ##########

set version "2.0"
set proj_dir "C:/ispLever_prj/programmable_devices/Task6_remote"
cd $proj_dir

# Get directory paths
set pver $version
regsub -all {\.} $pver {_} pver
set lscfile "lsc_"
append lscfile $pver ".ini"
set lsvini_dir [lindex [array get env LSC_INI_PATH] 1]
set lsvini_path [file join $lsvini_dir $lscfile]
if {[catch {set fid [open $lsvini_path]} msg]} {
	 puts "File Open Error: $lsvini_path"
	 return false
} else {set data [read $fid]; close $fid }
foreach line [split $data '\n'] { 
	set lline [string tolower $line]
	set lline [string trim $lline]
	if {[string compare $lline "\[paths\]"] == 0} { set path 1; continue}
	if {$path && [regexp {^\[} $lline]} {set path 0; break}
	if {$path && [regexp {^bin} $lline]} {set cpld_bin $line; continue}
	if {$path && [regexp {^fpgapath} $lline]} {set fpga_dir $line; continue}
	if {$path && [regexp {^fpgabinpath} $lline]} {set fpga_bin $line}}

set cpld_bin [string range $cpld_bin [expr [string first "=" $cpld_bin]+1] end]
regsub -all "\"" $cpld_bin "" cpld_bin
set cpld_bin [file join $cpld_bin]
set install_dir [string range $cpld_bin 0 [expr [string first "ispcpld" $cpld_bin]-2]]
regsub -all "\"" $install_dir "" install_dir
set install_dir [file join $install_dir]
set fpga_dir [string range $fpga_dir [expr [string first "=" $fpga_dir]+1] end]
regsub -all "\"" $fpga_dir "" fpga_dir
set fpga_dir [file join $fpga_dir]
set fpga_bin [string range $fpga_bin [expr [string first "=" $fpga_bin]+1] end]
regsub -all "\"" $fpga_bin "" fpga_bin
set fpga_bin [file join $fpga_bin]

if {[string match "*$fpga_bin;*" $env(PATH)] == 0 } {
   set env(PATH) "$fpga_bin;$env(PATH)" }

if {[string match "*$cpld_bin;*" $env(PATH)] == 0 } {
   set env(PATH) "$cpld_bin;$env(PATH)" }

lappend auto_path [file join $install_dir "ispcpld" "tcltk" "lib" "ispwidget" "runproc"]
package require runcmd

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:11:31 ###########


########## Tcl recorder starts at 11/12/20 11:13:53 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:13:53 ###########


########## Tcl recorder starts at 11/12/20 11:15:02 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:15:02 ###########


########## Tcl recorder starts at 11/12/20 11:15:07 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open stateMachine1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task6_remote.sty
PROJECT: stateMachine1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine1
VHDL_FILE_LIST: statemachine.vhd
OUTPUT_FILE_NAME: stateMachine1
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e stateMachine1 -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete stateMachine1.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine1.edi -out stateMachine1.bl0 -err automake.err -log stateMachine1.log -prj task6_remote -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:15:07 ###########


########## Tcl recorder starts at 11/12/20 11:19:14 ##########

# Commands to make the Process: 
# VHDL Test Bench Template
if [runCmd "\"$cpld_bin/vhd2naf\" -tfi -proj task6_remote -mod stateMachine1 -out stateMachine1 -tpl \"$install_dir/ispcpld/generic/vhdl/testbnch.tft\" -ext vht statemachine.vhd"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:19:14 ###########


########## Tcl recorder starts at 11/12/20 11:21:43 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
if [catch {open udo.rsp w} rspFile] {
	puts stderr "Cannot create response file udo.rsp: $rspFile"
} else {
	puts $rspFile "# ispDesignExpert VHDL Functional Simulation Template: tb_statemachine_vhdaf.udo.
# You may edit this file to control your simulation.
# You may specify your design unit.
# You may specify your waveforms.
add wave *
# You may specify your simulation run time.
run 1000 ns
"
	close $rspFile
}
if [catch {open tb_statemachine.rsp w} rspFile] {
	puts stderr "Cannot create response file tb_statemachine.rsp: $rspFile"
} else {
	puts $rspFile "#simulator Aldec
#insert # NOTE: Do not edit this file.
#insert # Auto generated by VHDL Functional Simulation Models
#insert #
#insert design create work .
#insert design open work
#insert adel -all
#path
#insert source {$cpld_bin/chipsim_cmd.tcl}
#prjInfo task6_remote.sty
#do 
#vcomSrc  statemachine.vhd
#vcom tb_statemachine.vhd
#stimulus vhdl stateMachine1 tb_statemachine.vhd
#insert vsim +access +r %<StimModule>%
#youdo tb_statemachine_vhdaf.udo
#insert # End
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" tb_statemachine.rsp tb_statemachine.fado udo.rsp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete udo.rsp
file delete tb_statemachine.rsp
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_statemachine_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_statemachine_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_statemachine.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_statemachine_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:21:43 ###########


########## Tcl recorder starts at 11/12/20 11:24:46 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
if [catch {open udo.rsp w} rspFile] {
	puts stderr "Cannot create response file udo.rsp: $rspFile"
} else {
	puts $rspFile "# ispDesignExpert VHDL Functional Simulation Template: tb_statemachine_vhdaf.udo.
# You may edit this file to control your simulation.
# You may specify your design unit.
# You may specify your waveforms.
add wave *
# You may specify your simulation run time.
run 1000 ns
"
	close $rspFile
}
if [catch {open tb_statemachine.rsp w} rspFile] {
	puts stderr "Cannot create response file tb_statemachine.rsp: $rspFile"
} else {
	puts $rspFile "#simulator Aldec
#insert # NOTE: Do not edit this file.
#insert # Auto generated by VHDL Functional Simulation Models
#insert #
#insert design create work .
#insert design open work
#insert adel -all
#path
#insert source {$cpld_bin/chipsim_cmd.tcl}
#prjInfo task6_remote.sty
#do 
#vcomSrc  statemachine.vhd
#vcom tb_statemachine.vhd
#stimulus vhdl stateMachine1 tb_statemachine.vhd
#insert vsim +access +r %<StimModule>%
#youdo tb_statemachine_vhdaf.udo
#insert # End
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" tb_statemachine.rsp tb_statemachine.fado udo.rsp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete udo.rsp
file delete tb_statemachine.rsp
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_statemachine_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_statemachine_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_statemachine.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_statemachine_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:24:46 ###########


########## Tcl recorder starts at 11/12/20 11:27:57 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:27:57 ###########


########## Tcl recorder starts at 11/12/20 11:28:20 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:28:20 ###########


########## Tcl recorder starts at 11/12/20 11:29:01 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:29:01 ###########


########## Tcl recorder starts at 11/12/20 11:29:12 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:29:12 ###########


########## Tcl recorder starts at 11/12/20 11:29:32 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:29:32 ###########


########## Tcl recorder starts at 11/12/20 11:30:39 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:30:39 ###########


########## Tcl recorder starts at 11/12/20 11:30:51 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:30:51 ###########


########## Tcl recorder starts at 11/12/20 11:31:21 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:31:21 ###########


########## Tcl recorder starts at 11/12/20 11:31:31 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:31:31 ###########


########## Tcl recorder starts at 11/12/20 11:31:33 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open stateMachine1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task6_remote.sty
PROJECT: stateMachine1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine1
VHDL_FILE_LIST: statemachine.vhd
OUTPUT_FILE_NAME: stateMachine1
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e stateMachine1 -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete stateMachine1.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine1.edi -out stateMachine1.bl0 -err automake.err -log stateMachine1.log -prj task6_remote -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:31:33 ###########


########## Tcl recorder starts at 11/12/20 11:31:55 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:31:55 ###########


########## Tcl recorder starts at 11/12/20 11:32:00 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open stateMachine1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task6_remote.sty
PROJECT: stateMachine1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine1
VHDL_FILE_LIST: statemachine.vhd
OUTPUT_FILE_NAME: stateMachine1
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e stateMachine1 -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete stateMachine1.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine1.edi -out stateMachine1.bl0 -err automake.err -log stateMachine1.log -prj task6_remote -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:32:00 ###########


########## Tcl recorder starts at 11/12/20 11:32:21 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:32:21 ###########


########## Tcl recorder starts at 11/12/20 11:32:34 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open stateMachine1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task6_remote.sty
PROJECT: stateMachine1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine1
VHDL_FILE_LIST: statemachine.vhd
OUTPUT_FILE_NAME: stateMachine1
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e stateMachine1 -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete stateMachine1.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine1.edi -out stateMachine1.bl0 -err automake.err -log stateMachine1.log -prj task6_remote -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:32:34 ###########


########## Tcl recorder starts at 11/12/20 11:33:43 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:33:43 ###########


########## Tcl recorder starts at 11/12/20 11:33:51 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:33:51 ###########


########## Tcl recorder starts at 11/12/20 11:33:54 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open stateMachine1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task6_remote.sty
PROJECT: stateMachine1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine1
VHDL_FILE_LIST: statemachine.vhd
OUTPUT_FILE_NAME: stateMachine1
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e stateMachine1 -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete stateMachine1.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine1.edi -out stateMachine1.bl0 -err automake.err -log stateMachine1.log -prj task6_remote -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:33:54 ###########


########## Tcl recorder starts at 11/12/20 11:34:08 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:34:08 ###########


########## Tcl recorder starts at 11/12/20 11:34:08 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open stateMachine1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task6_remote.sty
PROJECT: stateMachine1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine1
VHDL_FILE_LIST: statemachine.vhd
OUTPUT_FILE_NAME: stateMachine1
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e stateMachine1 -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete stateMachine1.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine1.edi -out stateMachine1.bl0 -err automake.err -log stateMachine1.log -prj task6_remote -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:34:08 ###########


########## Tcl recorder starts at 11/12/20 11:34:28 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:34:28 ###########


########## Tcl recorder starts at 11/12/20 11:34:32 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open stateMachine1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task6_remote.sty
PROJECT: stateMachine1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine1
VHDL_FILE_LIST: statemachine.vhd
OUTPUT_FILE_NAME: stateMachine1
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e stateMachine1 -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete stateMachine1.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine1.edi -out stateMachine1.bl0 -err automake.err -log stateMachine1.log -prj task6_remote -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:34:32 ###########


########## Tcl recorder starts at 11/12/20 11:36:14 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
if [catch {open udo.rsp w} rspFile] {
	puts stderr "Cannot create response file udo.rsp: $rspFile"
} else {
	puts $rspFile "# ispDesignExpert VHDL Functional Simulation Template: tb_statemachine_vhdaf.udo.
# You may edit this file to control your simulation.
# You may specify your design unit.
# You may specify your waveforms.
add wave *
# You may specify your simulation run time.
run 1000 ns
"
	close $rspFile
}
if [catch {open tb_statemachine.rsp w} rspFile] {
	puts stderr "Cannot create response file tb_statemachine.rsp: $rspFile"
} else {
	puts $rspFile "#simulator Aldec
#insert # NOTE: Do not edit this file.
#insert # Auto generated by VHDL Functional Simulation Models
#insert #
#insert design create work .
#insert design open work
#insert adel -all
#path
#insert source {$cpld_bin/chipsim_cmd.tcl}
#prjInfo task6_remote.sty
#do 
#vcomSrc  statemachine.vhd
#vcom tb_statemachine.vhd
#stimulus vhdl stateMachine1 tb_statemachine.vhd
#insert vsim +access +r %<StimModule>%
#youdo tb_statemachine_vhdaf.udo
#insert # End
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" tb_statemachine.rsp tb_statemachine.fado udo.rsp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete udo.rsp
file delete tb_statemachine.rsp
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_statemachine_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_statemachine_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_statemachine.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_statemachine_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:36:14 ###########


########## Tcl recorder starts at 11/12/20 11:36:59 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:36:59 ###########


########## Tcl recorder starts at 11/12/20 11:37:17 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:37:17 ###########


########## Tcl recorder starts at 11/12/20 11:37:19 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:37:19 ###########


########## Tcl recorder starts at 11/12/20 11:37:27 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
# - none -
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_statemachine_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_statemachine_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_statemachine.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_statemachine_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:37:27 ###########


########## Tcl recorder starts at 11/12/20 11:38:20 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:38:20 ###########


########## Tcl recorder starts at 11/12/20 11:38:25 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:38:25 ###########


########## Tcl recorder starts at 11/12/20 11:38:38 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:38:38 ###########


########## Tcl recorder starts at 11/12/20 11:38:41 ##########

# Commands to make the Process: 
# Synplify Synthesize VHDL File
if [catch {open stateMachine1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task6_remote.sty
PROJECT: stateMachine1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine1
VHDL_FILE_LIST: statemachine.vhd
OUTPUT_FILE_NAME: stateMachine1
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e stateMachine1 -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete stateMachine1.cmd

########## Tcl recorder end at 11/12/20 11:38:41 ###########


########## Tcl recorder starts at 11/12/20 11:39:35 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:39:35 ###########


########## Tcl recorder starts at 11/12/20 11:39:52 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:39:52 ###########


########## Tcl recorder starts at 11/12/20 11:40:00 ##########

# Commands to make the Process: 
# Synplify Synthesize VHDL File
if [catch {open stateMachine1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task6_remote.sty
PROJECT: stateMachine1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine1
VHDL_FILE_LIST: statemachine.vhd
OUTPUT_FILE_NAME: stateMachine1
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e stateMachine1 -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete stateMachine1.cmd

########## Tcl recorder end at 11/12/20 11:40:00 ###########


########## Tcl recorder starts at 11/12/20 11:40:06 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open stateMachine1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task6_remote.sty
PROJECT: stateMachine1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine1
VHDL_FILE_LIST: statemachine.vhd
OUTPUT_FILE_NAME: stateMachine1
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e stateMachine1 -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete stateMachine1.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine1.edi -out stateMachine1.bl0 -err automake.err -log stateMachine1.log -prj task6_remote -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:40:06 ###########


########## Tcl recorder starts at 11/12/20 11:48:03 ##########

# Commands to make the Process: 
# VHDL Test Bench Template
if [runCmd "\"$cpld_bin/vhd2naf\" -tfi -proj task6_remote -mod stateMachine1 -out stateMachine1 -tpl \"$install_dir/ispcpld/generic/vhdl/testbnch.tft\" -ext vht statemachine.vhd"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:48:03 ###########


########## Tcl recorder starts at 11/12/20 11:48:11 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
# - none -
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_statemachine_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_statemachine_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_statemachine.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_statemachine_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:48:11 ###########


########## Tcl recorder starts at 11/12/20 11:49:04 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:49:04 ###########


########## Tcl recorder starts at 11/12/20 11:49:33 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
# - none -
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_statemachine_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_statemachine_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_statemachine.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_statemachine_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:49:33 ###########


########## Tcl recorder starts at 11/12/20 11:50:28 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:50:28 ###########


########## Tcl recorder starts at 11/12/20 11:52:13 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" stateMachineP1.vhd -o stateMachineP1.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:52:13 ###########


########## Tcl recorder starts at 11/12/20 11:52:37 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" stateMachineP1.vhd -o stateMachineP1.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:52:37 ###########


########## Tcl recorder starts at 11/12/20 11:53:49 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" stateMachineP1.vhd -o stateMachineP1.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:53:49 ###########


########## Tcl recorder starts at 11/12/20 11:53:53 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
if [catch {open udo.rsp w} rspFile] {
	puts stderr "Cannot create response file udo.rsp: $rspFile"
} else {
	puts $rspFile "# ispDesignExpert VHDL Functional Simulation Template: tb_statemachineP1_vhdaf.udo.
# You may edit this file to control your simulation.
# You may specify your design unit.
# You may specify your waveforms.
add wave *
# You may specify your simulation run time.
run 1000 ns
"
	close $rspFile
}
if [catch {open tb_statemachineP1.rsp w} rspFile] {
	puts stderr "Cannot create response file tb_statemachineP1.rsp: $rspFile"
} else {
	puts $rspFile "#simulator Aldec
#insert # NOTE: Do not edit this file.
#insert # Auto generated by VHDL Functional Simulation Models
#insert #
#insert design create work .
#insert design open work
#insert adel -all
#path
#insert source {$cpld_bin/chipsim_cmd.tcl}
#prjInfo task6_remote.sty
#do 
#vcomSrc  stateMachineP1.vhd
#vcom tb_statemachineP1.vhd
#stimulus vhdl stateMachineP1 tb_statemachineP1.vhd
#insert vsim +access +r %<StimModule>%
#youdo tb_statemachineP1_vhdaf.udo
#insert # End
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" tb_statemachineP1.rsp tb_statemachineP1.fado udo.rsp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete udo.rsp
file delete tb_statemachineP1.rsp
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_statemachineP1_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_statemachineP1_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_statemachineP1.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_statemachineP1_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:53:53 ###########


########## Tcl recorder starts at 11/12/20 11:54:26 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
# - none -
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_statemachineP1_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_statemachineP1_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_statemachineP1.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_statemachineP1_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:54:26 ###########


########## Tcl recorder starts at 11/12/20 11:54:40 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
# - none -
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_statemachineP1_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_statemachineP1_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_statemachineP1.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_statemachineP1_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:54:40 ###########


########## Tcl recorder starts at 11/12/20 11:55:03 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
if [catch {open udo.rsp w} rspFile] {
	puts stderr "Cannot create response file udo.rsp: $rspFile"
} else {
	puts $rspFile "# ispDesignExpert VHDL Functional Simulation Template: tb_statemachineP1_vhdaf.udo.
# You may edit this file to control your simulation.
# You may specify your design unit.
# You may specify your waveforms.
add wave *
# You may specify your simulation run time.
run 1000 ns
"
	close $rspFile
}
if [catch {open tb_statemachineP1.rsp w} rspFile] {
	puts stderr "Cannot create response file tb_statemachineP1.rsp: $rspFile"
} else {
	puts $rspFile "#simulator Aldec
#insert # NOTE: Do not edit this file.
#insert # Auto generated by VHDL Functional Simulation Models
#insert #
#insert design create work .
#insert design open work
#insert adel -all
#path
#insert source {$cpld_bin/chipsim_cmd.tcl}
#prjInfo task6_remote.sty
#do 
#vcomSrc  stateMachineP1.vhd
#vcom tb_statemachineP1.vhd
#stimulus vhdl stateMachineP1 tb_statemachineP1.vhd
#insert vsim +access +r %<StimModule>%
#youdo tb_statemachineP1_vhdaf.udo
#insert # End
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" tb_statemachineP1.rsp tb_statemachineP1.fado udo.rsp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete udo.rsp
file delete tb_statemachineP1.rsp
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_statemachineP1_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_statemachineP1_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_statemachineP1.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_statemachineP1_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:55:03 ###########


########## Tcl recorder starts at 11/12/20 11:55:41 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
if [catch {open udo.rsp w} rspFile] {
	puts stderr "Cannot create response file udo.rsp: $rspFile"
} else {
	puts $rspFile "# ispDesignExpert VHDL Functional Simulation Template: tb_statemachineP1_vhdaf.udo.
# You may edit this file to control your simulation.
# You may specify your design unit.
# You may specify your waveforms.
add wave *
# You may specify your simulation run time.
run 1000 ns
"
	close $rspFile
}
if [catch {open tb_statemachineP1.rsp w} rspFile] {
	puts stderr "Cannot create response file tb_statemachineP1.rsp: $rspFile"
} else {
	puts $rspFile "#simulator Aldec
#insert # NOTE: Do not edit this file.
#insert # Auto generated by VHDL Functional Simulation Models
#insert #
#insert design create work .
#insert design open work
#insert adel -all
#path
#insert source {$cpld_bin/chipsim_cmd.tcl}
#prjInfo task6_remote.sty
#do 
#vcomSrc  stateMachineP1.vhd
#vcom tb_statemachineP1.vhd
#stimulus vhdl stateMachineP1 tb_statemachineP1.vhd
#insert vsim +access +r %<StimModule>%
#youdo tb_statemachineP1_vhdaf.udo
#insert # End
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" tb_statemachineP1.rsp tb_statemachineP1.fado udo.rsp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete udo.rsp
file delete tb_statemachineP1.rsp
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_statemachineP1_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_statemachineP1_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_statemachineP1.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_statemachineP1_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:55:41 ###########


########## Tcl recorder starts at 11/12/20 11:56:51 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" stateMachineP1.vhd -o stateMachineP1.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:56:51 ###########


########## Tcl recorder starts at 11/12/20 11:56:53 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open stateMachineP1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachineP1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task6_remote.sty
PROJECT: stateMachineP1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachineP1
VHDL_FILE_LIST: stateMachineP1.vhd
OUTPUT_FILE_NAME: stateMachineP1
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e stateMachineP1 -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete stateMachineP1.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachineP1.edi -out stateMachineP1.bl0 -err automake.err -log stateMachineP1.log -prj task6_remote -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:56:53 ###########


########## Tcl recorder starts at 11/12/20 11:57:20 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
if [catch {open udo.rsp w} rspFile] {
	puts stderr "Cannot create response file udo.rsp: $rspFile"
} else {
	puts $rspFile "# ispDesignExpert VHDL Functional Simulation Template: tb_statemachineP1_vhdaf.udo.
# You may edit this file to control your simulation.
# You may specify your design unit.
# You may specify your waveforms.
add wave *
# You may specify your simulation run time.
run 1000 ns
"
	close $rspFile
}
if [catch {open tb_statemachineP1.rsp w} rspFile] {
	puts stderr "Cannot create response file tb_statemachineP1.rsp: $rspFile"
} else {
	puts $rspFile "#simulator Aldec
#insert # NOTE: Do not edit this file.
#insert # Auto generated by VHDL Functional Simulation Models
#insert #
#insert design create work .
#insert design open work
#insert adel -all
#path
#insert source {$cpld_bin/chipsim_cmd.tcl}
#prjInfo task6_remote.sty
#do 
#vcomSrc  stateMachineP1.vhd
#vcom tb_statemachineP1.vhd
#stimulus vhdl stateMachineP1 tb_statemachineP1.vhd
#insert vsim +access +r %<StimModule>%
#youdo tb_statemachineP1_vhdaf.udo
#insert # End
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" tb_statemachineP1.rsp tb_statemachineP1.fado udo.rsp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete udo.rsp
file delete tb_statemachineP1.rsp
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_statemachineP1_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_statemachineP1_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_statemachineP1.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_statemachineP1_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:57:20 ###########


########## Tcl recorder starts at 11/12/20 11:57:44 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" stateMachineP1.vhd -o stateMachineP1.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:57:44 ###########


########## Tcl recorder starts at 11/12/20 11:57:46 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
# - none -
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_statemachineP1_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_statemachineP1_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_statemachineP1.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_statemachineP1_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:57:46 ###########


########## Tcl recorder starts at 11/12/20 11:59:25 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
# - none -
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_statemachineP1_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_statemachineP1_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_statemachineP1.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_statemachineP1_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 11:59:25 ###########


########## Tcl recorder starts at 11/12/20 12:02:20 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" stateMachineP1.vhd -o stateMachineP1.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 12:02:20 ###########


########## Tcl recorder starts at 11/12/20 12:02:23 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open stateMachineP1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachineP1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task6_remote.sty
PROJECT: stateMachineP1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachineP1
VHDL_FILE_LIST: stateMachineP1.vhd
OUTPUT_FILE_NAME: stateMachineP1
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e stateMachineP1 -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete stateMachineP1.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachineP1.edi -out stateMachineP1.bl0 -err automake.err -log stateMachineP1.log -prj task6_remote -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 12:02:23 ###########


########## Tcl recorder starts at 11/12/20 12:02:46 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" stateMachineP1.vhd -o stateMachineP1.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 12:02:46 ###########


########## Tcl recorder starts at 11/12/20 12:02:48 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open stateMachineP1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachineP1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task6_remote.sty
PROJECT: stateMachineP1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachineP1
VHDL_FILE_LIST: stateMachineP1.vhd
OUTPUT_FILE_NAME: stateMachineP1
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e stateMachineP1 -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete stateMachineP1.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachineP1.edi -out stateMachineP1.bl0 -err automake.err -log stateMachineP1.log -prj task6_remote -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 12:02:48 ###########


########## Tcl recorder starts at 11/12/20 12:03:15 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" stateMachineP1.vhd -o stateMachineP1.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 12:03:15 ###########


########## Tcl recorder starts at 11/12/20 12:03:19 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open stateMachineP1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachineP1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task6_remote.sty
PROJECT: stateMachineP1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachineP1
VHDL_FILE_LIST: stateMachineP1.vhd
OUTPUT_FILE_NAME: stateMachineP1
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e stateMachineP1 -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete stateMachineP1.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachineP1.edi -out stateMachineP1.bl0 -err automake.err -log stateMachineP1.log -prj task6_remote -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 12:03:19 ###########


########## Tcl recorder starts at 11/12/20 12:04:24 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
if [catch {open udo.rsp w} rspFile] {
	puts stderr "Cannot create response file udo.rsp: $rspFile"
} else {
	puts $rspFile "# ispDesignExpert VHDL Functional Simulation Template: tb_statemachineP1_vhdaf.udo.
# You may edit this file to control your simulation.
# You may specify your design unit.
# You may specify your waveforms.
add wave *
# You may specify your simulation run time.
run 1000 ns
"
	close $rspFile
}
if [catch {open tb_statemachineP1.rsp w} rspFile] {
	puts stderr "Cannot create response file tb_statemachineP1.rsp: $rspFile"
} else {
	puts $rspFile "#simulator Aldec
#insert # NOTE: Do not edit this file.
#insert # Auto generated by VHDL Functional Simulation Models
#insert #
#insert design create work .
#insert design open work
#insert adel -all
#path
#insert source {$cpld_bin/chipsim_cmd.tcl}
#prjInfo task6_remote.sty
#do 
#vcomSrc  stateMachineP1.vhd
#vcom tb_statemachineP1.vhd
#stimulus vhdl stateMachineP1 tb_statemachineP1.vhd
#insert vsim +access +r %<StimModule>%
#youdo tb_statemachineP1_vhdaf.udo
#insert # End
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" tb_statemachineP1.rsp tb_statemachineP1.fado udo.rsp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete udo.rsp
file delete tb_statemachineP1.rsp
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_statemachineP1_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_statemachineP1_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_statemachineP1.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_statemachineP1_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 12:04:24 ###########


########## Tcl recorder starts at 11/12/20 12:05:12 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" stateMachineP1.vhd -o stateMachineP1.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 12:05:12 ###########


########## Tcl recorder starts at 11/12/20 12:05:20 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open stateMachineP1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachineP1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task6_remote.sty
PROJECT: stateMachineP1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachineP1
VHDL_FILE_LIST: stateMachineP1.vhd
OUTPUT_FILE_NAME: stateMachineP1
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e stateMachineP1 -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete stateMachineP1.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachineP1.edi -out stateMachineP1.bl0 -err automake.err -log stateMachineP1.log -prj task6_remote -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 12:05:20 ###########


########## Tcl recorder starts at 11/12/20 12:05:33 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
# - none -
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_statemachineP1_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_statemachineP1_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_statemachineP1.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_statemachineP1_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 12:05:33 ###########


########## Tcl recorder starts at 11/12/20 12:07:40 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" stateMachineP1.vhd -o stateMachineP1.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 12:07:40 ###########


########## Tcl recorder starts at 11/12/20 12:07:53 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" stateMachineP1.vhd -o stateMachineP1.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 12:07:53 ###########


########## Tcl recorder starts at 11/12/20 12:07:57 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
# - none -
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_statemachineP1_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_statemachineP1_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_statemachineP1.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_statemachineP1_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 12:07:57 ###########


########## Tcl recorder starts at 11/12/20 12:08:30 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open stateMachineP1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachineP1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task6_remote.sty
PROJECT: stateMachineP1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachineP1
VHDL_FILE_LIST: stateMachineP1.vhd
OUTPUT_FILE_NAME: stateMachineP1
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e stateMachineP1 -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete stateMachineP1.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachineP1.edi -out stateMachineP1.bl0 -err automake.err -log stateMachineP1.log -prj task6_remote -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 12:08:30 ###########


########## Tcl recorder starts at 11/12/20 12:09:47 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
# - none -
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_statemachineP1_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_statemachineP1_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_statemachineP1.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_statemachineP1_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 12:09:47 ###########


########## Tcl recorder starts at 11/12/20 12:11:29 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 12:11:29 ###########


########## Tcl recorder starts at 11/12/20 12:11:37 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open stateMachine.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task6_remote.sty
PROJECT: stateMachine
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine
VHDL_FILE_LIST: statemachine.vhd
OUTPUT_FILE_NAME: stateMachine
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e stateMachine -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete stateMachine.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine.edi -out stateMachine.bl0 -err automake.err -log stateMachine.log -prj task6_remote -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 12:11:37 ###########


########## Tcl recorder starts at 11/12/20 12:16:37 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 12:16:37 ###########


########## Tcl recorder starts at 11/12/20 12:16:40 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open stateMachine.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task6_remote.sty
PROJECT: stateMachine
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine
VHDL_FILE_LIST: statemachine.vhd
OUTPUT_FILE_NAME: stateMachine
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e stateMachine -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete stateMachine.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine.edi -out stateMachine.bl0 -err automake.err -log stateMachine.log -prj task6_remote -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 12:16:40 ###########


########## Tcl recorder starts at 11/12/20 12:17:09 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 12:17:09 ###########


########## Tcl recorder starts at 11/12/20 12:17:11 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open stateMachine.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task6_remote.sty
PROJECT: stateMachine
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine
VHDL_FILE_LIST: statemachine.vhd
OUTPUT_FILE_NAME: stateMachine
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e stateMachine -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete stateMachine.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine.edi -out stateMachine.bl0 -err automake.err -log stateMachine.log -prj task6_remote -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 12:17:11 ###########


########## Tcl recorder starts at 11/12/20 12:28:54 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
# - none -
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_statemachine_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_statemachine_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_statemachine.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_statemachine_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 12:28:54 ###########


########## Tcl recorder starts at 11/12/20 12:31:20 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 12:31:20 ###########


########## Tcl recorder starts at 11/12/20 12:31:26 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 12:31:26 ###########


########## Tcl recorder starts at 11/12/20 12:31:32 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
# - none -
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_statemachine_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_statemachine_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_statemachine.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_statemachine_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 12:31:32 ###########


########## Tcl recorder starts at 11/12/20 12:32:20 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 12:32:20 ###########


########## Tcl recorder starts at 11/12/20 12:32:24 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
# - none -
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_statemachine_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_statemachine_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_statemachine.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_statemachine_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 12:32:24 ###########


########## Tcl recorder starts at 11/12/20 12:33:10 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 12:33:10 ###########


########## Tcl recorder starts at 11/12/20 12:33:34 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open stateMachine.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task6_remote.sty
PROJECT: stateMachine
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine
VHDL_FILE_LIST: statemachine.vhd
OUTPUT_FILE_NAME: stateMachine
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e stateMachine -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete stateMachine.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine.edi -out stateMachine.bl0 -err automake.err -log stateMachine.log -prj task6_remote -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 12:33:34 ###########


########## Tcl recorder starts at 11/12/20 12:34:20 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 12:34:20 ###########


########## Tcl recorder starts at 11/12/20 12:34:25 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open stateMachine.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task6_remote.sty
PROJECT: stateMachine
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine
VHDL_FILE_LIST: statemachine.vhd
OUTPUT_FILE_NAME: stateMachine
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e stateMachine -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete stateMachine.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine.edi -out stateMachine.bl0 -err automake.err -log stateMachine.log -prj task6_remote -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 12:34:25 ###########


########## Tcl recorder starts at 11/12/20 12:39:39 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
# - none -
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_statemachine_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_statemachine_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_statemachine.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_statemachine_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 12:39:39 ###########


########## Tcl recorder starts at 11/12/20 12:40:59 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 12:40:59 ###########


########## Tcl recorder starts at 11/12/20 12:41:02 ##########

# Commands to make the Process: 
# Synplify Synthesize VHDL File
if [catch {open stateMachine.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task6_remote.sty
PROJECT: stateMachine
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine
VHDL_FILE_LIST: statemachine.vhd
OUTPUT_FILE_NAME: stateMachine
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e stateMachine -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete stateMachine.cmd

########## Tcl recorder end at 11/12/20 12:41:02 ###########


########## Tcl recorder starts at 11/12/20 12:41:07 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open stateMachine.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task6_remote.sty
PROJECT: stateMachine
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine
VHDL_FILE_LIST: statemachine.vhd
OUTPUT_FILE_NAME: stateMachine
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e stateMachine -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete stateMachine.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine.edi -out stateMachine.bl0 -err automake.err -log stateMachine.log -prj task6_remote -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 12:41:07 ###########


########## Tcl recorder starts at 11/12/20 12:45:46 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 12:45:46 ###########


########## Tcl recorder starts at 11/12/20 12:46:00 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open stateMachine.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task6_remote.sty
PROJECT: stateMachine
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine
VHDL_FILE_LIST: statemachine.vhd
OUTPUT_FILE_NAME: stateMachine
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e stateMachine -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete stateMachine.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine.edi -out stateMachine.bl0 -err automake.err -log stateMachine.log -prj task6_remote -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 12:46:00 ###########


########## Tcl recorder starts at 11/12/20 12:46:16 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
# - none -
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_statemachine_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_statemachine_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_statemachine.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_statemachine_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 12:46:16 ###########


########## Tcl recorder starts at 11/12/20 12:49:05 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 12:49:05 ###########


########## Tcl recorder starts at 11/12/20 12:49:30 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 12:49:30 ###########


########## Tcl recorder starts at 11/12/20 12:49:52 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 12:49:52 ###########


########## Tcl recorder starts at 11/12/20 12:50:06 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open stateMachine.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task6_remote.sty
PROJECT: stateMachine
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine
VHDL_FILE_LIST: statemachine.vhd
OUTPUT_FILE_NAME: stateMachine
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e stateMachine -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete stateMachine.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine.edi -out stateMachine.bl0 -err automake.err -log stateMachine.log -prj task6_remote -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 12:50:06 ###########


########## Tcl recorder starts at 11/12/20 12:58:00 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
# - none -
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_statemachine_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_statemachine_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_statemachine.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_statemachine_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 12:58:00 ###########


########## Tcl recorder starts at 11/12/20 12:59:10 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 12:59:10 ###########


########## Tcl recorder starts at 11/12/20 12:59:56 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" stateMachineP1.vhd -o stateMachineP1.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 12:59:56 ###########


########## Tcl recorder starts at 11/12/20 12:59:58 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
# - none -
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_statemachine_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_statemachine_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_statemachine.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_statemachine_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 12:59:58 ###########


########## Tcl recorder starts at 11/12/20 13:08:41 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
# - none -
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_statemachine_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_statemachine_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_statemachine.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_statemachine_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 13:08:41 ###########


########## Tcl recorder starts at 11/12/20 13:09:03 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
# - none -
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_statemachineP1_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_statemachineP1_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_statemachineP1.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_statemachineP1_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 13:09:03 ###########


########## Tcl recorder starts at 11/12/20 13:10:06 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 13:10:06 ###########


########## Tcl recorder starts at 11/12/20 13:10:16 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 13:10:16 ###########


########## Tcl recorder starts at 11/12/20 13:10:32 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 13:10:32 ###########


########## Tcl recorder starts at 11/12/20 13:10:46 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 13:10:46 ###########


########## Tcl recorder starts at 11/12/20 13:11:01 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 13:11:01 ###########


########## Tcl recorder starts at 11/12/20 13:11:15 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 13:11:15 ###########


########## Tcl recorder starts at 11/12/20 13:11:19 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 13:11:19 ###########


########## Tcl recorder starts at 11/12/20 13:11:59 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 13:11:59 ###########


########## Tcl recorder starts at 11/12/20 13:12:10 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 13:12:10 ###########


########## Tcl recorder starts at 11/12/20 13:12:16 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 13:12:16 ###########


########## Tcl recorder starts at 11/12/20 13:12:41 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 13:12:41 ###########


########## Tcl recorder starts at 11/12/20 13:13:13 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 13:13:13 ###########


########## Tcl recorder starts at 11/12/20 13:13:23 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 13:13:23 ###########


########## Tcl recorder starts at 11/12/20 13:13:36 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open stateMachine.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task6_remote.sty
PROJECT: stateMachine
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine
VHDL_FILE_LIST: statemachine.vhd
OUTPUT_FILE_NAME: stateMachine
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e stateMachine -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete stateMachine.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine.edi -out stateMachine.bl0 -err automake.err -log stateMachine.log -prj task6_remote -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 13:13:36 ###########


########## Tcl recorder starts at 11/12/20 13:18:02 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 13:18:02 ###########


########## Tcl recorder starts at 11/12/20 13:18:06 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open stateMachine.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task6_remote.sty
PROJECT: stateMachine
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine
VHDL_FILE_LIST: statemachine.vhd
OUTPUT_FILE_NAME: stateMachine
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e stateMachine -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete stateMachine.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine.edi -out stateMachine.bl0 -err automake.err -log stateMachine.log -prj task6_remote -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 13:18:06 ###########


########## Tcl recorder starts at 11/12/20 13:18:36 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 13:18:36 ###########


########## Tcl recorder starts at 11/12/20 13:18:38 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open stateMachine.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task6_remote.sty
PROJECT: stateMachine
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine
VHDL_FILE_LIST: statemachine.vhd
OUTPUT_FILE_NAME: stateMachine
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e stateMachine -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete stateMachine.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine.edi -out stateMachine.bl0 -err automake.err -log stateMachine.log -prj task6_remote -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 13:18:38 ###########


########## Tcl recorder starts at 11/12/20 13:21:27 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
# - none -
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_statemachine_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_statemachine_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_statemachine.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_statemachine_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 13:21:27 ###########


########## Tcl recorder starts at 11/12/20 13:37:40 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 13:37:40 ###########


########## Tcl recorder starts at 11/12/20 13:37:50 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open stateMachine.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task6_remote.sty
PROJECT: stateMachine
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine
VHDL_FILE_LIST: statemachine.vhd
OUTPUT_FILE_NAME: stateMachine
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e stateMachine -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete stateMachine.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine.edi -out stateMachine.bl0 -err automake.err -log stateMachine.log -prj task6_remote -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 13:37:50 ###########


########## Tcl recorder starts at 11/12/20 13:43:10 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
# - none -
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_statemachine_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_statemachine_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_statemachine.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_statemachine_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 13:43:10 ###########


########## Tcl recorder starts at 11/12/20 13:56:50 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 13:56:50 ###########


########## Tcl recorder starts at 11/12/20 13:56:53 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open stateMachine.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task6_remote.sty
PROJECT: stateMachine
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine
VHDL_FILE_LIST: statemachine.vhd
OUTPUT_FILE_NAME: stateMachine
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e stateMachine -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete stateMachine.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine.edi -out stateMachine.bl0 -err automake.err -log stateMachine.log -prj task6_remote -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 13:56:53 ###########


########## Tcl recorder starts at 11/12/20 13:58:23 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 13:58:23 ###########


########## Tcl recorder starts at 11/12/20 13:58:55 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 13:58:55 ###########


########## Tcl recorder starts at 11/12/20 13:58:58 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open stateMachine.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task6_remote.sty
PROJECT: stateMachine
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine
VHDL_FILE_LIST: statemachine.vhd
OUTPUT_FILE_NAME: stateMachine
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e stateMachine -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete stateMachine.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine.edi -out stateMachine.bl0 -err automake.err -log stateMachine.log -prj task6_remote -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 13:58:58 ###########


########## Tcl recorder starts at 11/12/20 13:59:16 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
# - none -
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_statemachine_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_statemachine_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_statemachine.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_statemachine_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 13:59:16 ###########


########## Tcl recorder starts at 11/12/20 13:59:58 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 13:59:58 ###########


########## Tcl recorder starts at 11/12/20 14:00:01 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
# - none -
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_statemachine_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_statemachine_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_statemachine.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_statemachine_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 14:00:01 ###########


########## Tcl recorder starts at 11/12/20 14:00:31 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
# - none -
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_statemachine_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_statemachine_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_statemachine.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_statemachine_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 14:00:31 ###########


########## Tcl recorder starts at 11/12/20 14:01:00 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 14:01:00 ###########


########## Tcl recorder starts at 11/12/20 14:01:57 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
if [catch {open udo.rsp w} rspFile] {
	puts stderr "Cannot create response file udo.rsp: $rspFile"
} else {
	puts $rspFile "# ispDesignExpert VHDL Functional Simulation Template: tb_statemachine_vhdaf.udo.
# You may edit this file to control your simulation.
# You may specify your design unit.
# You may specify your waveforms.
add wave *
# You may specify your simulation run time.
run 1000 ns
"
	close $rspFile
}
if [catch {open tb_statemachine.rsp w} rspFile] {
	puts stderr "Cannot create response file tb_statemachine.rsp: $rspFile"
} else {
	puts $rspFile "#simulator Aldec
#insert # NOTE: Do not edit this file.
#insert # Auto generated by VHDL Functional Simulation Models
#insert #
#insert design create work .
#insert design open work
#insert adel -all
#path
#insert source {$cpld_bin/chipsim_cmd.tcl}
#prjInfo task6_remote.sty
#do 
#vcomSrc  statemachine.vhd
#vcom tb_statemachine.vhd
#stimulus vhdl stateMachine tb_statemachine.vhd
#insert vsim +access +r %<StimModule>%
#youdo tb_statemachine_vhdaf.udo
#insert # End
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" tb_statemachine.rsp tb_statemachine.fado udo.rsp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete udo.rsp
file delete tb_statemachine.rsp
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_statemachine_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_statemachine_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_statemachine.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_statemachine_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 14:01:57 ###########


########## Tcl recorder starts at 11/12/20 14:02:58 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 14:02:58 ###########


########## Tcl recorder starts at 11/12/20 14:03:00 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
# - none -
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_statemachine_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_statemachine_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_statemachine.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_statemachine_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 14:03:00 ###########


########## Tcl recorder starts at 11/12/20 14:04:13 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 14:04:13 ###########


########## Tcl recorder starts at 11/12/20 14:04:17 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
if [catch {open udo.rsp w} rspFile] {
	puts stderr "Cannot create response file udo.rsp: $rspFile"
} else {
	puts $rspFile "# ispDesignExpert VHDL Functional Simulation Template: tb_statemachine_vhdaf.udo.
# You may edit this file to control your simulation.
# You may specify your design unit.
# You may specify your waveforms.
add wave *
# You may specify your simulation run time.
run 1000 ns
"
	close $rspFile
}
if [catch {open tb_statemachine.rsp w} rspFile] {
	puts stderr "Cannot create response file tb_statemachine.rsp: $rspFile"
} else {
	puts $rspFile "#simulator Aldec
#insert # NOTE: Do not edit this file.
#insert # Auto generated by VHDL Functional Simulation Models
#insert #
#insert design create work .
#insert design open work
#insert adel -all
#path
#insert source {$cpld_bin/chipsim_cmd.tcl}
#prjInfo task6_remote.sty
#do 
#vcomSrc  statemachine.vhd
#vcom tb_statemachine.vhd
#stimulus vhdl stateMachine tb_statemachine.vhd
#insert vsim +access +r %<StimModule>%
#youdo tb_statemachine_vhdaf.udo
#insert # End
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" tb_statemachine.rsp tb_statemachine.fado udo.rsp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete udo.rsp
file delete tb_statemachine.rsp
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_statemachine_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_statemachine_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_statemachine.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_statemachine_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 14:04:17 ###########


########## Tcl recorder starts at 11/12/20 14:05:29 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 14:05:29 ###########


########## Tcl recorder starts at 11/12/20 14:06:19 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 14:06:19 ###########


########## Tcl recorder starts at 11/12/20 14:06:25 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open stateMachine.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task6_remote.sty
PROJECT: stateMachine
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine
VHDL_FILE_LIST: statemachine.vhd
OUTPUT_FILE_NAME: stateMachine
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e stateMachine -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete stateMachine.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine.edi -out stateMachine.bl0 -err automake.err -log stateMachine.log -prj task6_remote -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 14:06:25 ###########


########## Tcl recorder starts at 11/12/20 14:06:41 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
# - none -
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_statemachine_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_statemachine_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_statemachine.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_statemachine_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 14:06:41 ###########


########## Tcl recorder starts at 11/12/20 14:08:07 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
# - none -
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_statemachine_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_statemachine_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_statemachine.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_statemachine_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 14:08:07 ###########


########## Tcl recorder starts at 11/12/20 14:09:28 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 14:09:28 ###########


########## Tcl recorder starts at 11/12/20 14:09:50 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
# - none -
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_statemachine_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_statemachine_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_statemachine.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_statemachine_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 14:09:50 ###########


########## Tcl recorder starts at 11/12/20 14:11:32 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 14:11:32 ###########


########## Tcl recorder starts at 11/12/20 14:11:34 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
# - none -
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_statemachine_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_statemachine_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_statemachine.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_statemachine_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 14:11:34 ###########


########## Tcl recorder starts at 11/12/20 14:12:30 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 14:12:30 ###########


########## Tcl recorder starts at 11/12/20 14:14:22 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 14:14:22 ###########


########## Tcl recorder starts at 11/12/20 14:15:00 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 14:15:00 ###########


########## Tcl recorder starts at 11/12/20 14:15:02 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open stateMachine.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task6_remote.sty
PROJECT: stateMachine
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine
VHDL_FILE_LIST: statemachine.vhd
OUTPUT_FILE_NAME: stateMachine
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e stateMachine -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete stateMachine.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine.edi -out stateMachine.bl0 -err automake.err -log stateMachine.log -prj task6_remote -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 14:15:02 ###########


########## Tcl recorder starts at 11/12/20 14:45:52 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 14:45:52 ###########


########## Tcl recorder starts at 11/12/20 14:45:54 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open stateMachine.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task6_remote.sty
PROJECT: stateMachine
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine
VHDL_FILE_LIST: statemachine.vhd
OUTPUT_FILE_NAME: stateMachine
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e stateMachine -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete stateMachine.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine.edi -out stateMachine.bl0 -err automake.err -log stateMachine.log -prj task6_remote -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 14:45:54 ###########


########## Tcl recorder starts at 11/12/20 14:46:32 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 14:46:32 ###########


########## Tcl recorder starts at 11/12/20 14:46:35 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open stateMachine.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task6_remote.sty
PROJECT: stateMachine
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine
VHDL_FILE_LIST: statemachine.vhd
OUTPUT_FILE_NAME: stateMachine
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e stateMachine -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete stateMachine.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine.edi -out stateMachine.bl0 -err automake.err -log stateMachine.log -prj task6_remote -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 14:46:35 ###########


########## Tcl recorder starts at 11/12/20 14:46:51 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
# - none -
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_statemachine_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_statemachine_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_statemachine.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_statemachine_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 14:46:51 ###########


########## Tcl recorder starts at 11/12/20 14:47:54 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 14:47:54 ###########


########## Tcl recorder starts at 11/12/20 14:49:37 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 14:49:37 ###########


########## Tcl recorder starts at 11/12/20 14:49:47 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 14:49:47 ###########


########## Tcl recorder starts at 11/12/20 14:49:49 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open stateMachine.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task6_remote.sty
PROJECT: stateMachine
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine
VHDL_FILE_LIST: statemachine.vhd
OUTPUT_FILE_NAME: stateMachine
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e stateMachine -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete stateMachine.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine.edi -out stateMachine.bl0 -err automake.err -log stateMachine.log -prj task6_remote -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 14:49:49 ###########


########## Tcl recorder starts at 11/12/20 14:50:11 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
# - none -
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_statemachine_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_statemachine_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_statemachine.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_statemachine_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 14:50:11 ###########


########## Tcl recorder starts at 11/12/20 14:51:09 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 14:51:09 ###########


########## Tcl recorder starts at 11/12/20 14:51:14 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
# - none -
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_statemachine_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_statemachine_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_statemachine.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_statemachine_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 14:51:14 ###########


########## Tcl recorder starts at 11/12/20 14:51:52 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
# - none -
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_statemachine_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_statemachine_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_statemachine.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_statemachine_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 14:51:52 ###########


########## Tcl recorder starts at 11/12/20 14:52:17 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 14:52:17 ###########


########## Tcl recorder starts at 11/12/20 14:52:21 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
# - none -
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_statemachine_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_statemachine_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_statemachine.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_statemachine_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 14:52:21 ###########


########## Tcl recorder starts at 11/12/20 14:53:19 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 14:53:19 ###########


########## Tcl recorder starts at 11/12/20 14:54:43 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 14:54:43 ###########


########## Tcl recorder starts at 11/12/20 14:54:53 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open stateMachine.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task6_remote.sty
PROJECT: stateMachine
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine
VHDL_FILE_LIST: statemachine.vhd
OUTPUT_FILE_NAME: stateMachine
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e stateMachine -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete stateMachine.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine.edi -out stateMachine.bl0 -err automake.err -log stateMachine.log -prj task6_remote -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 14:54:53 ###########


########## Tcl recorder starts at 11/12/20 14:55:19 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 14:55:19 ###########


########## Tcl recorder starts at 11/12/20 14:55:21 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open stateMachine.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task6_remote.sty
PROJECT: stateMachine
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine
VHDL_FILE_LIST: statemachine.vhd
OUTPUT_FILE_NAME: stateMachine
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e stateMachine -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete stateMachine.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine.edi -out stateMachine.bl0 -err automake.err -log stateMachine.log -prj task6_remote -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 14:55:21 ###########


########## Tcl recorder starts at 11/12/20 14:55:45 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 14:55:45 ###########


########## Tcl recorder starts at 11/12/20 14:55:47 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open stateMachine.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task6_remote.sty
PROJECT: stateMachine
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine
VHDL_FILE_LIST: statemachine.vhd
OUTPUT_FILE_NAME: stateMachine
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e stateMachine -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete stateMachine.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine.edi -out stateMachine.bl0 -err automake.err -log stateMachine.log -prj task6_remote -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 14:55:47 ###########


########## Tcl recorder starts at 11/12/20 14:56:03 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
if [catch {open udo.rsp w} rspFile] {
	puts stderr "Cannot create response file udo.rsp: $rspFile"
} else {
	puts $rspFile "# ispDesignExpert VHDL Functional Simulation Template: tb_statemachine_vhdaf.udo.
# You may edit this file to control your simulation.
# You may specify your design unit.
# You may specify your waveforms.
add wave *
# You may specify your simulation run time.
run 1000 ns
"
	close $rspFile
}
if [catch {open tb_statemachine.rsp w} rspFile] {
	puts stderr "Cannot create response file tb_statemachine.rsp: $rspFile"
} else {
	puts $rspFile "#simulator Aldec
#insert # NOTE: Do not edit this file.
#insert # Auto generated by VHDL Functional Simulation Models
#insert #
#insert design create work .
#insert design open work
#insert adel -all
#path
#insert source {$cpld_bin/chipsim_cmd.tcl}
#prjInfo task6_remote.sty
#do 
#vcomSrc  statemachine.vhd
#vcom tb_statemachine.vhd
#stimulus vhdl stateMachine tb_statemachine.vhd
#insert vsim +access +r %<StimModule>%
#youdo tb_statemachine_vhdaf.udo
#insert # End
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" tb_statemachine.rsp tb_statemachine.fado udo.rsp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete udo.rsp
file delete tb_statemachine.rsp
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_statemachine_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_statemachine_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_statemachine.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_statemachine_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 14:56:03 ###########


########## Tcl recorder starts at 11/12/20 14:56:34 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
if [catch {open udo.rsp w} rspFile] {
	puts stderr "Cannot create response file udo.rsp: $rspFile"
} else {
	puts $rspFile "# ispDesignExpert VHDL Functional Simulation Template: tb_statemachine_vhdaf.udo.
# You may edit this file to control your simulation.
# You may specify your design unit.
# You may specify your waveforms.
add wave *
# You may specify your simulation run time.
run 1000 ns
"
	close $rspFile
}
if [catch {open tb_statemachine.rsp w} rspFile] {
	puts stderr "Cannot create response file tb_statemachine.rsp: $rspFile"
} else {
	puts $rspFile "#simulator Aldec
#insert # NOTE: Do not edit this file.
#insert # Auto generated by VHDL Functional Simulation Models
#insert #
#insert design create work .
#insert design open work
#insert adel -all
#path
#insert source {$cpld_bin/chipsim_cmd.tcl}
#prjInfo task6_remote.sty
#do 
#vcomSrc  statemachine.vhd
#vcom tb_statemachine.vhd
#stimulus vhdl stateMachine tb_statemachine.vhd
#insert vsim +access +r %<StimModule>%
#youdo tb_statemachine_vhdaf.udo
#insert # End
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" tb_statemachine.rsp tb_statemachine.fado udo.rsp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete udo.rsp
file delete tb_statemachine.rsp
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_statemachine_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_statemachine_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_statemachine.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_statemachine_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 14:56:34 ###########


########## Tcl recorder starts at 11/12/20 14:58:03 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 14:58:03 ###########


########## Tcl recorder starts at 11/12/20 14:58:07 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine.vhd -o statemachine.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 14:58:07 ###########


########## Tcl recorder starts at 11/12/20 14:58:11 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
# - none -
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_statemachine_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_statemachine_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_statemachine.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_statemachine_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 14:58:11 ###########


########## Tcl recorder starts at 11/12/20 14:58:25 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
# - none -
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_statemachine_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_statemachine_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_statemachine.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_statemachine_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 14:58:25 ###########


########## Tcl recorder starts at 11/12/20 15:01:25 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine_initialcode.vhd -o statemachine_initialcode.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 15:01:25 ###########


########## Tcl recorder starts at 11/12/20 15:01:41 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine_initialcode.vhd -o statemachine_initialcode.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 15:01:41 ###########


########## Tcl recorder starts at 11/12/20 15:01:45 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open stateMachineP1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachineP1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task6_remote.sty
PROJECT: stateMachineP1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachineP1
VHDL_FILE_LIST: stateMachineP1.vhd
OUTPUT_FILE_NAME: stateMachineP1
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e stateMachineP1 -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete stateMachineP1.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachineP1.edi -out stateMachineP1.bl0 -err automake.err -log stateMachineP1.log -prj task6_remote -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 15:01:45 ###########


########## Tcl recorder starts at 11/12/20 15:01:53 ##########

# Commands to make the Process: 
# VHDL Test Bench Template
if [runCmd "\"$cpld_bin/vhd2naf\" -tfi -proj task6_remote -mod stateMachineInit -out stateMachineInit -tpl \"$install_dir/ispcpld/generic/vhdl/testbnch.tft\" -ext vht statemachine_initialcode.vhd"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 15:01:53 ###########


########## Tcl recorder starts at 11/12/20 15:02:27 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
if [catch {open udo.rsp w} rspFile] {
	puts stderr "Cannot create response file udo.rsp: $rspFile"
} else {
	puts $rspFile "# ispDesignExpert VHDL Functional Simulation Template: tb_statemachineinit_vhdaf.udo.
# You may edit this file to control your simulation.
# You may specify your design unit.
# You may specify your waveforms.
add wave *
# You may specify your simulation run time.
run 1000 ns
"
	close $rspFile
}
if [catch {open tb_statemachineinit.rsp w} rspFile] {
	puts stderr "Cannot create response file tb_statemachineinit.rsp: $rspFile"
} else {
	puts $rspFile "#simulator Aldec
#insert # NOTE: Do not edit this file.
#insert # Auto generated by VHDL Functional Simulation Models
#insert #
#insert design create work .
#insert design open work
#insert adel -all
#path
#insert source {$cpld_bin/chipsim_cmd.tcl}
#prjInfo task6_remote.sty
#do 
#vcomSrc  statemachine_initialcode.vhd
#vcom tb_statemachineinit.vhd
#stimulus vhdl stateMachineInit tb_statemachineinit.vhd
#insert vsim +access +r %<StimModule>%
#youdo tb_statemachineinit_vhdaf.udo
#insert # End
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" tb_statemachineinit.rsp tb_statemachineinit.fado udo.rsp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete udo.rsp
file delete tb_statemachineinit.rsp
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_statemachineinit_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_statemachineinit_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_statemachineinit.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_statemachineinit_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 15:02:27 ###########


########## Tcl recorder starts at 11/12/20 15:03:01 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
if [catch {open udo.rsp w} rspFile] {
	puts stderr "Cannot create response file udo.rsp: $rspFile"
} else {
	puts $rspFile "# ispDesignExpert VHDL Functional Simulation Template: tb_statemachineinit_vhdaf.udo.
# You may edit this file to control your simulation.
# You may specify your design unit.
# You may specify your waveforms.
add wave *
# You may specify your simulation run time.
run 1000 ns
"
	close $rspFile
}
if [catch {open tb_statemachineinit.rsp w} rspFile] {
	puts stderr "Cannot create response file tb_statemachineinit.rsp: $rspFile"
} else {
	puts $rspFile "#simulator Aldec
#insert # NOTE: Do not edit this file.
#insert # Auto generated by VHDL Functional Simulation Models
#insert #
#insert design create work .
#insert design open work
#insert adel -all
#path
#insert source {$cpld_bin/chipsim_cmd.tcl}
#prjInfo task6_remote.sty
#do 
#vcomSrc  statemachine_initialcode.vhd
#vcom tb_statemachineinit.vhd
#stimulus vhdl stateMachineInit tb_statemachineinit.vhd
#insert vsim +access +r %<StimModule>%
#youdo tb_statemachineinit_vhdaf.udo
#insert # End
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" tb_statemachineinit.rsp tb_statemachineinit.fado udo.rsp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete udo.rsp
file delete tb_statemachineinit.rsp
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_statemachineinit_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_statemachineinit_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_statemachineinit.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_statemachineinit_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 15:03:01 ###########

