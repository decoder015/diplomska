#include <stdio.h>
#include <stdlib.h>

#include "display.h"
#include "hidapi.h"

#define MAX_STR 255
#define USB_VENDOR_ID   0x1234
#define USB_PRODUCT_ID  0x0001

const int C_INT_MAX_BUFFER = 64;

int main(int argc, char* argv[])
{
	int res, i;
	char buf[C_INT_MAX_BUFFER] = "BACKWARD,200";

	wchar_t wstr[MAX_STR];
	hid_device *handle;

	//display header 
	message("Tumbler drive terminal v-0.1", "Kris tech", 70);	

	// Open the device using the VID, PID, and optionally the Serial number.
	handle = hid_open(USB_VENDOR_ID, USB_PRODUCT_ID, NULL);

	if(handle == NULL)
	{
		displayError("Handle is null. Tumbler drive module not found! Exiting...",'-',70);
		return;
	}
	else
		displayStr("Tumbler drive module online...", '-', 50);

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

	//TODO parse args
	printf("Argc:%i\n",argc);
	for(i=0; i<argc; i++)
	{
		printf("Argument:%s\n", *argv);
	}

	// Send command to module
	res = hid_write(handle, buf, C_INT_MAX_BUFFER);

	// Read requested state
	res = hid_read(handle, buf, C_INT_MAX_BUFFER);
	if (res < 0)
		printf("Unable to read()\n");

	printf("Status command:%s\n", buf);	

	//Before exit close the device
	hid_close(handle);
	return 0;
}