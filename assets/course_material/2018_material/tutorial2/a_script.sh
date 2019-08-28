if [ $# -lt 1 ]
  then
    echo "Need 1 arguments"
    exit 1
fi
./blastp -db pdb -query $1  -out results.out -remote 
python3 blast_parser.py