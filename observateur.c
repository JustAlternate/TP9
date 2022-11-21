
#include "observateur.h"

#include <stdio.h>

int verif_commande(etat e, char* programme){
  /*
  Renvoie un 0 si le programme n'est pas valide.
  sinon renvoie un 1
  */
  for (int i = 0; programme[i]!='\0'; i++){
    e = faire_transition(e,programme[i]);
  }
  if (etat == 2){
    return 0;
  }
  return 1;
}
 
int faire_transition(etat e, command transition){
  /* 
  Arguments : Un etat e , une command c  
  Renvoie l'état suivant en fonction de la command 
  */
  switch(e){
    case 0:
      if (transition == "G" || transition == "D"){
        return 0;
      }
      if (transition == "M"){
        return 1;
      }
      if (transition == "A"){
        return 2;
      } 
      return 0;
    case 1:
      if (transition == "G" || transition == "D" || transition == "A"){
        return 0;
      }
      if (transition == "M"){
        return 1;
      }
      return 1; 
    case 2:
      return 2; 
  }
}



