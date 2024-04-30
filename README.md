# Sudoku
I started this project years ago with three main goals. Those goals remain with slight alterations...

1. **Assist in solving the hardest Sudoku Puzzels.** Initially the "hardest" Sudoku Puzzels where the ones found on websites like [sudoku.com](https://sudoku.com/extreme/). Now they are the ones seen in Sudoku Compititions or on [Logic Masters Germany](https://logic-masters.de/Raetselportal/index.php). Additionaly, to truly assist in solving (not just solve), a simple, but effective, Backtracking Algorithm would not survice, to trully assist it must know techniques real humans use to solve Sudoku to be able to give out useful hints and explain why it did what it did.

2. **Assist in creating Sudoku Puzzels.**

3. **Explore and experiment with different/new technogies.** Originally, I used this as a means to learn SwiftUI.

## Task List
- [ ] Terminolgy
    - [ ] Get All Suduko Jargon
    - [ ] Definitions
    - [ ] Examples
    - [ ] Links to Terminolgy throughout page
- [ ] Variations
    - [ ] Get All Types
    - [ ] Examples
    - [ ] Links to Variations when refrenced
- [ ] Replace Unicode Sudoku with Images
- [ ] Solving
    - [ ] Human
    - [ ] Mathematical
    - [ ] AI
- [ ] Creating

## Table of Contents
1. [What is Sudoku?](#what-is-sudoku)
   1. [Rules](#rules)
   2. [Terminology](#terminology)
   3. [Variations](#variations)
       1. [By Grid Size](#by-grid-size)
       2. [By Region Shape](#by-region-shape)
       3. [By Adding Extra Constraints](#by-adding-extra-constraints)
3. [Solving a Sudoku](#solving-a-sudoku)
    1. [The Human Way](#the-human-way)
    2. [The Mathematical Way](#the-mathematical-way)
    3. [The Artificial Intelligence Way](#the-artificial-intelligence-way)
4. [Creating a Sudoku]([#creating-a-sudoku)
5. [Exploring and Solving for Different Variations](#exploring-and-solving-for-different-variations)
6. [Benchmarks](#benchmarks)

## What is Sudoku?
### Rules

### Terminology
###### Element
A digit, number, character, or symbol used to fill in the [cells](#cell-square) of the Sudoku. In _Classic Sudoku_ the number 7, for example, would be considered an element.

###### Element Set
All [elements](#element) used in the Sudoku. In _Classic Sudoku_ the element set is the numbers 1-9.

###### Cell, Square
An individual square on the Sudoku Grid. In _Classic Sudoku_ there are 81 cells.

```
╔═══╤═══╤═══╦═══╤═══╤═══╦═══╤═══╤═══╗
║ * │   │   ║   │   │   ║   │   │   ║
╟───┼───┼───╫───┼───┼───╫───┼───┼───╢
║   │   │   ║   │   │   ║   │   │   ║
╟───┼───┼───╫───┼───┼───╫───┼───┼───╢
║   │   │   ║   │   │   ║   │   │   ║
╠═══╪═══╪═══╬═══╪═══╪═══╬═══╪═══╪═══╣
║   │   │   ║   │   │   ║   │   │   ║
╟───┼───┼───╫───┼───┼───╫───┼───┼───╢
║   │   │   ║   │   │   ║   │   │   ║
╟───┼───┼───╫───┼───┼───╫───┼───┼───╢
║   │   │   ║   │   │   ║   │   │   ║
╠═══╪═══╪═══╬═══╪═══╪═══╬═══╪═══╪═══╣
║   │   │   ║   │   │   ║   │   │   ║
╟───┼───┼───╫───┼───┼───╫───┼───┼───╢
║   │   │   ║   │   │   ║   │   │   ║
╟───┼───┼───╫───┼───┼───╫───┼───┼───╢
║   │   │   ║   │   │   ║   │   │   ║
╚═══╧═══╧═══╩═══╧═══╧═══╩═══╧═══╧═══╝
```

###### Row
An consecutive line of horizontal [cells](#cell-square) on the Sudoku Grid. In _Classic Sudoku_ there are 9 rows.
```
╔═══╤═══╤═══╦═══╤═══╤═══╦═══╤═══╤═══╗
║ * │ * │ * ║ * │ * │ * ║ * │ * │ * ║
╟───┼───┼───╫───┼───┼───╫───┼───┼───╢
║   │   │   ║   │   │   ║   │   │   ║
╟───┼───┼───╫───┼───┼───╫───┼───┼───╢
║   │   │   ║   │   │   ║   │   │   ║
╠═══╪═══╪═══╬═══╪═══╪═══╬═══╪═══╪═══╣
║   │   │   ║   │   │   ║   │   │   ║
╟───┼───┼───╫───┼───┼───╫───┼───┼───╢
║   │   │   ║   │   │   ║   │   │   ║
╟───┼───┼───╫───┼───┼───╫───┼───┼───╢
║   │   │   ║   │   │   ║   │   │   ║
╠═══╪═══╪═══╬═══╪═══╪═══╬═══╪═══╪═══╣
║   │   │   ║   │   │   ║   │   │   ║
╟───┼───┼───╫───┼───┼───╫───┼───┼───╢
║   │   │   ║   │   │   ║   │   │   ║
╟───┼───┼───╫───┼───┼───╫───┼───┼───╢
║   │   │   ║   │   │   ║   │   │   ║
╚═══╧═══╧═══╩═══╧═══╧═══╩═══╧═══╧═══╝
```

###### Column
An consecutive line of vertical [cells](#cell-square) on the Sudoku Grid. In _Classic Sudoku_ there are 9 columns.
```
╔═══╤═══╤═══╦═══╤═══╤═══╦═══╤═══╤═══╗
║ * │   │   ║   │   │   ║   │   │   ║
╟───┼───┼───╫───┼───┼───╫───┼───┼───╢
║ * │   │   ║   │   │   ║   │   │   ║
╟───┼───┼───╫───┼───┼───╫───┼───┼───╢
║ * │   │   ║   │   │   ║   │   │   ║
╠═══╪═══╪═══╬═══╪═══╪═══╬═══╪═══╪═══╣
║ * │   │   ║   │   │   ║   │   │   ║
╟───┼───┼───╫───┼───┼───╫───┼───┼───╢
║ * │   │   ║   │   │   ║   │   │   ║
╟───┼───┼───╫───┼───┼───╫───┼───┼───╢
║ * │   │   ║   │   │   ║   │   │   ║
╠═══╪═══╪═══╬═══╪═══╪═══╬═══╪═══╪═══╣
║ * │   │   ║   │   │   ║   │   │   ║
╟───┼───┼───╫───┼───┼───╫───┼───┼───╢
║ * │   │   ║   │   │   ║   │   │   ║
╟───┼───┼───╫───┼───┼───╫───┼───┼───╢
║ * │   │   ║   │   │   ║   │   │   ║
╚═══╧═══╧═══╩═══╧═══╧═══╩═══╧═══╧═══╝
```

###### Region, Box, Block, Nonet
A sub-grid in the [grid](#grid). In _Classic Sudoku_ there are nine 3×3 regions.
```
╔═══╤═══╤═══╦═══╤═══╤═══╦═══╤═══╤═══╗
║ * │ * │ * ║   │   │   ║   │   │   ║
╟───┼───┼───╫───┼───┼───╫───┼───┼───╢
║ * │ * │ * ║   │   │   ║   │   │   ║
╟───┼───┼───╫───┼───┼───╫───┼───┼───╢
║ * │ * │ * ║   │   │   ║   │   │   ║
╠═══╪═══╪═══╬═══╪═══╪═══╬═══╪═══╪═══╣
║   │   │   ║   │   │   ║   │   │   ║
╟───┼───┼───╫───┼───┼───╫───┼───┼───╢
║   │   │   ║   │   │   ║   │   │   ║
╟───┼───┼───╫───┼───┼───╫───┼───┼───╢
║   │   │   ║   │   │   ║   │   │   ║
╠═══╪═══╪═══╬═══╪═══╪═══╬═══╪═══╪═══╣
║   │   │   ║   │   │   ║   │   │   ║
╟───┼───┼───╫───┼───┼───╫───┼───┼───╢
║   │   │   ║   │   │   ║   │   │   ║
╟───┼───┼───╫───┼───┼───╫───┼───┼───╢
║   │   │   ║   │   │   ║   │   │   ║
╚═══╧═══╧═══╩═══╧═══╧═══╩═══╧═══╧═══╝
```

###### Band
Horizontally aligned [regions](#region-box-block-nonet). In _Classic Sudoku_ there are three bands.
```
╔═══╤═══╤═══╦═══╤═══╤═══╦═══╤═══╤═══╗
║ * │ * │ * ║ * │ * │ * ║ * │ * │ * ║
╟───┼───┼───╫───┼───┼───╫───┼───┼───╢
║ * │ * │ * ║ * │ * │ * ║ * │ * │ * ║
╟───┼───┼───╫───┼───┼───╫───┼───┼───╢
║ * │ * │ * ║ * │ * │ * ║ * │ * │ * ║
╠═══╪═══╪═══╬═══╪═══╪═══╬═══╪═══╪═══╣
║   │   │   ║   │   │   ║   │   │   ║
╟───┼───┼───╫───┼───┼───╫───┼───┼───╢
║   │   │   ║   │   │   ║   │   │   ║
╟───┼───┼───╫───┼───┼───╫───┼───┼───╢
║   │   │   ║   │   │   ║   │   │   ║
╠═══╪═══╪═══╬═══╪═══╪═══╬═══╪═══╪═══╣
║   │   │   ║   │   │   ║   │   │   ║
╟───┼───┼───╫───┼───┼───╫───┼───┼───╢
║   │   │   ║   │   │   ║   │   │   ║
╟───┼───┼───╫───┼───┼───╫───┼───┼───╢
║   │   │   ║   │   │   ║   │   │   ║
╚═══╧═══╧═══╩═══╧═══╧═══╩═══╧═══╧═══╝
```

###### Stack
Vertically aligned [regions](#region-box-block-nonet). In _Classic Sudoku_ there are three stacks.
```
╔═══╤═══╤═══╦═══╤═══╤═══╦═══╤═══╤═══╗
║ * │ * │ * ║   │   │   ║   │   │   ║
╟───┼───┼───╫───┼───┼───╫───┼───┼───╢
║ * │ * │ * ║   │   │   ║   │   │   ║
╟───┼───┼───╫───┼───┼───╫───┼───┼───╢
║ * │ * │ * ║   │   │   ║   │   │   ║
╠═══╪═══╪═══╬═══╪═══╪═══╬═══╪═══╪═══╣
║ * │ * │ * ║   │   │   ║   │   │   ║
╟───┼───┼───╫───┼───┼───╫───┼───┼───╢
║ * │ * │ * ║   │   │   ║   │   │   ║
╟───┼───┼───╫───┼───┼───╫───┼───┼───╢
║ * │ * │ * ║   │   │   ║   │   │   ║
╠═══╪═══╪═══╬═══╪═══╪═══╬═══╪═══╪═══╣
║ * │ * │ * ║   │   │   ║   │   │   ║
╟───┼───┼───╫───┼───┼───╫───┼───┼───╢
║ * │ * │ * ║   │   │   ║   │   │   ║
╟───┼───┼───╫───┼───┼───╫───┼───┼───╢
║ * │ * │ * ║   │   │   ║   │   │   ║
╚═══╧═══╧═══╩═══╧═══╧═══╩═══╧═══╧═══╝
```

###### Grid
The entirty of the the puzzle. In _Classic Sudoku_ there is one 9×9 grid.
```
╔═══╤═══╤═══╦═══╤═══╤═══╦═══╤═══╤═══╗
║ * │ * │ * ║ * │ * │ * ║ * │ * │ * ║
╟───┼───┼───╫───┼───┼───╫───┼───┼───╢
║ * │ * │ * ║ * │ * │ * ║ * │ * │ * ║
╟───┼───┼───╫───┼───┼───╫───┼───┼───╢
║ * │ * │ * ║ * │ * │ * ║ * │ * │ * ║
╠═══╪═══╪═══╬═══╪═══╪═══╬═══╪═══╪═══╣
║ * │ * │ * ║ * │ * │ * ║ * │ * │ * ║
╟───┼───┼───╫───┼───┼───╫───┼───┼───╢
║ * │ * │ * ║ * │ * │ * ║ * │ * │ * ║
╟───┼───┼───╫───┼───┼───╫───┼───┼───╢
║ * │ * │ * ║ * │ * │ * ║ * │ * │ * ║
╠═══╪═══╪═══╬═══╪═══╪═══╬═══╪═══╪═══╣
║ * │ * │ * ║ * │ * │ * ║ * │ * │ * ║
╟───┼───┼───╫───┼───┼───╫───┼───┼───╢
║ * │ * │ * ║ * │ * │ * ║ * │ * │ * ║
╟───┼───┼───╫───┼───┼───╫───┼───┼───╢
║ * │ * │ * ║ * │ * │ * ║ * │ * │ * ║
╚═══╧═══╧═══╩═══╧═══╧═══╩═══╧═══╧═══╝
```

###### Clue, Given {#clue}
The initially defined values.

###### Group

###### Polyomino Region
A shape formed by joining one or more [cells](#cell-square) edge to edge.

| $n$ | Name        |
| --- | ----------- |
|   1 | Monomino    |
|   2 | Domino      |
|   3 | Tromino     |
|   4 | Tetromino   |
|   5 | Pentomino   |
|   6 | Hexomino    |
|   7 | Heptomino   |
|   8 | Octomino    |
|   9 | Nonomino    |
|  10 | Decomino    |
|  11 | Undecomino  |
|  12 | Dodecomino  |

### Variations
#### By Grid Size

###### Shi-Doku / Sample Sudoku
4×4 grid with 2×2 boxes.

###### Roku-Doku / Mini Sudoku
6×6 grid with 2×3 boxes. 

###### Classic Sudoku
9×9 grid with 3×3 boxes. The most common variant by far.

###### Maxi / Dodeka Sudoku (Juni-Doku)
12×12 grid with 3×4 boxes. 

###### Number Place Challenger Sudoku
16×16 grid with 4×4 boxes. 

###### Giant Suduko
25×25 grid with 5×5 boxes. 

###### Sudoku-zilla
100×100 grid with 10×10 boxes. 


#### By Region Shape

###### Go-Doku / Logi-5
5×5 grid with pentomino boxes. 

###### Nana-Doku[^1]
7×7 grid with heptomino regions and a disjoint boxes. 

###### Jigsaw Sudoku
9×9 grid with nonomino regions. 

#### By Adding Extra Constraints

###### Sudoku X

###### Arrow Sudoku

###### Killer Sudoku

###### Miracle Sudoku

###### Thermo Sudoku

###### Chess Sudoku

###### Sandwich Sudoku

###### Cave

## Solving a Sudoku

### The Human Way

### The Mathematical Way

### The Artificial Intelligence Way

## Creating a Sudoku

## Exploring and Solving for different Variations

## Benchmarks


[^1]: Unofficial Name, most sorces do not call it anything. Named after the japanese ponunciation of "七" (nana) and follows the same naming sence of Shi-Doku, Ruku-Doku, and Go-Duku.
