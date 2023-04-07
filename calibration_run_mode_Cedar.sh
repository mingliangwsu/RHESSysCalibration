#!/bin/bash
export RHESSys="/home/liuming/RHESSys_Ning/RHESSys/build/Qt/gcc/Release/RHESSys"
export py_likelyhood="/home/liuming/dev/toolkit/ForRHESSys/growth_yearly_model_performance_nppratio_height_npp_LAI_AGBc.py"

export droot="/home/liuming/mnt/hydronas2/Projects/FireEarth/Cedar"
export patch_stata_veg="${droot}/patch_stratum_vegid.txt"
export outputdir_root="/home/liuming/mnt/hydronas2/Projects/FireEarth/Cedar/Output_Calibrations"


#parameters for running RHESSys
export s1=21.5314584
export s2=6.118129043
export po=0.622
export pa=3.839856343
export gw1=0.748661855
export gw2=0.159472083



export tecfile=calibration.tec
export headfile=defFiles.hdr
export patchgrid="${droot}/patchGrid.txt"
export demgrid="${droot}/DemGrid.txt"

export startyear=1980
export stateyear=2015
export endyear=2015
export spyrs=20
export soil_spins=50
export veg_spins=20 #25
export clm_spins=1
export loops=400 
#iterations for calibration parameters
export valid_start_year=2000
export valid_end_year=2015

#for generating patch world file and flowtable for calibration
py_generate_patch_worldfile="/home/liuming/dev/toolkit/ForRHESSys/get_subset_from_state_world_file.py"
py_generate_patch_flowtable="/home/liuming/dev/toolkit/ForRHESSys/get_subset_flowtable_one_patchonly.py"
worldfile_basin=liu_Cedar.world
flowtable_basin=liu_Cedar.flow


cd ${droot}
#evergreen (first major site)
veg=1
cover_fraction=1.0
hillslopID=280
zoneID=81338
patchID=81338
#patch level mean
npp_gpp_ratio=0.59
height=34
npp=0.794
LAI=6.1
AGBc=8.28

python ${py_generate_patch_worldfile} ${worldfile_basin} patch_${patchID}.state 1 1 ${hillslopID} ${zoneID} ${patchID}
#"<1world_state_filename> <2out_subset> <3world_id> <4basin_ID> <5hillslope_ID> <6zone_ID> <7patch_ID> <8canopy_strata_ID>\n")
python ${py_generate_patch_flowtable} ${flowtable_basin} patch_${patchID}.flow ${hillslopID} ${zoneID} ${patchID}
#<1flow_filename> <2out_subset> <3hillslope_ID> <4zone_ID> <5patch_ID> 

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
min_c[4]=0.4
max_c[4]=0.6
min_c[5]=1.0
max_c[5]=10.0
bash calibrate_job_mode.sh ${veg} ${cover_fraction} ${patchID} ${npp_gpp_ratio} ${height} ${npp} ${LAI} ${AGBc} ${min_c[0]} ${max_c[0]} ${min_c[1]} ${max_c[1]} ${min_c[2]} ${max_c[2]} ${min_c[3]} ${max_c[3]} ${min_c[4]} ${max_c[4]} ${min_c[5]} ${max_c[5]}

#evergreen (2nd site Highelevation)
hillslopID=392
zoneID=141439
patchID=141439
#patch level mean
npp_gpp_ratio=0.6
height=24
npp=0.649
LAI=6.2
AGBc=8.02

python ${py_generate_patch_worldfile} patch_${patchID}.state 1 1 ${hillslopID} ${zoneID} ${patchID}
python ${py_generate_patch_flowtable} patch_${patchID}.flow ${hillslopID} ${zoneID} ${patchID}

bash calibrate_job_mode.sh ${veg} ${cover_fraction} ${patchID} ${npp_gpp_ratio} ${height} ${npp} ${LAI} ${AGBc} ${min_c[0]} ${max_c[0]} ${min_c[1]} ${max_c[1]} ${min_c[2]} ${max_c[2]} ${min_c[3]} ${max_c[3]} ${min_c[4]} ${max_c[4]} ${min_c[5]} ${max_c[5]}


#shrub
veg=5
cover_fraction=1.0
hillslopID=360
zoneID=98176
patchID=98176
#patch level mean
npp_gpp_ratio=0.59
height=20
npp=0.679
LAI=6.3
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
min_c[4]=0.4
max_c[4]=0.6
min_c[5]=1.0
max_c[5]=10.0
python ${py_generate_patch_worldfile} patch_${patchID}.state 1 1 ${hillslopID} ${zoneID} ${patchID}
python ${py_generate_patch_flowtable} patch_${patchID}.flow ${hillslopID} ${zoneID} ${patchID}

bash calibrate_job_mode.sh ${veg} ${cover_fraction} ${patchID} ${npp_gpp_ratio} ${height} ${npp} ${LAI} ${AGBc} ${min_c[0]} ${max_c[0]} ${min_c[1]} ${max_c[1]} ${min_c[2]} ${max_c[2]} ${min_c[3]} ${max_c[3]} ${min_c[4]} ${max_c[4]} ${min_c[5]} ${max_c[5]}

#deciduous
veg=2
cover_fraction=1.0
hillslopID=276
zoneID=55894
patchID=55894
#patch level mean
npp_gpp_ratio=0.6
height=33
npp=0.798
LAI=6.5
AGBc=7.55

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
min_c[4]=0.4
max_c[4]=0.6
min_c[5]=1.0
max_c[5]=10.0
python ${py_generate_patch_worldfile} patch_${patchID}.state 1 1 ${hillslopID} ${zoneID} ${patchID}
python ${py_generate_patch_flowtable} patch_${patchID}.flow ${hillslopID} ${zoneID} ${patchID}

bash calibrate_job_mode.sh ${veg} ${cover_fraction} ${patchID} ${npp_gpp_ratio} ${height} ${npp} ${LAI} ${AGBc} ${min_c[0]} ${max_c[0]} ${min_c[1]} ${max_c[1]} ${min_c[2]} ${max_c[2]} ${min_c[3]} ${max_c[3]} ${min_c[4]} ${max_c[4]} ${min_c[5]} ${max_c[5]}

