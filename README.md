# [: - Fixed point math in pure BASH

No subshells, no dependencies, just fixed point math in pure BASH as an executable or sourceable script.

Compatible with positive, negative, whole and precision numbers of tremendous size.

Supported by and tested against all release versions of BASH 3.1+ (2005 onward)

```bash
# Optional: source [: to define [: as a function for better performance.
source [:
```
```bash
[: 020.000 == 20 :] && printf '%s\n' 'true'
# stdout: true
```
```bash
[: -i :] <<< '-20 + .30'
# stdout: -19.7
```
## Special Behaviour
If `[:` is sourced, the result of arithematic becomes the value of variable `SOLUTION`. This enables use of `[:` without the performance cost of $(subshells).

If `[:` is not sourced, arithematic solutions are printed to stdout. If the shell is interactive the printed solution ends in a newline.

While sourcing is optional for interactive convenience, scripts should always use `source [:` as it nets a minimum >5x speed improvement including the sourcing cost when running one or more equations.

## Syntax
```
[: 'NUMBER OPERATOR NUMBER' :]
[: NUMBER OPERATOR NUMBER :]
[: -i :]
```
### -i
Read `NUMBER` `OPERATOR` `NUMBER` from stdin using standard IFS (spaces, tabs and newlines).

### NUMBER
`NUMBER` may be a positive or negative, whole or decimal, fixed point number with any combination of leading and trailing zeros.

`NUMBER` must contain at least one digit to not cause a NaN error (see: Error Codes).

Examples of supported `NUMBER` values:
```
1  +1  -1  01  +01  -01  1.  +1.  -1.  1.2  .2  +.2  -.2  001.200  +001.200  -001.200
```

### OPERATOR
`OPERATOR` can be add, subtract, equal, not-equal, greater-than, greater-or-equal, less-than, or less-or-equal.

Care should be taken to use proper quoting for operators containing `<`, `>` and `*` to avoid shell interpretation.

Arithematic `OPERATOR`s
```
+  -  *
```

Comparison `OPERATOR`s
```
=  ==  !=  >  >=  <  <=  -eq  -ne  -gt  -ge  -lt  -le
```
= and == are treated as the same

## Error Codes
```
0 = Result is true
1 = General error
2 = Result is false
4 = NUMBER is NaN
```

## Examples of use
```bash
source [:
# [: becomes a function and arithematic solutions are now the value of SOLUTION

[: .1 + 0.10 :] && printf '%s\n' "Answer = ${SOLUTION}"
# stdout: Answer = 0.2
```
```bash
# If [: is not sourced arithematic solutions are printed to stdout
[: 0.1 + -10 :]
# stdout: -9.9
```
```bash
[: 020.000 -ge -20 :] && echo 'true'
```
```bash
if [: '5 > -5.1' :]; then
	echo 'true'
fi
```
```bash
i=-2
while [: "3.2 -gt ${i}" :]; do
	echo "3.2 is greater than $(( i++ ))"
done
```
```bash
[: -i :] <<< '-2.1 < 2' && echo 'true'
```

## Roadmap
- [x] Comparison (` =  ==  !=  >  >=  <  <=  -eq  -ne  -gt  -ge  -lt  -le `)
- [x] Addition (` + `)
- [x] Subtraction (` - `)
- [x] Multiplication (` * `)
- [ ] Division (` / `)

## License
Licensed under GNU Affero General Public License v3. See LICENSE for details.