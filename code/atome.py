import pandas as pd

def create_atom(chemin, sortie):
    données_data =pd.read_csv(chemin)  # chemin csv à lire
    données = données_data.values

    résultat = open(sortie,'w')  # nom du fichier lp à sauvegarder

    début_col = 8
    fin_col = len(données[0])
    nb_lignes = len(données)

    lst = []
    #atom(cellule, stage, gène, expression du gène).
    for i in range(0, nb_lignes):
        lst.append(données[i,0])
        for j in range(début_col,fin_col):
                résultat.write("atom(" +
                    str(i) +", " +  # numéro de la cellule
                    str(données[i,2])+", " +  # stage de la cellule
                    données_data.columns[j].lower() +", " +  # nom du gène
                    str(données[i,j]) +").\n")  # expression du gène (0 ou 1)


def lire_txt(matrice, chemin, sortie):
    f = open(chemin,"r")
    file = open(sortie+".txt", "w")
    texte = str(f.read())   
    x = texte.split()

    affinites = []
    genes = []

    # indice du dernier answer dans la sortie
    indice = 0
    for k, mot in enumerate(x) :
        if 'Answer' in mot :
            indice = k
    x = x[indice:] # on supprime le texte qui précède answer

    for mot in x:
        if 'affinite' in mot :
            affinites.append(mot[9:-1])
        if 'selec_gene' in mot :
            genes.append(mot[11:-1].upper())
   
    data_pd =pd.read_csv(f'données/{matrice}.csv')
    nom_cell = data_pd.values[:,0] # nom des cellules
    num_cell = []  # numéro des cellules
    for k in range(len(affinites)) : 
        affinite = affinites[k]
        split_aff = affinite.split(sep=',')
        num_cell.append(int(split_aff[0]))
        split_aff[0] = nom_cell[int(split_aff[0])]
        split_aff[1] = nom_cell[int(split_aff[1])]
        affinites[k] = str(tuple(split_aff))  # str(split_aff[0]) + ", " + str(split_aff[1])

    file.write("Les " + str(len(genes)) + " gènes sélectionnés sont : " + ', '.join(genes) + "\n" + 
        "Les " + str(len(affinites)) + " paires de cellules qui ont des affinités sont : " + ', '.join(affinites) + '\n')

    df = pd.DataFrame(columns=genes)
    for gene in genes : 
        column = data_pd[gene]
        for k, affinite in enumerate(affinites) :
            df.at[affinite[1:-1], gene] = column.iloc[num_cell[k]]
    print(df)
    df.to_csv("résultat.csv")
    


if __name__ == "__main__" :
    lire_txt("B", "texte2.txt", "sortie2")