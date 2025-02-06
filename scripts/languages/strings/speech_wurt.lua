return {
	ACTIONFAIL =
	{
		GIVE =
		{
			WELL_NOTEMPTY = "이미 바가지 달려있어, 뽀륵!", -- 우물에 말라 빈 양동이 달려있는데 양동이 달려 함
			WELL_BUSY = "바가지 구멍 안에 있어, 뽀륵!", -- 우물에 물 든 양동이 달려있는데 달려 함
		}
	},

	ANNOUNCE_DRUNK = "머리 아파... 열나는거 가타, 뽀르르륵..", -- 취함
	ANNOUNCE_DRUNK_MUMBLE = 
	{
		--대사 추가해야함
	},
	ANNOUNCE_DRUNK_END = "뽀륵! 어지러운거 좀 덜해.", --술에서 좀 깸 (그로기)
	ANNOUNCE_DRUNK_IMMUNITY = "", --임시. 위그 전용,
	ANNOUNCE_NOTCHARGE = "젖 안나와!", --번개염소가 충전이 안되서 양동이로 젖을 짤수 없음
	ANNOUNCE_NOTHIRSTSLEEP = "물 필요해, 그 다음에 코 잘래.", -- 목이 마른데 밤에 잘려고 시도
	ANNOUNCE_NOTHIRSTSIESTA = "물 필요해, 그 다음에 낮잠 잘래.", -- 목이 마른데 낮에 잘려고 시도
	ANNOUNCE_SLEEP_END = "뽀륵, 아픈거 나았어!", --자고 일어나서 술에서 완전히 깸 
	ANNOUNCE_THIRST = "물 마실래!", --너무 목말라!

    ANNOUNCE_CAFFINE_BUFF_START = "뛸래!" , -- 카페인 버프 시작
    ANNOUNCE_CAFFINE_BUFF_STOP = "더이상 뛸 기분 아니야." ,  -- 카페인 버프 끝

    ANNOUNCE_SATIETY_BUFF_START = "" , -- 포만감 버프 시작
    ANNOUNCE_SATIETY_BUFF_STOP = "" ,  -- 포만감 버프 끝
    
    ANNOUNCE_CURE_WATERBORNE = "아픈거 좀 나아졌어, 뽀륵." ,  -- 수인성 질병을 아이템으로 치료했을때의 대사

	ANNOUNCE_DCAPACITY_CRITICAL = "뽀륵, 왠지 어지러워!", --취하기 직전
	ANNOUNCE_DCAPACITY_HALF = "얼굴이 화끈거러, 뽀륵!", -- 취기가 돌기 시작

	DESCRIBE =
	{
		BOILBOOK_BASIC = "마시는거 잔뜩 그려져이써!", -- 음료 요리
		BOILBOOK_ADVANCED = "마시는거 잔뜩 그려져이써!",

		WATER_CLEAN_ICE = "흐드드, 엄청 차가워!",--깨끗한 얼음물
		WATER_DIRTY_ICE = "흐드드, 굳어버린 물이야!", --더러운 얼음물

		SPICE_CAFFEINPEPPER = "냄새 매워!", --후추 향신료

		WELL_KIT = "어인들 이런거 만드는거 본적없어.", --우물 키트
		WELL_SPRINKLER_KIT = "동그란거 한번 누르면 된데, 뽀륵.", --스프링클러 키트
		WELL_WATERPUMP_KIT = "만들기 어려워보여..", --스팀 물펌프 키트
		WELL_BURYING_KIT = "땅에 뚫은 구멍 막아!", -- 구멍 매설 키트
		WELL_DRILLING = "땅에 구멍내고 이써, 뽀륵.", --드릴로 구멍 뚫는 중
		WELL_DRILLING_ITEM = "땅에 구멍 왜 뚫어?", --드릴 아이템
		HOLE = "물 소리 나.", --우물 구멍
		WELL = "매끈이들 구멍에서 물 떠 마신대, 왜?", --우물
		BOTTLE_POUCH_SMALL = "",
		BOTTLE_POUCH_BIG = "",
		THERMOS_BOTTLE_SMALL = "",
		THERMOS_BOTTLE_BIG = "",
		WINE_CELLAR_PART = "",
		WINE_CELLAR = "",

		WX78MODULE_NONEDRUNK = "바스락거려.", -- 78전용 묘듈
		PURIFICATION_TABLETS = "깨끗해질 거야, 뽀륵.", -- 정화제

		-- 물 모드 식물

		TEA_TREE = "향나는 이파리 마나!",--차나무
		DUG_TEA_TREE = "너, 나랑가자, 뽀륵.", --땅에서 파낸 차나무
		TEA_SEED = "이파리 많은 나무 씨앗!", -- 차나무 열매
		TEA_SEED_COOKED = "맛업써..", --구운 차나무 열매
		TEA_SEED_SAPLING = "크게 자라라!", --차나무 새싹
		TEALEAVES = "향나는 이파리야,뽀륵.", --찻잎
		TEALEAVES_DRIED = "향 엄청나!", --말린 찻잎

		CAFFEINBERRY = "간식이 잔뜩 열려!", --커피 덤불
		DUG_CAFFEINBERRY = "너 좋은곳 찾을 거야.", --파낸 커피덤불
		CAFFEINBERRY_BEAN = "맛있는 간식이야!", --생 커피콩
		CAFFEINBERRY_BEAN_COOKED = "더이상 맛있지 않아..", --구운 커피콩

		RUINCACAO_TREE = "검은과일 그냥 먹음 맛업써.", --카카오 나무
		DUG_RUINCACAO_TREE = "너 좋은곳 찾을거야.", --파낸 카카오 나무
		RUINCACAO_SEED = "으스스해, 뽀륵.", --카카오 새싹 아이템
		RUINCACAO_SEED_SAPLING = "아직 과일 만들기엔 너무작아.", -- 카카오 새싹 심은거
		RUINCACAO = "아야! 너무 딱딱해!", --부수기 전 카카오 열매
		RUINCACAO_BEAN = "기름많아, 뽀륵.", --부순 후 카카오 콩  
		RUINCACAO_BEAN_COOKED = "아직 초콜릿 아니야!", --구운 카카오 콩

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

		-- 증류주 첨가제

		ADDITIVE_SEED = "흙에 안넣어? 뽀륵.", -- 리큐르에 제조에 첨가 할 씨허브(아니스,쥬니퍼베리,팔각 모티브)첨가제 
		ADDITIVE_PETALS = "이파리 모아놔써.", -- 리큐르에 제조에 첨가 할 허브,녹차,꽃잎 첨가제
		ADDITIVE_NUT = "간식 안먹어?", -- 리큐르에 제조에 첨가 할 버치넛,코코넛,커피콩,카카오콩 첨가제
		ADDITIVE_DAIRY = "우리집 흙 같은데 하얘!", -- 리큐르에 제조에 첨가할 유제품 첨가제

		-- 음료

		WATER_CLEAN = "물에서 아무냄새 안나!", --깨끗한 물
		WATER_DIRTY = "우리집 연못물이야!", --더러운 물
		WATER_SALTY = "큰 연못 물이야!", --바닷물

		GOOPYDRINK = "우리집 연못물이야?", --실패한 음료(웻 굽 개념)
		
		-- 주전자 음료

		FRUITJUICE = "과일 여러가지 맛이야!", --잡 과일쥬스
		BERRIES_JUICE = "덤불 과일주스!", -- 베리 쥬스
		POMEGRANATE_JUICE = "빨간과일 알맹이 잔뜩 씹혀, 뽀륵!", -- 석류 쥬스
		BANANA_JUICE = "따뜻해도 과일주스 맛있어!", -- 바나나 쥬스
		FIG_JUICE = "으으음, 쫄깃쫄깃 꿀꺽 꿀꺽", -- 무화과 쥬스
		DRAGONJUICE = "밍밍해, 뽀륵.", --용과 쥬스
		GLOWBERRYJUICE = "빛나는 주스야!!", -- 발광베리 쥬스
		WATERMELON_JUICE = "갈은 수박!", --수박 쥬스

		VEGGIE_TEA = "으음, 좋아!", --녹즙
		CARROT_TEA = "더 맛있어졌서!", --당근차
		CACTUS_TEA = "가시 없어? 좋아!", --선인차
		TOMATO_JUICE = "토마토 주스!", --토마토 쥬스
		LUMPY_TEA = "흙야채물 좋아해!", --뿌리차
		SEAWEED_SHAKE = "미끈미끈 물도 좋아!", --해초 쉐이크
		
		GREENTEA = "물 향기나!", --생잎 녹차
		BLACKTEA = "뜨거운물 향기로워!", --홍차
		BLACKTEA_ICED = "차가운물 향기로워!", -- 홍차 아이스티
		FUER = "동굴식물 빨간색됬어, 뽀륵!", --보이차,이파리차,고사리차
		MIXFLOWER = "못생긴꽃 들어갔어!", --잡 꽃잎 차
		HIBISCUSTEA = "히히, 빨간꽃 삶았어.", --히비스커스 차
		CACTUSFLOWER_TEA = "못생긴 꽃들어가서 달어, 뽀륵!", --선인꽃차
		LOTUSTEA = "매끈이들은 이 꽃물 예쁘데, 난 모르겠어, 뽀륵.", --연꽃차
		SUSHIBISCUS = "물에 엄청 못생긴꽃 들어가있어.", -- 자살차
		MOON_BLOSSOM_TEA = "이거 냄새 엄청 이상해.", --달꽃차
		MENTHA_SPICATA_TEA = "시원하고 흙처럼 포근해!", -- 박하차

		CAFFEINBERRY_JUICE = "써..맛업써.", -- 블랙 커피
        TOFFEE_LATTE = "으으음! 고소해, 달아!", --토피넛 라떼
		RUINCHA_LATTE = "완전, 완벽해, 쪼아!", --모카 라떼(커피+초코)
		
		HOTRUINCOLATE = "엄청, 마시꼬, 따뜻해!", --핫초코
		RUINCOLATE_SMOOTHIE = "흐드드, 마시써서 머리아파!", --초코 스무디(차가움)
		RUINXOCOLATL = "캙록! 이거 너무 써!", --쇼콜라틀(매캐함)
		TEA_RUINCOLATE_LATTE = "풀냄새 나고 마시써!", -- 말차 라떼

		MULLED = "으으음, 따끈하고 나른해져!", --뱅쇼
		BUTTERBEER = "벌레맛 안나고 엄청 달아!", --해리포터 시리즈의 버터비어

		APPLEPINE_JUICE = "시큼한 과일 물에 넣어서 덜시고 더 달아, 뽀륵.",
		APPLEPINE_SMOOTHIE = "",
		APPLEPINE_CAPPUCCINO = "",

		CITROYUZU_JUICE = "과즙팡팡 상큼해, 뽀륵!",
		CITROYUZU_TEA = "",
		EARLGREY_TEA = "",

		-- 콜라보 주전자 음료

		COCONUT_JUICE = "과일 몰캉몰캉졌어, 뽀륵!", --난파선 코코넛 쥬스
		RAINBOW_SHAKE = "그롸악!!", --난파선 무지개 해파리 쉐이크
		QUARTZ_SHAKE = "너무 끔찍해!!", --난파선 광대 물고기 쉐이크
		NETTLE_TEA = "",
		FRASH_BRAMBLE_TEA = "",
		TUBER_BLOOM_TEA = "",
		CHERRY_ROSEBERRIES_TEA = "못생긴열매 머리카락 없지?", --체리숲 로즈힙 차
		CHERRY_HONEY_TEA = "예쁜벌꿀 꿀 탄물 마시면 몸 따듯해져!", --체리숲 벚꽃꿀 차
		SWEET_RICE_DRINK = "어인들 이런식으로 간식 안만들어.", -- 비타협 식혜
		STRAWBERRY_SMOOTHIE = "흐드드, 빨간과즙 얼은거 갈았어!", -- 모어 푸드 팩 딸기 스무디
		STRAWBERRY_MILK_SMOOTHIE = "흐드드드, 부드러워!", -- 모어 푸드 팩 딸기 스무디 라떼

		--양조기 음료

		SPOILED_DRINK = "이거 아직 마셔도 괜찮나?", --썩은 음료

		-- 양조소다
	
		SODA = "물 이상해, 톡 톡 하고있어.", -- 탄산수
		FRUITSODA = "과즙 맛나는데 톡 톡이 방해해.", -- 과일소다
		LIMONSODA = "달고 맛있는데 이상해!", -- 레몬 라임소다(과일소다 상위 호환)
		COLA = "이거 엄청 맛나, 굉장해 뽀륵!", -- 콜라
		COLAQUANTUM = "반짝반짝하고 소리 나, 뽀륵!", --콜라 퀀텀
		LUMPY_BEER = "약맛 나는데 달고 톡 톡 해.", --루트비어(술이 아님)
		APPLEPINESODA = "톡 톡 하는 시큼한 과일물!", -- 탄산 파인애플(오란씨)
		CITROYUZUSODA = "뽀륵, 상큼하고 시원해!", -- 탄산 오랜지(환타)
		DAWN_FOG = "",
		MOON_CAP_DRINK = "",

		-- 양조주

		CORN_BEER = "거품머리 하고있어, 뽀륵.", -- 콘 맥주
		MADHU = "바이킹여자가 이거 엄청찾아.", --벌꿀주
		WINE = "뽀르륵... 빨간데 이상해, 안 달아.", --와인 (그냥 베리 양조)
		NOBLEWINE = "덤불간식 상해서 하얀술, 만들어?", --노블 와인(구운 베리 양조)
		SPARKLINGWINE = "위커 아줌마가 흔들지 말랬어.", --스파클링 와인
		GLOWBERRYWINE = "빛나는열매 술 말고 주스 줘.", --글로우 베리 와인
		KUMIS = "찌르르한우유 상했어?", -- 크므즈,산양유주
		LUMPY_WINE = "이 흙야채물 머리 아픈 냄새나.", --서주(감자 고구마등 뿌리 술)
		PULQUE = "가시많은식물 짜서 '바료' 시켰데!", --풀케(선인주)
		RUINCACAO_WINE = "검은과일 더 이상한맛 되었어.", -- 카카오 와인 
		MIDNIGHT_STORM = "",
		APPLEPINE_CIDER = "",
		MENTHA_SPICATA_WINE = "",

		-- 콜라보 소다

		CHERRY_DOCTOR_COLA = "검은물 톡 톡 하고 붉은 과즙맛 나!", --체리숲 닥터 페퍼(닥터 체리)
		STRAWBERRYSODA = "톡 톡 하는 붉은과일 물이야, 뽀륵.", -- 탄산 딸기(웰치스 딸기)

		--콜라보 양조주

		AUROBOW = "예쁜 물고기... 어쨰서?", -- 난파선 오로보우,무지개 해파리주
		COCONUT_WINE = "술에서 물 든 과일 물냄새 나.", -- 난파선 코코넛 와인
		NETTLE_WINE = "",
		CHERRY_BLOOM_MADHU = "예쁜벌꿀 꿀로 술 만들었어?", -- 체리숲 벚꽃꿀주
		GIANT_BLUEBERRY_WINE = "불 붙히면 터진데.", -- 비타협 붐!베리 사파이어(불 붙히면 폭발함)
		RICE_WINE = "늪 간식 술 됬어...", -- 비타협 막걸리
		WHEAT_BEER = "거품머리 하고있어, 뽀륵.", -- 힙 오브 푸드 밀맥주
		PALE_BEER = "늪지대 열매 술 만든거 처음봐.", -- 레기온 페일에일 (몬스트라 열매를 쓴 청록색 맥주)

		--증류주

		DISINFECTANT = "이 물 차갑고 빨리 사라져.", -- 소독약
		CORN_WHISKEY = "향이 독해, 뽀륵.", -- 콘 위스키
		LUMPY_VODKA = "이거 물 아니야, 뽀륵!", -- 보드카
		TEQUILA = "술이 가시많은식물 성격 닮았어!", -- 데킬라
		MADHU_RUM = "매끈이들 배 탈때 물에 섞었데, 왜?", -- 럼주
		BERRY_BRANDY = "내 덤불간식은 어딨어, 뽀륵?", -- 베리 브랜디
		AREUHI = "우유 어디갔어?", -- 크므즈 증류주 아르히
		APPLEPINE_BRANDY = "",
		VOID_GIN = "",
		CITROYUZU_CURACAO = "",
		MENTHA_SPICATA_CURACAO = "",

		--왈리 전용 증류주

		BERRY_GIN = "이건 향이 더 독해, 뽀륵.", --진
		GLOWBERRY_GIN = "빛나는열매술말고 주스 줘.", --글로우 베리 진
		ABSINTHE = "삼녹색인데 냄새 독해!", -- 압생트
		TEA_LUMPY_VODKA = "이파리 술 넣지 말고 그냥 먹으면 안되?", -- 녹차 리큐르
		PETALS_BERRY_BRANDY = "못생긴 꽃 냄새가 독하기도 해, 뽀륵.", -- 장미향 브랜디
		KAHLUA = "콩간식 술에 넣으면 나 못먹어, 뽀륵..", -- 커피 리큐르 깔루아
		NUT_CORN_WHISKEY = "간식들 술 말고 나 줬으면 좋겠어, 뽀륵.", -- 너트 위스키
        RUINCACAO_CREAM_LIQUEUR = "우와아...맛있는 간식 냄새..", --베일리스 카카오 크림 리큐르
        RUMCHATA = "우유에 왜 술 섞어?", -- 럼차타(럼에 오우차타 라는 유제품 섞은)

		--콜라보 증류주

		MOONWAY = "......", -- 무지개 해파리주 증류주
		NETTLE_LIQUEUR = "",
		ARRACK = "난 이거 말고 물 든 과일 그대로 먹을래.", -- 아락 인도네시아 버전 코코넛 와인 증류주
		CHERRY_BLOOM_RUM = "못생긴 꽃들 춤추고 있어, 뽀륵!", -- 체리 꿀주 증류주
		RICE_SPIRITS = "물 같은데 냄새 독해!", --청주
		WHEAT_WHISKEY = "풀 간식은 이거 말고 빵 만들어서 줘, 뽀륵!", -- 밀 위스키
		PALE_WHISKEY = "나 이거 말고 늪지가서 열매 따 먹을래.", -- 페일 몰트 위스키

		--왈리 전용 콜라보 증류주

		NUT_COCONUT_BRANDY = "물 든 과일냄새 진한데 독해!", -- 코코넛 브랜디 (캐러비안 럼을 만들수 없어서 카리브 브랜디 라는 이름으로 대체)
	    GIANT_BLUEBERRY_GIN = "콰과광!", -- 붐 베리 사파이어 (당근 폭발함)

		--냄비 요리

        DARK_RUINCOLATE = "요리하는 남자 간식 이상한거줬어..", --다크 초콜릿.
        WHITE_RUINCOLATE = "얌! 얌!", --화이트 초콜릿
        RUINCOLATE = "씹으면 찐득찐득 달콤해!", -- 그냥 초콜릿
        RUIN_SCHOKAKOLA = "맛있는데 너무 많이먹으면 못 자!", -- 쇼카콜라
        APPLEPINE_PIE = "",
        APPLEPINE_FRIED_RICE = "",
        CITROYUZU_BBQ = "",

		BUCKET_STEEL_EMPTY = 
		{
			EMPTY = "딴딴한 바가지!", --빈 양철 양동이
			FULL = "빗물 가득!", -- 깨끗한 빗물이 참
			FULL_ICE = "흐드드, 만지기 싫어.", -- 빗물이 얼어버림
			DIRTY = "엄청 작은 연못 되었어, 뽀륵!", --빗물이 더러워짐
			DIRTY_ICE = "흐드드, 작은연못 얼었어.", --더러운 빗물이 얼어버림
		},

		BUCKET_WOODIE_EMPTY = 
		{
			EMPTY = "나무베는 사람이 뒤집어서 앉지말래.", --우디의 빈 나무 양동이
			FULL = "빗물 가득!",  --깨끗한 빗물이 참
			FULL_ICE = "흐드드, 만지기 싫어.", --빗물이 얼어버림
			DIRTY = "엄청 작은 연못 되었어, 뽀륵!", --빗물이 더러워짐
			DIRTY_ICE = "흐드드, 작은연못 얼었어.", --더러운 빗물 얼어버림
		},

		BUCKET_DRIFTWOOD_EMPTY = 
		{
			EMPTY = "물에 뜨는 바가지야.", -- 빈 나무 양동이
			FULL = "빗물 가득!", -- 깨끗한 빗물이 참
			FULL_ICE = "흐드드, 만지기 싫어.", --빗물이 얼어버림
			DIRTY = "엄청 작은 연못 되었어, 뽀륵!", --빗물이 더러워짐
			DIRTY_ICE = "흐드드, 작은연못 얼었어.", --더러운 빗물 얼어버림
		},

		BUCKET_EMPTY = 
		{
			EMPTY = "바가지야, 뽀륵.", -- 빈 나무 양동이
			FULL = "빗물 가득!", -- 깨끗한 빗물이 참
			FULL_ICE = "흐드드, 만지기 싫어.", --빗물이 얼어버림
			DIRTY = "엄청 작은 연못 되었어, 뽀륵!", --빗물이 더러워짐
			DIRTY_ICE = "흐드드, 작은연못 얼었어.", --더러운 빗물 얼어버림
		},

		DESALINATOR =
		{
			EMPTY = "엄청큰 연못물 마실수 있게 만든대!", --제염기에 물이 없음
			PURIFY_LONG = "빙글 빙글 쪼로록!", -- 정수 끝나기까지 많이 남음
			PURIFY_SHORT = "곧 마실수있는 물 되, 뽀륵!", -- 정수가 곧 끝남
			HASWATER = "물 이제 안 짜!", --제염기에 깨끗한 물이 있음
			BURNT = "나 아니야, 뽀륵!",   --제염기가 타버림
			HASSALT = "짠 돌 너무많아서 소용없어, 뽀륵.", --제염기에 소금이 남아 있음
		},

		BARREL =
		{
			GENERIC = "위커아줌마에 이거에 물고기 키우지말라고 혼났어..", -- 물통 조사 대사
			BURNT = "물 들어 있는데 왜 불 붙어?", -- 물통이 타버림
		},

		BREWERY =
		{
			EMPTY = "술 말고 소-다? 도 만들수 있대!", --양조기 조사 대사
			BURNT = "히잉.", --양조기 타버림
			FERMENTING_LONG = "너어어어무 오래 걸려어어어어..뿌륵!!", --양조 끝나기 까지 많이 남음
			FERMENTING_SHORT = "소-다 아직이야? 거의 다 됬어?", --양조가 곧 끝남
			DONE = "소-다 있어?", --양조기에 음료가 들어있음
		},

		CAMPKETTLE_ITEM = "매끈이들 연못물 마시러면 필요해!", --휴대 주전자 아이템 조사 대사
		CAMPKETTLE =
		{
			GENERIC = "에이, 텅 비었네.", -- 화덕에 건 휴대 주전자 안에 물이 없음
			BOILING_LONG = "물 아직 차가워, 뽀륵.", -- 물 끓이기 시작함
			BOILING_SHORT = "뜨거워!!", -- 물 거의 다 끓음
			DONE = "물에 냄새 안나?", --깨끗한 물이 들음
			STOP = "연못물 들어 있어.", --화덕에 불이 없어서 더러운물이 끓지 않는 상태
		},

		CAMPDESALINATOR_ITEM = "이거 넘 무거워.", --휴대 제염기 아이템 조사 대사
		CAMPDESALINATOR = 
		{
			GENERIC = "에이, 텅 비었네.", --물 없음
			BOILING_LONG = "빙그르르르르~", --물 끓이기 시작
			BOILING_SHORT = "물 거의 이동했어, 신기해!", --거의 다 끓음 
			DONE = "물이 이제 안 짜!", -- 깨끗한 물이 들음
			STOP = "큰연못 물 들어있어, 뽀륵.", -- 화덕에 불이 없어서 소금물이 정수 되지 않는 상태
		},

		TEA_POT =
		{
			EMPTY = "안에 마실거 있으면 좋겠다, 부륵.", --빈 주전자 조사대사
			BURNT = "히잉.", --주전자가 불탐
			BOILING_LONG = "너무 오래 걸려어어..", -- 음료를 만들기 시작한지 얼마 안됨
			BOILING_SHORT = "빨리 될거야!", --음료 조리가 거의 끝나감
			DONE = "마실거 먹을 시간이야!", --음료가 완성됨
			PURIFY_LONG = "연못물 안끓이면 음료맛이 나쁘데.", -- 더러운 물을 끓이기 시작한지 얼마 안됨
			PURIFY_SHORT = "냄새가 거의 없어진것같아, 뽀륵!", --더러운물을 거의 다 끓여감
			HASWATER = "음식도 넣어야해, 뽀륵.", -- 깨끗한 물이 차 있는 상태
			MELT_LONG = "후드드, 아직 차가워.", -- 얼음물을 녹이기 시작한지 얼마 안됨
			MELT_SHORT = "미지근해!", -- 얼음물을 거의 녹여감
		},

		PORTABLE_TEA_POT_ITEM =
		{
			GENERIC = "물맛 더 좋게한데!", -- 휴대용 주전자(아이템) 조사 대사
			EMPTY = "물 이랑, 음식피료해!", -- 설치한 빈 휴대용 주전자 조사 대사
			BOILING_LONG = "이거 너무 오래걸려!", -- 음료를 만들기 시작한지 얼마 안됨
			BOILING_SHORT = "마실거! 마실거! 마실거!", --음료 조리가 거의 끝나감
			DONE = "우와!", --음료가 완성됨
			PURIFY_LONG = "연못물 안 끓이면 음료맛이 나쁘데.", -- 더러운 물을 끓이기 시작한지 얼마 안됨
			PURIFY_SHORT = "냄새가 거의 없어진것같아, 뽀륵!", --더러운물을 거의 다 끓여감
			HASWATER = "음식도 넣어야해, 뽀륵.", -- 깨끗한 물이 차 있는 상태
			MELT_LONG = "후드드, 아직 차가워.", -- 얼음물을 녹이기 시작한지 얼마 안됨
			MELT_SHORT = "미지근해!", -- 얼음물을 거의 녹여감
		},

		KETTLE =
		{
			EMPTY = "안에 마실거 있으면 좋겠다, 부륵.", --빈 주전자 조사대사
			BURNT = "히잉.", --주전자가 불탐
			DONE = "마실거 먹을 시간이야!", --음료가 완성됨
			PURIFY_LONG = "연못물 안끓이면 음료맛이 나쁘데.", -- 더러운 물을 끓이기 시작한지 얼마 안됨
			PURIFY_SHORT = "냄새가 거의 없어진것같아, 뽀륵!", --더러운물을 거의 다 끓여감
			HASWATER = "음식도 넣어야해, 뽀륵.", -- 깨끗한 물이 차 있는 상태
			MELT_LONG = "후드드, 아직 차가워.", -- 얼음물을 녹이기 시작한지 얼마 안됨
			MELT_SHORT = "미지근해!", -- 얼음물을 거의 녹여감
		},

		PORTABLEKETTLE_ITEM =
		{
			GENERIC = "물맛 더 좋게한데!", -- 휴대용 주전자(아이템) 조사 대사
			EMPTY = "물 이랑, 음식피료해!", -- 설치한 빈 휴대용 주전자 조사 대사
			DONE = "우와!", --음료가 완성됨
			PURIFY_LONG = "연못물 안 끓이면 음료맛이 나쁘데.", -- 더러운 물을 끓이기 시작한지 얼마 안됨
			PURIFY_SHORT = "냄새가 거의 없어진것같아, 뽀륵!", --더러운물을 거의 다 끓여감
			HASWATER = "음식도 넣어야해, 뽀륵.", -- 깨끗한 물이 차 있는 상태
			MELT_LONG = "후드드, 아직 차가워.", -- 얼음물을 녹이기 시작한지 얼마 안됨
			MELT_SHORT = "미지근해!", -- 얼음물을 거의 녹여감
		},
		
		DISTILLERS =
		{   
		    EMPTY = "예쁜 돌로만든 가마솥!", --증류기 조사 대사
			DISTILLTING_LONG = "위에 보고있으면 누니 핑 핑 돌아.", --증류가 끝나기 까지 많이 남음
			DISTILLING_SHORT = "나는 술 안마셔, 뽀륵.", --증류가 곧 끝남
			DONE = "마실수있는 사람주자, 뽀륵!", --증류기에 음료가 들어있음
		},

		WELL_WATERPUMP = {
			HIGH_PRESSURE = "힘이 넘쳐!", -- 압력 최대
			MIDDLE_PRESSURE = "지하에서 물 퍼내고 있어, 뽀륵.", -- 압력이 중간
			LOW_PRESSURE = "피곤한가봐.", -- 압력이 거의 없을때
			RECHARG_PRESSURE = "작동 안해 뽀륵.", -- 압력이 아예 없을때(여기까지 쓰면 압력이 최대가 될때까지 못씀.)
		},
		
		WELL_SPRINKLER =
		{ 
			LOWFUEL = "연료넣으면 물 더 뿌릴수 있어, 뽀륵.", -- 연료가 거의 없는 상태에서의 조사 대사
			ON = "물 계속뿌리면 늪지될지도 몰라, 뽀륵!", -- 작동중임
			OFF = "물 뿌리는 동그란 돌!", --작동을 멈춘상태에서의 조사 대사
		},	
	},
}