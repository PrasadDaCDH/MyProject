#check prime for 2 intervals


def checkprime(first,secound):
    for i in range(first,secound+1):
        for j in range(2,i):
            if(i%j==0):
                break
        else:
            print("the no is prime:  ",i)




first=int(input("enter the firstno:  "))
secound=int(input("enter the secoundno:  "))

if (first < secound):
    checkprime(first,secound)
else:
    print("please enter the valid nos:")
