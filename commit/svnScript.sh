#!/bin/bash
# Удаляем папку buffer (если есть) и создаём новый SVN‑репозиторий
rm -rf buffer
mkdir buffer
svnadmin create buffer/RepositorySVN
RepoPath="file://$(pwd)/buffer/RepositorySVN"

# Создаём базовую структуру: trunk и branches
svn mkdir $RepoPath/trunk $RepoPath/branches -m "Initial structure"

# Получаем рабочую копию из trunk
svn checkout $RepoPath/trunk working_copy
cd working_copy

###############################################################################
# c0 (ветка main, пользователь red)
svn copy $RepoPath/trunk $RepoPath/branches/main -m "Created main"
svn switch $RepoPath/branches/main
svn rm *
cp ../commit0/* .
svn add --force *
svn commit -m "c0" --username "red"

###############################################################################
# c1 (ветка branch1, от main, пользователь red)
svn copy $RepoPath/branches/main $RepoPath/branches/branch1 -m "Created branch1"
svn switch $RepoPath/branches/branch1
svn rm *
cp ../commit1/* .
svn add --force *
svn commit -m "c1" --username "red"

###############################################################################
# Переключаем на blue (toBlueUser.sh)
# c2 (ветка branch2, от branch1, пользователь blue)
svn copy $RepoPath/branches/branch1 $RepoPath/branches/branch2 -m "Created branch2"
svn switch $RepoPath/branches/branch2
svn rm *
cp ../commit2/* .
svn add --force *
svn commit -m "c2" --username "blue"

###############################################################################
# Переключаем на red (toRedUser.sh)
# c3 (ветка branch3, от branch2, пользователь red)
svn copy $RepoPath/branches/branch2 $RepoPath/branches/branch3 -m "Created branch3"
svn switch $RepoPath/branches/branch3
svn rm *
cp ../commit3/* .
svn add --force *
svn commit -m "c3" --username "red"

###############################################################################
# c4 (ветка branch4, от branch3, пользователь red)
svn copy $RepoPath/branches/branch3 $RepoPath/branches/branch4 -m "Created branch4"
svn switch $RepoPath/branches/branch4
svn rm *
cp ../commit4/* .
svn add --force *
svn commit -m "c4" --username "red"

###############################################################################
# c5 (ветка branch5, от branch4, пользователь red)
svn copy $RepoPath/branches/branch4 $RepoPath/branches/branch5 -m "Created branch5"
svn switch $RepoPath/branches/branch5
svn rm *
cp ../commit5/* .
svn add --force *
svn commit -m "c5" --username "red"

###############################################################################
# Переключаем на blue (toBlueUser.sh)
# c6 (ветка branch6, от branch5, пользователь blue)
svn copy $RepoPath/branches/branch5 $RepoPath/branches/branch6 -m "Created branch6"
svn switch $RepoPath/branches/branch6
svn rm *
cp ../commit6/* .
svn add --force *
svn commit -m "c6" --username "blue"

###############################################################################
# Переключаем на red (toRedUser.sh)
# c7 (ветка branch7, от branch6, пользователь red)
svn copy $RepoPath/branches/branch6 $RepoPath/branches/branch7 -m "Created branch7"
svn switch $RepoPath/branches/branch7
svn rm *
cp ../commit7/* .
svn add --force *
svn commit -m "c7" --username "red"

###############################################################################
# Переключаем на blue (toBlueUser.sh)
# Переходим обратно на branch6
svn switch $RepoPath/branches/branch6
# c8 (на branch6, пользователь blue)
svn rm *
cp ../commit8/* .
svn add --force *
svn commit -m "c8" --username "blue"

# c9 (на branch6, пользователь blue)
cp ../commit9/* .
svn add --force *
svn commit -m "c9" --username "blue"

###############################################################################
# c10 (создаём ветку branch10 от branch6, пользователь blue)
svn copy $RepoPath/branches/branch6 $RepoPath/branches/branch10 -m "Created branch10"
svn switch $RepoPath/branches/branch10
svn rm *
cp ../commit10/* .
svn add --force *
svn commit -m "c10" --username "blue"

###############################################################################
# Переключаем на red (toRedUser.sh)
# c11 (создаём ветку branch11 от branch10, пользователь red)
svn copy $RepoPath/branches/branch10 $RepoPath/branches/branch11 -m "Created branch11"
svn switch $RepoPath/branches/branch11
svn rm *
cp ../commit11/* .
svn add --force *
svn commit -m "c11" --username "red"

###############################################################################
# Переключаем на blue (toBlueUser.sh)
# c12 (создаём ветку branch12 от branch11, пользователь blue)
svn copy $RepoPath/branches/branch11 $RepoPath/branches/branch12 -m "Created branch12"
svn switch $RepoPath/branches/branch12
svn rm *
cp ../commit12/* .
svn add --force *
svn commit -m "c12" --username "blue"

###############################################################################
# c13 (создаём ветку branch13 от branch12, пользователь blue)
svn copy $RepoPath/branches/branch12 $RepoPath/branches/branch13 -m "Created branch13"
svn switch $RepoPath/branches/branch13
svn rm *
cp ../commit13/* .
svn add --force *
svn commit -m "c13" --username "blue"

###############################################################################
# Переключаем на red (toRedUser.sh)
# c14 (создаём ветку branch14 от branch13, пользователь red)
svn copy $RepoPath/branches/branch13 $RepoPath/branches/branch14 -m "Created branch14"
svn switch $RepoPath/branches/branch14
svn rm *
cp ../commit14/* .
svn add --force *
svn commit -m "c14" --username "red"

###############################################################################
# Переключаем на blue (toBlueUser.sh)
# Переходим на branch2
svn switch $RepoPath/branches/branch2
# c15 (на branch2, пользователь blue)
svn rm *
cp ../commit15/* .
svn add --force *
svn commit -m "c15" --username "blue"

###############################################################################
# c16 (создаём ветку branch16 от branch2, пользователь blue)
svn copy $RepoPath/branches/branch2 $RepoPath/branches/branch16 -m "Created branch16"
svn switch $RepoPath/branches/branch16
svn rm *
cp ../commit16/* .
svn add --force *
svn commit -m "c16" --username "blue"

# Выполняем слияние branch2 в branch16 (commit слияния)
svn merge $RepoPath/branches/branch2 --accept working
svn commit -m "Merge branch2 into branch16" --username "blue"

###############################################################################
# Переключаем на red (toRedUser.sh)
# Переходим на branch5
svn switch $RepoPath/branches/branch5
# c17 (на branch5, пользователь red)
svn rm *
cp ../commit17/* .
svn add --force *
svn commit -m "c17" --username "red"

###############################################################################
# Переходим на branch1
svn switch $RepoPath/branches/branch1
# c18 (на branch1, пользователь red)
svn rm *
cp ../commit18/* .
svn add --force *
svn commit -m "c18" --username "red"

###############################################################################
# c19 (создаём ветку branch19 от branch1, пользователь red)
svn copy $RepoPath/branches/branch1 $RepoPath/branches/branch19 -m "Created branch19"
svn switch $RepoPath/branches/branch19
svn rm *
cp ../commit19/* .
svn add --force *
svn commit -m "c19" --username "red"

###############################################################################
# c20 (создаём ветку branch20 от branch19, пользователь red)
svn copy $RepoPath/branches/branch19 $RepoPath/branches/branch20 -m "Created branch20"
svn switch $RepoPath/branches/branch20
svn rm *
cp ../commit20/* .
svn add --force *
svn commit -m "c20" --username "red"

###############################################################################
# Переходим на branch14
svn switch $RepoPath/branches/branch14
# c21 (на branch14, пользователь red)
svn rm *
cp ../commit21/* .
svn add --force *
svn commit -m "c21" --username "red"

###############################################################################
# Переключаем на blue (toBlueUser.sh)
# c22 (создаём ветку branch22 от branch14, пользователь blue)
svn copy $RepoPath/branches/branch14 $RepoPath/branches/branch22 -m "Created branch22"
svn switch $RepoPath/branches/branch22
svn rm *
cp ../commit22/* .
svn add --force *
svn commit -m "c22" --username "blue"

###############################################################################
# Переходим на branch12
svn switch $RepoPath/branches/branch12
# c23 (на branch12, пользователь blue)
svn rm *
cp ../commit23/* .
svn add --force *
svn commit -m "c23" --username "blue"

###############################################################################
# Переключаем на red (toRedUser.sh)
# Переходим на main
svn switch $RepoPath/branches/main
# c24 (на main, пользователь red)
svn rm *
cp ../commit24/* .
svn add --force *
svn commit -m "c24" --username "red"

###############################################################################
# Переходим на branch20
svn switch $RepoPath/branches/branch20
# c25 (на branch20, пользователь red)
svn rm *
cp ../commit25/* .
svn add --force *
svn commit -m "c25" --username "red"

###############################################################################
# c26 (создаём ветку branch26 от branch20, пользователь red)
svn copy $RepoPath/branches/branch20 $RepoPath/branches/branch26 -m "Created branch26"
svn switch $RepoPath/branches/branch26
svn rm *
cp ../commit26/* .
svn add --force *
svn commit -m "c26" --username "red"

# c27 (на branch26, пользователь red)
cp ../commit27/* .
svn add --force *
svn commit -m "c27" --username "red"

###############################################################################
# Переключаем на blue (toBlueUser.sh)
# Переходим на branch6
svn switch $RepoPath/branches/branch6
# c28 (на branch6, пользователь blue)
svn rm *
cp ../commit28/* .
svn add --force *
svn commit -m "c28" --username "blue"

###############################################################################
# c29 (создаём ветку branch29 от branch6, пользователь blue)
svn copy $RepoPath/branches/branch6 $RepoPath/branches/branch29 -m "Created branch29"
svn switch $RepoPath/branches/branch29
# Сначала слияние branch6 в branch29 (как в Git: merge --commit)
svn merge $RepoPath/branches/branch6 --accept working
svn commit -m "Merge branch6 into branch29" --username "blue"
svn rm *
cp ../commit29/* .
svn add --force *
svn commit -m "c29" --username "blue"

###############################################################################
# Переключаем на red (toRedUser.sh)
# Переходим на branch7
svn switch $RepoPath/branches/branch7
# c30 (на branch7, пользователь red)
svn rm *
cp ../commit30/* .
svn add --force *
svn commit -m "c30" --username "red"

###############################################################################
# Переключаем на blue (toBlueUser.sh)
# c31 (создаём ветку branch31 от branch7, пользователь blue)
svn copy $RepoPath/branches/branch7 $RepoPath/branches/branch31 -m "Created branch31"
svn switch $RepoPath/branches/branch31
svn merge $RepoPath/branches/branch7 --accept working
svn rm *
cp ../commit31/* .
svn add --force *
svn commit -m "c31" --username "blue"

###############################################################################
# Переключаем на red (toRedUser.sh)
# c32 (создаём ветку branch32 от branch31, пользователь red)
svn copy $RepoPath/branches/branch31 $RepoPath/branches/branch32 -m "Created branch32"
svn switch $RepoPath/branches/branch32
svn rm *
cp ../commit32/* .
svn add --force *
svn commit -m "c32" --username "red"

###############################################################################
# Переходим на branch1
svn switch $RepoPath/branches/branch1
# c33 (на branch1, пользователь red)
svn rm *
cp ../commit33/* .
svn add --force *
svn commit -m "c33" --username "red"

###############################################################################
# Переключаем на blue (toBlueUser.sh)
# Переходим на branch12
svn switch $RepoPath/branches/branch12
# c34 (на branch12, пользователь blue)
svn rm *
cp ../commit34/* .
svn add --force *
svn commit -m "c34" --username "blue"

###############################################################################
# Переходим на branch31
svn switch $RepoPath/branches/branch31
# c35 (на branch31, пользователь blue)
svn rm *
cp ../commit35/* .
svn add --force *
svn commit -m "c35" --username "blue"

###############################################################################
# Переходим на branch12
svn switch $RepoPath/branches/branch12
# c36 (на branch12, пользователь blue)
svn rm *
cp ../commit36/* .
svn add --force *
svn commit -m "c36" --username "blue"

###############################################################################
# Переключаем на red (toRedUser.sh)
# Переходим на branch20
svn switch $RepoPath/branches/branch20
# c37 (на branch20, пользователь red)
svn rm *
cp ../commit37/* .
svn add --force *
svn commit -m "c37" --username "red"

###############################################################################
# Переходим на branch11
svn switch $RepoPath/branches/branch11
# c38 (на branch11, пользователь red)
svn rm *
cp ../commit38/* .
svn add --force *
svn commit -m "c38" --username "red"

###############################################################################
# Переходим на main
svn switch $RepoPath/branches/main
# c39 (на main, пользователь red)
svn rm *
cp ../commit39/* .
svn add --force *
svn commit -m "c39" --username "red"

###############################################################################
# Переходим на branch12 и переключаем на blue (toBlueUser.sh)
svn switch $RepoPath/branches/branch12
svn rm *
cp ../commit40/* .
svn add --force *
svn commit -m "c40" --username "blue"

###############################################################################
# Переходим на branch16
svn switch $RepoPath/branches/branch16
# c41 (на branch16, пользователь blue)
svn rm *
cp ../commit41/* .
svn add --force *
svn commit -m "c41" --username "blue"

###############################################################################
# Переходим на branch13
svn switch $RepoPath/branches/branch13
# c42 (на branch13, пользователь blue)
svn rm *
cp ../commit42/* .
svn add --force *
svn commit -m "c42" --username "blue"

###############################################################################
# Переходим на branch16
svn switch $RepoPath/branches/branch16
# c43 (на branch16, пользователь blue)
svn rm *
cp ../commit43/* .
svn add --force *
svn commit -m "c43" --username "blue"

# Создаём ветку branch44 от branch16
svn copy $RepoPath/branches/branch16 $RepoPath/branches/branch44 -m "Created branch44"
svn switch $RepoPath/branches/branch44

###############################################################################
# Переключаем на red (toRedUser.sh)
# c44 (на branch44, пользователь red)
svn rm *
cp ../commit44/* .
svn add --force *
svn commit -m "c44" --username "red"

###############################################################################
# c45 (создаём ветку branch45 от branch44, пользователь red)
svn copy $RepoPath/branches/branch44 $RepoPath/branches/branch45 -m "Created branch45"
svn switch $RepoPath/branches/branch45
svn rm *
cp ../commit45/* .
svn add --force *
svn commit -m "c45" --username "red"

###############################################################################
# Переключаем на blue (toBlueUser.sh)
# Переходим на branch31
svn switch $RepoPath/branches/branch31
# c46 (на branch31, пользователь blue)
svn rm *
cp ../commit46/* .
svn add --force *
svn commit -m "c46" --username "blue"

###############################################################################
# Переходим на branch16
svn switch $RepoPath/branches/branch16
# c47 (на branch16, пользователь blue)
svn rm *
cp ../commit47/* .
svn add --force *
svn commit -m "c47" --username "blue"

###############################################################################
# Переходим на branch29
svn switch $RepoPath/branches/branch29
# c48 (на branch29, пользователь blue)
svn rm *
cp ../commit48/* .
svn add --force *
svn commit -m "c48" --username "blue"

###############################################################################
# c49 (создаём ветку branch49 от branch29, пользователь blue)
svn copy $RepoPath/branches/branch29 $RepoPath/branches/branch49 -m "Created branch49"
svn switch $RepoPath/branches/branch49
svn rm *
cp ../commit49/* .
svn add --force *
svn commit -m "c49" --username "blue"

###############################################################################
# Переключаем на red (toRedUser.sh)
# Переходим на branch26
svn switch $RepoPath/branches/branch26
# c50 (на branch26, пользователь red)
svn rm *
cp ../commit50/* .
svn add --force *
svn commit -m "c50" --username "red"

###############################################################################
# Переключаем на blue (toBlueUser.sh)
# Переходим на branch49
svn switch $RepoPath/branches/branch49
# Слияние branch26 в branch49 без commit
svn merge $RepoPath/branches/branch26 --accept working
svn rm *
cp ../commit51/* .
svn add --force *
svn commit -m "c51" --username "blue"

###############################################################################
# Переключаем на red (toRedUser.sh)
# Переходим на branch32
svn switch $RepoPath/branches/branch32
# Слияние branch49 в branch32 без commit
svn merge $RepoPath/branches/branch49 --accept working
svn rm *
cp ../commit52/* .
svn add --force *
svn commit -m "c52" --username "red"

###############################################################################
# Переходим на branch19
svn switch $RepoPath/branches/branch19
# c53 (на branch19, пользователь red)
svn rm *
cp ../commit53/* .
svn add --force *
svn commit -m "c53" --username "red"

# c54 (на branch19, продолжение, пользователь red)
cp ../commit54/* .
svn add --force *
svn commit -m "c54" --username "red"

###############################################################################
# Переходим на branch20
svn switch $RepoPath/branches/branch20
# c55 (на branch20, пользователь red)
svn rm *
cp ../commit55/* .
svn add --force *
svn commit -m "c55" --username "red"

###############################################################################
# Переключаем на blue (toBlueUser.sh)
# Переходим на branch44
svn switch $RepoPath/branches/branch44
# c56 (на branch44, пользователь blue)
svn rm *
cp ../commit56/* .
svn add --force *
svn commit -m "c56" --username "blue"

###############################################################################
# Переключаем на red (toRedUser.sh)
# c57 (создаём ветку branch57 от branch44, пользователь red)
svn copy $RepoPath/branches/branch44 $RepoPath/branches/branch57 -m "Created branch57"
svn switch $RepoPath/branches/branch57
svn rm *
cp ../commit57/* .
svn add --force *
svn commit -m "c57" --username "red"

###############################################################################
# Переходим на branch11
svn switch $RepoPath/branches/branch11
# c58 (на branch11, пользователь red)
svn rm *
cp ../commit58/* .
svn add --force *
svn commit -m "c58" --username "red"

###############################################################################
# Переходим на branch14
svn switch $RepoPath/branches/branch14
# Слияние branch11 в branch14 без commit
svn merge $RepoPath/branches/branch11 --accept working
svn rm *
cp ../commit59/* .
svn add --force *
svn commit -m "c59" --username "red"

###############################################################################
# Переходим на branch3
svn switch $RepoPath/branches/branch3
# c60 (на branch3, пользователь red)
svn rm *
cp ../commit60/* .
svn add --force *
svn commit -m "c60" --username "red"

###############################################################################
# Переходим на main
svn switch $RepoPath/branches/main
# c61 (на main, пользователь red)
svn rm *
cp ../commit61/* .
svn add --force *
svn commit -m "c61" --username "red"

###############################################################################
# Переключаем на blue (toBlueUser.sh)
# Переходим на branch44
svn switch $RepoPath/branches/branch44
# c62 (на branch44, пользователь blue)
svn rm *
cp ../commit62/* .
svn add --force *
svn commit -m "c62" --username "blue"

###############################################################################
# Переключаем на red (toRedUser.sh)
# Переходим на branch45
svn switch $RepoPath/branches/branch45
# c63 (на branch45, пользователь red)
svn rm *
cp ../commit63/* .
svn add --force *
svn commit -m "c63" --username "red"

###############################################################################
# c64 (создаём ветку branch64 от branch45, пользователь red)
svn copy $RepoPath/branches/branch45 $RepoPath/branches/branch64 -m "Created branch64"
svn switch $RepoPath/branches/branch64
svn rm *
cp ../commit64/* .
svn add --force *
svn commit -m "c64" --username "red"
# Слияние branch45 в branch64 с commit
svn merge $RepoPath/branches/branch45 --accept working
svn commit -m "Merge branch45 into branch64" --username "red"

###############################################################################
# Переключаем на blue (toBlueUser.sh)
# c65 (создаём ветку branch65 от branch64, пользователь blue)
svn copy $RepoPath/branches/branch64 $RepoPath/branches/branch65 -m "Created branch65"
svn switch $RepoPath/branches/branch65
svn rm *
cp ../commit65/* .
svn add --force *
svn commit -m "c65" --username "blue"
# Слияние branch64 в branch65 с commit
svn merge $RepoPath/branches/branch64 --accept working
svn commit -m "Merge branch64 into branch65" --username "blue"

###############################################################################
# Переходим на branch13
svn switch $RepoPath/branches/branch13
# c66 (на branch13, пользователь blue)
svn rm *
cp ../commit66/* .
svn add --force *
svn commit -m "c66" --username "blue"

###############################################################################
# Переключаем на red (toRedUser.sh)
# Переходим на branch57
svn switch $RepoPath/branches/branch57
# Слияние branch13 в branch57 без commit
svn merge $RepoPath/branches/branch13 --accept working
svn rm *
cp ../commit67/* .
svn add --force *
svn commit -m "c67" --username "red"

###############################################################################
# Переходим на branch20
svn switch $RepoPath/branches/branch20
# Слияние branch57 в branch20 без commit
svn merge $RepoPath/branches/branch57 --accept working
svn rm *
cp ../commit68/* .
svn add --force *
svn commit -m "c68" --username "red"

###############################################################################
# Переходим на main
svn switch $RepoPath/branches/main
# Слияние branch20 в main без commit
svn merge $RepoPath/branches/branch20 --accept working
svn rm *
cp ../commit69/* .
svn add --force *
svn commit -m "c69" --username "red"

###############################################################################
# Переключаем на blue (toBlueUser.sh)
# Переходим на branch29
svn switch $RepoPath/branches/branch29
# c70 (на branch29, пользователь blue)
svn rm *
cp ../commit70/* .
svn add --force *
svn commit -m "c70" --username "blue"

###############################################################################
# Переходим на branch16
svn switch $RepoPath/branches/branch16
# c71 (на branch16, пользователь blue)
svn rm *
cp ../commit71/* .
svn add --force *
svn commit -m "c71" --username "blue"

###############################################################################
# Переключаем на red (toRedUser.sh)
# Переходим на branch4
svn switch $RepoPath/branches/branch4
# c72 (на branch4, пользователь red)
svn rm *
cp ../commit72/* .
svn add --force *
svn commit -m "c72" --username "red"

###############################################################################
# Переходим на branch3
svn switch $RepoPath/branches/branch3
# c73 (на branch3, пользователь red)
svn rm *
cp ../commit73/* .
svn add --force *
svn commit -m "c73" --username "red"
# Слияние branch4 в branch3 без commit
svn merge $RepoPath/branches/branch4 --accept working
svn commit -m "Merge branch4 into branch3" --username "red"

###############################################################################
# Переключаем на blue (toBlueUser.sh)
# c74 (создаём ветку branch74 от branch3, пользователь blue)
svn copy $RepoPath/branches/branch3 $RepoPath/branches/branch74 -m "Created branch74"
svn switch $RepoPath/branches/branch74
svn rm *
cp ../commit74/* .
svn add --force *
svn commit -m "c74" --username "blue"

###############################################################################
# Переключаем на red (toRedUser.sh)
# Переходим на branch19
svn switch $RepoPath/branches/branch19
# c75 (на branch19, пользователь red)
svn rm *
cp ../commit75/* .
svn add --force *
svn commit -m "c75" --username "red"

###############################################################################
# Переключаем на blue (toBlueUser.sh)
# c76 (создаём ветку branch76 от branch19, пользователь blue)
svn copy $RepoPath/branches/branch19 $RepoPath/branches/branch76 -m "Created branch76"
svn switch $RepoPath/branches/branch76
svn merge $RepoPath/branches/branch19 --accept working
svn rm *
cp ../commit76/* .
svn add --force *
svn commit -m "c76" --username "blue"

###############################################################################
# Переключаем на red (toRedUser.sh)
# Переходим на branch14
svn switch $RepoPath/branches/branch14
# c77 (на branch14, пользователь red)
svn rm *
cp ../commit77/* .
svn add --force *
svn commit -m "c77" --username "red"

###############################################################################
# Переходим на main
svn switch $RepoPath/branches/main
# c78 (на main, пользователь red)
svn rm *
cp ../commit78/* .
svn add --force *
svn commit -m "c78" --username "red"

###############################################################################
# Переходим на branch22
svn switch $RepoPath/branches/branch22
# c79 (на branch22, пользователь red)
svn rm *
cp ../commit79/* .
svn add --force *
svn commit -m "c79" --username "red"

###############################################################################
# Переходим на main
svn switch $RepoPath/branches/main
# Слияние branch22 в main без commit
svn merge $RepoPath/branches/branch22 --accept working
svn rm *
cp ../commit80/* .
svn add --force *
svn commit -m "c80" --username "red"

###############################################################################
# Переключаем на blue (toBlueUser.sh)
# Переходим на branch76
svn switch $RepoPath/branches/branch76
# c81 (на branch76, пользователь blue)
svn rm *
cp ../commit81/* .
svn add --force *
svn commit -m "c81" --username "blue"

###############################################################################
# Переключаем на red (toRedUser.sh)
# Переходим на branch1
svn switch $RepoPath/branches/branch1
# Слияние branch22 в branch1 без commit
svn merge $RepoPath/branches/branch22 --accept working
svn rm *
cp ../commit82/* .
svn add --force *
svn commit -m "c82" --username "red"

###############################################################################
# Переходим на branch32
svn switch $RepoPath/branches/branch32
# Слияние branch1 в branch32 без commit
svn merge $RepoPath/branches/branch1 --accept working
svn rm *
cp ../commit83/* .
svn add --force *
svn commit -m "c83" --username "red"

###############################################################################
# Переходим на branch3
svn switch $RepoPath/branches/branch3
# c84 (на branch3, пользователь red)
svn rm *
cp ../commit84/* .
svn add --force *
svn commit -m "c84" --username "red"

###############################################################################
# Переключаем на blue (toBlueUser.sh)
# Переходим на branch31
svn switch $RepoPath/branches/branch31
# Слияние branch3 в branch31 без commit
svn merge $RepoPath/branches/branch3 --accept working
svn rm *
cp ../commit85/* .
svn add --force *
svn commit -m "c85" --username "blue"

###############################################################################
# Переходим на branch14
svn switch $RepoPath/branches/branch14
# Слияние branch31 в branch14 без commit
svn merge $RepoPath/branches/branch31 --accept working
# Переключаем на red (toRedUser.sh)
svn rm *
cp ../commit86/* .
svn add --force *
svn commit -m "c86" --username "red"

###############################################################################
# Переключаем на red (toRedUser.sh)
# Переходим на branch65
svn switch $RepoPath/branches/branch65
# Слияние branch14 в branch65 без commit
svn merge $RepoPath/branches/branch14 --accept working
svn rm *
cp ../commit87/* .
svn add --force *
svn commit -m "c87" --username "red"

###############################################################################
# Переходим на branch32
svn switch $RepoPath/branches/branch32
# Слияние branch65 в branch32 без commit
svn merge $RepoPath/branches/branch65 --accept working
svn rm *
cp ../commit88/* .
svn add --force *
svn commit -m "c88" --username "red"

###############################################################################
# Переходим на branch10
svn switch $RepoPath/branches/branch10
# Переключаем на red (toRedUser.sh)
svn merge $RepoPath/branches/branch32 --accept working
# Переключаем на blue (toBlueUser.sh)
svn rm *
cp ../commit89/* .
svn add --force *
svn commit -m "c89" --username "blue"

###############################################################################
# Переключаем на blue (toBlueUser.sh)
# Переходим на branch74
svn switch $RepoPath/branches/branch74
# Слияние branch10 в branch74 без commit
svn merge $RepoPath/branches/branch10 --accept working
svn rm *
cp ../commit90/* .
svn add --force *
svn commit -m "c90" --username "blue"

###############################################################################
# c91 (создаём ветку branch91 от branch74, пользователь blue)
svn copy $RepoPath/branches/branch74 $RepoPath/branches/branch91 -m "Created branch91"
svn switch $RepoPath/branches/branch91
# Слияние branch74 в branch91 без commit
svn merge $RepoPath/branches/branch74 --accept working
svn rm *
cp ../commit91/* .
svn add --force *
svn commit -m "c91" --username "blue"

###############################################################################
# Переходим на branch12
svn switch $RepoPath/branches/branch12
# c92 (на branch12, пользователь blue)
svn rm *
cp ../commit92/* .
svn add --force *
svn commit -m "c92" --username "blue"

###############################################################################
# Переходим на branch16
svn switch $RepoPath/branches/branch16
# Слияние branch12 в branch16 без commit
svn merge $RepoPath/branches/branch12 --accept working
svn rm *
cp ../commit93/* .
svn add --force *
svn commit -m "c93" --username "blue"

###############################################################################
# Переходим на branch91
svn switch $RepoPath/branches/branch91
# Слияние branch16 в branch91 без commit
svn merge $RepoPath/branches/branch16 --accept working
svn rm *
cp ../commit94/* .
svn add --force *
svn commit -m "c94" --username "blue"

###############################################################################
# Переходим на branch29
svn switch $RepoPath/branches/branch29
# Слияние branch91 в branch29 без commit
svn merge $RepoPath/branches/branch91 --accept working
svn rm *
cp ../commit95/* .
svn add --force *
svn commit -m "c95" --username "blue"

###############################################################################
# Переключаем на red (toRedUser.sh)
# Переходим на branch5
svn switch $RepoPath/branches/branch5
# Слияние branch29 в branch5 без commit
svn merge $RepoPath/branches/branch29 --accept working
svn rm *
cp ../commit96/* .
svn add --force *
svn commit -m "c96" --username "red"

###############################################################################
# Переключаем на blue (toBlueUser.sh)
# Переходим на branch44
svn switch $RepoPath/branches/branch44
# Слияние branch5 в branch44 без commit
svn merge $RepoPath/branches/branch5 --accept working
svn rm *
cp ../commit97/* .
svn add --force *
svn commit -m "c97" --username "blue"
