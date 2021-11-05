#' # Setup a Directory
#' 1. We call our directory the yard. Make a new directory with the following command:
  mkdir yard
  /home/jianie
#' 2. To keep track of where the yard is located, use the pwd command (print working directory):
   pwd
   /home/jianie/yard
#' 3. Go into that directory using the command, cd (change directory), and make a folder using mkdir apps to install Cell Ranger.
   cd /home/jianie/yard
   mkdir apps
   cd apps
   
#' # Download and Extract Cell Ranger
#' 1. Go to the Cell Ranger Download page, fill out the "10x Genomics End User Software License Agreement" information 
#' and copy the download command from the subsequent page. Paste the entire command onto your command line. 
#' Parts of the download command change periodically, so copying the same command seen here will not work. 
#' Be sure to copy the whole command from the Downloads page.
sudo snap install curl  # version 7.78.0

   curl -o cellranger-6.1.1.tar.gz "https://cf.10xgenomics.com/releases/cell-exp/cellranger-6.1.1.tar.gz?Expires=1631321153&Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cHM6Ly9jZi4xMHhnZW5vbWljcy5jb20vcmVsZWFzZXMvY2VsbC1leHAvY2VsbHJhbmdlci02LjEuMS50YXIuZ3oiLCJDb25kaXRpb24iOnsiRGF0ZUxlc3NUaGFuIjp7IkFXUzpFcG9jaFRpbWUiOjE2MzEzMjExNTN9fX1dfQ__&Signature=Q3xJqwIEaD6L5mm5Zqx8ZdJ6TRvxDj0QxOrhSFc990sLA6zECFi4HPpkU3BCIQcqt-o4u0U~vRIT0or6RwQ6KDgR9pHsWaFrd6T3PKJL~eJxlbui0Qy6x8jfoNjbn1cHrQfwoy2g5eR1UgMwRxj-CwscWk93Y6yL~Ra5EqIJLdvGvtrN0j5lWeTc-NPmy8PldUYHy9MpFrGa-YOZTBrRqu6vx89fSoyFZ2~Gc78FgCXOhA15zI6unGg8Gu8a-j6r0wl2Znoq61RPjavPZpX7uIvfY~XevTK~0QLRl5fzvifZrGkH1zvaBWiy8~QPp6H4BBincIOKXdlPSkS99mCYNA__&Key-Pair-Id=APKAI7S6A5RYOXBWRPDA"
#' 2. Some systems do not have the command, curl (client url) installed. An alternative command is wget.
#'    Note: You do not need to do this if the curl command above worked for you.
wget -O cellranger-6.1.1.tar.gz "https://cf.10xgenomics.com/releases/cell-exp/cellranger-6.1.1.tar.gz?Expires=1631321153&Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cHM6Ly9jZi4xMHhnZW5vbWljcy5jb20vcmVsZWFzZXMvY2VsbC1leHAvY2VsbHJhbmdlci02LjEuMS50YXIuZ3oiLCJDb25kaXRpb24iOnsiRGF0ZUxlc3NUaGFuIjp7IkFXUzpFcG9jaFRpbWUiOjE2MzEzMjExNTN9fX1dfQ__&Signature=Q3xJqwIEaD6L5mm5Zqx8ZdJ6TRvxDj0QxOrhSFc990sLA6zECFi4HPpkU3BCIQcqt-o4u0U~vRIT0or6RwQ6KDgR9pHsWaFrd6T3PKJL~eJxlbui0Qy6x8jfoNjbn1cHrQfwoy2g5eR1UgMwRxj-CwscWk93Y6yL~Ra5EqIJLdvGvtrN0j5lWeTc-NPmy8PldUYHy9MpFrGa-YOZTBrRqu6vx89fSoyFZ2~Gc78FgCXOhA15zI6unGg8Gu8a-j6r0wl2Znoq61RPjavPZpX7uIvfY~XevTK~0QLRl5fzvifZrGkH1zvaBWiy8~QPp6H4BBincIOKXdlPSkS99mCYNA__&Key-Pair-Id=APKAI7S6A5RYOXBWRPDA"

#' 3. List the contents of the apps directory to see the Cell Ranger "tarball" (archive of files).
ls -1

#' 4. Unpack the tarball using the tar command:
tar -zxvf cellranger-6.1.1.tar.gz

#' 5. List the contents of the Cell Ranger directory
ls -1

#' # Add Cell Ranger to Your $PATH
#' 1. Cell Ranger is now installed. To run it requires entering the path to the executable command on the command line. 
cd cellranger-6.1.1

pwd

/home/jianie/yard/apps/cellranger-6.1.1


#' 2. Then use the export command to add it into the $PATH variable.

export PATH=/home/jianie/yard/apps/cellranger-6.1.1:$PATH

#' 3. Then enter which cellranger to see if we have successfully added cellranger to the $PATH.
which cellranger

/home/jianie/yard/apps/cellranger-6.1.1/cellranger

#' 4. For convenience, you may want to add this command to your .bashrc, a special script that runs every time you login to your system.


#' 5. Now you can enter cellranger on the command line from any directory to see the usage statement.
cellranger

#' # Perform a Sitecheck
#' 1. The purpose of sitecheck is to check your system to make sure it meets the system requirements for running the cellranger pipeline. Run the command and use the > symbol to direct the output to a file.

cellranger sitecheck > sitecheck.txt

#' 2. Now use the less command to take a look at this file. Use the up and down arrow keys to scroll through the file. Or spacebar to scroll down by page. Press the q key on the keyboard to quit out of the less program.

less sitecheck.txt

#' 3. Scroll down until you find the parts in the file with the CPU Cores information:

#' # Request a Sitecheck Review
cellranger upload niejia113@gmail.com sitecheck.txt


#' # Perform a Testrun









