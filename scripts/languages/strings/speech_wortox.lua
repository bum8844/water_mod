return {
	ACTIONFAIL =
	{
		GIVE =
		{
			WELL_NOTEMPTY = "양동이 하나면 충분해.", -- 우물에서 올라온 양동이 달려있는데 양동이 달려 함
			WELL_BUSY = "", -- 우물에 안 에 양동이가 들어가 있는데 달려 함
		}
	},

	ANNOUNCE_DRUNK = "물질계랑 어둠계가 둘 다 보여!", -- 취함
	ANNOUNCE_DRUNK_END = "물질계가 명료해지기 시작했어.", --술에서 좀 깸 (그로기)
	ANNOUNCE_DRUNK_IMMUNITY = "", --임시. 위그 전용,
	ANNOUNCE_NOTCHARGE = "충전 좀 해야겠는데, 친구!", --번개염소가 충전이 안되서 양동이로 젖을 짤수 없음
	ANNOUNCE_NOTHIRSTSLEEP = "이대로 자면 아침엔 임프 육포가 될거야.", -- 목이 마른데 밤에 잘려고 시도
	ANNOUNCE_NOTHIRSTSIESTA = "말라서 육포가 되고싶진 않아.", -- 목이 마른데 낮에 잘려고 시도
	ANNOUNCE_SLEEP_END = "완전히 물질계로 돌아왔어!", --자고 일어나서 술에서 완전히 깸 
	ANNOUNCE_THIRST = "필멸자 같지만 물 좀 마셔야겠어!", --너무 목말라!

	ANNOUNCE_DCAPACITY_CRITICAL = "음료가 나를 어둠계로 끌고 가려고 한다!", --취하기 직전
	ANNOUNCE_DCAPACITY_HALF = "휘유, 이거 기분 죽이는데!", -- 취기가 돌기 시작

	DESCRIBE =
	{
		BOILBOOK = "",

		WATER_CLEAN_ICE = "마시긴 힘들겠는데.",--깨끗한 얼음물
		WATER_DIRTY_ICE = "흐유유! 불결해라!", --더러운 얼음물

		SPICE_CAFFEINPEPPER = "매콤한 노략물이야." --후추 향신료

		WELL_KIT = "목마른 필멸자가 우물을 파는법.", --우물 키트
		WELL_SPRINKLER_KIT = "털 적시는건 싫은데.", --스프링클러 키트
		WELL_WATERPUMP_KIT = "마법에 의존하는 우물이라니, 흐유유!", --스팀 물펌프 키트
		WELL_BURYING_KIT = "과거의 과오를 덮어버리는 도구지.", -- 구멍 매설 키트
		WELL_DRILLING = "세상에 구멍을 만드는 중이야.", --드릴로 구멍 뚫는 중
		WELL_DRILLING_ITEM = "흐유유, 땅 좀 파 보자고!", --드릴 아이템
		HOLE = "안쪽이 꽤 깊은데!", --우물 구멍
		WELL = "내릴 양동이를 찾아봐야겠네.", --우물

		-- 물 모드 식물

		TEA_TREE = "향기롭고 빈약한 나무야.",--차나무
		DUG_TEA_TREE = "빨리 어딘가 심어줘야겠네.", --땅에서 파낸 차나무
		TEA_SEED = "큰 녀석 안에 작은게 들어있어.", -- 차나무 열매
		TEA_SEED_COOKED = "불을 견디진 못했나봐.", --구운 차나무 열매
		TEA_SEED_SAPLING = "자라려고 저렇게 열심인걸!", --차나무 새싹
		TEALEAVES = "향긋한 냄새 나는 잎이야.", --찻잎
		TEALEAVES_DRIED = "말라 버렸네. 잔혹하기도 해라!", --말린 찻잎

		CAFFEINBERRY = "나랑은 다르게 파랗네.", --커피 덤불
		DUG_CAFFEINBERRY = "어디 심을 데 없나?", --파낸 커피덤불
		CAFFEINBERRY_BEAN = "기운찬 냄새 나는 콩이야.", --생 커피콩
		CAFFEINBERRY_BEAN_COOKED = "정신 드는 냄새가 나네.", --구운 커피콩

		RUINCACAO_TREE = "유쾌하고 으스스한 나무네. 흐유유!", --카카오 나무
		DUG_RUINCACAO_TREE = "집 근처에 심어도 되는걸까?", --파낸 카카오 나무
		RUINCACAO_SEED = "자라고 있는건가?", --카카오 새싹 아이템
		RUINCACAO_SEED_SAPLING = "신기하게도 자라네!", -- 카카오 새싹 심은거
		RUINCACAO = "타는 냄새 나는것 같지 않아?", --부수기 전 카카오 열매
		RUINCACAO_BEAN = "광물 같은 열매인걸.", --부순 후 카카오 콩  
		RUINCACAO_BEAN_COOKED = "기이하게도 냄새가 괜찮네.", --구운 카카오 콩

		-- 증류주 첨가제

		ADDITIVE_SEED = "매콤한 냉새가 나는데.", -- 리큐르에 제조에 첨가 할 씨허브(아니스,쥬니퍼베리,팔각 모티브)첨가제 
		ADDITIVE_PETALS = "음료를 만들기 위한 풀이네.", -- 리큐르에 제조에 첨가 할 허브,녹차,꽃잎 첨가제
		ADDITIVE_NUT = "필멸자들 이를 깰 수 있겠네!", -- 리큐르에 제조에 첨가 할 버치넛,코코넛,커피콩,카카오콩 첨가제
		ADDITIVE_DAIRY = "필멸자들이 이번엔 우유로 뭘 만들었을까?", -- 리큐르에 제조에 첨가할 유제품 첨가제

		-- 음료

		WATER_CLEAN = "필멸자들에겐 없어선 안될 것이지.", --깨끗한 물
		WATER_DIRTY = "흐유유, 정말 불결하네!", --더러운 물
		WATER_SALTY = "흐유유, 마실수록 목이 마르네!", --바닷물

		GOOPYDRINK = "불쾌한 실패작인걸.", --실패한 음료(웻 굽 개념)
		
		-- 주전자 음료

		FRUITJUICE = "별 게 다 들어갔네.", --잡 과일쥬스
		BERRIES_JUICE = "필멸자들이 좋아하는 단맛이야.", -- 베리 쥬스
		POMEGRANATE_JUICE = "씨앗이 없으니 지하에서 나가도 되겠네!", -- 석류 쥬스
		BANANA_JUICE = "필멸자들이 좋아할 음료수야.", -- 바나나 쥬스
		FIG_JUICE = "물 위에 매달렸다 그 속으로 들어갔지.", -- 무화과 쥬스
		DRAGONJUICE = "진짜 용 맛은 아닌가봐.", --용과 쥬스
		GLOWBERRYJUICE = "배가 빛나겠네. 흐유유!", -- 발광베리 쥬스
		WATERMELON_JUICE = "으음, 껄끄러운걸.", --수박 쥬스

		VEGGIE_TEA = "반만 느껴지는데도 쓰잖아!", --녹즙
		CARROT_TEA = "당근 좀 마셔도 별 일 없지.", --당근차
		CACTUS_TEA = "가시 들어간 건 아니겠지.", --선인차
		TOMATO_JUICE = "슬픈 토마토네. 흐유유!", --토마토 쥬스
		LUMPY_TEA = "뿌리 맛이 나는 음료네." --뿌리차,
		SEAWEED_SHAKE = "다시 말린 다시마야.", --해초 쉐이크
		
		GREENTEA = "뭔가 부족한데.", --생잎 녹차
		BLACKTEA = "잎은 붉은색이 아니었는데.", --홍차
		BLACKTEA_ICED = "앗. 차가워라. 흐유유!", -- 홍차 아이스티
		FUER = "그냥 나뭇잎이었는데.", --보이차,이파리차,고사리차
		MIXFLOWER = "꽃 달인 차야.", --잡 꽃잎 차
		HIBISCUSTEA = "마치 영혼 같네. 흐유유!", --히비스커스 차
		CACTUSFLOWER_TEA = "예쁜 꽃이었지. 마시기도 좋고 말이야!", --선인꽃차
		LOTUSTEA = "분홍색 영혼은 없는데 말이야.", --연꽃차
		SUSHIBISCUS = "돼지야. 내가 뭘 가져왔나 볼래?", -- 자살차
		MOON_BLOSSOM_TEA = "음료까지 달빛이잖아!", --달꽃차

		CAFFEINBERRY_JUICE = "이거 중독될 것 같은걸!", -- 블랙 커피
        TOFFEE_LATTE = "볼트도 필요하겠는데.", --토피넛 라떼
		RUINCHA_LATTE = "", --모카 라떼(커피+초코)
		
		HOTRUINCOLATE = "임프 내장을 따뜻하게 데워주지.", --핫초코
		RUINCOLATE_SMOOTHIE = "", --초코 스무디(차가움)
		RUINXOCOLATL = "", --쇼콜라틀(매캐함)
		TEA_RUINCOLATE_LATTE = "", -- 말차 라떼

		MULLED = "", --뱅쇼
		BUTTERBEER = "이상하게 마법이 느껴지네.", --해리포터 시리즈의 버터비어

		-- 콜라보 주전자 음료

		COCONUT_JUICE = "", --난파선 코코넛 쥬스
		RAINBOW_SHAKE = "", --난파선 무지개 해파리 쉐이크
		QUARTZ_SHAKE = "", --난파선 광대 물고기 쉐이크
		CHERRY_ROSEBERRIES_TEA = "", --체리숲 로즈힙 차
		CHERRY_HONEY_TEA = "", --체리숲 벚꽃꿀 차
		SWEET_RICE_DRINK = "", -- 비타협 식혜
		PINEANANAS_JUICE = "", -- 레기온 파인애플 주스
		ORANGE_JUICE = "", -- 모어 푸드 팩 오랜지 주스
		STRAWBERRY_SMOOTHIE = "", -- 모어 푸드 팩 딸기 스무디
		STRAWBERRY_MILK_SMOOTHIE = "", -- 모어 푸드 팩 딸기 스무디 라떼

		--양조기 음료

		SPOILED_DRINK = "정말 썩은 물이네!", --썩은 음료

		-- 양조소다
	
		SODA = "흐유유, 날 공격하는 물이잖아!", -- 탄산수
		FRUITSODA = "", -- 과일소다
		LEMONLIMESODA = "", -- 레몬 라임소다(과일소다 상위 호환)
		COLA = "", -- 콜라
		COLAQUANTUM = "", --콜라 퀀텀
		LUMPY_BEER = "", --루트비어(술이 아님)

		-- 양조주

		CORN_BEER = "알갱이는 다 어디 갔을까?", -- 콘 맥주
		MADHU = "벌처럼 알딸딸해지겠지!", --벌꿀주
		WINE = "사치스러운 필멸자 맛이야.", --와인 (그냥 베리 양조)
		NOBLEWINE = "", --노블 와인(구운 베리 양조)
		SPARKLINGWINE = "", --스파클링 와인
		GLOWBERRYWINE = "", --글로우 베리 와인
		KUMIS = "", -- 크므즈,산양유주
		LUMPY_WINE = "", --서주(감자 고구마등 뿌리 술)
		PULQUE = "", --풀케(선인주)
		RUINCACAO_WINE = "", -- 카카오 와인 

		-- 콜라보 소다

		CHERRY_DOCTOR_COLA = "", --체리숲 닥터 페퍼(닥터 체리)
		PINEANANASSODA = "", -- 탄산 파인애플(오란씨)
		ORANGESODA = "", -- 탄산 오랜지(환타)
		STRAWBERRYSODA = "", -- 탄산 딸기(웰치스 딸기)

		--콜라보 양조주

		AUROBOW = "", -- 난파선 오로보우,무지개 해파리주
		COCONUT_WINE = "", -- 난파선 코코넛 와인
		CHERRY_BLOOM_MADHU = "", -- 체리숲 벚꽃꿀주
		GIANT_BLUEBERRY_WINE = "", -- 붐 베리 와인 (불 붙히면 폭발함)
		RICE_WINE = "", -- 비타협 막걸리
		WHEAT_BEER = "", -- 힙 오브 푸드 밀맥주
		PALE_BEER = "", -- 레기온 페일에일 (몬스트라 열매를 쓴 청록색 맥주)

		--증류주

		DISINFECTANT = "", -- 소독약
		CORN_WHISKEY = "", -- 콘 위스키
		LUMPY_VODKA = "임프 몸에 이런건 좀 센데.", -- 보드카
		TEQUILA = "태양을 찬미하라! 흐유유.", -- 데킬라
		MADHU_RUM = "", -- 럼주
		BERRY_BRANDY = "", -- 베리 브랜디
		AREUHI = "", -- 크므즈 증류주 아르히

		--왈리 전용 증류주

		BERRY_GIN = "", --진
		GLOWBERRY_GIN = "", --글로우 베리 진
		ABSINTHE = "", -- 압생트
		TEA_LUMPY_VODKA = "", -- 녹차 리큐르
		PETALS_BERRY_BRANDY = "", -- 장미향 브랜디
		KAHLUA = "", -- 커피 리큐르 깔루아
		NUT_CORN_WHISKY = "", -- 너트 위스키
        RUINCACAO_CREAM_LIQUEUR = "", --베일리스 카카오 크림 리큐르
        RUMCHATA = "", -- 럼차타(럼에 오우차타 라는 유제품 섞은)

		--콜라보 증류주

		MOONWAY = "", -- 무지개 해파리주 증류주
		ARRACK = "", -- 아락 인도네시아 버전 코코넛 와인 증류주
		CHERRY_BLOOM_RUM = "", -- 체리 꿀주 증류주 벛꽃잎 떠다
		RICE_SPIRITS = "", --청주
		WHEAT_WHISKEY = "", -- 밀 위스크
		PALE_WHISKEY = "", -- 페일 몰트 위스키

		--왈리 전용 콜라보 증류주

		NUT_COCONUT_BRANDY = "해적질 좀 해볼까!", -- 코코넛 브랜디 (캐러비안 럼을 만들수 없어서 카리브 브랜디 라는 이름으로 대체)
	    GIANT_BLUEBERRY_GIN = "흐유유, 이거 재밌겠는데!", -- 붐 베리 사파이어 (당근 폭발함)

		--냄비 요리

        DARK_RUINCOLATE = "어둠계의 맛이지!", --다크 초콜릿.
        WHITE_RUINCOLATE = "밝고 느끼하지.", --화이트 초콜릿
        RUINCOLATE = "달고 쓴 맛 나는 블럭이야.", -- 그냥 초콜릿
        RUIN_SCHOKAKOLA = "까맣고 동그랗네.", -- 쇼카콜라

		BUCKET_STEEL_EMPTY = 
		{
			EMPTY = "물에서 철 맛 나는거 아닌가 몰라!", --빈 양철 양동이
			FULL = "", -- 깨끗한 빗물이 참
			FULL_ICE = "", -- 빗물이 얼어버림
			DIRTY = "", --빗물이 더러워짐
			DIRTY_ICE = "", --더러운 빗물이 얼어버림
		},

		BUCKET_WOODIE_EMPTY = 
		{
			EMPTY = "거의 그냥 밑동인걸.", --우디의 빈 나무 양동이
			FULL = "",  --깨끗한 빗물이 참
			FULL_ICE = "", --빗물이 얼어버림
			DIRTY = "", --빗물이 더러워짐
			DIRTY_ICE = "", --더러운 빗물 얼어버림
		},

		BUCKET_EMPTY = 
		{
			EMPTY = "물 담을 양동이야.", -- 빈 나무 양동이
			FULL = "", -- 깨끗한 빗물이 참
			FULL_ICE = "", --빗물이 얼어버림
			DIRTY = "", --빗물이 더러워짐
			DIRTY_ICE = "", --더러운 빗물 얼어버림
		},

		DESALINATOR =
		{
			EMPTY = "필멸자들이랑 다르게 짠 물을 원하고 있어.", --제염기에 물이 없음
			PURIFY_LONG = "꽤 시간이 걸릴 거야.", -- 정수 끝나기까지 많이 남음
			PURIFY_SHORT = "거의 다 됐다!", -- 정수가 곧 끝남
			HASWATER = "드디어 끝났나봐!", --제염기에 깨끗한 물이 있음
			BURNT = "다시 짠 물을 마셔야겠네. 흐유유!",   --제염기가 타버림
			HASSALT = "캬아악! 소금 냄새가 나잖아.", --제염기에 소금이 남아 있음
		},

		BARREL =
		{
			GENERIC = "영혼 대신 물로 가득 찼지.", -- 물통 조사 대사
			BURNT = "흐유유, 물이 타버렸잖아!", -- 물통이 타버림
		},

		BREWERY =
		{
			EMPTY = "필멸자들 입맛은 참 모르겠다니까.", --양조기 조사 대사
			BURNT = "흐유유, 사악한 불 같으니!", --양조기 타버림
			FERMENTING_LONG = "참 오래도 걸리겠지.", --양조 끝나기 까지 많이 남음
			FERMENTING_SHORT = "거의 다 됐나봐!", --양조가 곧 끝남
			DONE = "기다리다 말라 죽는줄 알았네!", --양조기에 음료가 들어있음
		},

		CAMPKETTLE_ITEM = "필멸자들이 살아남는 방법이지.", --휴대 주전자 아이템 조사 대사
		CAMPKETTLE =
		{
			GENERIC = "무에서 유를 창조하는건 안될 일이지!", -- 화덕에 건 휴대 주전자 안에 물이 없음
			BOILING_LONG = "꽤 시간이 걸릴 거야.", -- 물 끓이기 시작함
			BOILING_SHORT = "거의 다 끓였나 보네!", -- 물 거의 다 끓음
			DONE = "목 좀 축여보자고.", --깨끗한 물이 들음
			STOP = "약해, 약해, 약해!", --화덕에 불이 없어서 더러운물이 끓지 않는 상태
		},

		CAMPDESALINATOR_ITEM = "간단하게 소금을 따돌리기 위한 도구지.", --휴대 제염기 아이템 조사 대사
		CAMPDESALINATOR = 
		{
			GENERIC = "필멸자들이랑 다르게 짠 물을 원하고 있어.", --물 없음
			BOILING_LONG = "꽤 시간이 걸릴 거야.", --물 끓이기 시작
			BOILING_SHORT = "거의 다 된 것 같네!", --거의 다 끓음 
			DONE = "이제 마실 수 있겠네!", -- 깨끗한 물이 들음
			STOP = "약해, 약해, 약해!", -- 화덕에 불이 없어서 소금물이 정수 되지 않는 상태
		},

		KETTLE =
		{
			EMPTY = "텅텅 비었어.", --빈 주전자 조사대사
			BURNT = "필말자들 요리는 도통 이해가 안된다니까.", --주전자가 불탐
			BOILING_LONG = "꽤 시간이 걸릴 거야.", -- 음료를 만들기 시작한지 얼마 안됨
			BOILING_SHORT = "이거 정말 기대되는데!", --음료 조리가 거의 끝나감
			DONE = "물좀 마실 시간이네!", --음료가 완성됨
			PURIFY_LONG = "꽤 시간이 걸릴 거야.", -- 더러운 물을 끓이기 시작한지 얼마 안됨
			PURIFY_SHORT = "거의 다 됐나 보네!", --더러운물을 거의 다 끓여감
			HASWATER = "거의 다 됐나 보네!", -- 깨끗한 물이 차 있는 상태
			MELT_LONG = "꽤 시간이 걸릴 거야.", -- 얼음물을 녹이기 시작한지 얼마 안됨
			MELT_SHORT = "거의 녹았나 본데!", -- 얼음물을 거의 녹여감
		},

		PORTABLEKETTLE_ITEM =
		{
			GENERIC = "영혼을 끓일 순 없을까?", -- 휴대용 주전자(아이템) 조사 대사
			EMPTY = "텅텅 비었어.", -- 설치한 빈 휴대용 주전자 조사 대사
			BOILING_LONG = "꽤 시간이 걸릴 거야.", -- 음료를 만들기 시작한지 얼마 안됨
			BOILING_SHORT = "이거 정말 기대되는데!", --음료 조리가 거의 끝나감
			DONE = "물 좀 마실 시간이네!", --음료가 완성됨
			PURIFY_LONG = "꽤 시간이 걸릴 거야.", -- 더러운 물을 끓이기 시작한지 얼마 안됨
			PURIFY_SHORT = "거의 다 됐나 보네!", --더러운물을 거의 다 끓여감
			HASWATER = "이제 끓일 게 필요하겠네. 요청도 많아라!", -- 깨끗한 물이 차 있는 상태
			MELT_LONG = "꽤 시간이 걸릴 거야.", -- 얼음물을 녹이기 시작한지 얼마 안됨
			MELT_SHORT = "거의 녹았나 본데!", -- 얼음물을 거의 녹여감
		},
		
		DISTILLERS =
		{   
		    EMPTY = "뭐, 술이라도 좀 마셔 볼까.", --증류기 조사 대사
			DISTILLTING_LONG = "정말 오래 걸리겠는걸.", --증류가 끝나기 까지 많이 남음
			DISTILLING_SHORT = "너무 긴 시간이었어!" , --증류가 곧 끝남
			DONE = "어디 취해볼까!", --증류기에 음료가 들어있음
		},

		WELL_WATERPUMP = {
			HIGH_PRESSURE = "굉장한 소리가 나는데!", -- 압력 최대
			MIDDLE_PRESSURE = "소리가 좀 약해졌어.", -- 압력이 중간
			LOW_PRESSURE = "곧 꺼질 것 같은데.", -- 압력이 거의 없을때
			RECHARG_PRESSURE = "충전 좀 다시 해야겠는데!", -- 압력이 아예 없을때(여기까지 쓰면 압력이 최대가 될때까지 못씀.)
		},
		
		WELL_SPRINKLER =
		{ 
			LOWFUEL = "물질이 좀 더 필요해 보이네.", -- 연료가 거의 없는 상태에서의 조사 대사
			ON = "분수쇼 같은걸!", -- 작동중임
			OFF = "일하지 않고 쉬고 있어.", --작동을 멈춘상태에서의 조사 대사
		},	
	},
}