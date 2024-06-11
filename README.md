# [: - Fixed point math in pure BASH

No subshells, no dependencies, just fixed point math in pure BASH as an executable or sourceable script.

Compatible with positive, negative, whole and precision numbers of tremendous size.

Supported by and tested against all release versions of BASH 3.1+ (2005 onward)

```bash
[: 020.000 == 20 :] && echo 'true'
```
```bash
[: 0.1 + -10 :]
# stdout: -9.9
```
## Special Behaviour

If `[:` is sourced, the result of arithematic becomes the value of variable `SOLUTION`. This enables use of `[:` without the performance code of $(subshells).

If `[:` is not sourced, arithematic solutions are printed to stdout. If the shell is interactive the printed solution ends in a newline.

## Syntax
```
[: NUMBER OPERATOR NUMBER :]
[: -i :] <<< 'NUMBER OPERATOR NUMBER'
printf '%s' 'NUMBER OPERATOR NUMBER' | [: -i :]
```

### NUMBER
`NUMBER` may be whole or a decimal fixed point, be positive or negative, use arbitrary decimals or, have leading and/or trailing zeros.

Empty values `''` or values only containing a decimal `.` are evaluated as: `0`

Examples of supported `NUMBER` values:
```
1  +1  -1  01  +01  -01  1.  +1.  -1.  1.2  .2  +.2  -.2  001.200  +001.200  -001.200
```

### OPERATOR
`OPERATOR` can be add, subtract, equal, not-equal, greater-than, greater-or-equal, less-than, or less-or-equal.

Arithematic `OPERATOR`s
```
+  -
```

Comparison `OPERATOR`s
```
=  ==  !=  '>'  '>='  '<'  '<='  -eq  -ne  -gt  -ge  -lt  -le
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
[: 020.000 -ge -20 :] && echo 'true'
```
```bash
if [: 5 '>' -5.1 :]; then
	echo 'true'
fi
```
```bash
i=-2
while [: 3.2 -gt $i :]; do
	echo "3.2 is greater than $(( i++ ))"
done
```
```bash
[: -i :] <<< '-2.1 < 2' && echo 'true'
```
```bash
[: 0.1 + -10 :]
# stdout: -9.9
```
```bash
source /path/to/[:
# [: becomes a function, arithematic output is available as the value of SOLUTION

[: .1 + 0.10 :] && printf '%s\n' "Answer = ${SOLUTION}"
# stdout: Answer = 0.2
```

## Roadmap
- [x] Comparison (` =  ==  !=  '>'  '>='  '<'  '<='  -eq  -ne  -gt  -ge  -lt  -le `)
- [x] Addition (` + `)
- [x] Subtraction (` - `)
- [ ] Multiplication (` '*' `)
- [ ] Division (` / `)

## License
Licensed under GNU Affero General Public License v3. See LICENSE for details.
