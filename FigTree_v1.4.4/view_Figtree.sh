cat > view_tree.sh << 'EOF'
#!/bin/bash
TREE="MTCT_ALIGN.fasta.phy_phyml_tree.txt"

echo "=== 1. Raw Newick file ==="
cat $TREE
echo ""

echo "=== 2. ASCII tree view ==="
python3 << PYEOF
from Bio import Phylo
import sys
try:
    tree = Phylo.read("$TREE", "newick")
    # Root at midpoint like FigTree asks
    tree.root_at_midpoint()
    Phylo.draw_ascii(tree)
    print("\n=== Tip names ===")
    for tip in tree.get_terminals():
        print(tip.name)
except Exception as e:
    print(f"Install biopython: pip install biopython --user")
    print(e)
PYEOF

echo ""
echo "=== 3. Creating colored PNGs ==="
python3 << PYEOF
from Bio import Phylo
import matplotlib.pyplot as plt

tree = Phylo.read("$TREE", "newick")
tree.root_at_midpoint()

# Normal tree
fig = plt.figure(figsize=(10,8))
ax = fig.add_subplot(1,1,1)
Phylo.draw(tree, axes=ax, show_confidence=True, do_show=False)
plt.savefig("ML_tree_black.png", dpi=300)
print("Saved ML_tree_black.png")

# Colored by bootstrap >70 = green, <70 = red
fig = plt.figure(figsize=(10,8))
ax = fig.add_subplot(1,1,1)
def get_color(conf):
    try:
        return 'green' if float(conf) > 70 else 'red'
    except:
        return 'black'

for clade in tree.find_clades():
    if clade.confidence:
        color = get_color(clade.confidence)
        clade.color = color

Phylo.draw(tree, axes=ax, show_confidence=True, do_show=False)
plt.savefig("ML_tree_colored_bootstrap.png", dpi=300)
print("Saved ML_tree_colored_bootstrap.png - GREEN >70, RED <70")

PYEOF

echo "Done. Download PNGs with scp"
ls -lh *.png
EOF

chmod +x view_tree.sh
