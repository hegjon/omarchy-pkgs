// hello-go: a tiny program to exercise the build farm's Go path (module
// vendoring in the sourcer, offline build on the worker, and the Go SBOM).
package main

import (
	"fmt"

	"rsc.io/quote"
)

func main() {
	fmt.Println(quote.Hello())
}
