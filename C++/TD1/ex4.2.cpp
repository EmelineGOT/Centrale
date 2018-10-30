/*
******************************************************************
* Exemple 4.2 : Entrée d'entiers positifs au clavier et stockage *
* dans un vecteur vide au depart. Agrandissement du vecteur a *
* chaque ajout *
******************************************************************
*/

#include <iostream>
#include <vector>
using namespace std;
int main()
{
    int x=1,i;
    vector<int> t;      // vecteur vide
    while(x>0)
    {
        cout<<"Valeur suivante : ";
        cin>>x;
        if(x>0) t.push_back(x);  //agrandissement et stockage
    }
    cout<<"Contenu du vecteur : ";
    for(i=0;i<t.size();i++)cout<<t[i]<<" ";
    cout<<endl;
    return 0;
}
