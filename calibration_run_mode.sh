#!/bin/bash
cd /home/liuming/mnt/hydronas3/Projects/FireEarth/for_min

#evergreen (first major site)
veg=1
cover_fraction=0.6
patchID=76620
#patch level mean
npp_gpp_ratio=0.55
height=16.8
npp=0.81
LAI=6.8
AGBc=15.81

declare -a min_c
declare -a max_c
min_c[0]=0.1
max_c[0]=0.25
min_c[1]=5
max_c[1]=50
min_c[2]=0.005
max_c[2]=0.10
min_c[3]=0.1
max_c[3]=0.6
bash Calibrate_job_mode.sh ${veg} ${cover_fraction} ${patchID} ${npp_gpp_ratio} ${height} ${npp} ${LAI} ${AGBc} ${min_c[0]} ${max_c[0]} ${min_c[1]} ${max_c[1]} ${min_c[2]} ${max_c[2]} ${min_c[3]} ${max_c[3]}

#evergreen (2nd site Highelevation)
patchID=29586
#patch level mean
npp_gpp_ratio=0.57
height=19.62
npp=0.776
LAI=6.4
AGBc=14.43
bash Calibrate_job_mode.sh ${veg} ${cover_fraction} ${patchID} ${npp_gpp_ratio} ${height} ${npp} ${LAI} ${AGBc} ${min_c[0]} ${max_c[0]} ${min_c[1]} ${max_c[1]} ${min_c[2]} ${max_c[2]} ${min_c[3]} ${max_c[3]}

#evergreen (3rd site Highelevation)
patchID=81839
#patch level mean
npp_gpp_ratio=0.58
height=16.93
npp=0.781
LAI=6.2
AGBc=11.57
bash Calibrate_job_mode.sh ${veg} ${cover_fraction} ${patchID} ${npp_gpp_ratio} ${height} ${npp} ${LAI} ${AGBc} ${min_c[0]} ${max_c[0]} ${min_c[1]} ${max_c[1]} ${min_c[2]} ${max_c[2]} ${min_c[3]} ${max_c[3]}

#evergreen (4th site Highelevation)
patchID=88264
#patch level mean
npp_gpp_ratio=0.52
height=36.53
npp=0.793
LAI=7.0
AGBc=32.38
bash Calibrate_job_mode.sh ${veg} ${cover_fraction} ${patchID} ${npp_gpp_ratio} ${height} ${npp} ${LAI} ${AGBc} ${min_c[0]} ${max_c[0]} ${min_c[1]} ${max_c[1]} ${min_c[2]} ${max_c[2]} ${min_c[3]} ${max_c[3]}


#shrub
veg=5
cover_fraction=0.6
patchID=49250
#patch level mean
npp_gpp_ratio=0.61
height=4.27
npp=0.807
LAI=6.6
AGBc=6.58

#declare -a min_c
#declare -a max_c
min_c[0]=0.1
max_c[0]=0.25
min_c[1]=5
max_c[1]=50
min_c[2]=0.005
max_c[2]=0.10
min_c[3]=0.1
max_c[3]=5
bash Calibrate_job_mode.sh ${veg} ${cover_fraction} ${patchID} ${npp_gpp_ratio} ${height} ${npp} ${LAI} ${AGBc} ${min_c[0]} ${max_c[0]} ${min_c[1]} ${max_c[1]} ${min_c[2]} ${max_c[2]} ${min_c[3]} ${max_c[3]}

#deciduous
veg=2
cover_fraction=0.6
patchID=79648
#patch level mean
npp_gpp_ratio=0.59
height=19.12
npp=0.742
LAI=6.4
AGBc=16.48

#declare -a min_c
#declare -a max_c
min_c[0]=0.1
max_c[0]=0.25
min_c[1]=5
max_c[1]=50
min_c[2]=0.005
max_c[2]=0.10
min_c[3]=0.1
max_c[3]=0.6
bash Calibrate_job_mode.sh ${veg} ${cover_fraction} ${patchID} ${npp_gpp_ratio} ${height} ${npp} ${LAI} ${AGBc} ${min_c[0]} ${max_c[0]} ${min_c[1]} ${max_c[1]} ${min_c[2]} ${max_c[2]} ${min_c[3]} ${max_c[3]}

