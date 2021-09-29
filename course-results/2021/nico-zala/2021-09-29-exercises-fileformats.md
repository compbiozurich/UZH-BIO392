# Exercises Imallona

### Ex 1

wc -l

### Ex 2

man head

### Ex 3

head -5 ~/course/data/example.bed

### Ex 4

head -5 ~/course/data/example.bed | wc -l

### Ex 5

curl -L  http://imlspenticton.uzh.ch/imallona/teaching/SP1.fq   > SP1.f

### Ex 6

c -l SP1.fq ; ls -lh SP1.fq 

### Ex 7

awk 'NR % 4 == 2 {print $0}' SP1.fq | wc -l

### Ex 8

@` is a valid quality score, so lines of phred scores will be counted as well when using grep

### Ex 9

```awk 'NR % 4 == 2 {print $0}' SP1.fq``` or ```awk 'NR % 4 == 2' SP1.fq```


### Ex 4

### Ex 4
### Ex 4
### Ex 4
### Ex 4
