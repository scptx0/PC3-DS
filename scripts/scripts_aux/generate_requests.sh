target="balanceador/incoming_requests/"
mkdir -p "$target" && cd "$target"

for i in {1..4}; do
    echo dato ${i} > "archivo_${i}.txt"
done