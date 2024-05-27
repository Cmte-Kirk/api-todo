

pip freeze
pip freeze | iconv -f UTF-8  > requirements_temp.txt
cat requirements_temp.txt | awk '{sub(/backports\.zoneinfo\=\=0\.2\.1/,"backports.zoneinfo==0.2.1;python_version<\"3.9\"")}1' > requirements.txt
