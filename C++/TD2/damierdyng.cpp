#include "DamierDynG.h"

template <class T>
DamierDynG<T>::DamierDynG(int x, int y, T v)
{
    m = NULL;
    Redim(x,y);

    Init(v);
}

template <class T>
DamierDynG<T>::DamierDynG(const DamierDynG<T> &D)
{
    m = NULL;
    Redim(D.nb_lignes,D.nb_colonnes);


    for (int i=0; i<nb_lignes;i++)
        for (int j=0; j<nb_colonnes; j++)
            m[i][j]=D.m[i][j];

}

template <class T>
DamierDynG<T>::~DamierDynG<T>(){
    if (m != NULL){
        for(int i=0;i<nb_lignes;i++)
            delete [] m[i];
        delete [] m;
        m=NULL;
    }
}

template <class T>
DamierDynG<T>& DamierDynG<T>::operator=(const DamierDynG<T> &D){
    if (this !=&D){

        m=NULL;
        Redim(D.nb_lignes,D.nb_colonnes);

        for (int i=0; i<nb_lignes;i++)
            for (int j=0; j<nb_colonnes; j++)
                m[i][j]=D.m[i][j];

        return *this;
    }
}

template <class T>
void DamierDynG<T>::Init(T x){
    for (int i=0; i<nb_lignes;i++)
        for (int j=0; j<nb_colonnes; j++)
            m[i][j]=x;
}

template <class T>
void DamierDynG<T>::Set(int x, int y, T v){
    if (x>=0 && x<nb_lignes && y>=0 && y<nb_colonnes)
        m[x][y]=v;
}

template <class T>
void DamierDynG<T>::Print(){
    for (int i=0;i<nb_lignes;i++){
        for(int j=0;j<nb_colonnes;j++){
            cout << m[i][j] << " ";
        }
        cout << endl;
    }
}

template <class T>
void DamierDynG<T>::Redim(int x, int y){
    if(m != NULL){
        for (int i=0; i<nb_lignes; i++)
            delete [] m[i];

        delete [] m;
    }

    nb_lignes=x;
    nb_colonnes=y;

    m = new T*[nb_lignes];
    for(int i=0; i<nb_lignes;i++)
        m[i] = new T[nb_colonnes];

    Init(NULL);
}


template <class T>
DamierDynG<T> operator+(const DamierDynG<T>& D, const DamierDynG<T>& B){
    if (D.nb_colonnes==B.nb_colonnes & D.nb_lignes==B.nb_lignes){
        DamierDynG<T> C(D);

        for (int i=0; i<C.nb_lignes;i++)
            for (int j=0; j<C.nb_colonnes; j++)
                C.m[i][j]=D.m[i][j]+B.m[i][j];
        return C;
    }
}

template <class T>
DamierDynG<T>& DamierDynG<T>::operator+=(T a){
    for (int i=0;i<nb_lignes;i++)
        for(int j=0;j<nb_colonnes;j++)
            m[i][j]+=a;
    return *this;
}

template <class T>
ostream& operator<< (ostream& sortie, DamierDynG<T>& D){
    for (int i=0; i<D.nb_lignes;i++){
        for (int j=0; j<D.nb_colonnes; j++){
            sortie << D.m[i][j] << " ";
        }
        sortie << endl;
    }
    return sortie;
}

//Instantiating the class VectT
template class DamierDynG<float>;
//Instantiating friend function operator<<
template ostream& operator<<(ostream& sortie, DamierDynG<float>& D);

//Instantiating the class VectT
template class DamierDynG<bool>;
//Instantiating friend function operator<<
template ostream& operator<<(ostream& sortie, DamierDynG<bool>& V);



