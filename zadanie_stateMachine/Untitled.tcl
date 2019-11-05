
########## Tcl recorder starts at 11/29/18 14:59:36 ##########

set version "2.0"
set proj_dir "C:/Dydaktyka/UkladyProgramowalne/zadanie_stateMachine"
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
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 14:59:36 ###########


########## Tcl recorder starts at 11/29/18 15:00:16 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 15:00:16 ###########


########## Tcl recorder starts at 11/29/18 15:03:52 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 15:03:52 ###########


########## Tcl recorder starts at 11/29/18 15:05:14 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 15:05:14 ###########


########## Tcl recorder starts at 11/29/18 15:05:45 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 15:05:45 ###########


########## Tcl recorder starts at 11/29/18 15:05:56 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 15:05:56 ###########


########## Tcl recorder starts at 11/29/18 15:06:11 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 15:06:11 ###########


########## Tcl recorder starts at 11/29/18 15:08:04 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 15:08:04 ###########


########## Tcl recorder starts at 11/29/18 15:08:36 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 15:08:36 ###########


########## Tcl recorder starts at 11/29/18 15:09:12 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 15:09:12 ###########


########## Tcl recorder starts at 11/29/18 15:09:21 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 15:09:21 ###########


########## Tcl recorder starts at 11/29/18 15:10:19 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 15:10:19 ###########


########## Tcl recorder starts at 11/29/18 15:10:22 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 15:10:22 ###########


########## Tcl recorder starts at 11/29/18 15:10:33 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 15:10:33 ###########


########## Tcl recorder starts at 11/29/18 15:10:37 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 15:10:37 ###########


########## Tcl recorder starts at 11/29/18 15:10:44 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 15:10:44 ###########


########## Tcl recorder starts at 11/29/18 15:11:03 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 15:11:03 ###########


########## Tcl recorder starts at 11/29/18 15:11:18 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 15:11:18 ###########


########## Tcl recorder starts at 11/29/18 15:11:22 ##########

