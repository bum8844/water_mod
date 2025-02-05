return {
	ACTIONFAIL =
	{
		GIVE =
		{
			WELL_NOTEMPTY = "중복 입력 거부됨", -- 우물에 말라 빈 양동이 달려있는데 양동이 달려 함
			WELL_BUSY = "오류: 장치가 바쁨", -- 우물에 물 든 양동이 달려있는데 달려 함(AFS: '프린터가 바쁩니다' 패러디)
		}
	},

	ANNOUNCE_DRUNK = "경고: 화ㅏ하ㅏㅏㄱ 에ㅔㅔ엔ㅈㅈ진 ㅇ이사ㅏㅏㅏㅇ 출력", -- 취함
	ANNOUNCE_DRUNK_MUMBLE = 
	{
		--대사 추가해야함
	},
	ANNOUNCE_DRUNK_END = "화학엔진 출력 안정화", --술에서 좀 깸 (그로기)
	ANNOUNCE_DRUNK_IMMUNITY = "자가진단 : 화학엔진 / 정상", --임시 위그 전용,
	ANNOUNCE_NOTCHARGE = "해당개체 충전 요구", --번개염소가 충전이 안되서 양동이로 젖을 짤수 없음
	ANNOUNCE_NOTHIRSTSLEEP = "냉매부족으로 수면 모드 불가", -- 목이 마른데 밤에 잘려고 시도
	ANNOUNCE_NOTHIRSTSIESTA = "냉매부족으로 세션 동결 불가", -- 목이 마른데 낮에 잘려고 시도
	ANNOUNCE_SLEEP_END = "화학엔진 출력 정상화", --자고 일어나서 술에서 완전히 깸 
	ANNOUNCE_THIRST = "냉각수 보충 필요", --너무 목말라!

	ANNOUNCE_CAFFINE_BUFF_START = "모든 코어 비율 제한 : 49 " , -- 카페인 버프 시작 ( ALL CORE RATIO LIMIT : 49)
    ANNOUNCE_CAFFINE_BUFF_STOP = "코어 리미트 재설정중" ,  -- 카페인 버프 끝

    ANNOUNCE_SATIETY_BUFF_START = "" , -- 포만감 버프 시작
    ANNOUNCE_SATIETY_BUFF_STOP = "" ,  -- 포만감 버프 끝
    
    ANNOUNCE_CURE_WATERBORNE = "냉각수내 PH비율 조정중" ,  -- 78이는 실제로 사용되지 않음

	ANNOUNCE_DCAPACITY_CRITICAL = "경고: 화학엔진 이상 출력", --취하기 직전
	ANNOUNCE_DCAPACITY_HALF = "화학엔진 출력 변동 발생", -- 취기가 돌기 시작

	DESCRIBE =
	{
		BOILBOOK = "냉각수에 불순물을 조합하는 방법이 적힌 디렉토리", -- 요리책 물 모드 버전

		WATER_CLEAN_ICE = "얼어붙고 갇힌 물 하 하",--깨끗한 얼음물
		WATER_DIRTY_ICE = "더럽고 추악함", --더러운 얼음물

		SPICE_CAFFEINPEPPER = "무미건조한 음식에 향을 추가함", --후추 향신료
		SPICE_RUINCOLATE_SPREAD = "", -- 초콜릿 스프레드
		
		WELL_KIT = "설치에 수맥 요구", --우물 키트
		WELL_SPRINKLER_KIT = "사용에 주의할 것", --스프링클러 키트
		WELL_WATERPUMP_KIT = "고성능 물 시추장치", --스팀 물펌프 키트
		WELL_BURYING_KIT = "구멍을 막기위한 도구", -- 구멍 매설 키트
		WELL_DRILLING = "수맥 탐색 중", --드릴로 구멍 뚫는 중
		WELL_DRILLING_ITEM = "수맥 개발용 장치", --드릴 아이템(AFS: "A 'WELL'-DEVELOPING DEVICE"?)
		HOLE = "물을 뽑아내기 위한 구멍", --우물 구멍
		WELL = "물의 안정적 공급처", --우물
		BOTTLE_POUCH_SMALL = "",
		BOTTLE_POUCH_BIG = "",
		THERMOS_BOTTLE_SMALL = "",
		THERMOS_BOTTLE_BIG = "",
		WINE_CELLAR_PART = "",
		WINE_CELLAR = "",

		WX78MODULE_NONEDRUNK = "화학 엔진 출력보조", -- 78전용 묘듈
		PURIFICATION_TABLETS = "",

		-- 물 모드 식물

		TEA_TREE = "지속적인 찻잎 공급원",--차나무
		DUG_TEA_TREE = "토양 요구", --땅에서 파낸 차나무
		TEA_SEED = "소스코드 패키지", -- 차나무 열매
		TEA_SEED_COOKED = "생명활동 중단됨", --구운 차나무 열매
		TEA_SEED_SAPLING = "초기생장과정의 나무", --차나무 새싹
		TEALEAVES = "단순한 이파리", --찻잎 (JUST A BUNCH OF LEAVES)
		TEALEAVES_DRIED = "변형됨", --말린 찻잎 (IT IS MODIFIED)

		CAFFEINBERRY = "달의 영향을 받은 음용 콩 식물체", --커피 덤불(LUNAR-MUTATED DRINKABLE BEAN PLANT)
		DUG_CAFFEINBERRY = "토양을 요구", --파낸 커피덤불
		CAFFEINBERRY_BEAN = "음용 콩", --생 커피콩
		CAFFEINBERRY_BEAN_COOKED = "가열을 통해 최적화됨", --구운 커피콩(BEANS OPTIMIZED BY FIRE)

		RUINCACAO_TREE = "일반적이지 않은 형태의 카카오 나무", --카카오 나무
		DUG_RUINCACAO_TREE = "토양을 요구", --파낸 카카오 나무
		RUINCACAO_SEED = "당장 자라서 열매를 제공하라", --카카오 새싹 아이템
		RUINCACAO_SEED_SAPLING = "미량의 그림자와 공생 중", -- 카카오 새싹 심은거
		RUINCACAO = "약간의 후처리 필요", --부수기 전 카카오 열매
		RUINCACAO_BEAN = "가공할만한 가치 있음", --부순 후 카카오 콩
		RUINCACAO_SEED_COOKED = "검은콩을 불에 그을림", --구운 카카오 콩

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

		ADDITIVE_SEED = "생명의 파괴는 즐거움", -- 리큐르에 제조에 첨가 할 씨허브(아니스,쥬니퍼베리,팔각 모티브)첨가제 
		ADDITIVE_PETALS = "향미 증강용 이파리", -- 리큐르에 제조에 첨가 할 허브,녹차,꽃잎 첨가제
		ADDITIVE_NUT = "단단한 첨가물", -- 리큐르에 제조에 첨가 할 버치넛,코코넛,커피콩,카카오콩 첨가제
		ADDITIVE_DAIRY = "내 에탄올에 역겨운 불순물을 넣지 말아라", -- 리큐르에 제조에 첨가할 유제품 첨가제

		-- 음료

		WATER_CLEAN = "표준 냉각수 유출 주의", --깨끗한 물
		WATER_DIRTY = "외부 정수장치 필요", --더러운 물
		WATER_SALTY = "동체를 부식시킴", --바닷물

		GOOPYDRINK = "배로 끔찍해진 물", --실패한 음료(웻 굽 개념)
		
		-- 주전자 음료

		FRUITJUICE = "에너지포드 혼합물", --잡 과일쥬스
		BERRIES_JUICE = "훌륭한 당분공급원", -- 베리 쥬스
		POMEGRANATE_JUICE = "붉은 유체가 피를 연상케함", -- 석류 쥬스
		BANANA_JUICE = "유제품 아님", -- 바나나 쥬스
		FIG_JUICE = "유동성 자양분", -- 무화과 쥬스
		DRAGONJUICE = "액상형태의 섬유소", --용과 쥬스
		GLOWBERRYJUICE = "발광성 유체", -- 발광베리 쥬스
		WATERMELON_JUICE = "과즙을 다량포함한 음료", --수박 쥬스

		VEGGIE_TEA = "푸른 유기체의 피", --녹즙
		CARROT_TEA = "베타카로틴 농축액", --당근차
		CACTUS_TEA = "방화벽 완전 무력화", --선인차 (PROTECTIVE BARRIER NEUTRALIZED)
		TOMATO_JUICE = "처참하게 분쇄됨 하 하", --토마토 쥬스(IT'S UTTERLY CRUSHED HA HA)
		LUMPY_TEA = "루트 권한 획득", --뿌리차, (ROOT PERMISSION GRANTED)
		SEAWEED_SHAKE = "50% 해, 50% 초", --해초 쉐이크 (AFS: 스폰지밥 드립 플랭크톤이 스폰지밥 조종하는 에피소드에서 따옴)
		
		GREENTEA = "잎 우린 물일 뿐", --생잎 녹차 (IT IS JUST LEAF JUICE)
		BLACKTEA = "검은잎의 붉은추출물 모순적", --홍차 (RED EXTRACT FROM BLACK LEAF CONTRADICTION)
		BLACKTEA_ICED = "냉각력 향상됨", -- 홍차 아이스티
		FUER = "초엽 추출물 인상적", --보이차,이파리차,고사리차
		MIXFLOWER = "파괴된 아름다움의 맛", --잡 꽃잎 차
		HIBISCUSTEA = "진한 신맛 용액", --히비스커스 차 (CONCENTRATED SOURNESS SOLUTION)
		CACTUSFLOWER_TEA = "엽육에서 즙을!", --선인꽃차 (JUICE FROM FLESH!) (AFS: 선인꽃차는 녹색입니다 이천군수 자락서스 패러디)
		LOTUSTEA = "물에사는 꽃을 물로 끓인 것", --연꽃차
		SUSHIBISCUS = "상당히 기묘함", -- 자살차
		MOON_BLOSSOM_TEA = "더 이상 소생 불능 하 하 하", --달꽃차
		MENTHA_SPICATA_TEA = "", -- 박하차

		CAFFEINBERRY_JUICE = "오버클럭용 냉각제", -- 블랙 커피
        TOFFEE_LATTE = "볼트 미포함", --토피넛 라떼(BOLT NOT INCLUDED)
		RUINCHA_LATTE = "혼합 콩 혼합물", --모카 라떼(커피+초코)
		
		HOTRUINCOLATE = "카카오 냉각제", --핫초코
		RUINCOLATE_SMOOTHIE = "고가당 카카오 냉각제", --초코 스무디(차가움)
		RUINXOCOLATL = "무가당 카카오 냉각제", --쇼콜라틀(매캐함)
		TEA_RUINCOLATE_LATTE = "분쇄된 찻잎과 콩 추출물", -- 말차 라떼

		MULLED = "에탄올 대부분 소실", --뱅쇼
		BUTTERBEER = "무알콜 에탄올 부동액", --해리포터 시리즈의 버터비어(ETHANOL-FREE ETHANOL ANTIFREEZE)

        APPLEPINE_JUICE = "스폰지와의 연관성을 부정",
		APPLEPINE_SMOOTHIE = "",
		APPLEPINE_CAPPUCCINO = "",

		CITROYUZU_JUICE = "섭취를 위해 분쇄됨",
		CITROYUZU_TEA = "",
		EARLGREY_TEA = "",

		-- 콜라보 주전자 음료

		COCONUT_JUICE = "전해질이 풍부함", --난파선 코코넛 쥬스(RICH IN ELECTROLYTE)
		RAINBOW_SHAKE = "가시광선을 발산", --난파선 무지개 해파리 쉐이크
		QUARTZ_SHAKE = "지상 유기체와 바다 유기체를 섞음", --난파선 광대 물고기 쉐이크
		NETTLE_TEA = "",
		FRASH_BRAMBLE_TEA = "",
		TUBER_BLOOM_TEA = "",
		CHERRY_ROSEBERRIES_TEA = "장미향 유체", --체리숲 로즈힙 차
		CHERRY_HONEY_TEA = "당도 측정 시도: 실패", --체리숲 벚꽃꿀 차
		SWEET_RICE_DRINK = "경고: 과량의 엿당 함유", -- 비타협 식혜(WARNING: CONTAINS EXCESSIVE AMOUNTS OF MALTOSE)
		STRAWBERRY_SMOOTHIE = "질감이 나를 불쾌하게 함", -- 모어 푸드 팩 딸기 스무디
		STRAWBERRY_MILK_SMOOTHIE = "딸기가 포획된 형태", -- 모어 푸드 팩 딸기 스무디 라떼

		--양조기 음료

		SPOILED_DRINK = "냉각 계통에 부적합", --썩은 음료

		-- 양조소다
	
		SODA = "이산화탄소 수용액", -- 탄산수 (CO2 SOLUTION)
		FRUITSODA = "과당이 첨가된 이산화탄소 수용액", -- 과일소다 (CO2 SOLUTION WITH FRUCTOSE)
		LIMONSODA = "과당 다량 포함", -- 레몬 라임소다(과일소다 상위 호환)
		COLA = "멍청한 유기체들이 좋아하는 캐러맬 액체", -- 콜라
		COLAQUANTUM = "다량의 방사능 함유", --콜라 퀀텀
		LUMPY_BEER = "유기체의 탄산에 대한 집착 이해 불가", --루트비어(술이 아님)
		APPLEPINESODA = "파인 튜닝이 사용됨", -- 탄산 파인애플(오란씨)
		CITROYUZUSODA = "유기체의 행동을 독려시키기위해 제작됨", -- 탄산 오랜지(환타)
		DAWN_FOG = "",
		MOON_CAP_DRINK = "",

		-- 양조주

		CORN_BEER = "옥수수 - 알코올 애드온 설치됨", -- 콘 맥주
		MADHU = "일벌의 가공된 부산물", --벌꿀주
		WINE = "비효율적인 과정을 거친 베리", --와인 (그냥 베리 양조)
		NOBLEWINE = "한번의 조제 과정을 더 거침", --노블 와인(구운 베리 양조)
		SPARKLINGWINE = "소화기관에 치명적인 요소를 모두 포함", --스파클링 와인
		GLOWBERRYWINE = "자체발광성 술", --글로우 베리 와인
		KUMIS = " '/d3d7d4'/ 유지됨", -- 크므즈,산양유주 (포밍레인: d3d7d4는 유백색의 색상코드)
		LUMPY_WINE = "유기체의 뿌리는 다양한 용도로 사용", --서주(감자 고구마등 뿌리 술)
		PULQUE = "포함된 미생물의 자가진화의 끝은 언제인가", --풀케(선인주)
		RUINCACAO_WINE = "카카오 새로운 가능성 발견됨", -- 카카오 와인 
		MIDNIGHT_STORM = "",
		APPLEPINE_CIDER = "",
		MENTHA_SPICATA_WINE = "",

		-- 콜라보 소다

		CHERRY_DOCTOR_COLA = "누가 이런 혼종을 만들었는가", --체리숲 닥터 페퍼(닥터 체리)
		STRAWBERRYSODA = "영혼 악마놈을 연상시킴", -- 탄산 딸기(웰치스 딸기)

		--콜라보 양조주

		AUROBOW = "유희 애드온 포함", -- 난파선 오로보우,무지개 해파리주
		COCONUT_WINE = "음용화된 윤활유", -- 난파선 코코넛 와인
		NETTLE_WINE = "",
		CHERRY_BLOOM_MADHU = "기성 에탄올", -- 체리숲 벚꽃꿀주
		GIANT_BLUEBERRY_WINE = "여전히 위험함", -- 비타협 붐!베리 사파이어(불 붙히면 폭발함)
		RICE_WINE = "부산물 가공체", -- 비타협 막걸리
		WHEAT_BEER = "곡물 낭비임", -- 힙 오브 푸드 밀맥주
		PALE_BEER = "대중적인 부동액임", -- 레기온 페일에일 (몬스트라 열매를 쓴 청록색 맥주)

		--증류주

		DISINFECTANT = "살균성 수선제", -- 소독약(ANTISEPTIC REPAIR AGENT)
		CORN_WHISKEY = "농도 심화됨", -- 콘 위스키
		LUMPY_VODKA = "에탄올농도 굉장히 높음", -- 보드카
		TEQUILA = "태양의 적외선과 공명", -- 데킬라
		MADHU_RUM = "배 위의 환경과 호환됨", -- 럼주
		BERRY_BRANDY = "참으로 긴 공정", -- 베리 브랜디
		AREUHI = "P형 유동체", -- 크므즈 증류주 아르히
		APPLEPINE_BRANDY = "",
		VOID_BRANDY = "",
		VOID_GIN  = "",
		CITROYUZU_CURACAO = "",
		MENTHA_SPICATA_CURACAO = "",

		--왈리 전용 증류주

		BERRY_GIN = "인간사회에서 대중적임", --진
		GLOWBERRY_GIN = "발광성 에탄올", --글로우 베리 진
		ABSINTHE = "귀를 자르도록 만듬", -- 압생트
		TEA_LUMPY_VODKA = "엽록소 대량 포함", -- 녹차 리큐르
		PETALS_BERRY_BRANDY = "디퓨저로나 딱이다", -- 장미향 브랜디
		KAHLUA = "고에너지 기능 포함", -- 커피 리큐르 깔루아
		NUT_CORN_WHISKEY = "볼트는 어디에 있는가", -- 너트 위스키
        RUINCACAO_CREAM_LIQUEUR = "역겨운 타르와 단백질의 에탄올 추출물", --베일리스 카카오 크림 리큐르
        RUMCHATA = "역겨운 유기물을 어째서", -- 럼차타(럼에 오우차타 라는 유제품 섞은)

		--콜라보 증류주

		MOONWAY = "발광성 유기물질 보존함", -- 무지개 해파리주 증류주
		NETTLE_LIQUEUR = "",
		ARRACK = "고 섬유질성 에탄올", -- 아락 인도네시아 버전 코코넛 와인 증류주
		CHERRY_BLOOM_RUM = "쓸데없는 VFX 포함", -- 체리 꿀주 증류주 벛꽃잎 떠다
		RICE_SPIRITS = "부산물이 남음", --청주
		WHEAT_WHISKEY = "내 시간과 귀한 곡물을 투자함", -- 밀 위스크
		PALE_WHISKEY = "미국 방식", -- 페일 몰트 위스키

		--왈리 전용 콜라보 증류주

		NUT_COCONUT_BRANDY = "불쾌한 해양 유기체놈들의 전유물", -- 코코넛 브랜디 (캐러비안 럼을 만들수 없어서 카리브 브랜디 라는 이름으로 대체)
	    GIANT_BLUEBERRY_GIN = "엄청난 역학적 에너지를 가짐", -- 붐 베리 사파이어 (당근 폭발함)

		--냄비 요리

        DARK_RUINCOLATE = "순수한 카카오매스 가공물", --다크 초콜릿
        WHITE_RUINCOLATE = "카카오 버터 20% 함유", --화이트 초콜릿
        RUINCOLATE = "가공된 카카오", -- 그냥 초콜릿
        RUIN_SCHOKAKOLA = "고체연료 부스터", -- 쇼카콜라
        APPLEPINE_PIE = "",
        APPLEPINE_FRIED_RICE = "",
        CITROYUZU_BBQ = "",

		BUCKET_STEEL_EMPTY = 
		{
			EMPTY = "진보된 견고함", --빈 양철 양동이(ADVANCED STURDINESS)
			FULL = "망할 비라도 쓸모가 있음", -- 깨끗한 빗물이 참()
			FULL_ICE = "동결되었음", -- 빗물이 얼어버림(IT IS FROZEN)
			DIRTY = "내용물 변질됨", --빗물이 더러워짐(CONTENT CORRUPTED)
			DIRTY_ICE = "더러운 고체 물", --더러운 빗물이 얼어버림(FILTHY SOLID WATER)
		},

		BUCKET_WOODIE_EMPTY = 
		{
			EMPTY = "투박한 외형에도 불구 무결성에 문제 없음", --우디의 빈 나무 양동이(NO INTEGRITY ISSUE DESPITE THE RUSTIC APPEARANCE)
			FULL = "망할 비라도 쓸모가 있음",  --깨끗한 빗물이 참
			FULL_ICE = "동결되었음", --빗물이 얼어버림(IT IS FROZEN)
			DIRTY = "내용물 변질됨", --빗물이 더러워짐(CONTENT CORRUPTED)
			DIRTY_ICE = "더러운 고체 물", --더러운 빗물 얼어버림(FILTHY SOLID WATER)
		},

		BUCKET_DRIFTWOOD_EMPTY = 
		{
			EMPTY = "효율성 증가에 관심없음.", -- 유목양동이(ITS INCREASED EFFICIENCY DOES NOT IMPRESS ME)
			FULL = "망할 비라도 쓸모가 있음",  --깨끗한 빗물이 참
			FULL_ICE = "동결되었음", --빗물이 얼어버림(IT IS FROZEN)
			DIRTY = "내용물 변질됨", --빗물이 더러워짐(CONTENT CORRUPTED)
			DIRTY_ICE = "더러운 고체 물", --더러운 빗물 얼어버림(FILTHY SOLID WATER)
		},

		BUCKET_EMPTY = 
		{
			EMPTY = "끔찍한 물을 가둠", --  빈 나무 양동이(IT CONTAINS HORRIBLE WATER)
			FULL = "망할 비라도 쓸모가 있음", -- 깨끗한 빗물이 참()
			FULL_ICE = "동결되었음", --빗물이 얼어버림
			DIRTY = "내용물 변질됨", --빗물이 더러워짐(CONTENT CORRUPTED)
			DIRTY_ICE = "더럽고 굳었음", --더러운 빗물 얼어버림
		},

		DESALINATOR =
		{
			EMPTY = "입력물 필요", --제염기에 물이 없음
			PURIFY_LONG = "염분 분리 중", -- 정수 끝나기까지 많이 남음
			PURIFY_SHORT = "분리 거의 완료", -- 정수가 곧 끝남
			HASWATER = "담수화 성공", --제염기에 깨끗한 물이 있음
			BURNT = "기능 상실",   --제염기가 타버림(OUT OF ORDER)
			HASSALT = "부산물 제거 필요", --제염기에 소금이 남아 있음
		},

		BARREL =
		{
			GENERIC = "외장 물 저장장치", -- 물통 조사 대사
			BURNT = "물.exe 응답 없음", -- 물통이 타버림
		},

		BREWERY =
		{
			EMPTY = "미생물 배양기", --양조기 조사 대사(MICROORGANISM INCUBATOR)
			BURNT = "작동 강제 중단됨", --양조기 타버림(DEVICE SHUT DOWN)
			FERMENTING_LONG = "오래 걸릴 것임", --양조 끝나기 까지 많이 남음
			FERMENTING_SHORT = "거의 완료됨", --양조가 곧 끝남
			DONE = "배양 완료", --양조기에 음료가 들어있음(INCUBATION COMPLETE)
		},

		CAMPKETTLE_ITEM = "원시적인 불순물 제거수단", --휴대 주전자 아이템 조사 대사(PRIMITIVE METHOD OF PURIFICATION)
		CAMPKETTLE =
		{
			GENERIC = "수분보충 필요", -- 화덕에 건 휴대 주전자 안에 물이 없음
			BOILING_LONG = "작업 진척도 낮음", -- 물 끓이기 시작함
			BOILING_SHORT = "작업 진척도 높음", -- 물 거의 다 끓음
			DONE = "정수 완료됨", --깨끗한 물이 들음
			STOP = "가열 필요", --화덕에 불이 없어서 더러운물이 끓지 않는 상태
		},

		CAMPDESALINATOR_ITEM = "염분을 제거하기 위한 장치", --휴대 제염기 아이템 조사 대사
		CAMPDESALINATOR = 
		{
			GENERIC = "염수 보충 필요", --물 없음
			BOILING_LONG = "작업 진척도 낮음", --물 끓이기 시작
			BOILING_SHORT = "작업 진척도 높음", --거의 다 끓음 
			DONE = "염분 제거됨", -- 깨끗한 물이 들음
			STOP = "가열 필요", -- 화덕에 불이 없어서 소금물이 정수 되지 않는 상태
		},

		TEA_POT =
		{
			EMPTY = "빌어먹을 물에 쓸모를 부여", --빈 주전자 조사대사
			BURNT = "주전자 과열", --주전자가 불탐
			BOILING_LONG = "시간이 걸릴 것", -- 음료를 만들기 시작한지 얼마 안됨
			BOILING_SHORT = "거의 끝나감", --음료 조리가 거의 끝나감
			DONE = "냉각수 배합 완료", --음료가 완성됨
			PURIFY_LONG = "추가정수 진행 중", -- 더러운 물을 끓이기 시작한지 얼마 안됨
			PURIFY_SHORT = "정수 거의 완료", --더러운물을 거의 다 끓여감
			HASWATER = "추가입력 필요", -- 깨끗한 물이 차 있는 상태
			MELT_LONG = "해동작업 진행 중", -- 얼음물을 녹이기 시작한지 얼마 안됨
			MELT_SHORT = "해동 거의 완료", -- 얼음물을 거의 녹여감
		},

		PORTABLE_TEA_POT_ITEM =
		{
			GENERIC = "만나서 반갑다 나의 형제", -- 휴대용 주전자(아이템) 조사 대사
			EMPTY = "코드 418: 찻주전자임", -- 설치한 빈 휴대용 주전자 조사 대사(CODE 418: THIS IS A TEAPOT)(AFS: HTTP 응답코드에 관한 유명한 만우절 장난이 있습니다 418 I'm a teapot 검색)
			BOILING_LONG = "시간이 걸릴 것", -- 음료를 만들기 시작한지 얼마 안됨
			BOILING_SHORT = "거의 끝나감", --음료 조리가 거의 끝나감
			DONE = "냉각수 배합 완료", --음료가 완성됨
			PURIFY_LONG = "추가정수 진행 중", -- 더러운 물을 끓이기 시작한지 얼마 안됨
			PURIFY_SHORT = "정수 거의 완료", --더러운물을 거의 다 끓여감
			HASWATER = "추가입력 필요", -- 깨끗한 물이 차 있는 상태
			MELT_LONG = "해동작업 진행 중", -- 얼음물을 녹이기 시작한지 얼마 안됨
			MELT_SHORT = "해동 거의 완료", -- 얼음물을 거의 녹여감
		},

		KETTLE =
		{
			EMPTY = "빌어먹을 물에 쓸모를 부여", --빈 주전자 조사대사
			BURNT = "주전자 과열", --주전자가 불탐
			DONE = "냉각수 배합 완료", --음료가 완성됨
			PURIFY_LONG = "추가정수 진행 중", -- 더러운 물을 끓이기 시작한지 얼마 안됨
			PURIFY_SHORT = "정수 거의 완료", --더러운물을 거의 다 끓여감
			HASWATER = "추가입력 필요", -- 깨끗한 물이 차 있는 상태
			MELT_LONG = "해동작업 진행 중", -- 얼음물을 녹이기 시작한지 얼마 안됨
			MELT_SHORT = "해동 거의 완료", -- 얼음물을 거의 녹여감
		},

		PORTABLEKETTLE_ITEM =
		{
			GENERIC = "만나서 반갑다 나의 형제", -- 휴대용 주전자(아이템) 조사 대사
			EMPTY = "코드 418: 찻주전자임", -- 설치한 빈 휴대용 주전자 조사 대사(CODE 418: THIS IS A TEAPOT)(AFS: HTTP 응답코드에 관한 유명한 만우절 장난이 있습니다 418 I'm a teapot 검색)
			DONE = "냉각수 배합 완료", --음료가 완성됨
			PURIFY_LONG = "추가정수 진행 중", -- 더러운 물을 끓이기 시작한지 얼마 안됨
			PURIFY_SHORT = "정수 거의 완료", --더러운물을 거의 다 끓여감
			HASWATER = "추가입력 필요", -- 깨끗한 물이 차 있는 상태
			MELT_LONG = "해동작업 진행 중", -- 얼음물을 녹이기 시작한지 얼마 안됨
			MELT_SHORT = "해동 거의 완료", -- 얼음물을 거의 녹여감
		},
		
		DISTILLERS =
		{   
		    EMPTY = "또다른 훌륭한 형제", --증류기 조사 대사
			DISTILLTING_LONG = "시간이 오래 걸릴 것", --증류가 끝나기 까지 많이 남음
			DISTILLING_SHORT = "거의 완료됨", --증류가 곧 끝남
			DONE = "증류 프로세스 종료", --증류기에 음료가 들어있음
		},

		WELL_WATERPUMP = {
			HIGH_PRESSURE = "잔여압력 최대", -- 압력 최대
			MIDDLE_PRESSURE = "잔여압력 적당함", -- 압력이 중간
			LOW_PRESSURE = "잔여압력 낮음", -- 압력이 거의 없을때
			RECHARG_PRESSURE = "압력복원에 시간 필요", -- 압력이 아예 없을때(여기까지 쓰면 압력이 최대가 될때까지 못씀)
		},
		
		WELL_SPRINKLER =
		{ 
			LOWFUEL = "위험분자에게 연료를 공급해야 하는가?", -- 연료가 거의 없는 상태에서의 조사 대사
			ON = "으아아악!", -- 작동중임
			OFF = "계속 감시하라", --작동을 멈춘상태에서의 조사 대사
		},
	},
}