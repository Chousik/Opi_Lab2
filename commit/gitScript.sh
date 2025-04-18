rm -rf buffer
mkdir buffer
git init buffer
cd buffer

git checkout -b main
sh ../toRedUser.sh
cp ../commit0/* . && git add .
git commit -m "c0"

git checkout -b branch1
cp ../commit1/* . && git add .
git commit -m "c1"

sh ../toBlueUser.sh
git checkout -b branch2
cp ../commit2/* . && git add .
git commit -m "c2"

#no changes
sh ../toRedUser.sh
git checkout -b branch3
cp ../commit3/* . && git add .
git commit -m "c3"

#no changes
git checkout -b branch4
cp ../commit4/* . && git add .
git commit -m "c4"

git checkout -b branch5
cp ../commit5/* . && git add .
git commit -m "c5"

sh ../toBlueUser.sh
git checkout -b branch6
cp ../commit6/* . && git add .
git commit -m "c6"

sh ../toRedUser.sh
git checkout -b branch7
cp ../commit7/* . && git add .
git commit -m "c7"

sh ../toBlueUser.sh
git checkout branch6
cp ../commit8/* . && git add .
git commit -m "c8"

cp ../commit9/* . && git add .
git commit -m "c9"

git checkout -b branch10
cp ../commit10/* . && git add .
git commit -m "c10"

sh ../toRedUser.sh
git checkout -b branch11
cp ../commit11/* . && git add .
git commit -m "c11"

sh ../toBlueUser.sh
git checkout -b branch12
cp ../commit12/* . && git add .
git commit -m "c12"

git checkout -b branch13
cp ../commit13/* . && git add .
git commit -m "c13"

sh ../toRedUser.sh
git checkout -b branch14
cp ../commit14/* . && git add .
git commit -m "c14"

sh ../toBlueUser.sh
git checkout branch2
cp ../commit15/* . && git add .
git commit -m "c15"

git checkout -b branch16
cp ../commit16/* . && git add .
git commit -m "c16"
if git merge branch2 --commit;then
    echo "Захар развитый"
else
    echo "Захар отсталый 🤬"
fi

sh ../toRedUser.sh
git checkout branch5
cp ../commit17/* . && git add .
git commit -m "c17"

git checkout branch1
cp ../commit18/* . && git add .
git commit -m "c18"

git checkout -b branch19
cp ../commit19/* . && git add .
git commit -m "c19"

git checkout -b branch20
cp ../commit20/* . && git add .
git commit -m "c20"

git checkout branch14
cp ../commit21/* . && git add .
git commit -m "c21"

sh ../toBlueUser.sh
git checkout -b branch22
cp ../commit22/* . && git add .
git commit -m "c22"

git checkout branch12
cp ../commit23/* . && git add .
git commit -m "c23"

sh ../toRedUser.sh
git checkout main
cp ../commit24/* . && git add .
git commit -m "c24"

git checkout branch20
cp ../commit25/* . && git add .
git commit -m "c25"

git checkout -b branch26
cp ../commit26/* . && git add .
git commit -m "c26"

cp ../commit27/* . && git add .
git commit -m "c27"

sh ../toBlueUser.sh
git checkout branch6
cp ../commit28/* . && git add .
git commit -m "c28"

git checkout -b branch29
if git merge branch6 --commit;then
    echo "Захар развитый"
else
    echo "Захар отсталый 🤬"
fi
cp ../commit29/* . && git add .
git commit -m "c29"

sh ../toRedUser.sh
git checkout branch7
cp ../commit30/* . && git add .
git commit -m "c30"

sh ../toBlueUser.sh
git checkout -b branch31
if git merge branch7 --no-commit;then
    echo "Захар развитый"
else
    echo "Захар отсталый 🤬"
fi
cp ../commit31/* . && git add .
git commit -m "c31"

sh ../toRedUser.sh
git checkout -b branch32
cp ../commit32/* . && git add .
git commit -m "c32"

git checkout branch1
cp ../commit33/* . && git add .
git commit -m "c33"

sh ../toBlueUser.sh
git checkout branch12
cp ../commit34/* . && git add .
git commit -m "c34"

git checkout branch31
cp ../commit35/* . && git add .
git commit -m "c35"

git checkout branch12
cp ../commit36/* . && git add .
git commit -m "c36"

sh ../toRedUser.sh
git checkout branch20
cp ../commit37/* . && git add .
git commit -m "c37"

git checkout branch11
cp ../commit38/* . && git add .
git commit -m "c38"

git checkout main
cp ../commit39/* . && git add .
git commit -m "c39"

git checkout branch12
sh ../toBlueUser.sh
cp ../commit40/* . && git add .
git commit -m "c40"

git checkout branch16
cp ../commit41/* . && git add .
git commit -m "c41"

git checkout branch13
cp ../commit42/* . && git add .
git commit -m "c42"

git checkout branch16
cp ../commit43/* . && git add .
git commit -m "c43"
git checkout -b branch44

sh ../toRedUser.sh
cp ../commit44/* . && git add .
git commit -m "c44"

git checkout -b branch45
cp ../commit45/* . && git add .
git commit -m "c45"

sh ../toBlueUser.sh
git checkout branch31
cp ../commit46/* . && git add .
git commit -m "c46"

git checkout branch16
cp ../commit47/* . && git add .
git commit -m "c47"

git checkout branch29
cp ../commit48/* . && git add .
git commit -m "c48"

git checkout -b branch49
cp ../commit49/* . && git add .
git commit -m "c49"

sh ../toRedUser.sh
git checkout branch26
cp ../commit50/* . && git add .
git commit -m "c50"

sh ../toBlueUser.sh
git checkout branch49
if git merge branch26 --no-commit;then
    echo "Захар развитый"
else
    echo "Захар отсталый 🤬"
fi
cp ../commit51/* . && git add .
git commit -m "c51"

sh ../toRedUser.sh
git checkout branch32
if git merge branch49 --no-commit;then
    echo "Мария развитая"
else
    echo "Мария отсталая 🤬"
fi
cp ../commit52/* . && git add .
git commit -m "c52"

git checkout branch19
cp ../commit53/* . && git add .
git commit -m "c53"

cp ../commit54/* . && git add .
git commit -m "c54"

git checkout branch20
cp ../commit55/* . && git add .
git commit -m "c55"

sh ../toBlueUser.sh
git checkout branch44
cp ../commit56/* . && git add .
git commit -m "c56"

sh ../toRedUser.sh
git checkout -b branch57
cp ../commit57/* . && git add .
git commit -m "c57"

git checkout branch11
cp ../commit58/* . && git add .
git commit -m "c58"

git checkout branch14
if git merge branch11 --no-commit;then
    echo "Мария развитая"
else
    echo "Мария отсталая 🤬"
fi
cp ../commit59/* . && git add .
git commit -m "c59"

git checkout branch3
cp ../commit60/* . && git add .
git commit -m "c60"

git checkout main
cp ../commit61/* . && git add .
git commit -m "c61"

sh ../toBlueUser.sh
git checkout branch44
cp ../commit62/* . && git add .
git commit -m "c62"

sh ../toRedUser.sh
git checkout branch45
cp ../commit63/* . && git add .
git commit -m "c63"

git checkout -b branch64
cp ../commit64/* . && git add .
git commit -m "c64"
if git merge branch45 --commit;then
    echo "Мария развитая"
else
    echo "Мария отсталая 🤬"
fi

sh ../toBlueUser.sh
git checkout -b branch65
cp ../commit65/* . && git add .
git commit -m "c65"
if git merge branch64 --commit;then
    echo "Захар развитый"
else
    echo "Захар отсталый 🤬"
fi

git checkout branch13
cp ../commit66/* . && git add .
git commit -m "c66"

sh ../toRedUser.sh
git checkout branch57
if git merge branch13 --no-commit;then
    echo "Мария развитая"
else
    echo "Мария отсталая 🤬"
fi
cp ../commit69/* . && git add .
git commit -m "c67"

git checkout branch20
if git merge branch57 --no-commit;then
    echo "Мария развитая"
else
    echo "Мария отсталая 🤬"
fi
cp ../commit69/* . && git add .
git commit -m "c68"

git checkout main
if git merge branch20 --no-commit;then
    echo "Мария развитая"
else
    echo "Мария отсталая 🤬"
fi
cp ../commit69/* . && git add .
git commit -m "c69"

sh ../toBlueUser.sh
git checkout branch29
cp ../commit70/* . && git add .
git commit -m "c70"

git checkout branch16
cp ../commit71/* . && git add .
git commit -m "c71"

sh ../toRedUser.sh
git checkout branch4
cp ../commit72/* . && git add .
git commit -m "c72"

git checkout branch3
cp ../commit73/* . && git add .
git commit -m "c73"
if git merge branch4 --no-commit;then
    echo "Мария развитая"
else
    echo "Мария отсталая 🤬"
fi

sh ../toBlueUser.sh
git checkout -b branch74
cp ../commit74/* . && git add .
git commit -m "c74"

sh ../toRedUser.sh
git checkout branch19
cp ../commit75/* . && git add .
git commit -m "c75"

sh ../toBlueUser.sh
git checkout -b branch76
if git merge branch19 --no-commit;then
    echo "Захар развитый"
else
    echo "Захар отсталый 🤬"
fi
cp ../commit76/* . && git add .
git commit -m "c76"

sh ../toRedUser.sh
git checkout branch14
cp ../commit77/* . && git add .
git commit -m "c77"

git checkout main
cp ../commit78/* . && git add .
git commit -m "c78"

git checkout branch22
cp ../commit79/* . && git add .
git commit -m "c79"

git checkout main
if git merge branch22 --no-commit;then
    echo "Мария развитая"
else
    echo "Мария отсталая 🤬"
fi
cp ../commit80/* . && git add .
git commit -m "c80"

sh ../toBlueUser
git checkout branch76
cp ../commit81/* . && git add .
git commit -m "c81"

sh ../toRedUser
git checkout branch1
if git merge branch22 --no-commit;then
    echo "Мария развитая"
else
    echo "Мария отсталая 🤬"
fi
cp ../commit82/* . && git add .
git commit -m "c82"

git checkout branch32
if git merge branch1 --no-commit;then
    echo "Мария развитая"
else
    echo "Мария отсталая 🤬"
fi
cp ../commit83/* . && git add .
git commit -m "c83"

git checkout branch3
cp ../commit84/* . && git add .
git commit -m "c84"

sh ../toBlueUser.sh
git checkout branch31
if git merge branch3 --no-commit;then
    echo "Захар развитый"
else
    echo "Захар отсталый 🤬"
fi
cp ../commit85/* . && git add .
git commit -m "c85"

git checkout branch14
if git merge branch31 --no-commit;then
    echo "Захар развитый"
else
    echo "Захар отсталый 🤬"
fi
sh ./toRedUser.sh
cp ../commit86/* . && git add .
git commit -m "c86"

sh ../toRedUser.sh
git checkout branch65
if git merge branch14 --no-commit;then
    echo "Мария развитая"
else
    echo "Мария отсталая 🤬"
fi
cp ../commit87/* . && git add .
git commit -m "c87"


git checkout branch32
if git merge branch65 --no-commit;then
    echo "Мария развитая"
else
    echo "Мария отсталая 🤬"
fi
cp ../commit88/* . && git add .
git commit -m "c88"


git checkout branch10
sh ../toRedUser.sh
if git merge branch32 --no-commit;then
    echo "Мария развитая"
else
    echo "Мария отсталая 🤬"
fi
sh ../toBlueUser.sh
cp ../commit89/* . && git add .
git commit -m "c89"

sh ../toBlueUser.sh
git checkout branch74
if git merge branch10 --no-commit;then
    echo "Захар развитый"
else
    echo "Захар отсталый 🤬"
fi
cp ../commit90/* . && git add .
git commit -m "c90"

git checkout -b branch91
if git merge branch74 --no-commit;then
    echo "Захар развитый"
else
    echo "Захар отсталый 🤬"
fi
cp ../commit91/* . && git add .
git commit -m "c91"

git checkout branch12
cp ../commit92/* . && git add .
git commit -m "c92"

git checkout branch16
if git merge branch12 --no-commit;then
    echo "Захар развитый"
else
    echo "Захар отсталый 🤬"
fi
cp ../commit93/* . && git add .
git commit -m "c93"

git checkout branch91
if git merge branch16 --no-commit;then
    echo "Захар развитый"
else
    echo "Захар отсталый 🤬"
fi
cp ../commit94/* . && git add .
git commit -m "c94"

git checkout branch29
if git merge branch91 --no-commit;then
    echo "Захар развитый"
else
    echo "Захар отсталый 🤬"
fi
cp ../commit95/* . && git add .
git commit -m "c95"

sh ../toRedUser.sh
git checkout branch5
if git merge branch29 --no-commit;then
    echo "Мария развитая"
else
    echo "Мария отсталая 🤬"
fi
cp ../commit96/* . && git add .
git commit -m "c96"

sh ../toBlueUser.sh
git checkout branch44
if git merge branch5 --no-commit;then
    echo "Захар развитый"
else
    echo "Захар отсталый 🤬"
fi
cp ../commit97/* . && git add .
git commit -m "c97"
