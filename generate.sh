# Use this script to generate dummy targets and their files

for i in {1..100}
do
    mkdir -p "Sources/Target$i"
    BASENAME="Target$i"
    echo "basename: $BASENAME"
    for i in {1..100}
    do
        echo "enum ${BASENAME}_${i} { static let number = $i }" > "Sources/$BASENAME/${BASENAME}_${i}.swift"
    done
done
