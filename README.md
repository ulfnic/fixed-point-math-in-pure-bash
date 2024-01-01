# fixed-point-math-in-pure-bash

No subshells, no dependencies, just fixed point math in pure BASH as an executable or sourceable script.

Compatible with positive, negative, whole and precision numbers of tremendous size.

Supported by and tested against all release versions of BASH 3.1+ (2005 onward)

```bash
[: 020.000 == 20 :] && echo 'true'
```

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
`OPERATOR` can be equal, not-equal, greater-than, greater-or-equal, less-than, or less-or-equal.

= and == are treated as the same

Supported `OPERATOR` values:
```
=  ==  !=  '>'  '>='  '<'  '<='  -eq  -ne  -gt  -ge  -lt  -le
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
printf '%s' '.4 >= +00.30' | [: -i :] && echo 'true'
```

## Roadmap
- [x] Comparison (` =  ==  !=  '>'  '>='  '<'  '<='  -eq  -ne  -gt  -ge  -lt  -le `)
- [ ] Addition (` + `)
- [ ] Subtraction (` - `)
- [ ] Multiplication (` '*' `)
- [ ] Division (` / `)

## License
Licensed under GNU Affero General Public License v3. See LICENSE for details.
