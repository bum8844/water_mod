return {
	ACTIONFAIL =
	{
		GIVE =
		{
			WELL_NOTEMPTY = "도르래가 하나뿐인데 그건 안 되지.", -- 우물에 말라 빈 양동이 달려있는데 양동이 달려 함
			WELL_BUSY = "그러다 잘못하면 우물이 막힐걸.", -- 우물에 물 든 양동이 달려있는데 달려 함
		}
	},

	ANNOUNCE_DRUNK = "히끅... 어유, 술을 너무 많이 먹었어...", -- 취함
	ANNOUNCE_DRUNK_MUMBLE =
	{
		"히끅...",
		"그래, 술 한 잔 마셨다 뭐...",
		"으으으...",
		"근데 술 먹고 일하면 사고 나는데...", --"Drinking at work is an accident waiting to happen..."
		"...찰리, 넌 대체 뭘 하고 다니길래 그러냐...", --"Charlie... what are you doing out there, sis?"
		"술 안 먹고는 못 살겠는 이 더러운 세상!", --"This hell-hole just makes me keep drinking, ya know!"
		"...걔는 어쩌다 그런 등신이랑 엮였담...!", --"...No idea how has she come to meet such an idiot...!"
		"아, 꿀꿀하다! 한 잔 더 해!", --""
		"이러나 저러나 난 동생 걱정 뿐이네.",
	},

	ANNOUNCE_DRUNK_END = "으, 좀 낫네. 다시 일하자고!", --술에서 좀 깸 (그로기) "Uh, much much better. Back to work!"
	ANNOUNCE_DRUNK_IMMUNITY = "only_used_by_wolfgang_and_wathgrithr", --임시. 위그 전용,
	ANNOUNCE_NOTCHARGE = "흠... 어떻게 하면 젖이 나오려나.", --번개염소가 충전이 안되서 양동이로 젖을 짤수 없음
	ANNOUNCE_NOTHIRSTSLEEP = "물 마시고 자야겠어.", -- 목이 마른데 밤에 잘려고 시도
	ANNOUNCE_NOTHIRSTSIESTA = "일단 물부터 마셔야겠어.", -- 목이 마른데 낮에 잘려고 시도
	ANNOUNCE_SLEEP_END = "으, 적당히 좀 마셔야지 원.", --자고 일어나서 술에서 완전히 깸 
	ANNOUNCE_THIRST = "수분 보충 좀 할 시간이야.", --너무 목말라!

    ANNOUNCE_CAFFINE_BUFF_START = "더 열심히, 더 빠르게 일해보자고!", -- 카페인 버프 시작. "Let's work it harder and faster!"
    ANNOUNCE_CAFFINE_BUFF_STOP = "커피빨이 떨어졌어." ,  -- 카페인 버프 끝 "Now I'm de-caffeinated."

    ANNOUNCE_SATIETY_BUFF_START = "" , -- 포만감 버프 시작
    ANNOUNCE_SATIETY_BUFF_STOP = "" ,  -- 포만감 버프 끝
    
    ANNOUNCE_CURE_WATERBORNE = "휴, 이제야 속이 좀 편하네." ,  -- 수인성 질병을 아이템으로 치료했을때의 대사

	ANNOUNCE_DCAPACITY_CRITICAL = "으, 이제 그만 마셔야 하나...", --취하기 직전
	ANNOUNCE_DCAPACITY_HALF = "술은 적당히 마셔야지.", -- 취기가 돌기 시작

	DESCRIBE =
	{
		BOILBOOK_BASIC = "온갖 마실거리를 만드는 방법이 적혀 있어.",
		BOILBOOK_ADVANCED = "온갖 마실거리를 만드는 방법이 적혀 있어.",

		WATER_CLEAN_ICE = "이거 씹어 먹어야 하나?",--깨끗한 얼음물
		WATER_DIRTY_ICE = "먼지 섞인 얼음이네.", --더러운 얼음물

		SPICE_CAFFEINPEPPER = "바베큐에 뿌리면 딱이겠는데.", --후추 향신료
		SPICE_RUINCOLATE_SPREAD = "",

		WELL_KIT = "어디 힘 좀 써 보자고.", --우물 키트
		WELL_SPRINKLER_KIT = "꽤 정교하게 잘 만들었어.", --스프링클러 키트
		WELL_WATERPUMP_KIT = "배터리의 출력만으로는 부족했어.", --스팀 물펌프 키트
		WELL_BURYING_KIT = "구덩이를 아무렇게나 두면 안 되지.", -- 구멍 매설 키트
		WELL_DRILLING = "다들 돌 튀는 거 조심!", --드릴로 구멍 뚫는 중
		WELL_DRILLING_ITEM = "굴착 좀 해 보자고!", --드릴 아이템
		HOLE = "지하수와 연결된 구멍이야.", --우물 구멍
		WELL = "뭔가 보완할 점이 보이는데.", --우물
		BOTTLE_POUCH_SMALL = "",
		BOTTLE_POUCH_BIG = "",
		THERMOS_BOTTLE_SMALL = "",
		THERMOS_BOTTLE_BIG = "",
		WINE_CELLAR_PART = "",
		WINE_CELLAR = "",

		WX78MODULE_NONEDRUNK = "이 자식 물건 좀 잘 챙겨두면 어디 덧나나.", -- 78전용 묘듈
		PURIFICATION_TABLETS = "주전자를 쓰는 게 더 났겠네.", -- 정화제

		-- 물 모드 식물

		TEA_TREE = "나무 참 작고 예쁘네.",--차나무
		DUG_TEA_TREE = "난 손 더럽히는 일이 좋아.", --땅에서 파낸 차나무
		TEA_SEED = "심으면 나무가 알아서 지어지지.", -- 차나무 열매
		TEA_SEED_COOKED = "먹을 수는 있게 생겼네.", --구운 차나무 열매
		TEA_SEED_SAPLING = "이 나무는 아직 만들어지는 중이야.", --차나무 새싹
		TEALEAVES = "이거 향이 괜찮은데.", --찻잎
		TEALEAVES_DRIED = "뜨거운 물만 좀 있으면 되겠어.", --말린 찻잎

		CAFFEINBERRY = "커피콩이 열리잖아! 세상에!", --커피 덤불
		DUG_CAFFEINBERRY = "일단 땅에 다시 심어야겠어.", --파낸 커피덤불
		CAFFEINBERRY_BEAN = "흠, 여기다 무슨 공정을 더해야 하지?", --생 커피콩
		CAFFEINBERRY_BEAN_COOKED = "아, 난 아침에 맡는 커피 냄새가 좋아!", --구운 커피콩

		RUINCACAO_TREE = "가지가 뭔가 비정상적인데.", --카카오 나무
		DUG_RUINCACAO_TREE = "아무리 봐도 이상하게 생겼어.", --파낸 카카오 나무
		RUINCACAO_SEED = "허, 벌써 싹이 나 있었네.", --카카오 새싹 아이템
		RUINCACAO_SEED_SAPLING = "지금 보니 좀 오싹하네.", -- 카카오 새싹 심은거
		RUINCACAO = "열매보다는 거의 목탄 덩어리 같은데.", --부수기 전 카카오 열매
		RUINCACAO_BEAN = "향은 좋은데 완전 기름 덩어리네.", --부순 후 카카오 콩  
		RUINCACAO_BEAN_COOKED = "뭐, 쓴맛 덕에 잠 깨는 데에는 좋겠네.", --구운 카카오 콩

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

		--mentha_spicata

		WEED_MENTHA_SPICATA = "",
		MENTHA_SPICATA = "",

		--citroyuzu
		CITROYUZU = "",
		CITROYUZU_COOKED = "",
		CITROYUZU_SEEDS = "",
		CITROYUZU_OVERSIZED = "",

		-- 증류주 첨가제

		ADDITIVE_SEED = "씨앗을 이것저것 다 모아놨네.", -- 리큐르에 제조에 첨가 할 씨허브(아니스,쥬니퍼베리,팔각 모티브)첨가제 
		ADDITIVE_PETALS = "풀잎이랑 꽃잎 뭉치들이야.", -- 리큐르에 제조에 첨가 할 허브,녹차,꽃잎 첨가제
		ADDITIVE_NUT = "뭔가 새로 개발한 산행 스낵 같은 건가?", -- 리큐르에 제조에 첨가 할 버치넛,코코넛,커피콩,카카오콩 첨가제
		ADDITIVE_DAIRY = "그냥 우유 크림이잖아.", -- 리큐르에 제조에 첨가할 유제품 첨가제

		-- 음료

		WATER_CLEAN = "깨끗한 물 한 잔이 이렇게 소중할 줄이야.", --깨끗한 물
		WATER_DIRTY = "아무리 급해도 그냥 마실 수는 없지.", --더러운 물
		WATER_SALTY = "워우, 이거 사람을 염장고기로 만들 판인데.", --바닷물

		GOOPYDRINK = "웩.", --실패한 음료(웻 굽 개념)
		
		-- 주전자 음료

		FRUITJUICE = "이것저것 많이 들어갔네.", --잡 과일쥬스
		BERRIES_JUICE = "손에 과즙 묻힐 일은 없겠어.", -- 베리 쥬스
		POMEGRANATE_JUICE = "잘됐네, 그 과일 깨끗하게 먹기 힘들었거든.", -- 석류 쥬스
		BANANA_JUICE = "따뜻한 바나나 주스라니 별론데...", -- 바나나 쥬스
		FIG_JUICE = "식감이 독특하네.", -- 무화과 쥬스
		DRAGONJUICE = "고오급 쥬스네.", --용과 쥬스
		GLOWBERRYJUICE = "이렇게 보니까 뭔가 음료가 아니라 화공약품 같아.", -- 발광베리 쥬스
		WATERMELON_JUICE = "시원하니 좋네.", --수박 쥬스

		VEGGIE_TEA = "원기 보충은 되겠네.", --녹즙
		CARROT_TEA = "마침 눈이 침침했는데 잘됬어.", --당근차
		CACTUS_TEA = "마시다 목에 가시 걸릴 일은 없겠지?", --선인차
		TOMATO_JUICE = "굳이 찾아 마시진 않았는데 괜찮네.", --토마토 쥬스
		LUMPY_TEA = "생각보다 나쁘지 않네, 괜찮아.", --뿌리차
		SEAWEED_SHAKE = "어... 변비에 좋을 것 같네.", --해초 쉐이크
		
		GREENTEA = "은은하게 향이 좋네.", --생잎 녹차
		BLACKTEA = "싫어하는 건 아닌데, 커피가 있으면 커피를 마시는 편이야.", --홍차
		BLACKTEA_ICED = "여름날엔 이거만한 게 없지!", -- 홍차 아이스티
		FUER = "뭔가 너무 고상한 느낌인데.", --보이차,이파리차,고사리차
		MIXFLOWER = "감기 걸렸을 때 마시면 괜찮겠네.", --잡 꽃잎 차
		HIBISCUSTEA = "어우, 레몬도 없는데 어쩜 이렇게 시큼하지?", --히비스커스 차
		CACTUSFLOWER_TEA = "요즘은 꽃차가 유행인가 보네.", --선인꽃차
		LOTUSTEA = "꽤 이국적인걸.", --연꽃차
		SUSHIBISCUS = "뭐 이런 차가 다 있담?", -- 자살차
		MOON_BLOSSOM_TEA = "후! 정신이 번쩍 드네.", --달꽃차
		MENTHA_SPICATA_TEA = "좋아, 정신이 맑아졌어!", -- 박하차

		CAFFEINBERRY_JUICE = "야근 뛸 때 자주 달고 살았지.", -- 블랙 커피
        TOFFEE_LATTE = "난 커피는 블랙 커피가 좋은데.", --토피넛 라떼
		RUINCHA_LATTE = "커피도 좋고 초콜릿도 좋다고 다 때려넣었구만.", --모카 라떼(커피+초코)
		
		HOTRUINCOLATE = "포근한걸.", --핫초코
		RUINCOLATE_SMOOTHIE = "애들은 되게 좋아할 것 같은 맛인데.", --초코 스무디(차가움)
		RUINXOCOLATL = "음료에서 무슨 연기 냄새가 난담?", --쇼콜라틀(매캐함)
		TEA_RUINCOLATE_LATTE = "이게 뭐야? 밀크티도 아니고 초콜릿도 아니잖아.", -- 말차 초코 라떼

		MULLED = "내가 한 방이 있는 여자는 아니지만... 한 잔은 좋아한다고! 하!", --뱅쇼
		BUTTERBEER = "맥주라면서 술 맛은 하나도 안 나네.", --해리포터 시리즈의 버터비어

		APPLEPINE_JUICE = "통조림에 든 국물보다는 확실히 낫네.",
		APPLEPINE_SMOOTHIE = "",
		APPLEPINE_CAPPUCCINO = "",

		CITROYUZU_JUICE = "탕비실 냉장고에 항상 있더라.",
		CITROYUZU_TEA = "",
		EARLGREY_TEA = "",

		-- 콜라보 주전자 음료

		COCONUT_JUICE = "달고 시원하네.", --난파선 코코넛 쥬스
		RAINBOW_SHAKE = "무지개는 무슨 맛이 나려나.", --난파선 무지개 해파리 쉐이크
		QUARTZ_SHAKE = "이건 생선국이잖아.", --난파선 광대 물고기 쉐이크
		NETTLE_TEA = "",
		FRASH_BRAMBLE_TEA = "",
		TUBER_BLOOM_TEA = "",
		CHERRY_ROSEBERRIES_TEA = "신맛이 뭔가 중독성 있는데.", --체리숲 로즈힙 차
		CHERRY_HONEY_TEA = "목 아플 때 마시면 딱이겠어.", --체리숲 벚꽃꿀 차
		SWEET_RICE_DRINK = "달달하니 괜찮네.", -- 비타협 식혜
		STRAWBERRY_SMOOTHIE = "음, 이거 꽤 괜찮은데!", -- 모어 푸드 팩 딸기 스무디
		STRAWBERRY_MILK_SMOOTHIE = "달달한 게 맛있네!", -- 모어 푸드 팩 딸기 스무디 라떼

		--양조기 음료

		SPOILED_DRINK = "공업용수로도 부적합해.", --썩은 음료

		-- 양조소다
	
		SODA = "그냥 탄산만 들었잖아.", -- 탄산수
		FRUITSODA = "레모네이드 대신이라고 생각하면 괜찮아.", -- 과일소다
		LIMONSODA = "이빨 썩겠는데.", -- 허니소다(과일소다 상위 호환)
		COLA = "마시려고 보면 꼭 누가 다 마시고 없더라.", -- 콜라
		COLAQUANTUM = "워, 이거 마셔도 안전한 거야?", --콜라 퀀텀
		LUMPY_BEER = "꽤 맛있는데 다들 맛을 모른단 말이지.", --루트비어(술이 아님)
		APPLEPINESODA = "이러면 입천장 아플 일은 없겠지.", -- 탄산 파인애플(오란씨)
		CITROYUZUSODA = "새콤달콤하니 맛있어.", -- 탄산 오랜지(환타)
		DAWN_FOG = "",
		MOON_CAP_DRINK = "",

		-- 양조주

		CORN_BEER = "일과 마치고 한 잔 하면 딱이야!", -- 콘 맥주
		MADHU = "그래, 빨간 머리의 누군가가 좋아하겠는데.", --벌꿀주
		WINE = "빈티지니 뭐니 따지는 건 난 복잡해서 싫어.", --와인 (그냥 베리 양조)
		NOBLEWINE = "찰리는 아주 좋아할 것 같네.", --노블 와인(구운 베리 양조)
		SPARKLINGWINE = "그래, 진수식에는 역시 샴페인이지!", --스파클링 와인
		GLOWBERRYWINE = "이런 게 술 빚기의 낭만인가?", --글로우 베리 와인
		KUMIS = "우유로 술을 담그는 건 처음이네.", -- 크므즈,산양유주
		LUMPY_WINE = "맛이 꽤 상쾌해.", --서주(감자 고구마등 뿌리 술)
		PULQUE = "선인장도 술이 될 수 있다니 신기하네.", --풀케(선인주)
		RUINCACAO_WINE = "정말 별 걸 가지고 술이 담가지는구나.", -- 카카오 와인 
		MIDNIGHT_STORM = "",
		APPLEPINE_CIDER = "",
		MENTHA_SPICATA_WINE = "",

		-- 콜라보 소다

		CHERRY_DOCTOR_COLA = "흠, 콜라는 아닌데.", --체리숲 닥터 페퍼(닥터 체리)
		STRAWBERRYSODA = "뭐, 레모네이드에서 레몬 대신 딸기를 넣었구만.", -- 탄산 딸기(웰치스 딸기)

		--콜라보 양조주

		AUROBOW = "색은 예쁜데 재료가 거시기하네.", -- 난파선 오로보우,무지개 해파리주
		COCONUT_WINE = "야자 열매 술이야.", -- 난파선 코코넛 와인
		NETTLE_WINE = "",
		CHERRY_BLOOM_MADHU = "적어도 풀은 아니게 됐네.", -- 체리숲 벚꽃꿀주 (포밍레인: 위노나가 체리꿀을 조사할떄 '이게 꿀인지 '풀 = glue'인지 확실하지 않네'' 라고 하는 대사가 있습니다.)
		GIANT_BLUEBERRY_WINE = "일단 과일이면 술로 못 만들 것도 없지.", -- 비타협 붐베리 와인 (불 붙히면 폭발함)
		RICE_WINE = "술이 좀 탁하네.", -- 비타협 막걸리
		WHEAT_BEER = "작업 끝나면 한 잔 걸쳐야지!", -- 힙 오브 푸드 밀맥주
		PALE_BEER = "뭐, 맥주는 맥주인 것 같네.", -- 레기온 페일에일 (몬스트라 열매를 쓴 청록색 맥주)

		--증류주

		DISINFECTANT = "하나씩들 비상용으로 가지고 있어야지.", -- 소독약
		CORN_WHISKEY = "마실 때는 한 잔 쭉 들이키라고.", -- 콘 위스키
		LUMPY_VODKA = "추운 날에 한 모금 하면 끝장나겠는데.", -- 보드카
		TEQUILA = "되게 거친 맛이 나네!", -- 데킬라
		MADHU_RUM = "아니 이게 또 뭐럼? 하!", -- 럼주 "What's rum with ya? Ha!"
		BERRY_BRANDY = "뭔가 엄청나게 고급진 술인갑네.", -- 베리 브랜디
		AREUHI = "이건 또 난생 처음 보는 술이네.", -- 크므즈 증류주 아르히
		APPLEPINE_BRANDY = "",
		VOID_BRANDY = "",
		VOID_GIN  = "",
		CITROYUZU_CURACAO = "",
		MENTHA_SPICATA_CURACAO = "",

		--왈리 전용 증류주

		BERRY_GIN = "사람 망가지기 딱 좋은 물건이야.", --진
		GLOWBERRY_GIN = "전기도 없이 어떻게 빛이 나는 거지?", --글로우 베리 진
		ABSINTHE = "좀 졸부들 취향이긴 한데, 녹색 빛이 예쁘네.", -- 압생트 "A little bit snooty, but it has beautiful green color."
		TEA_LUMPY_VODKA = "따로따로 먹는 게 낫지 않나?", -- 녹차 리큐르
		PETALS_BERRY_BRANDY = "꽤나 사치스런 술 같네.", -- 장미향 브랜디
		KAHLUA = "아무래도 술이랑 커피는 따로 마시는 게 낫겠어.", -- 커피 리큐르 깔루아
		NUT_CORN_WHISKEY = "향이 납처럼 묵직한데.", -- 너트 위스키
        RUINCACAO_CREAM_LIQUEUR = "이런 달달한 술도 다 있네, 허!", --베일리스 카카오 크림 리큐르
        RUMCHATA = "그래, 어른들을 위한 우유 같은 건가?", -- 럼차타(럼에 오우차타 라는 유제품 섞은)

		--콜라보 증류주

		MOONWAY = "뭔가 휘발유 대용으로 써도 될 것 같은데.", -- 무지개 해파리주 증류주
		NETTLE_LIQUEUR = "",
		ARRACK = "야자 단내가 나.", -- 아락 인도네시아 버전 코코넛 와인 증류주
		CHERRY_BLOOM_RUM = "뭔가 싸구려 기념품 같은 술이네.", -- 체리 꿀주 증류주 벛꽃잎 떠다
		RICE_SPIRITS = "이제 꽤 맑네!", --청주
		WHEAT_WHISKEY = "일할 때는 술 금지야.", -- 밀 위스크
		PALE_WHISKEY = "어우, 이거 술이 잘못된 거 아니야?", -- 페일 몰트 위스키

		--왈리 전용 콜라보 증류주

		NUT_COCONUT_BRANDY = "거의 단내 농축액인데.", -- 코코넛 브랜디 (캐러비안 럼을 만들수 없어서 카리브 브랜디 라는 이름으로 대체)
	    GIANT_BLUEBERRY_GIN = "이 정도면 식용이 아니라 공업용 아냐?", -- 붐 베리 사파이어 (당근 폭발함)

		--냄비 요리

        DARK_RUINCOLATE = "적당히 달고 쌉쌀한 게 딱인데.", --다크 초콜릿.
        WHITE_RUINCOLATE = "어우, 이빨 썩겠네.", --화이트 초콜릿
        RUINCOLATE = "아, 초콜릿 좋지.", -- 그냥 초콜릿
        RUIN_SCHOKAKOLA = "녹지도 않고, 나눠서 먹기도 좋고, 기운도 나지!", -- 쇼카콜라
        APPLEPINE_PIE = "",
        APPLEPINE_FRIED_RICE = "",
        CITROYUZU_BBQ = "",

		BUCKET_STEEL_EMPTY = 
		{
			EMPTY = "튼튼하게 잘 만들었네.", --빈 양철 양동이
			FULL = "빗물이 고였네.", -- 깨끗한 빗물이 참
			FULL_ICE = "이거 꺼내려면 고생 좀 하겠는데.", -- 빗물이 얼어버림
			DIRTY = "무슨 걸레 빤 물 같네.", --빗물이 더러워짐
			DIRTY_ICE = "허드렛물은 제때 좀 버리라고.", --더러운 빗물이 얼어버림
		},

		BUCKET_WOODIE_EMPTY = 
		{
			EMPTY = "내구성은... 글쎄, 솔직히 잘 모르겠네.", --우디의 빈 나무 양동이
			FULL = "빗물이 고였네.", -- 깨끗한 빗물이 참
			FULL_ICE = "이거 꺼내려면 고생 좀 하겠는데.", -- 빗물이 얼어버림
			DIRTY = "무슨 걸레 빤 물 같네.", --빗물이 더러워짐
			DIRTY_ICE = "허드렛물은 제때 좀 버리라고.", --더러운 빗물이 얼어버림
		},

		BUCKET_DRIFTWOOD_EMPTY = 
		{
			EMPTY = "물에서 짠맛이 나지는 않겠지.", -- 유목양동이
			FULL = "빗물이 고였네.", -- 깨끗한 빗물이 참
			FULL_ICE = "이거 꺼내려면 고생 좀 하겠는데.", -- 빗물이 얼어버림
			DIRTY = "무슨 걸레 빤 물 같네.", --빗물이 더러워짐
			DIRTY_ICE = "허드렛물은 제때 좀 버리라고.", --더러운 빗물이 얼어버림
		},

		BUCKET_EMPTY = 
		{
			EMPTY = "뭘 좀 담아볼까.", -- 빈 나무 양동이
			FULL = "빗물이 고였네.", -- 깨끗한 빗물이 참
			FULL_ICE = "이거 꺼내려면 고생 좀 하겠는데.", -- 빗물이 얼어버림
			DIRTY = "무슨 걸레 빤 물 같네.", --빗물이 더러워짐
			DIRTY_ICE = "허드렛물은 제때 좀 버리라고.", --더러운 빗물이 얼어버림
		},

		DESALINATOR =
		{
			EMPTY = "꽤 심혈을 기울여서 만들었다고.", --제염기에 물이 없음
			PURIFY_LONG = "아무리 그래도 바로 되진 않겠지.", -- 정수 끝나기까지 많이 남음
			PURIFY_SHORT = "조금만 더 있으면 되겠어!", -- 정수가 곧 끝남
			HASWATER = "100% 마실 수 있는 물이라고.", --제염기에 깨끗한 물이 있음
			BURNT = "이건 좀 열받네.",   --제염기가 타버림
			HASSALT = "필터에 소금이 꽉 찼네.", --제염기에 소금이 남아 있음
		},

		BARREL =
		{
			GENERIC = "가끔은 전통에서 배워야 하는구나 싶어.", -- 물통 조사 대사
			BURNT = "괜찮아, 하나 더 만들지 뭐.", -- 물통이 타버림
		},

		BREWERY =
		{
			EMPTY = "이래뵈도 꽤 엄선된 나무로 만들었다고!", --양조기 조사 대사
			BURNT = "아무리 나라도 이건 못 참겠다.", --양조기 타버림
			FERMENTING_LONG = "근데 이거 얼마나 오래 걸리는 거지?", --양조 끝나기 까지 많이 남음
			FERMENTING_SHORT = "거의 다 되지 않았을까?", --양조가 곧 끝남
			DONE = "어디 한 모금 맛이나 볼까?", --양조기에 음료가 들어있음
		},

		CAMPKETTLE_ITEM = "수공예품치곤 괜찮네.", --휴대 주전자 아이템 조사 대사
		CAMPKETTLE =
		{
			GENERIC = "일단 물부터 가져와야겠네.", -- 화덕에 건 휴대 주전자 안에 물이 없음
			BOILING_LONG = "아직 제대로 끓지도 않았어.", -- 물 끓이기 시작함
			BOILING_SHORT = "팔팔 끓고 있네!", -- 물 거의 다 끓음
			DONE = "좋아, 이 정도 가열했으면 괜찮겠지.", --깨끗한 물이 들음
			STOP = "워, 아직은 마실 만한 상태가 아닌 것 같은데.", --화덕에 불이 없어서 더러운물이 끓지 않는 상태
		},

		CAMPDESALINATOR_ITEM = "이거 '휴대용'이라기에는 많이 무거운데.", --휴대 제염기 아이템 조사 대사
		CAMPDESALINATOR = 
		{
			GENERIC = "텅 빈 깡통이네.", --물 없음
			BOILING_LONG = "아직은 대부분 바닷물이야.", --물 끓이기 시작
			BOILING_SHORT = "민물이 많이 모였어!", --거의 다 끓음 
			DONE = "좋아, 마실 만한 상태네!", -- 깨끗한 물이 들음
			STOP = "땔감이 있어야 할 텐데.", -- 화덕에 불이 없어서 소금물이 정수 되지 않는 상태
		},

		TEA_POT =
		{
			EMPTY = "내가 커피 내리는 솜씨 하나는 기막힌데 말이야.", --빈 주전자 조사대사
			BURNT = "너무 진하게 우렸나?", --주전자가 불탐
			BOILING_LONG = "아직 더 기다려야 겠는걸.", -- 음료를 만들기 시작한지 얼마 안됨
			BOILING_SHORT = "거의 다 됐어.", --음료 조리가 거의 끝나감
			DONE = "한 잔 마시고들 하자고!", --음료가 완성됨
			PURIFY_LONG = "아직 제대로 끓지도 않았어.", -- 더러운 물을 끓이기 시작한지 얼마 안됨
			PURIFY_SHORT = "팔팔 끓고 있네!", --더러운물을 거의 다 끓여감
			HASWATER = "어디 보자, 커피가 있으면 좋겠는데.", -- 깨끗한 물이 차 있는 상태
			MELT_LONG = "아직 꽝꽝 얼어있어.", -- 얼음물을 녹이기 시작한지 얼마 안됨
			MELT_SHORT = "거의 녹아가네.", -- 얼음물을 거의 녹여감
		},

		PORTABLE_TEA_POT_ITEM =
		{
			GENERIC = "공장제 티포트랑 비교해도 손색 없어.", -- 휴대용 주전자(아이템) 조사 대사
			EMPTY = "물 한 방울 없네.", -- 설치한 빈 휴대용 주전자 조사 대사
			BOILING_LONG = "좋은 건 다 시간이 필요한 법이야.", -- 음료를 만들기 시작한지 얼마 안됨
			BOILING_SHORT = "눈 깜짝할 새면 다 되겠어!", --음료 조리가 거의 끝나감
			DONE = "그 난리를 친 보람이 있을지 보자고.", --음료가 완성됨
			PURIFY_LONG = "아직 미적지근해.", -- 더러운 물을 끓이기 시작한지 얼마 안됨
			PURIFY_SHORT = "소리를 보아하니 끓고 있네!", --더러운물을 거의 다 끓여감
			HASWATER = "좋아, 재료 들어간다.", -- 깨끗한 물이 차 있는 상태
			MELT_LONG = "온통 얼음이야.", -- 얼음물을 녹이기 시작한지 얼마 안됨
			MELT_SHORT = "얼음도 거의 다 녹였네.", -- 얼음물을 거의 녹여감
		},

		KETTLE =
		{
			EMPTY = "내가 커피 내리는 솜씨 하나는 기막힌데 말이야.", --빈 주전자 조사대사
			BURNT = "너무 진하게 우렸나?", --주전자가 불탐
			DONE = "한 잔 마시고들 하자고!", --음료가 완성됨
			PURIFY_LONG = "아직 제대로 끓지도 않았어.", -- 더러운 물을 끓이기 시작한지 얼마 안됨
			PURIFY_SHORT = "팔팔 끓고 있네!", --더러운물을 거의 다 끓여감
			HASWATER = "어디 보자, 커피가 있으면 좋겠는데.", -- 깨끗한 물이 차 있는 상태
			MELT_LONG = "아직 꽝꽝 얼어있어.", -- 얼음물을 녹이기 시작한지 얼마 안됨
			MELT_SHORT = "거의 녹아가네.", -- 얼음물을 거의 녹여감
		},

		PORTABLEKETTLE_ITEM =
		{
			GENERIC = "공장제 티포트랑 비교해도 손색 없어.", -- 휴대용 주전자(아이템) 조사 대사
			EMPTY = "물 한 방울 없네.", -- 설치한 빈 휴대용 주전자 조사 대사
			DONE = "그 난리를 친 보람이 있을지 보자고.", --음료가 완성됨
			PURIFY_LONG = "아직 미적지근해.", -- 더러운 물을 끓이기 시작한지 얼마 안됨
			PURIFY_SHORT = "소리를 보아하니 끓고 있네!", --더러운물을 거의 다 끓여감
			HASWATER = "좋아, 재료 들어간다.", -- 깨끗한 물이 차 있는 상태
			MELT_LONG = "온통 얼음이야.", -- 얼음물을 녹이기 시작한지 얼마 안됨
			MELT_SHORT = "얼음도 거의 다 녹였네.", -- 얼음물을 거의 녹여감
		},
		
		DISTILLERS =
		{   
		    EMPTY = "열과 압력을 버티도록 설계되었어.", --증류기 조사 대사
			DISTILLTING_LONG = "타이머가 거의 돌아가지도 않았군.", --증류가 끝나기 까지 많이 남음
			DISTILLING_SHORT = "끝나기까지 얼마 남지 않았어.", --증류가 곧 끝남
			DONE = "어디 한번 맛 좀 볼까?", --증류기에 음료가 들어있음
		},

		WELL_WATERPUMP = {
			HIGH_PRESSURE = "좋아, 압력은 아무 이상 없네.", -- 압력 최대
			MIDDLE_PRESSURE = "이 정도 압력이면 충분히 작동하겠어.", -- 압력이 중간
			LOW_PRESSURE = "압력이 너무 낮은 것 같은데.", -- 압력이 거의 없을때
			RECHARG_PRESSURE = "압력이 되돌아올 때까지 좀 걸리겠는걸.", -- 압력이 아예 없을때(여기까지 쓰면 압력이 최대가 될때까지 못씀.)
		},
		
		WELL_SPRINKLER =
		{ 
			LOWFUEL = "연료를 채워줘야 해.", -- 연료가 거의 없는 상태에서의 조사 대사
			ON = "내 장치를 전부 방수가 되게 만들어서 다행이야!", -- 작동중임
			OFF = "일정 부분은 '마법'으로 작동해.", --작동을 멈춘상태에서의 조사 대사
		},	
	},
}