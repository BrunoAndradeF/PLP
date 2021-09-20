
pokemon_stats(Zeca Skull, [fogo],100).
pokemon_stats(Eevee, [normal],100).
pokemon_stats(Seahourse, [gelo],100).
pokemon_stats(Pikachu, [eletrico],100).
pokemon_stats(Kakuna, [poison],100).
pokemon_stats(Digglet,[ground],100)

pokemon_types([normal, fogo, gelo, eletrico, poison, ground]).

type_chart_attack(normal, [1.0, 1.0, 1.0, 1.0, 1.0, 1.0]).
type_chart_attack(fogo, [1.0, 1.0, 2.0, 1.0, 1.0, 0.5]).
type_chart_attack(gelo, [1.0, 1.0, 1.0, 1.0, 1.0, 1.0]).
type_chart_attack(eletrico, [1.0, 1.0, 1.0, 1.0, 1.0, 0.5]).
type_chart_attack(poison, [1.0, 1.0, 1.0, 1.0, 1.0, 0.5]).
type_chart_attack(ground, [1.0, 2.0, 0.5, 2.0, 2.0, 1.0]).