`include "top/config_soc.v"

module c5sx_soc(
///////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////	 
////////////////////		HPS Interface			////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////		
		input  wire        reset_reset_n,                         //           reset.reset_n
		input  wire        clk_clk,                               //             clk.clk
		output wire [14:0] memory_mem_a,                          //          memory.mem_a
		output wire [2:0]  memory_mem_ba,                         //                .mem_ba
		output wire        memory_mem_ck,                         //                .mem_ck
		output wire        memory_mem_ck_n,                       //                .mem_ck_n
		output wire        memory_mem_cke,                        //                .mem_cke
		output wire        memory_mem_cs_n,                       //                .mem_cs_n
		output wire        memory_mem_ras_n,                      //                .mem_ras_n
		output wire        memory_mem_cas_n,                      //                .mem_cas_n
		output wire        memory_mem_we_n,                       //                .mem_we_n
		output wire        memory_mem_reset_n,                    //                .mem_reset_n
		inout  wire [31:0] memory_mem_dq,                         //                .mem_dq
		inout  wire [3:0]  memory_mem_dqs,                        //                .mem_dqs
		inout  wire [3:0]  memory_mem_dqs_n,                      //                .mem_dqs_n
		output wire        memory_mem_odt,                        //                .mem_odt
		output wire [3:0]  memory_mem_dm,                         //                .mem_dm
		input  wire        memory_oct_rzqin,                      //                .oct_rzqin
		output wire        hps_0_hps_io_hps_io_emac1_inst_TX_CLK, //    hps_0_hps_io.hps_io_emac1_inst_TX_CLK
		output wire        hps_0_hps_io_hps_io_emac1_inst_TXD0,   //                .hps_io_emac1_inst_TXD0
		output wire        hps_0_hps_io_hps_io_emac1_inst_TXD1,   //                .hps_io_emac1_inst_TXD1
		output wire        hps_0_hps_io_hps_io_emac1_inst_TXD2,   //                .hps_io_emac1_inst_TXD2
		output wire        hps_0_hps_io_hps_io_emac1_inst_TXD3,   //                .hps_io_emac1_inst_TXD3
		input  wire        hps_0_hps_io_hps_io_emac1_inst_RXD0,   //                .hps_io_emac1_inst_RXD0
		inout  wire        hps_0_hps_io_hps_io_emac1_inst_MDIO,   //                .hps_io_emac1_inst_MDIO
		output wire        hps_0_hps_io_hps_io_emac1_inst_MDC,    //                .hps_io_emac1_inst_MDC
		input  wire        hps_0_hps_io_hps_io_emac1_inst_RX_CTL, //                .hps_io_emac1_inst_RX_CTL
		output wire        hps_0_hps_io_hps_io_emac1_inst_TX_CTL, //                .hps_io_emac1_inst_TX_CTL
		input  wire        hps_0_hps_io_hps_io_emac1_inst_RX_CLK, //                .hps_io_emac1_inst_RX_CLK
		input  wire        hps_0_hps_io_hps_io_emac1_inst_RXD1,   //                .hps_io_emac1_inst_RXD1
		input  wire        hps_0_hps_io_hps_io_emac1_inst_RXD2,   //                .hps_io_emac1_inst_RXD2
		input  wire        hps_0_hps_io_hps_io_emac1_inst_RXD3,   //                .hps_io_emac1_inst_RXD3
		inout  wire        hps_0_hps_io_hps_io_qspi_inst_IO0,     //                .hps_io_qspi_inst_IO0
		inout  wire        hps_0_hps_io_hps_io_qspi_inst_IO1,     //                .hps_io_qspi_inst_IO1
		inout  wire        hps_0_hps_io_hps_io_qspi_inst_IO2,     //                .hps_io_qspi_inst_IO2
		inout  wire        hps_0_hps_io_hps_io_qspi_inst_IO3,     //                .hps_io_qspi_inst_IO3
		output wire        hps_0_hps_io_hps_io_qspi_inst_SS0,     //                .hps_io_qspi_inst_SS0
		output wire        hps_0_hps_io_hps_io_qspi_inst_CLK,     //                .hps_io_qspi_inst_CLK
		inout  wire        hps_0_hps_io_hps_io_sdio_inst_CMD,     //                .hps_io_sdio_inst_CMD
		inout  wire        hps_0_hps_io_hps_io_sdio_inst_D0,      //                .hps_io_sdio_inst_D0
		inout  wire        hps_0_hps_io_hps_io_sdio_inst_D1,      //                .hps_io_sdio_inst_D1
		output wire        hps_0_hps_io_hps_io_sdio_inst_CLK,     //                .hps_io_sdio_inst_CLK
		inout  wire        hps_0_hps_io_hps_io_sdio_inst_D2,      //                .hps_io_sdio_inst_D2
		inout  wire        hps_0_hps_io_hps_io_sdio_inst_D3,      //                .hps_io_sdio_inst_D3
		inout  wire        hps_0_hps_io_hps_io_usb1_inst_D0,      //                .hps_io_usb1_inst_D0
		inout  wire        hps_0_hps_io_hps_io_usb1_inst_D1,      //                .hps_io_usb1_inst_D1
		inout  wire        hps_0_hps_io_hps_io_usb1_inst_D2,      //                .hps_io_usb1_inst_D2
		inout  wire        hps_0_hps_io_hps_io_usb1_inst_D3,      //                .hps_io_usb1_inst_D3
		inout  wire        hps_0_hps_io_hps_io_usb1_inst_D4,      //                .hps_io_usb1_inst_D4
		inout  wire        hps_0_hps_io_hps_io_usb1_inst_D5,      //                .hps_io_usb1_inst_D5
		inout  wire        hps_0_hps_io_hps_io_usb1_inst_D6,      //                .hps_io_usb1_inst_D6
		inout  wire        hps_0_hps_io_hps_io_usb1_inst_D7,      //                .hps_io_usb1_inst_D7
		input  wire        hps_0_hps_io_hps_io_usb1_inst_CLK,     //                .hps_io_usb1_inst_CLK
		output wire        hps_0_hps_io_hps_io_usb1_inst_STP,     //                .hps_io_usb1_inst_STP
		input  wire        hps_0_hps_io_hps_io_usb1_inst_DIR,     //                .hps_io_usb1_inst_DIR
		input  wire        hps_0_hps_io_hps_io_usb1_inst_NXT,     //                .hps_io_usb1_inst_NXT
		output wire        hps_0_hps_io_hps_io_spim0_inst_CLK,    //                .hps_io_spim0_inst_CLK
		output wire        hps_0_hps_io_hps_io_spim0_inst_MOSI,   //                .hps_io_spim0_inst_MOSI
		input  wire        hps_0_hps_io_hps_io_spim0_inst_MISO,   //                .hps_io_spim0_inst_MISO
		output wire        hps_0_hps_io_hps_io_spim0_inst_SS0,    //                .hps_io_spim0_inst_SS0
		output wire        hps_0_hps_io_hps_io_spim1_inst_CLK,    //                .hps_io_spim1_inst_CLK
		output wire        hps_0_hps_io_hps_io_spim1_inst_MOSI,   //                .hps_io_spim1_inst_MOSI
		input  wire        hps_0_hps_io_hps_io_spim1_inst_MISO,   //                .hps_io_spim1_inst_MISO
		output wire        hps_0_hps_io_hps_io_spim1_inst_SS0,    //                .hps_io_spim1_inst_SS0
		input  wire        hps_0_hps_io_hps_io_uart0_inst_RX,     //                .hps_io_uart0_inst_RX
		output wire        hps_0_hps_io_hps_io_uart0_inst_TX,     //                .hps_io_uart0_inst_TX
		inout  wire        hps_0_hps_io_hps_io_i2c1_inst_SDA,     //                .hps_io_i2c1_inst_SDA
		inout  wire        hps_0_hps_io_hps_io_i2c1_inst_SCL,     //                .hps_io_i2c1_inst_SCL
		inout  wire        hps_0_hps_io_hps_io_gpio_inst_GPIO00,  //                .hps_io_gpio_inst_GPIO00
		inout  wire        hps_0_hps_io_hps_io_gpio_inst_GPIO09,  //                .hps_io_gpio_inst_GPIO09
		inout  wire        hps_0_hps_io_hps_io_gpio_inst_GPIO35,  //                .hps_io_gpio_inst_GPIO35
		inout  wire        hps_0_hps_io_hps_io_gpio_inst_GPIO48,  //                .hps_io_gpio_inst_GPIO48
		inout  wire        hps_0_hps_io_hps_io_gpio_inst_GPIO53,  //                .hps_io_gpio_inst_GPIO53
		inout  wire        hps_0_hps_io_hps_io_gpio_inst_GPIO54,  //                .hps_io_gpio_inst_GPIO54
		inout  wire        hps_0_hps_io_hps_io_gpio_inst_GPIO55,  //                .hps_io_gpio_inst_GPIO55
		inout  wire        hps_0_hps_io_hps_io_gpio_inst_GPIO56,  //                .hps_io_gpio_inst_GPIO56
		inout  wire        hps_0_hps_io_hps_io_gpio_inst_GPIO61,  //                .hps_io_gpio_inst_GPIO61
		inout  wire        hps_0_hps_io_hps_io_gpio_inst_GPIO62,   //                .hps_io_gpio_inst_GPIO62


////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////	 
////////////////////		FPGA Interface			////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////								
	
	//FPGA-GPLL-CLK------------------------//X pins
   input          clk_100m_fpga,       //2.5V    //100 MHz (2nd copy to max)
   input          clk_50m_fpga,        //2.5V    //50MHz (2nd copy to max) 
	input          clk_top1,            //2.5V    //156.25 MHz adjustable
   input          clk_bot1,            //1.5V    //100 MHz ajustable
	input          cpu_resetn,          //2.5V    //NIOS CPU Reset Pushbutton	

	//////////////////// SiLabs Clock Generator I/F 	///////////////////  	   	   	   	   	   	
   output   wire  clk_i2c_sclk,             // I2C Clock 
   inout    wire  clk_i2c_sdat,             // I2C Data 
             
`ifdef user_peripheral
	//FPGA-User-IO-------------------------//14 pins //--------------------------
 	input	 [3:0]   user_dipsw_fpga,     //
	output [3:0]   user_led_fpga,       //
	input	 [3:0]   user_pb_fpga,        //
  	input  	wire  irda_rxd,				// IRDA Receive LED   
  	output  	wire  fan_ctrl				// control for fan
