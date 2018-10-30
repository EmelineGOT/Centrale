#include "damierdyn.h"

DamierDyn::DamierDyn(int l, int c, int vd)
{
    L = l;
    C = c;
    Alloc();
    Init(vd);
}

DamierDyn::DamierDyn(const DamierDyn &D) {
    L = D.L;
    C = D.C;
    Alloc();

    for(int i=0; i<L; i++) {
        for(int j=0; j<C; j++){
            T[i][j] = D.T[i][j];
        }
    }
}


DamierDyn::~DamierDyn(){
    if (T != NULL) {
        Free();
        T = NULL;
    }
}

void DamierDyn::Free(){
    for (int i=0; i<L; i++) {
        delete [] T[i];
    }
    delete [] T;
}

void DamierDyn::Alloc(){
    T = new int*[L];
    for(int i=0; i<L; i++)
        T[i] = new int[C];
}

void DamierDyn::Print(){
    cout << endl;
    for(int i=0; i<L; i++) {
        cout << endl;
        for(int j=0; j<C; j++){
            cout << T[i][j] << ", ";
        }
    }
}

void DamierDyn::Init(int value){
    for(int i=0; i<L; i++)
        for(int j=0; j<C; j++)
            T[i][j]=value;
}

void DamierDyn::Set(int x, int y, int value) {
    T[x][y]=value;
}


void DamierDyn::ReDim(int l, int c, int vd) {
    Free();
    L = l;
    C = c;
    Alloc();
    Init(vd);
}

