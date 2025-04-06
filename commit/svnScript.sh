#!/bin/bash

rm -rf buffer
rm -rf svnRepo

svnadmin create svnRepo

svn mkdir file://$(pwd)/svnRepo/trunk    -m "Create trunk"
svn mkdir file://$(pwd)/svnRepo/branches -m "Create branches"
svn mkdir file://$(pwd)/svnRepo/tags     -m "Create tags"

# Делаем checkout trunk в папку buffer
svn checkout file://$(pwd)/svnRepo/trunk buffer
cd buffer

###############################################################################
# 2. Имитация команд
###############################################################################
# Короткая шпаргалка по аналогам:
#   git checkout -b branchX        ->  svn copy ^/trunk ^/branches/branchX -m "msg"; svn switch ^/branches/branchX
#   git checkout branchX           ->  svn switch ^/branches/branchX
#   git merge branchY --no-commit  ->  svn merge ^/branches/branchY .
#   git merge branchY --commit     ->  (то же самое, просто сразу после merge делаем svn commit -m "msg")
#   git add . && git commit -m ... ->  svn add --force . && svn commit -m ...
#
# Вместо "git checkout main" используем "svn switch ^/trunk" (т.к. trunk аналог main в SVN)

###############################################################################
# Вспомогательная "смена пользователя"
###############################################################################
sh ../toRedUser.sh

