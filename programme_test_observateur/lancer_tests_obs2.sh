# Ce fichier permet de lancer automatiquement tout les tests de l'observateur 2
echo ============================
echo Lancement des tests sur obs2 
echo ============================
if [ $0 = "./lancer_tests_obs2.sh" ]
then
    echo test correct et accepte:
    .././curiosity-obs2 terrain_test programme_test_obs2_correct_accepte
    echo 
    echo test correct et rejete:
    .././curiosity-obs2 terrain_test programme_test_obs2_correct_rejete
    echo 
    echo test incorrect et accepte:
    .././curiosity-obs2 terrain_test programme_test_obs2_incorrect_accepte
    echo 
    echo test incorrect et rejete:
    .././curiosity-obs2 terrain_test programme_test_obs2_incorrect_rejete
    echo 
    echo =============================
else
    echo test correct et accepte:
    ./curiosity-obs2 programme_test_observateur/terrain_test programme_test_observateur/programme_test_obs2_correct_accepte
    echo 
    echo test correct et rejete:
    ./curiosity-obs2 programme_test_observateur/terrain_test programme_test_observateur/programme_test_obs2_correct_rejete
    echo 
    echo test incorrect et accepte:
    ./curiosity-obs2 programme_test_observateur/terrain_test programme_test_observateur/programme_test_obs2_incorrect_accepte
    echo 
    echo test incorrect et rejete:
    ./curiosity-obs2 programme_test_observateur/terrain_test programme_test_observateur/programme_test_obs2_incorrect_rejete
    echo 
    echo =============================
fi