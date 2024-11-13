#compond intrest
#Amount = principle(1+rate/100) to power time
#compund in = amount - principle



def compound(p,t,r):
    a = p * (pow(1+(r/100),t))
    return (a-p)


p=float(input('ernter the principle'))
t=float(input('enter the time'))
r=float(input('enter the rate'))

print("the compound interest is:  ",compound(p,t,r))
