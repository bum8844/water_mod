return {
	ACTIONFAIL =
	{
		GIVE =
		{
			WELL_NOTEMPTY = "", -- 우물에서 올라온 양동이 달려있는데 양동이 달려 함
			WELL_BUSY = "", -- 우물에 안 에 양동이가 들어가 있는데 달려 함
		}
	},

	ANNOUNCE_DRUNK = "", -- 취함
	ANNOUNCE_DRUNK_END = "", --술에서 좀 깸 (그로기)
	ANNOUNCE_DRUNK_IMMUNITY = "", --임시. 위그 전용,
	ANNOUNCE_NOTCHARGE = "", --번개염소가 충전이 안되서 양동이로 젖을 짤수 없음
	ANNOUNCE_NOTHIRSTSLEEP = "", -- 목이 마른데 밤에 잘려고 시도
	ANNOUNCE_NOTHIRSTSIESTA = "", -- 목이 마른데 낮에 잘려고 시도
	ANNOUNCE_SLEEP_END = "", --자고 일어나서 술에서 완전히 깸 
	ANNOUNCE_THIRST = "", --너무 목말라!

	ANNOUNCE_DCAPACITY_CRITICAL = "", --취하기 직전
	ANNOUNCE_DCAPACITY_HALF = "", -- 취기가 돌기 시작

	DESCRIBE =
	{
		BOILBOOK = "",

		WATER_CLEAN_ICE = "",--깨끗한 얼음물
		WATER_DIRTY_ICE = "", --더러운 얼음물

		SPICE_CAFFEINPEPPER = "" --후추 향신료

		WELL_KIT = "", --우물 키트
		WELL_SPRINKLER_KIT = "", --스프링클러 키트
		WELL_WATERPUMP_KIT = "", --스팀 물펌프 키트
		WELL_BURYING_KIT = "", -- 구멍 매설 키트
		WELL_DRILLING = "", --드릴로 구멍 뚫는 중
		WELL_DRILLING_ITEM = "", --드릴 아이템
		HOLE = "", --우물 구멍
		WELL = "", --우물

		-- 물 모드 식물

		TEA_TREE = "",--차나무
		DUG_TEA_TREE = "", --땅에서 파낸 차나무
		TEA_SEED = "", -- 차나무 열매
		TEA_SEED_COOKED = "", --구운 차나무 열매
		TEA_SEED_SAPLING = "", --차나무 새싹
		TEALEAVES = "", --찻잎
		TEALEAVES_DRIED = "", --말린 찻잎

		CAFFEINBERRY = "", --커피 덤불
		DUG_CAFFEINBERRY = "", --파낸 커피덤불
		CAFFEINBERRY_BEAN = "", --생 커피콩
		CAFFEINBERRY_BEAN_COOKED = "", --구운 커피콩

		RUINCACAO_TREE = "", --카카오 나무
		DUG_RUINCACAO_TREE = "", --파낸 카카오 나무
		RUINCACAO_SEED = "", --카카오 새싹 아이템
		RUINCACAO_SEED_SAPLING = "", -- 카카오 새싹 심은거
		RUINCACAO = "", --부수기 전 카카오 열매
		RUINCACAO_BEAN = "", --부순 후 카카오 콩  
		RUINCACAO_BEAN_COOKED = "", --구운 카카오 콩

		-- 증류주 첨가제

		ADDITIVE_SEED = "", -- 리큐르에 제조에 첨가 할 씨허브(아니스,쥬니퍼베리,팔각 모티브)첨가제 
		ADDITIVE_PETALS = "", -- 리큐르에 제조에 첨가 할 허브,녹차,꽃잎 첨가제
		ADDITIVE_NUT = "", -- 리큐르에 제조에 첨가 할 버치넛,코코넛,커피콩,카카오콩 첨가제
		ADDITIVE_DAIRY = "", -- 리큐르에 제조에 첨가할 유제품 첨가제

		-- 음료

		WATER_CLEAN = "", --깨끗한 물
		WATER_DIRTY = "", --더러운 물
		WATER_SALTY = "", --바닷물

		GOOPYDRINK = "", --실패한 음료(웻 굽 개념)
		
		-- 주전자 음료

		FRUITJUICE = "", --잡 과일쥬스
		BERRIES_JUICE = "", -- 베리 쥬스
		POMEGRANATE_JUICE = "", -- 석류 쥬스
		BANANA_JUICE = "", -- 바나나 쥬스
		FIG_JUICE = "", -- 무화과 쥬스
		DRAGONJUICE = "", --용과 쥬스
		GLOWBERRYJUICE = "", -- 발광베리 쥬스
		WATERMELON_JUICE = "", --수박 쥬스

		VEGGIE_TEA = "", --녹즙
		CARROT_TEA = "", --당근차
		CACTUS_TEA = "", --선인차
		TOMATO_JUICE = "", --토마토 쥬스
		LUMPY_TEA = "" --뿌리차,
		SEAWEED_SHAKE = "", --해초 쉐이크
		
		GREENTEA = "", --생잎 녹차
		BLACKTEA = "", --홍차
		BLACKTEA_ICED = "", -- 홍차 아이스티
		FUER = "", --보이차,이파리차,고사리차
		MIXFLOWER = "", --잡 꽃잎 차
		HIBISCUSTEA = "", --히비스커스 차
		CACTUSFLOWER_TEA = "", --선인꽃차
		LOTUSTEA = "", --연꽃차
		SUSHIBISCUS = "", -- 자살차
		MOON_BLOSSOM_TEA = "", --달꽃차

		CAFFEINBERRY_JUICE = "", -- 블랙 커피
        TOFFEE_LATTE = "", --토피넛 라떼
		RUINCHA_LATTE = "", --모카 라떼(커피+초코)
		
		HOTRUINCOLATE = "", --핫초코
		RUINCOLATE_SMOOTHIE = "", --초코 스무디(차가움)
		RUINXOCOLATL = "", --쇼콜라틀(매캐함)
		TEA_RUINCOLATE_LATTE = "", -- 말차 라떼

		MULLED = "", --뱅쇼
		BUTTERBEER = "", --해리포터 시리즈의 버터비어

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

		SPOILED_DRINK = "", --썩은 음료

		-- 양조소다
	
		SODA = "", -- 탄산수
		FRUITSODA = "", -- 과일소다
		LEMONLIMESODA = "", -- 레몬 라임소다(과일소다 상위 호환)
		COLA = "", -- 콜라
		COLAQUANTUM = "", --콜라 퀀텀
		LUMPY_BEER = "", --루트비어(술이 아님)

		-- 양조주

		CORN_BEER = "", -- 콘 맥주
		MADHU = "", --벌꿀주
		WINE = "", --와인 (그냥 베리 양조)
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
		LUMPY_VODKA = "", -- 보드카
		TEQUILA = "", -- 데킬라
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

		NUT_COCONUT_BRANDY = "", -- 코코넛 브랜디 (캐러비안 럼을 만들수 없어서 카리브 브랜디 라는 이름으로 대체)
	    GIANT_BLUEBERRY_GIN = "", -- 붐 베리 사파이어 (당근 폭발함)

		--냄비 요리

        DARK_RUINCOLATE = "", --다크 초콜릿.
        WHITE_RUINCOLATE = "", --화이트 초콜릿
        RUINCOLATE = "", -- 그냥 초콜릿
        RUIN_SCHOKAKOLA = "", -- 쇼카콜라

		BUCKET_STEEL_EMPTY = 
		{
			EMPTY = "", --빈 양철 양동이
			FULL = "", -- 깨끗한 빗물이 참
			FULL_ICE = "", -- 빗물이 얼어버림
			DIRTY = "", --빗물이 더러워짐
			DIRTY_ICE = "", --더러운 빗물이 얼어버림
		},

		BUCKET_WOODIE_EMPTY = 
		{
			EMPTY = "", --우디의 빈 나무 양동이
			FULL = "",  --깨끗한 빗물이 참
			FULL_ICE = "", --빗물이 얼어버림
			DIRTY = "", --빗물이 더러워짐
			DIRTY_ICE = "", --더러운 빗물 얼어버림
		},

		BUCKET_EMPTY = 
		{
			EMPTY = "", -- 빈 나무 양동이
			FULL = "", -- 깨끗한 빗물이 참
			FULL_ICE = "", --빗물이 얼어버림
			DIRTY = "", --빗물이 더러워짐
			DIRTY_ICE = "", --더러운 빗물 얼어버림
		},

		DESALINATOR =
		{
			EMPTY = "", --제염기에 물이 없음
			PURIFY_LONG = "", -- 정수 끝나기까지 많이 남음
			PURIFY_SHORT = "", -- 정수가 곧 끝남
			HASWATER = "", --제염기에 깨끗한 물이 있음
			BURNT = "",   --제염기가 타버림
			HASSALT = "", --제염기에 소금이 남아 있음
		},

		BARREL =
		{
			GENERIC = "", -- 물통 조사 대사
			BURNT = "", -- 물통이 타버림
		},

		BREWERY =
		{
			EMPTY = "", --양조기 조사 대사
			BURNT = "", --양조기 타버림
			FERMENTING_LONG = "", --양조 끝나기 까지 많이 남음
			FERMENTING_SHORT = "", --양조가 곧 끝남
			DONE = "", --양조기에 음료가 들어있음
		},

		CAMPKETTLE_ITEM = "", --휴대 주전자 아이템 조사 대사
		CAMPKETTLE =
		{
			GENERIC = "", -- 화덕에 건 휴대 주전자 안에 물이 없음
			BOILING_LONG = "", -- 물 끓이기 시작함
			BOILING_SHORT = "", -- 물 거의 다 끓음
			DONE = "", --깨끗한 물이 들음
			STOP = "", --화덕에 불이 없어서 더러운물이 끓지 않는 상태
		},

		CAMPDESALINATOR_ITEM = "", --휴대 제염기 아이템 조사 대사
		CAMPDESALINATOR = 
		{
			GENERIC = "", --물 없음
			BOILING_LONG = "", --물 끓이기 시작
			BOILING_SHORT = "", --거의 다 끓음 
			DONE = "", -- 깨끗한 물이 들음
			STOP = "", -- 화덕에 불이 없어서 소금물이 정수 되지 않는 상태
		},

		KETTLE =
		{
			EMPTY = "", --빈 주전자 조사대사
			BURNT = "", --주전자가 불탐
			BOILING_LONG = "", -- 음료를 만들기 시작한지 얼마 안됨
			BOILING_SHORT = "", --음료 조리가 거의 끝나감
			DONE = "", --음료가 완성됨
			PURIFY_LONG = "", -- 더러운 물을 끓이기 시작한지 얼마 안됨
			PURIFY_SHORT = "", --더러운물을 거의 다 끓여감
			HASWATER = "", -- 깨끗한 물이 차 있는 상태
			MELT_LONG = "", -- 얼음물을 녹이기 시작한지 얼마 안됨
			MELT_SHORT = "", -- 얼음물을 거의 녹여감
		},

		PORTABLEKETTLE_ITEM =
		{
			GENERIC = "", -- 휴대용 주전자(아이템) 조사 대사
			EMPTY = "", -- 설치한 빈 휴대용 주전자 조사 대사
			BOILING_LONG = "", -- 음료를 만들기 시작한지 얼마 안됨
			BOILING_SHORT = "", --음료 조리가 거의 끝나감
			DONE = "", --음료가 완성됨
			PURIFY_LONG = "", -- 더러운 물을 끓이기 시작한지 얼마 안됨
			PURIFY_SHORT = "", --더러운물을 거의 다 끓여감
			HASWATER = "", -- 깨끗한 물이 차 있는 상태
			MELT_LONG = "", -- 얼음물을 녹이기 시작한지 얼마 안됨
			MELT_SHORT = "", -- 얼음물을 거의 녹여감
		},
		
		DISTILLERS =
		{   
		    EMPTY = "", --증류기 조사 대사
			DISTILLTING_LONG = "", --증류가 끝나기 까지 많이 남음
			DISTILLING_SHORT = "", --증류가 곧 끝남
			DONE = "", --증류기에 음료가 들어있음
		},

		WELL_WATERPUMP = {
			HIGH_PRESSURE = "", -- 압력 최대
			MIDDLE_PRESSURE = "", -- 압력이 중간
			LOW_PRESSURE = "", -- 압력이 거의 없을때
			RECHARG_PRESSURE = "", -- 압력이 아예 없을때(여기까지 쓰면 압력이 최대가 될때까지 못씀.)
		},
		
		WELL_SPRINKLER =
		{ 
			LOWFUEL = "", -- 연료가 거의 없는 상태에서의 조사 대사
			ON = "", -- 작동중임
			OFF = "", --작동을 멈춘상태에서의 조사 대사
		},	
	},
}
--Merge this template to your speech table
--to add speech support for your own character mods.