import os


def rmtool():
    path = input("input your path\n")
    fastOrSec = int(input("1) fast\n2) safe\n"))
    secQuest = input(f"you really want delete {path}?\n").lower()

    if secQuest != "y".lower():
        rmtool()

    if fastOrSec == 1:
        concha = {}
        os.system(f"find {path} -type f -exec shred -uvz -n 10 {concha} \;")
        os.system(f"srm -rvz {path}")
    elif fastOrSec == 2:
        os.system(f"srm -rvz {path}")


rmtool()
