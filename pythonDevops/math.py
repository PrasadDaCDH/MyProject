#Math operation file

def add(num1,num2):
    return num1+num2

def sub(num1,num2):
    if(num1 > num2):
        return num1 - num2
    else:
        return num2 - num1

def div(num1,num2):
    if(num2 !=0):
        return num1 / num2
    else:
        print(f"{num2} is 0 can't be divided")

def multi(num1,num2):
    return num1 * num2


print(f"addition is {add(7,10)}")
print(f"division is  {div(10,5)}")
print(f"subtraction is  {sub(10,5)}")
print(f"multiplication is {multi(10,5)}")
