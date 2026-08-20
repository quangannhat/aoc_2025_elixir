# Day 2, Part 1: Gift Shop

Source: <https://adventofcode.com/2025/day/2>

## Input

The input is a single line containing comma-separated product ID ranges:

```text
11-22,95-115,998-1012,1188511880-1188511890,222220-222224,1698522-1698528,446443-446449,38593856-38593862,565653-565659,824824821-824824827,2121212118-2121212124
```

- Each range is written as `<first>-<last>`.
- Both endpoints are included.
- Product IDs do not have leading zeroes.

## Invalid IDs

An ID is invalid when its digits consist of one sequence repeated exactly
twice:

```text
55      -> 5 repeated twice
6464    -> 64 repeated twice
123123  -> 123 repeated twice
```

Examples of valid IDs include `101` and `123124`.

For the example input, the invalid IDs are:

```text
11, 22, 99, 1010, 1188511885, 222222, 446446, 38593859
```

## Expected Output

Output the sum of every invalid ID found in the ranges.

For the example above, the expected output is:

```text
1227775554
```
