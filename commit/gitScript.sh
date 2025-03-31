rm -rf buffer
mkdir buffer
git init buffer
cd buffer

sh toRedUser.sh
cp ../commit0/* . && git add .
git commit -m "c0"

git checkout -b branch1
cp ../commit1/* . && git add .
git commit -m "c1"

sh toBlueUser.sh
git checkout -b branch2
cp ../commit2/* . && git add .
git commit -m "c2"

sh toRedUser.sh
git checkout -b branch3
cp ../commit3/* . && git add .
git commit -m "c3"

git checkout -b branch4
cp ../commit4/* . && git add .
git commit -m "c4"

git checkout -b branch5
cp ../commit5/* . && git add .
git commit -m "c5"

sh toBlueUser.sh
git checkout -b branch6
cp ../commit6/* . && git add .
git commit -m "c6"

sh toRedUser.sh
git checkout -b branch7
cp ../commit7/* . && git add .
git commit -m "c7"

sh toBlueUser.sh
git checkout branch6
cp ../commit8/* . && git add .
git commit -m "c8"

cp ../commit9/* . && git add .
git commit -m "c9"

git checkout -b branch10
cp ../commit10/* . && git add .
git commit -m "c10"

sh toRedUser.sh
git checkout -b branch11
cp ../commit11/* . && git add .
git commit -m "c11"

sh toBlueUser.sh
git checkout -b branch12
cp ../commit12/* . && git add .
git commit -m "c12"

git checkout -b branch13
cp commit13/* . && git add .
git commit -m "c13"

sh toRedUser.sh
git checkout -b branch14
cp ../commit14/* . && git add .
git commit -m "c14"

sh toBlueUser.sh
git checkout branch2
cp ../commit15/* . && git add .
git commit -m "c15"

git checkout branch16
cp ../commit16/* . && git add .
git commit -m "c16"

git checkout branch2
git merge branch16
git commit -m "c15+c16"

sh toRedUser.sh
git checkout branch5
cp commit17/* . && git add .
git commit -m "c17"

git checkout branch1
cp commit18/* . && git add .
git commit -m "c18"

git checkout -b branch19
cp commit19/* . && git add .
git commit -m "c19"

git checkout -b branch20
cp commit20/* . && git add .
git commit -m "c20"

git checkout branch14
cp commit21/* . && git add .
git commit -m "c21"

sh toBlueUser
git checkout -b branch22
cp commit22/* . && git add .
git commit -m "c22"

git checkout branch12
cp commit23/* . && git add .
git commit -m "c23"

sh toRedUser
git checkout main
cp commit24/* . && git add .
git commit -m "c24"


cp commit25/* . && git add .
git commit -m "c25"


#cp commit26/* . && git add .
#cp commit27/* . && git add .
#cp commit28/* . && git add .
#cp commit29/* . && git add .
#cp commit30/* . && git add .
#cp commit31/* . && git add .
#cp commit32/* . && git add .

cp commit33/* . && git add .
git checkout -b main
git commit -m "c33"

cp commit34/* . && git add .
git checkout -b branch11
git commit -m "c34"

cp commit35/* . && git add .
git checkout -b branch30
git commit -m "c35"

cp commit36/* . && git add .
git checkout -b branch11
git commit -m "c36"

cp commit37/* . && git add .
cp commit38/* . && git add .
cp commit39/* . && git add .
cp commit40/* . && git add .
cp commit41/* . && git add .
cp commit42/* . && git add .
cp commit43/* . && git add .
cp commit44/* . && git add .
cp commit45/* . && git add .
cp commit46/* . && git add .
cp commit47/* . && git add .
cp commit48/* . && git add .
cp commit49/* . && git add .
cp commit50/* . && git add .
#cp commit51/* . && git add .
#cp commit52/* . && git add .
#cp commit53/* . && git add .
#cp commit54/* . && git add .
#cp commit55/* . && git add .
#cp commit56/* . && git add .
#cp commit57/* . && git add .
#cp commit58/* . && git add .
#cp commit59/* . && git add .
#cp commit60/* . && git add .
#cp commit61/* . && git add .
#cp commit62/* . && git add .
#cp commit63/* . && git add .
#cp commit64/* . && git add .
#cp commit65/* . && git add .
#cp commit66/* . && git add .
#cp commit67/* . && git add .
#cp commit68/* . && git add .
#cp commit69/* . && git add .
#cp commit70/* . && git add .
#cp commit71/* . && git add .
#cp commit72/* . && git add .
#cp commit73/* . && git add .
#cp commit74/* . && git add .
#cp commit75/* . && git add .
#cp commit76/* . && git add .
#cp commit77/* . && git add .
#cp commit78/* . && git add .
#cp commit79/* . && git add .
#cp commit80/* . && git add .
#cp commit81/* . && git add .
#cp commit82/* . && git add .
#cp commit83/* . && git add .
#cp commit84/* . && git add .
#cp commit85/* . && git add .
#cp commit86/* . && git add .
#cp commit87/* . && git add .
#cp commit88/* . && git add .
#cp commit89/* . && git add .
#cp commit90/* . && git add .
#cp commit91/* . && git add .
#cp commit92/* . && git add .
#cp commit93/* . && git add .
#cp commit94/* . && git add .
#cp commit95/* . && git add .
#cp commit96/* . && git add .
#cp commit97/* . && git add .