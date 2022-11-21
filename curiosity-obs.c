#include <stdio.h>
#include "environnement.h"
#include "observateur.h"
#include "programme.h"
#include "interprete.h"

void main(int argc, char** argv){
  if (argc<3){
    fprinft(stderr,"usage : Il faut donner un nom de fichier terrain et un nom de fichier programme");
  }
 
  Environnement envt;
  Programme prog;

  initialise_environnement(&envt, argv[1]);
  lire_programme(&prog, argv[2]); 
 
  // Mettre ici le truc qui execute le programme sur le terrain.

  


}
