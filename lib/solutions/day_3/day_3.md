# Day 3, Part 1: Lobby

Source: <https://adventofcode.com/2025/day/3>

## Input

The input contains one bank of batteries per line. Each digit is a battery's
joltage rating from `1` through `9`:

```text
987654321111111
811111111111119
234234234234278
818181911112111
```

## Maximum Joltage

Turn on exactly two batteries in each bank. The bank's output is the two-digit
number formed by the selected batteries in their original order.

For example, selecting `2` and `4` from `12345` produces `24` jolts. Batteries
cannot be rearranged.

Find the largest possible joltage for every bank. For the example input, the
maximum values are:

```text
987654321111111 -> 98
811111111111119 -> 89
234234234234278 -> 78
818181911112111 -> 92
```

## Expected Output

Output the sum of the maximum joltage from every bank.

For the example above:

```text
98 + 89 + 78 + 92 = 357
```

The expected output is:

```text
357
```
