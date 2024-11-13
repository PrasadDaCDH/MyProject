#to get the factorial number



def fact(num):
    f=1
    while(num!=0):
        f=f * num
        num=num-1
    return (f)

num=int(input("enter the number:  "))

print("the factorial number is:  ",fact(num))
