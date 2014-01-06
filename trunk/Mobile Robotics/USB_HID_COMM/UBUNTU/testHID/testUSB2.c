#include <stdlib.h> 
#include <stdio.h>
#include <libusb-1.0/libusb.h> 

#define VERSION   "0.1.0"  
#define VENDOR_ID  0x1234  
#define PRODUCT_ID  0x0001 

// HID Class-Specific Requests values. See section 7.2 of the HID specifications 
#define HID_GET_REPORT                0x01 
#define HID_GET_IDLE                  0x02 
#define HID_GET_PROTOCOL              0x03 
#define HID_SET_REPORT                0x09 
#define HID_SET_IDLE                  0x0A 
#define HID_SET_PROTOCOL              0x0B 
#define HID_REPORT_TYPE_INPUT         0x01 
#define HID_REPORT_TYPE_OUTPUT        0x02 
#define HID_REPORT_TYPE_FEATURE       0x03 

#define CTRL_IN     LIBUSB_ENDPOINT_IN|LIBUSB_REQUEST_TYPE_CLASS|LIBUSB_RECIPIENT_INTERFACE 
#define CTRL_OUT    LIBUSB_ENDPOINT_OUT|LIBUSB_REQUEST_TYPE_CLASS|LIBUSB_RECIPIENT_INTERFACE 


const static int PACKET_CTRL_LEN	=2;   
const static int PACKET_INT_LEN	    =2; 
const static int INTERFACE			=0; 
const static int ENDPOINT_INT_IN	=0x81; /* endpoint 0x81 address for IN */ 
const static int ENDPOINT_INT_OUT	=0x01; /* endpoint 1 address for OUT */ 
const static int TIMEOUT			=5000; /* timeout in ms */  

void bad(const char *why) { 
	printf("Fatal error> %s\n",why); 
	exit(17); 
} 

static struct libusb_device_handle *devh = NULL;  

static int find_lvr_hidusb(void) 
{ 
	devh = libusb_open_device_with_vid_pid(NULL, VENDOR_ID, PRODUCT_ID); 
	return devh ? 0 : 0; 
}  

static int test_control_transfer(void) 
{ 
	int r,i; 
	char answer[PACKET_CTRL_LEN]; 
	char question[PACKET_CTRL_LEN]; 
	for (i=0;i<PACKET_CTRL_LEN; i++) question[i]=0x20+i; 

	r =   libusb_control_transfer(
								devh,  
								CTRL_OUT,
								HID_SET_REPORT, 
								(HID_REPORT_TYPE_FEATURE<<8)|0x00, 
								0, 
								question, 
								PACKET_CTRL_LEN, 
								TIMEOUT); 

	

	if (r < 0) { 
		printf("Control Out error %d\n", r); 
		return r; 
	}

	r = libusb_control_transfer(devh,CTRL_IN,HID_GET_REPORT,(HID_REPORT_TYPE_FEATURE<<8)|0x00,0, answer,PACKET_CTRL_LEN, TIMEOUT); 
	if (r < 0) { 
		printf("Control IN error %d\n", r); 
		return r; 
	} 
	for(i = 0;i < PACKET_CTRL_LEN; i++) { 
		if(i%8 == 0) 
			printf("\n"); 
		printf("%02x, %02x; ",question[i],answer[i]); 
	} 
	printf("\n"); 

	return 0; 
} 

static int test_control_transfer_in_out(void) 
{ 
	int r,i; 
	char answer[PACKET_INT_LEN]; 
	char question[PACKET_INT_LEN]; 
	for (i=0;i<PACKET_INT_LEN; i++) question[i]=0x30+i; 
	for (i=1;i<PACKET_INT_LEN; i++) answer[i]=0; 

	r = libusb_control_transfer(devh,CTRL_OUT,HID_SET_REPORT,(HID_REPORT_TYPE_OUTPUT<<8)|0x00, 0, question, PACKET_INT_LEN,TIMEOUT); 
	if (r < 0) { 
		printf("Control Out error %d\n", r); 
		return r; 
	} 
	r = libusb_control_transfer(devh,CTRL_IN,HID_GET_REPORT,(HID_REPORT_TYPE_INPUT<<8)|0x00, 0, answer,PACKET_INT_LEN, TIMEOUT); 
	if (r < 0) { 
		printf("Control IN error %d\n", r); 
		return r; 
	} 
	for(i = 0;i < PACKET_INT_LEN; i++) { 
		if(i%8 == 0) 
			printf("\n"); 
		printf("%02x, %02x; ",question[i],answer[i]); 
	} 
	printf("\n"); 

	return 0; 
} 

