# Problem statement
A friend of yours is planning a trip across the country via train, but they can't read the train information! They've asked you to help and they want you to check if they can get from place to place on the rail network. You hit a snag while trying to help when you've found that the trains don't always return to a station they've departed from! That is to say that a train route might go from Station X to Station Y, but it might not go from Station Y to Station X.

They love train trips so they don't care how many trains it takes as long as it's possible to reach their target destination.

You've decided to develop a command line tool with the following criteria:

1. The stations and the route map is stored in `station.json`.
2. The tool accepts two arguments, starting station and destination.
3. Without any arguments, the tool outputs available stations.
4. When it is possible to travel from starting station to the destination station, the output is `Trip is possible`.
5. If no routes are available, the output is `Trip is impossible`.


Example:
```
> checktrip
The available stations are ADL, BRI, MEL, SYD.
> checktrip ADL BRI
Trip is possible.
> checktrip MEL BRI
Trip is possible.
> checktrip SYD ADL
Trip is impossible.
```

# Notes
1. You may use any programming language.
2. Provide instructions to run the code.
3. Write tests.
