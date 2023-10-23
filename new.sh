for i in {1..100}
do
    mkdir -p "Sources/Target$i"
    BASENAME="Target$i"
    echo "basename: $BASENAME"
    for i in {1..500}
    do
        echo "enum $BASENAME$i { static let number = $i }" > "Sources/$BASENAME/${BASENAME}_${i}.swift"
    done
done