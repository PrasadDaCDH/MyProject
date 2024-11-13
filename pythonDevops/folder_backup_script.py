#taking backup
#create a script which takes backup of the folder at the given time

import shutil
import os


def backup(source_folder,backup_folder):
    try:
        #checking if the source folder exists or not
        if not os.path.exists(source_folder):
            print(f'enter the path that exists {source_folder} this not found')
            return
        #Creating backup if it does not exists
        if not os.path.exists(backup_folder):
            print(f'created {backup_folder}')
            os.mkdirs(backup_folder)
        
        #Creting the backup now with the source code
        
        shutil.copytree(source_folder,os.path.join(backup_folder, os.path.basename(source_folder)))
        
        print('backup completed successfully')
        
    except Exception as e:
        print('ERROR is {e}')
        


source_folder = '/path'
backup_folder = '/path'

backup(source_folder,backup_folder)