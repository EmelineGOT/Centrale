#ifndef EXCEPTIONDAMIER_H
#define EXCEPTIONDAMIER_H

#include <iostream>
#include <sstream>
#include <exception>
using namespace std;

class ExceptionDamier : public exception
{
public:
    ExceptionDamier(int borne, int valeur, string fun, string file) throw();
    virtual const char* what() const throw();
private:
    int b;
    int v;
    string Nomfct;
    string NomFichier;
    string Answer;
};

#endif // EXCEPTIONDAMIER_H
