#!/bin/bash

# Centralize all the logic about what versions to depend on in this one file

if [ $# != 1 ]
then
    echo Usage: dependencies QUALIFIER >&2
    exit 1
fi

QUAL=$1

if [[ $QUAL == *:n308* ]]; then NQUAL=n308; QUAL=${QUAL/:n308/}; fi
if [[ $QUAL == *:n311* ]]; then NQUAL=n311; QUAL=${QUAL/:n311/}; fi

if [[ $NQUAL == n308 ]]
then
    # These are the current (Apr 2021) nova versions (nutools v3_08_00)
    echo root v6_18_04d -q$QUAL
    echo boost v1_70_0 -q$QUAL
    echo ifdhc v2_5_7 -q${QUAL}:p372
else
    # These are the current (October 2021) sbn versions (nutools v3_11_05)
    echo root v6_22_08d -q${QUAL}:p392
    echo boost v1_75_0 -q$QUAL

    echo ifdhc v2_5_16 -q${QUAL}:p392
fi

echo stan_math v4_0_1 -q$QUAL
echo eigen v3_3_9a
