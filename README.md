# Pate collector prize game automation
Prize game is about collecting pate's which appear randomly on company's website. When user clicks on pate, he is awared either 1, 2, 5, 10 or 20 points, randomly.

## Installation
Make sure you are logged in.
Go to one of the pages where pates appear. Using browsers developers tools, record GET request for this page and copy it as cURL. Paste the content in `get_curl.txt` file in this repo.
Refresh the page until pate appears (it might take a few times) and record POST request using developers tools. Copy the request as cURL in `post_curl.txt` file in this repo.

## Running
Start `collect_tokens.sh`.

It will output to stdout if the token is found or not in currently loaded page and send tokens to server if they are found.
Additionally, post request bodies sent towards server are recorded in `log.txt`.