`endif
	
`ifdef ddr3
//FPGA-DDR3-400Mx32--------------------//74 pins //--------------------------
   output [14:0]  ddr3_fpga_a,         //SSTL15  //Address
   output [2:0]   ddr3_fpga_ba,        //SSTL15  //Bank Address
	output         ddr3_fpga_casn,      //SSTL15  //Column Address Strobe
	output         ddr3_fpga_cke,       //SSTL15  //Clock Enable
	output         ddr3_fpga_clk_n,     //SSTL15  //Diff Clock - Neg
	output         ddr3_fpga_clk_p,     //SSTL15  //Diff Clock - Pos
   output         ddr3_fpga_csn,       //SSTL15  //Chip Select
   output [3:0]   ddr3_fpga_dm,        //SSTL15  //Data Write Mask
   inout  [31:0]  ddr3_fpga_dq,        //SSTL15  //Data Bus
   inout  [3:0]   ddr3_fpga_dqs_n,     //SSTL15  //Diff Data Strobe - Neg
   inout  [3:0]   ddr3_fpga_dqs_p,     //SSTL15  //Diff Data Strobe - Pos
   output         ddr3_fpga_odt,       //SSTL15  //On-Die Termination Enable
   input          ddr3_fpga_rasn,      //SSTL15  //Row Address Strobe
   input          ddr3_fpga_resetn,    //SSTL15  //Reset
   input          ddr3_fpga_wen,       //SSTL15  //Write Enable
	input          ddr3_fpga_rzq,       //OCT_rzqin //On-die termination enable
