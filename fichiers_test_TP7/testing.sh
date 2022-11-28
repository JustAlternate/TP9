# A NEXECUTER QUE AVEC LE MAKE FILE EN FAISANT make tests_curiosity
if [ $# -eq 1 ]
then
  if [ $0 == 'fichiers_test_TP7/./testing.sh' ]
  then
    echo curiosity-test0 avec $1 :
    ./curiosity-test0 fichiers_test_TP7/$1
    echo curiosity-test1 avec $1 :
    ./curiosity-test1 fichiers_test_TP7/$1
    echo curiosity-test2 avec $1 :
    ./curiosity-test2 fichiers_test_TP7/$1
    echo curiosity-test3 avec $1 :
    ./curiosity-test3 fichiers_test_TP7/$1
    echo curiosity-test4 avec $1 :
    ./curiosity-test4 fichiers_test_TP7/$1
    echo curiosity-test5 avec $1 :
    ./curiosity-test5 fichiers_test_TP7/$1
    echo curiosity-test6 avec $1 :
    ./curiosity-test6 fichiers_test_TP7/$1
    echo curiosity-test7 avec $1 :
    ./curiosity-test7 fichiers_test_TP7/$1
    echo curiosity-test8 avec $1 :
    ./curiosity-test8 fichiers_test_TP7/$1
    echo curiosity-test9 avec $1 :
    ./curiosity-test9 fichiers_test_TP7/$1
  else
    echo curiosity-test0 avec $1 :
    .././curiosity-test0 fichiers_test_TP7/$1
    echo curiosity-test1 avec $1 :
    .././curiosity-test1 fichiers_test_TP7/$1
    echo curiosity-test2 avec $1 :
    .././curiosity-test2 fichiers_test_TP7/$1
    echo curiosity-test3 avec $1 :
    .././curiosity-test3 fichiers_test_TP7/$1
    echo curiosity-test4 avec $1 :
    .././curiosity-test4 fichiers_test_TP7/$1
    echo curiosity-test5 avec $1 :
    .././curiosity-test5 fichiers_test_TP7/$1
    echo curiosity-test6 avec $1 :
    .././curiosity-test6 fichiers_test_TP7/$1
    echo curiosity-test7 avec $1 :
    .././curiosity-test7 fichiers_test_TP7/$1
    echo curiosity-test8 avec $1 :
    .././curiosity-test8 fichiers_test_TP7/$1
    echo curiosity-test9 avec $1 :
    .././curiosity-test9 fichiers_test_TP7/$1
  fi

else
  echo "usage : ./testing <nom_du_programme_test>"
fi
