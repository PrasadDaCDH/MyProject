#check if the number is positive negative or zero



def checknum(num):
    if(num==0):
        print('number is zero')
    elif(num>0):
        print('number is positive')
    else:
        print('number is negative')



num=float(input('enter the number'))

checknum(num)
