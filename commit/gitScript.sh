git init

sh toRedUser.sh
git add commit0/.
git commit -m "c0"

git checkout -b branch1
git add commit1/.
git commit -m "c1"

sh toBlueUser.sh
git checkout -b branch2
git add commit2/.
git commit -m "c2"

sh toRedUser.sh
git checkout -b branch3
git add commit3/.
git commit -m "c3"

git checkout -b branch4
git add commit4/.
git commit -m "c4"

git checkout -b branch5
git add commit5/.
git commit -m "c5"

sh toBlueUser.sh
git checkout -b branch6
git add commit6/.
git commit -m "c6"

sh toRedUser.sh
git checkout -b branch7
git add commit7/.
git commit -m "c7"

sh toBlueUser.sh
git checkout branch6
git add commit8/.
git commit -m "c8"

git add commit9/.
git commit -m "c9"

git checkout -b branch10
git add commit10/.
git commit -m "c10"

sh toRedUser.sh
git checkout -b branch11
git add commit11/.
git commit -m "c11"

sh toBlueUser.sh
git checkout -b branch12
git add commit12/.
git commit -m "c12"

git checkout -b branch13
git add commit13/.
git commit -m "c13"

sh toRedUser.sh
git checkout -b branch14
git add commit14/.
git commit -m "c14"

sh toBlueUser.sh
git checkout branch2
git add commit15/.
git commit -m "c15"

git checkout branch16
git add commit16/.
git commit -m "c16"
git checkout branch2
git merge branch16

#git add commit17/.
#git add commit18/.
#git add commit19/.

# git add commit20/.
# git add commit21/.
# git add commit22/.
# git add commit23/.
# git add commit24/.
# git add commit25/.
# git add commit26/.
# git add commit27/.
# git add commit28/.
# git add commit29/.
# git add commit30/.
# git add commit31/.
# git add commit32/.
# git add commit33/.
# git add commit34/.
# git add commit35/.
# git add commit36/.
# git add commit37/.
# git add commit38/.
# git add commit39/.
# git add commit40/.
# git add commit41/.
# git add commit42/.
#git add commit43/.
#git
# git add commit44/.
# git add commit45/.
# git add commit46/.
# git add commit47/.
# git add commit48/.
# git add commit49/.
# git add commit50/.
# git add commit51/.
# git add commit52/.
# git add commit53/.
# git add commit54/.
# git add commit55/.
# git add commit56/.
# git add commit57/.
# git add commit58/.
# git add commit59/.
# git add commit60/.
# git add commit61/.
# git add commit62/.
# git add commit63/.
# git add commit64/.
# git add commit65/.
# git add commit66/.
# git add commit67/.
# git add commit68/.
# git add commit69/.
# git add commit70/.
# git add commit71/.
# git add commit72/.
# git add commit73/.
# git add commit74/.
# git add commit75/.
# git add commit76/.
# git add commit77/.
# git add commit78/.
# git add commit79/.
# git add commit80/.
# git add commit81/.
# git add commit82/.
# git add commit83/.
# git add commit84/.
# git add commit85/.
# git add commit86/.
# git add commit87/.
# git add commit88/.
# git add commit89/.
# git add commit90/.
# git add commit91/.
# git add commit92/.
# git add commit93/.
# git add commit94/.
# git add commit95/.
# git add commit96/.
# git add commit97/.
# git add commit98/.
# git add commit99/.