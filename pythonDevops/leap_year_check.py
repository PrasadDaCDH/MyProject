#find out the leap year it can be divisble by 4 , 400 and if its divisible by 100 then its not leap year


def leapcheck(year):
    if ( year % 400 == 0 ) | ( year % 100 != 0 ) & (year % 4 == 0):
        return True
    else:
        return False




year = int(input("enter the year you want to check: "))

print("the given year is leap year: ",leapcheck(year))
