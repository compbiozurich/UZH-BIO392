# code to read .pgxseg file
Flurin Läuchli

```
import pandas as pd

file = open("data.pgxseg", newline="")

lines = file.readlines()

for line in lines:
    if "#" not in line:
        with open("data.csv", "a+") as f:
            f.write(line)

df = pd.read_csv("data.csv")


```

>This code is an adapted version of the code presented in the lecture, as my program did not work at all.

my code:
```
import pandas as pd

file = open("data.pgxseg", newline="")

lines = file.readlines()

df = pd.DataFrame({})

for line in lines:
    if "#" not in line:
        row = pd.DataFrame(line)
        pd.concat([df,row])
```

besides my code not working, the difference between the presented code and my code is the "with" statement, it seems handy but i never used it and Idont know how it works.
