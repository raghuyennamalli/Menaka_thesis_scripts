import pandas as pd

eigenval = pd.read_csv("18Cattle_SNP_PCA.eigenval", header=None)
eigenval.columns = ["Eigenvalue"]

# Calculate % variation explained
eigenval["% Var"] = 100 * eigenval["Eigenvalue"] / eigenval["Eigenvalue"].sum()
print(eigenval.head())
