package main

import (
	"fmt"

	. "github.com/logrusorgru/aurora"
)

func main() {
	fmt.Println("Hello,", Magenta("Golang"))
	fmt.Println(Bold(Cyan(Version())))
}
