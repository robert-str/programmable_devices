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
Design = example_calculator.tt4;
Rev = 0.01;
DATE = 10/29/19;
TIME = 15:23:34;
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
bcd_out_2_ = OUTPUT,38,3,-;
bcd_out_1_ = OUTPUT,37,3,-;
bcd_out_4_ = OUTPUT,40,3,-;
bcd_out_3_ = OUTPUT,39,3,-;
bcd_out_0_ = OUTPUT,36,3,-;
bcd_out_7_ = OUTPUT,43,3,-;
bcd_out_6_ = OUTPUT,42,3,-;
bcd_out_5_ = OUTPUT,41,3,-;
keypad_cols_0_ = OUTPUT,5,0,-;
keypad_cols_1_ = OUTPUT,4,0,-;
keypad_cols_2_ = OUTPUT,3,0,-;
keypad_cols_3_ = OUTPUT,2,0,-;
calc_proc_state_curr_0_ = NODE,*,1,-;
calc_proc_state_curr_2_ = NODE,*,1,-;
calc_proc_state_curr_1_ = NODE,*,1,-;
input_keypad_counter_0_ = NODE,*,1,-;
input_keypad_counter_1_ = NODE,*,1,-;
input_keypad_counter_2_ = NODE,*,2,-;
input_keypad_interrupt_out = NODE,*,2,-;
input_keypad_key_out_1_ = NODE,*,2,-;
input_keypad_interrupt_0_sqmuxa_n = NODE,*,1,-;
input_keypad_interrupt = NODE,*,1,-;
calc_proc_state_next_0_sqmuxa_2_n = NODE,*,2,-;
input_keypad_counter_3_ = NODE,*,1,-;
calc_proc_num_acc_2_ = NODE,*,2,-;
calc_proc_num_acc_1_ = NODE,*,1,-;
calc_proc_num_acc_0_ = NODE,*,2,-;
calc_proc_key_catched_3_ = NODE,*,0,-;
calc_proc_key_catched_1_ = NODE,*,1,-;
calc_proc_key_catched_2_ = NODE,*,0,-;
calc_proc_key_catched_0_ = NODE,*,2,-;
calc_proc_num_buf_2_ = NODE,*,2,-;
calc_proc_num_buf_1_ = NODE,*,2,-;
calc_proc_num_buf_0_ = NODE,*,2,-;
calc_proc_state_oper_0_ = NODE,*,1,-;
calc_proc_n_82_0_n = NODE,*,0,-;
calc_proc_G_89_1 = NODE,*,0,-;
calc_proc_num_acc_buf_1_ = NODE,*,3,-;
input_keypad_key_out_2_ = NODE,*,0,-;
calc_proc_n_36_0_n = NODE,*,3,-;
calc_proc_n_79_1_n = NODE,*,0,-;
calc_proc_num_acc_buf_3_ = NODE,*,3,-;
calc_proc_num_acc_buf_2_ = NODE,*,3,-;
input_keypad_key_out_3_ = NODE,*,0,-;
input_keypad_key_out_0_ = NODE,*,2,-;
calc_proc_state_oper_0__0 = NODE,*,1,-;
calc_proc_num_acc_buf_0_ = NODE,*,3,-;
calc_proc_num_acc_3_ = NODE,*,0,-;
calc_proc_num_buf_3_ = NODE,*,2,-;
calc_proc_state_disp_0_ = NODE,*,1,-;
clk = INPUT,11,-,-;
