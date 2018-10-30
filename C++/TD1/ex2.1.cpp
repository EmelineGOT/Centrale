/*
**************************************************************
* Exemple 2.1 : Table de conversion fahrenheit --> celsius *
* de 0 a 100 degres fahrenheit par pas de 20 degres        *
**************************************************************
*/

#include <iostream>
#include <iomanip>
using namespace std;
int main()
{
    int inf=0,sup=100,pas=20;
    double fahr,celsius;
    cout<<"Table de conversion fahrenheit -> celsius"<<endl;
    cout<<"-----------------------------------------"<<endl<<endl;

    // ---- 1ere methode : boucle while -----
    fahr=inf;
    while(fahr<=sup)
    {
        celsius = (5.0/9.0)*(fahr-32.0);
        cout<<"En fahrenheit : "<<fahr;
        cout<<" - En celsius : "<<celsius<<endl;
        fahr = fahr + pas;
    }

    // ---- 2eme methode : boucle dowhile ----
    cout<<endl;
    fahr=inf;
    do
    {
        celsius = (5.0/9.0)*(fahr-32.0);
        cout<<"En fahrenheit : "<<fahr;
        cout<<" - En celsius : "<<celsius<<endl;
        fahr = fahr + pas;
    }
    while(fahr<=sup);

    // ---- 3eme methode : boucle for ----
    cout<<endl;
    for(fahr=inf;fahr<=sup;fahr=fahr+pas)
    {
        celsius = (5.0/9.0)*(fahr-32.0);
        cout<<"En fahrenheit : "<<fahr;
        cout<<" - En celsius : "<<celsius<<endl;
    }

    // Amélioration de la mise en page
    cout<<endl;
    cout<<fixed;
    cout.precision(2) ;
    for(fahr=inf;fahr<=sup;fahr=fahr+pas)
    {
        celsius = (5.0/9.0)*(fahr-32.0);
        cout<<"En fahrenheit : "<<setw(6)<<fahr;
        cout<<" - En celsius : "<<setw(6)<<celsius<<endl;
    }

    return 0;
}
