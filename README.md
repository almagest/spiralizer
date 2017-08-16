# Ruby Test - "The Spiralizer"

Write a Ruby gem that takes a matrix (or two dimensional array) and returns a string.
The matrix may be of arbitrary size and must consist of uppercase English letters.
The returned string must consist of all elements of the matrix ordered in a clockwise
spiral pattern starting with element [0, 0]. Each letter must be converted to lowercase
and separated by a single whitespace character.

For example, given the following matrix:
```
A B C D
E F G H
I J K L
```
The resulting string would be:
"a b c d h l k j i e f g"

## Usage

Build & install the gem:
```
gem build spiralize.gemspec; gem install spiralize-0.0.1.gem
```
Run via IRB or in a code file:
```ruby
require 'spiralize'
matrix = Matrix[["A","B"], ["C","D"]]
matrix.spiralize
```
```
=> "a b d c"
```

## Tests
This gem uses minitest for testing. To run:
```
ruby -Ilib:test spiralize.spec
```
