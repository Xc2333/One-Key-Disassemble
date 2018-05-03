#!/bin/sh

#ASL.sh
#
#
#Created by Xc233 on 2018/5/3.
#
#
#
#
#get the path of Decompile file.
read -p "要反编译的文件夹路径是? (请拖动文件夹到这里,文件夹名称请勿带空格!):  " path

#creat refs.txt
echo $path

cd $path
cat <<END >refs.txt
External(MDBG,MethodObj,1)
External(_GPE.MMTB,MethodObj,0)
External(_SB.PCI0.LPCB.H_EC.ECWT,MethodObj,2)
External(_SB.PCI0.LPCB.H_EC.ECRD,MethodObj,1)
External(_SB.PCI0.LPCB.H_EC.ECMD,MethodObj,1)
External(_SB.PCI0.PEG0.PEGP.SGPO,MethodObj,2)
External(_SB.PCI0.GFX0.DD02._BCM,MethodObj,1)
External(_SB.PCI0.SAT0.SDSM,MethodObj,4)
External(_GPE.VHOV,MethodObj,3)
External(_SB.PCI0.XHC.RHUB.TPLD,MethodObj,2)
END

#use iasl to Compile. Aussme you hava install iasl. If not,install it
#to /usr/bin

iasl -da -dl -fe refs.txt DSDT.aml SSDT*.aml

rm refs.txt
rm *.aml

#done and show information
clear
echo ********************************编译完成*************************************
exit 0
