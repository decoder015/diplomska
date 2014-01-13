#include "display.h"

/* Function Definitions */

void displayln(void){
	printf("\n");
}

void display(const char c, const int n){
	int i;
	for(i=0; i< n;i++)
		printf("%c",c);
}

void displayLn(const char c,const int n){
	int i;
	for(i=0; i<n; i++)
		printf("%c",c);
	displayln();
}


void lndisplayLn(const char c,const int n)
{
	int i;
	displayln();
	for(i=0; i<n; i++)
		printf("%c",c);
	displayln();
}

void displayEndL(int n)
{
	int i;
	for(i=1; i<=n; i++)
		printf("\n");
} 

void displayStr(const char *str, char c, int width)
{
	int times = (width - strlen(str)) / 2;
	if( strlen(str) < width)
	{
		display(c,  times);
		printf("%s",str);
		if( !((width - strlen(str)) % 2) )
			display(c, times);
		else
			display(c, times+1);
	}
	else
		printf("%s",str);
}


void displayStrLn(const char *str, char c, int width)
{
	int times = (width-strlen(str))/2;
	if(strlen(str) < width)
	{
		display(c, times);
		printf("%s",str);
		if( !( (width - strlen(str)) % 2) )
			display(c, times);
		else
			display(c, times + 1);
	}
	else
		printf("%s",str);
	displayln();
}

//
//void lndisplayln(std::string str, char c, uint width)
//{
//	displayln();
//	if(str.length() < width)
//	{
//		display(c, (width-str.length())/2);
//		std::cout<<str;
//		if( ! ((width - str.length()) % 2) )
//			display(c,(width-str.length())/2);
//		else
//			display(c,(width-str.length())/2+1);
//	}
//	else
//		std::cout<<str;
//	displayln();
//}


void displayError(char *str, char c, int width) 
{
	displayLn(c, width);
	displayLn(c, width);
	displayLn(' ',1);
	displayStrLn("ERROR", ' ', width);
	displayLn(' ', 1);
	displayStrLn(str, ' ', width);
	displayLn(' ', 1);
	displayLn(c, width);
	displayLn(c, width);
}

//void warning(std::string str, char c, uint width) {
//	displayln(c, width);
//	displayln(c, width);
//	displayln(" ");
//	displayln("WARNING", ' ', width);
//	displayln(" ");
//	displayln(str, ' ', width);
//	displayln(" ");
//	displayln(c, width);
//	displayln(c, width);
//}

void message(char *body, char *title, int width) 
{
	char tmpTitle[128];
	tmpTitle[0] = '\0';

	strcat(tmpTitle, "== ");
	strcat(tmpTitle, title);
	strcat(tmpTitle, " ==");

	display('+'  ,1); displayLn('-', width - 1);
	displayLn('|',1);
	display('|'  ,1); displayStrLn(tmpTitle, ' ', width - 1);
	displayLn('|',1);
	display('|'  ,1); displayStrLn(body, ' ', width - 1 );
	displayLn('|',1);
	display('+'  ,1); displayLn('-', width - 1);
}

//void displayln(std::string varName, std::string varValue, char c, uint width) {
//	displayln(c, width);
//	display(c, 2);
//	std::cout << ' ' << varName << " | " << varValue << std::endl;
//	displayln(c, width);
//}
