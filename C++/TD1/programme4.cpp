#include <iostream>
#include <vector>
#include <cmath>
using namespace std;
int main()
{
    int i,nb=1;
    double x,sum,moy,var=0.0;
    vector<double> t;
    cout<<"Entrez une valeur quelconque"<<endl;
    cout<<"Tapez CTRL_D suivi de <Entree> pour terminer"<<endl;
    cin>>x;
    moy=x;
    sum=x;
    t.push_back(x);
    while(cin)
    {
        cout<<"Valeur suivante :";
        cin>>x;
        if(cin) t.push_back(x);
        nb++;
        sum+=x;

    }
    cout<<"Contenu du vecteur:";
    for(i=0;i<t.size();i++)cout<<t[i]<<" ";
    cout<<endl;
    return 0;
}
