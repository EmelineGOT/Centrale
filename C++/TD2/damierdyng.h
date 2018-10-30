#ifndef DAMIERDYNG_H
#define DAMIERDYNG_H

#include<iostream>
using namespace std;

template <class T>
class DamierDynG {
public:
  DamierDynG(int x, int y, T v=NULL);
  DamierDynG(const DamierDynG<T> &D);   //Constructeur de recopie
  ~DamierDynG<T>();       //Destructeur
  DamierDynG<T>& operator=(const DamierDynG<T> &D);  //Operateur d'affectation
  friend DamierDynG<T> operator+(const DamierDynG<T>& D, const DamierDynG<T>& B);
  DamierDynG<T>& operator+=(const T a);
  template<class B> friend ostream& operator<< (ostream& sortie, DamierDynG<B>& D);

  void Init(T x);
  void Set(int x, int y, T v);
  void Redim(int x, int y);
  void Print();

private:
  int nb_lignes;
  int nb_colonnes;
  T **m;

};

#endif // DAMIERDYNG_H

