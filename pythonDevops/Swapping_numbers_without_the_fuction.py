#Write a program for swapping of two numbers without thrid variable

def swaping(num1,num2):
	if(num1>num2):
		num2=num2+num1
		num1=num2-num1
		num2=num2-num1
		return(num1,num2)
	else:
		num1=num1+num2
		num2=num1-num2
		num1=num1-num2
		return(num1,num2)

num1=int(input('enter the value of num1'))
num2=int(input('enter the value of num2'))

print('Printing the number is order',num1,num2)
print('Printing the number in swaping',swaping(num1,num2))
