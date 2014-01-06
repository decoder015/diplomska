#ifndef _DISPLAY_
#define _DISPLAY_

#include <iostream>
#include <string>
#include <typeinfo>
#include <stdexcept>
#include <sstream>

typedef unsigned int uint;

/* Declarations and inline functions */
/* Convert to String */
class BadConversion : public std::runtime_error {
public:
	BadConversion(const std::string& s)
	: std::runtime_error(s)
	{ }
};

template<typename T>
inline std::string toString(const T& x){
	std::ostringstream o;
	if (!(o << x))
		throw BadConversion(std::string("toString(") + typeid(x).name() + ")");
	return o.str();
}

/* Display Functions */
inline void display(double i){std::cout<<i;}
inline void display(uint i){std::cout<<i;}
inline void display(std::string str){std::cout<<str;}
inline void displayln(){std::cout<<std::endl;}
inline void displayln(double i){std::cout<<i<<std::endl;}
inline void displayln(uint i){std::cout<<i<<std::endl;}
inline void displayln(std::string str){std::cout<<str<<std::endl;}
inline void lndisplayln(std::string str) {
	std::cout<<std::endl<<str<<std::endl;
}
void display(const char c,const uint n);
void displayln(const char c,const uint n);
void lndisplayln(const char c,const uint n);
void display(std::string str,char c,uint width);
void displayln(std::string str,char c,uint width);
void lndisplayln(std::string str,char c,uint width);

/* Error Functions */
void error(std::string str, char c = '#', uint width = 80);
/* Warning Functions */
void warning(std::string str, char c = '*', uint width = 80);
/* Message */
void message(std::string body, std::string title = "Message", uint width = 80);
/* display variables */
void displayln(std::string varName, std::string varValue, char c = '-', uint width = 25);

#endif /* _DISPLAY_ */
