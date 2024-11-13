#sum of natural numbers n (n+1)/2


def natural(num):
    result = num * ( num + 1 )
    return ( result / 2 )


num=float(input("enter the number"))

if( num > 0 ):
          print("the sum of natural numbers is ", natural(num))

else:
    print("please enter the valid number")
