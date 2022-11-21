
#include "observateur.h"

#include <stdio.h>

int init_etat_obs(){
  return 0;
}
 
int faire_transition(etat e, Type_Commande c){
  /* 
  Arguments : Un etat e , une command c  
  Renvoie l'état suivant en fonction de la command 
  */
  switch(e){
    case 0:
      if (c == Gauche || c == Droite){
        return 0;
      }
      if (c == Mesure){
        return 1;
      }
      if (c == Avancer){
        return 2;
      } 
      return 0;
    case 1:
      if (c == Gauche || c == Droite || c == Avancer){
        return 0;
      }
      if (c == Mesure){
        return 1;
      }
      return 1; 
    case 2:
      return 2; 
  }
}



