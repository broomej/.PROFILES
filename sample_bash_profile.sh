# Profiles
source .global_profile.sh
prof_diff .global_profile.sh .PROFILES
source .gcc_profile.sh
prof_diff .mac_profile.sh .PROFILES

PROFILE_ORDER=$PROFILE_ORDER:'.bash_profile'
export PROFILE_ORDER
