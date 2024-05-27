echo " BUILD START"

var1="backports.zoneinfo==0.2.1"
var2='backports.zoneinfo==0.2.1;python_version<"3.9"'
sed -i -e "s/$var1/$var2/g" requirements.txt

python3.9 -m pip install -r requirements.txt

echo " MAKE MIGRATIONS..."
python3.9 manage.py makemigrations --noinput
python3.9 manage.py migrate --noinput


python3.9 manage.py collectstatic --noinput --clear
echo " BUILD END"
