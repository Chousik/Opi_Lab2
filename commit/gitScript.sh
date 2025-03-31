git init

sh toRedUser.sh
cp commit0/* buffer/ && git add buffer/.
git commit -m "c0"

git checkout -b branch1
cp commit1/* buffer/ && git add buffer/.
git commit -m "c1"

sh toBlueUser.sh
git checkout -b branch2
cp commit2/* buffer/ && git add buffer/.
git commit -m "c2"

sh toRedUser.sh
git checkout -b branch3
cp commit3/* buffer/ && git add buffer/.
git commit -m "c3"

git checkout -b branch4
cp commit4/* buffer/ && git add buffer/.
git commit -m "c4"

git checkout -b branch5
cp commit5/* buffer/ && git add buffer/.
git commit -m "c5"

sh toBlueUser.sh
git checkout -b branch6
cp commit6/* buffer/ && git add buffer/.
git commit -m "c6"

sh toRedUser.sh
git checkout -b branch7
cp commit7/* buffer/ && git add buffer/.
git commit -m "c7"

sh toBlueUser.sh
git checkout branch6
cp commit8/* buffer/ && git add buffer/.
git commit -m "c8"

cp commit9/* buffer/ && git add buffer/
git commit -m "c9"

git checkout -b branch10
cp commit10/* buffer/ && git add buffer/
git commit -m "c10"

sh toRedUser.sh
git checkout -b branch11
cp commit11/* buffer/ && git add buffer/
git commit -m "c11"

sh toBlueUser.sh
git checkout -b branch12
cp commit12/* buffer/ && git add buffer/
git commit -m "c12"

git checkout -b branch13
cp commit13/* buffer/ && git add buffer/
git commit -m "c13"

sh toRedUser.sh
git checkout -b branch14
cp commit14/* buffer/ && git add buffer/
git commit -m "c14"

sh toBlueUser.sh
git checkout branch2
cp commit15/* buffer/ && git add buffer/
git commit -m "c15"

git checkout branch16
cp commit16/* buffer/ && git add buffer/
git commit -m "c16"

git checkout branch2
git merge branch16
git commit -m "c15+c16"

#cp commit17/* buffer/ && git add buffer/.
#cp commit18/* buffer/ && git add buffer/.
#cp commit19/* buffer/ && git add buffer/.
#cp commit20/* buffer/ && git add buffer/.
#cp commit21/* buffer/ && git add buffer/.
#cp commit22/* buffer/ && git add buffer/.
#cp commit23/* buffer/ && git add buffer/.
#cp commit24/* buffer/ && git add buffer/.
#cp commit25/* buffer/ && git add buffer/.
#cp commit26/* buffer/ && git add buffer/.
#cp commit27/* buffer/ && git add buffer/.
#cp commit28/* buffer/ && git add buffer/.
#cp commit29/* buffer/ && git add buffer/.
#cp commit30/* buffer/ && git add buffer/.
#cp commit31/* buffer/ && git add buffer/.
#cp commit32/* buffer/ && git add buffer/.
#cp commit33/* buffer/ && git add buffer/.
#cp commit34/* buffer/ && git add buffer/.
#cp commit35/* buffer/ && git add buffer/.
#cp commit36/* buffer/ && git add buffer/.
#cp commit37/* buffer/ && git add buffer/.
#cp commit38/* buffer/ && git add buffer/.
#cp commit39/* buffer/ && git add buffer/.
#cp commit40/* buffer/ && git add buffer/.
#cp commit41/* buffer/ && git add buffer/.
#cp commit42/* buffer/ && git add buffer/.
#cp commit43/* buffer/ && git add buffer/.
#cp commit44/* buffer/ && git add buffer/.
#cp commit45/* buffer/ && git add buffer/.
#cp commit46/* buffer/ && git add buffer/.
#cp commit47/* buffer/ && git add buffer/.
#cp commit48/* buffer/ && git add buffer/.
#cp commit49/* buffer/ && git add buffer/.
#cp commit50/* buffer/ && git add buffer/.
#cp commit51/* buffer/ && git add buffer/.
#cp commit52/* buffer/ && git add buffer/.
#cp commit53/* buffer/ && git add buffer/.
#cp commit54/* buffer/ && git add buffer/.
#cp commit55/* buffer/ && git add buffer/.
#cp commit56/* buffer/ && git add buffer/.
#cp commit57/* buffer/ && git add buffer/.
#cp commit58/* buffer/ && git add buffer/.
#cp commit59/* buffer/ && git add buffer/.
#cp commit60/* buffer/ && git add buffer/.
#cp commit61/* buffer/ && git add buffer/.
#cp commit62/* buffer/ && git add buffer/.
#cp commit63/* buffer/ && git add buffer/.
#cp commit64/* buffer/ && git add buffer/.
#cp commit65/* buffer/ && git add buffer/.
#cp commit66/* buffer/ && git add buffer/.
#cp commit67/* buffer/ && git add buffer/.
#cp commit68/* buffer/ && git add buffer/.
#cp commit69/* buffer/ && git add buffer/.
#cp commit70/* buffer/ && git add buffer/.
#cp commit71/* buffer/ && git add buffer/.
#cp commit72/* buffer/ && git add buffer/.
#cp commit73/* buffer/ && git add buffer/.