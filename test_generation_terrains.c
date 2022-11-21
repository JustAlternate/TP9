#include "generation_terrains.h"
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int nb_cases_occupees(Terrain *T) {
  int occupee = 0;
  int x, y;
  for (x = 0; x < largeur(T); x++) {
    for (y = 0; y < hauteur(T); y++) {
      if (T->tab[x][y] != LIBRE)
        occupee++;
    }
  }
  return occupee;
}

// Test de generation aléatoire de terrains
// Le programme génère n terrains de largeur et hauteur fixes
// avec largeur et hauteur impaires et inférieures a dimension_max de terrain.h
// avec densité d'obstacle dObst
// autre que la case centrale soit occupee
// l'appel du programme se fait avec 5 arguments :
// generation_terrains N largeur hauteur dObstacle fichier_res
// la sortie se fait dans le fichier resultat

int main(int argc, char **argv) {
  int N, l, h;
  float dObst;
  FILE *resFile;
  Terrain T;

  if (argc < 6) {
    printf(
        "Usage: %s <N> <largeur> <hauteur> <densite_obstacle> <fichier_res> \n",
        argv[0]);
    return 1;
  }

  N = strtol(argv[1], NULL, 10);
  l = strtol(argv[2], NULL, 10);
  h = strtol(argv[3], NULL, 10);
  dObst = strtof(argv[4], NULL);

  // test de l et h
  if (l > DIM_MAX || l % 2 == 0) {
    printf("Largeur incorrecte : doit être impaire et <= %d\n", DIM_MAX);
    return 1;
  }
  if (h > DIM_MAX || h % 2 == 0) {
    printf("Hauteur incorrecte : doit être impaire et <= %d\n", DIM_MAX);
    return 1;
  }
  if ((dObst > 1) || (dObst < 0)) {
    printf("Densité incorrecte : doit être comprise entre 0 et 1\n");
    return 1;
  }

  // Ouverture du fichier résultat
  resFile = fopen(argv[5], "w");
  // Écriture du nombre de terrains
  fprintf(resFile, "%d\n", N);

  // Initialisation de la fonction random
  srand(time(NULL));

  // Génération aléatoire des terrains
  // Écriture des terrains générés dans le fichier resFile

  int terrain_genere = 0;
  float densite_obtenus_sum = 0;
  for (int i = 0; i<N; i++){
    generation_aleatoire(&T, l, h, dObst);
    terrain_genere++;
    while (! existe_chemin_vers_sortie(&T)){
      generation_aleatoire(&T,l,h,dObst);
      terrain_genere++;
    }
    ecrire_terrain(resFile, &T, l/2, h/2);

    float densite_obtenus = (float)nb_cases_occupees(&T)/((float)l*(float)h);
    densite_obtenus_sum += densite_obtenus;
    fprintf(resFile,"densite_attendus = %f\n",dObst);
    fprintf(resFile,"densite_obtenus = %f\n",densite_obtenus);

  }
  float densite_moyenne_des_terrains = densite_obtenus_sum / N;
  int pourcentage_de_terrains_valide_genere = (float)N/(float)terrain_genere *100;
  fprintf(resFile,"densite_moyenne = %f\n",densite_moyenne_des_terrains);
  fprintf(resFile,"pourcentage de terrains valide genere = %d%\n",pourcentage_de_terrains_valide_genere);
  

  // fermeture des fichiers
  fclose(resFile);
  return 0;
}
