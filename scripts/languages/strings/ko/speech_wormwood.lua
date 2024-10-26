return {
	ACTIONFAIL =
	{
		GIVE =
		{
			WELL_NOTEMPTY = "안에 들었어", -- 우물에 말라 빈 양동이 달려있는데 양동이 달려 함
			WELL_BUSY = "바빠", -- 우물에 물 든 양동이 달려있는데 달려 함
		}
	},

	ANNOUNCE_DRUNK = "어질어질....", -- 취함

    ANNOUNCE_DRUNKING =
    {
        "Huff... Pant...",
        "I should have built... a lifting machine...",
        "Lift... with your back...",
        "This isn't... gentleman's work...",
        "For... science... oof!",
        "Is this... messing up my hair?",
        "Hngh...!",
        "Pant... Pant...",
        "This is the worst... experiment...",
    },

	ANNOUNCE_DRUNK_END = "휴....", --술에서 좀 깸 (그로기)
	ANNOUNCE_DRUNK_IMMUNITY = "", --임시. 위그 전용,
	ANNOUNCE_NOTCHARGE = "꼬불가지친구 준비 안됬어", --번개염소가 충전이 안되서 양동이로 젖을 짤수 없음
	ANNOUNCE_NOTHIRSTSLEEP = "너무 목말라", -- 목이 마른데 밤에 잘려고 시도
	ANNOUNCE_NOTHIRSTSIESTA = "너무 목말라", -- 목이 마른데 낮에 잘려고 시도
	ANNOUNCE_SLEEP_END = "이제 괜찮아", --자고 일어나서 술에서 완전히 깸 
	ANNOUNCE_THIRST = "마실거 필요해", --너무 목말라!

    ANNOUNCE_CAFFINE_BUFF_START = "뭉실뭉실 가벼워", -- 카페인 버프 시작
    ANNOUNCE_CAFFINE_BUFF_STOP = "이제 안 가벼워",  -- 카페인 버프 끝
    
    ANNOUNCE_CURE_WATERBORNE = "" ,  -- 수인성 질병을 아이템으로 치료했을때의 대사 -- 웜우드 먼역

	ANNOUNCE_DCAPACITY_CRITICAL = "느낌이 이상해....", --취하기 직전
	ANNOUNCE_DCAPACITY_HALF = "으으음....", -- 취기가 돌기 시작

	DESCRIBE =
	{
		BOILBOOK = "마실 것들",

		WATER_CLEAN_ICE = "차가워. 진짜 차가워",--깨끗한 얼음물
		WATER_DIRTY_ICE = "차가워. 진짜 차가워", --더러운 얼음물

		SPICE_CAFFEINPEPPER = "(킁킁) 에엣-취이! 엣-취이!", --후추 향신료

		WELL_KIT = "구멍에 심어", --우물 키트
		WELL_SPRINKLER_KIT = "구멍이나 물덩이 근처에 심어", --스프링클러 키트
		WELL_WATERPUMP_KIT = "구멍에 심어", --스팀 물펌프 키트
		WELL_BURYING_KIT = "구멍 막아", -- 구멍 매설 키트
		WELL_DRILLING = "땅에 구멍내", --드릴로 구멍 뚫는 중
		WELL_DRILLING_ITEM = "구멍내는 도구", --드릴 아이템
		HOLE = "안에 물 있어", --우물 구멍
		WELL = "물 얻을수 있어.", --우물

		WX78MODULE_NONEDRUNK = "삐빅 삑", -- 78전용 묘듈

		-- 물 모드 식물

		TEA_TREE = "멋쟁이 친구",--차나무
		DUG_TEA_TREE = "흙 필요해", --땅에서 파낸 차나무
		TEA_SEED = "멋쟁이 덩어리야!", -- 차나무 열매
		TEA_SEED_COOKED = "이젠 먹는거", --구운 차나무 열매
		TEA_SEED_SAPLING = "멋쟁이로 자라라!", --차나무 새싹
		TEALEAVES = "멋쟁이 친구야 고마워!", --찻잎
		TEALEAVES_DRIED = "흐으음... 냄새 좋아", --말린 찻잎

		CAFFEINBERRY = "먹는 바위 친구", --커피 덤불
		DUG_CAFFEINBERRY = "흙 필요해", --파낸 커피덤불
		CAFFEINBERRY_BEAN = "좋은 냄새", --생 커피콩
		CAFFEINBERRY_BEAN_COOKED = "아주 좋아!", --구운 커피콩

		RUINCACAO_TREE = "시스투스같은 친구", --카카오 나무
		DUG_RUINCACAO_TREE = "흙 필요해", --파낸 카카오 나무
		RUINCACAO_SEED = "애기 친구 흙 필요해", --카카오 새싹 아이템
		RUINCACAO_SEED_SAPLING = "아주 잘해!", -- 카카오 새싹 심은거
		RUINCACAO = "애기 친구의 집", --부수기 전 카카오 열매
		RUINCACAO_BEAN = "기름진 먹는거", --부순 후 카카오 콩  
		RUINCACAO_BEAN_COOKED = "익힌 먹는거", --구운 카카오 콩

		-- 증류주 첨가제

		ADDITIVE_SEED = "애기들 들어있어", -- 리큐르에 제조에 첨가 할 씨허브(아니스,쥬니퍼베리,팔각 모티브)첨가제 
		ADDITIVE_PETALS = "예쁜것들 들어있어", -- 리큐르에 제조에 첨가 할 허브,녹차,꽃잎 첨가제
		ADDITIVE_NUT = "먹을것들 들어있어", -- 리큐르에 제조에 첨가 할 버치넛,코코넛,커피콩,카카오콩 첨가제
		ADDITIVE_DAIRY = "흐으음?", -- 리큐르에 제조에 첨가할 유제품 첨가제

		-- 음료

		WATER_CLEAN = "깨끗 마실거", --깨끗한 물
		WATER_DIRTY = "더러운 마실거", --더러운 물
		WATER_SALTY = "못 마실거", --바닷물

		GOOPYDRINK = "꿀꺽", --실패한 음료(웻 굽 개념)
		
		-- 주전자 음료

		FRUITJUICE = "과일 섞인것 마실거", --잡 과일쥬스
		BERRIES_JUICE = "달콤한 마실거", -- 베리 쥬스
		POMEGRANATE_JUICE = "씨 과일 마실거", -- 석류 쥬스
		BANANA_JUICE = "달콤한 머리카락 들어갔어", -- 바나나 쥬스
		FIG_JUICE = "달콤한 주머니 물", -- 무화과 쥬스
		DRAGONJUICE = "예쁜 과일 마실거", --용과 쥬스
		GLOWBERRYJUICE = "빛나는 꿀꺽", -- 발광베리 쥬스
		WATERMELON_JUICE = "촉촉하고 달콤한 마실거", --수박 쥬스

		VEGGIE_TEA = "주황색 마실거?", --녹즙
		CARROT_TEA = "주황색 마실거", --당근차
		CACTUS_TEA = "탱글탱글 한거 있어", --선인차
		TOMATO_JUICE = "물렁물렁 공 물", --토마토 쥬스
		LUMPY_TEA = "흙에서 난걸로 만든 마실거", --뿌리차
		SEAWEED_SHAKE = "미끌미끌 가득", --해초 쉐이크
		
		GREENTEA = "멋쟁이걸로 우렸어", --생잎 녹차
		BLACKTEA = "향 매우 좋아", --홍차
		BLACKTEA_ICED = "시원해", -- 홍차 아이스티
		FUER = "물 아야에 좋아", --보이차,이파리차,고사리차
		MIXFLOWER = "좋은향 섞여있어", --잡 꽃잎 차
		HIBISCUSTEA = "냄새 좋아", --히비스커스 차
		CACTUSFLOWER_TEA = "마시고 싶어", --선인꽃차
		LOTUSTEA = "달콤한 냄새나", --연꽃차
		SUSHIBISCUS = "흐으음... 냄새 안 좋아", -- 자살차
		MOON_BLOSSOM_TEA = "으으음... 향 좋아", --달꽃차

		CAFFEINBERRY_JUICE = "야호!", -- 블랙 커피
        TOFFEE_LATTE = "고소한향 나", --토피넛 라떼
		RUINCHA_LATTE = "달콤 쌉살해!", --모카 라떼(커피+초코)
		
		HOTRUINCOLATE = "배 따뜻하게 해", --핫초코
		RUINCOLATE_SMOOTHIE = "배 춥게 해", --초코 스무디(차가움)
		RUINXOCOLATL = "쓴 맛 마실거", --쇼콜라틀(매캐함)
		TEA_RUINCOLATE_LATTE = "멋쟁이 향이 나", -- 말차 라떼

		MULLED = "속 따뜻해져, 쿨쿨", --뱅쇼
		BUTTERBEER = "꿀꺽!", --해리포터 시리즈의 버터비어

		-- 콜라보 주전자 음료

		COCONUT_JUICE = "탱글탱글 한거 가득", --난파선 코코넛 쥬스
		RAINBOW_SHAKE = "예쁜 뽀글이로 만든 마실거", --난파선 무지개 해파리 쉐이크
		QUARTZ_SHAKE = "뻐끔으로 만든 마실거", --난파선 광대 물고기 쉐이크
		CHERRY_ROSEBERRIES_TEA = "새콤한 향", --체리숲 로즈힙 차
		CHERRY_HONEY_TEA = "붕붕이들 매우 좋아해", --체리숲 벚꽃꿀 차
		SWEET_RICE_DRINK = "달콤해!", -- 비타협 식혜
		ANANAS_JUICE = "멋쟁이 왕관 마실거", -- 레기온 파인애플 주스
		ORANGE_JUICE = "주황색 공 마실거", -- 모어 푸드 팩 오랜지 주스
		STRAWBERRY_SMOOTHIE = "새콤 시원", -- 모어 푸드 팩 딸기 스무디
		STRAWBERRY_MILK_SMOOTHIE = "부들부들 새콤 시원", -- 모어 푸드 팩 딸기 스무디 라떼

		--양조기 음료

		SPOILED_DRINK = "마실 거, 생각보다 좋아", --썩은 음료

		-- 양조소다
	
		SODA = "톡톡 쏘는 물", -- 탄산수
		FRUITSODA = "톡톡 과일물", -- 과일소다
		LEMONLIMESODA = "톡톡 단 물", -- 레몬 라임소다(과일소다 상위 호환)
		COLA = "톡톡 단 검은 물", -- 콜라
		COLAQUANTUM = "톡톡 빛나는 물", --콜라 퀀텀
		LUMPY_BEER = "톡톡 뿌리덩어리 물", --루트비어(술이 아님)

		-- 양조주

		CORN_BEER = "작은 씨앗 발효된거", -- 콘 맥주
		MADHU = "붕붕이 즙 발효된거", --벌꿀주
		WINE = "작고 작은 먹을거 발효된거", --와인 (그냥 베리 양조)
		NOBLEWINE = "작고 작은 구운거 발효된거", --노블 와인(구운 베리 양조)
		SPARKLINGWINE = "톡톡 발효된거", --스파클링 와인
		GLOWBERRYWINE = "빛나는 발효된거", --글로우 베리 와인
		KUMIS = "새하예", -- 크므즈,산양유주
		LUMPY_WINE = "뿌리덩어리 발효된거", --서주(감자 고구마등 뿌리 술)
		PULQUE = "완전 새하예", --풀케(선인주)
		RUINCACAO_WINE = "쓴 맛 많이 없어", -- 카카오 와인 

		-- 콜라보 소다

		CHERRY_DOCTOR_COLA = "톡톡 과일 검은 물", --체리숲 닥터 페퍼(닥터 체리)
		ANANASSODA = "톡톡 멋쟁이 왕관 물", -- 탄산 파인애플(오란씨)
		ORANGESODA = "톡톡 주황 공 물", -- 탄산 오랜지(환타)
		STRAWBERRYSODA = "톡톡 달콤 과일 물", -- 탄산 딸기(웰치스 딸기)

		--콜라보 양조주

		AUROBOW = "알록달록해!", -- 난파선 오로보우,무지개 해파리주
		COCONUT_WINE = "탱글탱글한거 없어", -- 난파선 코코넛 와인
		CHERRY_BLOOM_MADHU = "예쁜 꽃잎 둥둥", -- 체리숲 벚꽃꿀주
		GIANT_BLUEBERRY_WINE = "펑 열매 발효된거", -- 비타협 붐!베리 사파이어(불 붙히면 폭발함)
		RICE_WINE = "안 달아...", -- 비타협 막걸리
		WHEAT_BEER = "이쁜 씨앗 발효된거", -- 힙 오브 푸드 밀맥주
		PALE_BEER = "동그란 열매 발효된거", -- 레기온 페일에일 (몬스트라 열매를 쓴 청록색 맥주)

		--증류주

		DISINFECTANT = "아야에 좋아", -- 소독약
		CORN_WHISKEY = "작은 씨앗 화르륵 마시는거", -- 콘 위스키
		LUMPY_VODKA = "투명해", -- 보드카
		TEQUILA = "하얀거 없어", -- 데킬라
		MADHU_RUM = "붕붕이 즙 깨끗해", -- 럼주
		BERRY_BRANDY = "작고 작은 먹을거 화르륵 마시는거", -- 베리 브랜디
		AREUHI = "안 하예", -- 크므즈 증류주 아르히

		--왈리 전용 증류주

		BERRY_GIN = "안 달콤한 화르륵 마시는거", --진
		GLOWBERRY_GIN = "빛나는 화르륵 마시는거", --글로우 베리 진
		ABSINTHE = "초록색 화르륵 마실거", -- 압생트
		TEA_LUMPY_VODKA = "멋쟁이 들어갔어", -- 보드카
		PETALS_BERRY_BRANDY = "알록달록", -- 장미향 브랜디
		KAHLUA = "진한 검은 화르륵 마실거", -- 커피 리큐르 깔루아
		NUT_CORN_WHISKEY = "고소한 향나", -- 너트 위스키
        RUINCACAO_CREAM_LIQUEUR = "고소해", --베일리스 카카오 크림 리큐르
        RUMCHATA = "고소하고 기운나", -- 럼차타(럼에 오우차타 라는 유제품 섞은)

		--콜라보 증류주

		MOONWAY = "알록달록 그대로", -- 무지개 해파리주 증류주
		ARRACK = "탱글 없는 화르륵 마시는거", -- 아락 인도네시아 버전 코코넛 와인 증류주
		CHERRY_BLOOM_RUM = "화르륵 마시는거", -- 체리 꿀주 증류주 벛꽃잎 떠다
		RICE_SPIRITS = "엄청 투명해!", --청주
		WHEAT_WHISKEY = "이쁜 씨앗 화르륵 마시는거", -- 밀 위스크
		PALE_WHISKEY = "동그란 열매 화르륵 마시는거", -- 페일 몰트 위스키

		--왈리 전용 콜라보 증류주

		NUT_COCONUT_BRANDY = "투명해", -- 코코넛 브랜디 (캐러비안 럼을 만들수 없어서 카리브 브랜디 라는 이름으로 대체)
	    GIANT_BLUEBERRY_GIN = "화르륵 마시는거 펑펑!", -- 붐 베리 사파이어 (당근 폭발함)

		--냄비 요리

        DARK_RUINCOLATE = "먹는 검은거", --다크 초콜릿.
        WHITE_RUINCOLATE = "먹는 하얀거", --화이트 초콜릿
        RUINCOLATE = "먹는 갈색판", -- 그냥 초콜릿
        RUIN_SCHOKAKOLA = "먹는거 눈이 번쩍", -- 쇼카콜라

		BUCKET_STEEL_EMPTY = 
		{
			EMPTY = "비어있는 동이", --빈 양철 양동이
			FULL = "깨끗 마실거", -- 깨끗한 빗물이 참
			FULL_ICE = "깨끗 차가운거", -- 빗물이 얼어버림
			DIRTY = "더러운 마실거", --빗물이 더러워짐
			DIRTY_ICE = "더러운 차가운거", --더러운 빗물이 얼어버림
		},

		BUCKET_WOODIE_EMPTY = 
		{
			EMPTY = "친구들 속을 파냈어 힝...", --우디의 빈 나무 양동이
			FULL = "깨끗 마실거",  --깨끗한 빗물이 참
			FULL_ICE = "깨끗 차가운거", --빗물이 얼어버림
			DIRTY = "더러운 마실거", --빗물이 더러워짐
			DIRTY_ICE = "더러운 차가운거", --더러운 빗물 얼어버림
		},

		BUCKET_DRIFTWOOD_EMPTY = 
		{
			EMPTY = "물이랑 친한 친구들로 만들어졌어.", -- 빈 나무 양동이
			FULL = "깨끗 마실거",  --깨끗한 빗물이 참
			FULL_ICE = "깨끗 차가운거", --빗물이 얼어버림
			DIRTY = "더러운 마실거", --빗물이 더러워짐
			DIRTY_ICE = "더러운 차가운거", --더러운 빗물 얼어버림
		},

		BUCKET_EMPTY = 
		{
			EMPTY = "친구들로 만들어졌어", -- 빈 나무 양동이
			FULL = "깨끗 마실거", -- 깨끗한 빗물이 참
			FULL_ICE = "깨끗 차가운거", --빗물이 얼어버림
			DIRTY = "더러운 마실거", --빗물이 더러워짐
			DIRTY_ICE = "더러운 차가운거", --더러운 빗물 얼어버림
		},

		DESALINATOR =
		{
			EMPTY = "짠물 깨끗 분리해", --제염기에 물이 없음
			PURIFY_LONG = "기다려...", -- 정수 끝나기까지 많이 남음
			PURIFY_SHORT = "곧 끝나", -- 정수가 곧 끝남
			HASWATER = "끝!", --제염기에 깨끗한 물이 있음
			BURNT = "안됐어",   --제염기가 타버림
			HASSALT = "짠게 많아", --제염기에 소금이 남아 있음
		},

		BARREL =
		{
			GENERIC = "마실 물 보관해", -- 물통 조사 대사
			BURNT = "안 돼애애!", -- 물통이 타버림
		},

		BREWERY =
		{
			EMPTY = "보글보글 만들어", --양조기 조사 대사
			BURNT = "불 나빠", --양조기 타버림
			FERMENTING_LONG = "두 디 두...", --양조 끝나기 까지 많이 남음
			FERMENTING_SHORT = "금방 끝나", --양조가 곧 끝남
			DONE = "다 됐어!", --양조기에 음료가 들어있음
		},

		CAMPKETTLE_ITEM = "더러운 물 깨끗으로 만들어", --휴대 주전자 아이템 조사 대사
		CAMPKETTLE =
		{
			GENERIC = "물 없어", -- 화덕에 건 휴대 주전자 안에 물이 없음
			BOILING_LONG = "기다려...", -- 물 끓이기 시작함
			BOILING_SHORT = "곧 끝나", -- 물 거의 다 끓음
			DONE = "끝!", --깨끗한 물이 들음
			STOP = "안 깨끗해", --화덕에 불이 없어서 더러운물이 끓지 않는 상태
		},

		CAMPDESALINATOR_ITEM = "짠 물 깨끗으로 만들어", --휴대 제염기 아이템 조사 대사
		CAMPDESALINATOR = 
		{
			GENERIC = "물 없어", --물 없음
			BOILING_LONG = "기다려...", --물 끓이기 시작
			BOILING_SHORT = "곧 끝나", --거의 다 끓음 
			DONE = "끝!", -- 깨끗한 물이 들음
			STOP = "못 마셔", -- 화덕에 불이 없어서 소금물이 정수 되지 않는 상태
		},

		KETTLE =
		{
			EMPTY = "아직 물 없어", --빈 주전자 조사대사
			BURNT = "이런", --주전자가 불탐
			BOILING_LONG = "기다려...", -- 음료를 만들기 시작한지 얼마 안됨
			BOILING_SHORT = "곧 끝나", --음료 조리가 거의 끝나감
			DONE = "끝!", --음료가 완성됨
			PURIFY_LONG = "더러워", -- 더러운 물을 끓이기 시작한지 얼마 안됨
			PURIFY_SHORT = "곧 끝나", --더러운물을 거의 다 끓여감
			HASWATER = "우릴거 필요해", -- 깨끗한 물이 차 있는 상태
			MELT_LONG = "차가워", -- 얼음물을 녹이기 시작한지 얼마 안됨
			MELT_SHORT = "곧 끝나", -- 얼음물을 거의 녹여감
		},

		PORTABLEKETTLE_ITEM =
		{
			GENERIC = "마실거 만들어", -- 휴대용 주전자(아이템) 조사 대사
			EMPTY = "물 없어...", -- 설치한 빈 휴대용 주전자 조사 대사
			BOILING_LONG = "기다려...", -- 음료를 만들기 시작한지 얼마 안됨
			BOILING_SHORT = "곧 끝나", --음료 조리가 거의 끝나감
			DONE = "다 됐어!", --음료가 완성됨
			PURIFY_LONG = "더러워", -- 더러운 물을 끓이기 시작한지 얼마 안됨
			PURIFY_SHORT = "금방 끝나", --더러운물을 거의 다 끓여감
			HASWATER = "뭐 만들고 싶어?", -- 깨끗한 물이 차 있는 상태
			MELT_LONG = "차가워", -- 얼음물을 녹이기 시작한지 얼마 안됨
			MELT_SHORT = "금방 끝나", -- 얼음물을 거의 녹여감
		},
		
		DISTILLERS =
		{   
		    EMPTY = "화륵화륵 만들어", --증류기 조사 대사
			DISTILLTING_LONG = "두 디 두...", --증류가 끝나기 까지 많이 남음
			DISTILLING_SHORT = "금방 끝나", --증류가 곧 끝남
			DONE = "다 됐어!", --증류기에 음료가 들어있음
		},

		WELL_WATERPUMP = {
			HIGH_PRESSURE = "콸콸", -- 압력 최대
			MIDDLE_PRESSURE = "충분해", -- 압력이 중간
			LOW_PRESSURE = "증기 필요해", -- 압력이 거의 없을때
			RECHARG_PRESSURE = "증기 없어", -- 압력이 아예 없을때(여기까지 쓰면 압력이 최대가 될때까지 못씀.)
		},
		
		WELL_SPRINKLER =
		{ 
			LOWFUEL = "밥 필요해", -- 연료가 거의 없는 상태에서의 조사 대사
			ON = "친구들 한테 물 줘", -- 작동중임
			OFF = "친구들한테 매우 좋은 친구", --작동을 멈춘상태에서의 조사 대사
		},	
	},
}