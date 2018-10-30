#ifndef DAMIERSTAT_H
#define DAMIERSTAT_H
#include <vector>
#include <iostream>
using namespace std;


class DamierStat
{
public:
    DamierStat();
    void Init(int x);
    void Set(int x, int y, int v);
    void Print();
private:
    int nb_lignes=4;
    int nb_colonnes=5;
    int m[4][5];
};

#endif // DAMIERSTAT_H
