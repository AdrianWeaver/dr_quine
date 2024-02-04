s='s=%r%sl=%r%sfile=%r%smode=%r%swith open(file,mode) as f:%s    print(s%%(s,l,l,l,file,l,mode,l,l,l,l),file=f);%s    f.close();%s    #mandatory comment'
l='\n'
file='Grace.py'
mode='w'
with open(file,mode) as f:
    print(s%(s,l,l,l,file,l,mode,l,l,l,l),file=f);
    f.close();
    #mandatory comment
