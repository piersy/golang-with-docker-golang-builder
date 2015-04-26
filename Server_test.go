package main
import (
    "testing"
    "net/http"
    "io/ioutil"
)

func TestWhenContactingServer_thenServerReturnsHello(t *testing.T){
    go main();

    r, _ := http.Get("http://localhost:8080")

    b, _ := ioutil.ReadAll(r.Body)
    if(string(b) != "hello"){
        t.Fail();
    }
}
