#reverse an integer without the use of rev function



def reve(num):
    result=0
    while(num!=0):
        result = (result*10) + (num%10)
        num= num // 10
    return result

num=int(input("enter the num"))
print("the reverse number is:",reve(num))
