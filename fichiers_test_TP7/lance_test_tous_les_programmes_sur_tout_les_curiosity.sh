# A N'EXECUTER QUE AVEC LE MAKEFILE ou bien depuis LE DOSSIER TP9. (make tests_TP7)
echo "Lancement de tous les programme_test* sur tout les curiosity-test*"
echo "================================================================="
if [ $0 == './lance_test_tous_les_programmes_sur_tout_les_curiosity.sh' ]
then
  for i in programme_test_* ; do
    echo ========================================
    echo $i
    echo ========================================
    ./testing.sh $i
  done
else
    cd fichiers_test_TP7
    for i in programme_test_* ; do
      echo ========================================
      echo $i
      echo ========================================
      ./testing.sh $i
    done
fi

