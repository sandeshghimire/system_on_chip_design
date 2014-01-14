#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include "hwlib.h"
#include "socal/socal.h"
#include "socal/hps.h"
#include "socal/alt_gpio.h"
#include "hps_0.h"

#define HW_REGS_BASE ( ALT_STM_OFST )
#define HW_REGS_SPAN ( 0x04000000 )
#define HW_REGS_MASK ( HW_REGS_SPAN - 1 )

int main() {

	void *virtual_base;
	int fd;
	int loop_count;
	int led_direction;
	uint8_t led_state;

	// map the address space for the LED registers into user space so we can interact with them.
	// we'll actually map in the entire CSR span of the HPS since we want to access various registers within that span

	if( ( fd = open( "/dev/mem", ( O_RDWR | O_SYNC ) ) ) == -1 ) {
		printf( "ERROR: could not open \"/dev/mem\"...\n" );
		return( 1 );
	}

	virtual_base = mmap( NULL, HW_REGS_SPAN, ( PROT_READ | PROT_WRITE ), MAP_SHARED, fd, HW_REGS_BASE );

	if( virtual_base == MAP_FAILED ) {
		printf( "ERROR: mmap() failed...\n" );
		close( fd );
		return( 1 );
	}

	// initialize the LEDs

	// set the direction of the HPS GPIO1 bits attached to LEDs to output
	alt_setbits_word( ( virtual_base + ( ( uint32_t )( ALT_GPIO1_SWPORTA_DDR_ADDR ) & ( uint32_t )( HW_REGS_MASK ) ) ), 0x0F000000 );
	// set the value of the HPS GPIO1 bits attached to LEDs to ONE, turn OFF the LEDs
	alt_clrbits_word( ( virtual_base + ( ( uint32_t )( ALT_GPIO1_SWPORTA_DR_ADDR ) & ( uint32_t )( HW_REGS_MASK ) ) ), 0x0F000000 );
	// set the value of the FPGA PIO bits attached to LEDs to ONE, turn OFF the LEDs
	alt_clrbits_word( ( virtual_base + ( ( uint32_t )( ALT_LWFPGASLVS_OFST + LED_PIO_BASE ) & ( uint32_t )( HW_REGS_MASK ) ) ), 0x0000000F );

	// toggle the LEDs a bit

	loop_count = 0;
	led_state = 0x01;
	led_direction = 0;
	while( loop_count < 60 ) {

		// turn off all LEDs
		alt_clrbits_word( ( virtual_base + ( ( uint32_t )( ALT_GPIO1_SWPORTA_DR_ADDR ) & ( uint32_t )( HW_REGS_MASK ) ) ), 0x0F000000 );
		alt_clrbits_word( ( virtual_base + ( ( uint32_t )( ALT_LWFPGASLVS_OFST + LED_PIO_BASE ) & ( uint32_t )( HW_REGS_MASK ) ) ), 0x0000000F );

		// turn on the one led that we need
		switch( led_state ) {
		case( 0x01 ) :
			alt_setbits_word( ( virtual_base + ( ( uint32_t )( ALT_LWFPGASLVS_OFST + LED_PIO_BASE ) & ( uint32_t )( HW_REGS_MASK ) ) ), 0x00000001 );
			break;
		case( 0x02 ) :
			alt_setbits_word( ( virtual_base + ( ( uint32_t )( ALT_LWFPGASLVS_OFST + LED_PIO_BASE ) & ( uint32_t )( HW_REGS_MASK ) ) ), 0x00000002 );
			break;
		case( 0x04 ) :
			alt_setbits_word( ( virtual_base + ( ( uint32_t )( ALT_LWFPGASLVS_OFST + LED_PIO_BASE ) & ( uint32_t )( HW_REGS_MASK ) ) ), 0x00000004 );
			break;
		case( 0x08 ) :
			alt_setbits_word( ( virtual_base + ( ( uint32_t )( ALT_LWFPGASLVS_OFST + LED_PIO_BASE ) & ( uint32_t )( HW_REGS_MASK ) ) ), 0x00000008 );
			break;
		case( 0x10 ) :
			alt_setbits_word( ( virtual_base + ( ( uint32_t )( ALT_GPIO1_SWPORTA_DR_ADDR ) & ( uint32_t )( HW_REGS_MASK ) ) ), 0x01000000 );
			break;
		case( 0x20 ) :
			alt_setbits_word( ( virtual_base + ( ( uint32_t )( ALT_GPIO1_SWPORTA_DR_ADDR ) & ( uint32_t )( HW_REGS_MASK ) ) ), 0x02000000 );
			break;
		case( 0x40 ) :
			alt_setbits_word( ( virtual_base + ( ( uint32_t )( ALT_GPIO1_SWPORTA_DR_ADDR ) & ( uint32_t )( HW_REGS_MASK ) ) ), 0x04000000 );
			break;
		case( 0x80 ) :
			alt_setbits_word( ( virtual_base + ( ( uint32_t )( ALT_GPIO1_SWPORTA_DR_ADDR ) & ( uint32_t )( HW_REGS_MASK ) ) ), 0x08000000 );
			break;
		default :
			break;
		}

	usleep( 1000000 / 16 );

	// calculate the next LED value
	if( led_state == 0x80 ) {

		led_direction = 0;
		led_state >>= 1;

	} else if( led_state == 0x01 ) {

		led_direction = 1;
		led_state <<= 1;

	} else {
		if( led_direction == 0 ) {

			led_state >>= 1;

		} else {

			led_state <<= 1;
		}
	}

	loop_count++;
	}
	
	// leave the LEDs in the OFF state

	alt_clrbits_word( ( virtual_base + ( ( uint32_t )( ALT_GPIO1_SWPORTA_DR_ADDR ) & ( uint32_t )( HW_REGS_MASK ) ) ), 0x0F000000 );
	alt_clrbits_word( ( virtual_base + ( ( uint32_t )( ALT_LWFPGASLVS_OFST + LED_PIO_BASE ) & ( uint32_t )( HW_REGS_MASK ) ) ), 0x0000000F );

	// clean up our memory mapping and exit
	
	if( munmap( virtual_base, HW_REGS_SPAN ) != 0 ) {
		printf( "ERROR: munmap() failed...\n" );
		close( fd );
		return( 1 );
	}

	close( fd );

	return( 0 );
}
