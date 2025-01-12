AIActionTable_GoGoRainDance:
	dw .do_turn ; unused
	dw .do_turn
	dw .start_duel
	dw .forced_switch
	dw .ko_switch
	dw .take_prize

.do_turn
	jp AIMainTurnLogic

.start_duel
	call InitAIDuelVars
	call .store_list_pointers
	call SetUpBossStartingHandAndDeck
	call TrySetUpBossStartingPlayArea
	ret nc
	jp AIPlayInitialBasicCards

.forced_switch
	jp AIDecideBenchPokemonToSwitchTo

.ko_switch
	jp AIDecideBenchPokemonToSwitchTo

.take_prize
	jp AIPickPrizeCards

.list_arena
	dw LAPRAS
	dw HORSEA
	dw GOLDEEN
	dw SQUIRTLE
	dw NULL

.list_bench
	dw SQUIRTLE
	dw HORSEA
	dw GOLDEEN
	dw LAPRAS
	dw NULL

.list_retreat
	ai_retreat SQUIRTLE,  -3
	ai_retreat WARTORTLE, -2
	ai_retreat HORSEA,    -1
	dw NULL

.list_energy
	ai_energy SQUIRTLE,  2, +0
	ai_energy WARTORTLE, 3, +0
	ai_energy BLASTOISE, 5, +0
	ai_energy GOLDEEN,   1, +0
	ai_energy SEAKING,   2, +0
	ai_energy HORSEA,    2, +0
	ai_energy SEADRA,    3, +0
	ai_energy LAPRAS,    3, +0
	dw NULL

.list_prize
	dw GAMBLER
	dw ENERGY_RETRIEVAL
	dw SUPER_ENERGY_RETRIEVAL
	dw BLASTOISE
	dw NULL

.store_list_pointers
	store_list_pointer wAICardListAvoidPrize, .list_prize
	store_list_pointer wAICardListArenaPriority, .list_arena
	store_list_pointer wAICardListBenchPriority, .list_bench
	store_list_pointer wAICardListPlayFromHandPriority, .list_bench
	; missing store_list_pointer wAICardListRetreatBonus, .list_retreat
	store_list_pointer wAICardListEnergyBonus, .list_energy
	ret
