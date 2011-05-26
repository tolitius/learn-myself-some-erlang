-module( qsort ).
-export( [sort/1] ).

sort ( List ) ->
    qsort( List ).

qsort ( [] ) -> [];
qsort ( [H|T] ) -> qsort( less ( T, H ) ) ++ [H] ++ qsort ( greater ( T, H ) ).

% lesser half
less ( [], _ ) -> [];
less ( L, Pivot ) -> [ N || N <- L, N =< Pivot ].

% greater half
greater ( [], _ ) -> [];
greater ( L, Pivot ) -> [ N || N <- L, N > Pivot ].
