#to check wheater the no is prime or not



def checkprime(num):
    for i in range(2,num):
        if (num%i==0):
            print("no is not prime")
            break
    else:
        print("no is prime: ",num)



num1=int(input('enter the number:  '))

if (num1<0):
    print("enter the valid no")
else:
    checkprime(num1)
