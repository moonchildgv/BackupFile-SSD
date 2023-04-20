# BackupFile-SSD

**For managing my backups i use these two automatic scripts to keep them on an external SSD. The first allows you, once the external SSD is connected, not to have to mount and umont every time you need to make a backup but it does it automatically, it creates a folder inside the SSD named with the date of the current day and copy everything you want into it. The second allows you to clean the oldest backup.**

- to use the first script you need to perform some preliminary steps:
1. insert the SSD into your pc;

2. Open the terminal.

3. Type `lsblk` command and press Enter to list all storage devices connected to your computer. Note the identifier of your SSD.

4. Type the command `sudo mkdir /mnt/ssd` and press Enter to create a directory in which to mount your SSD. You can choose a different name for the directory if you like.

5. Type the command `sudo mount /dev/<identifier of your SSD> /mnt/ssd` and press Enter to mount your SSD in the newly created directory. Replace `<your SSD identifier>` with the identifier you noted in step 3. Your SSD is now mounted in the /mnt/ssd directory. You can access the files on your SSD through this directory.

6. Now you will have to create a txt file, in the same folder where you save the script, where you can write all the folders you don't want copied to the SSD.
   
   **Now you can connect the ssd and run the following script without needing to mount and umount**

```bash
#!/bin/bash

sudo mount /dev/<identifier of your SSD> /mnt/ssd/

sudo mkdir /mnt/ssd/$(date +%d-%m-%Y)-Arch

sudo rsync -avh --exclude-from='listDir.txt' /home/mp /mnt/ssd/$(date +%d-%m-%Y)-Arch

sudo umount -l /mnt/ssd
```

- to use the second script you need to enter it with a text editor of your choice and enter the path of your SSD:

```bash
#!/bin/bash

dir="path/folder"   # replace "/path/folder" with the actual path to the directory

cd "$dir" || exit         # enter the directory or terminate the script if it does not exist
if [ $(ls -1dq */ | wc -l) -gt 1 ]; then  # check if there are at least two folders
    oldest=$(ls -1dtr */ | head -n 1)      # select the oldest folder
    rm -rf "$oldest"                     # delete the oldest folder
    echo "folder $oldest has been deleted." # print a confirmation message
else
    echo "there are not enough folders to delete." # if there are less than two folders, print an error message
fi
```

***Note: This script deletes the oldest folder based on its creation date (using ls -1dtr), not based on modification date. If you prefer to use the modification date, replace ls -1dtr with ls -1dt.***
