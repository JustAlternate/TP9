DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )" 
#la ligne du dessus viens du site internet https://www.ipgirl.com/71/obtenir-le-repertoire-source-dun-script-bash-depuis-linterieur.html
echo resultats programme 1 configuration 1:
$DIR/../curiosity-perf programme-test_TP9/programme-test1 20 25 25 0.4 69 1000 $DIR/res_programme1_config1
echo
echo resultats programme 1 configuration 2:
$DIR/../curiosity-perf programme-test_TP9/programme-test1 20 9 9 0.7 69 1000 $DIR/res_programme1_config2

echo
echo
echo resultats programme 3 configuration 1:
$DIR/../curiosity-perf programme-test_TP9/programme-test3 20 25 25 0.4 69 1000 $DIR/res_programme3_config1
echo
echo resultats programme 3 configuration 2:
$DIR/../curiosity-perf programme-test_TP9/programme-test3 20 9 9 0.7 69 1000 $DIR/res_programme3_config2