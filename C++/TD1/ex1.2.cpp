/*
*************************************************************
* Exemple 1.2 : Resolution d'une equation du second degre *
*************************************************************
*/
#include <iostream>
#include <cmath>
using namespace std;
int main()
{
        int a,b,c;
        double delta,x1,x2;
        cout<<"Entrez les coefficients"<<endl;
        cout<<"a : ";cin>>a;
        cout<<"b : ";cin>>b;
        cout<<"c : ";cin>>c;
        delta=b*b-4*a*c;
        if(delta < 0)
            cout<<"pas de racines reelles"<<endl;
        else
            if(delta>0)
            {
                x1=(-b+sqrt(delta))/(2*a);
                x2=(-b-sqrt(delta))/(2*a);
                cout<<"x1 = "<<x1<<endl;
                cout<<"x2 = "<<x2<<endl;
            }
        else
            {
                x1=x2=-b/(2*a);
                cout<<"racine double x1=x2= "<<x1<<endl;
            }
        return 0;
}
