#include <stdio.h>
#include "environnement.h"
#include "observateur.h"
#include "programme.h"
#include "interprete.h"

int main(int argc, char** argv){
  Environnement envt;
  Programme prog;
  etat_inter etat;
  
  
  
  if (argc<3){
    fprintf(stderr,"usage : Il faut donner un nom de fichier terrain et un nom de fichier programme");
  }

  initialise_environnement(&envt, argv[1]);
  lire_programme(&prog, argv[2]); 

  init_etat(&etat);
  resultat_inter res;
  do
  {
    res = exec_pas(&prog, &envt, &etat);
    /* Affichage du terrain et du robot */
    afficher_envt(&envt);
  } while (res == OK_ROBOT && est_accepteur(envt.etat));

  if(!est_accepteur(envt.etat)){
    printf("le programme est incorect\n"); 
    return 1;
  }
  else{
    printf("le programme est correct, voici le résultat de l'exécution:\n");
  }

  switch (res) {
  case OK_ROBOT:
    printf("Robot sur une case libre, programme non terminé (ne devrait pas "
           "arriver)\n");
    break;
  case SORTIE_ROBOT:
    printf("Le robot est sorti :-)\n");
    break;
  case ARRET_ROBOT:
    printf("Robot sur une case libre, programme terminé :-/\n");
    break;
  case PLOUF_ROBOT:
    printf("Le robot est tombé dans l'eau :-(\n");
    break;
  case CRASH_ROBOT:
    printf("Le robot s'est écrasé sur un rocher X-(\n");
    break;
  case ERREUR_PILE_VIDE:
    printf("ERREUR : pile vide\n");
    break;
  case ERREUR_ADRESSAGE:
    printf("ERREUR : erreur d'adressage\n");
    break;
  case ERREUR_DIVISION_PAR_ZERO:
    printf("ERREUR : division par 0\n");
    break;
  }

  // Mettre ici le truc qui execute le programme sur le terrain.

  return 1;
}

