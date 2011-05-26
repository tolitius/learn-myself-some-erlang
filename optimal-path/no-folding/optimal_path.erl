-module( optimal_path ).
-export( [show_path_on_the_map/1] ).

% takes a map in a form of a text file with routes ( e.g. 10 2 34 29, etc.. )
% returns the optimal path derived from this map

show_path_on_the_map( MapFile ) ->
    {ok, File} = file:read_file( MapFile ),
    ParsedMap = string:tokens( binary_to_list( File ), "\r\n\t " ),
    ConvertedMap = [ list_to_integer( RoadCost )  || RoadCost  <- ParsedMap ],
    get_to_intersection( convert_to_routes( ConvertedMap, [] ), [], a ).

% converting to routes ( a collection of tuples )

convert_to_routes( [], Routes ) ->
    Routes;

convert_to_routes( [ A, B, X | T ], Routes ) ->
    convert_to_routes( T, [ {A, B, X} | Routes ] ).
   
% getting to the next intersection in the most optimal way
 
get_to_intersection( [], Path, _ ) ->
    Path;

get_to_intersection( [ { A, B, X } | T ], Path, a ) ->
    case A < X + B of
        true -> get_to_intersection( T, [ A | Path ], a );
        false -> get_to_intersection( T, [ B, X | Path ], b )
    end;

get_to_intersection( [ { A, B, X } | T ], Path, b ) ->
    case B < X + A of
        true -> get_to_intersection( T, [ B | Path ], b );
        false -> get_to_intersection( T, [ A, X | Path ], a )
    end.
