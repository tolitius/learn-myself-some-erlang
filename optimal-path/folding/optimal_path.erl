-module( optimal_path ).
-export( [show_path_on_the_map/1] ).

% takes a map in a form of a text file with routes ( e.g. 10 2 34 29, etc.. )
% returns the optimal path derived from this map

show_path_on_the_map( MapFile ) ->
    {ok, File} = file:read_file( MapFile ),
    ParsedMap = string:tokens( binary_to_list( File ), "\r\n\t " ),
    ConvertedMap = [ list_to_integer( RoadCost )  || RoadCost  <- ParsedMap ],
    { OptimalPath, _} = lists:foldl( fun get_to_intersection/2, 
                                     { [], b }, 
                                     convert_to_routes( ConvertedMap, [] ) ),
    OptimalPath.

% converting to routes ( a collection of tuples )

convert_to_routes( [], Routes ) ->
    Routes;

convert_to_routes( [ A, B, X | T ], Routes ) ->
    convert_to_routes( T, [ {A, B, X} | Routes ] ).
   
% getting to the next intersection in the most optimal way
 
get_to_intersection( { A, B, X }, { Path, a } ) ->
    case A < X + B of
        true -> { [ A | Path ], a };
        false -> { [ B, X | Path ], b }
    end;

get_to_intersection( { A, B, X }, { Path, b } ) ->
    case B < X + A of
        true -> { [ B | Path ], b };
        false -> { [ A, X | Path ], a }
    end.
