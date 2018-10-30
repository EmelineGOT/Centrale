#include <iostream>
#include <iomanip>
#include <cmath>
using namespace std;
int main()
{
  int N,i;
  double carre,racine;
  cout<<"Entrez un entier"<<endl;
  cout<<"N : "; cin>>N;
  cout<<fixed;
  cout.precision(1);

  for(i=0;i<=N;i=i+1)
  {
      carre=i*i;
      racine=sqrt(i);
      cout<<"N : "<<setw(3)<<i;
      cout<<" Racine : "<<setw(3)<<racine;
      cout<<" Carre : "<<setw(3)<<carre<<endl;
  }
  return 0;
}
