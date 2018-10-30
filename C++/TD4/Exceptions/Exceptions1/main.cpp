#include <iostream>
#include <cmath>
using namespace std;


void racine(double d)
{
    double h = sqrt(d);
    if (d < 0)
        throw 1;
    cout << "Racine (" << d << ") = " << h << endl;
}

int main()
{
    double d;
    cout << "Entrez un double : " << endl;
    cin >> d;
    try {
        racine(d);
    } catch (int n) {
        if (n == 1) {
            cout << "Nbre neg ! On prend la val abs" << endl;
            racine(-d);
        }
    }

    return 0;
}
