#!/bin/sh

#one-key-disassemble.sh
#
#
#Created by Xc233 on 2018/5/3.
#
#
#get the path of Decompile file.
read -p "要反编译的文件夹路径是? (请拖动文件夹到这里):  " path
cd "$path"
x=`ls -l |grep "^-"|wc -l`
if [[ $x -eq 0 ]];
        then
#no .aml to do
            echo **************这是一个空文件夹,没有aml文件!请重新确认!**************
            exit 1
        else
#do work...
#creat refs.txt
cd "$path"
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
#remove something
rm refs.txt
rm *.aml
rm DumpLog.txt

#done and show information
clear
echo ********************************编译完成*************************************
exit 0
fi
