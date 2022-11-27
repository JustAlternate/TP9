#ifndef _OBSERVATEUR_H_
#define _OBSERVATEUR_H_

#include "environnement.h"
#include "programme.h"

typedef int etat;

int init_etat_obs();
int faire_transition(etat e, Type_Commande c, int direction);

#endif