//   input          oct_rdn,        		//SSTL15    //On-die termination enable
//   input          oct_rup,       		//SSTL15    //On-die termination enable
`endif

`ifdef temp_sense
 		//////////////////// 	Temp. Sensor I/F 	////////////////////  	
		// 							SPI interface								//
   output   wire  temp_cs_n,				// Chip Select
   output   wire  temp_sclk,       			// Slave Clock 
   output   wire  temp_mosi,				// Data Out 
   input    wire  temp_miso,				// Data In
`endif

`ifdef vga
		////////////////////	VIDEO 	 		////////////////////	
   output 	wire  vga_clk,					// Video Clock
   output 	wire  vga_hs,					// Horizontal Synch
   output 	wire  vga_vs,					// Vertical Synch   	   	
   output   wire  [7:0] vga_r,				// Red 
   output   wire  [7:0] vga_g,				// Green
   output   wire  [7:0] vga_b,				// Blue	
   input 	wire  vga_balnk_n,			// Composite Blank Control
   input 	wire  vga_sync_n,				// Composite Synch Control  	  
`endif

`ifdef audio
	////////////////////	AUDIO 	 		////////////////////	
   input 	wire  aud_adcdat,				// ADC Serial Data or I2C_SCLK
   input 	wire  aud_adclrck, 			// FDDR3e clock
   input 	wire  aud_bclk,				// Bit Clock 
   output 	wire  aud_dacdat,				// DAC Serial Data 
   inout 	wire  aud_daclrck,			// FDDR3e Clock
	output   wire  aud_i2c_sclk,                                       
	inout    wire  aud_i2c_sdat,                                          
	output   wire  aud_mute,                                      
	output   wire  aud_xck,    
