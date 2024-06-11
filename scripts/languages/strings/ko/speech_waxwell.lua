return {
	ACTIONFAIL =
	{
		GIVE =
		{
			WELL_NOTEMPTY = "물동이부터 떼내야겠군.", -- 우물에 말라 빈 양동이 달려있는데 양동이 달려 함
			WELL_BUSY = "아주 우물을 들고 마시겠네.", -- 우물에 물 든 양동이 달려있는데 달려 함
		}
	},
	
	ANNOUNCE_DRUNK = "으윽, 좀 취한 것 같군.", -- 취함
	ANNOUNCE_DRUNK_END = "이제 좀 낫군.", --술에서 좀 깸 (그로기)
	ANNOUNCE_DRUNK_IMMUNITY = "only_used_by_wathgrithr", --임시. 위그 전용,
	ANNOUNCE_NOTCHARGE = "쓸모없는 녀석.", --번개염소가 충전이 안되서 양동이로 젖을 짤수 없음
	ANNOUNCE_NOTHIRSTSLEEP = "너무 목말라, 잠을 잘수가 없어.", -- 목이 마른데 밤에 잘려고 시도
	ANNOUNCE_NOTHIRSTSIESTA = "너무 목말라, 쉴 수가 없어.", -- 목이 마른데 낮에 잘려고 시도
	ANNOUNCE_SLEEP_END = "악몽이라도 꾼 것 같군.", --자고 일어나서 술에서 완전히 깸 
	ANNOUNCE_THIRST = "목이 마르군.", --너무 목말라!

    ANNOUNCE_CAFFINE_BUFF_START = "이거 흥분되는군!" , -- 카페인 버프 시작
    ANNOUNCE_CAFFINE_BUFF_STOP = "쇼는 끝났어." ,  -- 카페인 버프 끝
    
    ANNOUNCE_CURE_WATERBORNE = "속이 좀 잠잠해 지는군." ,  -- 수인성 질병을 아이템으로 치료했을때의 대사

	ANNOUNCE_DCAPACITY_CRITICAL = "취기가 오르네.", --취하기 직전
	ANNOUNCE_DCAPACITY_HALF = "포근해 지는군.", -- 취기가 돌기 시작

	DESCRIBE =
	{
		BOILBOOK = "술 만드는거라고 뭐 어려울게 있겠어.",

		WATER_CLEAN_ICE = "이가 다 시리는군.",--깨끗한 얼음물
		WATER_DIRTY_ICE = "얼어붙은 쓰레기야.", --더러운 얼음물

		SPICE_CAFFEINPEPPER = "어디에 뿌리든 제 값은 하지.", --후추 향신료

		WELL_KIT = "내가 이걸 들고 날라야 하나?", --우물 키트
		WELL_SPRINKLER_KIT = "기계와 마법의 혼종이로군.", --스프링클러 키트
		WELL_WATERPUMP_KIT = "나도 저런걸 생각해 볼 걸 그랬나?", --스팀 물펌프 키트
		WELL_BURYING_KIT = "왜 불필요한 작업을 행했지?", -- 구멍 매설 키트
		WELL_DRILLING = "알아서 작동하는 건 편리하군.", --드릴로 구멍 뚫는 중
		WELL_DRILLING_ITEM = "꽤 험하게 생겼군.", --드릴 아이템
		HOLE = "잘못 빠지면 뼈도 못 건지겠군.", --우물 구멍
		WELL = "우물 옆에서 목말라 죽겠군.", --우물

		WX78MODULE_NONEDRUNK = "저 로봇녀석 자제 좀 해야할텐데.", -- 78전용 묘듈

		-- 물 모드 식물

		TEA_TREE = "쪼매한게 잎 하난 무성하네.",--차나무
		DUG_TEA_TREE = "내가 정원사라도 되는 줄 아는가?", --땅에서 파낸 차나무
		TEA_SEED = "어디 나무키울줄 아는놈이 쓸모를 알겠지.", -- 차나무 열매
		TEA_SEED_COOKED = "내가 이런거나 먹어야하는 신세라니.", --구운 차나무 열매
		TEA_SEED_SAPLING = "허, 땅으로 가야했던 모양이군.", --차나무 새싹
		TEALEAVES = "쓰기전에 말려야 할 걸세.", --찻잎
		TEALEAVES_DRIED = "차 한 잔이 그리워지는군.", --말린 찻잎

		CAFFEINBERRY = "달의 영향을 받은 커피덤불이군.", --커피 덤불
		DUG_CAFFEINBERRY = "다시 심을 가치가 있어.", --파낸 커피덤불
		CAFFEINBERRY_BEAN = "내가아는 커피콩과는 다르게생겼군.", --생 커피콩
		CAFFEINBERRY_BEAN_COOKED = "프렌치 프레스만 어디서 구해오면 되겠군.", --구운 커피콩

		RUINCACAO_TREE = "흑마법에 영향을 받은게 틀림없구먼.", --카카오 나무
		DUG_RUINCACAO_TREE = "어디 나무키울줄 아는놈이 쓸모를 알겠지.", --파낸 카카오 나무
		RUINCACAO_SEED = "꽃이 폈군.", --카카오 새싹 아이템
		RUINCACAO_SEED_SAPLING = "아무래도 저절로 심어지진 않겠지.", -- 카카오 새싹 심은거
		RUINCACAO = "저걸 먹겠다고 주먹질을 하진 않을걸세.", --부수기 전 카카오 열매
		RUINCACAO_BEAN = "천박한 기름 투성이로군.", --부순 후 카카오 콩  
		RUINCACAO_BEAN_COOKED = "날것보다는 낫지만, 다른 방법이 더 있을걸세.", --구운 카카오 콩

		-- 증류주 첨가제

		ADDITIVE_SEED = "진 이라도 만들려 하는가 보는군?", -- 리큐르에 제조에 첨가 할 씨허브(아니스,쥬니퍼베리,팔각 모티브)첨가제 
		ADDITIVE_PETALS = "술에 이런게 굳이 필요한가?.", -- 리큐르에 제조에 첨가 할 허브,녹차,꽃잎 첨가제
		ADDITIVE_NUT = "요즘 젊은이들은 이런걸 술에 넣어 먹나..", -- 리큐르에 제조에 첨가 할 버치넛,코코넛,커피콩,카카오콩 첨가제
		ADDITIVE_DAIRY = "취향은 존중한다만..", -- 리큐르에 제조에 첨가할 유제품 첨가제

		-- 음료

		WATER_CLEAN = "깨끗한 물 한 모금도 귀한세상이로군.", --깨끗한 물
		WATER_DIRTY = "이봐 친구, 내 물 색이 좋지않군.", --더러운 물
		WATER_SALTY = "마시면 안될걸세.", --바닷물

		GOOPYDRINK = "정말 교양없군.", --실패한 음료(웻 굽 개념)
		
		-- 주전자 음료

		FRUITJUICE = "다 섞여버렸지만 맛있네.", --잡 과일쥬스
		BERRIES_JUICE = "뭐, 나쁘진 않아.", -- 베리 쥬스
		POMEGRANATE_JUICE = "그나마 구색은 갖췄군.", -- 석류 쥬스
		BANANA_JUICE = "더 좋은 방법은 없었나?", -- 바나나 쥬스
		FIG_JUICE = "많이 달군.", -- 무화과 쥬스
		DRAGONJUICE = "격있는 단맛이 나는군.", --용과 쥬스
		GLOWBERRYJUICE = "과즙을 잘 이용했네.", -- 발광베리 쥬스
		WATERMELON_JUICE = "수박 향 정도만 느낄정도로 물이 많군.", --수박 쥬스

		VEGGIE_TEA = "건강 챙길때가 되긴 했지.", --녹즙
		CARROT_TEA = "어쩔수 없지, 씁.", --당근차
		CACTUS_TEA = "내 손 안에 작은 오아시스가 있군.", --선인차
		TOMATO_JUICE = "목넘김이 부드럽군.", --토마토 쥬스
		LUMPY_TEA = "이렇게 하니 나름 품위가 있군.", --뿌리차,
		SEAWEED_SHAKE = "아니 제발..", --해초 쉐이크
		
		GREENTEA = "잎 비린내가 나잖니.", --생잎 녹차
		BLACKTEA = "차 한 잔이 이렇게 반가울 줄이야.", --홍차
		BLACKTEA_ICED = "상쾌하군.", -- 홍차 아이스티
		FUER = "이거 참 이국적이군.", --보이차,이파리차,고사리차
		MIXFLOWER = "좀 달짝지근한 뒷맛이 있군.", --잡 꽃잎 차
		HIBISCUSTEA = "참 아름답기 짝이 없군.", --히비스커스 차
		CACTUSFLOWER_TEA = "역시 실망시키지 않는군.", --선인꽃차
		LOTUSTEA = "혹시 내가 생각하는 그건가?", --연꽃차
		SUSHIBISCUS = "어둠의 정수로군.", -- 자살차
		MOON_BLOSSOM_TEA = "날 변이시키진 않겠지?", --달꽃차

		CAFFEINBERRY_JUICE = "맛이 기대되는군.", -- 블랙 커피
        TOFFEE_LATTE = "스카치캔디를 녹여냈나 싶네.", --토피넛 라떼
		RUINCHA_LATTE = "진짜 모카커피가 뭔지는 알지도 못하겠지.", --모카 라떼(커피+초코)
		
		HOTRUINCOLATE = "내가 처음 왔을때는 꿈도 못 꿨는데 말일세.", --핫초코
		RUINCOLATE_SMOOTHIE = "내가 먹기엔 치아가 걱정이야.", --초코 스무디(차가움)
		RUINXOCOLATL = "영적인 감각이 느껴지는군.", --쇼콜라틀(매캐함)
		TEA_RUINCOLATE_LATTE = "요즘 젊은 애들은 이런걸 마시나?", -- 말차 라떼

		MULLED = "날씨는 빌어먹게 춥더라도 여유를 좀 느낄수 있지.", --뱅쇼
		BUTTERBEER = "내 영혼은 갈기갈기 찢어져도 다시붙지.", --해리포터 시리즈의 버터비어

		-- 콜라보 주전자 음료

		COCONUT_JUICE = "물도 마시고 배도 좀 채우고!", --난파선 코코넛 쥬스
		RAINBOW_SHAKE = "애들 불량식품 같군.", --난파선 무지개 해파리 쉐이크
		QUARTZ_SHAKE = "레몬이나 라임이라도 있다면..", --난파선 광대 물고기 쉐이크
		CHERRY_ROSEBERRIES_TEA = "그래서, 비스킷은 어디있나?", --체리숲 로즈힙 차
		CHERRY_HONEY_TEA = "생강이랑 레몬이 있었으면..", --체리숲 벚꽃꿀 차
		SWEET_RICE_DRINK = "흐믈흐믈 하군.", -- 비타협 식혜
		PINEANANAS_JUICE = "이런 시큼한 과일주스는 마시기 힘들단 말일세.", -- 레기온 파인애플 주스
		ORANGE_JUICE = "여기 오기전에는 휴게실에 항상있던거 쳐다도 안봤는데 말일세.", -- 모어 푸드 팩 오랜지 주스
		STRAWBERRY_SMOOTHIE = "길거리 음료 같군.", -- 모어 푸드 팩 딸기 스무디
		STRAWBERRY_MILK_SMOOTHIE = "내 취향하고는 거리가 머네.", -- 모어 푸드 팩 딸기 스무디 라떼

		--양조기 음료

		SPOILED_DRINK = "내가 썩혀버리기 전에는 음료였는데 말이지.", --썩은 음료

		-- 양조소다
	
		SODA = "나는 시도할 생각조차 못했는데 말이지.", -- 탄산수 (대충 먼지로 탄산 만들 생각 따위 못했다는 예기)
		FRUITSODA = "펀치보울 앞에서 공연이라도 해주리?", -- 과일소다
		LEMONLIMESODA = "이가 썩을것 같군.", -- 레몬 라임소다(과일소다 상위 호환)
		COLA = "개인적으로 빨대가 있었으면 좋겠네.", -- 콜라
		COLAQUANTUM = "의심쩍지만 훌룡해.", --콜라 퀀텀
		LUMPY_BEER = "맛을 어떻게 재현한건가?", --루트비어(술이 아님)

		-- 양조주

		CORN_BEER = "글쎄.. 옥수수로 만든 밑술아닌가?", -- 콘 맥주 (wash - 위스키를 만들기 전 밑술.)
		MADHU = "바이킹 전통방식으로 안 만들었길바래.", --벌꿀주
		WINE = "산딸기로 만들었다해도 감지덕지 해야지.", --와인 (그냥 베리 양조)
		NOBLEWINE = "삶이 꽤나 윤택해졌구먼, 허.", --노블 와인(구운 베리 양조)
		SPARKLINGWINE = "샴페인이 그립군.", --스파클링 와인
		GLOWBERRYWINE = "나가서 팔수만 있다면 큰 돈을 벌겠구먼.", --글로우 베리 와인
		KUMIS = "야성적이로군.", -- 크므즈,산양유주
		LUMPY_WINE = "생각보다 깔끔하군.", --서주(감자 고구마등 뿌리 술)
		PULQUE = "내 입맛에는 맞지 않는다네.", --풀케(선인주)
		RUINCACAO_WINE = "밖에선 보기힘든 와인이구먼.", -- 카카오 와인 

		-- 콜라보 소다

		CHERRY_DOCTOR_COLA = "진짜 의사가 이 자리에 없는건 좀 아쉽군.", --체리숲 닥터 페퍼(닥터 체리)
		PINEANANASSODA = "문명인에 더 가까워진듯한 기분이군.", -- 탄산 파인애플(오란씨)
		ORANGESODA = "탄산이 강한건 매한가지로구먼.", -- 탄산 오랜지(환타)
		STRAWBERRYSODA = "탄산이 강한건 매한가지로구먼.", -- 탄산 딸기(웰치스 딸기)

		--콜라보 양조주

		AUROBOW = "발상이 정말 해괴망측해.", -- 난파선 오로보우,무지개 해파리주
		COCONUT_WINE = "게살을 안주 삼아야 겠군.", -- 난파선 코코넛 와인
		CHERRY_BLOOM_MADHU = "정장에 묻어도 적어도 세탁에 어려움을 겪진 않겠네.", -- 체리숲 벚꽃꿀주
		GIANT_BLUEBERRY_WINE = "교양인처럼 행동하자고.", -- 비타협 붐!베리 와인(불 붙히면 폭발함)
		RICE_WINE = "시큼하군.", -- 비타협 막걸리
		WHEAT_BEER = "글쎄.. 홉은 어디서 구했나?", -- 힙 오브 푸드 밀맥주
		PALE_BEER = "글쎄..그건 홉이 아닐거라 생각되건만.", -- 레기온 페일에일 (몬스트라 열매를 쓴 청록색 맥주)

		--증류주

		DISINFECTANT = "절단마술 해봤나? 이게 필요할걸세.", -- 소독약
		CORN_WHISKEY = "아, 드디어.", -- 콘 위스키
		LUMPY_VODKA = "슬프게도 이젠 내가 노동자신세로군.", -- 보드카
		TEQUILA = "시골공연 느낌 나는구먼.", -- 데킬라
		MADHU_RUM = "천박하군.", -- 럼주
		BERRY_BRANDY = "내 품격에 딱 맞는군.", -- 베리 브랜디
		AREUHI = "이상한 향이 나는군.", -- 크므즈 증류주 아르히

		--왈리 전용 증류주

		BERRY_GIN = "이게 그렇게 천박한 술은 아니였는데 말이지.", --진
		GLOWBERRY_GIN = "그녀 에게는 사과를 표해야겠어.", --글로우 베리 진
		ABSINTHE = "아, 마치 내 인생 같은 이 깊이감!", -- 압생트
		TEA_LUMPY_VODKA = "흠, 미묘하군.", -- 녹차 리큐르
		PETALS_BERRY_BRANDY = "좀 과해.", -- 장미향 브랜디
		KAHLUA = "그렇게 나쁘진 않군.", -- 커피 리큐르 깔루아
		NUT_CORN_WHISKEY = "염지한 고기가 좀 땡기는군.", -- 너트 위스키
        RUINCACAO_CREAM_LIQUEUR = "요즘 젊은이들이란..", --베일리스 카카오 크림 리큐르
        RUMCHATA = "이건 또 뭐하는 술인가?", -- 럼차타(럼에 오우차타 라는 유제품 섞은)

		--콜라보 증류주

		MOONWAY = "이걸 어떻게 만들었나?", -- 무지개 해파리주 증류주
		ARRACK = "못 만드는게 없는 열매 였구먼.", -- 아락 인도네시아 버전 코코넛 와인 증류주
		CHERRY_BLOOM_RUM = "지나치게 사치스럽구먼, 허.", -- 체리 꿀주 증류주 벛꽃잎 떠다
		RICE_SPIRITS = "꽤 깔끔하군.", --청주
		WHEAT_WHISKEY = "완벽해.", -- 밀 위스키
		PALE_WHISKEY = "정정하지, 썩 나쁘지 않군.", -- 페일 몰트 위스키

		--왈리 전용 콜라보 증류주

		NUT_COCONUT_BRANDY = "그래 말해 봐... 내 배가 어떻게 됐다고?", -- So tell me... What's become of my ship? - 캐러비안의 해적 바르보사의 대사
	    GIANT_BLUEBERRY_GIN = "파괴의 정수를 담았군.", -- 붐 베리 사파이어 (당근 폭발함)

		--냄비 요리

        DARK_RUINCOLATE = "요리사 친구가 흑마술에도 관심이 있었나 보군.", --다크 초콜릿.
        WHITE_RUINCOLATE = "사양하겠네.", --화이트 초콜릿
        RUINCOLATE = "꼬마 손님들을 끌어들일 미끼로군.", -- 그냥 초콜릿
        RUIN_SCHOKAKOLA = "효율의 집약체로군.", -- 쇼카콜라

		BUCKET_STEEL_EMPTY = 
		{
			EMPTY = "빈 깡통이로군.", --빈 양철 양동이
			FULL = "빗물이나 받아먹는 신세라니.", -- 깨끗한 빗물이 참
			FULL_ICE = "내가 저걸 꺼내야 하는건가?", -- 빗물이 얼어버림
			DIRTY = "추악해라.", --빗물이 더러워짐
			DIRTY_ICE = "처다보기도 싫군.", --더러운 빗물이 얼어버림
		},

		BUCKET_WOODIE_EMPTY = 
		{
			EMPTY = "본 내추럴 하군.", --우디의 빈 나무 양동이
			FULL = "빗물이나 받아먹는 신세라니.",  --깨끗한 빗물이 참
			FULL_ICE = "내가 저걸 꺼내야 하는건가?", --빗물이 얼어버림
			DIRTY = "추악해라.", --빗물이 더러워짐
			DIRTY_ICE = "처다보기도 싫군.", --더러운 빗물 얼어버림
		},

		BUCKET_DRIFTWOOD_EMPTY = 
		{
			EMPTY = "이봐, 양동이를 너무 대충 만든거 아닌가?", -- 유목양동이
			FULL = "빗물이나 받아먹는 신세라니.", -- 깨끗한 빗물이 참
			FULL_ICE = "내가 저걸 꺼내야 하는건가?", --빗물이 얼어버림
			DIRTY = "추악해라.", --빗물이 더러워짐
			DIRTY_ICE = "처다보기도 싫군.", --더러운 빗물 얼어버림
		},

		BUCKET_EMPTY = 
		{
			EMPTY = "내 손이 더러워지는 것 보단 낫지.", -- 빈 나무 양동이
			FULL = "빗물이나 받아먹는 신세라니.", -- 깨끗한 빗물이 참
			FULL_ICE = "내가 저걸 꺼내야 하는건가?", --빗물이 얼어버림
			DIRTY = "추악해라.", --빗물이 더러워짐
			DIRTY_ICE = "처다보기도 싫군.", --더러운 빗물 얼어버림
		},

		DESALINATOR =
		{
			EMPTY = "발상 하나는 굉장하군.", --제염기에 물이 없음
			PURIFY_LONG = "오래 걸릴걸세.", -- 정수 끝나기까지 많이 남음
			PURIFY_SHORT = "거의 다 끝났군!", -- 정수가 곧 끝남
			HASWATER = "다 된것처럼 보이는군.", --제염기에 깨끗한 물이 있음
			BURNT = "쓸모 없어졌군.",   --제염기가 타버림
			HASSALT = "소용없을 걸세.", --제염기에 소금이 남아 있음
		},

		BARREL =
		{
			GENERIC = "물통일세.", -- 물통 조사 대사
			BURNT = "불을 물쓰듯히 쓰는군.", -- 물통이 타버림
		},

		BREWERY =
		{
			EMPTY = "참나무 향이 강하군.", --양조기 조사 대사
			BURNT = "아, 이 얼마나 스모키한 아로마.", --양조기 타버림
			FERMENTING_LONG = "오래 걸릴걸세.", --양조 끝나기 까지 많이 남음
			FERMENTING_SHORT = "거의 다 끝났군!", --양조가 곧 끝남
			DONE = "마실만한게 나온건지나 빌어야지.", --양조기에 음료가 들어있음
		},

		CAMPKETTLE_ITEM = "에휴, 내 신세야.", --휴대 주전자 아이템 조사 대사
		CAMPKETTLE =
		{
			GENERIC = "그러니까, 이제 물 찾아서 걸어가야 하는건가?", -- 화덕에 건 휴대 주전자 안에 물이 없음
			BOILING_LONG = "아직 차갑군.", -- 물 끓이기 시작함
			BOILING_SHORT = "손 데이기 딱 좋다네.", -- 물 거의 다 끓음
			DONE = "내가 연못 물이나 끓여마시는 신세라니.", --깨끗한 물이 들음
			STOP = "덜 끓였다네.", --화덕에 불이 없어서 더러운물이 끓지 않는 상태
		},

		CAMPDESALINATOR_ITEM = "많이 무거워 보이는데.", --휴대 제염기 아이템 조사 대사
		CAMPDESALINATOR = 
		{
			GENERIC = "그러니까, 내 발로 걸어서 바닷물을 떠 와야 하는건가?", --물 없음
			BOILING_LONG = "언제까지 기다려야 하는거지?", --물 끓이기 시작
			BOILING_SHORT = "거의 다 된것 같군.", --거의 다 끓음 
			DONE = "다 된것처럼 보이는군.", -- 깨끗한 물이 들음
			STOP = "덜 끓였다네.", -- 화덕에 불이 없어서 소금물이 정수 되지 않는 상태
		},

		KETTLE =
		{
			EMPTY = "쓸쓸해 보이는군.", --빈 주전자 조사대사
			BURNT = "과추출 한건 별론데.", --주전자가 불탐
			BOILING_LONG = "기다리자고...", -- 음료를 만들기 시작한지 얼마 안됨
			BOILING_SHORT = "거의 다 됐군!", --음료 조리가 거의 끝나감
			DONE = "이제야 마실만한 음료를 먹겠군.", --음료가 완성됨
			PURIFY_LONG = "맛 없을걸세.", -- 더러운 물을 끓이기 시작한지 얼마 안됨
			PURIFY_SHORT = "손 데이기 딱 좋다네.", --더러운물을 거의 다 끓여감
			HASWATER = "차 한잔 할수 있었으면 좋겠네.", -- 깨끗한 물이 차 있는 상태
			MELT_LONG = "아직 차갑군.", -- 얼음물을 녹이기 시작한지 얼마 안됨
			MELT_SHORT = "미지근하다네.", -- 얼음물을 거의 녹여감
		},

		PORTABLEKETTLE_ITEM =
		{
			GENERIC = "앉아서 차 한잔 할 여유도 없군.", -- 휴대용 주전자(아이템) 조사 대사
			EMPTY = "텅 비어 있다네.", -- 설치한 빈 휴대용 주전자 조사 대사
			BOILING_LONG = "인내심을 좀 길러야 겠군.", -- 음료를 만들기 시작한지 얼마 안됨
			BOILING_SHORT = "금방 끝날거야.", --음료 조리가 거의 끝나감
			DONE = "잠깐 차 마실 여유를 가질수 있겠군.", --음료가 완성됨
			PURIFY_LONG = "맛 없을걸세.", -- 더러운 물을 끓이기 시작한지 얼마 안됨
			PURIFY_SHORT = "손 데이기 딱 좋다네.", --더러운물을 거의 다 끓여감
			HASWATER = "차 한잔 할수 있었으면 좋겠네.", -- 깨끗한 물이 차 있는 상태
			MELT_LONG = "아직 차갑군.", -- 얼음물을 녹이기 시작한지 얼마 안됨
			MELT_SHORT = "미지근하다네.", -- 얼음물을 거의 녹여감
		},
		
		DISTILLERS =
		{   
		    EMPTY = "튼튼하고 고급스런 가마솥이로군.", --증류기 조사 대사
			DISTILLTING_LONG = "증류기가 일하게 놔둡세.", --증류가 끝나기 까지 많이 남음
			DISTILLING_SHORT = "거의 다 된것 같군.", --증류가 곧 끝남
			DONE = "이제 술다운 술을 마셔 보겠군.", --증류기에 음료가 들어있음
		},

		WELL_WATERPUMP = {
			HIGH_PRESSURE = "이봐, 이거 좀 시끄럽지 않나?", -- 압력 최대
			MIDDLE_PRESSURE = "내 손으로 일하지 않아도 되는건 좋군.", -- 압력이 중간
			LOW_PRESSURE = "이거 제대로 작동하고 있는건가?", -- 압력이 거의 없을때
			RECHARG_PRESSURE = "내 손으로 물을 길어야 겠군, 에휴.", -- 압력이 아예 없을때(여기까지 쓰면 압력이 최대가 될때까지 못씀.)
		},
		
		WELL_SPRINKLER =
		{ 
			LOWFUEL = "어디 기계 만질줄 아는 친구가 알아서 하겠지.", -- 연료가 거의 없는 상태에서의 조사 대사
			ON = "다가가면 정장이 젖겠지.", -- 작동중임
			OFF = "전원이 꺼져 있군.", --작동을 멈춘상태에서의 조사 대사
		},	
	},
}