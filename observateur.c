
#include "observateur.h"

#include <stdio.h>

int init_etat_obs(){
  return 0;
}
 
int faire_transition(etat e, Type_Commande c, int direction){//int direction n'est pas utilisé mais est utile pour que observateur 1 et 2 aient le même observateur.h
  /* 
  Arguments : Un etat e , une command c  
  Renvoie l'état suivant en fonction de la command 
  */
  switch (e)
  {
  case 0:
    if (c == Gauche || c == Droite)
    {
      return 0;
    }
    if (c == Mesure)
    {
      return 1;
    }
    if (c == Avancer)
    {
      return 2;
    }
    return 0;
  case 1:
    if (c == Gauche || c == Droite || c == Avancer)
    {
      return 0;
    }
    if (c == Mesure)
    {
      return 1;
    }
    return 1;
  case 2:
    return 2;
  }
  return -1;
}


int est_accepteur(int etat){
  if(etat == 2){
    return 0; // etat non accepteur
  }else{
    return 1; //etat accepteur
  }
}