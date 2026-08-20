# Day 1, Part 1

## Input

The input contains one rotation per line:

```text
L68
L30
R48
L5
R60
L55
L1
L99
R14
L82
```

- The dial has positions `0` through `99`.
- The dial starts at `50`.
- `L<n>` moves left by `n` positions.
- `R<n>` moves right by `n` positions.
- Positions wrap around modulo `100`.

## Expected Output

Output the number of rotations that leave the dial at exactly `0` after the
rotation finishes.

For the example above, the resulting positions are:

```text
82, 52, 0, 95, 55, 0, 99, 0, 14, 32
```

The expected output is:

```text
3
```

Only count rotations that end at `0`. Passing through `0` during a rotation
does not count in Part 1.
