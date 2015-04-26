package main
import (
    "net/http"
    "fmt"
)

func hello(w http.ResponseWriter, r *http.Request){
    fmt.Fprintf(w, "hello")
}

func main() {
    mux := http.NewServeMux();
    mux.HandleFunc("/", hello)
    http.ListenAndServe(":8080", mux)
}