`endif
	
`ifdef hsma
//HSMC-Port-A--------------------------////--------------------------
//	input                         [2:1]        hsmc_clkin_n,        
	input                         [2:1]        hsmc_clkin_p,        
//	output                        [2:1]        hsmc_clkout_n,        
	output                        [2:1]        hsmc_clkout_p,       
	input                                      hsmc_clk_in0,     
	output                                      hsmc_clk_out0,        
	inout                         [3:0]        hsmc_d,      
`ifdef HSMC_XCVR	
//	input                         [7:0]        hsmc_gxb_rx_n,        
	input                         [7:0]        hsmc_gxb_rx_p,       
//	output                        [7:0]        hsmc_gxb_tx_n,        
	output                        [7:0]        hsmc_gxb_tx_p,        
//	input                                      hsmc_ref_clk_n,        
	input                                      hsmc_ref_clk_p,        
`endif
//	input                         [16:0]       hsmc_rx_n,       
	input                         [16:0]       hsmc_rx_p,         
	output                                     hsmc_scl,        
	inout                                      hsmc_sda,        
//	output                         [16:0]       hsmc_tx_n,      
	output                         [16:0]       hsmc_tx_p      
 `endif

 	//////////////////// QSPI Flash I/F 	///////////////////  	   	   	   	   	   	
//   inout   wire  [3:0] fpga_epqc_data,     // Flash Data 
//   output  wire  fpga_epqc_dclk,           // Data Clock  
//   output  wire  fpga_epqc_ncso           // Chip Select
   
);
    

 
    soc_system u0 (
        .clk_clk                               (clk_clk),                               //             clk.clk
        .reset_reset_n                         (reset_reset_n),                         //           reset.reset_n
        .memory_mem_a                          (memory_mem_a),                          //          memory.mem_a
        .memory_mem_ba                         (memory_mem_ba),                         //                .mem_ba
        .memory_mem_ck                         (memory_mem_ck),                         //                .mem_ck
        .memory_mem_ck_n                       (memory_mem_ck_n),                       //                .mem_ck_n
        .memory_mem_cke                        (memory_mem_cke),                        //                .mem_cke
        .memory_mem_cs_n                       (memory_mem_cs_n),                       //                .mem_cs_n
        .memory_mem_ras_n                      (memory_mem_ras_n),                      //                .mem_ras_n
        .memory_mem_cas_n                      (memory_mem_cas_n),                      //                .mem_cas_n
        .memory_mem_we_n                       (memory_mem_we_n),                       //                .mem_we_n
        .memory_mem_reset_n                    (memory_mem_reset_n),                    //                .mem_reset_n
        .memory_mem_dq                         (memory_mem_dq),                         //                .mem_dq
        .memory_mem_dqs                        (memory_mem_dqs),                        //                .mem_dqs
        .memory_mem_dqs_n                      (memory_mem_dqs_n),                      //                .mem_dqs_n
        .memory_mem_odt                        (memory_mem_odt),                        //                .mem_odt
        .memory_mem_dm                         (memory_mem_dm),                         //                .mem_dm
        .memory_oct_rzqin                      (memory_oct_rzqin),                      //                .oct_rzqin
        .hps_0_hps_io_hps_io_emac1_inst_TX_CLK (hps_0_hps_io_hps_io_emac1_inst_TX_CLK), //    hps_0_hps_io.hps_io_emac1_inst_TX_CLK
        .hps_0_hps_io_hps_io_emac1_inst_TXD0   (hps_0_hps_io_hps_io_emac1_inst_TXD0),   //                .hps_io_emac1_inst_TXD0
        .hps_0_hps_io_hps_io_emac1_inst_TXD1   (hps_0_hps_io_hps_io_emac1_inst_TXD1),   //                .hps_io_emac1_inst_TXD1
        .hps_0_hps_io_hps_io_emac1_inst_TXD2   (hps_0_hps_io_hps_io_emac1_inst_TXD2),   //                .hps_io_emac1_inst_TXD2
        .hps_0_hps_io_hps_io_emac1_inst_TXD3   (hps_0_hps_io_hps_io_emac1_inst_TXD3),   //                .hps_io_emac1_inst_TXD3
        .hps_0_hps_io_hps_io_emac1_inst_RXD0   (hps_0_hps_io_hps_io_emac1_inst_RXD0),   //                .hps_io_emac1_inst_RXD0
        .hps_0_hps_io_hps_io_emac1_inst_MDIO   (hps_0_hps_io_hps_io_emac1_inst_MDIO),   //                .hps_io_emac1_inst_MDIO
        .hps_0_hps_io_hps_io_emac1_inst_MDC    (hps_0_hps_io_hps_io_emac1_inst_MDC),    //                .hps_io_emac1_inst_MDC
        .hps_0_hps_io_hps_io_emac1_inst_RX_CTL (hps_0_hps_io_hps_io_emac1_inst_RX_CTL), //                .hps_io_emac1_inst_RX_CTL
        .hps_0_hps_io_hps_io_emac1_inst_TX_CTL (hps_0_hps_io_hps_io_emac1_inst_TX_CTL), //                .hps_io_emac1_inst_TX_CTL
        .hps_0_hps_io_hps_io_emac1_inst_RX_CLK (hps_0_hps_io_hps_io_emac1_inst_RX_CLK), //                .hps_io_emac1_inst_RX_CLK
        .hps_0_hps_io_hps_io_emac1_inst_RXD1   (hps_0_hps_io_hps_io_emac1_inst_RXD1),   //                .hps_io_emac1_inst_RXD1
        .hps_0_hps_io_hps_io_emac1_inst_RXD2   (hps_0_hps_io_hps_io_emac1_inst_RXD2),   //                .hps_io_emac1_inst_RXD2
        .hps_0_hps_io_hps_io_emac1_inst_RXD3   (hps_0_hps_io_hps_io_emac1_inst_RXD3),   //                .hps_io_emac1_inst_RXD3
        .hps_0_hps_io_hps_io_qspi_inst_IO0     (hps_0_hps_io_hps_io_qspi_inst_IO0),     //                .hps_io_qspi_inst_IO0
        .hps_0_hps_io_hps_io_qspi_inst_IO1     (hps_0_hps_io_hps_io_qspi_inst_IO1),     //                .hps_io_qspi_inst_IO1
        .hps_0_hps_io_hps_io_qspi_inst_IO2     (hps_0_hps_io_hps_io_qspi_inst_IO2),     //                .hps_io_qspi_inst_IO2
        .hps_0_hps_io_hps_io_qspi_inst_IO3     (hps_0_hps_io_hps_io_qspi_inst_IO3),     //                .hps_io_qspi_inst_IO3
        .hps_0_hps_io_hps_io_qspi_inst_SS0     (hps_0_hps_io_hps_io_qspi_inst_SS0),     //                .hps_io_qspi_inst_SS0
        .hps_0_hps_io_hps_io_qspi_inst_CLK     (hps_0_hps_io_hps_io_qspi_inst_CLK),     //                .hps_io_qspi_inst_CLK
        .hps_0_hps_io_hps_io_sdio_inst_CMD     (hps_0_hps_io_hps_io_sdio_inst_CMD),     //                .hps_io_sdio_inst_CMD
        .hps_0_hps_io_hps_io_sdio_inst_D0      (hps_0_hps_io_hps_io_sdio_inst_D0),      //                .hps_io_sdio_inst_D0
        .hps_0_hps_io_hps_io_sdio_inst_D1      (hps_0_hps_io_hps_io_sdio_inst_D1),      //                .hps_io_sdio_inst_D1
        .hps_0_hps_io_hps_io_sdio_inst_CLK     (hps_0_hps_io_hps_io_sdio_inst_CLK),     //                .hps_io_sdio_inst_CLK
        .hps_0_hps_io_hps_io_sdio_inst_D2      (hps_0_hps_io_hps_io_sdio_inst_D2),      //                .hps_io_sdio_inst_D2
        .hps_0_hps_io_hps_io_sdio_inst_D3      (hps_0_hps_io_hps_io_sdio_inst_D3),      //                .hps_io_sdio_inst_D3
        .hps_0_hps_io_hps_io_usb1_inst_D0      (hps_0_hps_io_hps_io_usb1_inst_D0),      //                .hps_io_usb1_inst_D0
        .hps_0_hps_io_hps_io_usb1_inst_D1      (hps_0_hps_io_hps_io_usb1_inst_D1),      //                .hps_io_usb1_inst_D1
        .hps_0_hps_io_hps_io_usb1_inst_D2      (hps_0_hps_io_hps_io_usb1_inst_D2),      //                .hps_io_usb1_inst_D2
        .hps_0_hps_io_hps_io_usb1_inst_D3      (hps_0_hps_io_hps_io_usb1_inst_D3),      //                .hps_io_usb1_inst_D3
        .hps_0_hps_io_hps_io_usb1_inst_D4      (hps_0_hps_io_hps_io_usb1_inst_D4),      //                .hps_io_usb1_inst_D4
        .hps_0_hps_io_hps_io_usb1_inst_D5      (hps_0_hps_io_hps_io_usb1_inst_D5),      //                .hps_io_usb1_inst_D5
        .hps_0_hps_io_hps_io_usb1_inst_D6      (hps_0_hps_io_hps_io_usb1_inst_D6),      //                .hps_io_usb1_inst_D6
        .hps_0_hps_io_hps_io_usb1_inst_D7      (hps_0_hps_io_hps_io_usb1_inst_D7),      //                .hps_io_usb1_inst_D7
        .hps_0_hps_io_hps_io_usb1_inst_CLK     (hps_0_hps_io_hps_io_usb1_inst_CLK),     //                .hps_io_usb1_inst_CLK
        .hps_0_hps_io_hps_io_usb1_inst_STP     (hps_0_hps_io_hps_io_usb1_inst_STP),     //                .hps_io_usb1_inst_STP
        .hps_0_hps_io_hps_io_usb1_inst_DIR     (hps_0_hps_io_hps_io_usb1_inst_DIR),     //                .hps_io_usb1_inst_DIR
        .hps_0_hps_io_hps_io_usb1_inst_NXT     (hps_0_hps_io_hps_io_usb1_inst_NXT),     //                .hps_io_usb1_inst_NXT
        .hps_0_hps_io_hps_io_spim0_inst_CLK    (hps_0_hps_io_hps_io_spim0_inst_CLK),    //                .hps_io_spim0_inst_CLK
        .hps_0_hps_io_hps_io_spim0_inst_MOSI   (hps_0_hps_io_hps_io_spim0_inst_MOSI),   //                .hps_io_spim0_inst_MOSI
        .hps_0_hps_io_hps_io_spim0_inst_MISO   (hps_0_hps_io_hps_io_spim0_inst_MISO),   //                .hps_io_spim0_inst_MISO
        .hps_0_hps_io_hps_io_spim0_inst_SS0    (hps_0_hps_io_hps_io_spim0_inst_SS0),    //                .hps_io_spim0_inst_SS0
        .hps_0_hps_io_hps_io_spim1_inst_CLK    (hps_0_hps_io_hps_io_spim1_inst_CLK),    //                .hps_io_spim1_inst_CLK
        .hps_0_hps_io_hps_io_spim1_inst_MOSI   (hps_0_hps_io_hps_io_spim1_inst_MOSI),   //                .hps_io_spim1_inst_MOSI
        .hps_0_hps_io_hps_io_spim1_inst_MISO   (hps_0_hps_io_hps_io_spim1_inst_MISO),   //                .hps_io_spim1_inst_MISO
        .hps_0_hps_io_hps_io_spim1_inst_SS0    (hps_0_hps_io_hps_io_spim1_inst_SS0),    //                .hps_io_spim1_inst_SS0
        .hps_0_hps_io_hps_io_uart0_inst_RX     (hps_0_hps_io_hps_io_uart0_inst_RX),     //                .hps_io_uart0_inst_RX
        .hps_0_hps_io_hps_io_uart0_inst_TX     (hps_0_hps_io_hps_io_uart0_inst_TX),     //                .hps_io_uart0_inst_TX
        .hps_0_hps_io_hps_io_i2c1_inst_SDA     (hps_0_hps_io_hps_io_i2c1_inst_SDA),     //                .hps_io_i2c1_inst_SDA
        .hps_0_hps_io_hps_io_i2c1_inst_SCL     (hps_0_hps_io_hps_io_i2c1_inst_SCL),     //                .hps_io_i2c1_inst_SCL
        .hps_0_hps_io_hps_io_gpio_inst_GPIO00  (hps_0_hps_io_hps_io_gpio_inst_GPIO00),  //                .hps_io_gpio_inst_GPIO00
        .hps_0_hps_io_hps_io_gpio_inst_GPIO09  (hps_0_hps_io_hps_io_gpio_inst_GPIO09),  //                .hps_io_gpio_inst_GPIO09
        .hps_0_hps_io_hps_io_gpio_inst_GPIO35  (hps_0_hps_io_hps_io_gpio_inst_GPIO35),  //                .hps_io_gpio_inst_GPIO35
        .hps_0_hps_io_hps_io_gpio_inst_GPIO48  (hps_0_hps_io_hps_io_gpio_inst_GPIO48),  //                .hps_io_gpio_inst_GPIO48
        .hps_0_hps_io_hps_io_gpio_inst_GPIO53  (hps_0_hps_io_hps_io_gpio_inst_GPIO53),  //                .hps_io_gpio_inst_GPIO53
        .hps_0_hps_io_hps_io_gpio_inst_GPIO54  (hps_0_hps_io_hps_io_gpio_inst_GPIO54),  //                .hps_io_gpio_inst_GPIO54
        .hps_0_hps_io_hps_io_gpio_inst_GPIO55  (hps_0_hps_io_hps_io_gpio_inst_GPIO55),  //                .hps_io_gpio_inst_GPIO55
        .hps_0_hps_io_hps_io_gpio_inst_GPIO56  (hps_0_hps_io_hps_io_gpio_inst_GPIO56),  //                .hps_io_gpio_inst_GPIO56
        .hps_0_hps_io_hps_io_gpio_inst_GPIO61  (hps_0_hps_io_hps_io_gpio_inst_GPIO61),  //                .hps_io_gpio_inst_GPIO61
        .hps_0_hps_io_hps_io_gpio_inst_GPIO62  (hps_0_hps_io_hps_io_gpio_inst_GPIO62),  //                .hps_io_gpio_inst_GPIO62
        .fpga_led_pio_export                   (user_led_fpga),                   //    fpga_led_pio.export
        .fpga_dipsw_pio_export                 (user_dipsw_fpga),                 //  fpga_dipsw_pio.export
        .fpga_button_pio_export                (user_pb_fpga)                 // fpga_button_pio.export
    );
      

    
endmodule
