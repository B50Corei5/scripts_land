#!/bin/bash
# Copyright (C) 2015 Paranoid Android Project
# Copyright (C) 2018 B50Corei5<B50Corei5@gmail.com>
# Copyright (C) 2018 B50Corei5
# PA Colors

# red = errors, cyan = warnings, green = confirmations, blue = informational

# plain for generic text, bold for titles, reset flag at each end of line

# plain blue should not be used for readability reasons - use plain cyan instead

CLR_RST=$(tput sgr0)                        ## reset flag
CLR_RED=$CLR_RST$(tput setaf 1)             #  red, plain
CLR_GRN=$CLR_RST$(tput setaf 2)             #  green, plain
CLR_YLW=$CLR_RST$(tput setaf 3)             #  yellow, plain
CLR_BLU=$CLR_RST$(tput setaf 4)             #  blue, plain
CLR_PPL=$CLR_RST$(tput setaf 5)             #  purple,plain
CLR_CYA=$CLR_RST$(tput setaf 6)             #  cyan, plain
CLR_BLD=$(tput bold)                        ## bold flag
CLR_BLD_RED=$CLR_RST$CLR_BLD$(tput setaf 1) #  red, bold
CLR_BLD_GRN=$CLR_RST$CLR_BLD$(tput setaf 2) #  green, bold
CLR_BLD_YLW=$CLR_RST$CLR_BLD$(tput setaf 3) #  yellow, bold
CLR_BLD_BLU=$CLR_RST$CLR_BLD$(tput setaf 4) #  blue, bold
CLR_BLD_PPL=$CLR_RST$CLR_BLD$(tput setaf 5) #  purple, bold
CLR_BLD_CYA=$CLR_RST$CLR_BLD$(tput setaf 6) #  cyan, bold
echo -e "${CLR_BLD_GRN}Screen something?${CLR_RST}"
screen
echo -e "${CLR_BLD_GRN}Setting up ccache${CLR_RST}"
ccache -M 100G
export USE_CCACHE=1
echo -e ""
echo -e "${CLR_BLD_GRN}Syncing bootleg rom sources${CLR_RST}"
repo init -u https://github.com/BootleggersROM/manifest.git -b oreo.1
repo sync -f --force-sync --no-clone-bundle -j8
echo -e ""
echo -e "${CLR_BLD_GRN}Cloning device repos...${CLR_RST}"
git clone https://github.com/B50Corei5/UnofficialRoms -b bootleg-o device/lenovo/kuntao
git clone https://github.com/B50Corei5/proprietary_vendor_lenovo_kuntao -b dot-o vendor/lenovo/kuntao
git clone https://github.com/arghyac35/android_kernel_lenovo_msm8953 -b 8.1.x kernel/lenovo/msm8953
echo -e "${CLR_BLD_GRN}Cloning Complete...${CLR_RST}"
echo -e ""
echo -e "${CLR_BLD_GRN}Deleting Doze to avoid build errors${CLR_RST}"
rm -rf device/lenovo/kuntao/doze
echo -e ""
echo -e "${CLR_BLD_GRN}Making official${CLR_RST}"
export DEVICE_MAINTAINERS=ThatCubeGuy:B50Corei5
export BOOTLEG_BUILD_TYPE=Shishufied


