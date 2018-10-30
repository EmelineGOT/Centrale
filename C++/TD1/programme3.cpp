#include <iostream>
using namespace std;
int main()
{
    int maxi,mini,i,nb=1;
    double moy=0.0;
    cout<<"Entrez une serie d'entiers au clavier"<<endl;
    cout<<"Tapez CTRL_D suivi de <Entree> pour terminer"<<endl;
    cin>>maxi;
    mini=maxi;
    moy=maxi;
    while(cin)
    {
        cin>>i;
        if(cin)
        {
            if(i>maxi)maxi=i;
            if(i<mini)mini=i;
            moy+=i;
            nb+=1;
            cout<<"min provisoire : "<<mini<<endl;
            cout<<"max provisoire : "<<maxi<<endl;
        }
    }
    cout<<"Minimum = "<<mini<<endl;
    cout<<"Maximum = "<<maxi<<endl;
    moy=moy/nb;
    cout<<"Moyenne = "<<moy<<endl;
    return 0;
}