# Commands to make the Process: 
# Fit Design
if [catch {open stateMachine1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: untitled.sty
PROJECT: stateMachine1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine1
VHDL_FILE_LIST: machina.vhd
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
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine1.edi -out stateMachine1.bl0 -err automake.err -log stateMachine1.log -prj untitled -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" stateMachine1.bl0 -collapse none -reduce none -keepwires  -err automake.err -family"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"stateMachine1.bl1\" -o \"untitled.bl2\" -omod \"untitled\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj untitled -lci untitled.lct -log untitled.imp -err automake.err -tti untitled.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -blifopt  untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" untitled.bl2 -sweep -mergefb -err automake.err -o untitled.bl3  @untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -diofft  untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" untitled.bl3 -pla -family AMDMACH -idev van -o untitled.tt2 -oxrf untitled.xrf -err automake.err  @untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj untitled -dir $proj_dir -log untitled.log -tti untitled.tt2 -tto untitled.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -prefit  untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp untitled.tt3 -out untitled.tt4 -err automake.err -log untitled.log -percent untitled.tte -mod stateMachine1  @untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" untitled.tte -o untitled.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci untitled.lct -out untitled.vct -log untitled.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open untitled.rsp w} rspFile] {
	puts stderr "Cannot create response file untitled.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"untitled.tt4\" -vci \"untitled.vct\" -log \"untitled.log\" -eqn \"untitled.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"NoInput.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@untitled.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete untitled.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci untitled.vco -out untitled.lco -log untitled.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj untitled -if untitled.jed -j2s -log untitled.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 15:11:22 ###########


########## Tcl recorder starts at 11/29/18 15:12:04 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 15:12:04 ###########


########## Tcl recorder starts at 11/29/18 15:12:20 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 15:12:20 ###########


########## Tcl recorder starts at 11/29/18 15:12:40 ##########

# Commands to make the Process: 
# Fit Design
if [catch {open stateMachine1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: untitled.sty
PROJECT: stateMachine1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine1
VHDL_FILE_LIST: machina.vhd
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
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine1.edi -out stateMachine1.bl0 -err automake.err -log stateMachine1.log -prj untitled -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" stateMachine1.bl0 -collapse none -reduce none -keepwires  -err automake.err -family"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"stateMachine1.bl1\" -o \"untitled.bl2\" -omod \"untitled\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj untitled -lci untitled.lct -log untitled.imp -err automake.err -tti untitled.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -blifopt  untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" untitled.bl2 -sweep -mergefb -err automake.err -o untitled.bl3  @untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -diofft  untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" untitled.bl3 -pla -family AMDMACH -idev van -o untitled.tt2 -oxrf untitled.xrf -err automake.err  @untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj untitled -dir $proj_dir -log untitled.log -tti untitled.tt2 -tto untitled.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -prefit  untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp untitled.tt3 -out untitled.tt4 -err automake.err -log untitled.log -percent untitled.tte -mod stateMachine1  @untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" untitled.tte -o untitled.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci untitled.lct -out untitled.vct -log untitled.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open untitled.rsp w} rspFile] {
	puts stderr "Cannot create response file untitled.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"untitled.tt4\" -vci \"untitled.vct\" -log \"untitled.log\" -eqn \"untitled.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"NoInput.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@untitled.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete untitled.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci untitled.vco -out untitled.lco -log untitled.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj untitled -if untitled.jed -j2s -log untitled.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 15:12:40 ###########


########## Tcl recorder starts at 11/29/18 15:13:30 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 15:13:30 ###########


########## Tcl recorder starts at 11/29/18 15:13:33 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open stateMachine1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: untitled.sty
PROJECT: stateMachine1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine1
VHDL_FILE_LIST: machina.vhd
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
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine1.edi -out stateMachine1.bl0 -err automake.err -log stateMachine1.log -prj untitled -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 15:13:33 ###########


########## Tcl recorder starts at 11/29/18 15:14:11 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 15:14:11 ###########


########## Tcl recorder starts at 11/29/18 15:14:54 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 15:14:54 ###########


########## Tcl recorder starts at 11/29/18 15:16:56 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 15:16:56 ###########


########## Tcl recorder starts at 11/29/18 15:17:56 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 15:17:56 ###########


########## Tcl recorder starts at 11/29/18 15:18:28 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 15:18:28 ###########


########## Tcl recorder starts at 11/29/18 15:18:30 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open stateMachine1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: untitled.sty
PROJECT: stateMachine1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine1
VHDL_FILE_LIST: machina.vhd
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
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine1.edi -out stateMachine1.bl0 -err automake.err -log stateMachine1.log -prj untitled -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 15:18:30 ###########


########## Tcl recorder starts at 11/29/18 15:26:19 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 15:26:19 ###########


########## Tcl recorder starts at 11/29/18 15:26:23 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open stateMachine1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: untitled.sty
PROJECT: stateMachine1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine1
VHDL_FILE_LIST: machina.vhd
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
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine1.edi -out stateMachine1.bl0 -err automake.err -log stateMachine1.log -prj untitled -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 15:26:23 ###########


########## Tcl recorder starts at 11/29/18 15:26:57 ##########

# Commands to make the Process: 
# JEDEC File
if [runCmd "\"$cpld_bin/mblifopt\" stateMachine1.bl0 -collapse none -reduce none -keepwires  -err automake.err -family"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"stateMachine1.bl1\" -o \"untitled.bl2\" -omod \"untitled\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj untitled -lci untitled.lct -log untitled.imp -err automake.err -tti untitled.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -blifopt  untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" untitled.bl2 -sweep -mergefb -err automake.err -o untitled.bl3  @untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -diofft  untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" untitled.bl3 -pla -family AMDMACH -idev van -o untitled.tt2 -oxrf untitled.xrf -err automake.err  @untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj untitled -dir $proj_dir -log untitled.log -tti untitled.tt2 -tto untitled.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -prefit  untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp untitled.tt3 -out untitled.tt4 -err automake.err -log untitled.log -percent untitled.tte -mod stateMachine1  @untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" untitled.tte -o untitled.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci untitled.lct -out untitled.vct -log untitled.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open untitled.rsp w} rspFile] {
	puts stderr "Cannot create response file untitled.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"untitled.tt4\" -vci \"untitled.vct\" -log \"untitled.log\" -eqn \"untitled.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"NoInput.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@untitled.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete untitled.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci untitled.vco -out untitled.lco -log untitled.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj untitled -if untitled.jed -j2s -log untitled.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 15:26:57 ###########


########## Tcl recorder starts at 11/29/18 15:27:03 ##########

# Commands to make the Process: 
# Constraint Editor
# - none -
# Application to view the Process: 
# Constraint Editor
if [catch {open lattice_cmd.rs2 w} rspFile] {
	puts stderr "Cannot create response file lattice_cmd.rs2: $rspFile"
} else {
	puts $rspFile "-src untitled.tt4 -type PLA -devfile \"$install_dir/ispcpld/dat/mach4a/mach463ace.dev\" -lci \"untitled.lct\" -touch \"untitled.tt4\"
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

########## Tcl recorder end at 11/29/18 15:27:03 ###########


########## Tcl recorder starts at 11/29/18 15:27:34 ##########

# Commands to make the Process: 
# JEDEC File
if [runCmd "\"$cpld_bin/blif2eqn\" untitled.tte -o untitled.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci untitled.lct -out untitled.vct -log untitled.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open untitled.rsp w} rspFile] {
	puts stderr "Cannot create response file untitled.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"untitled.tt4\" -vci \"untitled.vct\" -log \"untitled.log\" -eqn \"untitled.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"NoInput.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@untitled.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete untitled.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci untitled.vco -out untitled.lco -log untitled.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj untitled -if untitled.jed -j2s -log untitled.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 15:27:34 ###########


########## Tcl recorder starts at 11/29/18 15:33:18 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 15:33:18 ###########


########## Tcl recorder starts at 11/29/18 15:33:39 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"F:/Politechnika/Dydaktyka/Uk³ady programowalne (3sem)/ispLEVER Projects/zadanie3/clk_prescaler.vhd\" -o clk_prescaler.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 15:33:39 ###########


########## Tcl recorder starts at 11/29/18 15:34:19 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 15:34:19 ###########


########## Tcl recorder starts at 11/29/18 15:35:01 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 15:35:01 ###########


########## Tcl recorder starts at 11/29/18 15:35:24 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 15:35:24 ###########


########## Tcl recorder starts at 11/29/18 15:35:27 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 15:35:27 ###########


########## Tcl recorder starts at 11/29/18 15:35:59 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open stateMachine1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: untitled.sty
PROJECT: stateMachine1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine1
VHDL_FILE_LIST: \"F:/Politechnika/Dydaktyka/Uk³ady programowalne (3sem)/ispLEVER Projects/zadanie3/clk_prescaler.vhd\" machina.vhd
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
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine1.edi -out stateMachine1.bl0 -err automake.err -log stateMachine1.log -prj untitled -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 15:35:59 ###########


########## Tcl recorder starts at 11/29/18 15:36:35 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 15:36:35 ###########


########## Tcl recorder starts at 11/29/18 15:36:40 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open stateMachine1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: untitled.sty
PROJECT: stateMachine1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine1
VHDL_FILE_LIST: \"F:/Politechnika/Dydaktyka/Uk³ady programowalne (3sem)/ispLEVER Projects/zadanie3/clk_prescaler.vhd\" machina.vhd
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
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine1.edi -out stateMachine1.bl0 -err automake.err -log stateMachine1.log -prj untitled -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 15:36:40 ###########


########## Tcl recorder starts at 11/29/18 15:37:15 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/mblifopt\" stateMachine1.bl0 -collapse none -reduce none -keepwires  -err automake.err -family"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"stateMachine1.bl1\" -o \"untitled.bl2\" -omod \"untitled\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj untitled -lci untitled.lct -log untitled.imp -err automake.err -tti untitled.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -blifopt  untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" untitled.bl2 -sweep -mergefb -err automake.err -o untitled.bl3  @untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -diofft  untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" untitled.bl3 -pla -family AMDMACH -idev van -o untitled.tt2 -oxrf untitled.xrf -err automake.err  @untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj untitled -dir $proj_dir -log untitled.log -tti untitled.tt2 -tto untitled.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -prefit  untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp untitled.tt3 -out untitled.tt4 -err automake.err -log untitled.log -percent untitled.tte -mod stateMachine1  @untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" untitled.tte -o untitled.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci untitled.lct -out untitled.vct -log untitled.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open untitled.rsp w} rspFile] {
	puts stderr "Cannot create response file untitled.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"untitled.tt4\" -vci \"untitled.vct\" -log \"untitled.log\" -eqn \"untitled.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"NoInput.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@untitled.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete untitled.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci untitled.vco -out untitled.lco -log untitled.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj untitled -if untitled.jed -j2s -log untitled.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 15:37:16 ###########


########## Tcl recorder starts at 11/29/18 15:37:30 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 15:37:30 ###########


########## Tcl recorder starts at 11/29/18 15:37:41 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 15:37:41 ###########


########## Tcl recorder starts at 11/29/18 15:38:20 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 15:38:20 ###########


########## Tcl recorder starts at 11/29/18 15:38:39 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 15:38:39 ###########


########## Tcl recorder starts at 11/29/18 15:38:55 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 15:38:55 ###########


########## Tcl recorder starts at 11/29/18 15:39:51 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 15:39:51 ###########


########## Tcl recorder starts at 11/29/18 15:40:12 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 15:40:12 ###########


########## Tcl recorder starts at 11/29/18 15:40:24 ##########

# Commands to make the Process: 
# Fit Design
if [catch {open stateMachine1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: untitled.sty
PROJECT: stateMachine1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine1
VHDL_FILE_LIST: \"F:/Politechnika/Dydaktyka/Uk³ady programowalne (3sem)/ispLEVER Projects/zadanie3/clk_prescaler.vhd\" machina.vhd
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
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine1.edi -out stateMachine1.bl0 -err automake.err -log stateMachine1.log -prj untitled -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" stateMachine1.bl0 -collapse none -reduce none -keepwires  -err automake.err -family"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"stateMachine1.bl1\" -o \"untitled.bl2\" -omod \"untitled\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj untitled -lci untitled.lct -log untitled.imp -err automake.err -tti untitled.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -blifopt  untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" untitled.bl2 -sweep -mergefb -err automake.err -o untitled.bl3  @untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -diofft  untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" untitled.bl3 -pla -family AMDMACH -idev van -o untitled.tt2 -oxrf untitled.xrf -err automake.err  @untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj untitled -dir $proj_dir -log untitled.log -tti untitled.tt2 -tto untitled.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -prefit  untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp untitled.tt3 -out untitled.tt4 -err automake.err -log untitled.log -percent untitled.tte -mod stateMachine1  @untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" untitled.tte -o untitled.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci untitled.lct -out untitled.vct -log untitled.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open untitled.rsp w} rspFile] {
	puts stderr "Cannot create response file untitled.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"untitled.tt4\" -vci \"untitled.vct\" -log \"untitled.log\" -eqn \"untitled.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"NoInput.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@untitled.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete untitled.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci untitled.vco -out untitled.lco -log untitled.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj untitled -if untitled.jed -j2s -log untitled.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 15:40:24 ###########


########## Tcl recorder starts at 11/29/18 15:41:21 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 15:41:21 ###########


########## Tcl recorder starts at 11/29/18 15:41:24 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open stateMachine1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: untitled.sty
PROJECT: stateMachine1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine1
VHDL_FILE_LIST: \"F:/Politechnika/Dydaktyka/Uk³ady programowalne (3sem)/ispLEVER Projects/zadanie3/clk_prescaler.vhd\" machina.vhd
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
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine1.edi -out stateMachine1.bl0 -err automake.err -log stateMachine1.log -prj untitled -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 15:41:24 ###########


########## Tcl recorder starts at 11/29/18 17:13:46 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"F:/Politechnika/Dydaktyka/Uk³ady programowalne (3sem)/ispLEVER Projects/zadanie3/clk_prescaler.vhd\" -o clk_prescaler.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 17:13:46 ###########


########## Tcl recorder starts at 11/29/18 17:13:54 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open clk_prescaler.cmd w} rspFile] {
	puts stderr "Cannot create response file clk_prescaler.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: untitled.sty
PROJECT: clk_prescaler
WORKING_PATH: \"$proj_dir\"
MODULE: clk_prescaler
VHDL_FILE_LIST: \"F:/Politechnika/Dydaktyka/Uk³ady programowalne (3sem)/ispLEVER Projects/zadanie3/clk_prescaler.vhd\"
OUTPUT_FILE_NAME: clk_prescaler
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e clk_prescaler -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete clk_prescaler.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf clk_prescaler.edi -out clk_prescaler.bl0 -err automake.err -log clk_prescaler.log -prj untitled -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 17:13:54 ###########


########## Tcl recorder starts at 11/29/18 17:14:38 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
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

########## Tcl recorder end at 11/29/18 17:14:38 ###########


########## Tcl recorder starts at 11/29/18 17:14:41 ##########

# Commands to make the Process: 
# Synplify Synthesize VHDL File
if [catch {open stateMachine1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: untitled.sty
PROJECT: stateMachine1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine1
VHDL_FILE_LIST: clk_prescaler.vhd machina.vhd
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

########## Tcl recorder end at 11/29/18 17:14:41 ###########


########## Tcl recorder starts at 11/29/18 17:15:27 ##########

# Commands to make the Process: 
# Compile EDIF File
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine1.edi -out stateMachine1.bl0 -err automake.err -log stateMachine1.log -prj untitled -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 17:15:27 ###########


########## Tcl recorder starts at 11/29/18 17:15:57 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 17:15:57 ###########


########## Tcl recorder starts at 11/29/18 17:16:31 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 17:16:31 ###########


########## Tcl recorder starts at 11/29/18 17:16:41 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 17:16:41 ###########


########## Tcl recorder starts at 11/29/18 17:16:43 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 17:16:43 ###########


########## Tcl recorder starts at 11/29/18 17:17:40 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 17:17:41 ###########


########## Tcl recorder starts at 11/29/18 17:18:16 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 17:18:16 ###########


########## Tcl recorder starts at 11/29/18 17:18:20 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 17:18:20 ###########


########## Tcl recorder starts at 11/29/18 17:21:03 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 17:21:04 ###########


########## Tcl recorder starts at 11/29/18 17:21:14 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 17:21:14 ###########


########## Tcl recorder starts at 11/29/18 17:33:59 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open stateMachine1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: untitled.sty
PROJECT: stateMachine1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine1
VHDL_FILE_LIST: clk_prescaler.vhd machina.vhd
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
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine1.edi -out stateMachine1.bl0 -err automake.err -log stateMachine1.log -prj untitled -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 17:33:59 ###########


########## Tcl recorder starts at 11/29/18 17:52:27 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 17:52:27 ###########


########## Tcl recorder starts at 11/29/18 17:52:30 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open stateMachine1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: untitled.sty
PROJECT: stateMachine1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine1
VHDL_FILE_LIST: clk_prescaler.vhd machina.vhd
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
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine1.edi -out stateMachine1.bl0 -err automake.err -log stateMachine1.log -prj untitled -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 17:52:30 ###########


########## Tcl recorder starts at 11/29/18 17:53:25 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 17:53:25 ###########


########## Tcl recorder starts at 11/29/18 17:53:29 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open stateMachine1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: untitled.sty
PROJECT: stateMachine1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine1
VHDL_FILE_LIST: clk_prescaler.vhd machina.vhd
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
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine1.edi -out stateMachine1.bl0 -err automake.err -log stateMachine1.log -prj untitled -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 17:53:29 ###########


########## Tcl recorder starts at 11/29/18 17:54:16 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 17:54:16 ###########


########## Tcl recorder starts at 11/29/18 17:54:27 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 17:54:27 ###########


########## Tcl recorder starts at 11/29/18 17:55:04 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 17:55:04 ###########


########## Tcl recorder starts at 11/29/18 17:55:06 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 17:55:06 ###########


########## Tcl recorder starts at 11/29/18 17:55:08 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open stateMachine1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: untitled.sty
PROJECT: stateMachine1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine1
VHDL_FILE_LIST: clk_prescaler.vhd machina.vhd
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
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine1.edi -out stateMachine1.bl0 -err automake.err -log stateMachine1.log -prj untitled -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 17:55:08 ###########


########## Tcl recorder starts at 11/29/18 17:56:11 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 17:56:11 ###########


########## Tcl recorder starts at 11/29/18 17:56:40 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 17:56:40 ###########


########## Tcl recorder starts at 11/29/18 17:56:43 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open stateMachine1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: untitled.sty
PROJECT: stateMachine1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine1
VHDL_FILE_LIST: clk_prescaler.vhd machina.vhd
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
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine1.edi -out stateMachine1.bl0 -err automake.err -log stateMachine1.log -prj untitled -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 17:56:43 ###########


########## Tcl recorder starts at 11/29/18 17:59:30 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 17:59:30 ###########


########## Tcl recorder starts at 11/29/18 18:00:17 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 18:00:17 ###########


########## Tcl recorder starts at 11/29/18 18:00:27 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 18:00:27 ###########


########## Tcl recorder starts at 11/29/18 18:00:38 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 18:00:38 ###########


########## Tcl recorder starts at 11/29/18 18:00:49 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 18:00:49 ###########


########## Tcl recorder starts at 11/29/18 18:00:51 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open stateMachine1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: untitled.sty
PROJECT: stateMachine1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine1
VHDL_FILE_LIST: clk_prescaler.vhd machina.vhd
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
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine1.edi -out stateMachine1.bl0 -err automake.err -log stateMachine1.log -prj untitled -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 18:00:51 ###########


########## Tcl recorder starts at 11/29/18 18:01:35 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 18:01:35 ###########


########## Tcl recorder starts at 11/29/18 18:01:38 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open stateMachine1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: untitled.sty
PROJECT: stateMachine1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine1
VHDL_FILE_LIST: clk_prescaler.vhd machina.vhd
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
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine1.edi -out stateMachine1.bl0 -err automake.err -log stateMachine1.log -prj untitled -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/29/18 18:01:38 ###########


########## Tcl recorder starts at 11/30/18 09:09:01 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
# Constraint Editor
if [runCmd "\"$cpld_bin/mblifopt\" stateMachine1.bl0 -collapse none -reduce none -keepwires  -err automake.err -family"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"stateMachine1.bl1\" -o \"untitled.bl2\" -omod \"untitled\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj untitled -lci untitled.lct -log untitled.imp -err automake.err -tti untitled.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -blifopt  untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" untitled.bl2 -sweep -mergefb -err automake.err -o untitled.bl3  @untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -diofft  untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" untitled.bl3 -pla -family AMDMACH -idev van -o untitled.tt2 -oxrf untitled.xrf -err automake.err  @untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj untitled -dir $proj_dir -log untitled.log -tti untitled.tt2 -tto untitled.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -prefit  untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp untitled.tt3 -out untitled.tt4 -err automake.err -log untitled.log -percent untitled.tte -mod stateMachine1  @untitled.l0"] {
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
	puts $rspFile "-src untitled.tt4 -type PLA -devfile \"$install_dir/ispcpld/dat/mach4a/mach463ace.dev\" -lci \"untitled.lct\" -touch \"untitled.tt4\"
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

########## Tcl recorder end at 11/30/18 09:09:01 ###########


########## Tcl recorder starts at 11/30/18 09:09:16 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
# Compile EDIF File
if [catch {open clk_prescaler.cmd w} rspFile] {
	puts stderr "Cannot create response file clk_prescaler.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: untitled.sty
PROJECT: clk_prescaler
WORKING_PATH: \"$proj_dir\"
MODULE: clk_prescaler
VHDL_FILE_LIST: clk_prescaler.vhd
OUTPUT_FILE_NAME: clk_prescaler
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e clk_prescaler -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete clk_prescaler.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf clk_prescaler.edi -out clk_prescaler.bl0 -err automake.err -log clk_prescaler.log -prj untitled -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/30/18 09:09:16 ###########


########## Tcl recorder starts at 11/30/18 09:09:55 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
# Compile EDIF File
if [catch {open stateMachine1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: untitled.sty
PROJECT: stateMachine1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine1
VHDL_FILE_LIST: clk_prescaler.vhd machina.vhd
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
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine1.edi -out stateMachine1.bl0 -err automake.err -log stateMachine1.log -prj untitled -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/30/18 09:09:55 ###########


########## Tcl recorder starts at 11/30/18 09:10:32 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
# Constraint Editor
if [runCmd "\"$cpld_bin/mblifopt\" stateMachine1.bl0 -collapse none -reduce none -keepwires  -err automake.err -family"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"stateMachine1.bl1\" -o \"untitled.bl2\" -omod \"untitled\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj untitled -lci untitled.lct -log untitled.imp -err automake.err -tti untitled.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -blifopt  untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" untitled.bl2 -sweep -mergefb -err automake.err -o untitled.bl3  @untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -diofft  untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" untitled.bl3 -pla -family AMDMACH -idev van -o untitled.tt2 -oxrf untitled.xrf -err automake.err  @untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj untitled -dir $proj_dir -log untitled.log -tti untitled.tt2 -tto untitled.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -prefit  untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp untitled.tt3 -out untitled.tt4 -err automake.err -log untitled.log -percent untitled.tte -mod stateMachine1  @untitled.l0"] {
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
	puts $rspFile "-src untitled.tt4 -type PLA -devfile \"$install_dir/ispcpld/dat/mach4a/mach463ace.dev\" -lci \"untitled.lct\" -touch \"untitled.tt4\"
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

########## Tcl recorder end at 11/30/18 09:10:32 ###########


########## Tcl recorder starts at 11/30/18 09:10:59 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
# Constraint Editor
if [catch {open stateMachine1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: untitled.sty
PROJECT: stateMachine1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine1
VHDL_FILE_LIST: clk_prescaler.vhd machina.vhd
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
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine1.edi -out stateMachine1.bl0 -err automake.err -log stateMachine1.log -prj untitled -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" stateMachine1.bl0 -collapse none -reduce none -keepwires  -err automake.err -family"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"stateMachine1.bl1\" -o \"untitled.bl2\" -omod \"untitled\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj untitled -lci untitled.lct -log untitled.imp -err automake.err -tti untitled.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -blifopt  untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" untitled.bl2 -sweep -mergefb -err automake.err -o untitled.bl3  @untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -diofft  untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" untitled.bl3 -pla -family AMDMACH -idev van -o untitled.tt2 -oxrf untitled.xrf -err automake.err  @untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj untitled -dir $proj_dir -log untitled.log -tti untitled.tt2 -tto untitled.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -prefit  untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp untitled.tt3 -out untitled.tt4 -err automake.err -log untitled.log -percent untitled.tte -mod stateMachine1  @untitled.l0"] {
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
	puts $rspFile "-src untitled.tt4 -type PLA -devfile \"$install_dir/ispcpld/dat/mach4a/mach463ace.dev\" -lci \"untitled.lct\" -touch \"untitled.tt4\"
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

########## Tcl recorder end at 11/30/18 09:10:59 ###########


########## Tcl recorder starts at 11/30/18 09:11:38 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
# Compiled Equations
if [runCmd "\"$cpld_bin/blif2eqn\" stateMachine1.bl0 -o stateMachine1.eq0  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/30/18 09:11:38 ###########


########## Tcl recorder starts at 11/30/18 09:29:36 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
# Constraint Editor
if [runCmd "\"$cpld_bin/mblifopt\" untitled.bl2 -sweep -mergefb -err automake.err -o untitled.bl3  @untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -diofft  untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" untitled.bl3 -pla -family AMDMACH -idev van -o untitled.tt2 -oxrf untitled.xrf -err automake.err  @untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj untitled -dir $proj_dir -log untitled.log -tti untitled.tt2 -tto untitled.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -prefit  untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp untitled.tt3 -out untitled.tt4 -err automake.err -log untitled.log -percent untitled.tte -mod stateMachine1  @untitled.l0"] {
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
	puts $rspFile "-src untitled.tt4 -type PLA -devfile \"$install_dir/ispcpld/dat/mach4a/mach463ace.dev\" -lci \"untitled.lct\" -touch \"untitled.tt4\"
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

########## Tcl recorder end at 11/30/18 09:29:36 ###########


########## Tcl recorder starts at 11/30/18 09:31:29 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/30/18 09:31:29 ###########


########## Tcl recorder starts at 11/30/18 09:31:32 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
# Compile EDIF File
if [catch {open stateMachine1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: untitled.sty
PROJECT: stateMachine1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine1
VHDL_FILE_LIST: clk_prescaler.vhd machina.vhd
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
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine1.edi -out stateMachine1.bl0 -err automake.err -log stateMachine1.log -prj untitled -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/30/18 09:31:32 ###########


########## Tcl recorder starts at 11/30/18 09:32:10 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/30/18 09:32:10 ###########


########## Tcl recorder starts at 11/30/18 09:32:13 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/30/18 09:32:13 ###########


########## Tcl recorder starts at 11/30/18 09:32:17 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
# Compile EDIF File
if [catch {open stateMachine1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: untitled.sty
PROJECT: stateMachine1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine1
VHDL_FILE_LIST: clk_prescaler.vhd machina.vhd
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
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine1.edi -out stateMachine1.bl0 -err automake.err -log stateMachine1.log -prj untitled -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/30/18 09:32:17 ###########


########## Tcl recorder starts at 11/30/18 09:33:08 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
# Constraint Editor
if [runCmd "\"$cpld_bin/mblifopt\" stateMachine1.bl0 -collapse none -reduce none -keepwires  -err automake.err -family"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"stateMachine1.bl1\" -o \"untitled.bl2\" -omod \"untitled\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj untitled -lci untitled.lct -log untitled.imp -err automake.err -tti untitled.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -blifopt  untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" untitled.bl2 -sweep -mergefb -err automake.err -o untitled.bl3  @untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -diofft  untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" untitled.bl3 -pla -family AMDMACH -idev van -o untitled.tt2 -oxrf untitled.xrf -err automake.err  @untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj untitled -dir $proj_dir -log untitled.log -tti untitled.tt2 -tto untitled.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -prefit  untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp untitled.tt3 -out untitled.tt4 -err automake.err -log untitled.log -percent untitled.tte -mod stateMachine1  @untitled.l0"] {
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
	puts $rspFile "-src untitled.tt4 -type PLA -devfile \"$install_dir/ispcpld/dat/mach4a/mach463ace.dev\" -lci \"untitled.lct\" -touch \"untitled.tt4\"
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

########## Tcl recorder end at 11/30/18 09:33:08 ###########


########## Tcl recorder starts at 11/30/18 09:34:19 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
# Constraint Editor
# - none -
# Application to view the Process: 
# Constraint Editor
if [catch {open lattice_cmd.rs2 w} rspFile] {
	puts stderr "Cannot create response file lattice_cmd.rs2: $rspFile"
} else {
	puts $rspFile "-src untitled.tt4 -type PLA -devfile \"$install_dir/ispcpld/dat/mach4a/mach463ace.dev\" -lci \"untitled.lct\" -touch \"untitled.tt4\"
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

########## Tcl recorder end at 11/30/18 09:34:19 ###########


########## Tcl recorder starts at 11/30/18 09:34:23 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
# Fit Design
if [runCmd "\"$cpld_bin/blif2eqn\" untitled.tte -o untitled.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci untitled.lct -out untitled.vct -log untitled.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open untitled.rsp w} rspFile] {
	puts stderr "Cannot create response file untitled.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"untitled.tt4\" -vci \"untitled.vct\" -log \"untitled.log\" -eqn \"untitled.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"NoInput.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@untitled.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete untitled.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci untitled.vco -out untitled.lco -log untitled.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj untitled -if untitled.jed -j2s -log untitled.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/30/18 09:34:23 ###########


########## Tcl recorder starts at 11/30/18 09:40:55 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
# Constraint Editor
# - none -
# Application to view the Process: 
# Constraint Editor
if [catch {open lattice_cmd.rs2 w} rspFile] {
	puts stderr "Cannot create response file lattice_cmd.rs2: $rspFile"
} else {
	puts $rspFile "-src untitled.tt4 -type PLA -devfile \"$install_dir/ispcpld/dat/mach4a/mach463ace.dev\" -lci \"untitled.lct\" -touch \"untitled.tt4\"
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

########## Tcl recorder end at 11/30/18 09:40:55 ###########


########## Tcl recorder starts at 11/30/18 09:44:16 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/30/18 09:44:16 ###########


########## Tcl recorder starts at 11/30/18 09:44:20 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
# Fit Design
if [catch {open stateMachine1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: untitled.sty
PROJECT: stateMachine1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine1
VHDL_FILE_LIST: clk_prescaler.vhd machina.vhd
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
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine1.edi -out stateMachine1.bl0 -err automake.err -log stateMachine1.log -prj untitled -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" stateMachine1.bl0 -collapse none -reduce none -keepwires  -err automake.err -family"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"stateMachine1.bl1\" -o \"untitled.bl2\" -omod \"untitled\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj untitled -lci untitled.lct -log untitled.imp -err automake.err -tti untitled.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -blifopt  untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" untitled.bl2 -sweep -mergefb -err automake.err -o untitled.bl3  @untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -diofft  untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" untitled.bl3 -pla -family AMDMACH -idev van -o untitled.tt2 -oxrf untitled.xrf -err automake.err  @untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj untitled -dir $proj_dir -log untitled.log -tti untitled.tt2 -tto untitled.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -prefit  untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp untitled.tt3 -out untitled.tt4 -err automake.err -log untitled.log -percent untitled.tte -mod stateMachine1  @untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" untitled.tte -o untitled.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci untitled.lct -out untitled.vct -log untitled.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open untitled.rsp w} rspFile] {
	puts stderr "Cannot create response file untitled.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"untitled.tt4\" -vci \"untitled.vct\" -log \"untitled.log\" -eqn \"untitled.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"NoInput.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@untitled.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete untitled.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci untitled.vco -out untitled.lco -log untitled.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj untitled -if untitled.jed -j2s -log untitled.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/30/18 09:44:20 ###########


########## Tcl recorder starts at 11/30/18 09:47:37 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/30/18 09:47:37 ###########


########## Tcl recorder starts at 11/30/18 09:47:40 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
# Fit Design
if [catch {open stateMachine1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: untitled.sty
PROJECT: stateMachine1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine1
VHDL_FILE_LIST: clk_prescaler.vhd machina.vhd
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
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine1.edi -out stateMachine1.bl0 -err automake.err -log stateMachine1.log -prj untitled -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" stateMachine1.bl0 -collapse none -reduce none -keepwires  -err automake.err -family"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"stateMachine1.bl1\" -o \"untitled.bl2\" -omod \"untitled\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj untitled -lci untitled.lct -log untitled.imp -err automake.err -tti untitled.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -blifopt  untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" untitled.bl2 -sweep -mergefb -err automake.err -o untitled.bl3  @untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -diofft  untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" untitled.bl3 -pla -family AMDMACH -idev van -o untitled.tt2 -oxrf untitled.xrf -err automake.err  @untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj untitled -dir $proj_dir -log untitled.log -tti untitled.tt2 -tto untitled.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -prefit  untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp untitled.tt3 -out untitled.tt4 -err automake.err -log untitled.log -percent untitled.tte -mod stateMachine1  @untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" untitled.tte -o untitled.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci untitled.lct -out untitled.vct -log untitled.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open untitled.rsp w} rspFile] {
	puts stderr "Cannot create response file untitled.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"untitled.tt4\" -vci \"untitled.vct\" -log \"untitled.log\" -eqn \"untitled.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"NoInput.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@untitled.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete untitled.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci untitled.vco -out untitled.lco -log untitled.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj untitled -if untitled.jed -j2s -log untitled.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/30/18 09:47:40 ###########


########## Tcl recorder starts at 11/30/18 09:48:44 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/30/18 09:48:44 ###########


########## Tcl recorder starts at 11/30/18 09:48:49 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
# Fit Design
if [catch {open stateMachine1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: untitled.sty
PROJECT: stateMachine1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine1
VHDL_FILE_LIST: clk_prescaler.vhd machina.vhd
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
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine1.edi -out stateMachine1.bl0 -err automake.err -log stateMachine1.log -prj untitled -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" stateMachine1.bl0 -collapse none -reduce none -keepwires  -err automake.err -family"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"stateMachine1.bl1\" -o \"untitled.bl2\" -omod \"untitled\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj untitled -lci untitled.lct -log untitled.imp -err automake.err -tti untitled.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -blifopt  untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" untitled.bl2 -sweep -mergefb -err automake.err -o untitled.bl3  @untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -diofft  untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" untitled.bl3 -pla -family AMDMACH -idev van -o untitled.tt2 -oxrf untitled.xrf -err automake.err  @untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj untitled -dir $proj_dir -log untitled.log -tti untitled.tt2 -tto untitled.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -prefit  untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp untitled.tt3 -out untitled.tt4 -err automake.err -log untitled.log -percent untitled.tte -mod stateMachine1  @untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" untitled.tte -o untitled.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci untitled.lct -out untitled.vct -log untitled.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open untitled.rsp w} rspFile] {
	puts stderr "Cannot create response file untitled.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"untitled.tt4\" -vci \"untitled.vct\" -log \"untitled.log\" -eqn \"untitled.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"NoInput.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@untitled.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete untitled.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci untitled.vco -out untitled.lco -log untitled.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj untitled -if untitled.jed -j2s -log untitled.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/30/18 09:48:49 ###########


########## Tcl recorder starts at 11/30/18 09:49:31 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/30/18 09:49:31 ###########


########## Tcl recorder starts at 11/30/18 09:49:33 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
# Fit Design
if [catch {open stateMachine1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: untitled.sty
PROJECT: stateMachine1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine1
VHDL_FILE_LIST: clk_prescaler.vhd machina.vhd
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
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine1.edi -out stateMachine1.bl0 -err automake.err -log stateMachine1.log -prj untitled -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" stateMachine1.bl0 -collapse none -reduce none -keepwires  -err automake.err -family"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"stateMachine1.bl1\" -o \"untitled.bl2\" -omod \"untitled\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj untitled -lci untitled.lct -log untitled.imp -err automake.err -tti untitled.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -blifopt  untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" untitled.bl2 -sweep -mergefb -err automake.err -o untitled.bl3  @untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -diofft  untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" untitled.bl3 -pla -family AMDMACH -idev van -o untitled.tt2 -oxrf untitled.xrf -err automake.err  @untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj untitled -dir $proj_dir -log untitled.log -tti untitled.tt2 -tto untitled.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -prefit  untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp untitled.tt3 -out untitled.tt4 -err automake.err -log untitled.log -percent untitled.tte -mod stateMachine1  @untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" untitled.tte -o untitled.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci untitled.lct -out untitled.vct -log untitled.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open untitled.rsp w} rspFile] {
	puts stderr "Cannot create response file untitled.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"untitled.tt4\" -vci \"untitled.vct\" -log \"untitled.log\" -eqn \"untitled.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"NoInput.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@untitled.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete untitled.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci untitled.vco -out untitled.lco -log untitled.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj untitled -if untitled.jed -j2s -log untitled.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/30/18 09:49:33 ###########


########## Tcl recorder starts at 11/30/18 09:52:31 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/30/18 09:52:31 ###########


########## Tcl recorder starts at 11/30/18 09:52:37 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/30/18 09:52:37 ###########


########## Tcl recorder starts at 11/30/18 09:53:08 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/30/18 09:53:08 ###########


########## Tcl recorder starts at 11/30/18 09:53:11 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
# Fit Design
if [catch {open stateMachine1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: untitled.sty
PROJECT: stateMachine1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine1
VHDL_FILE_LIST: clk_prescaler.vhd machina.vhd
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
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine1.edi -out stateMachine1.bl0 -err automake.err -log stateMachine1.log -prj untitled -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" stateMachine1.bl0 -collapse none -reduce none -keepwires  -err automake.err -family"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"stateMachine1.bl1\" -o \"untitled.bl2\" -omod \"untitled\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj untitled -lci untitled.lct -log untitled.imp -err automake.err -tti untitled.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -blifopt  untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" untitled.bl2 -sweep -mergefb -err automake.err -o untitled.bl3  @untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -diofft  untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" untitled.bl3 -pla -family AMDMACH -idev van -o untitled.tt2 -oxrf untitled.xrf -err automake.err  @untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj untitled -dir $proj_dir -log untitled.log -tti untitled.tt2 -tto untitled.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -prefit  untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp untitled.tt3 -out untitled.tt4 -err automake.err -log untitled.log -percent untitled.tte -mod stateMachine1  @untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" untitled.tte -o untitled.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci untitled.lct -out untitled.vct -log untitled.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open untitled.rsp w} rspFile] {
	puts stderr "Cannot create response file untitled.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"untitled.tt4\" -vci \"untitled.vct\" -log \"untitled.log\" -eqn \"untitled.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"NoInput.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@untitled.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete untitled.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci untitled.vco -out untitled.lco -log untitled.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj untitled -if untitled.jed -j2s -log untitled.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/30/18 09:53:11 ###########


########## Tcl recorder starts at 11/30/18 09:53:57 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/30/18 09:53:57 ###########


########## Tcl recorder starts at 11/30/18 09:53:59 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
# Fit Design
if [catch {open stateMachine1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: untitled.sty
PROJECT: stateMachine1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine1
VHDL_FILE_LIST: clk_prescaler.vhd machina.vhd
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
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine1.edi -out stateMachine1.bl0 -err automake.err -log stateMachine1.log -prj untitled -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" stateMachine1.bl0 -collapse none -reduce none -keepwires  -err automake.err -family"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"stateMachine1.bl1\" -o \"untitled.bl2\" -omod \"untitled\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj untitled -lci untitled.lct -log untitled.imp -err automake.err -tti untitled.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -blifopt  untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" untitled.bl2 -sweep -mergefb -err automake.err -o untitled.bl3  @untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -diofft  untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" untitled.bl3 -pla -family AMDMACH -idev van -o untitled.tt2 -oxrf untitled.xrf -err automake.err  @untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj untitled -dir $proj_dir -log untitled.log -tti untitled.tt2 -tto untitled.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -prefit  untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp untitled.tt3 -out untitled.tt4 -err automake.err -log untitled.log -percent untitled.tte -mod stateMachine1  @untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" untitled.tte -o untitled.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci untitled.lct -out untitled.vct -log untitled.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open untitled.rsp w} rspFile] {
	puts stderr "Cannot create response file untitled.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"untitled.tt4\" -vci \"untitled.vct\" -log \"untitled.log\" -eqn \"untitled.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"NoInput.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@untitled.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete untitled.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci untitled.vco -out untitled.lco -log untitled.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj untitled -if untitled.jed -j2s -log untitled.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/30/18 09:53:59 ###########


########## Tcl recorder starts at 11/30/18 09:54:53 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/30/18 09:54:53 ###########


########## Tcl recorder starts at 11/30/18 09:54:59 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
# Fit Design
if [catch {open stateMachine1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: untitled.sty
PROJECT: stateMachine1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine1
VHDL_FILE_LIST: clk_prescaler.vhd machina.vhd
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
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine1.edi -out stateMachine1.bl0 -err automake.err -log stateMachine1.log -prj untitled -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" stateMachine1.bl0 -collapse none -reduce none -keepwires  -err automake.err -family"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"stateMachine1.bl1\" -o \"untitled.bl2\" -omod \"untitled\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj untitled -lci untitled.lct -log untitled.imp -err automake.err -tti untitled.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -blifopt  untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" untitled.bl2 -sweep -mergefb -err automake.err -o untitled.bl3  @untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -diofft  untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" untitled.bl3 -pla -family AMDMACH -idev van -o untitled.tt2 -oxrf untitled.xrf -err automake.err  @untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj untitled -dir $proj_dir -log untitled.log -tti untitled.tt2 -tto untitled.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -prefit  untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp untitled.tt3 -out untitled.tt4 -err automake.err -log untitled.log -percent untitled.tte -mod stateMachine1  @untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" untitled.tte -o untitled.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci untitled.lct -out untitled.vct -log untitled.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open untitled.rsp w} rspFile] {
	puts stderr "Cannot create response file untitled.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"untitled.tt4\" -vci \"untitled.vct\" -log \"untitled.log\" -eqn \"untitled.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"NoInput.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@untitled.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete untitled.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci untitled.vco -out untitled.lco -log untitled.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj untitled -if untitled.jed -j2s -log untitled.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/30/18 09:54:59 ###########


########## Tcl recorder starts at 11/30/18 09:56:44 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/30/18 09:56:44 ###########


########## Tcl recorder starts at 11/30/18 09:56:53 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
# Fit Design
if [catch {open stateMachine1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: untitled.sty
PROJECT: stateMachine1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine1
VHDL_FILE_LIST: clk_prescaler.vhd machina.vhd
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
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine1.edi -out stateMachine1.bl0 -err automake.err -log stateMachine1.log -prj untitled -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" stateMachine1.bl0 -collapse none -reduce none -keepwires  -err automake.err -family"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"stateMachine1.bl1\" -o \"untitled.bl2\" -omod \"untitled\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj untitled -lci untitled.lct -log untitled.imp -err automake.err -tti untitled.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -blifopt  untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" untitled.bl2 -sweep -mergefb -err automake.err -o untitled.bl3  @untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -diofft  untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" untitled.bl3 -pla -family AMDMACH -idev van -o untitled.tt2 -oxrf untitled.xrf -err automake.err  @untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj untitled -dir $proj_dir -log untitled.log -tti untitled.tt2 -tto untitled.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -prefit  untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp untitled.tt3 -out untitled.tt4 -err automake.err -log untitled.log -percent untitled.tte -mod stateMachine1  @untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" untitled.tte -o untitled.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci untitled.lct -out untitled.vct -log untitled.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open untitled.rsp w} rspFile] {
	puts stderr "Cannot create response file untitled.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"untitled.tt4\" -vci \"untitled.vct\" -log \"untitled.log\" -eqn \"untitled.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"NoInput.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@untitled.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete untitled.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci untitled.vco -out untitled.lco -log untitled.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj untitled -if untitled.jed -j2s -log untitled.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/30/18 09:56:53 ###########


########## Tcl recorder starts at 11/30/18 09:57:39 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/30/18 09:57:39 ###########


########## Tcl recorder starts at 11/30/18 09:57:41 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
# JEDEC File
if [catch {open stateMachine1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: untitled.sty
PROJECT: stateMachine1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine1
VHDL_FILE_LIST: clk_prescaler.vhd machina.vhd
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
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine1.edi -out stateMachine1.bl0 -err automake.err -log stateMachine1.log -prj untitled -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" stateMachine1.bl0 -collapse none -reduce none -keepwires  -err automake.err -family"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"stateMachine1.bl1\" -o \"untitled.bl2\" -omod \"untitled\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj untitled -lci untitled.lct -log untitled.imp -err automake.err -tti untitled.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -blifopt  untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" untitled.bl2 -sweep -mergefb -err automake.err -o untitled.bl3  @untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -diofft  untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" untitled.bl3 -pla -family AMDMACH -idev van -o untitled.tt2 -oxrf untitled.xrf -err automake.err  @untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj untitled -dir $proj_dir -log untitled.log -tti untitled.tt2 -tto untitled.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -prefit  untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp untitled.tt3 -out untitled.tt4 -err automake.err -log untitled.log -percent untitled.tte -mod stateMachine1  @untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" untitled.tte -o untitled.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci untitled.lct -out untitled.vct -log untitled.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open untitled.rsp w} rspFile] {
	puts stderr "Cannot create response file untitled.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"untitled.tt4\" -vci \"untitled.vct\" -log \"untitled.log\" -eqn \"untitled.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"NoInput.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@untitled.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete untitled.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci untitled.vco -out untitled.lco -log untitled.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj untitled -if untitled.jed -j2s -log untitled.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/30/18 09:57:41 ###########


########## Tcl recorder starts at 11/30/18 09:58:48 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/30/18 09:58:48 ###########


########## Tcl recorder starts at 11/30/18 09:58:53 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
# JEDEC File
if [catch {open stateMachine1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: untitled.sty
PROJECT: stateMachine1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine1
VHDL_FILE_LIST: clk_prescaler.vhd machina.vhd
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
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine1.edi -out stateMachine1.bl0 -err automake.err -log stateMachine1.log -prj untitled -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" stateMachine1.bl0 -collapse none -reduce none -keepwires  -err automake.err -family"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"stateMachine1.bl1\" -o \"untitled.bl2\" -omod \"untitled\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj untitled -lci untitled.lct -log untitled.imp -err automake.err -tti untitled.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -blifopt  untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" untitled.bl2 -sweep -mergefb -err automake.err -o untitled.bl3  @untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -diofft  untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" untitled.bl3 -pla -family AMDMACH -idev van -o untitled.tt2 -oxrf untitled.xrf -err automake.err  @untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj untitled -dir $proj_dir -log untitled.log -tti untitled.tt2 -tto untitled.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -prefit  untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp untitled.tt3 -out untitled.tt4 -err automake.err -log untitled.log -percent untitled.tte -mod stateMachine1  @untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" untitled.tte -o untitled.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci untitled.lct -out untitled.vct -log untitled.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open untitled.rsp w} rspFile] {
	puts stderr "Cannot create response file untitled.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"untitled.tt4\" -vci \"untitled.vct\" -log \"untitled.log\" -eqn \"untitled.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"NoInput.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@untitled.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete untitled.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci untitled.vco -out untitled.lco -log untitled.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj untitled -if untitled.jed -j2s -log untitled.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/30/18 09:58:53 ###########


########## Tcl recorder starts at 11/30/18 09:59:33 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/30/18 09:59:33 ###########


########## Tcl recorder starts at 11/30/18 09:59:37 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
# JEDEC File
if [catch {open stateMachine1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: untitled.sty
PROJECT: stateMachine1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine1
VHDL_FILE_LIST: clk_prescaler.vhd machina.vhd
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
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine1.edi -out stateMachine1.bl0 -err automake.err -log stateMachine1.log -prj untitled -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" stateMachine1.bl0 -collapse none -reduce none -keepwires  -err automake.err -family"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"stateMachine1.bl1\" -o \"untitled.bl2\" -omod \"untitled\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj untitled -lci untitled.lct -log untitled.imp -err automake.err -tti untitled.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -blifopt  untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" untitled.bl2 -sweep -mergefb -err automake.err -o untitled.bl3  @untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -diofft  untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" untitled.bl3 -pla -family AMDMACH -idev van -o untitled.tt2 -oxrf untitled.xrf -err automake.err  @untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj untitled -dir $proj_dir -log untitled.log -tti untitled.tt2 -tto untitled.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -prefit  untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp untitled.tt3 -out untitled.tt4 -err automake.err -log untitled.log -percent untitled.tte -mod stateMachine1  @untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" untitled.tte -o untitled.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci untitled.lct -out untitled.vct -log untitled.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open untitled.rsp w} rspFile] {
	puts stderr "Cannot create response file untitled.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"untitled.tt4\" -vci \"untitled.vct\" -log \"untitled.log\" -eqn \"untitled.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"NoInput.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@untitled.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete untitled.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci untitled.vco -out untitled.lco -log untitled.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj untitled -if untitled.jed -j2s -log untitled.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/30/18 09:59:37 ###########


########## Tcl recorder starts at 11/30/18 10:00:23 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/30/18 10:00:23 ###########


########## Tcl recorder starts at 11/30/18 10:00:23 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
# Fit Design
if [catch {open stateMachine1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: untitled.sty
PROJECT: stateMachine1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine1
VHDL_FILE_LIST: clk_prescaler.vhd machina.vhd
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
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine1.edi -out stateMachine1.bl0 -err automake.err -log stateMachine1.log -prj untitled -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" stateMachine1.bl0 -collapse none -reduce none -keepwires  -err automake.err -family"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"stateMachine1.bl1\" -o \"untitled.bl2\" -omod \"untitled\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj untitled -lci untitled.lct -log untitled.imp -err automake.err -tti untitled.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -blifopt  untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" untitled.bl2 -sweep -mergefb -err automake.err -o untitled.bl3  @untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -diofft  untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" untitled.bl3 -pla -family AMDMACH -idev van -o untitled.tt2 -oxrf untitled.xrf -err automake.err  @untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj untitled -dir $proj_dir -log untitled.log -tti untitled.tt2 -tto untitled.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -prefit  untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp untitled.tt3 -out untitled.tt4 -err automake.err -log untitled.log -percent untitled.tte -mod stateMachine1  @untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" untitled.tte -o untitled.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci untitled.lct -out untitled.vct -log untitled.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open untitled.rsp w} rspFile] {
	puts stderr "Cannot create response file untitled.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"untitled.tt4\" -vci \"untitled.vct\" -log \"untitled.log\" -eqn \"untitled.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"NoInput.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@untitled.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete untitled.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci untitled.vco -out untitled.lco -log untitled.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj untitled -if untitled.jed -j2s -log untitled.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/30/18 10:00:23 ###########


########## Tcl recorder starts at 11/30/18 10:01:23 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/30/18 10:01:23 ###########


########## Tcl recorder starts at 11/30/18 10:01:26 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
# Fit Design
if [catch {open stateMachine1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: untitled.sty
PROJECT: stateMachine1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine1
VHDL_FILE_LIST: clk_prescaler.vhd machina.vhd
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
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine1.edi -out stateMachine1.bl0 -err automake.err -log stateMachine1.log -prj untitled -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" stateMachine1.bl0 -collapse none -reduce none -keepwires  -err automake.err -family"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"stateMachine1.bl1\" -o \"untitled.bl2\" -omod \"untitled\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj untitled -lci untitled.lct -log untitled.imp -err automake.err -tti untitled.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -blifopt  untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" untitled.bl2 -sweep -mergefb -err automake.err -o untitled.bl3  @untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -diofft  untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" untitled.bl3 -pla -family AMDMACH -idev van -o untitled.tt2 -oxrf untitled.xrf -err automake.err  @untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj untitled -dir $proj_dir -log untitled.log -tti untitled.tt2 -tto untitled.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -prefit  untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp untitled.tt3 -out untitled.tt4 -err automake.err -log untitled.log -percent untitled.tte -mod stateMachine1  @untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" untitled.tte -o untitled.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci untitled.lct -out untitled.vct -log untitled.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open untitled.rsp w} rspFile] {
	puts stderr "Cannot create response file untitled.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"untitled.tt4\" -vci \"untitled.vct\" -log \"untitled.log\" -eqn \"untitled.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"NoInput.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@untitled.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete untitled.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci untitled.vco -out untitled.lco -log untitled.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj untitled -if untitled.jed -j2s -log untitled.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/30/18 10:01:26 ###########


########## Tcl recorder starts at 11/30/18 10:02:13 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
# Compile EDIF File
if [catch {open stateMachine1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: untitled.sty
PROJECT: stateMachine1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine1
VHDL_FILE_LIST: clk_prescaler.vhd machina.vhd
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
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine1.edi -out stateMachine1.bl0 -err automake.err -log stateMachine1.log -prj untitled -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/30/18 10:02:13 ###########


########## Tcl recorder starts at 11/30/18 10:02:55 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/30/18 10:02:55 ###########


########## Tcl recorder starts at 11/30/18 10:02:56 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
# Compile EDIF File
if [catch {open stateMachine1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: untitled.sty
PROJECT: stateMachine1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine1
VHDL_FILE_LIST: clk_prescaler.vhd machina.vhd
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
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine1.edi -out stateMachine1.bl0 -err automake.err -log stateMachine1.log -prj untitled -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/30/18 10:02:56 ###########


########## Tcl recorder starts at 11/30/18 10:03:33 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
# Fit Design
if [runCmd "\"$cpld_bin/mblifopt\" stateMachine1.bl0 -collapse none -reduce none -keepwires  -err automake.err -family"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"stateMachine1.bl1\" -o \"untitled.bl2\" -omod \"untitled\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj untitled -lci untitled.lct -log untitled.imp -err automake.err -tti untitled.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -blifopt  untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" untitled.bl2 -sweep -mergefb -err automake.err -o untitled.bl3  @untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -diofft  untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" untitled.bl3 -pla -family AMDMACH -idev van -o untitled.tt2 -oxrf untitled.xrf -err automake.err  @untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj untitled -dir $proj_dir -log untitled.log -tti untitled.tt2 -tto untitled.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -prefit  untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp untitled.tt3 -out untitled.tt4 -err automake.err -log untitled.log -percent untitled.tte -mod stateMachine1  @untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" untitled.tte -o untitled.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci untitled.lct -out untitled.vct -log untitled.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open untitled.rsp w} rspFile] {
	puts stderr "Cannot create response file untitled.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"untitled.tt4\" -vci \"untitled.vct\" -log \"untitled.log\" -eqn \"untitled.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"NoInput.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@untitled.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete untitled.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci untitled.vco -out untitled.lco -log untitled.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj untitled -if untitled.jed -j2s -log untitled.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/30/18 10:03:33 ###########


########## Tcl recorder starts at 11/30/18 10:04:42 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
# Fit Design
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine1.edi -out stateMachine1.bl0 -err automake.err -log stateMachine1.log -prj untitled -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" stateMachine1.bl0 -collapse none -reduce none -keepwires  -err automake.err -family"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"stateMachine1.bl1\" -o \"untitled.bl2\" -omod \"untitled\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj untitled -lci untitled.lct -log untitled.imp -err automake.err -tti untitled.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -blifopt  untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" untitled.bl2 -sweep -mergefb -err automake.err -o untitled.bl3  @untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -diofft  untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" untitled.bl3 -pla -family AMDMACH -idev van -o untitled.tt2 -oxrf untitled.xrf -err automake.err  @untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj untitled -dir $proj_dir -log untitled.log -tti untitled.tt2 -tto untitled.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -prefit  untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp untitled.tt3 -out untitled.tt4 -err automake.err -log untitled.log -percent untitled.tte -mod stateMachine1  @untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" untitled.tte -o untitled.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci untitled.lct -out untitled.vct -log untitled.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open untitled.rsp w} rspFile] {
	puts stderr "Cannot create response file untitled.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"untitled.tt4\" -vci \"untitled.vct\" -log \"untitled.log\" -eqn \"untitled.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"NoInput.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@untitled.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete untitled.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci untitled.vco -out untitled.lco -log untitled.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj untitled -if untitled.jed -j2s -log untitled.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/30/18 10:04:42 ###########


########## Tcl recorder starts at 11/30/18 10:05:26 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/30/18 10:05:26 ###########


########## Tcl recorder starts at 11/30/18 10:05:38 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/30/18 10:05:38 ###########


########## Tcl recorder starts at 11/30/18 10:05:41 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
# Fit Design
if [catch {open stateMachine1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: untitled.sty
PROJECT: stateMachine1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine1
VHDL_FILE_LIST: clk_prescaler.vhd machina.vhd
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
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine1.edi -out stateMachine1.bl0 -err automake.err -log stateMachine1.log -prj untitled -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" stateMachine1.bl0 -collapse none -reduce none -keepwires  -err automake.err -family"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"stateMachine1.bl1\" -o \"untitled.bl2\" -omod \"untitled\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj untitled -lci untitled.lct -log untitled.imp -err automake.err -tti untitled.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -blifopt  untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" untitled.bl2 -sweep -mergefb -err automake.err -o untitled.bl3  @untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -diofft  untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" untitled.bl3 -pla -family AMDMACH -idev van -o untitled.tt2 -oxrf untitled.xrf -err automake.err  @untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj untitled -dir $proj_dir -log untitled.log -tti untitled.tt2 -tto untitled.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -prefit  untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp untitled.tt3 -out untitled.tt4 -err automake.err -log untitled.log -percent untitled.tte -mod stateMachine1  @untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" untitled.tte -o untitled.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci untitled.lct -out untitled.vct -log untitled.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open untitled.rsp w} rspFile] {
	puts stderr "Cannot create response file untitled.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"untitled.tt4\" -vci \"untitled.vct\" -log \"untitled.log\" -eqn \"untitled.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"NoInput.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@untitled.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete untitled.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci untitled.vco -out untitled.lco -log untitled.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj untitled -if untitled.jed -j2s -log untitled.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/30/18 10:05:41 ###########


########## Tcl recorder starts at 11/30/18 10:06:29 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/30/18 10:06:29 ###########


########## Tcl recorder starts at 11/30/18 10:06:43 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
# Fit Design
if [catch {open stateMachine1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: untitled.sty
PROJECT: stateMachine1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine1
VHDL_FILE_LIST: clk_prescaler.vhd machina.vhd
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
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine1.edi -out stateMachine1.bl0 -err automake.err -log stateMachine1.log -prj untitled -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" stateMachine1.bl0 -collapse none -reduce none -keepwires  -err automake.err -family"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"stateMachine1.bl1\" -o \"untitled.bl2\" -omod \"untitled\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj untitled -lci untitled.lct -log untitled.imp -err automake.err -tti untitled.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -blifopt  untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" untitled.bl2 -sweep -mergefb -err automake.err -o untitled.bl3  @untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -diofft  untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" untitled.bl3 -pla -family AMDMACH -idev van -o untitled.tt2 -oxrf untitled.xrf -err automake.err  @untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj untitled -dir $proj_dir -log untitled.log -tti untitled.tt2 -tto untitled.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -prefit  untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp untitled.tt3 -out untitled.tt4 -err automake.err -log untitled.log -percent untitled.tte -mod stateMachine1  @untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" untitled.tte -o untitled.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci untitled.lct -out untitled.vct -log untitled.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open untitled.rsp w} rspFile] {
	puts stderr "Cannot create response file untitled.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"untitled.tt4\" -vci \"untitled.vct\" -log \"untitled.log\" -eqn \"untitled.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"NoInput.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@untitled.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete untitled.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci untitled.vco -out untitled.lco -log untitled.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj untitled -if untitled.jed -j2s -log untitled.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/30/18 10:06:43 ###########


########## Tcl recorder starts at 11/30/18 10:07:58 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/30/18 10:07:58 ###########


########## Tcl recorder starts at 11/30/18 10:08:00 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
# Constraint Editor
if [catch {open stateMachine1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: untitled.sty
PROJECT: stateMachine1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine1
VHDL_FILE_LIST: clk_prescaler.vhd machina.vhd
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
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine1.edi -out stateMachine1.bl0 -err automake.err -log stateMachine1.log -prj untitled -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" stateMachine1.bl0 -collapse none -reduce none -keepwires  -err automake.err -family"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"stateMachine1.bl1\" -o \"untitled.bl2\" -omod \"untitled\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj untitled -lci untitled.lct -log untitled.imp -err automake.err -tti untitled.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -blifopt  untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" untitled.bl2 -sweep -mergefb -err automake.err -o untitled.bl3  @untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -diofft  untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" untitled.bl3 -pla -family AMDMACH -idev van -o untitled.tt2 -oxrf untitled.xrf -err automake.err  @untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj untitled -dir $proj_dir -log untitled.log -tti untitled.tt2 -tto untitled.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -prefit  untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp untitled.tt3 -out untitled.tt4 -err automake.err -log untitled.log -percent untitled.tte -mod stateMachine1  @untitled.l0"] {
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
	puts $rspFile "-src untitled.tt4 -type PLA -devfile \"$install_dir/ispcpld/dat/mach4a/mach463ace.dev\" -lci \"untitled.lct\" -touch \"untitled.tt4\"
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

########## Tcl recorder end at 11/30/18 10:08:00 ###########


########## Tcl recorder starts at 11/30/18 10:08:39 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
# JEDEC File
if [runCmd "\"$cpld_bin/blif2eqn\" untitled.tte -o untitled.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci untitled.lct -out untitled.vct -log untitled.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open untitled.rsp w} rspFile] {
	puts stderr "Cannot create response file untitled.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"untitled.tt4\" -vci \"untitled.vct\" -log \"untitled.log\" -eqn \"untitled.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"NoInput.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@untitled.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete untitled.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci untitled.vco -out untitled.lco -log untitled.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj untitled -if untitled.jed -j2s -log untitled.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/30/18 10:08:39 ###########


########## Tcl recorder starts at 11/30/18 10:09:21 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/30/18 10:09:22 ###########


########## Tcl recorder starts at 11/30/18 10:09:31 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
# Fit Design
if [catch {open stateMachine1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: untitled.sty
PROJECT: stateMachine1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine1
VHDL_FILE_LIST: clk_prescaler.vhd machina.vhd
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
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine1.edi -out stateMachine1.bl0 -err automake.err -log stateMachine1.log -prj untitled -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" stateMachine1.bl0 -collapse none -reduce none -keepwires  -err automake.err -family"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"stateMachine1.bl1\" -o \"untitled.bl2\" -omod \"untitled\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj untitled -lci untitled.lct -log untitled.imp -err automake.err -tti untitled.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -blifopt  untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" untitled.bl2 -sweep -mergefb -err automake.err -o untitled.bl3  @untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -diofft  untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" untitled.bl3 -pla -family AMDMACH -idev van -o untitled.tt2 -oxrf untitled.xrf -err automake.err  @untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj untitled -dir $proj_dir -log untitled.log -tti untitled.tt2 -tto untitled.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -prefit  untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp untitled.tt3 -out untitled.tt4 -err automake.err -log untitled.log -percent untitled.tte -mod stateMachine1  @untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" untitled.tte -o untitled.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci untitled.lct -out untitled.vct -log untitled.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open untitled.rsp w} rspFile] {
	puts stderr "Cannot create response file untitled.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"untitled.tt4\" -vci \"untitled.vct\" -log \"untitled.log\" -eqn \"untitled.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"NoInput.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@untitled.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete untitled.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci untitled.vco -out untitled.lco -log untitled.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj untitled -if untitled.jed -j2s -log untitled.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/30/18 10:09:31 ###########


########## Tcl recorder starts at 11/30/18 10:11:03 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/30/18 10:11:03 ###########


########## Tcl recorder starts at 11/30/18 10:11:07 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
# Fit Design
if [catch {open stateMachine1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: untitled.sty
PROJECT: stateMachine1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine1
VHDL_FILE_LIST: clk_prescaler.vhd machina.vhd
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
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine1.edi -out stateMachine1.bl0 -err automake.err -log stateMachine1.log -prj untitled -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" stateMachine1.bl0 -collapse none -reduce none -keepwires  -err automake.err -family"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"stateMachine1.bl1\" -o \"untitled.bl2\" -omod \"untitled\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj untitled -lci untitled.lct -log untitled.imp -err automake.err -tti untitled.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -blifopt  untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" untitled.bl2 -sweep -mergefb -err automake.err -o untitled.bl3  @untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -diofft  untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" untitled.bl3 -pla -family AMDMACH -idev van -o untitled.tt2 -oxrf untitled.xrf -err automake.err  @untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj untitled -dir $proj_dir -log untitled.log -tti untitled.tt2 -tto untitled.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -prefit  untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp untitled.tt3 -out untitled.tt4 -err automake.err -log untitled.log -percent untitled.tte -mod stateMachine1  @untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" untitled.tte -o untitled.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci untitled.lct -out untitled.vct -log untitled.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open untitled.rsp w} rspFile] {
	puts stderr "Cannot create response file untitled.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"untitled.tt4\" -vci \"untitled.vct\" -log \"untitled.log\" -eqn \"untitled.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"NoInput.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@untitled.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete untitled.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci untitled.vco -out untitled.lco -log untitled.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj untitled -if untitled.jed -j2s -log untitled.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/30/18 10:11:07 ###########


########## Tcl recorder starts at 11/30/18 10:11:47 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
if [runCmd "\"$cpld_bin/vhd2jhd\" machina.vhd -o machina.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/30/18 10:11:47 ###########


########## Tcl recorder starts at 11/30/18 10:11:51 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
# Fit Design
if [catch {open stateMachine1.cmd w} rspFile] {
	puts stderr "Cannot create response file stateMachine1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: untitled.sty
PROJECT: stateMachine1
WORKING_PATH: \"$proj_dir\"
MODULE: stateMachine1
VHDL_FILE_LIST: clk_prescaler.vhd machina.vhd
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
if [runCmd "\"$cpld_bin/edif2blf\" -edf stateMachine1.edi -out stateMachine1.bl0 -err automake.err -log stateMachine1.log -prj untitled -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" stateMachine1.bl0 -collapse none -reduce none -keepwires  -err automake.err -family"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"stateMachine1.bl1\" -o \"untitled.bl2\" -omod \"untitled\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj untitled -lci untitled.lct -log untitled.imp -err automake.err -tti untitled.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -blifopt  untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" untitled.bl2 -sweep -mergefb -err automake.err -o untitled.bl3  @untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -diofft  untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" untitled.bl3 -pla -family AMDMACH -idev van -o untitled.tt2 -oxrf untitled.xrf -err automake.err  @untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj untitled -dir $proj_dir -log untitled.log -tti untitled.tt2 -tto untitled.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -prefit  untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp untitled.tt3 -out untitled.tt4 -err automake.err -log untitled.log -percent untitled.tte -mod stateMachine1  @untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" untitled.tte -o untitled.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci untitled.lct -out untitled.vct -log untitled.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open untitled.rsp w} rspFile] {
	puts stderr "Cannot create response file untitled.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"untitled.tt4\" -vci \"untitled.vct\" -log \"untitled.log\" -eqn \"untitled.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"NoInput.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@untitled.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete untitled.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci untitled.vco -out untitled.lco -log untitled.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj untitled -if untitled.jed -j2s -log untitled.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/30/18 10:11:51 ###########


########## Tcl recorder starts at 11/30/18 10:13:39 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
# Constraint Editor
# - none -
# Application to view the Process: 
# Constraint Editor
if [catch {open lattice_cmd.rs2 w} rspFile] {
	puts stderr "Cannot create response file lattice_cmd.rs2: $rspFile"
} else {
	puts $rspFile "-src untitled.tt4 -type PLA -devfile \"$install_dir/ispcpld/dat/mach4a/mach463ace.dev\" -lci \"untitled.lct\" -touch \"untitled.tt4\"
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

########## Tcl recorder end at 11/30/18 10:13:39 ###########


########## Tcl recorder starts at 11/30/18 10:14:03 ##########

set version "2.0"
set proj_dir "D:/ispLEVER Projects/zadanie_stateMachine"
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
# Fit Design
if [runCmd "\"$cpld_bin/blif2eqn\" untitled.tte -o untitled.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci untitled.lct -out untitled.vct -log untitled.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open untitled.rsp w} rspFile] {
	puts stderr "Cannot create response file untitled.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"untitled.tt4\" -vci \"untitled.vct\" -log \"untitled.log\" -eqn \"untitled.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"NoInput.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@untitled.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete untitled.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci untitled.vco -out untitled.lco -log untitled.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj untitled -if untitled.jed -j2s -log untitled.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/30/18 10:14:03 ###########

