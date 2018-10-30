/*
******************************************************************
* Exemple 4.1 : Entrée d'une série d’entiers positifs au clavier *
* et stockage dans un vecteur a taille predefinie *
******************************************************************
*/

#include <iostream>
#include <vector>
using namespace std;
int main()
{
    int nb=0,x=1,i;
    vector<int> v(100);
    while(x>0)
    {
        cout<<"Valeur suivante : ";
        cin>>x;
        if(x>0)
        {
             v[nb]=x; nb++;
        }
    }
    cout<<"Contenu du vecteur : ";
    for(i=0;i<nb;i++)
        cout<<v[i]<<" ";
    cout<<endl;
    cout<<"Taille du vecteur : "<<v.size()<<endl;
    cout<<"Place occupee : "<<nb<<endl;
    return 0;
}
