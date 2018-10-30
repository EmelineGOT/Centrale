#include "exceptiondamier.h"

ExceptionDamier::ExceptionDamier(int borne, int valeur, string fun, string file ) throw()
{
    b=borne;
    v=valeur;
    Nomfct=fun;
    NomFichier=file;

    Answer += "ERREUR\n";
    Answer += "La valeur demandée " + to_string(v);
    Answer += " n'est pas dans la borne du tableau, qui est " + to_string(b);
    Answer += "\n Erreur dans la fonction : " + Nomfct;
    Answer += "\n Dans le fichier : " + NomFichier;

}

const char* ExceptionDamier::what() const throw(){
    return Answer.c_str();
}
