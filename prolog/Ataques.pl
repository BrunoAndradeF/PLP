designaAtaque(Ataque, R):-
    Ataque = 1, random(5, 16, R).
designaAtaque(Ataque, R):-
    Ataque = 2, random(5, 26, R).
designaAtaque(Ataque, R):-
    Ataque = 3, random(10, 36, R).
    

danoPorTipo(PokemonAtaq, PokemonDef, R):-
    PokemonAtaq = "Zeca Skull", PokemonDef = "SeaHourse";
    PokemonAtaq = "Digglet", PokemonDef = "Zeca Skull";
    PokemonAtaq = "Digglet", PokemonDef = "Pikachu";
    PokemonAtaq = "Digglet", PokemonDef = "Kakuna", R is 10.
danoPorTipo(PokemonAtaq, PokemonDef, R):-
    PokemonAtaq = "Digglet", PokemonDef = "SeaHourse";
    PokemonAtaq = "Kakuna", PokemonDef = "Digglet", R is -5.
danoPorTipo(PokemonAtaq, PokemonDef, R):-
    PokemonAtaq = "Pikachu", PokemonDef = "Digglet";
    PokemonAtaq = "Zeca Skull", PokemonDef = "Digglet", R is -5.

