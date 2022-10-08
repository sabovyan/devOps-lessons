echo "enter a name"
read name

if [ -z "${name}" ]
  then
    echo "name was not provided"
    exit 1
  else
    echo "procesing"
fi


current_date=$(date +'%Y-%m-%d-%H-%M-%S')

file_name="${name}-${current_date}"

touch "${file_name}"

ls -lah

last -a  > "${file_name}"

cat "${file_name}"



echo "delete the file ? (y/n)"

read answer

if [ ${answer} == 'y' ] || [ ${answer} == 'yes' ]
  then
    rm "${file_name}"
    echo 'done!'
  else
    ls -lah ${file_name}
fi
