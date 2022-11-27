# Ce fichier permet de lancer automatiquement tout les tests de l'observateur 1
echo ============================
echo Lancement des tests sur obs1 
echo ============================
if [ $0 = "./lancer_tests_obs1.sh" ]
then
    echo test correct et accepte:
    .././curiosity-obs terrain_test programme_test_obs1_correct_accepte
    echo  
    echo test correct et rejete:
    .././curiosity-obs terrain_test programme_test_obs1_correct_rejete
    echo  
    echo test incorrect et accepte:
    .././curiosity-obs terrain_test programme_test_obs1_incorrect_accepte
    echo  
    echo test incorrect et rejete:
    .././curiosity-obs terrain_test programme_test_obs1_incorrect_rejete
    echo   
    echo =============================
else
    echo test correct et accepte:
    ./curiosity-obs programme_test_observateur/terrain_test programme_test_observateur/programme_test_obs1_correct_accepte
    echo  
    echo test correct et rejete:
    ./curiosity-obs programme_test_observateur/terrain_test programme_test_observateur/programme_test_obs1_correct_rejete
    echo  
    echo test incorrect et accepte:
    ./curiosity-obs programme_test_observateur/terrain_test programme_test_observateur/programme_test_obs1_incorrect_accepte
    echo  
    echo test incorrect et rejete:
    ./curiosity-obs programme_test_observateur/terrain_test programme_test_observateur/programme_test_obs1_incorrect_rejete
    echo   
    echo =============================
fi