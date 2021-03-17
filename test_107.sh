#!/bin/bash

cyanclair=$'\e[1;36m'
vertclair=$'\e[1;32m'
rougefonce=$'\e[0;31m'
violetclair=$'\e[1;35m'
rose=$'\e[1;31m'
bleufonce=$'\e[0;34m'
bleuclair=$'\e[1;34m'
grisclair=$'\e[0;37m'
jaune=$'\e[1;33m'
blanc=$'\e[1;37m'
reset=$'\e[0m'

test_rigor()
{
    echo "${rose}test: ${bleuclair}$1${reset}"
    ./107transfer $2 $3 $4 $5 $6 $7 2> result
    if [ "$?" -eq 84 ]
    then
        echo "${vertclair}TEST PASSED${reset}"
    else
        echo "${rougefonce}TEST NOT PASSED${reset}"
    fi
    rm result
}

test_calcul()
{
    echo "${rose}test: ${bleuclair}$1${reset}"
    ./107transfer $2 $3 $4 $5 $6 $7 > result
    diff -s result $8 > result_diff
    if [ "$?" -eq 0 ]
    then
        echo "${vertclair}TEST PASSED${reset}"
    else
        echo "${rougefonce}TEST NOT PASSED${reset}"
    fi
    rm result
    rm result_diff
}

echo "${cyanclair}RIGOR TESTS:${reset}"
test_rigor "1- no arguments" "" "" "" "" "" ""
test_rigor "2- wrong number of arguments_1" "1*1*1*1" "" "" "" "" ""
test_rigor "3- wrong number of arguments_2" "1*1*1*1" "1*1*1*1" "1*1*1*1" "" "" ""
test_rigor "4- arguments contain letters" "1*1*1*1" "1*a*1*1" "" "" "" ""
test_rigor "5- arguments contain float" "1*1*1*1" "1*1.2*1*1" "" "" "" ""
test_rigor "6- arguments contain unknown symbols" "1*1*1*1" "1*1&2*1*1" "" "" "" ""
echo "${cyanclair}END OF RIGOR TESTS${reset}"
echo ""
echo "${cyanclair}SUBJECT TESTS:${reset}"
test_calcul "1- SUBJECT_1" "0*1*2*3*4" "1" "" "" "" "" "MOULI_107/tests/subject_1"
test_calcul "2- SUBJECT_2" "0*0*9" "1*3*5" "2*4*6" "8*8*8" "" "" "MOULI_107/tests/subject_2"
echo "${cyanclair}END OF SUBJECT TESTS${reset}"
echo ""
echo "${cyanclair}POLYNOMIALS TESTS:${reset}"
test_calcul "1- POLYNOMIAL_1" "3*3*3" "1*2*3" "4*19" "20" "" "" "MOULI_107/tests/poly_1"
test_calcul "2- POLYNOMIAL_2" "0*20*0" "4*2*20" "0*10" "20*3" "5*4*3*2*1*0" "10" "MOULI_107/tests/poly_2"
test_calcul "3- POLYNOMIAL_3" "1" "1" "" "" "" "" "MOULI_107/tests/poly_3"
test_calcul "4- POLYNOMIAL_4" "2" "2" "2" "2" "2" "20" "MOULI_107/tests/poly_4"
test_calcul "5- POLYNOMIAL_5" "10*20*10" "2" "3*15" "60" "1" "90" "MOULI_107/tests/poly_5"
test_calcul "6- POLYNOMIAL_6" "3*3*3" "1*2*3" "4*19" "20" "" "" "MOULI_107/tests/poly_6"
echo "${cyanclair}END OF POLYNOMIALS TESTS${reset}"
echo ""
echo "${cyanclair}MATHEMATICAL RIGOR TESTS:${reset}"
test_rigor "1- division by 0" "1*1" "0" "" "" "" ""
test_rigor "2- division by 0" "1*1" "1*3*4*5" "10" "0" "" ""
test_rigor "3- division by 0" "1*1" "10" "4*1*2" "5*40" "20" "0"
echo "${cyanclair}END OF MATHEMATICAL RIGOR TESTS${reset}"