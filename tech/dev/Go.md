---
visibility: public
title: Go
---
![[LIL_go-essential-training|LiL course Go Essential Training]]

- [Free Gophers: pixel-art, vector images, hand-drawn sketches](https://github.com/egonelbre/gophers)

# Tools

[[public/tech/software/Software#^247416|Charm CL tools]]

# Built-ins

## Output

```go
import () {
    "fmt" // Formated output
}
```

# Variables, Data Types, Structs

## Private and Public

Upper case is automatically accessible outside of definition (public, *exported symbol*), lower case only internal (private, *unexported symbol*)

## Structs

[Go struct example file](file://.snippets/go/struct.go)

```go
type MyStruct struct {
    ID      string
    Val     float64
    Created time.Time
}

obj1 := MyStruct{"Derp", 42.0, time.Now()}
fmt.Printf("%#v", obj1) // verbose output

ID1 := obj1.ID // access single values with dot notation

// alternative declaration omitting values
obj2 := MyStruct{
    ID: "Derp",
    Val: 42.0
}

// declaration without any assigment, only defaults
var obj3 MyStruct
```

Define methods on structs

```go
func (o MyStruct) Lifetime() time.Duration {
    return b.Created.Sub(time.Now().UTC())
}
```

# Modules

## Time & Date

Module `time`

```go
mytime time.Time // time data type

// builtin functions
time.Now() // current time

// calculations
newtime = time.Now().Add(24 * 7 * time.Hour) // now + 7 days
```

## HTTP requests

`net` module
[Go HTTP example file](file://.snippets/go/http.go)

```go
import (
    "net/http"
)

func main () {
    // ...
    resp, err := http.Get(url) // basic GET request
    // ...
    defer resp.Body.Close() // resource management: close body

    ctype := resp.Header.Get("Content-Type") // read header
}
```
