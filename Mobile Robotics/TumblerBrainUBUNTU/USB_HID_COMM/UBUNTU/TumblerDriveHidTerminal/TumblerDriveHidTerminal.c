#include <stdio.h>
#include <stdlib.h>

#include "hidapi.h"
#include "display.h"

#define MAX_STR 255
#define USB_VENDOR_ID   0x1234
#define USB_PRODUCT_ID  0x0001

int main(int argc, char* argv[])
{
	int res;
	char buf[64] = "BACKWARD,200";	
	wchar_t wstr[MAX_STR];

	hid_device *handle;
	int i;
	displayln("Test");
	display(argc);
	printf("Argc:%i\n",argc);
	for(i=0; i<argc; i++)
	{
		printf("Argument:%s\n", *argv);
	}

	// Open the device using the VID, PID,
	// and optionally the Serial number.
	handle = hid_open(USB_VENDOR_ID, USB_PRODUCT_ID, NULL);

	if(handle == NULL)
	{
		printf("Handle is null!\n");
		return;
	}

	// Read the Manufacturer String
	res = hid_get_manufacturer_string(handle, wstr, MAX_STR);
	printf("Manufacturer String: %ls\n", wstr);

	// Read the Product String
	res = hid_get_product_string(handle, wstr, MAX_STR);
	printf("Product String: %ls\n", wstr);

	// Read the Serial Number String
	res = hid_get_serial_number_string(handle, wstr, MAX_STR);
	printf("Serial Number String: %ls", wstr);
	printf("\n");	

	// Set the hid_read() function to be non-blocking.
	hid_set_nonblocking(handle, 1);

	// Send an Output report to toggle the LED (cmd 0x80)	
	res = hid_write(handle, buf, 65);

	// Read requested state
	res = hid_read(handle, buf, 65);
	if (res < 0)
		printf("Unable to read()\n");

	printf("Status command:%s\n",buf);	

	return 0;
}