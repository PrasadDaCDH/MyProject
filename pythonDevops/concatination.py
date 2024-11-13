#print in one line 12345 take the input from user


def conca(num):
    result=''
    for i in range(1,num+1):
        result = result + str(i)
    return (result)

num=int(input('enter the num : '))

print("the final output is : ",conca(num))
