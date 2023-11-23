return {
	ACTIONFAIL =
	{
		GIVE =
		{
			WELL_NOTEMPTY = "물을 길을만한걸 가져와야지.", -- 우물에 말라 빈 양동이 달려있는데 양동이 달려 함
			WELL_BUSY = "기다리자꾸나.", -- 우물에 물 든 양동이 달려있는데 달려 함
		}
	},

	ANNOUNCE_DRUNK = "정신적.으..로...으흠..흠..", -- 취함
	ANNOUNCE_DRUNK_END = "아무튼 과음은 절대 금물이란다.", --술에서 좀 깸 (그로기)
	ANNOUNCE_DRUNK_IMMUNITY = "", --임시. 위그 전용,
	ANNOUNCE_NOTCHARGE = "젖을 짤 수 있는 상태가 아니란다.", --번개염소가 충전이 안되서 양동이로 젖을 짤수 없음
	ANNOUNCE_NOTHIRSTSLEEP = "", -- 목이 마른데 밤에 잘려고 시도
	ANNOUNCE_NOTHIRSTSIESTA = "", -- 목이 마른데 낮에 잘려고 시도
	ANNOUNCE_SLEEP_END = "", --자고 일어나서 술에서 완전히 깸 
	ANNOUNCE_THIRST = "사서에게 마실 것이 필요해.", --너무 목말라!

    ANNOUNCE_CAFFINE_BUFF_START = "카페인 수용체의 효과가 나타나기 시작하는구나.", -- 카페인 버프 시작
    ANNOUNCE_CAFFINE_BUFF_STOP = "몸에서 카페인 수용체의 대사가 끝났구나.",  -- 카페인 버프 끝
    
    ANNOUNCE_CURE_WATERBORNE = "풍토병의 고통이 완화되는구나.",  -- 수인성 질병을 아이템으로 치료했을때의 대사

	ANNOUNCE_DCAPACITY_CRITICAL = "과음하면 안 된단다. 과음은 간과 소화기에 악영향을 주고...", --취하기 직전
	ANNOUNCE_DCAPACITY_HALF = "적당한 음주는 몸에 어느 정도 이롭단다.", -- 취기가 돌기 시작

	DESCRIBE =
	{
		BOILBOOK = "음료 정보 모음집이란다.",

		WATER_CLEAN_ICE = "고체 상태의 물이야.",--깨끗한 얼음물
		WATER_DIRTY_ICE = "박테리아가 포함된 고체 상태의 물이야.", --더러운 얼음물

		SPICE_CAFFEINPEPPER = "과거에는 매우 귀한 향신료였단다." --후추 향신료

		WELL_KIT = "깊은 수맥에서 물을 기기 위해 쓰는 건축물 재료란다.", --우물 키트
		WELL_SPRINKLER_KIT = "농사할 때 깊은 수맥에서 물을 끌어다 쓰는 기계지.", --스프링클러 키트
		WELL_WATERPUMP_KIT = "깊은 수맥에서 물을 퍼 올리기 위한 기계란다.", --스팀 물펌프 키트
		WELL_BURYING_KIT = "수맥이 비거나 더 이상 안 사용할 때 메꾸는 도구들이지.", -- 구멍 매설 키트
		WELL_DRILLING = "수맥이 있는지 파보고 있어.", --드릴로 구멍 뚫는 중
		WELL_DRILLING_ITEM = "수맥이 있을 만한 적당한 장소를 찾아야겠어.", --드릴 아이템
		HOLE = "물소리가 들리는걸 보니 재대로 팠구나.", --우물 구멍
		WELL = "깊은 수맥에서 물을 기기 위해 쓰는 건축물이지.", --우물

		-- 물 모드 식물

		TEA_TREE = "자그마한 동백나무의 일종인 차나무로구나.",--차나무
		DUG_TEA_TREE = "성장하려면 토양이 필요하단다.", --땅에서 파낸 차나무
		TEA_SEED = "차나무의 씨앗이란다.", -- 차나무 열매
		TEA_SEED_COOKED = "심는쪽이 더 나았겠어.", --구운 차나무 열매
		TEA_SEED_SAPLING = "치나무의 종자가 성장할 것이야.", --차나무 새싹
		TEALEAVES = "찻잎중에서도 소엽종이란다.", --찻잎
		TEALEAVES_DRIED = "홍차의 재료로 쓰일것이야.", --말린 찻잎

		CAFFEINBERRY = "달 토양에서 자란 낮은 덤불이란다.", --커피 덤불
		DUG_CAFFEINBERRY = "커피 속과 후추 속의 특징이 혼합돼 있구나.", --파낸 커피덤불
		CAFFEINBERRY_BEAN = "향이 특이하구나.", --생 커피콩
		CAFFEINBERRY_BEAN_COOKED = "볶으니 진한 커피 향과 약간의 후추 향이 나는구나.", --구운 커피콩

		RUINCACAO_TREE = "열매가 싱크홀 아래로 떨어져 내린 게 틀림없구나.", --카카오 나무
		DUG_RUINCACAO_TREE = "성장하려면 토양이 필요하단다.", --파낸 카카오 나무
		RUINCACAO_SEED = "카카오 나무의 씨앗이란다.", --카카오 새싹 아이템
		RUINCACAO_SEED_SAPLING = "카카오 나무의 종자가 성장할 것이야.", -- 카카오 새싹 심은거
		RUINCACAO = "고대 아즈텍에서는 화폐로 이용되었었지.", --부수기 전 카카오 열매
		RUINCACAO_BEAN = "약간의 버터와 카카오 빈으로 이루어져 있어.", --부순 후 카카오 콩  
		RUINCACAO_BEAN_COOKED = "초콜릿이나 음료의 재료로 사용되지.", --구운 카카오 콩

		-- 증류주 첨가제

		ADDITIVE_SEED = "리큐르에 씨앗 향을 나게 만들어 준단다.", -- 리큐르에 제조에 첨가 할 씨허브(아니스,쥬니퍼베리,팔각 모티브)첨가제 
		ADDITIVE_PETALS = "리큐르에 잎과 꽃 향을 나게 만들어 준단다.", -- 리큐르에 제조에 첨가 할 허브,녹차,꽃잎 첨가제
		ADDITIVE_NUT = "리큐르에 열매 향을 나게 만들어 준단다.", -- 리큐르에 제조에 첨가 할 버치넛,코코넛,커피콩,카카오콩 첨가제
		ADDITIVE_DAIRY = "리큐르에 고소한 향을 나게 만들어 준단다.", -- 리큐르에 제조에 첨가할 유제품 첨가제

		-- 음료

		WATER_CLEAN = "생명에 필수적이란다. 화학식으로는 H2O이지.", --깨끗한 물
		WATER_DIRTY = "물에 박테리아가 들끓어서 풍토병 위험이 있어.", --더러운 물
		WATER_SALTY = "마시면 오히러 탈수를 일으킬수 있어.", --바닷물

		GOOPYDRINK = "이런,안돼,안돼,안돼,이러면 안되는데.", --실패한 음료(웻 굽 개념)
		
		-- 주전자 음료

		FRUITJUICE = "조금 엉성한 과일들로 만들어도 좋단다", --잡 과일쥬스
		BERRIES_JUICE = "백량금 열매의 약리작용으로는 해열, 소염등이 있단다.", -- 베리 쥬스
		POMEGRANATE_JUICE = "천연 에스트로겐이 풍부하단다.", -- 석류 쥬스
		BANANA_JUICE = "", -- 바나나 쥬스
		FIG_JUICE = "", -- 무화과 쥬스
		DRAGONJUICE = "백육종은 가장 은은한 향을 낸단다.", --용과 쥬스
		GLOWBERRYJUICE = "", -- 발광베리 쥬스
		WATERMELON_JUICE = "", --수박 쥬스

		VEGGIE_TEA = "몸에 좋은 음료는 쓴 법이지.", --녹즙
		CARROT_TEA = "", --당근차
		CACTUS_TEA = "", --선인차
		TOMATO_JUICE = "알콜을 해독하는데 도움을 주는 성분이 있구나.", --토마토 쥬스
		LUMPY_TEA = "풍토병을 완화 시켜주는 성분이 있단다." --뿌리차,
		SEAWEED_SHAKE = "", --해초 쉐이크
		
		GREENTEA = "아시아에서 부터 유래되었단다.", --생잎 녹차
		BLACKTEA = "차 한 잔과 좋은 책이 필요하단다.", --홍차
		BLACKTEA_ICED = "기운이 솟는구나.", -- 홍차 아이스티
		FUER = "풍토병에 걸렸을때 도움을 주는 성분이 있구나.", --보이차,이파리차,고사리차
		MIXFLOWER = "", --잡 꽃잎 차
		HIBISCUSTEA = "", --히비스커스 차
		CACTUSFLOWER_TEA = "", --선인꽃차
		LOTUSTEA = "", --연꽃차
		SUSHIBISCUS = "", -- 자살차
		MOON_BLOSSOM_TEA = "", --달꽃차

		CAFFEINBERRY_JUICE = "난 커피 한 잔과 책을 좋아한단다.", -- 블랙 커피
        TOFFEE_LATTE = "고소한 향을 한껏 올렸구나.", --토피넛 라떼
		RUINCHA_LATTE = "지명을 따왔단다. 커피와 초콜릿의 조합이지.", --모카 라떼(커피+초코)
		
		HOTRUINCOLATE = "쇼콜라틀이 유럽으로 넘어오면서 변형된 음료란다.", --핫초코
		RUINCOLATE_SMOOTHIE = "핫 초콜릿의 변형된 음료구나!", --초코 스무디(차가움)
		RUINXOCOLATL = "고대 아즈텍에서 부터 유래된 음료이지.", --쇼콜라틀(매캐함)
		TEA_RUINCOLATE_LATTE = "새로운 음료구나. 놀라워!", -- 말차 라떼

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

		SPOILED_DRINK = "마실 것이 박테리아의 온상이 되어가고 있어.", --썩은 음료

		-- 양조소다
	
		SODA = "이산화탄소가 용해되어 이온화된 물이란다.", -- 탄산수
		FRUITSODA = "탄산수에 과일즙이 첨가되어 있구나.", -- 과일소다
		LEMONLIMESODA = "단맛이 꽤 강하구나.", -- 레몬 라임소다(과일소다 상위 호환)
		COLA = "미국에서 인기를 끌고있는 음료이지.", -- 콜라(배경이 1907임 코카콜라가 존재함)
		COLAQUANTUM = "신기한 음료로구나. 놀라워!", --콜라 퀀텀(아직 체랜코프 현상이 발견 안돰(1911년도로 추정))
		LUMPY_BEER = "여러 뿌리 채소가 섞여있구나.", --루트비어(술이 아님)

		-- 양조주

		CORN_BEER = "기원은 고대 잉카로부터 시작된단다.", -- 콘 맥주
		MADHU = "봉밀주는 인류가 최초로 만든 술이라고 알려져 있지.", --벌꿀주
		WINE = "", --와인 (그냥 베리 양조)
		NOBLEWINE = "", --노블 와인(구운 베리 양조)
		SPARKLINGWINE = "", --스파클링 와인
		GLOWBERRYWINE = "", --글로우 베리 와인
		KUMIS = "", -- 크므즈,산양유주
		LUMPY_WINE = "", --서주(감자 고구마등 뿌리 술)
		PULQUE = "", --풀케(선인주)
		RUINCACAO_WINE = "", -- 카카오 와인 

		-- 콜라보 소다

		CHERRY_DOCTOR_COLA = "23가지의 향신료가 들어간 웨츠빌 완치 음료구나.", --체리숲 닥터 페퍼(닥터 체리)
		PINEANANASSODA = "파인애플과즙이 들어간 탄산수구나.", -- 탄산 파인애플(오란씨)
		ORANGESODA = "오렌지과즙이 들어가 있구나.", -- 탄산 오랜지(환타)
		STRAWBERRYSODA = "탄산수에 딸기과즙이 들어가 있구나.", -- 탄산 딸기(웰치스 딸기)

		--콜라보 양조주

		AUROBOW = "", -- 난파선 오로보우,무지개 해파리주
		COCONUT_WINE = "", -- 난파선 코코넛 와인
		CHERRY_BLOOM_MADHU = "", -- 체리숲 벚꽃꿀주
		GIANT_BLUEBERRY_WINE = "", -- 비타협 붐!베리 사파이어(불 붙히면 폭발함)
		RICE_WINE = "", -- 비타협 막걸리
		WHEAT_BEER = "고대 이집트로 부터 시작되었지.", -- 힙 오브 푸드 밀맥주
		PALE_BEER = "상면발효식 맥주의 한 종류란다.", -- 레기온 페일에일 (몬스트라 열매를 쓴 청록색 맥주)

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
		TEA_LUMPY_VODKA = "", -- 보드카
		PETALS_BERRY_BRANDY = "", -- 장미향 브랜디
		KAHLUA = "", -- 커피 리큐르 깔루아
		NUT_CORN_WHISKY = "", -- 너트 위스키
        RUINCACAO_CREAM_LIQUEUR = "", --베일리스 카카오 크림 리큐르
        RUMCHATA = "", -- 럼차타(럼에 오우차타 라는 유제품 섞은)

		--콜라보 증류주

		MOONWAY = "", -- 무지개 해파리주 증류주
		ARRACK = "", -- 아락 인도네시아 버전 코코넛 와인 증류주
		CHERRY_BLOOM_RUM = "", -- 체리 꿀주 증류주 벛꽃잎 떠다
		RICE_SPIRITS = "사케와 비슷하구나.", --청주
		WHEAT_WHISKEY = "", -- 밀 위스크
		PALE_WHISKEY = "", -- 페일 몰트 위스키

		--왈리 전용 콜라보 증류주

		NUT_COCONUT_BRANDY = "", -- 코코넛 브랜디 (캐러비안 럼을 만들수 없어서 카리브 브랜디 라는 이름으로 대체)
	    GIANT_BLUEBERRY_GIN = "", -- 붐 베리 사파이어 (당근 폭발함)

		--냄비 요리

        DARK_RUINCOLATE = "카카오 매스의 함유률이 높구나.", --다크 초콜릿.
        WHITE_RUINCOLATE = "카카오 버터의 함유률이 높단다.", --화이트 초콜릿
        RUINCOLATE = "쇼콜라틀을 고형분으로 만든 음식이란다.", -- 그냥 초콜릿
        RUIN_SCHOKAKOLA = "카페인 함량이 매우 높은 초콜릿이란다.", -- 쇼카콜라

		BUCKET_STEEL_EMPTY = 
		{
			EMPTY = "철 재질로 만들어진 동이란다.", --빈 양철 양동이
			FULL = "마실수 있는 깨끗한 물이야.", -- 깨끗한 빗물이 참
			FULL_ICE = "작은 얼음 덩어리야.", --빗물이 얼어버림
			DIRTY = "박테리아가 들끓고 있는 물이야.", --빗물이 더러워짐
			DIRTY_ICE = "박테리아가 포함된 작은 얼음 덩어리야.", --더러운 빗물 얼어버림
		},

		BUCKET_WOODIE_EMPTY = 
		{
			EMPTY = "통나무로 만들어진 동이란다.", --우디의 빈 나무 양동이
			FULL = "마실수 있는 깨끗한 물이야.", -- 깨끗한 빗물이 참
			FULL_ICE = "작은 얼음 덩어리야.", --빗물이 얼어버림
			DIRTY = "박테리아가 들끓고 있는 물이야.", --빗물이 더러워짐
			DIRTY_ICE = "박테리아가 포함된 작은 얼음 덩어리야.", --더러운 빗물 얼어버림
		},

		BUCKET_EMPTY = 
		{
			EMPTY = "나무로 만들어진 동이란다.", -- 빈 나무 양동이
			FULL = "마실수 있는 깨끗한 물이야.", -- 깨끗한 빗물이 참
			FULL_ICE = "작은 얼음 덩어리야.", --빗물이 얼어버림
			DIRTY = "박테리아가 들끓고 있는 물이야.", --빗물이 더러워짐
			DIRTY_ICE = "박테리아가 포함된 작은 얼음 덩어리야.", --더러운 빗물 얼어버림
		},

		DESALINATOR =
		{
			EMPTY = "바닷물을 이 기기를 이용해서 물과 소금을 분리한단다.", --제염기에 물이 없음
			PURIFY_LONG = "", -- 정수 끝나기까지 많이 남음
			PURIFY_SHORT = "", -- 정수가 곧 끝남
			HASWATER = "", --제염기에 깨끗한 물이 있음
			BURNT = "",   --제염기가 타버림
			HASSALT = "소금이 충분히 모였구나.", --제염기에 소금이 남아 있음
		},

		BARREL =
		{
			GENERIC = "물을 안전하게 보관을 위해 숯이 첨가되었단다.", -- 물통 조사 대사
			BURNT = "", -- 물통이 타버림
		},

		BREWERY =
		{
			EMPTY = "식량의 장기 보존을 위해 술을 만들기 시작했단다.", --양조기 조사 대사
			BURNT = "", --양조기 타버림
			FERMENTING_LONG = "", --양조 끝나기 까지 많이 남음
			FERMENTING_SHORT = "", --양조가 곧 끝남
			DONE = "", --양조기에 음료가 들어있음
		},

		CAMPKETTLE_ITEM = "", --휴대 주전자 아이템 조사 대사
		CAMPKETTLE =
		{
			GENERIC = "더러운 물을 끓여서 박테리아를 박멸한단다.", -- 화덕에 건 휴대 주전자 안에 물이 없음
			BOILING_LONG = "", -- 물 끓이기 시작함
			BOILING_SHORT = "", -- 물 거의 다 끓음
			DONE = "", --깨끗한 물이 들음
			STOP = "", --화덕에 불이 없어서 더러운물이 끓지 않는 상태
		},

		CAMPDESALINATOR_ITEM = "", --휴대 제염기 아이템 조사 대사
		CAMPDESALINATOR = 
		{
			GENERIC = "바닷물을 증발시켜서 물을 얻는단다.", --물 없음
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
		    EMPTY = "양조주를 이용해서 증류주나, 리큐르를 만들때 쓴단다.", --증류기 조사 대사
			DISTILLTING_LONG = "", --증류가 끝나기 까지 많이 남음
			DISTILLING_SHORT = "", --증류가 곧 끝남
			DONE = "", --증류기에 음료가 들어있음
		},

		WELL_WATERPUMP = {
			HIGH_PRESSURE = "압력이 매우 충분하단다.", -- 압력 최대
			MIDDLE_PRESSURE = "압력이 적당하단다.", -- 압력이 중간
			LOW_PRESSURE = "압력이 매우 낮구나.", -- 압력이 거의 없을때
			RECHARG_PRESSURE = "압력이 충전될 때까지 사용을 못한단다.", -- 압력이 아예 없을때(여기까지 쓰면 압력이 최대가 될때까지 못씀.)
		},
		
		WELL_SPRINKLER =
		{ 
			LOWFUEL = "", -- 연료가 거의 없는 상태에서의 조사 대사
			ON = "", -- 작동중임
			OFF = "", --작동을 멈춘상태에서의 조사 대사
		},	
	},
}