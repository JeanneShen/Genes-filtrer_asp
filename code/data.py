import pandas as pd

path = '/home/sar/gene/AI_project/matrices/toy_datasets/'
data_name = input("data file name:")
donnees = pd.read_csv(path+data_name)
don = donnees.values
 
db = 8
fn = len(don[0])

file_name = input("enregistrer file with name:") 
res = open(file_name,'w')
 
for i in range(0,len(don)):
    for j in range(db,fn):
        res.write("atom(" + str(i) + ", " + donnees.columns[j].lower() + ", " + str(don[i,j]) + ", " + str(don[i,2]).lower() + ").\n")
 
res.close()