static int test_interrupt_transfer(void) 
{ 
	int r,i; 
	int transferred; 
	char answer[PACKET_INT_LEN]; 
	char question[PACKET_INT_LEN]; 
	for (i=0;i<PACKET_INT_LEN; i++) question[i]=0x40+i; 

	r = libusb_interrupt_transfer(devh, ENDPOINT_INT_OUT, question, PACKET_INT_LEN, 
		&transferred,TIMEOUT); 
	if (r < 0) { 
		printf("Interrupt write error %d\n", r); 
		return r; 
	} 
	r = libusb_interrupt_transfer(devh, ENDPOINT_INT_IN, answer,PACKET_INT_LEN, 
		&transferred, TIMEOUT); 
	if (r < 0) { 
		printf("Interrupt read error %d\n", r); 
		return r; 
	} 
	if (transferred < PACKET_INT_LEN) { 
		printf("Interrupt transfer short read (%d)\n", r); 
		return -1; 
	} 

	for(i = 0;i < PACKET_INT_LEN; i++) { 
		if(i%8 == 0) 
			printf("\n"); 
		printf("%02x, %02x; ",question[i],answer[i]); 
	} 
	printf("\n"); 

	return 0; 
} 


int hid_write(libusb_device_handle *devh, const unsigned char *data, size_t length)
{
	int res;
	int report_number = data[0];
	int skipped_report_id = 0;

	res = libusb_control_transfer(devh,  
								  LIBUSB_REQUEST_TYPE_CLASS|LIBUSB_RECIPIENT_INTERFACE|LIBUSB_ENDPOINT_OUT,
										0x09/*HID Set_Report*/,
										(2  /*HID output*/ << 8) | report_number,
										0, //0
										(unsigned char *)data, 
										length,
										1000/*timeout millis*/
									);
}

int main(void) 
{ 
	int status = 1; 

	status = libusb_init(NULL); 
	if (status < 0) 
	{ 
		printf("Failed to initialise libusb\n"); 
		exit(1); 
	} 

	status = find_lvr_hidusb(); 
	if (status < 0) 
	{ 
		printf("Could not find/open LVR Generic HID device\n"); 
		goto out; 
	} 
	else
		printf("Successfully find the LVR Generic HID device\n"); 

//#ifdef LINUX 
	libusb_detach_kernel_driver(devh, 0);      
//#endif 


	

	status = libusb_set_configuration(devh, 1); 
	if (status < 0) { 
		printf("libusb_set_configuration error %d\n", status); 
		goto out; 
	}
	else
		printf("Successfully set usb configuration 1\n"); 

	status = libusb_claim_interface(devh, 0); 
	if (status < 0) { 
		printf("libusb_claim_interface error %d\n", status); 
		goto out; 
	}
	else 
		printf("Successfully claimed interface\n");
		
	

	

	/* 

	printf("Testing control transfer using loop back test of feature report"); 
	test_control_transfer(); 

	printf("Testing control transfer using loop back test of input/output report"); 
	test_control_transfer_in_out(); 

	printf("Testing interrupt transfer using loop back test of input/output report"); 
	test_interrupt_transfer(); */

	printf("\n"); 
	printf("libusb_release_interface\n" );
	//libusb_release_interface(devh, 0);

out: 
	//libusb_reset_device(devh); 
	libusb_close(devh); 
	libusb_exit(NULL); 
	return status >= 0 ? status : -status;  
} 
