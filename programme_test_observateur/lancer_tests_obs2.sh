# Ce fichier permet de lancer automatiquement tout les tests de l'observateur 1
echo ============================
echo Lancement des tests sur obs2 
echo ============================
echo test correct et accepte:
.././curiosity-obs2 programme_test_observateur/terrain_test programme_test_observateur/programme_test_obs2_correct_accepte
echo DONE
echo test correct et rejete:
.././curiosity-obs programme_test_observateur/terrain_test programme_test_observateur/programme_test_obs2_correct_rejete
echo DONE
echo test incorrect et accepte:
.././curiosity-obs programme_test_observateur/terrain_test programme_test_observateur/programme_test_obs2_incorrect_accepte
echo DONE
echo test incorrect et rejete:
.././curiosity-obs programme_test_observateur/terrain_test programme_test_observateur/programme_test_obs2_incorrect_rejete
echo DONE 
echo =============================
