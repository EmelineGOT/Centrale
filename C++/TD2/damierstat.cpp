#include "damierstat.h"

DamierStat::DamierStat(){

}

void DamierStat::Init(int x){
    int i; int j;
    for (i=0; i<nb_lignes; i++){
        for (j=0; j<nb_colonnes; j++){
            m[i][j]=x;
        }
    }
}

void DamierStat::Set(int x, int y, int v){
    if (x>=0 && x<nb_lignes && y>=0 && y<nb_colonnes)
        m[x][y]=v;
}

void DamierStat::Print(){
    int i; int j;
    for (i=0;i<nb_lignes;i++){
        for(j=0;j<nb_colonnes;j++){
            cout << m[i][j] << ",";
        }
        cout << endl;
    }
}
