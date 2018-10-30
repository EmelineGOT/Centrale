
#ifndef BADRANGE_H_
#define BADRANGE_H_

#include <iostream>
#include <sstream>
#include <exception>
using namespace std;

class bad_range: public exception {
public:
    bad_range(int pos, int Taille) throw();
    virtual const char* what() const throw();
private:
    int position;
    int TailleTableau;
    string Answer;
};

#endif 
