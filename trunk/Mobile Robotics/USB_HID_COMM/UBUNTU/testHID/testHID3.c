#include <stdlib.h> 
#include <stdio.h>
#include <usb.h>
#include "libusb-1.0/libusb.h"
//#include <libusb-1.0/libusb.h> 

#define VERSION			"0.1.0"  
unsigned int VENDOR_ID	=	0x1234;
unsigned int PRODUCT_ID	=	0x0001;
#define INTERFACE_NO	0

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


/******************************************************************************
 * Function:        void BulkTransferLoopback(void)
 *
 * PreCondition:    bulk_endpoint_state has one of these values:
 *                  'r' - the bulk OUT endpoint is ready to receive data
 *                  't' - the bulk IN endpoint is preparing to transmit data
 *
 * Input:           None
 *
 * Output:          None
 *
 * Side Effects:    None
 *
 * Overview:        Perform actions according to the value of bulk_endpoint_state.
 *
 * Note:            None
******************************************************************************/
void bad(const char *why) { 
	printf("Fatal error> %s\n",why); 
	exit(17); 
} 


/******************************************************************************
 * Function:        void find_lvr_hidusb
 *
 * PreCondition:    bulk_endpoint_state has one of these values:
 *                  'r' - the bulk OUT endpoint is ready to receive data
 *                  't' - the bulk IN endpoint is preparing to transmit data
 *
 * Input:           None
 *
 * Output:          None
 *
 * Side Effects:    None
 *
 * Overview:        Perform actions according to the value of bulk_endpoint_state.
 *
 * Note:            None
******************************************************************************/
libusb_device_handle* find_lvr_hidusb(libusb_context *context,  uint16_t vendor_id,  uint16_t product_id) 
{ 
	return libusb_open_device_with_vid_pid(context, VENDOR_ID, PRODUCT_ID); 
	//return devh ? 0 : 0; 
} 


void GetUsbDevicesList(libusb_context *context)
{
	printf("MY Device vendor id: %i product id:%i\n", VENDOR_ID, PRODUCT_ID );	
	printf("*******************************************\n");

	int d = 0;
	libusb_device *usb_dev;

	//get list of usb devices
	ssize_t num_devs;
	libusb_device **devs;

	printf("Gett usb device list\n");
	num_devs = libusb_get_device_list(context, &devs);
	
	printf("Show usb device list\n");
	while ((usb_dev = devs[d++]) != NULL) 
	{
		struct libusb_device_descriptor desc;
		struct libusb_config_descriptor *conf_desc = NULL;

		int i,j,k;
		libusb_get_device_descriptor(usb_dev, &desc);

		if (libusb_get_active_config_descriptor(usb_dev, &conf_desc) < 0)
			continue;

		int currVendor  = (unsigned int)desc.idVendor;
		int currProduct = (unsigned int)desc.idProduct;

		printf("Device vendor hex id:%04x product id:%04x\n", desc.idVendor, desc.idProduct);		
		printf("Device vendor     id:%i   product id:%i\n", currVendor, currProduct);
		printf("Number of interfacess: %d\n",conf_desc->bNumInterfaces);

		if(VENDOR_ID == currVendor  && PRODUCT_ID == currProduct)
			printf("Found it!:)\n");
		printf("*******************************************\n");
			
		/*for (j = 0; j < conf_desc->bNumInterfaces; j++) 
		{*/
	}
}
/******************************************************************************
 * Function:        void hid_write
 *
 * PreCondition:    bulk_endpoint_state has one of these values:
 *                  'r' - the bulk OUT endpoint is ready to receive data
 *                  't' - the bulk IN endpoint is preparing to transmit data
 *
 * Input:           None
 *
 * Output:          None
 *
 * Side Effects:    None
 *
 * Overview:        Perform actions according to the value of bulk_endpoint_state.
 *
 * Note:            None
******************************************************************************/
//int hid_write(libusb_device_handle *devh, const unsigned char *data, size_t length)
//{
//	int res = -1;
//	//int report_number = data[0];
//	int skipped_report_id = 0;
//
//	//res = libusb_control_transfer(devh,  
//	//							  LIBUSB_REQUEST_TYPE_CLASS|LIBUSB_RECIPIENT_INTERFACE|LIBUSB_ENDPOINT_OUT,
//	//									0x09/*HID Set_Report*/,
//	//									(2  /*HID output*/ << 8) | report_number,
//	//									0, //0
//	//									(unsigned char *)data, 
//	//									length,
//	//									1000/*timeout millis*/
//	//								);
//
//	return res;
//}

/******************************************************************************
 * Function:        void BulkTransferLoopback(void)
 *
 * PreCondition:    bulk_endpoint_state has one of these values:
 *                  'r' - the bulk OUT endpoint is ready to receive data
 *                  't' - the bulk IN endpoint is preparing to transmit data
 *
 * Input:           None
 *
 * Output:          None
 *
 * Side Effects:    None
 *
 * Overview:        Perform actions according to the value of bulk_endpoint_state.
 *
 * Note:            None
******************************************************************************/
int main(void) 
{ 
	libusb_device **devices;
	libusb_context *context = NULL;
	int status = 1; 	
	struct libusb_device_handle *devh = NULL;

	//init pror to all
	status = libusb_init(&context); 
	if (0 > status)
	{
		fprintf(stderr, "libusb_init() failed with %d.\n", status);
		exit(-1);
	}
	else
		printf("Libusb initialized\n");

	//get devices list
	GetUsbDevicesList(context);	

	//get 
	devh = find_lvr_hidusb(context, VENDOR_ID, 2); 
	if (devh == NULL) 
	{ 
		fprintf(stderr, "Could not find/open LVR Generic HID device\n"); 
		exit(-1) ;
	} 
	else
		printf("Successfully find the LVR Generic HID device\n"); 

	////#ifdef LINUX 
	//libusb_detach_kernel_driver(devh, 0);      
	////#endif 


	///* Detach the kernel driver, but only if the
	//device is managed by the kernel */
	//if (libusb_kernel_driver_active(devh, INTERFACE_NO) == 1) 
	//{
	//	printf("Device is managed by the kernel!\n");
	//	res = libusb_detach_kernel_driver(dev->device_handle, intf_desc->bInterfaceNumber);
	//	if (res < 0) {
	//		libusb_close(dev->device_handle);
	//		LOG("Unable to detach Kernel Driver\n");
	//		free(dev_path);
	//		good_open = 0;
	//		break;
	//	}
	//}

	//res = libusb_claim_interface(dev->device_handle, intf_desc->bInterfaceNumber);
	//if (res < 0) {
	//	LOG("can't claim interface %d: %d\n", intf_desc->bInterfaceNumber, res);
	//	free(dev_path);
	//	libusb_close(dev->device_handle);
	//	good_open = 0;
	//	break;
	//}

	//status = libusb_set_configuration(devh, 1); 
	//if (status < 0) { 
	//	printf("libusb_set_configuration error %d\n", status); 
	//	goto out; 
	//}
	//else
	//	printf("Successfully set usb configuration 1\n"); 

	//status = libusb_claim_interface(devh, 0); 
	//if (status < 0) { 
	//	printf("libusb_claim_interface error %d\n", status); 
	//	goto out; 
	//}
	//else 
	//	printf("Successfully claimed interface\n");

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

//out: 
//	//libusb_reset_device(devh); 
//	libusb_close(devh); 
//	libusb_exit(NULL); 
//	return status >= 0 ? status : -status;  

	return 0;
} 
