if [ $# -eq 1 ]
then
  echo curiosity-test0 avec $1 :
  ./../curiosity-test0 $1
  echo curiosity-test1 avec $1 :
  ./../curiosity-test1 $1
  echo curiosity-test2 avec $1 :
  ./../curiosity-test2 $1
  echo curiosity-test3 avec $1 :
  ./../curiosity-test3 $1
  echo curiosity-test4 avec $1 :
  ./../curiosity-test4 $1
  echo curiosity-test5 avec $1 :
  ./../curiosity-test5 $1
  echo curiosity-test6 avec $1 :
  ./../curiosity-test6 $1
  echo curiosity-test7 avec $1 :
  ./../curiosity-test7 $1
  echo curiosity-test8 avec $1 :
  ./../curiosity-test8 $1
  echo curiosity-test9 avec $1 :
  ./../curiosity-test9 $1
else
  echo "usage : ./testing <nom_du_programme_test>"
fi
