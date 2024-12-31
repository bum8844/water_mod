return {
	ACTIONFAIL =
	{
		GIVE =
		{
			WELL_NOTEMPTY = "걸려있는 물동이부터 내려야 해.",
			WELL_BUSY = "아직 물동이가 우물 안에 있어.",
		}
	},

	ANNOUNCE_DRUNK = "히끅... 나 취한 것 같아.",

	ANNOUNCE_DRUNK_MUMBLE = 
	{
		"으으윽...",
		"히끅!",
		"과학을 위해... 건배!",
		"난 괜찮으니까 걱정하지 마.",
		"나 정말 안 취했어. 삼각함수 공식도 외울 수 있어!",
		"젠장, 맥스웰 녀석만 아니었어도...",
		"이 겨울밤 함께 노래하세, 새벽이 다 가도록...", --겨울 축제 노래의 한 구절
		"온 세상에... 과학이 가득해!",
		"내 정신력으로 해결하지 못할 일은 없지... 내 정신력으로!",
	},

	ANNOUNCE_DRUNK_END = "으, 좀 괜찮아진 것 같네.",
	ANNOUNCE_DRUNK_IMMUNITY = "only_used_by_wolfgang_and_wathgrithr", --임시. 위그 전용
	ANNOUNCE_NOTCHARGE = "아직 젖이 나올 상태가 아니야.",
	ANNOUNCE_NOTHIRSTSLEEP = "목이 너무 말라서 자다가 육포가 되겠어!",
	ANNOUNCE_NOTHIRSTSIESTA = "낮잠을 자기엔 너무 목말라!",
	ANNOUNCE_SLEEP_END = "으으... 적당히 마실 걸 그랬어.",
	ANNOUNCE_THIRST = "너무 목말라!",

    ANNOUNCE_CAFFINE_BUFF_START = "힘이 솟아나는 것 같아!" , -- 카페인 버프 시작
    ANNOUNCE_CAFFINE_BUFF_STOP = "힘이 빠지는 것 같아..." ,  -- 카페인 버프 끝

    ANNOUNCE_SATIETY_BUFF_START = "배가 덜 고파!" , -- 포만감 버프 시작
    ANNOUNCE_SATIETY_BUFF_STOP = "허기가 져..." ,  -- 포만감 버프 끝
    
    ANNOUNCE_CURE_WATERBORNE = "속이 좀 가라앉았어." ,  -- 수인성 질병을 아이템으로 치료했을때의 대사

	ANNOUNCE_DCAPACITY_CRITICAL = "몸이 좀 축 쳐져...",
	ANNOUNCE_DCAPACITY_HALF = "뭔가 더운데 기분 탓인가?",

	DESCRIBE =
	{
		BOILBOOK_BASIC = "목마른 자의 지식이야.",
		BOILBOOK_ADVANCED = "목마른 자의 지식이야.",

		WATER_CLEAN_ICE = "만나서 정말 차가워.",
		WATER_DIRTY_ICE = "만나서 더러워.",

		SPICE_CAFFEINPEPPER = "진정한 삶의 향신료야.",
		SPICE_RUINCOLATE_SPREAD = "",

		WELL_KIT = "물구멍이 필요하겠어.",
		WELL_SPRINKLER_KIT = "난 머리 젖는 게 싫은데.",
		WELL_WATERPUMP_KIT = "물을 얻으려면 물이 필요해.",
		WELL_BURYING_KIT = "사실 구멍의 깊이만 알아보고 싶었어.",
		WELL_DRILLING = "구멍을 파고 있는 중이야.",
		WELL_DRILLING_ITEM = "물을 길을 우물을 파는 장치야.",
		HOLE = "여기에 우물을 만들면 되겠어.",
		WELL = "이제 깨끗한 물을 간편하게 얻을 수 있어!",
		BOTTLE_POUCH = "작업해야함",
		WINE_CELLAR_PART = "",
		WINE_CELLAR = "",

		WX78MODULE_NONEDRUNK = "작은 장치 하나에 아주 많은 과학이 압축되어 있어.", -- 78전용 묘듈

		-- 물 모드 식물

		TEA_TREE = "참 작고 멋진 나무야.",
		DUG_TEA_TREE = "다른 곳에 옮겨심을 수 있겠어.",
		TEA_SEED = "안에 씨앗이 들은 것 같아.",
		TEA_SEED_COOKED = "이거나 먹어라, 작은 덤불!",
		TEA_SEED_SAPLING = "시간이 지나면 나무로 자랄 거야.",
		TEALEAVES = "내가 알던 찻잎은 이렇게 안 생겼는데.",
		TEALEAVES_DRIED = "이제 내가 아는 찻잎처럼 생겼어.",

		CAFFEINBERRY = "땅속에 단단히 뿌리내리고 있어.",
		DUG_CAFFEINBERRY = "땅으로 옮겨줘야 해!",
		CAFFEINBERRY_BEAN = "내가 아는 커피콩하고는 다르게 생겼는데.",
		CAFFEINBERRY_BEAN_COOKED = "가열했더니 확실히 나아졌어.",
 
		RUINCACAO_TREE = "조금 소름끼치는 나무네.",
		DUG_RUINCACAO_TREE = "다른 곳에 옮겨심을 수 있겠어.",
		RUINCACAO_SEED = "아기 나무가 나오려고 해.",
		RUINCACAO_SEED_SAPLING = "시간이 지나면 나무로 자랄 거야.",
		RUINCACAO = "껍질이 바스락거려.",
		RUINCACAO_BEAN = "볶으면 좀 더 괜찮겠어.",
		RUINCACAO_BEAN_COOKED = "꽤 익숙한 향이 나는걸.",

		--APPLEPINE
		APPLEPINE = "",
		APPLEPINE_COOKED = "",
		APPLEPINE_SEEDS = "",
		APPLEPINE_OVERSIZED = "",

		--limon
		LIMON = "",
		LIMON_COOKED = "",
		LIMON_SEEDS = "",
		LIMON_OVERSIZED = "",

		--citroyuzu
		CITROYUZU = "",
		CITROYUZU_COOKED = "",
		CITROYUZU_SEEDS = "",
		CITROYUZU_OVERSIZED = "",

		--mentha_spicata

		WEED_MENTHA_SPICATA = "",
		MENTHA_SPICATA = "",

		-- 증류기 첨가제

		ADDITIVE_SEED = "왈리가 새로운 향신료를 만든 걸까?",
		ADDITIVE_PETALS = "말린 꽃잎과 이파리가 들었어.",
		ADDITIVE_NUT = "으음, 향이 꽤 좋은데.",
		ADDITIVE_DAIRY = "과학적인 용어로는 '우유 크림'이야.",

		-- 음료

		WATER_CLEAN = "바로 마셔도 괜찮겠어.",
		WATER_DIRTY = "그냥 마시기에는 좀 위험하겠는데.",
		WATER_SALTY = "염분 때문에 마시기 좋지않아.",

		GOOPYDRINK = "마셔도 괜찮은지 모르겠네.",
		
		-- 주전자 음료

		FRUITJUICE = "과일향이 향긋해.",
		BERRIES_JUICE = "베리에서 과학을 추출해냈어.",
		POMEGRANATE_JUICE = "절대 달콤한 석류주스를 '당'연하게 여기지 말자.",
		BANANA_JUICE = "바나나는 원래 하얗지 않나?",
		FIG_JUICE = "뉴턴의 무화과로 만든 비-뉴턴 유체야.",
		DRAGONJUICE = "용은 안 들어있는데.",
		GLOWBERRYJUICE = "맛은 나쁘지 않아.",
		WATERMELON_JUICE = "감탄할 '수박'에 없는 수분 함량이야.",

		VEGGIE_TEA = "채소풋내가 나는데.",
		CARROT_TEA = "마실 만했으면 좋겠네.",
		CACTUS_TEA = "다행히 가시는 없어.",
		TOMATO_JUICE = "과학이 잔에 가득해.",
		LUMPY_TEA = "흙냄새는 안나는데...",
		SEAWEED_SHAKE = "이걸 음료로 만들 생각을 누가 했을까?",
		
		GREENTEA = "이런 차도 있었어?",
		BLACKTEA = "우유가 조금 있었으면 좋겠는데.",
		BLACKTEA_ICED = "아, 시원하고 좋다!",
		FUER = "향은 생각보다 나쁘지 않아.",
		MIXFLOWER = "꽃향기가 가득해.",
		HIBISCUSTEA = "빨간 색은 산성을 뜻해.",
		CACTUSFLOWER_TEA = "가시돋친 식물로 향긋한 차를 만들었어.",
		LOTUSTEA = "비스킷도 있으면 좋겠는데.",
		SUSHIBISCUS = "과학적으로 용납할 수가 없어.",
		MOON_BLOSSOM_TEA = "향만 맡아도 눈이 확 뜨이네.",

		CAFFEINBERRY_JUICE = "기운 나는 냄새가 나!",
		TOFFEE_LATTE = "커피에 견과류를 더했다고?",
		RUINCHA_LATTE = "콩과 콩이 화학 반응을 일으켰어.",
		
		HOTRUINCOLATE = "마시멜로가 있으면 딱이겠어.",
		RUINCOLATE_SMOOTHIE = "시원하고도 달콤한 맛이야!",
		RUINXOCOLATL = "향기만큼은 아주 좋아.",
		TEA_RUINCOLATE_LATTE = "예상치 못한 조합인걸.",

		MULLED = "내 뇌와 간을 지켜줘.",
		BUTTERBEER = "버터스카치를 응축한 듯한 맛이야.",

		APPLEPINE_JUICE = "이젠 껍질 때문에 입천장 다칠 일 없겠어.",
		APPLEPINE_SMOOTHIE = "",
		APPLEPINE_CAPPUCCINO = "",

		CITROYUZU_JUICE = "오렌지 주스가 있어서 주황.",
		CITROYUZU_TEA = "",
		EARLGREY_TEA = "",

		-- 콜라보 주전자 음료

		COCONUT_JUICE = "안에 젤리가 들어 있어.",
		RAINBOW_SHAKE = "다행히 별 맛 안 나.",
		QUARTZ_SHAKE = "생선 비린내는 안 났으면 좋겠는데.",
		NETTLE_TEA = "",
		FRASH_BRAMBLE_TEA = "",
		TUBER_BLOOM_TEA = "",
		CHERRY_ROSEBERRIES_TEA = "장미향이 강렬해.",
		CHERRY_HONEY_TEA = "은은하게 꽃향기가 나네.",
		SWEET_RICE_DRINK = "이런 음료도 있었어?",
		STRAWBERRY_SMOOTHIE = " 빨대는 없나?", -- 모어 푸드 팩 딸기 스무디
		STRAWBERRY_MILK_SMOOTHIE = "아주 부드럽고 상큼해.", -- 모어 푸드 팩 딸기 스무디 라떼

		-- 양조기 음료

		SPOILED_DRINK = "음료가 구정물이 됐잖아.", --썩은 음료

		--소다 

		SODA = "정말 상쾌해!",
		FRUITSODA = "새콤달콤하면서도 상쾌해!",
		LIMONSODA = "치과의사들이 보면 아마 환장하겠지.",
		COLA = "과학이 가득한 맛이야!",
		COLAQUANTUM = "짜릿한 과학이 들어있어!",
		LUMPY_BEER = "엄청나게 톡 쏘는 향이야!",
		CITROYUZUSODA = "정말 환타-스틱하네.", -- 탄산 오랜지(환타)
		APPLEPINESODA = "입안이 따끔따끔해.", -- 탄산 파인애플(오란씨)
		DAWN_FOG = "",
		MOON_CAP_DRINK = "",

		--양조주

		CORN_BEER = "과학적으로 이건 맥주가 아니야.",
		MADHU = "꿀이 발효되었어.",
		WINE = "'주'책맞게 굴지 말자.",
		NOBLEWINE = "와인을 뛰어넘는 맛이야!",
		SPARKLINGWINE = "강렬하게 흔들어보고 싶어졌어.",
		GLOWBERRYWINE = "음료가 과학으로 빛나고 있어.",
		KUMIS = "우유로는 요구르트를 만드는 거 아니었어?",
		LUMPY_WINE = "깔끔하고 담백한 술이야.",
		PULQUE = "끈적하고 시큼해.",
		RUINCACAO_WINE = "이걸로 술을 만들 수 있을 줄은 몰랐어.",
		MIDNIGHT_STROM = "",
		APPLEPINE_CIDER = "",
		MENTHA_SPICATA_WINE = "",

		--콜라보 소다

		CHERRY_DOCTOR_COLA = "의사가 만들었다고는 못 믿겠는데.",
		STRAWBERRYSODA = "베리강력한 탄산감이야.", -- 탄산 딸기(웰치스 딸기)

		--콜라보 양조주

		AUROBOW = "음료 색이 시시각각 변하고 있어.",
		NETTLE_WINE = "",
		COCONUT_WINE = "지중해라도 온 것 같아. 카리브 해에 있는 지중해.",
		CHERRY_BLOOM_MADHU = "술 진열장에 넣기에는 좋겠어.",
		GIANT_BLUEBERRY_WINE = "양조를 거치니 더 불안정해졌어.",
		RICE_WINE = "이걸로도 술을 담글 수 있었구나.",
		WHEAT_BEER = "과학적으로 이건 밀맥주야.",
		PALE_BEER = "맥주병에 걸려서 창백해.", --"It's pale because of the aleness."

		--증류주

		DISINFECTANT = "음료보다는 약품에 가까워.",
		CORN_WHISKEY = "뭔가 아세톤 냄새가 나는데.",
		LUMPY_VODKA = "빠르게 취하고 싶을 때는 좋아.",
		TEQUILA = "잎보다는 뿌리 향에 가까운데.", --"It smells more like a root than a leaf."
		MADHU_RUM = "아주 과학적이고 '해'학적이야.", --"It's very scien-sea and pirate-y."
		BERRY_BRANDY = "과학적 영감을 얻는 데에 도움이 돼.",
		AREUHI = "이젠 우유 같아 보이지도 않아.",
		APPLEPINE_BRANDY = "",
		VOID = "",
		CITROYUZU_CURACAO = "",
		MENTHA_SPICATA_CURACAO = "",

		--왈리 전용 증류주

		BERRY_GIN = "왕이 부럽지 않은 과학이랄까.", --"It's 'Royal Science', I'd say."
		GLOWBERRY_GIN = "건강한 빛을 강화했어.", --"It's fortified with healthy glow."
		ABSINTHE = "톡 쏘는 향이 특징이야.",
		TEA_LUMPY_VODKA = "찻잎을 우린 건가?",
		PETALS_BERRY_BRANDY = "브랜디인데 꽃향기가 좀 나는걸.",
		KAHLUA = "커피가 술술 우러났어.",
		NUT_CORN_WHISKEY = "안주를 까먹지 않게 술에 우려냈어.",
        RUINCACAO_CREAM_LIQUEUR = "크리미하고 초콜릿향이 나는 술이야.",
        RUMCHATA = "목넘김이 부드러워.",

		--콜라보 증류주

		MOONWAY = "생체발광을 어떻게 보존한 거지?",
		NETTLE_LIQUEUR = "",
		ARRACK = "은은하게 코코넛 향이 나.",
		CHERRY_BLOOM_RUM = "꽃잎이 떠 다니는 게 예쁜걸.",
		RICE_SPIRITS = "이게 다 과학의 힘이야.",
		WHEAT_WHISKEY = "일종의 그레인 위스키야.",
		PALE_WHISKEY = "과학적으로 어떻게 위스키가 이런 색을 낼 수 있는 거지?",

		--왈리 전용 콜라보 증류주

		NUT_COCONUT_BRANDY = "마시면 뭔가 육지 멀미를 할 것 같은데.",
	    GIANT_BLUEBERRY_GIN = "포함된 성분이 더욱 폭발적인 반응을 일으켰어.",

		--냄비 요리

        DARK_RUINCOLATE = "내가 한 번 실험해 볼게. 과학을 위해서 말이야.",
        WHITE_RUINCOLATE = "많이 먹기에는 느끼하겠어.",
        RUINCOLATE = "과학을 하려면 당이 필요해.",
        RUIN_SCHOKAKOLA = "초콜릿에 과학을 잔뜩 주입했어.",
        APPLEPINE_PIE = "",
        APPLEPINE_FRIED_RICE = "",

		BUCKET_STEEL_EMPTY = 
		{
			EMPTY = "쇠로 만들어진 물동이야.",
			FULL = "빗물로 가득 찼어.",
			FULL_ICE = "얼음으로 가득 찼어.",
			DIRTY = "더러운 물로 가득 찼어.",
			DIRTY_ICE = "더러운 얼음으로 가득 찼어.",
		},

		BUCKET_WOODIE_EMPTY = 
		{
			EMPTY = "거칠게 속을 깎아냈어.",
			FULL = "빗물로 가득 찼어.",
			FULL_ICE = "얼음으로 가득 찼어.",
			DIRTY = "더러운 물로 가득 찼어.",
			DIRTY_ICE = "더러운 얼음으로 가득 찼어.",
		},

		BUCKET_DRIFTWOOD_EMPTY = 
		{
			EMPTY = "보기보다 튼튼해.",
			FULL = "빗물로 가득 찼어.",
			FULL_ICE = "얼음으로 가득 찼어.",
			DIRTY = "더러운 물로 가득 찼어.",
			DIRTY_ICE = "더러운 얼음으로 가득 찼어.",
		},

		BUCKET_EMPTY = 
		{
			EMPTY = "물을 채울 수 있어. 물 말고 다른 걸 채워도 되고.",
			FULL = "빗물로 가득 찼어.",
			FULL_ICE = "얼음으로 가득 찼어.",
			DIRTY = "더러운 물로 가득 찼어.",
			DIRTY_ICE = "더러운 얼음으로 가득 찼어.",
		},

		DESALINATOR =
		{
			EMPTY = "바닷물에서 물을 분리하는 건 다 과학의 힘이라고.",
			PURIFY_LONG = "아직도 염분이 많아.",
			PURIFY_SHORT = "거의 다 됐어!",
			HASWATER = "정수가 완료됐어.",
			BURNT = "불이 물을 이겼네.",
			HASSALT = "온통 짜.",
		},

		BARREL =
		{
			GENERIC = "물을 좀 비축하는 것도 통하겠지.",
			BURNT = "물이 다 날아갔어.",
		},

		BREWERY =
		{
			EMPTY = "굉장한 과학이 들어있어.",
			BURNT = "램프 심지마냥 다 타 버렸네.",
			FERMENTING_LONG = "이제 한참 기다리면 되겠어.",
			FERMENTING_SHORT = "발효가 거의 다 됐어!",
			DONE = "이거 기대되는걸!",
		},

		CAMPKETTLE_ITEM = "이제 불만 있으면 돼.",
		CAMPKETTLE =
		{
			GENERIC = "열과 물이 필요해.",
			BOILING_LONG = "좀 더 끓여야 해.",
			BOILING_SHORT = "거의 다 끓였어!",
			DONE = "물이 다 끓었어.",
			STOP = "여전히 물이 더러워.",
		},

		CAMPDESALINATOR_ITEM = "이제 불만 있으면 돼.",
		CAMPDESALINATOR =
		{
			GENERIC = "열과 바닷물이 필요해.",
			BOILING_LONG = "좀 더 정수해야 해.",
			BOILING_SHORT = "거의 다 됐어!",
			DONE = "정수가 완료됐어.",
			STOP = "여전히 물이 짜.",
		},

		KETTLE =
		{
			EMPTY = "보기만 해도 목이 말라.",
			BURNT = "끓인 게 아니라 탔네.",
			BOILING_LONG = "좀 걸릴 거야.",
			BOILING_SHORT = "거의 다 됐어!",
			DONE = "으음, 티타임이다!",
			PURIFY_LONG = "좀 더 끓여야 해.",
			PURIFY_SHORT = "거의 다 끓였어!",
			HASWATER = "물은 됐고, 뭘 넣어볼까?",
			MELT_LONG = "좀 더 녹여야 해.",
			MELT_SHORT = "거의 다 녹였어!",
		},

		PORTABLEKETTLE_ITEM =
		{
			GENERIC = "이제 어디서든 차를 마실 수 있어!",
			EMPTY = "안에는 빈 것 같아.", 
			BOILING_LONG = "차가 좀 오래 걸릴 것 같아.",
			BOILING_SHORT = "금방 될 것 같아!",
			DONE = "차가 다 됐어!",
			PURIFY_LONG = "좀더 끓여야 해.",
			PURIFY_SHORT = "거의 다 끓였어!",
			HASWATER = "물은 됐고, 뭔가 더 넣어볼까?",
			MELT_LONG = "좀 더 녹여야 해.",
			MELT_SHORT = "거의 다 녹였어!",
		},
		
		DISTILLERS =
		{   
		    EMPTY = "마침 실험에 알코올이 필요했는데 잘 됐어.", --증류기 조사 대사
			DISTILLING_LONG = "증류가 끝날 때까지 기다려야 해.", --증류가 끝나기 까지 많이 남음
			DISTILLING_SHORT = "증류가 거의 다 끝나가고 있어.", --증류가 곧 끝남
			DONE = "이거 기대되는걸!", --증류기에 음료가 들어있음
		},

		WELL_WATERPUMP =
		{
			HIGH_PRESSURE = "물이 분수처럼 쏟아질 거야.", -- 압력 최대
			MIDDLE_PRESSURE = "아직은 수압이 나쁘지 않겠어.", -- 압력이 중간
			LOW_PRESSURE = "압력이 너무 낮아!", -- 압력이 거의 없을때
			RECHARG_PRESSURE = "증기로 써야할 물까지 다 빼 버렸어...", -- 압력이 아예 없을때
		},
		
		WELL_SPRINKLER =
		{ 
			LOWFUEL = "연료를 보충해야 해.",
			ON = "분무 시작!",
			OFF = "작동을 멈췄어.",
		},
	},
}
