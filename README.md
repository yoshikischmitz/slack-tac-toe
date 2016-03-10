# slack-tac-toe
A bot for playing tic tac toe games in slack. Written in an hour and then some for the 3/9/2016 URUG hack night. Not meant for production use, will probably break at 1 million reqs/sec.

Usage:

```
SLACK_API_TOKEN=insert_token_here bundle exec ruby server.rb
```

Challenge someone to a duel with `duelbot I challenge x to a duel`
Make your move with `duelbot I place at x_coords y_coords`

Origin for coordinates are at the top-left corner.

![alt tag](https://github.com/yoshikischmitz/slack-tac-toe/blob/master/screenshot1.jpg?raw=true)
![alt tag](https://github.com/yoshikischmitz/slack-tac-toe/blob/master/screenshot2.jpg?raw=true)
