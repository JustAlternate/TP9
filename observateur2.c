
#include "observateur.h"

#include <stdio.h>

int init_etat_obs(){
  return 0;
}
 
int faire_transition(etat e, Type_Commande c, int direction){
  /* 
  Arguments : Un etat e , une command c  
  Renvoie l'état suivant en fonction de la command 
  */
  switch(e){
    case 0:
      if (c == Mesure){
        switch (direction){
          case 1:
            return 1;
          case 3:
            return 2;
          case 7:
            return 4;
          return 0;
        }
      }
      if (c == Avancer){
        return 6;
      }
      return 0;
    case 1:
      if (c == Gauche || c == Droite || c == Avancer){
        return 0;
      }
      return 1;
    case 2:
      if(c == Avancer || c == Gauche){
        return 0;
      }
      if (c == Droite){
        return 3;
      }
      return 2;
    case 3:
      if (c == Droite || c == Gauche || c == Avancer){
        return 0;
      }
      return 3;
    case 4:
      if (c == Avancer || c == Droite){
        return 0;
      }
      if (c == Gauche){
        return 3;
      }
      return 4; 
    case 6:
      return 6;
  }
  printf("attetention erreur observateur2: configuration état/action non");
  return 0;
}
