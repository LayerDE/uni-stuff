-- Copyright (C) 2016  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Intel and sold by Intel or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "07/03/2017 06:24:34"
                                                            
-- Vhdl Test Bench template for design  :  g_reader
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY g_reader_vhd_tst IS
END g_reader_vhd_tst;
ARCHITECTURE g_reader_arch OF g_reader_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk_50 : STD_LOGIC;
SIGNAL CS_N : STD_LOGIC;
SIGNAL dataX : STD_LOGIC_VECTOR(12 DOWNTO 0);
SIGNAL dataY : STD_LOGIC_VECTOR(12 DOWNTO 0);
SIGNAL dataZ : STD_LOGIC_VECTOR(12 DOWNTO 0);
SIGNAL reset_n : STD_LOGIC;
SIGNAL SCLK : STD_LOGIC;
SIGNAL SDIO : STD_LOGIC;
COMPONENT g_reader
	PORT (
	clk_50 : IN STD_LOGIC;
	CS_N : BUFFER STD_LOGIC;
	reset_n : IN STD_LOGIC;
	SCLK : BUFFER STD_LOGIC;
	SDIO : INOUT STD_LOGIC;
	dataX : BUFFER STD_LOGIC_VECTOR(12 DOWNTO 0);
	dataY : BUFFER STD_LOGIC_VECTOR(12 DOWNTO 0);
	dataZ : BUFFER STD_LOGIC_VECTOR(12 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : g_reader
	PORT MAP (
-- list connections between master ports and signals
	clk_50 => clk_50,
	CS_N => CS_N,
	dataX => dataX,
	dataY => dataY,
	dataZ => dataZ,
	reset_n => reset_n,
	SCLK => SCLK,
	SDIO => SDIO
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once                      
WAIT;                                                       
END PROCESS init;                                           

always : PROCESS                                              
begin
  clk_50 <= '1';
  wait for 10 ns;
  clk_50 <= '0';
  wait for 10 ns;
                                            
END PROCESS always;                                          
END g_reader_arch;
