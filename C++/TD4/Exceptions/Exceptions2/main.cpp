#include <iostream>
using namespace std;

#include "Vecteur.h"

int main()
{
    int n, i;
    double x;

    try {
        cout << "n ? ";
        cin >> n;
        Vecteur t(n);

        cout << "i, t[i] ? ";
        cin >> i >> x;
        t.SetValue(i, x);
        cout << "t[" << i << "] = " << x << endl;
    } catch (const char* message) { // origine : IndiceValide
        cerr << "Probleme: " << message << endl;
    } catch (bad_alloc) { // origine : new
        cerr << "Probleme d'allocation de memoire\n";
    } catch (...) { // toutes les autres exceptions
        cerr << "Probleme indetermine\n";
    }

    cout << " - Termine\n";
    return 0;
}
