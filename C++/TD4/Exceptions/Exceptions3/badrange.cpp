#include "badrange.h"

bad_range::bad_range(int pos, int Taille) throw()
{
    position = pos;
    TailleTableau = Taille;

    Answer += "GROSSIERE ERREUR\n";
    Answer += "Indice tableau classe VectT incorrect!";
    Answer += "La taille est de " + to_string(TailleTableau);
    Answer += ", alors que l'indice demandé est " + to_string(position);
}

const char* bad_range::what() const throw()
{
    return Answer.c_str();
}

