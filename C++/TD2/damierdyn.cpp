#include "damierdyn.h"

DamierDyn::DamierDyn(int x, int y, int v)
{
    m = NULL;
    Redim(x,y);

    Init(v);
}

DamierDyn::DamierDyn(const DamierDyn &D)
{
    m = NULL;
    Redim(D.nb_lignes,D.nb_colonnes);


    for (int i=0; i<nb_lignes;i++)
        for (int j=0; j<nb_colonnes; j++)
            m[i][j]=D.m[i][j];

}

DamierDyn::~DamierDyn(){
    if (m != NULL){
        for(int i=0;i<nb_lignes;i++)
            delete [] m[i];
        delete [] m;
        m=NULL;
    }
}

DamierDyn& DamierDyn::operator=(const DamierDyn &D){
    if (this !=&D){

        m=NULL;
        Redim(D.nb_lignes,D.nb_colonnes);

        for (int i=0; i<nb_lignes;i++)
            for (int j=0; j<nb_colonnes; j++)
                m[i][j]=D.m[i][j];

        return *this;
    }
}

void DamierDyn::Init(int x){
    for (int i=0; i<nb_lignes;i++)
        for (int j=0; j<nb_colonnes; j++)
            m[i][j]=x;
}

void DamierDyn::Set(int x, int y, int v){
    if (x>=0 && x<nb_lignes && y>=0 && y<nb_colonnes)
        m[x][y]=v;
}

void DamierDyn::Print(){
    for (int i=0;i<nb_lignes;i++){
        for(int j=0;j<nb_colonnes;j++){
            cout << m[i][j] << " ";
        }
        cout << endl;
    }
}


void DamierDyn::Redim(int x, int y){
    if(m != NULL){
        for (int i=0; i<nb_lignes; i++)
            delete [] m[i];

        delete [] m;
    }

    nb_lignes=x;
    nb_colonnes=y;

    m = new int*[nb_lignes];
    for(int i=0; i<nb_lignes;i++)
        m[i] = new int[nb_colonnes];

    Init(0);
}


DamierDyn operator+(const DamierDyn& D, const DamierDyn& B){
    if (D.nb_colonnes==B.nb_colonnes & D.nb_lignes==B.nb_lignes){
        DamierDyn C(D);

        for (int i=0; i<C.nb_lignes;i++)
            for (int j=0; j<C.nb_colonnes; j++)
                C.m[i][j]=D.m[i][j]+B.m[i][j];
        return C;
    }
}

DamierDyn& DamierDyn::operator+=(int a){
    for (int i=0;i<nb_lignes;i++)
        for(int j=0;j<nb_colonnes;j++)
            m[i][j]+=a;
    return *this;
}

ostream& operator<< (ostream& sortie, DamierDyn& D){
    for (int i=0; i<D.nb_lignes;i++){
        for (int j=0; j<D.nb_colonnes; j++){
            sortie << D.m[i][j] << " ";
        }
        sortie << endl;
    }
    return sortie;
}



