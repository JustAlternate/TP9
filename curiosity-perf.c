#include "environnement.h"
#include "interprete.h"
#include "programme.h"
#include "generation_terrains.h"

#include <stdio.h>
#include <stdlib.h>

void gestion_erreur_terrain(erreur_terrain e) {
  switch (e) {
  case OK:
    break;
  case ERREUR_FICHIER:
    printf("Erreur lecture du terrain : erreur d'ouverture du fichier\n");
    exit(1);
  case ERREUR_LECTURE_LARGEUR:
    printf("Erreur lecture du terrain : erreur de lecture de la largeur\n");
    exit(1);
  case ERREUR_LECTURE_HAUTEUR:
    printf("Erreur lecture du terrain : erreur de lecture de la hauteur\n");
    exit(1);
  case ERREUR_LARGEUR_INCORRECTE:
    printf("Erreur lecture du terrain : largeur incorrecte\n");
    exit(1);
  case ERREUR_HAUTEUR_INCORRECTE:
    printf("Erreur lecture du terrain : hauteur incorrecte\n");
    exit(1);
  case ERREUR_CARACTERE_INCORRECT:
    printf("Erreur lecture du terrain : caractère incorrect\n");
    exit(1);
  case ERREUR_LIGNE_TROP_LONGUE:
    printf("Erreur lecture du terrain : ligne trop longue\n");
    exit(1);
  case ERREUR_LIGNE_TROP_COURTE:
    printf("Erreur lecture du terrain : ligne trop courte\n");
    exit(1);
  case ERREUR_LIGNES_MANQUANTES:
    printf("Erreur lecture du terrain : lignes manquantes\n");
    exit(1);
  case ERREUR_POSITION_ROBOT_MANQUANTE:
    printf(
        "Erreur lecture du terrain : position initiale du robot manquante\n");
    exit(1);
  }
}

void affichage_position_programme(erreur_programme e) {
  int i;
  printf("Ligne %d, colonne %d :\n", e.num_ligne, e.num_colonne);
  printf("%s\n", e.ligne);
  /* Impression de e.num_colonne-1 espaces */
  for (i = 1; i < e.num_colonne; i++) {
    printf(" ");
  }
  /* Impression d'un curseur de position */
  printf("^\n");
}

void gestion_erreur_programme(erreur_programme e) {
  switch (e.type_err) {
  case OK_PROGRAMME:
    break;
  case ERREUR_FICHIER_PROGRAMME:
    printf("Erreur lecture du programme : erreur d'ouverture du fichier\n");
    exit(2);
  case ERREUR_BLOC_NON_FERME:
    printf("Erreur lecture du programme : bloc non fermé\n");
    exit(2);
  case ERREUR_FERMETURE_BLOC_EXCEDENTAIRE:
    printf("Erreur lecture du programme : fermeture de bloc excédentaire\n");
    affichage_position_programme(e);
    exit(2);
  case ERREUR_COMMANDE_INCORRECTE:
    printf("Erreur lecture du programme : commande incorrecte\n");
    affichage_position_programme(e);
    exit(2);
  }
}

int main(int argc, char **argv) {
  Environnement envt;
  Programme prog;
  erreur_programme errp;
  etat_inter etat;
  resultat_inter res;
  Terrain T;
  Robot R;

  int N, l, h, graine, nb_step_max;
  char *fichier_programme, *fichier_res;
  float dObst;
  int nb_sorti = 0, nb_bloque = 0, nb_tombe = 0, nb_ecrase = 0, somme_pas = 0, pas;

  if (argc < 9) {
    printf("Usage: %s <fichier_programme> <N> <L> <H> <d> <graine> <nb_step_max> <fichier_res>\n", argv[0]);
    return 1;
  }
  fichier_programme = argv[1];
  N = strtol(argv[2], NULL, 10);
  l = strtol(argv[3], NULL, 10);
  h = strtol(argv[4], NULL, 10);
  dObst = strtof(argv[5], NULL);
  graine = strtol(argv[6], NULL, 10);
  nb_step_max = strtol(argv[7], NULL, 10);
  fichier_res = argv[8];

  srand(graine);

  FILE *f = fopen(fichier_res,"w");
  if(f == NULL){
    printf("fichier resultat invalide");
    return 1;
  }
  fprintf(f, "%d\n", N);

  for (int i = 0; i < N; i++)
  {
    R.o = Est;
    R.x = l / 2;
    R.y = h / 2;
    envt.r = R;
    do
    {
      generation_aleatoire(&T, l, h, dObst);
    } while (!existe_chemin_vers_sortie(&T));
    envt.t = T;


    /* Lecture du programme */
    errp = lire_programme(&prog, fichier_programme);
    gestion_erreur_programme(errp);

    /* Initialisation de l'état */
    init_etat(&etat);
    pas = 0;
    do
    {
        res = exec_pas(&prog, &envt, &etat);
        /* Affichage du terrain et du robot */
        //afficher_envt(&envt);
        pas++;
        //printf("pas:%d\n", pas);
        // printf("1");
    } while (res == OK_ROBOT && pas < nb_step_max);

    /* Affichage du résultat */
    switch (res) {
    case OK_ROBOT:
    //printf("Robot sur une case libre, programme non terminé (ne devrait pas "
            //"arriver)\n");
    fprintf(f, "-1\n");
    nb_bloque++;
    break;
    case SORTIE_ROBOT:
    //printf("Le robot est sorti :-)\n");
    fprintf(f, "%d\n", pas);
    //printf("pas : %d\n",pas);
    nb_sorti++;
    somme_pas += pas;
    break;
    case ARRET_ROBOT:
    //printf("Robot sur une case libre, programme terminé :-/\n");
    fprintf(f, "-1\n");
    nb_bloque++;
    break;
    case PLOUF_ROBOT:
    //printf("Le robot est tombé dans l'eau :-(\n");
    fprintf(f, "-2\n");
    nb_tombe++;
    break;
    case CRASH_ROBOT:
    //printf("Le robot s'est écrasé sur un rocher X-(\n");
    fprintf(f, "-3\n");
    nb_ecrase++;
    break;
    case ERREUR_PILE_VIDE:
    //printf("ERREUR : pile vide\n");
    fprintf(f, "-4\n");
    break;
    case ERREUR_ADRESSAGE:
    //printf("ERREUR : erreur d'adressage\n");
    fprintf(f, "-4\n");
    break;
    case ERREUR_DIVISION_PAR_ZERO:
    //printf("ERREUR : division par 0\n");
    fprintf(f, "-4\n");
    break;
    }
  }
  printf("nombre total de test: %d\nnombre d'erreur:%d\nnombre de réussite:%d\nnombre d'échec:%d\n"
  "  -tombé dans l'eau:%d\n  -écrasé contre un rocher:%d\n  -il est perdu:%d\n"
  "nombre moyen de pas effectué pour les sorties:%f\n",
  N, N - (nb_sorti + nb_bloque + nb_ecrase + nb_tombe), nb_sorti, nb_bloque + nb_ecrase + nb_tombe,
  nb_tombe, nb_ecrase, nb_bloque, 
  (float)somme_pas / (float)nb_sorti);
  fclose(f);
  printf("somme pas: %d\n", somme_pas);
}
