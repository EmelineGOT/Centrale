#include <iostream>
#include <cmath>
using namespace std;
int main()
{
    int a,r;
    cout<<"Entrez un entier"<<endl;
    cout<<"a : "; cin>>a;
    r=a%2;
    if(r==0)
        cout<<"Le nombre est pair"<<endl;
    else
        cout<<"Le nombre est impair"<<endl;
    return 0;
}
