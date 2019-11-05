
########## Tcl recorder starts at 12/11/18 12:48:51 ##########

set version "2.0"
set proj_dir "D:/projektTestowy"
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
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine1.vhd -o statemachine1.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/vhd2jhd\" clk_prescaler.vhd -o clk_prescaler.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/11/18 12:48:51 ###########


########## Tcl recorder starts at 12/11/18 12:48:55 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open stateMachine1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: testprj.sty
PROJECT: stateMachine1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine1
VHDL_FILE_LIST: clk_prescaler.vhd statemachine1.vhd
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
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine1.edi -out stateMachine1.bl0 -err automake.err -log stateMachine1.log -prj testprj -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/11/18 12:48:55 ###########


########## Tcl recorder starts at 12/11/18 12:49:35 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" clk_prescaler.vhd -o clk_prescaler.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/11/18 12:49:35 ###########


########## Tcl recorder starts at 12/11/18 12:49:39 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open stateMachine1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: testprj.sty
PROJECT: stateMachine1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine1
VHDL_FILE_LIST: clk_prescaler.vhd statemachine1.vhd
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
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine1.edi -out stateMachine1.bl0 -err automake.err -log stateMachine1.log -prj testprj -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/11/18 12:49:39 ###########


########## Tcl recorder starts at 12/11/18 12:55:56 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine1.vhd -o statemachine1.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/11/18 12:55:56 ###########


########## Tcl recorder starts at 12/11/18 12:56:13 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine1.vhd -o statemachine1.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/11/18 12:56:13 ###########


########## Tcl recorder starts at 12/11/18 12:56:16 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open stateMachine1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: testprj.sty
PROJECT: stateMachine1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine1
VHDL_FILE_LIST: clk_prescaler.vhd statemachine1.vhd
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
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine1.edi -out stateMachine1.bl0 -err automake.err -log stateMachine1.log -prj testprj -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/11/18 12:56:16 ###########


########## Tcl recorder starts at 12/11/18 13:04:22 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine1.vhd -o statemachine1.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/11/18 13:04:22 ###########


########## Tcl recorder starts at 12/11/18 13:04:26 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine1.vhd -o statemachine1.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/11/18 13:04:26 ###########


########## Tcl recorder starts at 12/11/18 13:04:32 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open stateMachine1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: testprj.sty
PROJECT: stateMachine1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine1
VHDL_FILE_LIST: clk_prescaler.vhd statemachine1.vhd
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
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine1.edi -out stateMachine1.bl0 -err automake.err -log stateMachine1.log -prj testprj -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/11/18 13:04:32 ###########


########## Tcl recorder starts at 12/11/18 13:05:38 ##########

# Commands to make the Process: 
# Constraint Editor
if [runCmd "\"$cpld_bin/mblifopt\" stateMachine1.bl0 -collapse none -reduce none -keepwires  -err automake.err -family"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"stateMachine1.bl1\" -o \"testprj.bl2\" -omod \"testprj\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj testprj -lci testprj.lct -log testprj.imp -err automake.err -tti testprj.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci testprj.lct -blifopt  testprj.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" testprj.bl2 -sweep -mergefb -err automake.err -o testprj.bl3  @testprj.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci testprj.lct -dev mach4a -diofft  testprj.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" testprj.bl3 -pla -family AMDMACH -idev van -o testprj.tt2 -oxrf testprj.xrf -err automake.err  @testprj.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj testprj -dir $proj_dir -log testprj.log -tti testprj.tt2 -tto testprj.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci testprj.lct -dev mach4a -prefit  testprj.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp testprj.tt3 -out testprj.tt4 -err automake.err -log testprj.log -percent testprj.tte -mod stateMachine1  @testprj.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
# Application to view the Process: 
# Constraint Editor
if [catch {open lattice_cmd.rs2 w} rspFile] {
	puts stderr "Cannot create response file lattice_cmd.rs2: $rspFile"
} else {
	puts $rspFile "-src testprj.tt4 -type PLA -devfile \"$install_dir/ispcpld/dat/mach4a/mach463ace.dev\" -lci \"testprj.lct\" -touch \"testprj.tt4\"
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/lciedit\" @lattice_cmd.rs2"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/11/18 13:05:38 ###########


########## Tcl recorder starts at 12/11/18 13:08:15 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/blif2eqn\" testprj.tte -o testprj.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci testprj.lct -out testprj.vct -log testprj.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open testprj.rsp w} rspFile] {
	puts stderr "Cannot create response file testprj.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"testprj.tt4\" -vci \"testprj.vct\" -log \"testprj.log\" -eqn \"testprj.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"NoInput.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@testprj.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete testprj.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci testprj.vco -out testprj.lco -log testprj.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj testprj -if testprj.jed -j2s -log testprj.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/11/18 13:08:15 ###########


########## Tcl recorder starts at 12/11/18 13:13:24 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine1.vhd -o statemachine1.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/11/18 13:13:24 ###########


########## Tcl recorder starts at 12/11/18 13:14:15 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" statemachine1.vhd -o statemachine1.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/11/18 13:14:15 ###########


########## Tcl recorder starts at 12/11/18 13:14:18 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open stateMachine1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: testprj.sty
PROJECT: stateMachine1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine1
VHDL_FILE_LIST: clk_prescaler.vhd statemachine1.vhd
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
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine1.edi -out stateMachine1.bl0 -err automake.err -log stateMachine1.log -prj testprj -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/11/18 13:14:18 ###########


########## Tcl recorder starts at 12/11/18 13:14:58 ##########

# Commands to make the Process: 
# Constraint Editor
if [runCmd "\"$cpld_bin/mblifopt\" stateMachine1.bl0 -collapse none -reduce none -keepwires  -err automake.err -family"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"stateMachine1.bl1\" -o \"testprj.bl2\" -omod \"testprj\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj testprj -lci testprj.lct -log testprj.imp -err automake.err -tti testprj.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci testprj.lct -blifopt  testprj.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" testprj.bl2 -sweep -mergefb -err automake.err -o testprj.bl3  @testprj.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci testprj.lct -dev mach4a -diofft  testprj.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" testprj.bl3 -pla -family AMDMACH -idev van -o testprj.tt2 -oxrf testprj.xrf -err automake.err  @testprj.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj testprj -dir $proj_dir -log testprj.log -tti testprj.tt2 -tto testprj.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci testprj.lct -dev mach4a -prefit  testprj.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp testprj.tt3 -out testprj.tt4 -err automake.err -log testprj.log -percent testprj.tte -mod stateMachine1  @testprj.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
# Application to view the Process: 
# Constraint Editor
if [catch {open lattice_cmd.rs2 w} rspFile] {
	puts stderr "Cannot create response file lattice_cmd.rs2: $rspFile"
} else {
	puts $rspFile "-src testprj.tt4 -type PLA -devfile \"$install_dir/ispcpld/dat/mach4a/mach463ace.dev\" -lci \"testprj.lct\" -touch \"testprj.tt4\"
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/lciedit\" @lattice_cmd.rs2"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/11/18 13:14:58 ###########


########## Tcl recorder starts at 12/11/18 13:15:28 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/blif2eqn\" testprj.tte -o testprj.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci testprj.lct -out testprj.vct -log testprj.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open testprj.rsp w} rspFile] {
	puts stderr "Cannot create response file testprj.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"testprj.tt4\" -vci \"testprj.vct\" -log \"testprj.log\" -eqn \"testprj.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"NoInput.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@testprj.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete testprj.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci testprj.vco -out testprj.lco -log testprj.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj testprj -if testprj.jed -j2s -log testprj.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/11/18 13:15:28 ###########

