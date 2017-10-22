# elm-pairing-heap
[![Build Status](https://travis-ci.org/rhofour/elm-pairing-heap.svg?branch=master)](https://travis-ci.org/rhofour/elm-pairing-heap)

A simple pairing heap implementation written in Elm usable as a priority queue. This code is based heavily on the pseudocode
available at [the Wikipedia page](https://en.wikipedia.org/wiki/Pairing_heap).

## Tests
Unit tests can run with elm-test as follows:
1. Run `npm install -g elm-test`
2. Run `elm-test` from the main directory of this project
elm-test should then download and build everything necessary and run the tests.

## Contributing
All code is and should remain formatted by the latest (stable) version of elm-format. Travis CI checks for this.

To format the source code:
1. Run `npm install -g elm-format`
2. Run `elm-format src/ tests/`
