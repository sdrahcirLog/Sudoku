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

## Table of Contents
1. [What is Sudoku?](#what-is-sudoku)
   1. [Terminology](#terminology)
   2. Variations
3. [Solving a Sudoku](#solving-a-sudoku)
4. [Creating a Sudoku]([#creating-a-sudoku))
5. [Benchmarks](#benchmarks)

## What is Sudoku?
### Terminology
###### Element
A digit, number, character, or symbol used to fill in the **cells** of the Sudoku. In Classic Sudoku the number 7, for example, would be considered an element.

###### Element Set

###### Cell
An individual Square on the Sudoku Grid. In _Classic Sudoku_ there are 81 cells.
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
An individual row on the Sudoku Grid. In _Classic Sudoku_ there are 9 rows.
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
An individual column on the Sudoku Grid. In _Classic Sudoku_ there are 9 columns.
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

###### Regions (Also called _Boxes_ or _Blocks_)
A sub-grid in the Sudoku Grid. In _Classic Sudoku_ there are nine 3 × 3 regions.
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

###### Grid
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

###### Polyomino Boxes
- Pentomino (5)
- Heptomino (7)
- Nonomino (9)

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
