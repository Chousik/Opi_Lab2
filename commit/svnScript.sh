
rm -rf buffer
mkdir buffer
svnadmin create buffer/RepositorySVN
RepoPath="file://$(pwd)/buffer/RepositorySVN"
svn mkdir $RepoPath/trunk $RepoPath/branches -m "Initial structure"
svn checkout $RepoPath/trunk working_copy
cd working_copy
svn copy $RepoPath/trunk $RepoPath/branches/main -m "Created main"
svn switch $RepoPath/branches/main
svn rm *
cp ../commit0/* .
svn add --force *
svn commit -m "c0" --username "red"
svn copy $RepoPath/branches/main $RepoPath/branches/branch1 -m "Created branch1"
svn switch $RepoPath/branches/branch1
svn rm *
cp ../commit1/* .
svn add --force *
svn commit -m "c1" --username "red"
svn copy $RepoPath/branches/branch1 $RepoPath/branches/branch2 -m "Created branch2"
svn switch $RepoPath/branches/branch2
svn rm *
cp ../commit2/* .
svn add --force *
svn commit -m "c2" --username "blue"
svn copy $RepoPath/branches/branch2 $RepoPath/branches/branch3 -m "Created branch3"
svn switch $RepoPath/branches/branch3
svn rm *
cp ../commit3/* .
svn add --force *
svn commit -m "c3" --username "red"
svn copy $RepoPath/branches/branch3 $RepoPath/branches/branch4 -m "Created branch4"
svn switch $RepoPath/branches/branch4
svn rm *
cp ../commit4/* .
svn add --force *
svn commit -m "c4" --username "red"
svn copy $RepoPath/branches/branch4 $RepoPath/branches/branch5 -m "Created branch5"
svn switch $RepoPath/branches/branch5
svn rm *
cp ../commit5/* .
svn add --force *
svn commit -m "c5" --username "red"
svn copy $RepoPath/branches/branch5 $RepoPath/branches/branch6 -m "Created branch6"
svn switch $RepoPath/branches/branch6
svn rm *
cp ../commit6/* .
svn add --force *
svn commit -m "c6" --username "blue"
svn copy $RepoPath/branches/branch6 $RepoPath/branches/branch7 -m "Created branch7"
svn switch $RepoPath/branches/branch7
svn rm *
cp ../commit7/* .
svn add --force *
svn commit -m "c7" --username "red"
svn switch $RepoPath/branches/branch6
svn rm *
cp ../commit8/* .
svn add --force *
svn commit -m "c8" --username "blue"
cp ../commit9/* .
svn add --force *
svn commit -m "c9" --username "blue"
svn copy $RepoPath/branches/branch6 $RepoPath/branches/branch10 -m "Created branch10"
svn switch $RepoPath/branches/branch10
svn rm *
cp ../commit10/* .
svn add --force *
svn commit -m "c10" --username "blue"
svn copy $RepoPath/branches/branch10 $RepoPath/branches/branch11 -m "Created branch11"
svn switch $RepoPath/branches/branch11
svn rm *
cp ../commit11/* .
svn add --force *
svn commit -m "c11" --username "red"
svn copy $RepoPath/branches/branch11 $RepoPath/branches/branch12 -m "Created branch12"
svn switch $RepoPath/branches/branch12
svn rm *
cp ../commit12/* .
svn add --force *
svn commit -m "c12" --username "blue"
svn copy $RepoPath/branches/branch12 $RepoPath/branches/branch13 -m "Created branch13"
svn switch $RepoPath/branches/branch13
svn rm *
cp ../commit13/* .
svn add --force *
svn commit -m "c13" --username "blue"
svn copy $RepoPath/branches/branch13 $RepoPath/branches/branch14 -m "Created branch14"
svn switch $RepoPath/branches/branch14
svn rm *
cp ../commit14/* .
svn add --force *
svn commit -m "c14" --username "red"
svn switch $RepoPath/branches/branch2
svn rm *
cp ../commit15/* .
svn add --force *
svn commit -m "c15" --username "blue"
svn copy $RepoPath/branches/branch2 $RepoPath/branches/branch16 -m "Created branch16"
svn switch $RepoPath/branches/branch16
svn rm *
cp ../commit16/* .
svn add --force *
svn commit -m "c16" --username "blue"
svn merge $RepoPath/branches/branch2 --accept working
svn commit -m "Merge branch2 into branch16" --username "blue"
svn switch $RepoPath/branches/branch5
svn rm *
cp ../commit17/* .
svn add --force *
svn commit -m "c17" --username "red"
svn switch $RepoPath/branches/branch1
svn rm *
cp ../commit18/* .
svn add --force *
svn commit -m "c18" --username "red"
svn copy $RepoPath/branches/branch1 $RepoPath/branches/branch19 -m "Created branch19"
svn switch $RepoPath/branches/branch19
svn rm *
cp ../commit19/* .
svn add --force *
svn commit -m "c19" --username "red"
svn copy $RepoPath/branches/branch19 $RepoPath/branches/branch20 -m "Created branch20"
svn switch $RepoPath/branches/branch20
svn rm *
cp ../commit20/* .
svn add --force *
svn commit -m "c20" --username "red"
svn switch $RepoPath/branches/branch14
svn rm *
cp ../commit21/* .
svn add --force *
svn commit -m "c21" --username "red"
svn copy $RepoPath/branches/branch14 $RepoPath/branches/branch22 -m "Created branch22"
svn switch $RepoPath/branches/branch22
svn rm *
cp ../commit22/* .
svn add --force *
svn commit -m "c22" --username "blue"
svn switch $RepoPath/branches/branch12
svn rm *
cp ../commit23/* .
svn add --force *
svn commit -m "c23" --username "blue"
svn switch $RepoPath/branches/main
svn rm *
cp ../commit24/* .
svn add --force *
svn commit -m "c24" --username "red"
svn switch $RepoPath/branches/branch20
svn rm *
cp ../commit25/* .
svn add --force *
svn commit -m "c25" --username "red"
svn copy $RepoPath/branches/branch20 $RepoPath/branches/branch26 -m "Created branch26"
svn switch $RepoPath/branches/branch26
svn rm *
cp ../commit26/* .
svn add --force *
svn commit -m "c26" --username "red"
cp ../commit27/* .
svn add --force *
svn commit -m "c27" --username "red"
svn switch $RepoPath/branches/branch6
svn rm *
cp ../commit28/* .
svn add --force *
svn commit -m "c28" --username "blue"
svn copy $RepoPath/branches/branch6 $RepoPath/branches/branch29 -m "Created branch29"
svn switch $RepoPath/branches/branch29
svn merge $RepoPath/branches/branch6 --accept working
svn commit -m "Merge branch6 into branch29" --username "blue"
svn rm *
cp ../commit29/* .
svn add --force *
svn commit -m "c29" --username "blue"
svn switch $RepoPath/branches/branch7
svn rm *
cp ../commit30/* .
svn add --force *
svn commit -m "c30" --username "red"
svn copy $RepoPath/branches/branch7 $RepoPath/branches/branch31 -m "Created branch31"
svn switch $RepoPath/branches/branch31
svn merge $RepoPath/branches/branch7 --accept working
svn rm *
cp ../commit31/* .
svn add --force *
svn commit -m "c31" --username "blue"
svn copy $RepoPath/branches/branch31 $RepoPath/branches/branch32 -m "Created branch32"
svn switch $RepoPath/branches/branch32
svn rm *
cp ../commit32/* .
svn add --force *
svn commit -m "c32" --username "red"
svn switch $RepoPath/branches/branch1
svn rm *
cp ../commit33/* .
svn add --force *
svn commit -m "c33" --username "red"
svn switch $RepoPath/branches/branch12
svn rm *
cp ../commit34/* .
svn add --force *
svn commit -m "c34" --username "blue"
svn switch $RepoPath/branches/branch31
svn rm *
cp ../commit35/* .
svn add --force *
svn commit -m "c35" --username "blue"
svn switch $RepoPath/branches/branch12
svn rm *
cp ../commit36/* .
svn add --force *
svn commit -m "c36" --username "blue"
svn switch $RepoPath/branches/branch20
svn rm *
cp ../commit37/* .
svn add --force *
svn commit -m "c37" --username "red"
svn switch $RepoPath/branches/branch11
svn rm *
cp ../commit38/* .
svn add --force *
svn commit -m "c38" --username "red"
svn switch $RepoPath/branches/main
svn rm *
cp ../commit39/* .
svn add --force *
svn commit -m "c39" --username "red"
svn switch $RepoPath/branches/branch12
svn rm *
cp ../commit40/* .
svn add --force *
svn commit -m "c40" --username "blue"
svn switch $RepoPath/branches/branch16
svn rm *
cp ../commit41/* .
svn add --force *
svn commit -m "c41" --username "blue"
svn switch $RepoPath/branches/branch13
svn rm *
cp ../commit42/* .
svn add --force *
svn commit -m "c42" --username "blue"
svn switch $RepoPath/branches/branch16
svn rm *
cp ../commit43/* .
svn add --force *
svn commit -m "c43" --username "blue"
svn copy $RepoPath/branches/branch16 $RepoPath/branches/branch44 -m "Created branch44"
svn switch $RepoPath/branches/branch44
svn rm *
cp ../commit44/* .
svn add --force *
svn commit -m "c44" --username "red"
svn copy $RepoPath/branches/branch44 $RepoPath/branches/branch45 -m "Created branch45"
svn switch $RepoPath/branches/branch45
svn rm *
cp ../commit45/* .
svn add --force *
svn commit -m "c45" --username "red"
svn switch $RepoPath/branches/branch31
svn rm *
cp ../commit46/* .
svn add --force *
svn commit -m "c46" --username "blue"
svn switch $RepoPath/branches/branch16
svn rm *
cp ../commit47/* .
svn add --force *
svn commit -m "c47" --username "blue"
svn switch $RepoPath/branches/branch29
svn rm *
cp ../commit48/* .
svn add --force *
svn commit -m "c48" --username "blue"
svn copy $RepoPath/branches/branch29 $RepoPath/branches/branch49 -m "Created branch49"
svn switch $RepoPath/branches/branch49
svn rm *
cp ../commit49/* .
svn add --force *
svn commit -m "c49" --username "blue"
svn switch $RepoPath/branches/branch26
svn rm *
cp ../commit50/* .
svn add --force *
svn commit -m "c50" --username "red"
svn switch $RepoPath/branches/branch49
svn merge $RepoPath/branches/branch26 --accept working
svn rm *
cp ../commit51/* .
svn add --force *
svn commit -m "c51" --username "blue"
svn switch $RepoPath/branches/branch32
svn merge $RepoPath/branches/branch49 --accept working
svn rm *
cp ../commit52/* .
svn add --force *
svn commit -m "c52" --username "red"
svn switch $RepoPath/branches/branch19
svn rm *
cp ../commit53/* .
svn add --force *
svn commit -m "c53" --username "red"
cp ../commit54/* .
svn add --force *
svn commit -m "c54" --username "red"
svn switch $RepoPath/branches/branch20
svn rm *
cp ../commit55/* .
svn add --force *
svn commit -m "c55" --username "red"
svn switch $RepoPath/branches/branch44
svn rm *
cp ../commit56/* .
svn add --force *
svn commit -m "c56" --username "blue"
svn copy $RepoPath/branches/branch44 $RepoPath/branches/branch57 -m "Created branch57"
svn switch $RepoPath/branches/branch57
svn rm *
cp ../commit57/* .
svn add --force *
svn commit -m "c57" --username "red"
svn switch $RepoPath/branches/branch11
svn rm *
cp ../commit58/* .
svn add --force *
svn commit -m "c58" --username "red"
svn switch $RepoPath/branches/branch14
svn merge $RepoPath/branches/branch11 --accept working
svn rm *
cp ../commit59/* .
svn add --force *
svn commit -m "c59" --username "red"
svn switch $RepoPath/branches/branch3
svn rm *
cp ../commit60/* .
svn add --force *
svn commit -m "c60" --username "red"
svn switch $RepoPath/branches/main
svn rm *
cp ../commit61/* .
svn add --force *
svn commit -m "c61" --username "red"
svn switch $RepoPath/branches/branch44
svn rm *
cp ../commit62/* .
svn add --force *
svn commit -m "c62" --username "blue"
svn switch $RepoPath/branches/branch45
svn rm *
cp ../commit63/* .
svn add --force *
svn commit -m "c63" --username "red"
svn copy $RepoPath/branches/branch45 $RepoPath/branches/branch64 -m "Created branch64"
svn switch $RepoPath/branches/branch64
svn rm *
cp ../commit64/* .
svn add --force *
svn commit -m "c64" --username "red"
svn merge $RepoPath/branches/branch45 --accept working
svn commit -m "Merge branch45 into branch64" --username "red"
svn copy $RepoPath/branches/branch64 $RepoPath/branches/branch65 -m "Created branch65"
svn switch $RepoPath/branches/branch65
svn rm *
cp ../commit65/* .
svn add --force *
svn commit -m "c65" --username "blue"
svn merge $RepoPath/branches/branch64 --accept working
svn commit -m "Merge branch64 into branch65" --username "blue"
svn switch $RepoPath/branches/branch13
svn rm *
cp ../commit66/* .
svn add --force *
svn commit -m "c66" --username "blue"
svn switch $RepoPath/branches/branch57
svn merge $RepoPath/branches/branch13 --accept working
svn rm *
cp ../commit67/* .
svn add --force *
svn commit -m "c67" --username "red"
svn switch $RepoPath/branches/branch20
svn merge $RepoPath/branches/branch57 --accept working
svn rm *
cp ../commit68/* .
svn add --force *
svn commit -m "c68" --username "red"
svn switch $RepoPath/branches/main
svn merge $RepoPath/branches/branch20 --accept working
svn rm *
cp ../commit69/* .
svn add --force *
svn commit -m "c69" --username "red"
svn switch $RepoPath/branches/branch29
svn rm *
cp ../commit70/* .
svn add --force *
svn commit -m "c70" --username "blue"
svn switch $RepoPath/branches/branch16
svn rm *
cp ../commit71/* .
svn add --force *
svn commit -m "c71" --username "blue"
svn switch $RepoPath/branches/branch4
svn rm *
cp ../commit72/* .
svn add --force *
svn commit -m "c72" --username "red"
svn switch $RepoPath/branches/branch3
svn rm *
cp ../commit73/* .
svn add --force *
svn commit -m "c73" --username "red"
svn merge $RepoPath/branches/branch4 --accept working
svn commit -m "Merge branch4 into branch3" --username "red"
svn copy $RepoPath/branches/branch3 $RepoPath/branches/branch74 -m "Created branch74"
svn switch $RepoPath/branches/branch74
svn rm *
cp ../commit74/* .
svn add --force *
svn commit -m "c74" --username "blue"
svn switch $RepoPath/branches/branch19
svn rm *
cp ../commit75/* .
svn add --force *
svn commit -m "c75" --username "red"
svn copy $RepoPath/branches/branch19 $RepoPath/branches/branch76 -m "Created branch76"
svn switch $RepoPath/branches/branch76
svn merge $RepoPath/branches/branch19 --accept working
svn rm *
cp ../commit76/* .
svn add --force *
svn commit -m "c76" --username "blue"
svn switch $RepoPath/branches/branch14
svn rm *
cp ../commit77/* .
svn add --force *
svn commit -m "c77" --username "red"
svn switch $RepoPath/branches/main
svn rm *
cp ../commit78/* .
svn add --force *
svn commit -m "c78" --username "red"
svn switch $RepoPath/branches/branch22
svn rm *
cp ../commit79/* .
svn add --force *
svn commit -m "c79" --username "red"
svn switch $RepoPath/branches/main
svn merge $RepoPath/branches/branch22 --accept working
svn rm *
cp ../commit80/* .
svn add --force *
svn commit -m "c80" --username "red"
svn switch $RepoPath/branches/branch76
svn rm *
cp ../commit81/* .
svn add --force *
svn commit -m "c81" --username "blue"
svn switch $RepoPath/branches/branch1
svn merge $RepoPath/branches/branch22 --accept working
svn rm *
cp ../commit82/* .
svn add --force *
svn commit -m "c82" --username "red"
svn switch $RepoPath/branches/branch32
svn merge $RepoPath/branches/branch1 --accept working
svn rm *
cp ../commit83/* .
svn add --force *
svn commit -m "c83" --username "red"
svn switch $RepoPath/branches/branch3
svn rm *
cp ../commit84/* .
svn add --force *
svn commit -m "c84" --username "red"
svn switch $RepoPath/branches/branch31
svn merge $RepoPath/branches/branch3 --accept working
svn rm *
cp ../commit85/* .
svn add --force *
svn commit -m "c85" --username "blue"
svn switch $RepoPath/branches/branch14
svn merge $RepoPath/branches/branch31 --accept working
svn rm *
cp ../commit86/* .
svn add --force *
svn commit -m "c86" --username "red"
svn switch $RepoPath/branches/branch65
svn merge $RepoPath/branches/branch14 --accept working
svn rm *
cp ../commit87/* .
svn add --force *
svn commit -m "c87" --username "red"
svn switch $RepoPath/branches/branch32
svn merge $RepoPath/branches/branch65 --accept working
svn rm *
cp ../commit88/* .
svn add --force *
svn commit -m "c88" --username "red"
svn switch $RepoPath/branches/branch10
svn merge $RepoPath/branches/branch32 --accept working
svn rm *
cp ../commit89/* .
svn add --force *
svn commit -m "c89" --username "blue"
svn switch $RepoPath/branches/branch74
svn merge $RepoPath/branches/branch10 --accept working
svn rm *
cp ../commit90/* .
svn add --force *
svn commit -m "c90" --username "blue"
svn copy $RepoPath/branches/branch74 $RepoPath/branches/branch91 -m "Created branch91"
svn switch $RepoPath/branches/branch91
svn merge $RepoPath/branches/branch74 --accept working
svn rm *
cp ../commit91/* .
svn add --force *
svn commit -m "c91" --username "blue"
svn switch $RepoPath/branches/branch12
svn rm *
cp ../commit92/* .
svn add --force *
svn commit -m "c92" --username "blue"
svn switch $RepoPath/branches/branch16
svn merge $RepoPath/branches/branch12 --accept working
svn rm *
cp ../commit93/* .
svn add --force *
svn commit -m "c93" --username "blue"
svn switch $RepoPath/branches/branch91
svn merge $RepoPath/branches/branch16 --accept working
svn rm *
cp ../commit94/* .
svn add --force *
svn commit -m "c94" --username "blue"
svn switch $RepoPath/branches/branch29
svn merge $RepoPath/branches/branch91 --accept working
svn rm *
cp ../commit95/* .
svn add --force *
svn commit -m "c95" --username "blue"
svn switch $RepoPath/branches/branch5
svn merge $RepoPath/branches/branch29 --accept working
svn rm *
cp ../commit96/* .
svn add --force *
svn commit -m "c96" --username "red"
sgivn switch $RepoPath/branches/branch44
svn merge $RepoPath/branches/branch5 --accept working
svn rm *
cp ../commit97/* .
svn add --force *
svn commit -m "c97" --username "blue"
