# A NEXECUTER QUE AVEC LE MAKE FILE EN FAISANT make tests_curiosity
if [ $# -eq 1 ]
then
  if [ $0 == './testing.sh' ]
  then
    echo curiosity-test0:
    .././curiosity-test0 $1
    echo curiosity-test1:
    ./../curiosity-test1 $1
    echo curiosity-test2:
    .././curiosity-test2 $1
    echo curiosity-test3:
    .././curiosity-test3 $1
    echo curiosity-test4:
    .././curiosity-test4 $1
    echo curiosity-test5:
    .././curiosity-test5 $1
    echo curiosity-test6:
    .././curiosity-test6 $1
    echo curiosity-test7:
    .././curiosity-test7 $1
    echo curiosity-test8:
    .././curiosity-test8 $1
    echo curiosity-test9:
    .././curiosity-test9 $1
  else
    cd fichiers_test_TP7
    echo curiosity-test0:
    .././curiosity-test0 $1
    echo curiosity-test1:
    ./../curiosity-test1 $1
    echo curiosity-test2:
    .././curiosity-test2 $1
    echo curiosity-test3:
    .././curiosity-test3 $1
    echo curiosity-test4:
    .././curiosity-test4 $1
    echo curiosity-test5:
    .././curiosity-test5 $1
    echo curiosity-test6:
    .././curiosity-test6 $1
    echo curiosity-test7:
    .././curiosity-test7 $1
    echo curiosity-test8:
    .././curiosity-test8 $1
    echo curiosity-test9:
    .././curiosity-test9 $1
  fi

else
  echo "usage : ./testing <nom_du_programme_test>"
fi
