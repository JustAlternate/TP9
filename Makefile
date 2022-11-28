CC=clang -Wall

#tous les executables (sauf les curiosiy-test%)
PROGRAMMES=curiosity-obs curiosity-obs2 curiosity-perf curiosity-test test_generation_terrains curiosity robot_terrain test_robot test_terrain
#tous les curiosity-test% (mis à part pour la lisibilitée)
CURIOSITY-TEST-ALL=curiosity-test0  curiosity-test1 curiosity-test2 curiosity-test3 curiosity-test4 curiosity-test5 curiosity-test6 curiosity-test7 curiosity-test8 curiosity-test9
all: $(PROGRAMMES) $(CURIOSITY-TEST-ALL)

#tous les test
tests=resultat_TP8 tests_obs1 tests_obs2
tests: $(tests)

tests_TP7:
	fichiers_test_TP7/./lance_test_tous_les_programmes_sur_tout_les_curiosity.sh

######################################################################
#                       Règles de test                               #
######################################################################

resultat_TP8: curiosity-perf
	echo
	echo RESULTAT_TP8
	resultats_TP8/./generer_resultats_programmes.sh

tests_obs1: curiosity-obs
	echo
	echo tests_obs1
	programme_test_observateur/lancer_tests_obs1.sh
	
tests_obs2: curiosity-obs2
	echo
	echo tests_obs2
	programme_test_observateur/lancer_tests_obs2.sh
	


######################################################################
#                       Règles de compilation                        #
######################################################################
%.o: %.c
	$(CC) -c $<

test_terrain.o: test_terrain.c terrain.h

test_robot.o: test_robot.c robot.h

robot_terrain.o: robot_terrain.c terrain.h robot.h

robot.o: robot.c robot.h

terrain.o: terrain.c terrain.h

observateur.o: observateur.c observateur.h programme.h
observateur2.o: observateur2.c observateur.h programme.h

environnement.o: environnement.c environnement.h observateur.h robot.h terrain.h programme.h

programme.o: programme.c programme.h type_pile.h

interprete.o: interprete.c interprete.h environnement.h \
	programme.h type_pile.h robot.h terrain.h


type_pile.o: type_pile.c type_pile.h

curiosity.o: curiosity.c environnement.h programme.h \
	interprete.h robot.h terrain.h type_pile.h

curiosity-test.o: curiosity-test.c environnement.h programme.h \
	interprete.h robot.h terrain.h type_pile.h observateur.h

generation_terrains.o: generation_terrains.c generation_terrains.h terrain.h

test_generation_terrains.o: test_generation_terrains.c generation_terrains.h terrain.h

curiosity-perf.o: curiosity-perf.c environnement.h programme.h generation_terrains.h\
	interprete.h robot.h terrain.h type_pile.h

curiosity-obs.o: curiosity-obs.c observateur.h environnement.h programme.h generation_terrains.h interprete.h robot.h terrain.h type_pile.h

#cette compilation crée des fichiers .h.gch, nous ne savons pas pourquoi et ils sont innutiles: Nous les suprimons donc automatiquement
interprete%.o: interpretei/interprete%.c interprete.h environnement.h \
	programme.h type_pile.h robot.h terrain.h
	$(CC) -c $^
	rm *.h.gch  


######################################################################
#                       Règles d'édition de liens                    #
######################################################################

test_terrain: test_terrain.o terrain.o
	$(CC) $^ -o $@

test_robot: test_robot.o robot.o
	$(CC) $^ -o $@

robot_terrain: robot_terrain.o terrain.o robot.o
	$(CC) $^ -o $@

curiosity: curiosity.o environnement.o programme.o interprete.o \
	robot.o terrain.o type_pile.o observateur.o
	$(CC) $^ -o $@

curiosity-test: curiosity-test.o environnement.o programme.o interprete.o \
	robot.o terrain.o type_pile.o observateur.o
	$(CC) $^ -o $@

test_generation_terrains: test_generation_terrains.o generation_terrains.o terrain.o
	$(CC) $^ -o $@

curiosity-perf: curiosity-perf.o environnement.o programme.o interprete.o generation_terrains.o\
	robot.o terrain.o type_pile.o observateur.o
	$(CC) $^ -o $@

curiosity-obs: curiosity-obs.o environnement.o observateur.o programme.o interprete.o generation_terrains.o robot.o terrain.o type_pile.o 
	$(CC) $^ -o $@
curiosity-obs2: curiosity-obs.o environnement.o observateur2.o programme.o interprete.o generation_terrains.o robot.o terrain.o type_pile.o 
	$(CC) $^ -o $@



#ça prend de la place mais nous n'avons pas réussis à faire autrement (le curiosity-test% ne fonctionnant pas lorsque le interprete% est dans un sous dossier)

curiosity-test0: curiosity-test.o environnement.o programme.o interprete0.o \
	robot.o terrain.o type_pile.o observateur.o
	$(CC) $^ -o $@
curiosity-test1: curiosity-test.o environnement.o programme.o interprete1.o \
	robot.o terrain.o type_pile.o observateur.o
	$(CC) $^ -o $@
curiosity-test2: curiosity-test.o environnement.o programme.o interprete2.o \
	robot.o terrain.o type_pile.o observateur.o
	$(CC) $^ -o $@
curiosity-test3: curiosity-test.o environnement.o programme.o interprete3.o \
	robot.o terrain.o type_pile.o observateur.o
	$(CC) $^ -o $@
curiosity-test4: curiosity-test.o environnement.o programme.o interprete4.o \
	robot.o terrain.o type_pile.o observateur.o
	$(CC) $^ -o $@
curiosity-test5: curiosity-test.o environnement.o programme.o interprete5.o \
	robot.o terrain.o type_pile.o observateur.o
	$(CC) $^ -o $@
curiosity-test6: curiosity-test.o environnement.o programme.o interprete6.o \
	robot.o terrain.o type_pile.o observateur.o
	$(CC) $^ -o $@
curiosity-test7: curiosity-test.o environnement.o programme.o interprete7.o \
	robot.o terrain.o type_pile.o observateur.o
	$(CC) $^ -o $@
curiosity-test8: curiosity-test.o environnement.o programme.o interprete8.o \
	robot.o terrain.o type_pile.o observateur.o
	$(CC) $^ -o $@
curiosity-test9: curiosity-test.o environnement.o programme.o interprete9.o \
	robot.o terrain.o type_pile.o observateur.o
	$(CC) $^ -o $@


######################################################################
#                       Règles de suppression                        #
######################################################################

#supprime les executables et les .o
clean:
	rm -f $(PROGRAMMES) $(CURIOSITY-TEST-ALL) *.o *.h.gch

#supprime les fichers de resultat
clean-tests:
	rm resultats_TP8/res* resultats_TP8/stats*

#supprime tout ce qui peut être créer avec le makefile( executable + .o + resultats)
clear: clean clean-tests
