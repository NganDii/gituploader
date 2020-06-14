

echo "Press 1 for Phone, Press 2 for Computer"
read -r device
if [ $device == "1" ]; then
loc="/sdcard"
apt install git
else
loc="/mnt/d"
sudo apt install git
fi
if [ -e "$loc/GitUpload" ]; then
echo "Created already"
else
cd $loc && mkdir GitUpload
fi
echo "Create new folder"
echo 
echo "Type folder name: "
read -r folder
cd $loc/GitUpload && mkdir $folder && cd $loc/GitUpload/$folder
echo "Press Enter after putting all files in $folder"
read -r any
echo "Enter Github Username: "
read -r gituser
echo "Enter Repository name: "
read -r repo
curl -u $gituser https://api.github.com/user/repos -d "{\"name\":\"$repo\"}"
git init
git add .
git commit -m "First commit"
git remote add origin "https://github.com/$gituser/$repo.git"
git push -u origin master