#!/bin/bash

#replace concrete token in copy curl request with placeholder for token variable
if ! grep -q "\$TOKEN" "post_curl.txt"; then
    echo "Altering post curl command..."
    sed -i "s/'token=\(.*\)'/\"token=\$TOKEN\"/" post_curl.txt
    echo "Done"
fi



while true;
do
    TOKEN=$(bash get_curl.txt 2>/dev/null | grep "var pasteta_hunt_token" | sed 's/.*= "\(.*\)".*/\1/' )

    if [ -z "$TOKEN" ]; then
        echo "TOKEN is empty :( let's try again"
    else
        echo "TOKEN IS $TOKEN, sending to server..."

        TOKEN=$TOKEN bash post_curl.txt 2>/dev/null >> log.txt
        echo >> log.txt
    fi

    #pause for random time
    number=$RANDOM
    let "number %= 4"
    let "number += 3"
    sleep $number;
done


