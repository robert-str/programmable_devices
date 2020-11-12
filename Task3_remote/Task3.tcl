
########## Tcl recorder starts at 10/29/20 12:33:36 ##########

set version "2.0"
set proj_dir "C:/ispLever_prj/Task3"
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
if [runCmd "\"$cpld_bin/vhd2jhd\" adder.vhd -o adder.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 10/29/20 12:33:36 ###########


########## Tcl recorder starts at 10/29/20 13:40:36 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" adder.vhd -o adder.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 10/29/20 13:40:36 ###########


########## Tcl recorder starts at 10/29/20 20:57:54 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" adder.vhd -o adder.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 10/29/20 20:57:54 ###########


########## Tcl recorder starts at 10/29/20 20:57:58 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open adder.cmd w} rspFile] {
	puts stderr "Cannot create response file adder.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task3.sty
PROJECT: adder
WORKING_PATH: \"$proj_dir\"
MODULE: adder
VHDL_FILE_LIST: adder.vhd
OUTPUT_FILE_NAME: adder
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e adder -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete adder.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf adder.edi -out adder.bl0 -err automake.err -log adder.log -prj task3 -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 10/29/20 20:57:58 ###########


########## Tcl recorder starts at 10/29/20 20:58:34 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" adder.vhd -o adder.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 10/29/20 20:58:34 ###########


########## Tcl recorder starts at 10/29/20 20:58:35 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open adder.cmd w} rspFile] {
	puts stderr "Cannot create response file adder.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task3.sty
PROJECT: adder
WORKING_PATH: \"$proj_dir\"
MODULE: adder
VHDL_FILE_LIST: adder.vhd
OUTPUT_FILE_NAME: adder
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e adder -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete adder.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf adder.edi -out adder.bl0 -err automake.err -log adder.log -prj task3 -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 10/29/20 20:58:35 ###########


########## Tcl recorder starts at 10/29/20 20:59:08 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" adder.vhd -o adder.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 10/29/20 20:59:08 ###########


########## Tcl recorder starts at 10/29/20 20:59:10 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open adder.cmd w} rspFile] {
	puts stderr "Cannot create response file adder.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task3.sty
PROJECT: adder
WORKING_PATH: \"$proj_dir\"
MODULE: adder
VHDL_FILE_LIST: adder.vhd
OUTPUT_FILE_NAME: adder
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e adder -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete adder.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf adder.edi -out adder.bl0 -err automake.err -log adder.log -prj task3 -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 10/29/20 20:59:10 ###########


########## Tcl recorder starts at 10/29/20 20:59:33 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" adder.vhd -o adder.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 10/29/20 20:59:33 ###########


########## Tcl recorder starts at 10/29/20 20:59:35 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" adder.vhd -o adder.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 10/29/20 20:59:35 ###########


########## Tcl recorder starts at 10/29/20 20:59:40 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open adder.cmd w} rspFile] {
	puts stderr "Cannot create response file adder.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task3.sty
PROJECT: adder
WORKING_PATH: \"$proj_dir\"
MODULE: adder
VHDL_FILE_LIST: adder.vhd
OUTPUT_FILE_NAME: adder
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e adder -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete adder.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf adder.edi -out adder.bl0 -err automake.err -log adder.log -prj task3 -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 10/29/20 20:59:40 ###########


########## Tcl recorder starts at 10/29/20 21:00:10 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" adder.vhd -o adder.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 10/29/20 21:00:10 ###########


########## Tcl recorder starts at 10/29/20 21:00:11 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open adder.cmd w} rspFile] {
	puts stderr "Cannot create response file adder.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task3.sty
PROJECT: adder
WORKING_PATH: \"$proj_dir\"
MODULE: adder
VHDL_FILE_LIST: adder.vhd
OUTPUT_FILE_NAME: adder
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e adder -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete adder.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf adder.edi -out adder.bl0 -err automake.err -log adder.log -prj task3 -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 10/29/20 21:00:11 ###########


########## Tcl recorder starts at 10/29/20 21:01:37 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" adder.vhd -o adder.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 10/29/20 21:01:37 ###########


########## Tcl recorder starts at 10/29/20 21:01:40 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open adder.cmd w} rspFile] {
	puts stderr "Cannot create response file adder.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task3.sty
PROJECT: adder
WORKING_PATH: \"$proj_dir\"
MODULE: adder
VHDL_FILE_LIST: adder.vhd
OUTPUT_FILE_NAME: adder
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e adder -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete adder.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf adder.edi -out adder.bl0 -err automake.err -log adder.log -prj task3 -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 10/29/20 21:01:40 ###########


########## Tcl recorder starts at 10/29/20 21:03:01 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" adder.vhd -o adder.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 10/29/20 21:03:01 ###########


########## Tcl recorder starts at 10/29/20 21:03:04 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" adder.vhd -o adder.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 10/29/20 21:03:04 ###########


########## Tcl recorder starts at 10/29/20 21:03:06 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open adder.cmd w} rspFile] {
	puts stderr "Cannot create response file adder.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task3.sty
PROJECT: adder
WORKING_PATH: \"$proj_dir\"
MODULE: adder
VHDL_FILE_LIST: adder.vhd
OUTPUT_FILE_NAME: adder
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e adder -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete adder.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf adder.edi -out adder.bl0 -err automake.err -log adder.log -prj task3 -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 10/29/20 21:03:06 ###########


########## Tcl recorder starts at 10/29/20 21:07:04 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" adder.vhd -o adder.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 10/29/20 21:07:04 ###########


########## Tcl recorder starts at 10/29/20 21:07:28 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" adder.vhd -o adder.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 10/29/20 21:07:28 ###########


########## Tcl recorder starts at 10/29/20 21:07:30 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open adder.cmd w} rspFile] {
	puts stderr "Cannot create response file adder.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task3.sty
PROJECT: adder
WORKING_PATH: \"$proj_dir\"
MODULE: adder
VHDL_FILE_LIST: adder.vhd
OUTPUT_FILE_NAME: adder
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e adder -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete adder.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf adder.edi -out adder.bl0 -err automake.err -log adder.log -prj task3 -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 10/29/20 21:07:30 ###########


########## Tcl recorder starts at 10/29/20 21:09:19 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" adder.vhd -o adder.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 10/29/20 21:09:19 ###########


########## Tcl recorder starts at 10/29/20 21:09:23 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open adder.cmd w} rspFile] {
	puts stderr "Cannot create response file adder.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task3.sty
PROJECT: adder
WORKING_PATH: \"$proj_dir\"
MODULE: adder
VHDL_FILE_LIST: adder.vhd
OUTPUT_FILE_NAME: adder
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e adder -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete adder.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf adder.edi -out adder.bl0 -err automake.err -log adder.log -prj task3 -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 10/29/20 21:09:23 ###########


########## Tcl recorder starts at 10/29/20 21:10:00 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" adder.vhd -o adder.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 10/29/20 21:10:00 ###########


########## Tcl recorder starts at 10/29/20 21:10:01 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open adder.cmd w} rspFile] {
	puts stderr "Cannot create response file adder.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task3.sty
PROJECT: adder
WORKING_PATH: \"$proj_dir\"
MODULE: adder
VHDL_FILE_LIST: adder.vhd
OUTPUT_FILE_NAME: adder
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e adder -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete adder.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf adder.edi -out adder.bl0 -err automake.err -log adder.log -prj task3 -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 10/29/20 21:10:01 ###########


########## Tcl recorder starts at 10/29/20 21:11:42 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" adder.vhd -o adder.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 10/29/20 21:11:42 ###########


########## Tcl recorder starts at 10/29/20 21:11:48 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open adder.cmd w} rspFile] {
	puts stderr "Cannot create response file adder.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task3.sty
PROJECT: adder
WORKING_PATH: \"$proj_dir\"
MODULE: adder
VHDL_FILE_LIST: adder.vhd
OUTPUT_FILE_NAME: adder
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e adder -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete adder.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf adder.edi -out adder.bl0 -err automake.err -log adder.log -prj task3 -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 10/29/20 21:11:48 ###########


########## Tcl recorder starts at 10/29/20 21:12:00 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" adder.vhd -o adder.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 10/29/20 21:12:00 ###########


########## Tcl recorder starts at 10/29/20 21:12:03 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open adder.cmd w} rspFile] {
	puts stderr "Cannot create response file adder.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task3.sty
PROJECT: adder
WORKING_PATH: \"$proj_dir\"
MODULE: adder
VHDL_FILE_LIST: adder.vhd
OUTPUT_FILE_NAME: adder
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e adder -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete adder.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf adder.edi -out adder.bl0 -err automake.err -log adder.log -prj task3 -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 10/29/20 21:12:03 ###########


########## Tcl recorder starts at 10/29/20 21:12:17 ##########

# Commands to make the Process: 
# VHDL Test Bench Template
if [runCmd "\"$cpld_bin/vhd2naf\" -tfi -proj task3 -mod adder -out adder -tpl \"$install_dir/ispcpld/generic/vhdl/testbnch.tft\" -ext vht adder.vhd"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 10/29/20 21:12:17 ###########


########## Tcl recorder starts at 10/29/20 21:14:04 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
if [catch {open udo.rsp w} rspFile] {
	puts stderr "Cannot create response file udo.rsp: $rspFile"
} else {
	puts $rspFile "# ispDesignExpert VHDL Functional Simulation Template: tb_adder_vhdaf.udo.
# You may edit this file to control your simulation.
# You may specify your design unit.
# You may specify your waveforms.
add wave *
# You may specify your simulation run time.
run 1000 ns
"
	close $rspFile
}
if [catch {open tb_adder.rsp w} rspFile] {
	puts stderr "Cannot create response file tb_adder.rsp: $rspFile"
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
#prjInfo task3.sty
#do 
#vcomSrc  adder.vhd
#vcom tb_adder.vhd
#stimulus vhdl adder tb_adder.vhd
#insert vsim +access +r %<StimModule>%
#youdo tb_adder_vhdaf.udo
#insert # End
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" tb_adder.rsp tb_adder.fado udo.rsp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete udo.rsp
file delete tb_adder.rsp
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_adder_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_adder_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_adder.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_adder_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 10/29/20 21:14:04 ###########


########## Tcl recorder starts at 10/29/20 21:16:40 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" adder2x3.vhd -o adder2x3.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 10/29/20 21:16:40 ###########


########## Tcl recorder starts at 10/29/20 21:17:01 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" adder2x3.vhd -o adder2x3.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 10/29/20 21:17:01 ###########


########## Tcl recorder starts at 10/29/20 21:17:25 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" adder2x3.vhd -o adder2x3.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 10/29/20 21:17:25 ###########


########## Tcl recorder starts at 10/29/20 21:17:36 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" adder2x3.vhd -o adder2x3.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 10/29/20 21:17:36 ###########


########## Tcl recorder starts at 10/29/20 21:19:19 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" adder2x3.vhd -o adder2x3.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 10/29/20 21:19:19 ###########


########## Tcl recorder starts at 10/29/20 21:20:43 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" adder2x3.vhd -o adder2x3.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 10/29/20 21:20:43 ###########


########## Tcl recorder starts at 10/29/20 21:20:47 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open adder2x3.cmd w} rspFile] {
	puts stderr "Cannot create response file adder2x3.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task3.sty
PROJECT: adder2x3
WORKING_PATH: \"$proj_dir\"
MODULE: adder2x3
VHDL_FILE_LIST: adder.vhd adder2x3.vhd
OUTPUT_FILE_NAME: adder2x3
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e adder2x3 -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete adder2x3.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf adder2x3.edi -out adder2x3.bl0 -err automake.err -log adder2x3.log -prj task3 -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 10/29/20 21:20:47 ###########


########## Tcl recorder starts at 10/29/20 21:21:07 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" adder2x3.vhd -o adder2x3.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 10/29/20 21:21:07 ###########


########## Tcl recorder starts at 10/29/20 21:21:07 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open adder2x3.cmd w} rspFile] {
	puts stderr "Cannot create response file adder2x3.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task3.sty
PROJECT: adder2x3
WORKING_PATH: \"$proj_dir\"
MODULE: adder2x3
VHDL_FILE_LIST: adder.vhd adder2x3.vhd
OUTPUT_FILE_NAME: adder2x3
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e adder2x3 -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete adder2x3.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf adder2x3.edi -out adder2x3.bl0 -err automake.err -log adder2x3.log -prj task3 -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 10/29/20 21:21:07 ###########


########## Tcl recorder starts at 10/29/20 21:36:42 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" adder2x3.vhd -o adder2x3.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 10/29/20 21:36:42 ###########


########## Tcl recorder starts at 10/29/20 21:36:44 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open adder2x3.cmd w} rspFile] {
	puts stderr "Cannot create response file adder2x3.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task3.sty
PROJECT: adder2x3
WORKING_PATH: \"$proj_dir\"
MODULE: adder2x3
VHDL_FILE_LIST: adder.vhd adder2x3.vhd
OUTPUT_FILE_NAME: adder2x3
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e adder2x3 -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete adder2x3.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf adder2x3.edi -out adder2x3.bl0 -err automake.err -log adder2x3.log -prj task3 -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 10/29/20 21:36:44 ###########


########## Tcl recorder starts at 10/29/20 21:37:01 ##########

# Commands to make the Process: 
# VHDL Test Bench Template
if [runCmd "\"$cpld_bin/vhd2naf\" -tfi -proj task3 -mod adder2x3 -out adder2x3 -tpl \"$install_dir/ispcpld/generic/vhdl/testbnch.tft\" -ext vht adder2x3.vhd"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 10/29/20 21:37:01 ###########


########## Tcl recorder starts at 10/29/20 23:31:58 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
if [catch {open udo.rsp w} rspFile] {
	puts stderr "Cannot create response file udo.rsp: $rspFile"
} else {
	puts $rspFile "# ispDesignExpert VHDL Functional Simulation Template: tb_adder2x3_vhdaf.udo.
# You may edit this file to control your simulation.
# You may specify your design unit.
# You may specify your waveforms.
add wave *
# You may specify your simulation run time.
run 1000 ns
"
	close $rspFile
}
if [catch {open tb_adder2x3.rsp w} rspFile] {
	puts stderr "Cannot create response file tb_adder2x3.rsp: $rspFile"
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
#prjInfo task3.sty
#do 
#vcomSrc  adder.vhd adder2x3.vhd
#vcom tb_adder2x3.vhd
#stimulus vhdl adder2x3 tb_adder2x3.vhd
#insert vsim +access +r %<StimModule>%
#youdo tb_adder2x3_vhdaf.udo
#insert # End
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" tb_adder2x3.rsp tb_adder2x3.fado udo.rsp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete udo.rsp
file delete tb_adder2x3.rsp
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_adder2x3_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_adder2x3_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_adder2x3.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_adder2x3_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 10/29/20 23:31:58 ###########


########## Tcl recorder starts at 11/02/20 11:06:50 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" multip2.vhd -o multip2.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/02/20 11:06:50 ###########


########## Tcl recorder starts at 11/02/20 11:07:52 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" multip2.vhd -o multip2.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/02/20 11:07:52 ###########


########## Tcl recorder starts at 11/02/20 11:07:57 ##########

# Commands to make the Process: 
# Compiled Equations
if [catch {open multip2.cmd w} rspFile] {
	puts stderr "Cannot create response file multip2.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task3.sty
PROJECT: multip2
WORKING_PATH: \"$proj_dir\"
MODULE: multip2
VHDL_FILE_LIST: multip2.vhd
OUTPUT_FILE_NAME: multip2
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e multip2 -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete multip2.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf multip2.edi -out multip2.bl0 -err automake.err -log multip2.log -prj task3 -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" multip2.bl0 -o multip2.eq0  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/02/20 11:07:57 ###########


########## Tcl recorder starts at 11/02/20 11:09:55 ##########

# Commands to make the Process: 
# VHDL Test Bench Template
if [runCmd "\"$cpld_bin/vhd2naf\" -tfi -proj task3 -mod multip2 -out multip2 -tpl \"$install_dir/ispcpld/generic/vhdl/testbnch.tft\" -ext vht multip2.vhd"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/02/20 11:09:55 ###########


########## Tcl recorder starts at 11/02/20 11:12:27 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
if [catch {open udo.rsp w} rspFile] {
	puts stderr "Cannot create response file udo.rsp: $rspFile"
} else {
	puts $rspFile "# ispDesignExpert VHDL Functional Simulation Template: tb_multip2_vhdaf.udo.
# You may edit this file to control your simulation.
# You may specify your design unit.
# You may specify your waveforms.
add wave *
# You may specify your simulation run time.
run 1000 ns
"
	close $rspFile
}
if [catch {open tb_multip2.rsp w} rspFile] {
	puts stderr "Cannot create response file tb_multip2.rsp: $rspFile"
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
#prjInfo task3.sty
#do 
#vcomSrc  multip2.vhd
#vcom tb_multip2.vhd
#stimulus vhdl multip2 tb_multip2.vhd
#insert vsim +access +r %<StimModule>%
#youdo tb_multip2_vhdaf.udo
#insert # End
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" tb_multip2.rsp tb_multip2.fado udo.rsp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete udo.rsp
file delete tb_multip2.rsp
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_multip2_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_multip2_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_multip2.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_multip2_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/02/20 11:12:27 ###########


########## Tcl recorder starts at 11/05/20 09:30:22 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" as.vhd -o as.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/05/20 09:30:22 ###########


########## Tcl recorder starts at 11/12/20 06:33:45 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" adder1.vhd -o adder1.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 06:33:45 ###########


########## Tcl recorder starts at 11/12/20 06:34:50 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" adder1.vhd -o adder1.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 06:34:50 ###########


########## Tcl recorder starts at 11/12/20 06:34:56 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open adder1.cmd w} rspFile] {
	puts stderr "Cannot create response file adder1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task3.sty
PROJECT: adder1
WORKING_PATH: \"$proj_dir\"
MODULE: adder1
VHDL_FILE_LIST: adder1.vhd
OUTPUT_FILE_NAME: adder1
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e adder1 -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete adder1.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf adder1.edi -out adder1.bl0 -err automake.err -log adder1.log -prj task3 -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 06:34:56 ###########


########## Tcl recorder starts at 11/12/20 06:37:57 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" adder1.vhd -o adder1.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 06:37:57 ###########


########## Tcl recorder starts at 11/12/20 06:37:59 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open adder1.cmd w} rspFile] {
	puts stderr "Cannot create response file adder1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task3.sty
PROJECT: adder1
WORKING_PATH: \"$proj_dir\"
MODULE: adder1
VHDL_FILE_LIST: adder1.vhd
OUTPUT_FILE_NAME: adder1
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e adder1 -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete adder1.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf adder1.edi -out adder1.bl0 -err automake.err -log adder1.log -prj task3 -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 06:37:59 ###########


########## Tcl recorder starts at 11/12/20 06:38:20 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" adder1.vhd -o adder1.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 06:38:21 ###########


########## Tcl recorder starts at 11/12/20 06:38:23 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open adder1.cmd w} rspFile] {
	puts stderr "Cannot create response file adder1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task3.sty
PROJECT: adder1
WORKING_PATH: \"$proj_dir\"
MODULE: adder1
VHDL_FILE_LIST: adder1.vhd
OUTPUT_FILE_NAME: adder1
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e adder1 -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete adder1.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf adder1.edi -out adder1.bl0 -err automake.err -log adder1.log -prj task3 -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 06:38:23 ###########


########## Tcl recorder starts at 11/12/20 06:39:03 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" adder1.vhd -o adder1.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 06:39:03 ###########


########## Tcl recorder starts at 11/12/20 06:39:05 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open adder1.cmd w} rspFile] {
	puts stderr "Cannot create response file adder1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task3.sty
PROJECT: adder1
WORKING_PATH: \"$proj_dir\"
MODULE: adder1
VHDL_FILE_LIST: adder1.vhd
OUTPUT_FILE_NAME: adder1
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e adder1 -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete adder1.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf adder1.edi -out adder1.bl0 -err automake.err -log adder1.log -prj task3 -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 06:39:05 ###########


########## Tcl recorder starts at 11/12/20 06:40:54 ##########

# Commands to make the Process: 
# VHDL Test Bench Template
if [runCmd "\"$cpld_bin/vhd2naf\" -tfi -proj task3 -mod adder1 -out adder1 -tpl \"$install_dir/ispcpld/generic/vhdl/testbnch.tft\" -ext vht adder1.vhd"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 06:40:54 ###########


########## Tcl recorder starts at 11/12/20 06:42:10 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
if [catch {open udo.rsp w} rspFile] {
	puts stderr "Cannot create response file udo.rsp: $rspFile"
} else {
	puts $rspFile "# ispDesignExpert VHDL Functional Simulation Template: tb_adder1_vhdaf.udo.
# You may edit this file to control your simulation.
# You may specify your design unit.
# You may specify your waveforms.
add wave *
# You may specify your simulation run time.
run 1000 ns
"
	close $rspFile
}
if [catch {open tb_adder1.rsp w} rspFile] {
	puts stderr "Cannot create response file tb_adder1.rsp: $rspFile"
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
#prjInfo task3.sty
#do 
#vcomSrc  adder1.vhd
#vcom tb_adder1.vhd
#stimulus vhdl adder1 tb_adder1.vhd
#insert vsim +access +r %<StimModule>%
#youdo tb_adder1_vhdaf.udo
#insert # End
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" tb_adder1.rsp tb_adder1.fado udo.rsp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete udo.rsp
file delete tb_adder1.rsp
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_adder1_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_adder1_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_adder1.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_adder1_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 06:42:10 ###########


########## Tcl recorder starts at 11/12/20 06:43:37 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" adder2.vhd -o adder2.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 06:43:37 ###########


########## Tcl recorder starts at 11/12/20 06:43:48 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" adder2.vhd -o adder2.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 06:43:48 ###########


########## Tcl recorder starts at 11/12/20 06:43:56 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" adder1.vhd -o adder1.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 06:43:56 ###########


########## Tcl recorder starts at 11/12/20 06:44:01 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" adder2.vhd -o adder2.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 06:44:01 ###########


########## Tcl recorder starts at 11/12/20 07:02:32 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" adder2.vhd -o adder2.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 07:02:32 ###########


########## Tcl recorder starts at 11/12/20 07:02:39 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open adder2.cmd w} rspFile] {
	puts stderr "Cannot create response file adder2.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task3.sty
PROJECT: adder2
WORKING_PATH: \"$proj_dir\"
MODULE: adder2
VHDL_FILE_LIST: adder2.vhd
OUTPUT_FILE_NAME: adder2
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e adder2 -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete adder2.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf adder2.edi -out adder2.bl0 -err automake.err -log adder2.log -prj task3 -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 07:02:39 ###########


########## Tcl recorder starts at 11/12/20 07:03:16 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" adder2.vhd -o adder2.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 07:03:16 ###########


########## Tcl recorder starts at 11/12/20 07:03:19 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open adder2.cmd w} rspFile] {
	puts stderr "Cannot create response file adder2.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task3.sty
PROJECT: adder2
WORKING_PATH: \"$proj_dir\"
MODULE: adder2
VHDL_FILE_LIST: adder2.vhd
OUTPUT_FILE_NAME: adder2
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e adder2 -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete adder2.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf adder2.edi -out adder2.bl0 -err automake.err -log adder2.log -prj task3 -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 07:03:19 ###########


########## Tcl recorder starts at 11/12/20 07:07:33 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
if [catch {open udo.rsp w} rspFile] {
	puts stderr "Cannot create response file udo.rsp: $rspFile"
} else {
	puts $rspFile "# ispDesignExpert VHDL Functional Simulation Template: tb_adder2_vhdaf.udo.
# You may edit this file to control your simulation.
# You may specify your design unit.
# You may specify your waveforms.
add wave *
# You may specify your simulation run time.
run 1000 ns
"
	close $rspFile
}
if [catch {open tb_adder2.rsp w} rspFile] {
	puts stderr "Cannot create response file tb_adder2.rsp: $rspFile"
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
#prjInfo task3.sty
#do 
#vcomSrc  adder2.vhd
#vcom tb_adder2.vhd
#stimulus vhdl adder2 tb_adder2.vhd
#insert vsim +access +r %<StimModule>%
#youdo tb_adder2_vhdaf.udo
#insert # End
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" tb_adder2.rsp tb_adder2.fado udo.rsp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete udo.rsp
file delete tb_adder2.rsp
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_adder2_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_adder2_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_adder2.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_adder2_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 07:07:33 ###########


########## Tcl recorder starts at 11/12/20 07:08:36 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
if [catch {open udo.rsp w} rspFile] {
	puts stderr "Cannot create response file udo.rsp: $rspFile"
} else {
	puts $rspFile "# ispDesignExpert VHDL Functional Simulation Template: tb_adder2_vhdaf.udo.
# You may edit this file to control your simulation.
# You may specify your design unit.
# You may specify your waveforms.
add wave *
# You may specify your simulation run time.
run 1000 ns
"
	close $rspFile
}
if [catch {open tb_adder2.rsp w} rspFile] {
	puts stderr "Cannot create response file tb_adder2.rsp: $rspFile"
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
#prjInfo task3.sty
#do 
#vcomSrc  adder2.vhd
#vcom tb_adder2.vhd
#stimulus vhdl adder2 tb_adder2.vhd
#insert vsim +access +r %<StimModule>%
#youdo tb_adder2_vhdaf.udo
#insert # End
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" tb_adder2.rsp tb_adder2.fado udo.rsp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete udo.rsp
file delete tb_adder2.rsp
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_adder2_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_adder2_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_adder2.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_adder2_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 07:08:36 ###########


########## Tcl recorder starts at 11/12/20 07:09:24 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" adder2.vhd -o adder2.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 07:09:24 ###########


########## Tcl recorder starts at 11/12/20 07:09:45 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
if [catch {open udo.rsp w} rspFile] {
	puts stderr "Cannot create response file udo.rsp: $rspFile"
} else {
	puts $rspFile "# ispDesignExpert VHDL Functional Simulation Template: tb_adder2_vhdaf.udo.
# You may edit this file to control your simulation.
# You may specify your design unit.
# You may specify your waveforms.
add wave *
# You may specify your simulation run time.
run 1000 ns
"
	close $rspFile
}
if [catch {open tb_adder2.rsp w} rspFile] {
	puts stderr "Cannot create response file tb_adder2.rsp: $rspFile"
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
#prjInfo task3.sty
#do 
#vcomSrc  adder2.vhd
#vcom tb_adder2.vhd
#stimulus vhdl adder2 tb_adder2.vhd
#insert vsim +access +r %<StimModule>%
#youdo tb_adder2_vhdaf.udo
#insert # End
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" tb_adder2.rsp tb_adder2.fado udo.rsp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete udo.rsp
file delete tb_adder2.rsp
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_adder2_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_adder2_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_adder2.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_adder2_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 07:09:45 ###########


########## Tcl recorder starts at 11/12/20 07:11:52 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" fulladder2x3.vhd -o fulladder2x3.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 07:11:52 ###########


########## Tcl recorder starts at 11/12/20 07:12:05 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" fulladder2x3.vhd -o fulladder2x3.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 07:12:05 ###########


########## Tcl recorder starts at 11/12/20 07:12:31 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" fulladder2x3.vhd -o fulladder2x3.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 07:12:31 ###########


########## Tcl recorder starts at 11/12/20 07:12:53 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" fulladder2x3.vhd -o fulladder2x3.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 07:12:53 ###########


########## Tcl recorder starts at 11/12/20 07:12:57 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" fulladder2x3.vhd -o fulladder2x3.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 07:12:57 ###########


########## Tcl recorder starts at 11/12/20 07:13:51 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" fulladder2x3.vhd -o fulladder2x3.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 07:13:51 ###########


########## Tcl recorder starts at 11/12/20 07:15:46 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" fulladder2x3.vhd -o fulladder2x3.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 07:15:46 ###########


########## Tcl recorder starts at 11/12/20 07:15:50 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open fullAdder2x3.cmd w} rspFile] {
	puts stderr "Cannot create response file fullAdder2x3.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task3.sty
PROJECT: fullAdder2x3
WORKING_PATH: \"$proj_dir\"
MODULE: fullAdder2x3
VHDL_FILE_LIST: adder1.vhd fulladder2x3.vhd
OUTPUT_FILE_NAME: fullAdder2x3
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e fullAdder2x3 -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete fullAdder2x3.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf fullAdder2x3.edi -out fullAdder2x3.bl0 -err automake.err -log fullAdder2x3.log -prj task3 -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 07:15:50 ###########


########## Tcl recorder starts at 11/12/20 07:16:10 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" adder1.vhd -o adder1.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 07:16:10 ###########


########## Tcl recorder starts at 11/12/20 07:16:12 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open fullAdder2x3.cmd w} rspFile] {
	puts stderr "Cannot create response file fullAdder2x3.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task3.sty
PROJECT: fullAdder2x3
WORKING_PATH: \"$proj_dir\"
MODULE: fullAdder2x3
VHDL_FILE_LIST: adder1.vhd fulladder2x3.vhd
OUTPUT_FILE_NAME: fullAdder2x3
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e fullAdder2x3 -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete fullAdder2x3.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf fullAdder2x3.edi -out fullAdder2x3.bl0 -err automake.err -log fullAdder2x3.log -prj task3 -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 07:16:12 ###########


########## Tcl recorder starts at 11/12/20 07:17:11 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" fulladder2x3.vhd -o fulladder2x3.jhd -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 07:17:11 ###########


########## Tcl recorder starts at 11/12/20 07:17:13 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open fullAdder2x3.cmd w} rspFile] {
	puts stderr "Cannot create response file fullAdder2x3.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: task3.sty
PROJECT: fullAdder2x3
WORKING_PATH: \"$proj_dir\"
MODULE: fullAdder2x3
VHDL_FILE_LIST: adder1.vhd fulladder2x3.vhd
OUTPUT_FILE_NAME: fullAdder2x3
SUFFIX_NAME: edi
PART: M4A5-64/32-10JC
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e fullAdder2x3 -target mach -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete fullAdder2x3.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf fullAdder2x3.edi -out fullAdder2x3.bl0 -err automake.err -log fullAdder2x3.log -prj task3 -lib \"$install_dir/ispcpld/dat/mach.edn\" -net_Vcc VCC -net_GND GND -nbx -dse -tlw -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 07:17:13 ###########


########## Tcl recorder starts at 11/12/20 07:18:45 ##########

# Commands to make the Process: 
# VHDL Test Bench Template
if [runCmd "\"$cpld_bin/vhd2naf\" -tfi -proj task3 -mod fullAdder2x3 -out fullAdder2x3 -tpl \"$install_dir/ispcpld/generic/vhdl/testbnch.tft\" -ext vht fulladder2x3.vhd"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 07:18:45 ###########


########## Tcl recorder starts at 11/12/20 07:20:23 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
if [catch {open udo.rsp w} rspFile] {
	puts stderr "Cannot create response file udo.rsp: $rspFile"
} else {
	puts $rspFile "# ispDesignExpert VHDL Functional Simulation Template: tb_fulladder2x3_vhdaf.udo.
# You may edit this file to control your simulation.
# You may specify your design unit.
# You may specify your waveforms.
add wave *
# You may specify your simulation run time.
run 1000 ns
"
	close $rspFile
}
if [catch {open tb_fulladder2x3.rsp w} rspFile] {
	puts stderr "Cannot create response file tb_fulladder2x3.rsp: $rspFile"
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
#prjInfo task3.sty
#do 
#vcomSrc  adder1.vhd fulladder2x3.vhd
#vcom tb_fulladder2x3.vhd
#stimulus vhdl fullAdder2x3 tb_fulladder2x3.vhd
#insert vsim +access +r %<StimModule>%
#youdo tb_fulladder2x3_vhdaf.udo
#insert # End
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" tb_fulladder2x3.rsp tb_fulladder2x3.fado udo.rsp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete udo.rsp
file delete tb_fulladder2x3.rsp
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open tb_fulladder2x3_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file tb_fulladder2x3_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl tb_fulladder2x3.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"tb_fulladder2x3_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 11/12/20 07:20:23 ###########

