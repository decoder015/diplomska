#include "display.h"

/* Function Definitions */
void display(const char c, const uint n){
	for(uint i=0; i< n;i++)
		std::cout.put(c);
}

void displayln(const char c,const uint n){
	for(uint i=0;i < n;i++)
		std::cout.put(c);
	displayln();
}

void lndisplayln(const char c,const uint n){
	displayln();

	for(uint i=0;i < n;i++)
		std::cout.put(c);
	displayln();
}

/* void displayln(uint n){
	for(uint i=1;i <= n;i++)
		std::cout<<std::endl;
} */

void display(std::string str,char c,uint width){
	if(str.length() < width){
		display(c,(width-str.length())/2);
		std::cout<<str;
		if(!((width - str.length()) % 2))
			display(c,(width-str.length())/2);
		else
			display(c,(width-str.length())/2+1);
	}
	else
		std::cout<<str;
}

void displayln(std::string str,char c,uint width){
	if(str.length() < width){
		display(c,(width-str.length())/2);
		std::cout<<str;
		if(!((width - str.length()) % 2))
			display(c,(width-str.length())/2);
		else
			display(c,(width-str.length())/2+1);
	}
	else
		std::cout<<str;
	displayln();
}

void lndisplayln(std::string str, char c, uint width)
{
	displayln();
	if(str.length() < width)
	{
		display(c, (width-str.length())/2);
		std::cout<<str;
		if( ! ((width - str.length()) % 2) )
			display(c,(width-str.length())/2);
		else
			display(c,(width-str.length())/2+1);
	}
	else
		std::cout<<str;
	displayln();
}

void error(std::string str, char c, uint width) {
	displayln(c, width);
	displayln(c, width);
	displayln(" ");
	displayln("ERROR", ' ', width);
	displayln(" ");
	displayln(str, ' ', width);
	displayln(" ");
	displayln(c, width);
	displayln(c, width);
}

void warning(std::string str, char c, uint width) {
	displayln(c, width);
	displayln(c, width);
	displayln(" ");
	displayln("WARNING", ' ', width);
	displayln(" ");
	displayln(str, ' ', width);
	displayln(" ");
	displayln(c, width);
	displayln(c, width);
}

void message(std::string body, std::string title, uint width) {
	display("+"); displayln('-', width - 1);
	displayln("|");
	display("|"); displayln("== " + title + " ==", ' ', width - 1);
	displayln("|");
	display("|"); displayln(body, ' ', width - 1 );
	displayln("|");
	display("+"); displayln('-', width - 1);
}

void displayln(std::string varName, std::string varValue, char c, uint width) {
	displayln(c, width);
	display(c, 2);
	std::cout << ' ' << varName << " | " << varValue << std::endl;
	displayln(c, width);
}
