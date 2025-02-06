return {
	ACTIONFAIL =
	{
		GIVE =
		{
			WELL_NOTEMPTY = "양동이 하나면 충분해.", -- 우물에서 올라온 양동이 달려있는데 양동이 달려 함
			WELL_BUSY = "욕심 부리면 선물 못 받을걸.", -- 우물에 안 에 양동이가 들어가 있는데 달려 함
		}
	},

	ANNOUNCE_DRUNK = "물질계랑 어둠계가 둘 다 보여!", -- 취함
	ANNOUNCE_DRUNK_MUMBLE = 
	{
		--대사 추가해야함
	},
	ANNOUNCE_DRUNK_END = "물질계가 명료해지기 시작했어.", --술에서 좀 깸 (그로기)
	ANNOUNCE_DRUNK_IMMUNITY = "", --임시. 위그 전용,
	ANNOUNCE_NOTCHARGE = "충전 좀 해야겠는데, 친구!", --번개염소가 충전이 안되서 양동이로 젖을 짤수 없음
	ANNOUNCE_NOTHIRSTSLEEP = "이대로 자면 아침엔 임프육포가 될거야.", -- 목이 마른데 밤에 잘려고 시도
	ANNOUNCE_NOTHIRSTSIESTA = "말라서 육포가 되고싶진 않아.", -- 목이 마른데 낮에 잘려고 시도
	ANNOUNCE_SLEEP_END = "완전히 물질계로 돌아왔어!", --자고 일어나서 술에서 완전히 깸 
	ANNOUNCE_THIRST = "필멸자 같지만 물 좀 마셔야겠어!", --너무 목말라!

	ANNOUNCE_CAFFINE_BUFF_START = "흐유유, 흥분되는걸!" , -- 카페인 버프 시작
    ANNOUNCE_CAFFINE_BUFF_STOP = "내 손안에 영혼이 얼마나 남았지?" ,  -- 카페인 버프 끝

    ANNOUNCE_SATIETY_BUFF_START = "" , -- 포만감 버프 시작
    ANNOUNCE_SATIETY_BUFF_STOP = "" ,  -- 포만감 버프 끝
    
    ANNOUNCE_CURE_WATERBORNE = "흐유유, 그 고통도 나쁘진 않았네." ,  -- 수인성 질병을 아이템으로 치료했을때의 대사

	ANNOUNCE_DCAPACITY_CRITICAL = "음료가 나를 어둠계로 끌고가려고 한다!", --취하기 직전
	ANNOUNCE_DCAPACITY_HALF = "휘유, 이거 기분 괜찮은데!", -- 취기가 돌기 시작

	DESCRIBE =
	{
		BOILBOOK_BASIC = "물 끓이는것도 설명서가 있는거야?",
		BOILBOOK_ADVANCED = "물 끓이는것도 설명서가 있는거야?",

		WATER_CLEAN_ICE = "마시긴 힘들겠는데.",--깨끗한 얼음물
		WATER_DIRTY_ICE = "흐유유! 불결해라!", --더러운 얼음물

		SPICE_CAFFEINPEPPER = "매콤한 노략물이야.", --후추 향신료

		WELL_KIT = "목마른 필멸자가 우물을 파는법.", --우물 키트
		WELL_SPRINKLER_KIT = "털 적시는건 싫은데.", --스프링클러 키트
		WELL_WATERPUMP_KIT = "마법에 의존하는 우물이라니, 흐유유!", --스팀 물펌프 키트
		WELL_BURYING_KIT = "과거의 과오를 덮어버리는 도구지.", -- 구멍 매설 키트
		WELL_DRILLING = "세상에 구멍을 만드는 중이야.", --드릴로 구멍 뚫는 중
		WELL_DRILLING_ITEM = "흐유유, 땅 좀 파보자고!", --드릴 아이템
		HOLE = "안쪽이 꽤 깊은데!", --우물 구멍
		WELL = "내릴 양동이를 찾아봐야겠네.", --우물
		BOTTLE_POUCH_SMALL = "",
		BOTTLE_POUCH_BIG = "",
		THERMOS_BOTTLE_SMALL = "",
		THERMOS_BOTTLE_BIG = "",
		WINE_CELLAR_PART = "",
		WINE_CELLAR = "",

		WX78MODULE_NONEDRUNK = "네가 그 폐급 속의 A급이니?", -- 78전용 묘듈
		PURIFICATION_TABLETS = "",

		-- 물 모드 식물

		TEA_TREE = "향기롭고 빈약한 나무야.",--차나무
		DUG_TEA_TREE = "빨리 어딘가 심어줘야겠네.", --땅에서 파낸 차나무
		TEA_SEED = "큰녀석 안에 작은게 들어있어.", -- 차나무 열매
		TEA_SEED_COOKED = "불을 견디진 못했나봐.", --구운 차나무 열매
		TEA_SEED_SAPLING = "자라려고 저렇게 열심인걸!", --차나무 새싹
		TEALEAVES = "향긋한 냄새나는 잎이야.", --찻잎
		TEALEAVES_DRIED = "말라버렸네. 잔혹하기도해라!", --말린 찻잎

		CAFFEINBERRY = "나랑은 다르게 파랗네.", --커피 덤불
		DUG_CAFFEINBERRY = "어디 심을 데 없나?", --파낸 커피덤불
		CAFFEINBERRY_BEAN = "기운찬 냄새나는 콩이야.", --생 커피콩
		CAFFEINBERRY_BEAN_COOKED = "정신드는 냄새가 나네.", --구운 커피콩

		RUINCACAO_TREE = "유쾌하고 으스스한 나무네. 흐유유!", --카카오 나무
		DUG_RUINCACAO_TREE = "집 근처에 심어도 되는걸까?", --파낸 카카오 나무
		RUINCACAO_SEED = "자라고 있는건가?", --카카오 새싹 아이템
		RUINCACAO_SEED_SAPLING = "신기하게도 자라네!", -- 카카오 새싹 심은거
		RUINCACAO = "난 크람푸스 아저씨도 아닌데 말야.", --부수기 전 카카오 열매
		RUINCACAO_BEAN = "타는냄새 나는것 같지 않아?", --부순 후 카카오 콩  
		RUINCACAO_BEAN_COOKED = "기이하게도 냄새가 괜찮네.", --구운 카카오 콩

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

		ADDITIVE_SEED = "매콤한 냄새가 나는데.", -- 리큐르에 제조에 첨가 할 씨허브(아니스,쥬니퍼베리,팔각 모티브)첨가제 
		ADDITIVE_PETALS = "음료를 만들기 위한 풀이네.", -- 리큐르에 제조에 첨가 할 허브,녹차,꽃잎 첨가제
		ADDITIVE_NUT = "필멸자들 이를 깰 수 있겠네!", -- 리큐르에 제조에 첨가 할 버치넛,코코넛,커피콩,카카오콩 첨가제
		ADDITIVE_DAIRY = "필멸자들이 이번엔 우유로 뭘 만들었을까?", -- 리큐르에 제조에 첨가할 유제품 첨가제

		-- 음료

		WATER_CLEAN = "필멸자들에겐 없어선 안될 것이지.", --깨끗한 물
		WATER_DIRTY = "흐유유, 정말 불결하네!", --더러운 물
		WATER_SALTY = "흐유유, 마실수록 목이 마르네!", --바닷물

		GOOPYDRINK = "불쾌한 실패작이야.", --실패한 음료(웻 굽 개념)
		
		-- 주전자 음료

		FRUITJUICE = "별게 다 들어갔네.", --잡 과일쥬스
		BERRIES_JUICE = "필멸자들이 좋아하는 단맛이야.", -- 베리 쥬스
		POMEGRANATE_JUICE = "음료수가 된걸 마셔도 지하에 머물러야 할까?", -- 석류 쥬스
		BANANA_JUICE = "필멸자들이 좋아할 음료수야.", -- 바나나 쥬스
		FIG_JUICE =  "마시면 동산애서 쫒겨날거야.", -- 무화과 쥬스
		DRAGONJUICE = "용 맛일까, 파리 맛일까?", --용과 쥬스
		GLOWBERRYJUICE = "빛나는건 좋지만 마시는건 별로야.", -- 발광베리 쥬스
		WATERMELON_JUICE = "으음, 사양할게.", --수박 쥬스

		VEGGIE_TEA = "난 괜찮아. 영혼이면 돼.", --녹즙
		CARROT_TEA = "당근 좀 마셔도 별일없지.", --당근차
		CACTUS_TEA = "가시 없고 가시성 좋은 음료지.", --선인차
		TOMATO_JUICE = "슬픈 토마토네. 흐유유!", --토마토 쥬스
		LUMPY_TEA = "뿌리맛은 무슨 맛이지?", --뿌리차,
		SEAWEED_SHAKE = "다시말린 다시마야.", --해초 쉐이크
		
		GREENTEA = "뭔가 부족한데.", --생잎 녹차
		BLACKTEA = "잎은 붉은색이 아니었는데.", --홍차
		BLACKTEA_ICED = "앗. 차가워라. 흐유유!", -- 홍차 아이스티
		FUER = "그냥 끓인 나뭇잎이지.", --보이차,이파리차,고사리차
		MIXFLOWER = "꽃 달인 차야.", --잡 꽃잎 차
		HIBISCUSTEA = "마치 영혼같네. 흐유유!", --히비스커스 차
		CACTUSFLOWER_TEA = "예쁜 꽃이었지. 이젠 액체지만!", --선인꽃차
		LOTUSTEA = "분홍색 영혼은 없는데 말이야.", --연꽃차
		SUSHIBISCUS = "돼지야. 내가 뭘 가져왔나 볼래?", -- 자살차
		MOON_BLOSSOM_TEA = "음료까지 달빛이잖아!", --달꽃차
		MENTHA_SPICATA_TEA = "내 영혼을 되찾은 기분이야!", -- 박하차

		CAFFEINBERRY_JUICE = "마시면 힘이 나지. 난 별 맛 안나지만.", -- 블랙 커피
        TOFFEE_LATTE = "난 음료랑도 잘 안맞아.", --토피넛 라떼
		RUINCHA_LATTE = "이건 마셔볼필요는 있겠네.", --모카 라떼(커피+초코)
		
		HOTRUINCOLATE = "털없는 필멸자들의 겨울 대비책이야.", --핫초코
		RUINCOLATE_SMOOTHIE = "찬 거 좋지. 마시는건 별로지만.", --초코 스무디(차가움)
		RUINXOCOLATL = "반만 느껴져도 쓰잖아!", --쇼콜라틀(매캐함)
		TEA_RUINCOLATE_LATTE = "난 마시는거 별로 안좋아해.", -- 말차 라떼

		MULLED = "임프 내장을 따뜻하게 데워주지.", --뱅쇼
		BUTTERBEER = "이상하게 마법이 느껴지네.", --해리포터 시리즈의 버터비어

		APPLEPINE_JUICE = "난 영혼이면 될것같아.",
		APPLEPINE_SMOOTHIE = "",
		APPLEPINE_CAPPUCCINO = "",

		CITROYUZU_JUICE = "난 주황색을보는 걸로 만족할게.",
		CITROYUZU_TEA = "",
		EARLGREY_TEA = "",

		-- 콜라보 주전자 음료

		COCONUT_JUICE = "별 맛도 안나는걸 마신다니까.", --난파선 코코넛 쥬스
		RAINBOW_SHAKE = "색만 봐도 충분해.", --난파선 무지개 해파리 쉐이크
		QUARTZ_SHAKE = "물고기도 마셔지리라곤 상상도 못했을걸.", --난파선 광대 물고기 쉐이크
		NETTLE_TEA = "",
		FRASH_BRAMBLE_TEA = "",
		TUBER_BLOOM_TEA = "",
		CHERRY_ROSEBERRIES_TEA = "그림자 느낌나는 장미향이네.", --체리숲 로즈힙 차
		CHERRY_HONEY_TEA = "이렇게 달면 먹을만하지.", --체리숲 벚꽃꿀 차
		SWEET_RICE_DRINK = "마시는거랑 먹는걸 같이해야 한다니!", -- 비타협 식혜
		STRAWBERRY_SMOOTHIE = "갈린 붉은 과실이야.", -- 모어 푸드 팩 딸기 스무디
		STRAWBERRY_MILK_SMOOTHIE = "적어도 부드러운게 좋겠지.", -- 모어 푸드 팩 딸기 스무디 라떼

		--양조기 음료

		SPOILED_DRINK = "정말 썩은 물이네!", --썩은 음료

		-- 양조소다
	
		SODA = "흐유유, 날 공격하는 물이잖아!", -- 탄산수
		FRUITSODA = "과일들 비명이 들리는것 같기도 하네!", -- 과일소다
		LIMONSODA = "꿀맛 나는 단물이네.", -- 레몬 라임소다(과일소다 상위 호환)
		COLA = "검은것 치곤 먹을만한걸!", -- 콜라
		COLAQUANTUM = "흐유유! 방사능 좋지!", --콜라 퀀텀
		LUMPY_BEER = "경찰에 적성맞게 생겼네.", --루트비어(술이 아님)
		APPLEPINESODA = "톡 쏘는건 좋지만 마시는건 안 선호해서 말야.", -- 탄산 파인애플(오란씨)
		CITROYUZUSODA = "렌지에 못 돌릴 오렌지야.", -- 탄산 오랜지(환타)
		DAWN_FOG = "",
		MOON_CAP_DRINK = "",

		-- 양조주

		CORN_BEER = "알갱이는 다 어디갔을까?", -- 콘 맥주
		MADHU = "마시면 벌처럼 붕붕거리지!", --벌꿀주
		WINE = "사치스러운 필멸자 맛이야.", --와인 (그냥 베리 양조)
		NOBLEWINE = "어떻게 붉은색이 흰색이될수 있는걸까?", --노블 와인(구운 베리 양조)
		SPARKLINGWINE = "흐유유, 몸에 나쁜것 투성이네!", --스파클링 와인
		GLOWBERRYWINE = "참 특이한것도 마시려 드네.", --글로우 베리 와인
		KUMIS = "뭐, 쿠키옆에 두긴 별로네.", -- 크므즈,산양유주
		LUMPY_WINE = "지하세계 출신은 믿을게 못되지.", --서주(감자 고구마등 뿌리 술)
		PULQUE = "가시돋친 식물을 마실생각은 누가 한 걸까?", --풀케(선인주)
		RUINCACAO_WINE = "오, 이젠 콩으로 술도 만드는거야?", -- 카카오 와인 
		MIDNIGHT_STORM = "",
		APPLEPINE_CIDER = "",
		MENTHA_SPICATA_WINE = "",

		-- 콜라보 소다

		CHERRY_DOCTOR_COLA = "괜찮은 고문도구가 되지. 흐유유!", --체리숲 닥터 페퍼(닥터 체리)
		STRAWBERRYSODA = "씨앗이 폭탄처럼 터질까?", -- 탄산 딸기(웰치스 딸기)

		--콜라보 양조주

		AUROBOW = "비 온 뒤에 나타날 술일까? 흐유유.", -- 난파선 오로보우,무지개 해파리주
		COCONUT_WINE = "별맛 안나.", -- 난파선 코코넛 와인
		NETTLE_WINE = "",
		CHERRY_BLOOM_MADHU = "이렇게 단 술이면 마실만하지.", -- 체리숲 벚꽃꿀주
		GIANT_BLUEBERRY_WINE = "마실만하지. 무기로는 더 좋고!", -- 붐 베리 와인 (불 붙히면 폭발함)
		RICE_WINE = "쌀이 물에 녹은건가?", -- 비타협 막걸리
		WHEAT_BEER = "밀물 때 마실 밀술이야.", -- 힙 오브 푸드 밀맥주
		PALE_BEER = "안색이 창백해질 맛일까?", -- 레기온 페일에일 (몬스트라 열매를 쓴 청록색 맥주)

		--증류주

		DISINFECTANT = "영혼만 있으면 소독 안해도 돼.", -- 소독약
		CORN_WHISKEY = "그냥 옥수수 술이야.", -- 콘 위스키
		LUMPY_VODKA = "임프 몸에 이런건 좀 센데.", -- 보드카
		TEQUILA = "태양을 찬미하라! 흐유유.", -- 데킬라
		MADHU_RUM = "필멸자들은 애써 독을 먹으려 한다니까.", -- 럼주
		BERRY_BRANDY = "필멸자들이 좋아할 고급진 맛이지. 난 아니고.", -- 베리 브랜디
		AREUHI = "어린애 필멸자들이 마시면 선물은 못 받겠지.", -- 크므즈 증류주 아르히
		APPLEPINE_BRANDY = "",
		VOID_GIN = "",
		VOID_BRANDY = "",
		VOID_GIN  = "",
		CITROYUZU_CURACAO = "",
		MENTHA_SPICATA_CURACAO = "",

		--왈리 전용 증류주

		BERRY_GIN = "필멸자들이 다른거랑 섞어서 마시더라고.", --진
		GLOWBERRY_GIN = "배가 빛나겠는데.", --글로우 베리 진
		ABSINTHE = "색만빼면 나랑 비슷할지도 몰라.", -- 압생트
		TEA_LUMPY_VODKA = "아냐, 아냐, 아냐.", -- 녹차 리큐르
		PETALS_BERRY_BRANDY = "난 고급스러운건 안 어울려.", -- 장미향 브랜디
		KAHLUA = "잠과 깨는것의 평형이야.", -- 커피 리큐르 깔루아
		NUT_CORN_WHISKEY = "볼트는 좀 없나?", -- 너트 위스키
        RUINCACAO_CREAM_LIQUEUR = "으음, 난 괜찮아.", --베일리스 카카오 크림 리큐르
        RUMCHATA = "필멸자 사회에서는 이런게 평범한건가?", -- 럼차타(럼에 오우차타 라는 유제품 섞은)

		--콜라보 증류주

		MOONWAY = "필멸자들 생각은 알다가도 모르겠어.", -- 무지개 해파리주 증류주
		NETTLE_LIQUEUR = "",
		ARRACK = "그래도 여전히 밍밍해.", -- 아락 인도네시아 버전 코코넛 와인 증류주
		CHERRY_BLOOM_RUM = "이건 마실만해.", -- 체리 꿀주 증류주 벛꽃잎 떠다
		RICE_SPIRITS = "물 사이에 숨겨놓으면 재밌겠는데.", --청주
		WHEAT_WHISKEY = "필멸자들 음료수에 섞어놔야지. 흐유유.", -- 밀 위스크
		PALE_WHISKEY = "정말 창백해.", -- 페일 몰트 위스키

		--왈리 전용 콜라보 증류주

		NUT_COCONUT_BRANDY = "어이, 문어머리! 찾는거있어? 혹시 이거 아닌가? 멀쩡해!", -- Oi, fishface! Lose something? Eh? Got it!. -- 캐리버인아의 해적, 잭 스패로우
	    GIANT_BLUEBERRY_GIN = "흐유유, 이거 재밌겠는데!", -- 붐 베리 사파이어 (당근 폭발함)

		--냄비 요리

        DARK_RUINCOLATE = "어둠계의 맛이지!", --다크 초콜릿.
        WHITE_RUINCOLATE = "그래도 영혼보단 부드럽네.", --화이트 초콜릿
        RUINCOLATE = "대부분의 필멸자들이 좋아하는 블럭이야.", -- 그냥 초콜릿
        RUIN_SCHOKAKOLA = "필멸자들은 처음보는식물도 먹으려 드는건가?", -- 쇼카콜라
        APPLEPINE_PIE = "",
        APPLEPINE_FRIED_RICE = "",
        CITROYUZU_BBQ = "",

		BUCKET_STEEL_EMPTY = 
		{
			EMPTY = "물에서 철 맛 나는거 아닌가몰라!", --빈 양철 양동이
			FULL = "필멸자들을 위한 물이지.", -- 깨끗한 빗물이 참
			FULL_ICE = 	"물처럼 보이며 살기엔 냉랭한 세상이지.", -- 빗물이 얼어버림
			DIRTY = "더럽혀진 물이야.", --빗물이 더러워짐
			DIRTY_ICE = "정말 세상풍파 다 겪었어.", --더러운 빗물이 얼어버림
		},

		BUCKET_WOODIE_EMPTY = 
		{
			EMPTY = "거의 그냥 밑동인걸.", --우디의 빈 나무 양동이
			FULL = "필멸자들을 위한 물이지.", -- 깨끗한 빗물이 참
			FULL_ICE = 	"물처럼 보이며 살기엔 냉랭한 세상이지.", -- 빗물이 얼어버림
			DIRTY = "더럽혀진 물이야.", --빗물이 더러워짐
			DIRTY_ICE = "정말 세상풍파 다 겪었어.", --더러운 빗물이 얼어버림
		},

		BUCKET_DRIFTWOOD_EMPTY = 
		{
			EMPTY = "흐유유, 물 푸다 손에 나무조각 박히는거 아닌가몰라!", -- 빈 나무 양동이
			FULL = "필멸자들을 위한 물이지.", -- 깨끗한 빗물이 참
			FULL_ICE = 	"물처럼 보이며 살기엔 냉랭한 세상이지.", -- 빗물이 얼어버림
			DIRTY = "더럽혀진 물이야.", --빗물이 더러워짐
			DIRTY_ICE = "정말 세상풍파 다 겪었어.", --더러운 빗물이 얼어버림
		},

		BUCKET_EMPTY = 
		{
			EMPTY = "물 담을 양동이야.", -- 빈 나무 양동이
			FULL = "필멸자들을 위한 물이지.", -- 깨끗한 빗물이 참
			FULL_ICE = 	"물처럼 보이며 살기엔 냉랭한 세상이지.", -- 빗물이 얼어버림
			DIRTY = "더럽혀진 물이야.", --빗물이 더러워짐
			DIRTY_ICE = "정말 세상풍파 다 겪었어.", --더러운 빗물이 얼어버림
		},

		DESALINATOR =
		{
			EMPTY = "필멸자들이랑 다르게 짠 물을 원하고있어.", --제염기에 물이 없음
			PURIFY_LONG = "꽤 시간이 걸릴 거야.", -- 정수 끝나기까지 많이 남음
			PURIFY_SHORT = "거의 다 됐다!", -- 정수가 곧 끝남
			HASWATER = "드디어 끝났나봐!", --제염기에 깨끗한 물이 있음
			BURNT = "다시 짠 물을 마셔야겠네. 흐유유!",   --제염기가 타버림
			HASSALT = "캬아악! 소금냄새가 나잖아.", --제염기에 소금이 남아 있음
		},

		BARREL =
		{
			GENERIC = "영혼대신 물로 가득찼지.", -- 물통 조사 대사
			BURNT = "흐유유, 물도 타버린걸까?", -- 물통이 타버림
		},

		BREWERY =
		{
			EMPTY = "필멸자들 입맛은 참 모르겠다니까.", --양조기 조사 대사
			BURNT = "흐유유, 사악한 불 같으니!", --양조기 타버림
			FERMENTING_LONG = "참 오래도 걸리겠지.", --양조 끝나기 까지 많이 남음
			FERMENTING_SHORT = "거의 다 됐나봐!", --양조가 곧 끝남
			DONE = "기다리다 말라죽는줄 알았네!", --양조기에 음료가 들어있음
		},

		CAMPKETTLE_ITEM = "필멸자들이 살아남는 방법이지.", --휴대 주전자 아이템 조사 대사
		CAMPKETTLE =
		{
			GENERIC = "무에서 유를 창조하는건 안될 일이지!", -- 화덕에 건 휴대 주전자 안에 물이 없음
			BOILING_LONG = "꽤 시간이 걸릴거야.", -- 물 끓이기 시작함
			BOILING_SHORT = "거의 다 끓였나보네!", -- 물 거의 다 끓음
			DONE = "목 좀 축여보자고.", --깨끗한 물이 들음
			STOP = "약해, 약해, 약해!", --화덕에 불이 없어서 더러운물이 끓지 않는 상태
		},

		CAMPDESALINATOR_ITEM = "간단하게 소금을 따돌리기위한 도구지.", --휴대 제염기 아이템 조사 대사
		CAMPDESALINATOR = 
		{
			GENERIC = "필멸자들이랑 다르게 짠 물을 원하고있어.", --물 없음
			BOILING_LONG = "꽤 시간이 걸릴거야.", --물 끓이기 시작
			BOILING_SHORT = "거의 다 된것 같네!", --거의 다 끓음 
			DONE = "이제 마실 수 있겠어!", -- 깨끗한 물이 들음
			STOP = "약해, 약해, 약해!", -- 화덕에 불이 없어서 소금물이 정수 되지 않는 상태
		},

		TEA_POT =
		{
			EMPTY = "텅텅 비었어.", --빈 주전자 조사대사
			BURNT = "필말자들 요리는 도통 이해가 안된다니까.", --주전자가 불탐
			BOILING_LONG = "꽤 시간이 걸릴거야.", -- 음료를 만들기 시작한지 얼마 안됨
			BOILING_SHORT = "이거 정말 기대되는데!", --음료 조리가 거의 끝나감
			DONE = "물 좀 마셔볼까!", --음료가 완성됨
			PURIFY_LONG = "꽤 시간이 걸릴거야.", -- 더러운 물을 끓이기 시작한지 얼마 안됨
			PURIFY_SHORT = "거의 다 됐나보네!", --더러운물을 거의 다 끓여감
			HASWATER = "거의 다 됐나보네!", -- 깨끗한 물이 차 있는 상태
			MELT_LONG = "꽤 시간이 걸릴거야.", -- 얼음물을 녹이기 시작한지 얼마 안됨
			MELT_SHORT = "거의 녹았나본데!", -- 얼음물을 거의 녹여감
		},

		PORTABLE_TEA_POT_ITEM =
		{
			GENERIC = "영혼을 끓일순 없을까?", -- 휴대용 주전자(아이템) 조사 대사
			EMPTY = "텅텅 비었어.", -- 설치한 빈 휴대용 주전자 조사 대사
			BOILING_LONG = "꽤 시간이 걸릴거야.", -- 음료를 만들기 시작한지 얼마 안됨
			BOILING_SHORT = "이거 정말 기대되는데!", --음료 조리가 거의 끝나감
			DONE = "물 좀 마셔볼까!", --음료가 완성됨
			PURIFY_LONG = "꽤 시간이 걸릴거야.", -- 더러운 물을 끓이기 시작한지 얼마 안됨
			PURIFY_SHORT = "거의 다 됐나보네!", --더러운물을 거의 다 끓여감
			HASWATER = "이제 끓일 게 필요하겠네. 요청도 많아라!", -- 깨끗한 물이 차 있는 상태
			MELT_LONG = "꽤 시간이 걸릴거야.", -- 얼음물을 녹이기 시작한지 얼마 안됨
			MELT_SHORT = "거의 녹았나본데!", -- 얼음물을 거의 녹여감
		},

		KETTLE =
		{
			EMPTY = "텅텅 비었어.", --빈 주전자 조사대사
			BURNT = "필말자들 요리는 도통 이해가 안된다니까.", --주전자가 불탐
			DONE = "물 좀 마셔볼까!", --음료가 완성됨
			PURIFY_LONG = "꽤 시간이 걸릴거야.", -- 더러운 물을 끓이기 시작한지 얼마 안됨
			PURIFY_SHORT = "거의 다 됐나보네!", --더러운물을 거의 다 끓여감
			HASWATER = "거의 다 됐나보네!", -- 깨끗한 물이 차 있는 상태
			MELT_LONG = "꽤 시간이 걸릴거야.", -- 얼음물을 녹이기 시작한지 얼마 안됨
			MELT_SHORT = "거의 녹았나본데!", -- 얼음물을 거의 녹여감
		},

		PORTABLEKETTLE_ITEM =
		{
			GENERIC = "영혼을 끓일순 없을까?", -- 휴대용 주전자(아이템) 조사 대사
			EMPTY = "텅텅 비었어.", -- 설치한 빈 휴대용 주전자 조사 대사
			DONE = "물 좀 마셔볼까!", --음료가 완성됨
			PURIFY_LONG = "꽤 시간이 걸릴거야.", -- 더러운 물을 끓이기 시작한지 얼마 안됨
			PURIFY_SHORT = "거의 다 됐나보네!", --더러운물을 거의 다 끓여감
			HASWATER = "이제 끓일 게 필요하겠네. 요청도 많아라!", -- 깨끗한 물이 차 있는 상태
			MELT_LONG = "꽤 시간이 걸릴거야.", -- 얼음물을 녹이기 시작한지 얼마 안됨
			MELT_SHORT = "거의 녹았나본데!", -- 얼음물을 거의 녹여감
		},
		
		DISTILLERS =
		{   
		    EMPTY = "뭐, 술이라도 좀 마셔볼까.", --증류기 조사 대사
			DISTILLTING_LONG = "정말 오래 걸리겠는걸.", --증류가 끝나기 까지 많이 남음
			DISTILLING_SHORT = "너무 긴 시간이었어!" , --증류가 곧 끝남
			DONE = "목 빠질뻔 했네!", --증류기에 음료가 들어있음
		},

		WELL_WATERPUMP = {
			HIGH_PRESSURE = "굉장한 소리가 나는데!", -- 압력 최대
			MIDDLE_PRESSURE = "소리가 좀 약해졌어.", -- 압력이 중간
			LOW_PRESSURE = "곧 꺼질 것 같은데.", -- 압력이 거의 없을때
			RECHARG_PRESSURE = "충전좀 다시 해야겠어!", -- 압력이 아예 없을때(여기까지 쓰면 압력이 최대가 될때까지 못씀.)
		},
		
		WELL_SPRINKLER =
		{ 
			LOWFUEL = "물질이 좀 더 필요해보이네.", -- 연료가 거의 없는 상태에서의 조사 대사
			ON = "분수쇼다!", -- 작동중임
			OFF = "일하지않고 쉬고 있어.", --작동을 멈춘상태에서의 조사 대사
		},	
	},
}