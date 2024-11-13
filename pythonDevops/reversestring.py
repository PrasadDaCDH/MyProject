#reverse the string also take the input from user which he wants to reverse




def strrev(string):
    reverse = ""
    for i in string:
        reverse = i + reverse
    return reverse






string=input('please enter the string that you want to reverse:  ')

print('the string is:  ',string)
print('ther reverse of string is ',strrev(string))
             
