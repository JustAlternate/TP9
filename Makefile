CC=clang -Wall
curiosity-test-all=curiosity-test0  curiosity-test1 curiosity-test2 curiosity-test3 curiosity-test4 curiosity-test5 curiosity-test6 curiosity-test7 curiosity-test8 curiosity-test9

PROGRAMMES=curiosity-obs curiosity-perf curiosity-test test_generation_terrains curiosity robot_terrain test_robot test_terrain curiosity-test%
all: $(PROGRAMMES) $(curiosity-test-all)



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

# chiant

interprete0.o: interpretei/interprete0.c interprete.h environnement.h \
	programme.h type_pile.h robot.h terrain.h
	$(CC) -g $^
interprete1.o: interpretei/interprete1.c interprete.h environnement.h \
	programme.h type_pile.h robot.h terrain.h
	$(CC) -g $^
interprete2.o: interpretei/interprete2.c interprete.h environnement.h \
	programme.h type_pile.h robot.h terrain.h
	$(CC) -g $^
interprete3.o: interpretei/interprete3.c interprete.h environnement.h \
	programme.h type_pile.h robot.h terrain.h
	$(CC) -g $^
interprete4.o: interpretei/interprete4.c interprete.h environnement.h \
	programme.h type_pile.h robot.h terrain.h
	$(CC) -g $^
interprete5.o: interpretei/interprete5.c interprete.h environnement.h \
	programme.h type_pile.h robot.h terrain.h
	$(CC) -g $^
interprete6.o: interpretei/interprete6.c interprete.h environnement.h \
	programme.h type_pile.h robot.h terrain.h
	$(CC) -g $^
interprete7.o: interpretei/interprete7.c interprete.h environnement.h \
	programme.h type_pile.h robot.h terrain.h
	$(CC) -g $^
interprete8.o: interpretei/interprete8.c interprete.h environnement.h \
	programme.h type_pile.h robot.h terrain.h
	$(CC) -g $^
interprete9.o: interpretei/interprete9.c interprete.h environnement.h \
	programme.h type_pile.h robot.h terrain.h
	$(CC) -g $^

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

clean:
	rm -f $(PROGRAMMES) *.o

clear: clean