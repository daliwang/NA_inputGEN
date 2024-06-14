#!/bin/bash

# set up global variables

export kiloCraft=/gpfs/wolf2/cades/cli185/proj-shared/wangd/kiloCraft/
export NA_inputGEN_path=${kiloCraft}/NA_inputGEN/

AOI_case_date=$(date +'%y%m%d')

NTimes=10
BASEID=AKSP
EXPID=${BASEID}x${NTimes}
AOI_case_name=${EXPID}

refcase_root=${kiloCraft}/NA_cases_data/${BASEID}/
case_root=${kiloCraft}/NA_cases_data/${AOI_case_name}/

script_path=${refcase_root}/scripts/

input_domain_path=${refcase_root}/domain_surfdata/
input_domain=${BASEID}_domain.lnd.Daymet_NA.1km.1d.c240524.nc

input_surfdata_path=${refcase_root}/domain_surfdata/
input_surfdata=${BASEID}_surfdata.Daymet_NA.1km.1d.c240524.nc

input_forcing_path=${refcase_root}/forcing/

output_domain_path=${case_root}/domain_surfdata/
output_surfdata_path=${output_domain_path}
output_foring_path=${case_root}/forcing/

mkdir ${case_root}
mkdir ${output_domain_path}
mkdir ${output_forcing_path}
mkdir ${case_root}/scripts

output_domain=${EXPID}_domain.lnd.Daymet_NA.1km.1d.c${data_string}.nc
output_surfdata=${EXPID}_surfdata.Daymet_NA.1km.1d.c${data_string}.nc

cd ${case_root}/scripts
cp ${refcase_root}/scripts/* .

# duplicate the domain and surfdata files

python3 dup_basecase_data.py ${NTimes} ${input_domain_path} ${input_domain} ${output_domain_path} ${output_domain}
python3 dup_basecase_data.py ${NTimes} ${input_surfdata_path} ${input_surfdata} ${output_surfdata_path} ${output_surfdata}



