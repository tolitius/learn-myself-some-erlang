# What is "Learning myself some Erlang"? ##

Playground for the awesome ["learn yourself some Erlang"](http://learnyousomeerlang.com/) book by Fred Hebert

### Things here are runnable via 'erl' interpreter

```erlang
1> c(optimal_path).                                
{ok,optimal_path}
2> optimal_path:show_path_on_the_map("../map.txt").
[10,30,5,20,2,8]
```
```erlang
1> c(qsort).
{ok,qsort}
2> qsort:sort([0,4,54,2,5,3,7,35,235,6,2]).
[0,2,2,3,4,5,6,7,35,54,235]
```
# Please help making the book even better

If you find errors in the book, send Fred suggestions at mononcqc at gmail dot com or find him on #erlang (under the nickname MononcQc).
Fred could be also found on Twitter: [@mononcqc](http://twitter.com/mononcqc)
