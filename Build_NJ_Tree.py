from Bio.Phylo.TreeConstruction import DistanceMatrix, DistanceTreeConstructor
from Bio import Phylo

def parse_lower_triangle(file_path):
    with open(file_path) as f:
        lines = f.read().splitlines()
    
    num_taxa = int(lines[0])
    names = []
    matrix = []

    for line in lines[1:]:
        parts = line.strip().split()
        name = parts[0]
        row = list(map(float, parts[1:]))

        names.append(name)
        matrix.append(row)

    # Build full lower triangle matrix (each row should have same index as in `names`)
    full_matrix = []
    for i in range(num_taxa):
        row = [0.0] * (i + 1) if i < len(matrix) else [0.0] * (i + 1)
        if i < len(matrix):
            row[:len(matrix[i])] = matrix[i]
        full_matrix.append(row)

    return DistanceMatrix(names, full_matrix)

# === MAIN ===
distance_matrix = parse_lower_triangle("lower_triangle.txt")
constructor = DistanceTreeConstructor()
nj_tree = constructor.nj(distance_matrix)

# Print tree to screen
Phylo.draw_ascii(nj_tree)

# Optionally: Save as Newick
Phylo.write(nj_tree, "nj_tree.newick", "newick")
