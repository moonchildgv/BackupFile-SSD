# BackupFile-SSD

For managing my backups i use these two automatic scripts to keep them on an external SSD. One allows me to copy and one allows me to clean the oldest backup.

to use the first script you need to perform some preliminary steps:

1. insert the SSD into your pc;

2. Open the terminal.

3. Type `lsblk` command and press Enter to list all storage devices connected to your computer. Note the identifier of your SSD.

4. Type the command `sudo mkdir /mnt/ssd` and press Enter to create a directory in which to mount your SSD. You can choose a different name for the directory if you like.

5. Type the command `sudo mount /dev/<identifier of your SSD> /mnt/ssd` and press Enter to mount your SSD in the newly created directory. Replace "<your SSD identifier>" with the identifier you noted in step 3. Your SSD is now mounted in the /mnt/ssd directory. You can access the files on your SSD through this directory.
