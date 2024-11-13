#fibonacci numbers itterative where each num is sum of two preceding num










num=int(input('enter till how many number you want for the fibo'))

num1=0
num2=1
print(num2)
result=0
for i in range(0,num):
    result=num1 + num2
    num1=num2
    num2=result
    print(result)