###############################################################################
# (1) cp ../commit0/* . && git add . && git commit -m "c0"
###############################################################################
cp ../commit0/* .
svn add --force .
svn commit -m "c0"

###############################################################################
# (2) git checkout -b branch1 ; cp ../commit1/* . && commit c1
###############################################################################
svn copy ^/trunk ^/branches/branch1 -m "Create branch1"
svn switch ^/branches/branch1
cp ../commit1/* .
svn add --force .
svn commit -m "c1"

###############################################################################
# (3) sh ../toBlueUser.sh
#     git checkout -b branch2 ; cp ../commit2/* . && commit c2
###############################################################################
sh ../toBlueUser.sh
svn copy ^/trunk ^/branches/branch2 -m "Create branch2"
svn switch ^/branches/branch2
cp ../commit2/* .
svn add --force .
svn commit -m "c2"

###############################################################################
# (4) sh ../toRedUser.sh
#     git checkout -b branch3 ; cp ../commit3/* . && commit c3
###############################################################################
sh ../toRedUser.sh
svn copy ^/trunk ^/branches/branch3 -m "Create branch3"
svn switch ^/branches/branch3
cp ../commit3/* .
svn add --force .
svn commit -m "c3"

###############################################################################
# (5) git checkout -b branch4 ; cp ../commit4/* . && commit c4
###############################################################################
svn copy ^/trunk ^/branches/branch4 -m "Create branch4"
svn switch ^/branches/branch4
cp ../commit4/* .
svn add --force .
svn commit -m "c4"

###############################################################################
# (6) git checkout -b branch5 ; cp ../commit5/* . && commit c5
###############################################################################
svn copy ^/trunk ^/branches/branch5 -m "Create branch5"
svn switch ^/branches/branch5
cp ../commit5/* .
svn add --force .
svn commit -m "c5"

###############################################################################
# (7) sh ../toBlueUser.sh
#     git checkout -b branch6 ; cp ../commit6/* . && commit c6
###############################################################################
sh ../toBlueUser.sh
svn copy ^/trunk ^/branches/branch6 -m "Create branch6"
svn switch ^/branches/branch6
cp ../commit6/* .
svn add --force .
svn commit -m "c6"

###############################################################################
# (8) sh ../toRedUser.sh
#     git checkout -b branch7 ; cp ../commit7/* . && commit c7
###############################################################################
sh ../toRedUser.sh
svn copy ^/trunk ^/branches/branch7 -m "Create branch7"
svn switch ^/branches/branch7
cp ../commit7/* .
svn add --force .
svn commit -m "c7"

###############################################################################
# (9) sh ../toBlueUser.sh
#     git checkout branch6 ; cp ../commit8/* => c8; cp ../commit9/* => c9
###############################################################################
sh ../toBlueUser.sh
svn switch ^/branches/branch6
cp ../commit8/* .
svn add --force .
svn commit -m "c8"

cp ../commit9/* .
svn add --force .
svn commit -m "c9"

###############################################################################
#     git checkout -b branch10 ; cp ../commit10/* => c10
###############################################################################
svn copy ^/branches/branch6 ^/branches/branch10 -m "Create branch10 from branch6"
svn switch ^/branches/branch10
cp ../commit10/* .
svn add --force .
svn commit -m "c10"

###############################################################################
# (10) sh ../toRedUser.sh
#      git checkout -b branch11 ; cp ../commit11/* => c11
###############################################################################
sh ../toRedUser.sh
svn copy ^/trunk ^/branches/branch11 -m "Create branch11"
svn switch ^/branches/branch11
cp ../commit11/* .
svn add --force .
svn commit -m "c11"

###############################################################################
# (11) sh ../toBlueUser.sh
#      git checkout -b branch12 ; cp ../commit12/* => c12
###############################################################################
sh ../toBlueUser.sh
svn copy ^/trunk ^/branches/branch12 -m "Create branch12"
svn switch ^/branches/branch12
cp ../commit12/* .
svn add --force .
svn commit -m "c12"

###############################################################################
# (12) git checkout -b branch13 ; cp ../commit13/* => c13
###############################################################################
svn copy ^/branches/branch12 ^/branches/branch13 -m "Create branch13 from branch12"
svn switch ^/branches/branch13
cp ../commit13/* .
svn add --force .
svn commit -m "c13"

###############################################################################
# (13) sh ../toRedUser.sh
#      git checkout -b branch14 ; cp ../commit14/* => c14
###############################################################################
sh ../toRedUser.sh
svn copy ^/trunk ^/branches/branch14 -m "Create branch14"
svn switch ^/branches/branch14
cp ../commit14/* .
svn add --force .
svn commit -m "c14"

###############################################################################
# (14) sh ../toBlueUser.sh
#      git checkout branch2 ; cp ../commit15/* => c15
###############################################################################
sh ../toBlueUser.sh
svn switch ^/branches/branch2
cp ../commit15/* .
svn add --force .
svn commit -m "c15"

###############################################################################
#      git checkout -b branch16 ; cp ../commit16/* => c16
#      git merge branch2 --commit
###############################################################################
svn copy ^/branches/branch2 ^/branches/branch16 -m "Create branch16 from branch2"
svn switch ^/branches/branch16
cp ../commit16/* .
svn add --force .
svn commit -m "c16"

# merge branch2
svn merge ^/branches/branch2 .
# Сразу коммит (аналог --commit)
svn commit -m "merge branch2 into branch16"

###############################################################################
# (15) sh ../toRedUser.sh
#      git checkout branch5 ; cp ../commit17/* => c17
###############################################################################
sh ../toRedUser.sh
svn switch ^/branches/branch5
cp ../commit17/* .
svn add --force .
svn commit -m "c17"

###############################################################################
#      git checkout branch1 ; cp ../commit18/* => c18
###############################################################################
svn switch ^/branches/branch1
cp ../commit18/* .
svn add --force .
svn commit -m "c18"

###############################################################################
#      git checkout -b branch19 ; cp ../commit19/* => c19
###############################################################################
svn copy ^/branches/branch1 ^/branches/branch19 -m "Create branch19 from branch1"
svn switch ^/branches/branch19
cp ../commit19/* .
svn add --force .
svn commit -m "c19"

###############################################################################
#      git checkout -b branch20 ; cp ../commit20/* => c20
###############################################################################
svn copy ^/branches/branch19 ^/branches/branch20 -m "Create branch20 from branch19"
svn switch ^/branches/branch20
cp ../commit20/* .
svn add --force .
svn commit -m "c20"

###############################################################################
#      git checkout branch14 ; cp ../commit21/* => c21
###############################################################################
svn switch ^/branches/branch14
cp ../commit21/* .
svn add --force .
svn commit -m "c21"

###############################################################################
# (16) sh ../toBlueUser.sh
#      git checkout -b branch22 ; cp ../commit22/* => c22
###############################################################################
sh ../toBlueUser.sh
svn copy ^/trunk ^/branches/branch22 -m "Create branch22"
svn switch ^/branches/branch22
cp ../commit22/* .
svn add --force .
svn commit -m "c22"

###############################################################################
#      git checkout branch12 ; cp ../commit23/* => c23
###############################################################################
svn switch ^/branches/branch12
cp ../commit23/* .
svn add --force .
svn commit -m "c23"

###############################################################################
# (17) sh ../toRedUser.sh
#      git checkout main ; cp ../commit24/* => c24
###############################################################################
sh ../toRedUser.sh
svn switch ^/trunk
cp ../commit24/* .
svn add --force .
svn commit -m "c24"

###############################################################################
#      git checkout branch20 ; cp ../commit25/* => c25
###############################################################################
svn switch ^/branches/branch20
cp ../commit25/* .
svn add --force .
svn commit -m "c25"

###############################################################################
#      git checkout -b branch26 ; cp ../commit26/* => c26 ; cp ../commit27/* => c27
###############################################################################
svn copy ^/branches/branch20 ^/branches/branch26 -m "Create branch26 from branch20"
svn switch ^/branches/branch26
cp ../commit26/* .
svn add --force .
svn commit -m "c26"

cp ../commit27/* .
svn add --force .
svn commit -m "c27"

###############################################################################
# (18) sh ../toBlueUser.sh
#      git checkout branch6 ; cp ../commit28/* => c28
###############################################################################
sh ../toBlueUser.sh
svn switch ^/branches/branch6
cp ../commit28/* .
svn add --force .
svn commit -m "c28"

###############################################################################
#      git checkout -b branch29 ; cp ../commit29/* => c29
#      git checkout branch6 ; git merge branch29 --commit
###############################################################################
svn copy ^/branches/branch6 ^/branches/branch29 -m "Create branch29 from branch6"
svn switch ^/branches/branch29
cp ../commit29/* .
svn add --force .
svn commit -m "c29"

svn switch ^/branches/branch6
svn merge ^/branches/branch29 .
svn commit -m "merge branch29 into branch6"

###############################################################################
# (19) sh ../toRedUser.sh
#      git checkout branch7 ; cp ../commit30/* => c30
###############################################################################
sh ../toRedUser.sh
svn switch ^/branches/branch7
cp ../commit30/* .
svn add --force .
svn commit -m "c30"

###############################################################################
# (20) sh ../toBlueUser.sh
#      git checkout -b branch31 ; cp ../commit31/* => c31
#      git merge branch7 --commit
###############################################################################
sh ../toBlueUser.sh
svn copy ^/branches/branch7 ^/branches/branch31 -m "Create branch31 from branch7"
svn switch ^/branches/branch31
cp ../commit31/* .
svn add --force .
svn commit -m "c31"

# merge branch7
svn merge ^/branches/branch7 .
svn commit -m "merge branch7 into branch31"

###############################################################################
# (21) sh ../toRedUser.sh
#      git checkout -b branch32 ; cp ../commit32/* => c32
###############################################################################
sh ../toRedUser.sh
svn copy ^/branches/branch31 ^/branches/branch32 -m "Create branch32 from branch31"
svn switch ^/branches/branch32
cp ../commit32/* .
svn add --force .
svn commit -m "c32"

###############################################################################
#      git checkout branch1 ; cp ../commit33/* => c33
###############################################################################
svn switch ^/branches/branch1
cp ../commit33/* .
svn add --force .
svn commit -m "c33"

###############################################################################
# (22) sh ../toBlueUser.sh
#      git checkout branch12 ; cp ../commit34/* => c34
###############################################################################
sh ../toBlueUser.sh
svn switch ^/branches/branch12
cp ../commit34/* .
svn add --force .
svn commit -m "c34"

###############################################################################
#      git checkout branch31 ; cp ../commit35/* => c35
###############################################################################
svn switch ^/branches/branch31
cp ../commit35/* .
svn add --force .
svn commit -m "c35"

###############################################################################
#      git checkout branch12 ; cp ../commit36/* => c36
###############################################################################
svn switch ^/branches/branch12
cp ../commit36/* .
svn add --force .
svn commit -m "c36"

###############################################################################
# (23) sh ../toRedUser.sh
#      git checkout branch20 ; cp ../commit37/* => c37
###############################################################################
sh ../toRedUser.sh
svn switch ^/branches/branch20
cp ../commit37/* .
svn add --force .
svn commit -m "c37"

###############################################################################
#      git checkout branch11 ; cp ../commit38/* => c38
###############################################################################
svn switch ^/branches/branch11
cp ../commit38/* .
svn add --force .
svn commit -m "c38"

###############################################################################
#      git checkout main ; cp ../commit39/* => c39
###############################################################################
svn switch ^/trunk
cp ../commit39/* .
svn add --force .
svn commit -m "c39"

###############################################################################
#      git checkout branch12
#      sh ../toBlueUser.sh
#      cp ../commit40/* => c40
###############################################################################
svn switch ^/branches/branch12
sh ../toBlueUser.sh
cp ../commit40/* .
svn add --force .
svn commit -m "c40"

###############################################################################
#      git checkout branch16 ; cp ../commit41/* => c41
###############################################################################
svn switch ^/branches/branch16
cp ../commit41/* .
svn add --force .
svn commit -m "c41"

###############################################################################
#      git checkout branch13 ; cp ../commit42/* => c42
###############################################################################
svn switch ^/branches/branch13
cp ../commit42/* .
svn add --force .
svn commit -m "c42"

###############################################################################
#      git checkout branch16 ; cp ../commit43/* => c43
#      git checkout -b branch44 ; cp ../commit44/* => c44
###############################################################################
svn switch ^/branches/branch16
cp ../commit43/* .
svn add --force .
svn commit -m "c43"

svn copy ^/branches/branch16 ^/branches/branch44 -m "Create branch44 from branch16"
svn switch ^/branches/branch44
sh ../toRedUser.sh
cp ../commit44/* .
svn add --force .
svn commit -m "c44"

###############################################################################
#      git checkout -b branch45 ; cp ../commit45/* => c45
###############################################################################
svn copy ^/branches/branch44 ^/branches/branch45 -m "Create branch45 from branch44"
svn switch ^/branches/branch45
cp ../commit45/* .
svn add --force .
svn commit -m "c45"

###############################################################################
# (24) sh ../toBlueUser.sh
#      git checkout branch31 ; cp ../commit46/* => c46
###############################################################################
sh ../toBlueUser.sh
svn switch ^/branches/branch31
cp ../commit46/* .
svn add --force .
svn commit -m "c46"

###############################################################################
#      git checkout branch16 ; cp ../commit47/* => c47
###############################################################################
svn switch ^/branches/branch16
cp ../commit47/* .
svn add --force .
svn commit -m "c47"

###############################################################################
#      git checkout branch16 ; cp ../commit48/* => c48
#      git checkout -b branch49 ; cp ../commit49/* => c49
###############################################################################
cp ../commit48/* .
svn add --force .
svn commit -m "c48"

svn copy ^/branches/branch16 ^/branches/branch49 -m "Create branch49 from branch16"
svn switch ^/branches/branch49
cp ../commit49/* .
svn add --force .
svn commit -m "c49"

###############################################################################
# (25) sh ../toRedUser.sh
#      git checkout branch26 ; cp ../commit50/* => c50
###############################################################################
sh ../toRedUser.sh
svn switch ^/branches/branch26
cp ../commit50/* .
svn add --force .
svn commit -m "c50"

###############################################################################
# (26) sh ../toBlueUser.sh
#      git checkout branch49
#      git merge branch26 --no-commit
#      cp ../commit51/* => c51
###############################################################################
sh ../toBlueUser.sh
svn switch ^/branches/branch49
svn merge ^/branches/branch26 .
cp ../commit51/* .
svn add --force .
svn commit -m "c51"

###############################################################################
# (27) sh ../toRedUser.sh
#      git checkout branch32
#      git merge branch49 --no-commit
#      cp ../commit52/* => c52
###############################################################################
sh ../toRedUser.sh
svn switch ^/branches/branch32
svn merge ^/branches/branch49 .
cp ../commit52/* .
svn add --force .
svn commit -m "c52"

###############################################################################
#      git checkout branch19 ; cp ../commit53/* => c53 ; cp ../commit54/* => c54
###############################################################################
svn switch ^/branches/branch19
cp ../commit53/* .
svn add --force .
svn commit -m "c53"

cp ../commit54/* .
svn add --force .
svn commit -m "c54"

###############################################################################
#      git checkout branch20 ; cp ../commit55/* => c55
###############################################################################
svn switch ^/branches/branch20
cp ../commit55/* .
svn add --force .
svn commit -m "c55"

###############################################################################
# (28) sh ../toBlueUser.sh
#      git checkout branch44 ; cp ../commit56/* => c56
###############################################################################
sh ../toBlueUser.sh
svn switch ^/branches/branch44
cp ../commit56/* .
svn add --force .
svn commit -m "c56"

###############################################################################
# (29) sh ../toRedUser.sh
#      git checkout -b branch57 ; cp ../commit57/* => c57
###############################################################################
sh ../toRedUser.sh
svn copy ^/branches/branch44 ^/branches/branch57 -m "Create branch57 from branch44"
svn switch ^/branches/branch57
cp ../commit57/* .
svn add --force .
svn commit -m "c57"

###############################################################################
#      git checkout branch11 ; cp ../commit58/* => c58
###############################################################################
svn switch ^/branches/branch11
cp ../commit58/* .
svn add --force .
svn commit -m "c58"

###############################################################################
#      git checkout branch14
#      git merge branch11 --no-commit
#      cp ../commit59/* => c59
###############################################################################
svn switch ^/branches/branch14
svn merge ^/branches/branch11 .
cp ../commit59/* .
svn add --force .
svn commit -m "c59"

###############################################################################
#      git checkout branch3 ; cp ../commit60/* => c60
###############################################################################
svn switch ^/branches/branch3
cp ../commit60/* .
svn add --force .
svn commit -m "c60"

###############################################################################
#      git checkout main ; cp ../commit61/* => c61
###############################################################################
svn switch ^/trunk
cp ../commit61/* .
svn add --force .
svn commit -m "c61"

###############################################################################
# (30) sh ../toBlueUser.sh
#      git checkout branch44 ; cp ../commit62/* => c62
###############################################################################
sh ../toBlueUser.sh
svn switch ^/branches/branch44
cp ../commit62/* .
svn add --force .
svn commit -m "c62"

###############################################################################
# (31) sh ../toRedUser.sh
#      git checkout branch45 ; cp ../commit63/* => c63
###############################################################################
sh ../toRedUser.sh
svn switch ^/branches/branch45
cp ../commit63/* .
svn add --force .
svn commit -m "c63"

###############################################################################
#      git checkout -b branch64 ; cp ../commit64/* => c64
#      git merge branch45 --commit
###############################################################################
svn copy ^/branches/branch45 ^/branches/branch64 -m "Create branch64 from branch45"
svn switch ^/branches/branch64
cp ../commit64/* .
svn add --force .
svn commit -m "c64"

svn merge ^/branches/branch45 .
svn commit -m "merge branch45 into branch64"

###############################################################################
# (32) sh ../toBlueUser.sh
#      git checkout -b branch65 ; cp ../commit65/* => c65
#      git merge branch64 --commit
###############################################################################
sh ../toBlueUser.sh
svn copy ^/branches/branch64 ^/branches/branch65 -m "Create branch65 from branch64"
svn switch ^/branches/branch65
cp ../commit65/* .
svn add --force .
svn commit -m "c65"

svn merge ^/branches/branch64 .
svn commit -m "merge branch64 into branch65"

###############################################################################
#      git checkout branch6 ; cp ../commit66/* => c66
###############################################################################
svn switch ^/branches/branch6
cp ../commit66/* .
svn add --force .
svn commit -m "c66"

###############################################################################
# (33) sh ../toRedUser.sh
#      git checkout branch57 ; cp ../commit67/* => c67
#      git merge branch13 --commit
###############################################################################
sh ../toRedUser.sh
svn switch ^/branches/branch57
cp ../commit67/* .
svn add --force .
svn commit -m "c67"

svn merge ^/branches/branch13 .
svn commit -m "merge branch13 into branch57"

###############################################################################
#      git checkout branch20 ; cp ../commit68/* => c68
#      git merge branch57 --commit
###############################################################################
svn switch ^/branches/branch20
cp ../commit68/* .
svn add --force .
svn commit -m "c68"

svn merge ^/branches/branch57 .
svn commit -m "merge branch57 into branch20"

###############################################################################
#      git checkout main ; cp ../commit69/* => c69
#      git merge branch20 --commit
###############################################################################
svn switch ^/trunk
cp ../commit69/* .
svn add --force .
svn commit -m "c69"

svn merge ^/branches/branch20 .
svn commit -m "merge branch20 into trunk"

###############################################################################
# (34) sh ../toBlueUser.sh
#      git checkout branch6 ; cp ../commit70/* => c70
###############################################################################
sh ../toBlueUser.sh
svn switch ^/branches/branch6
cp ../commit70/* .
svn add --force .
svn commit -m "c70"

###############################################################################
#      git checkout branch16 ; cp ../commit71/* => c71
###############################################################################
svn switch ^/branches/branch16
cp ../commit71/* .
svn add --force .
svn commit -m "c71"

###############################################################################
# (35) sh ../toRedUser.sh
#      git checkout branch4 ; cp ../commit72/* => c72
###############################################################################
sh ../toRedUser.sh
svn switch ^/branches/branch4
cp ../commit72/* .
svn add --force .
svn commit -m "c72"

###############################################################################
#      git checkout branch3 ; cp ../commit73/* => c73
#      git merge branch4 --commit
###############################################################################
svn switch ^/branches/branch3
cp ../commit73/* .
svn add --force .
svn commit -m "c73"

svn merge ^/branches/branch4 .
svn commit -m "merge branch4 into branch3"

###############################################################################
# (36) sh ../toBlueUser.sh
#      git checkout -b branch74 ; cp ../commit74/* => c74
###############################################################################
sh ../toBlueUser.sh
svn copy ^/branches/branch3 ^/branches/branch74 -m "Create branch74 from branch3"
svn switch ^/branches/branch74
cp ../commit74/* .
svn add --force .
svn commit -m "c74"

###############################################################################
# (37) sh ../toRedUser.sh
#      git checkout branch19 ; cp ../commit75/* => c75
###############################################################################
sh ../toRedUser.sh
svn switch ^/branches/branch19
cp ../commit75/* .
svn add --force .
svn commit -m "c75"

###############################################################################
# (38) sh ../toBlueUser.sh
#      git checkout -b branch76
#      git merge branch19 --no-commit
#      cp ../commit76/* => c76
###############################################################################
sh ../toBlueUser.sh
svn copy ^/branches/branch19 ^/branches/branch76 -m "Create branch76 from branch19"
svn switch ^/branches/branch76
svn merge ^/branches/branch19 .
cp ../commit76/* .
svn add --force .
svn commit -m "c76"

###############################################################################
# (39) sh ../toRedUser.sh
#      git checkout branch22 ; cp ../commit77/* => c77
###############################################################################
sh ../toRedUser.sh
svn switch ^/branches/branch22
cp ../commit77/* .
svn add --force .
svn commit -m "c77"

###############################################################################
#      git checkout main ; cp ../commit78/* => c78
###############################################################################
svn switch ^/trunk
cp ../commit78/* .
svn add --force .
svn commit -m "c78"

###############################################################################
#      git checkout branch22 ; cp ../commit79/* => c79
###############################################################################
svn switch ^/branches/branch22
cp ../commit79/* .
svn add --force .
svn commit -m "c79"

###############################################################################
#      git checkout main
#      git merge branch22 --no-commit
#      cp ../commit80/* => c80
###############################################################################
svn switch ^/trunk
svn merge ^/branches/branch22 .
cp ../commit80/* .
svn add --force .
svn commit -m "c80"

###############################################################################
# (40) sh ../toBlueUser
#      git checkout branch76 ; cp ../commit81/* => c81
###############################################################################
sh ../toBlueUser.sh
svn switch ^/branches/branch76
cp ../commit81/* .
svn add --force .
svn commit -m "c81"

###############################################################################
# (41) sh ../toRedUser
#      git checkout branch1
#      git merge branch22 --no-commit
#      cp ../commit82/* => c82
###############################################################################
sh ../toRedUser.sh
svn switch ^/branches/branch1
svn merge ^/branches/branch22 .
cp ../commit82/* .
svn add --force .
svn commit -m "c82"

###############################################################################
#      git checkout branch32
#      git merge branch1 --no-commit
#      cp ../commit83/* => c83
###############################################################################
svn switch ^/branches/branch32
svn merge ^/branches/branch1 .
cp ../commit83/* .
svn add --force .
svn commit -m "c83"

###############################################################################
#      git checkout branch3 ; cp ../commit84/* => c84
###############################################################################
svn switch ^/branches/branch3
cp ../commit84/* .
svn add --force .
svn commit -m "c84"

###############################################################################
# (42) sh ../toBlueUser.sh
#      git checkout branch31
#      git merge branch3 --no-commit
#      cp ../commit85/* => c85
###############################################################################
sh ../toBlueUser.sh
svn switch ^/branches/branch31
svn merge ^/branches/branch3 .
cp ../commit85/* .
svn add --force .
svn commit -m "c85"

###############################################################################
# (43) sh ./toRedUser.sh
#      git checkout branch14 ; cp ../commit86/* => c86
###############################################################################
sh ../toRedUser.sh
svn switch ^/branches/branch14
cp ../commit86/* .
svn add --force .
svn commit -m "c86"

###############################################################################
#      sh ../toBlueUser.sh
#      git merge branch31 --no-commit
#
# (Судя по логике, здесь не был указан checkout, возможно пропуск?
#  Предположим, что мы остаёмся на branch14 и хотим влить branch31.
#  Но в Git-скрипте нет чёткого checkout?
#  Воспримем, что нужно слить branch31 в branch14)
###############################################################################
sh ../toBlueUser.sh
svn merge ^/branches/branch31 .
# Пока без коммита (no-commit). Можно было бы далее скопировать файлы, но в оригинале не было новых commit'ов?

###############################################################################
#      git checkout branch65 ; cp ../commit87/* => c87
###############################################################################
svn switch ^/branches/branch65
cp ../commit87/* .
svn add --force .
svn commit -m "c87"

###############################################################################
# (44) sh ../toRedUser.sh
#      git merge branch14 --no-commit
#
# (Аналогичная ситуация: скорее всего мы пытаемся влить branch14
#  в текущую ветку branch65, но в Git-скрипте нет checkout?
#  Допустим, что мы и есть на branch65)
###############################################################################
sh ../toRedUser.sh
svn merge ^/branches/branch14 .
# no commit

###############################################################################
#      git checkout branch32 ; cp ../commit88/* => c88
###############################################################################
svn switch ^/branches/branch32
cp ../commit88/* .
svn add --force .
svn commit -m "c88"

###############################################################################
# (45) sh ../toBlueUser.sh
#      git merge branch65 --no-commit
#
# (Опять неясно на какой ветке мы сейчас. Предположим, что это branch32?
#  или хотим влить branch65 в branch32? Оставим как есть.)
###############################################################################
sh ../toBlueUser.sh
svn merge ^/branches/branch65 .
# no commit

###############################################################################
#      git checkout branch10 ; cp ../commit89/* => c89
###############################################################################
svn switch ^/branches/branch10
cp ../commit89/* .
svn add --force .
svn commit -m "c89"

###############################################################################
# (46) sh ../toRedUser.sh
#      git merge branch32 --no-commit
#
# (Снова нет checkout. Предположим, мы остаёмся на branch10
#  и вливаем branch32.)
###############################################################################
sh ../toRedUser.sh
svn merge ^/branches/branch32 .
# no commit

###############################################################################
# (47) sh ../toBlueUser.sh
#      git checkout branch74 ; cp ../commit90/* => c90
#      git merge branch10 --no-commit
###############################################################################
sh ../toBlueUser.sh
svn switch ^/branches/branch74
cp ../commit90/* .
svn add --force .
svn commit -m "c90"

svn merge ^/branches/branch10 .
# no commit

###############################################################################
#      git checkout -b branch91 ; cp ../commit91/* => c91
#      git merge branch74 --no-commit
###############################################################################
svn copy ^/branches/branch74 ^/branches/branch91 -m "Create branch91 from branch74"
svn switch ^/branches/branch91
cp ../commit91/* .
svn add --force .
svn commit -m "c91"

svn merge ^/branches/branch74 .
# no commit

###############################################################################
#      git checkout branch12 ; cp ../commit92/* => c92
###############################################################################
svn switch ^/branches/branch12
cp ../commit92/* .
svn add --force .
svn commit -m "c92"

###############################################################################
# <<<<<<< HEAD
# (48) git checkout branch16
#      git merge branch12 --no-commit
#      cp ../commit93/* => c93
###############################################################################
svn switch ^/branches/branch16
svn merge ^/branches/branch12 .
cp ../commit93/* .
svn add --force .
svn commit -m "c93"

###############################################################################
#      git checkout branch91
#      git merge branch16 --no-commit
#      cp ../commit94/* => c94
###############################################################################
svn switch ^/branches/branch91
svn merge ^/branches/branch16 .
cp ../commit94/* .
svn add --force .
svn commit -m "c94"

###############################################################################
#      git checkout branch29
#      git merge branch91 --no-commit
#      cp ../commit95/* => c95
###############################################################################
svn switch ^/branches/branch29
svn merge ^/branches/branch91 .
cp ../commit95/* .
svn add --force .
svn commit -m "c95"

###############################################################################
# (49) sh ../toRedUser.sh
#      git checkout branch5
#      git merge branch29 --no-commit
#      cp ../commit96/* => c96
###############################################################################
sh ../toRedUser.sh
svn switch ^/branches/branch5
svn merge ^/branches/branch29 .
cp ../commit96/* .
svn add --force .
svn commit -m "c96"

###############################################################################
# (50) sh ../toBlueUser.sh
#      git checkout branch44
#      git merge branch5 --no-commit
#      cp ../commit97/* => c97
###############################################################################
sh ../toBlueUser.sh
svn switch ^/branches/branch44
svn merge ^/branches/branch5 .
cp ../commit97/* .
svn add --force .
svn commit -m "c97"

echo "========================================"
echo " Скрипт завершён. Все операции перенесены в SVN."
echo " Итоговый репозиторий: $(pwd)/../svnRepo"
echo " Рабочая копия:        $(pwd)"
echo "========================================"
