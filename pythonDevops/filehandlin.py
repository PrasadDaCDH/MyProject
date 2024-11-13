#how to handel file and folders in python

import os
import shutil


#to read a file you need to open it

#file =  open('abc.txt','w') #to open in writing mode
#file.write('\n welcome') #this will overide the existing file if open in write mode and appending on append mode 
#file.close()
#file = open('abc.txt','r') #to open in reading mode
#content = file.read() #to get the content of the file into the variable
#content = file.readline() #it will only get the first line
#content = file.readlines() # it will get the all the line and we can add inside the list
#print(content)
#file.close()
#file = open('abc.txt','a') #for appending mode
#file.write('\n welcome to goa')
#file.close()

#to for the folders and copypasting and and folders level we have
#import os
#import shutil
#import os.path

#os.mkdir('foldername') #this will create a folder on the path
#a = os.listdir('.') #it will get the all the list of files present in the directory
#print(a)

#to check weather the file exists or not

#x=os.path.exists('foldername')
#print(x) #this will print true or false according to the availablity of the file 
#os.remove('abc.txt') #to remove the file from the directory
#print(os.listdir('.'))

#shutil.rmtree('foldername') # this will delete the directorie recorsively
#a = os.listdir('.')
#print(a)

