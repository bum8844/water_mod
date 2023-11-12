return {
	ACTIONFAIL =
	{
		GIVE =
		{
			WELL_NOTEMPTY = "중복 입력 거부", -- 우물에 말라 빈 양동이 달려있는데 양동이 달려 함
			WELL_BUSY = "양동이 하나로 충분함", -- 우물에 물 든 양동이 달려있는데 달려 함
		}
	},

	ANNOUNCE_DRUNK = "기ㄱ관 내 에탄올 농ㄷㄷ도 위험 수ㅊㅊ치", -- 취함
	ANNOUNCE_DRUNK_END = "기관 내 에탄올 농도 검출량 감소중", --술에서 좀 깸 (그로기)
	ANNOUNCE_DRUNK_IMMUNITY = "", --임시. 위그 전용,
	ANNOUNCE_NOTCHARGE = "해당 개체 충전 요구", --번개염소가 충전이 안되서 양동이로 젖을 짤수 없음
	ANNOUNCE_NOTHIRSTSLEEP = "수면 모드 가동을 위한 냉각용수 부족", -- 목이 마른데 밤에 잘려고 시도
	ANNOUNCE_NOTHIRSTSIESTA = "냉각수 부족 상태로 수면 불가", -- 목이 마른데 낮에 잘려고 시도
	ANNOUNCE_SLEEP_END = "기관 내 에탄올 농도 안정화", --자고 일어나서 술에서 완전히 깸 
	ANNOUNCE_THIRST = "과열 위험 높음", --너무 목말라!

	ANNOUNCE_DCAPACITY_CRITICAL = "기관 내 에탄올 농도 매우 높음", --취하기 직전
	ANNOUNCE_DCAPACITY_HALF = "기관 내 에탄올 농도 상승중", -- 취기가 돌기 시작

	DESCRIBE =
	{
		BOILBOOK = "냉각수에 불순물을 조합하는 방법이 적힌 디렉토리", -- 요리책 물 모드 버전

		WATER_CLEAN_ICE = "얼어붙고 갇힌 물. 하하하"--깨끗한 얼음물
		WATER_DIRTY_ICE = "더럽고 추악함", --더러운 얼음물

		SPICE_CAFFEINPEPPER = "무미건조한 음식에 향을 추가함" --후추 향신료

		WELL_KIT = "설치되기 위해 수맥을 요구", --우물 키트
		WELL_SPRINKLER_KIT = "위험한 친구 설치 파일", --스프링클러 키트
		WELL_WATERPUMP_KIT = "고귀한 동포의 소스코드", --스팀 물펌프 키트
		WELL_BURYING_KIT = "구멍을 막기 위한 도구", -- 구멍 매설 키트
		WELL_DRILLING = "수맥 탐색중", --드릴로 구멍 뚫는 중
		WELL_DRILLING_ITEM = "땅 밑의 물을 찾는 녀석", --드릴 아이템
		HOLE = "물을 뽑아내기 위한 구멍", --우물 구멍
		WELL = "물의 안정적 공급처", --우물

		-- 물 모드 식물

		TEA_TREE = "주기적 찻잎 분배기",--차나무
		DUG_TEA_TREE = "토양을 요구", --땅에서 파낸 차나무
		TEA_SEED = "소스코드를 포함", -- 차나무 열매
		TEA_SEED_COOKED = "본래 기능 유실", --구운 차나무 열매
		TEA_SEED_SAPLING = "토양에 설치중인 유기체", --차나무 새싹
		TEALEAVES = "처리되지 않은 유기체", --찻잎
		TEALEAVES_DRIED = "개선된 형태의 유기체", --말린 찻잎

		CAFFEINBERRY = "음용 콩 식물체. 달의 영향을 받음", --커피 덤불
		DUG_CAFFEINBERRY = "토양을 요구", --파낸 커피덤불
		CAFFEINBERRY_BEAN = "음용 콩", --생 커피콩
		CAFFEINBERRY_BEAN_COOKED = "진보된 형태의 콩", --구운 커피콩

		RUINCACAO_TREE = "일반적이지 않은 형태의 카카오 나무", --카카오 나무
		DUG_RUINCACAO_TREE = "토양을 요구", --파낸 카카오 나무
		RUINCACAO_SEED = "당장 자라서 카카오를 대령하라", --카카오 새싹 아이템
		RUINCACAO_SEED_SAPLING = "미량의 그림자와 공생중", -- 카카오 새싹 심은거
		RUINCACAO = "강한 압력을 요구", --부수기 전 카카오 열매
		RUINCACAO_BEAN = "가공할 만한 가치 있음", --부순 후 카카오 콩  
		RUINCACAO_BEAN_COOKED = "검은 콩을 불에 그을림", --구운 카카오 콩

		-- 증류주 첨가제

		ADDITIVE_SEED = "본래 기능을 달성하지 못할 씨앗", -- 리큐르에 제조에 첨가 할 씨허브(아니스,쥬니퍼베리,팔각 모티브)첨가제 
		ADDITIVE_PETALS = "술에 첨가되는 꽃잎", -- 리큐르에 제조에 첨가 할 허브,녹차,꽃잎 첨가제
		ADDITIVE_NUT = "고밀도 첨가물", -- 리큐르에 제조에 첨가 할 버치넛,코코넛,커피콩,카카오콩 첨가제
		ADDITIVE_DAIRY = "알코올과 유제품의 호환성은 어떠한가?", -- 리큐르에 제조에 첨가할 유제품 첨가제

		-- 음료

		WATER_CLEAN = "본좌는 물에 취약함에도 물을 요구. 하", --깨끗한 물
		WATER_DIRTY = "나 또한 정수 기능이 없음", --더러운 물
		WATER_SALTY = "염분 농도 평균 35psu의 바닷물", --바닷물

		GOOPYDRINK = "몇배로 끔찍해진 물", --실패한 음료(웻 굽 개념)
		
		-- 주전자 음료

		FRUITJUICE = "난잡한 유기체의 열매 함유", --잡 과일쥬스
		BERRIES_JUICE = "훌륭한 당분 공급원", -- 베리 쥬스
		POMEGRANATE_JUICE = "붉은 유동체가 피를 연상케 함", -- 석류 쥬스
		BANANA_JUICE = "우유는 아님", -- 바나나 쥬스
		FIG_JUICE = "해양 출신", -- 무화과 쥬스
		DRAGONJUICE = "고급스러운 식물체로 만든 고급스러운 유체", --용과 쥬스
		GLOWBERRYJUICE = "발광성 유체", -- 발광베리 쥬스
		WATERMELON_JUICE = "과즙을 다량 포함한 음료", --수박 쥬스

		VEGGIE_TEA = "푸른 유기체의 피", --녹즙
		CARROT_TEA = "높은 베타카로틴 함량", --당근차
		CACTUS_TEA = "가시 삭제됨", --선인차
		TOMATO_JUICE = "처참하게 갈린 유기체", --토마토 쥬스
		LUMPY_TEA = "유기체의 영양분 공급처를 달인 물" --뿌리차,
		SEAWEED_SHAKE = "단맛 및 짠맛 동시 검출", --해초 쉐이크
		
		GREENTEA = "잎이 녹아든 물일 뿐임", --생잎 녹차
		BLACKTEA = "검은 잎을 끓인 붉은 유체", --홍차
		BLACKTEA_ICED = "적절한 만큼 냉처리됨", -- 홍차 아이스티
		FUER = "나뭇잎에서 유래된 차. 인상적", --보이차,이파리차,고사리차
		MIXFLOWER = "꽃을 적당히 넣었음", --잡 꽃잎 차
		HIBISCUSTEA = "신맛이 검출됨", --히비스커스 차
		CACTUSFLOWER_TEA = "물이 붉게 물들었음", --선인꽃차
		LOTUSTEA = "물 위의 꽃을 물로 끓인 것", --연꽃차
		SUSHIBISCUS = "상당히 기묘함", -- 자살차
		MOON_BLOSSOM_TEA = "다른 무엇보다 우월함"

		CAFFEINBERRY_JUICE = "순수한 카페인 콩 음료", -- 블랙 커피
        TOFFEE_LATTE = "풍부한 비타민이 들어있음", --토피넛 라떼
		RUINCHA_LATTE = "두 종의 콩 혼합물", --모카 라떼(커피+초코)
		
		HOTRUINCOLATE = "뜨거운 카카오 음료일 뿐", --핫초코
		RUINCOLATE_SMOOTHIE = "기존 카카오와 다르게 매우 담", --초코 스무디(차가움)
		RUINXOCOLATL = "당이 추가로 첨가되지 않음", --쇼콜라틀(매캐함)
		TEA_RUINCOLATE_LATTE = "분진화된 찻잎 음료", -- 말차 라떼

		MULLED = "알코올이 거의 남지 않음", --뱅쇼
		BUTTERBEER = "알코올 성분 미검출", --해리포터 시리즈의 버터비어

		-- 콜라보 주전자 음료

		COCONUT_JUICE = "일반적인 코코넛보다 당도가 높음", --난파선 코코넛 쥬스
		RAINBOW_SHAKE = "가시광선을 발산", --난파선 무지개 해파리 쉐이크
		QUARTZ_SHAKE = "지상 유기체와 바다 유기체를 섞음", --난파선 광대 물고기 쉐이크
		CHERRY_ROSEBERRIES_TEA = "장미 향 유체", --체리숲 로즈힙 차
		CHERRY_HONEY_TEA = "당도 측정 시도: 실패", --체리숲 벚꽃꿀 차
		SWEET_RICE_DRINK = "감미료가 없음에도 단맛이 남", -- 비타협 식혜
		PINEANANAS_JUICE = "스폰지와의 연관성을 부정", -- 레기온 파인애플 주스
		ORANGE_JUICE = "섭취를 위해 분쇄됨", -- 모어 푸드 팩 오랜지 주스
		STRAWBERRY_SMOOTHIE = "질감이 나를 불쾌하게 함", -- 모어 푸드 팩 딸기 스무디
		STRAWBERRY_MILK_SMOOTHIE = "딸기가 포획된 형태", -- 모어 푸드 팩 딸기 스무디 라떼

		--양조기 음료

		SPOILED_DRINK = "마시긴 늦었음", --썩은 음료

		-- 양조소다
	
		SODA = "이산화 탄소를 함유한 액체", -- 탄산수
		FRUITSODA = "이산화 탄소 및 과당 함유", -- 과일소다
		LEMONLIMESODA = "구연산 다량 포함", -- 레몬 라임소다(과일소다 상위 호환)
		COLA = "멍청한 유기체들이 좋아하는 캐러맬 액체", -- 콜라
		COLAQUANTUM = "무해한 방사성 음료. 어찌 이것이 가능한가?", --콜라 퀀텀
		LUMPY_BEER = "인간. 탄산에 심한 집착을 보임", --루트비어(술이 아님)

		-- 양조주

		CORN_BEER = "옥수수 - 알코올 애드온 설치됨", -- 콘 맥주
		MADHU = "일벌의 가공된 부산물", --벌꿀주
		WINE = "비효율적인 과정을 거친 베리", --와인 (그냥 베리 양조)
		NOBLEWINE = "한번의 조제 과정을 더 거침", --노블 와인(구운 베리 양조)
		SPARKLINGWINE = "소화기관에 치명적인 요소를 모두 포함", --스파클링 와인
		GLOWBERRYWINE = "자체발광성 술", --글로우 베리 와인
		KUMIS = "투입물과 같은 흰색임", -- 크므즈,산양유주
		LUMPY_WINE = "유기체의 뿌리는 다양한 용도로 사용", --서주(감자 고구마등 뿌리 술)
		PULQUE = "녹색 본판과 다르게 복제본은 흰색임", --풀케(선인주)
		RUINCACAO_WINE = "카카오. 새로운 가능성 발견됨", -- 카카오 와인 

		-- 콜라보 소다

		CHERRY_DOCTOR_COLA = "누가 이런 혼종을 만들었는가", --체리숲 닥터 페퍼(닥터 체리)
		PINEANANASSODA = "파인 튜닝이 사용됨", -- 탄산 파인애플(오란씨)
		ORANGESODA = "유기체의 행동을 독려시키기 위해 제작됨", -- 탄산 오랜지(환타)
		STRAWBERRYSODA = "영혼 악마놈을 연상시킴", -- 탄산 딸기(웰치스 딸기)

		--콜라보 양조주

		AUROBOW = "유희 애드온 포함", -- 난파선 오로보우,무지개 해파리주
		COCONUT_WINE = "음용화된 윤활유", -- 난파선 코코넛 와인
		CHERRY_BLOOM_MADHU = "기생당한 유기체의 우수한 생산물", -- 체리숲 벚꽃꿀주
		GIANT_BLUEBERRY_WINE = "여전히 위험함", -- 비타협 붐!베리 사파이어(불 붙히면 폭발함)
		RICE_WINE = "부산물 가공체", -- 비타협 막걸리
		WHEAT_BEER = "곡물 낭비임", -- 힙 오브 푸드 밀맥주
		PALE_BEER = "창백한 유기체의 색임", -- 레기온 페일에일 (몬스트라 열매를 쓴 청록색 맥주)

		--증류주

		DISINFECTANT = "기관 청소는 중대사항", -- 소독약
		CORN_WHISKEY = "농도 심화됨", -- 콘 위스키
		LUMPY_VODKA = "알코올 농도 굉장히 높음", -- 보드카
		TEQUILA = "태양의 적외선과 공명", -- 데킬라
		MADHU_RUM = "배 위의 환경과 호환됨", -- 럼주
		BERRY_BRANDY = "참으로 긴 공정", -- 베리 브랜디
		AREUHI = "P형 유동체", -- 크므즈 증류주 아르히

		--왈리 전용 증류주

		BERRY_GIN = "인간 사회에서 대중적임", --진
		GLOWBERRY_GIN = "여전히 발광함", --글로우 베리 진
		ABSINTHE = "귀를 자르도록 만듬", -- 압생트
		TEA_LUMPY_VODKA = "내 알코올 수용체가 버틸 것인가?", -- 보드카
		PETALS_BERRY_BRANDY = "요리사는 술 제조를 겸직하도록", -- 장미향 브랜디
		KAHLUA = "카페인 콩 첨가됨", -- 커피 리큐르 깔루아
		NUT_CORN_WHISKY = "볼트는 어디에 있는가", -- 너트 위스키
        RUINCACAO_CREAM_LIQUEUR = "씁쓸함과 부드러움이 공존", --베일리스 카카오 크림 리큐르
        RUMCHATA = "또 다른 유제품 함유물", -- 럼차타(럼에 오우차타 라는 유제품 섞은)

		--콜라보 증류주

		MOONWAY = "빛나는 유기체. 많은 과정을 거침", -- 무지개 해파리주 증류주
		ARRACK = "향이 놀라울정도로 강함", -- 아락 인도네시아 버전 코코넛 와인 증류주
		CHERRY_BLOOM_RUM = "증류되었음에도 여전히 담", -- 체리 꿀주 증류주 벛꽃잎 떠다
		RICE_SPIRITS = "부산물이 남음", --청주
		WHEAT_WHISKEY = "내 시간과 귀한 곡물을 투자함", -- 밀 위스크
		PALE_WHISKEY = "미국 방식", -- 페일 몰트 위스키

		--왈리 전용 콜라보 증류주

		NUT_COCONUT_BRANDY = "불쾌한 해양 유기체놈들의 전유물", -- 코코넛 브랜디 (캐러비안 럼을 만들수 없어서 카리브 브랜디 라는 이름으로 대체)
	    GIANT_BLUEBERRY_GIN = "엄청난 역학적 에너지를 가짐", -- 붐 베리 사파이어 (당근 폭발함)

		--냄비 요리

        DARK_RUINCOLATE = "순수한 카카오매스 가공물", --다크 초콜릿.
        WHITE_RUINCOLATE = "카카오 버터 20% 함유", --화이트 초콜릿
        RUINCOLATE = "가공된 카카오", -- 그냥 초콜릿
        RUIN_SCHOKAKOLA = "카카오와 커피의 융합체", -- 쇼카콜라

		BUCKET_STEEL_EMPTY = 
		{
			EMPTY = "진화된 양동이. 견고함", --빈 양철 양동이
			FULL = "망할 비라도 쓸모가 있음", -- 깨끗한 빗물이 참
			FULL_ICE = "동결되었음", -- 빗물이 얼어버림
			DIRTY = "불순물 첨가됨", --빗물이 더러워짐
			DIRTY_ICE = "더럽고 굳었음", --더러운 빗물이 얼어버림
		},

		BUCKET_WOODIE_EMPTY = 
		{
			EMPTY = "나무꾼 노예 녀석이 만든 양동이", --우디의 빈 나무 양동이
			FULL = "망할 비라도 쓸모가 있음",  --깨끗한 빗물이 참
			FULL_ICE = "동결되었음", --빗물이 얼어버림
			DIRTY = "불순물 첨가됨", --빗물이 더러워짐
			DIRTY_ICE = "더럽고 굳었음", --더러운 빗물 얼어버림
		},

		BUCKET_EMPTY = 
		{
			EMPTY = "끔찍한 물을 가둠", --  빈 나무 양동이
			FULL = "망할 비라도 쓸모가 있음", -- 깨끗한 빗물이 참
			FULL_ICE = "동결되었음", --빗물이 얼어버림
			DIRTY = "불순물 첨가됨", --빗물이 더러워짐
			DIRTY_ICE = "더럽고 굳었음", --더러운 빗물 얼어버림
		},

		DESALINATOR =
		{
			EMPTY = "입력물 필요", --제염기에 물이 없음
			PURIFY_LONG = "염분 제거 - 시간을 더 요구", -- 정수 끝나기까지 많이 남음
			PURIFY_SHORT = "거의 끝났음", -- 정수가 곧 끝남
			HASWATER = "염분 제거 프로세스. 성공적", --제염기에 깨끗한 물이 있음
			BURNT = "이제 소금물을 마셔야 할 것임",   --제염기가 타버림
			HASSALT = "잔류 염분 존재", --제염기에 소금이 남아 있음
		},

		BARREL =
		{
			GENERIC = "물 전용 SSD", -- 물통 조사 대사
			BURNT = "물.exe가 응답하지 않음", -- 물통이 타버림
		},

		BREWERY =
		{
			EMPTY = "물을 삭히는 장치", --양조기 조사 대사
			BURNT = "비참하게 연소했음", --양조기 타버림
			FERMENTING_LONG = "오래 걸릴 것임", --양조 끝나기 까지 많이 남음
			FERMENTING_SHORT = "거의 완료됨", --양조가 곧 끝남
			DONE = "삭힘 프로세스 종료됨", --양조기에 음료가 들어있음
		},

		CAMPKETTLE_ITEM = "불순물 제거를 위한 원시적 장치", --휴대 주전자 아이템 조사 대사
		CAMPKETTLE =
		{
			GENERIC = "수분 미포함", -- 화덕에 건 휴대 주전자 안에 물이 없음
			BOILING_LONG = "작업 진척도 낮음", -- 물 끓이기 시작함
			BOILING_SHORT = "작업 진척도 높음", -- 물 거의 다 끓음
			DONE = "정수가 완료되었음", --깨끗한 물이 들음
			STOP = "화력 추가 투입 요구", --화덕에 불이 없어서 더러운물이 끓지 않는 상태
		},

		CAMPDESALINATOR_ITEM = "염분을 제거하기 위한 장치", --휴대 제염기 아이템 조사 대사
		CAMPDESALINATOR = 
		{
			GENERIC = "바닷물 미포함", --물 없음
			BOILING_LONG = "작업 진척도 낮음", --물 끓이기 시작
			BOILING_SHORT = "작업 진척도 높음", --거의 다 끓음 
			DONE = "염분 제거됨", -- 깨끗한 물이 들음
			STOP = "화력 추가 투입 요구", -- 화덕에 불이 없어서 소금물이 정수 되지 않는 상태
		},

		KETTLE =
		{
			EMPTY = "빌어먹을 물에 쓸모를 부여", --빈 주전자 조사대사
			BURNT = "주전자 과열", --주전자가 불탐
			BOILING_LONG = "시간이 걸릴 것", -- 음료를 만들기 시작한지 얼마 안됨
			BOILING_SHORT = "거의 끝나감", --음료 조리가 거의 끝나감
			DONE = "끓이기 프로세스 완료", --음료가 완성됨
			PURIFY_LONG = "시간을 더 요구", -- 더러운 물을 끓이기 시작한지 얼마 안됨
			PURIFY_SHORT = "정수가 거의 끝남", --더러운물을 거의 다 끓여감
			HASWATER = "추가적인 투입을 요구", -- 깨끗한 물이 차 있는 상태
			MELT_LONG = "해동에 시간이 필요", -- 얼음물을 녹이기 시작한지 얼마 안됨
			MELT_SHORT = "거의 다 녹음", -- 얼음물을 거의 녹여감
		},

		PORTABLEKETTLE_ITEM =
		{
			GENERIC = "만나서 반갑다. 나의 형제", -- 휴대용 주전자(아이템) 조사 대사
			EMPTY = "일을 시작할 때다. 형제여", -- 설치한 빈 휴대용 주전자 조사 대사
			BOILING_LONG = "시간이 걸릴 것", -- 음료를 만들기 시작한지 얼마 안됨
			BOILING_SHORT = "거의 끝나감", --음료 조리가 거의 끝나감
			DONE = "끓이기 프로세스 완료", --음료가 완성됨
			PURIFY_LONG = "시간을 더 요구", -- 더러운 물을 끓이기 시작한지 얼마 안됨
			PURIFY_SHORT = "정수가 거의 끝남", --더러운물을 거의 다 끓여감
			HASWATER = "추가적인 투입을 요구", -- 깨끗한 물이 차 있는 상태
			MELT_LONG = "해동에 시간이 필요", -- 얼음물을 녹이기 시작한지 얼마 안됨
			MELT_SHORT = "거의 다 녹음", -- 얼음물을 거의 녹여감
		},
		
		DISTILLERS =
		{   
		    EMPTY = "술에 열을 가하라. 나의 어두운 동포여", --증류기 조사 대사
			DISTILLTING_LONG = "시간이 꽤나 걸릴 것", --증류가 끝나기 까지 많이 남음
			DISTILLING_SHORT = "거의 완료됨", --증류가 곧 끝남
			DONE = "알코올 - 증류되었음", --증류기에 음료가 들어있음
		},

		WELL_WATERPUMP = {
			HIGH_PRESSURE = "잔여 압력 최대", -- 압력 최대
			MIDDLE_PRESSURE = "잔여 압력 적당함", -- 압력이 중간
			LOW_PRESSURE = "잔여 압력 굉장히 적음", -- 압력이 거의 없을때
			RECHARG_PRESSURE = "잔여 압력 없음. 가동 중지됨", -- 압력이 아예 없을때(여기까지 쓰면 압력이 최대가 될때까지 못씀.)
		},
		
		WELL_SPRINKLER =
		{ 
			LOWFUEL = "친구가 연료를 원함", -- 연료가 거의 없는 상태에서의 조사 대사
			ON = "으아악", -- 작동중임
			OFF = "친구여. 내게 물을 뿌리지 말도록", --작동을 멈춘상태에서의 조사 대사
		},
	},
}