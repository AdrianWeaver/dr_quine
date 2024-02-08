import os
s='import os%ss=%r%sl=%r%srecurs=%d%sext=%r%smode=%r%sbase=%r%scmd=%r%smyfile=base+str(recurs)+ext%swith open(myfile,%r) as f:%s    print(s%%(l,s,l,l,l,recurs-1,l,ext,l,mode,l,base,l,cmd,l,l,mode,l,l,l,l),file=f);%s    f.close;%sif recurs > 1:%s    os.system(cmd+myfile);'
l='\n'
recurs=5
ext='.py'
mode='w'
base='Sully'
cmd='python3 '
myfile=base+str(recurs)+ext
with open(myfile,'w') as f:
    print(s%(l,s,l,l,l,recurs-1,l,ext,l,mode,l,base,l,cmd,l,l,mode,l,l,l,l),file=f);
    f.close;
if recurs > 1:
    os.system(cmd+myfile);
