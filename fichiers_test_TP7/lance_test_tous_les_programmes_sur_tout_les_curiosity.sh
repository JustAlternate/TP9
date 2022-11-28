# A N'EXECUTER QUE AVEC LE MAKEFILE ou bien depuis LE DOSSIER TP9. (make tests_TP7)
echo "Lancement de tous les programme_test* sur tout les curiosity-test*"
echo "================================================================="
if [ $0 == './lance_test_tous_les_programmes_sur_tout_les_curiosity.sh' ]
then
  for i in programme_test_* ; do
    echo $i
    ./testing.sh $i
  done
else
  if [ $0 == 'fichiers_test_TP7/./lance_test_tous_les_programmes_sur_tout_les_curiosity.sh' ]
  then
    for i in fichiers_test_TP7/programme_test_* ; do
      echo $i
      fichiers_test_TP7/./testing.sh $i
    done
  else
    echo "Usage: lancé soit depuis le dossier fichiers_test_TP7 ou bien avec le makefile. "
  fi

fi

