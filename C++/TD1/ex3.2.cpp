
/*
*********************************************************
* Exemple3.2 : Calcul du maximum d'une serie d'entiers * *
*  quelconques entres au clavier *
*********************************************************
*/

#include <iostream>
using namespace std;
int main()
{
    int maxi,i;
    cout<<"Entrez une serie d'entiers quelconques au clavier"<<endl;
    cout<<"Tapez CTRL_D suivi de <Entree> pour terminer"<<endl;
    cin>>maxi;
    while(cin)
    {
        cin>>i;
        if(cin)
        {
            if(i>maxi)maxi=i;
            cout<<"max provisoire : "<<maxi<<endl;
        }
    }
    cout<<"Valeur du maximum : "<<maxi<<endl;
    return 0;
}
