#include "damierexc.h"
#include "exceptiondamier.h"

DamierExc::DamierExc(int l, int c, int b)
{
    Alloc(l, c);
    B=b;
    Init(0);
}

DamierExc::DamierExc(const DamierExc &D)
{
    Alloc(D.L, D.C);

    for(int i=0; i<L; i++)
        for(int j=0; j<C; j++)
            T[i][j] = D.T[i][j];
}


DamierExc::~DamierExc(){
    if (T != NULL) {
        Free();
        T = NULL;
    }
}

void DamierExc::Free(){
    for (int i=0; i<L; i++) {
        delete [] T[i];
    }
    delete [] T;
}

void DamierExc::Alloc(int l, int c){
    L = l;
    C = c;
    T = new int*[L];
    for(int i=0; i<L; i++)
        T[i] = new int[C];
}

void DamierExc::Print(){
    cout << endl;
    for(int i=0; i<L; i++) {
        cout << endl;
        for(int j=0; j<C; j++)
            cout << T[i][j] << ", ";
    }
}

void DamierExc::Init(int value){
    if (value>B || value<0){
        string file(__FILE__);
        string fun(__PRETTY_FUNCTION__);
        ExceptionDamier e(B,value,fun,file);
        throw(e);
    }
    for(int i=0; i<L; i++)
        for(int j=0; j<C; j++)
            T[i][j]=value;
}

void DamierExc::Set(int x, int y, int value) {
    if (x<0 || x>L || y<0 || y>C)
        throw("Accès case damier incorrecte");
    if (value>B || value<0){
        string file(__FILE__);
        string fun(__PRETTY_FUNCTION__);
        ExceptionDamier e(B,value,fun,file);
        throw (e);
    }

    T[x][y]=value;

}


void DamierExc::ReDim(int l, int c) {
    Free();
    Alloc(l, c);
    Init(0);
}

DamierExc& DamierExc::operator= (const DamierExc &D){
    if ( this != &D) { // protection autoréférence
        Free();
        Alloc(D.L, D.C);
        for(int i=0; i<L; i++)
            for(int j=0; j<C; j++)
                T[i][j] = D.T[i][j];
    }
    return *this;
}

bool DamierExc::sameDimensions (const DamierExc &D) {
    if ((L == D.L) && (C == D.C))
        return true;
    return false;
}

DamierExc& DamierExc::operator+= (int c)
{
    B+=c;
    for(int i=0; i<L; i++)
        for(int j=0; j<C; j++)
            T[i][j] += c;
    return *this;
}

DamierExc& DamierExc::operator+= (const DamierExc &D)
{
    if (!sameDimensions(D)){
        cerr << endl << __PRETTY_FUNCTION__ << " - Dimensions différentes !\n";
        exit(1);
    }
    B+=D.B;
    for(int i=0; i<L; i++)
        for(int j=0; j<C; j++)
            T[i][j] += D.T[i][j];
    return *this;
}


DamierExc DamierExc::operator+ (const DamierExc &D1)
{
    if (!sameDimensions(D1)){
        cerr << endl << __PRETTY_FUNCTION__ << " - Dimensions différentes !\n";
        exit(1);
    }

    DamierExc D(D1.L, D1.C,D1.B);
    for(int i=0; i<L; i++)
        for(int j=0; j<C; j++)
            D.T[i][j] = T[i][j]+D1.T[i][j];

    return D;
}

ostream& operator<< (ostream& sortie, DamierExc& V)
{
    sortie << endl;
    for(int i=0; i<V.L; i++) {
        sortie << endl;
        for(int j=0; j<V.C; j++)
            sortie << V.T[i][j] << ", ";
    }

    return sortie;
}
