# Ce fichier permet de generer automatiquement les statistiques pour les programme 1 et 3 du compte rendu.

if [ $0 != "resultats_TP8/./generer_resultats_programmes.sh" ]
then
   echo resultats programme 1 configuration 1:
  .././curiosity-perf ../programme-test_TP8/programme-test1 20 25 25 0.4 69 1000 res_programme1_config1 > stats_programme1_config1
  echo DONE
  echo resultats programme 1 configuration 2:
  .././curiosity-perf ../programme-test_TP8/programme-test1 20 9 9 0.7 69 1000 res_programme1_config2 > stats_programme1_config2
  echo DONE
  echo resultats programme 3 configuration 1:
  .././curiosity-perf ../programme-test_TP8/programme-test3 20 25 25 0.4 69 1000 res_programme3_config1 > stats_programme3_config1
  echo DONE
  echo resultats programme 3 configuration 2:
  .././curiosity-perf ../programme-test_TP8/programme-test3 20 9 9 0.7 69 1000 res_programme3_config2 > stats_programme3_config2
  echo DONE
else
  echo resultats programme 1 configuration 1:
  ./curiosity-perf programme-test_TP8/programme-test1 20 25 25 0.4 69 1000 resultats_TP8/res_programme1_config1 > resultats_TP8/stats_programme1_config1 
  echo DONE
  echo resultats programme 1 configuration 2:
  ./curiosity-perf programme-test_TP8/programme-test1 20 9 9 0.7 69 1000 resultats_TP8/res_programme1_config2 > resultats_TP8/stats_programme1_config2
  echo DONE
  echo resultats programme 3 configuration 1:
  ./curiosity-perf programme-test_TP8/programme-test3 20 25 25 0.4 69 1000 resultats_TP8/res_programme3_config1 > resultats_TP8/stats_programme3_config1
  echo DONE
  echo resultats programme 3 configuration 2:
  ./curiosity-perf programme-test_TP8/programme-test3 20 9 9 0.7 69 1000 resultats_TP8/res_programme3_config2 > resultats_TP8/stats_programme3_config2
  echo DONE
fi
