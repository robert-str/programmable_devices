[DEVICE]

Family = M4A5;
PartType = M4A5-64/32;
Package = 44PLCC;
PartNumber = M4A5-64/32-10JC;
Speed = -10;
Operating_condition = COM;
EN_Segment = NO;
Pin_MC_1to1 = NO;
Voltage = 5.0;

[REVISION]

RCS = "$Revision: 1.2 $";
Parent = m4a5.lci;
SDS_file = m4a5.sds;
Design = untitled.tt4;
Rev = 0.01;
DATE = 11/30/18;
TIME = 10:14:03;
Type = TT2;
Pre_Fit_Time = 1;
Source_Format = Pure_VHDL;

[IGNORE ASSIGNMENTS]

Pin_Assignments = NO;
Pin_Keep_Block = NO;
Pin_Keep_Segment = NO;
Group_Assignments = NO;
Macrocell_Assignments = NO;
Macrocell_Keep_Block = NO;
Macrocell_Keep_Segment = NO;
Pin_Reservation = NO;
Timing_Constraints = NO;
Block_Reservation = NO;
Segment_Reservation = NO;
Ignore_Source_Location = NO;
Ignore_Source_Optimization = NO;
Ignore_Source_Timing = NO;

[CLEAR ASSIGNMENTS]

Pin_Assignments = NO;
Pin_Keep_Block = NO;
Pin_Keep_Segment = NO;
Group_Assignments = NO;
Macrocell_Assignments = NO;
Macrocell_Keep_Block = NO;
Macrocell_Keep_Segment = NO;
Pin_Reservation = NO;
Timing_Constraints = NO;
Block_Reservation = NO;
Segment_Reservation = NO;
Ignore_Source_Location = NO;
Ignore_Source_Optimization = NO;
Ignore_Source_Timing = NO;

[BACKANNOTATE NETLIST]

Netlist = VHDL;
Delay_File = SDF;
Generic_VCC = ;
Generic_GND = ;

[BACKANNOTATE ASSIGNMENTS]

Pin_Assignment = NO;
Pin_Block = NO;
Pin_Macrocell_Block = NO;
Routing = NO;

[GLOBAL PROJECT OPTIMIZATION]

Balanced_Partitioning = YES;
Spread_Placement = YES;
Max_Pin_Percent = 100;
Max_Macrocell_Percent = 100;
Max_Inter_Seg_Percent = 100;
Max_Seg_In_Percent = 100;
Max_Blk_In_Percent = 100;

[FITTER REPORT FORMAT]

Fitter_Options = YES;
Pinout_Diagram = NO;
Pinout_Listing = YES;
Detailed_Block_Segment_Summary = YES;
Input_Signal_List = YES;
Output_Signal_List = YES;
Bidir_Signal_List = YES;
Node_Signal_List = YES;
Signal_Fanout_List = YES;
Block_Segment_Fanin_List = YES;
Prefit_Eqn = YES;
Postfit_Eqn = YES;
Page_Break = YES;

[OPTIMIZATION OPTIONS]

Logic_Reduction = YES;
Max_PTerm_Split = 16;
Max_PTerm_Collapse = 16;
XOR_Synthesis = YES;
Node_Collapse = Yes;
DT_Synthesis = Yes;

[FITTER GLOBAL OPTIONS]

Run_Time = 0;
Set_Reset_Dont_Care = NO;
In_Reg_Optimize = YES;
Clock_Optimize = NO;
Conf_Unused_IOs = OUT_LOW;

[POWER]
Powerlevel = Low, High;
Default = High;
Type = GLB;

[HARDWARE DEVICE OPTIONS]
Zero_Hold_Time = No;
Signature_Word = 0;
Pull_up = No;
Out_Slew_Rate = FAST, SLOW, 0;
Device_max_fanin = 33;
Device_max_pterms = 20;
Usercode_Format = Hex;

[PIN RESERVATIONS]
layer = OFF;

[LOCATION ASSIGNMENT]

Layer = OFF
o_state_0_ = OUTPUT,31,2,-;
o_state_1_ = OUTPUT,30,2,-;
o_diodes_7_ = OUTPUT,43,3,-;
o_diodes_6_ = OUTPUT,42,3,-;
o_diodes_5_ = OUTPUT,41,3,-;
o_diodes_4_ = OUTPUT,40,3,-;
o_diodes_3_ = OUTPUT,39,3,-;
o_diodes_2_ = OUTPUT,38,3,-;
o_diodes_1_ = OUTPUT,37,3,-;
o_diodes_0_ = OUTPUT,36,3,-;
o_clkSlow = OUTPUT,24,2,-;
pres_counter_3_ = NODE,*,0,-;
pres_counter_2_ = NODE,*,0,-;
RN_o_state_1_ = NODE,-1,2,-;
pres_counter_1_ = NODE,*,0,-;
pres_counter_0_ = NODE,*,1,-;
counter_2_ = NODE,*,2,-;
counter_1_ = NODE,*,1,-;
counter_0_ = NODE,*,0,-;
RN_o_state_0_ = NODE,-1,2,-;
pres_counter_5_ = NODE,*,1,-;
pres_counter_6_ = NODE,*,2,-;
pres_counter_4_ = NODE,*,1,-;
counter_4_ = NODE,*,1,-;
counter_3_ = NODE,*,0,-;
counter_5_ = NODE,*,1,-;
i_clk = INPUT,11,-,-;
