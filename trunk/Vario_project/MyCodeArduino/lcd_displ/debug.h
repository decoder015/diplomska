/****************************************************
		DEBUG function: Toggle debug on/off

*/

//togle DEBUG mode
//#define DEBUG

#ifdef DEBUG
 #define DEBUG_PRINTLN(x) Serial.println (x)
 #define DEBUG_PRINT(x)   Serial.print (x)
#else
 #define DEBUG_PRINTLN(x)
 #define DEBUG_PRINT(x)
#endif