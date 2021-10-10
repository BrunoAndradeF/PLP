designaAtaque(1, R):-
    random(9, 16, R).
designaAtaque(2, R):-
    random(10, 26, Aux),
    R is Aux * -1.
designaAtaque(3, R):-
    random(0, 36, Aux),
    R is Aux * -1.


/*danoPorTipo(PokemonAtaq, PokemonDef, R):-
    PokemonAtaq = "Zeca Skull", PokemonDef = "SeaHourse";
    PokemonAtaq = "Digglet", PokemonDef = "Zeca Skull";
    PokemonAtaq = "Digglet", PokemonDef = "Pikachu";
    PokemonAtaq = "Digglet", PokemonDef = "Kakuna", R is 10.
danoPorTipo(PokemonAtaq, PokemonDef, R):-
    PokemonAtaq = "Digglet", PokemonDef = "SeaHourse";
    PokemonAtaq = "Kakuna", PokemonDef = "Digglet", R is -5.
danoPorTipo(PokemonAtaq, PokemonDef, R):-
    PokemonAtaq = "Pikachu", PokemonDef = "Digglet";
    PokemonAtaq = "Zeca Skull", PokemonDef = "Digglet", R is -5.*/

