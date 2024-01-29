s='s=%r%sl=%r%sdef main():%s    #this is my comment in main%s    myUselessFunction();%s    print(s %% (s, l, l, l, l, l, l, l, l, l, l, l, l));%s%sdef myUselessFunction():%s    return;%s    #this is a python comment%s%smain();'
l='\n'
def main():
    #this is my comment in main
    myUselessFunction();
    print(s % (s, l, l, l, l, l, l, l, l, l, l, l, l));

def myUselessFunction():
    return;
    #this is a python comment

main();
