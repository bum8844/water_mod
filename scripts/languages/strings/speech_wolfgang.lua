return {
	ACTIONFAIL =
	{
		GIVE =
		{
			WELL_NOTEMPTY = "하나 더 쓸 자리가 없다.", -- 우물에 말라 빈 양동이 달려있는데 양동이 달려 함
			WELL_BUSY = "밧줄이 더 없다!", -- 우물에 물 든 양동이 달려있는데 달려 함
		}
	},

	ANNOUNCE_DRUNK = "으으, 볼프강 술보다 약하다...", -- 취함
	ANNOUNCE_DRUNK_MUMBLE = 
	{
		--대사 추가해야함
	},
	ANNOUNCE_DRUNK_END = "볼프강 좀 나아진것 같다.", --술에서 좀 깸 (그로기)
	ANNOUNCE_DRUNK_IMMUNITY = "하! 술 같은건 강한 볼프강에게 아무것도 아니다!", --마이티 상태 술 면역
	ANNOUNCE_NOTCHARGE = "볼프강이 힘 주면 염소만 다칠거다.", --번개염소가 충전이 안되서 양동이로 젖을 짤수 없음
	ANNOUNCE_NOTHIRSTSLEEP = "볼프강 목 말라서 못 자겠다...", -- 목이 마른데 밤에 잘려고 시도
	ANNOUNCE_NOTHIRSTSIESTA = "볼프강 물 좀 마시고 자야겠다...", -- 목이 마른데 낮에 잘려고 시도
	ANNOUNCE_SLEEP_END = "볼프강 술보다 훨씬 강하다!", --자고 일어나서 술에서 완전히 깸 
	ANNOUNCE_THIRST = "강력한 근육이 말라버릴것 같다...", --너무 목말라!

	ANNOUNCE_CAFFINE_BUFF_START = "볼프강 늑대처럼 달린다!", -- 카페인 버프 시작
    ANNOUNCE_CAFFINE_BUFF_STOP = "볼프강 무산소 운동 할 시간이다.",  -- 카페인 버프 끝

    ANNOUNCE_SATIETY_BUFF_START = "" , -- 포만감 버프 시작
    ANNOUNCE_SATIETY_BUFF_STOP = "" ,  -- 포만감 버프 끝
    
    ANNOUNCE_CURE_WATERBORNE = "속이 편안하군.",  -- 수인성 질병을 아이템으로 치료했을때의 대사

	ANNOUNCE_DCAPACITY_CRITICAL = "볼프강 그만 마셔야겠다..", --취하기 직전
	ANNOUNCE_DCAPACITY_HALF = "볼프강 왠지 좀 더워진것 같다..", -- 취기가 돌기 시작

	DESCRIBE =
	{
		BOILBOOK_BASIC = "마시는거 만드는 방법이다!",
		BOILBOOK_ADVANCED = "마시는거 만드는 방법이다!",

		WATER_CLEAN_ICE = "볼프강이 마실 물이 얼어버렸다..",--깨끗한 얼음물
		WATER_DIRTY_ICE = "못 먹을 얼음이다.", --더러운 얼음물

		SPICE_CAFFEINPEPPER = "음...좋은 냄새 난다...", --후추 향신료

		WELL_KIT = "볼프강이 친구들을 위한 우물 지을거다!", --우물 키트
		WELL_SPRINKLER_KIT = "강력한 자동 물뿌리개다!", --스프링클러 키트
		WELL_WATERPUMP_KIT = "강한 우물 만들 재료다.", --스팀 물펌프 키트
		WELL_BURYING_KIT = "볼프강이 뚫은 구멍도 막을수 있나?", -- 구멍 매설 키트
		WELL_DRILLING = "기계랑 땅이 싸우는중이다!", --드릴로 구멍 뚫는 중
		WELL_DRILLING_ITEM = "땅을 파헤친다. 아주 강력하게!", --드릴 아이템
		HOLE = "볼프강 구멍에서 물 얻어낸다.", --우물 구멍
		WELL = "이제 우물에서 물 얻을수 있다!", --우물
		BOTTLE_POUCH = "",
		WINE_CELLAR_PART = "",
		WINE_CELLAR = "",

		WX78MODULE_NONEDRUNK = "로봇 먹는 과자다, 맞지?", -- 78전용 묘듈Is robot snacks, yes?

		-- 물 모드 식물

		TEA_TREE = "조그만 나무야, 나한테 안 밟히게 조심하렴!",--차나무
		DUG_TEA_TREE = "작은 나무 땅에서 나왔다.", --땅에서 파낸 차나무
		TEA_SEED = "볼프강이 손으로 부숴버릴수 있다!", -- 차나무 열매
		TEA_SEED_COOKED = "약한 씨앗은 먹기에 너무 작다.", --구운 차나무 열매
		TEA_SEED_SAPLING = "엄청 작은 나무다!", --차나무 새싹
		TEALEAVES = "좋은 냄새나는 잎이다.", --찻잎
		TEALEAVES_DRIED = "초록색 잎 갈색 됐다.", --말린 찻잎

		CAFFEINBERRY = "볼프강이 아는거랑 좀 다르다.", --커피 덤불
		DUG_CAFFEINBERRY = "춥고 외로워.", --파낸 커피덤불
		CAFFEINBERRY_BEAN = "음... 냄새 좋다..", --생 커피콩
		CAFFEINBERRY_BEAN_COOKED = "작은 콩이 볼프강을 강하게 만든다!", --구운 커피콩

		RUINCACAO_TREE = "으으.. 볼프강 왠지 무섭다...", --카카오 나무
		DUG_RUINCACAO_TREE = "기분 나쁜 나무다.", --파낸 카카오 나무
		RUINCACAO_SEED = "무서운 나무 아직 작고 약하다.", --카카오 새싹 아이템
		RUINCACAO_SEED_SAPLING = "작고 무서운 나무가 곧 자랄거다.", -- 카카오 새싹 심은거
		RUINCACAO = "볼프강의 강한 악력으로도 안 부숴진다.", --부수기 전 카카오 열매
		RUINCACAO_BEAN = "단단한 열매는 졌다.", --부순 후 카카오 콩  
		RUINCACAO_BEAN_COOKED = "맛있는 냄새 나는데 무섭다...", --구운 카카오 콩

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

		ADDITIVE_SEED = "알싸한 냄새 난다.", -- 리큐르에 제조에 첨가 할 씨허브(아니스,쥬니퍼베리,팔각 모티브)첨가제 
		ADDITIVE_PETALS = "작은 풀을 어디다 쓰지?", -- 리큐르에 제조에 첨가 할 허브,녹차,꽃잎 첨가제
		ADDITIVE_NUT = "볼프강이 쉽게 부술수 있다.", -- 리큐르에 제조에 첨가 할 버치넛,코코넛,커피콩,카카오콩 첨가제
		ADDITIVE_DAIRY = "우유는 볼프강이 마시면 안돼나?", -- 리큐르에 제조에 첨가할 유제품 첨가제

		-- 음료

		WATER_CLEAN = "물도 강력한 근육에 중요하다!", --깨끗한 물
		WATER_DIRTY = "마셨다간 배 아플거다.", --더러운 물
		WATER_SALTY = "볼프강은 짠 물이 싫다!", --바닷물

		GOOPYDRINK = "볼프강이 이상한걸 넣었나?", --실패한 음료(웻 굽 개념)
		
		-- 주전자 음료

		FRUITJUICE = "과일 들어간 물이다.", --잡 과일쥬스
		BERRIES_JUICE = "달고 빨간 음료다.", -- 베리 쥬스
		POMEGRANATE_JUICE = "알갱이는 없나?", -- 석류 쥬스
		BANANA_JUICE = "시원하고 맛있다!", -- 바나나 쥬스
		FIG_JUICE = "크고 달달한 과일로 만든 갈색 음료수다.", -- 무화과 쥬스
		DRAGONJUICE = "과일 빨간색인데 왜 흰색이지?", --용과 쥬스
		GLOWBERRYJUICE = "빛나는 물을 마셔도 되나?", -- 발광베리 쥬스
		WATERMELON_JUICE = "큰 수박으로 만든 음료수다.", --수박 쥬스

		VEGGIE_TEA = "풀맛 나고 엄청 쓰다!", --녹즙
		CARROT_TEA = "볼프강은 당근 마시는것도 좋다!", --당근차
		CACTUS_TEA = "뾰족한 가시 없지? 그렇지?", --선인차
		TOMATO_JUICE = "건강한 음료다!", --토마토 쥬스
		LUMPY_TEA = "풀들의 근육을 끓였다", --뿌리차
		SEAWEED_SHAKE = "먹어도 강해지진 않는다.", --해초 쉐이크
		
		GREENTEA = "풀향이 많이 난다.", --생잎 녹차
		BLACKTEA = "볼프강 생각엔 홍차는 좀 위험한것 같다..", --홍차
		BLACKTEA_ICED = "시원한 차다! 마음에 들어.", -- 홍차 아이스티
		FUER = "나뭇잎으로 만든 차다.", --보이차,이파리차,고사리차
		MIXFLOWER = "냄새 좋다.", --잡 꽃잎 차
		HIBISCUSTEA = "볼프강을 감성적으로 만든다.", --히비스커스 차
		CACTUSFLOWER_TEA = "빨간 꽃으로 만든 차다.", --선인꽃차
		LOTUSTEA = "분홍색인 차도 있었나?", --연꽃차
		SUSHIBISCUS = "볼프강 근육까지 소름이 돋는다...", -- 자살차
		MOON_BLOSSOM_TEA = "향이 강한 차가 강한정신 깃들게 해준다!",

		CAFFEINBERRY_JUICE = "씁쓸하지만 강하게 해준다!", -- 블랙 커피
        TOFFEE_LATTE = "견과류 맛 난다.", --토피넛 라떼
		RUINCHA_LATTE = "달고 볼프강을 강하게 해준다!", --모카 라떼(커피+초코)
		
		HOTRUINCOLATE = "달고 따뜻한 초콜릿이다.", --핫초코
		RUINCOLATE_SMOOTHIE = "차가운 초콜릿 음료수다.", --초코 스무디(차가움)
		RUINXOCOLATL = "되게 쓴 초콜릿 음료수다!", --쇼콜라틀(매캐함)
		TEA_RUINCOLATE_LATTE = "초콜릿맛 나는 풀 음료수다.", -- 말차 라떼

		MULLED = "술 냄새는 안난다.", --뱅쇼
		BUTTERBEER = "맥주인데..단맛 난다!", --해리포터 시리즈의 버터비어

		APPLEPINE_JUICE = "엄청 신 주스다.",
		APPLEPINE_SMOOTHIE = "",
		APPLEPINE_CAPPUCCINO = "",

		CITROYUZU_JUICE = "시고, 달고, 주황색이야.",
		CITROYUZU_TEA = "",
		EARLGREY_TEA = "",

		-- 콜라보 주전자 음료

		COCONUT_JUICE = "단단한 열매는 마실 게 됐다!", --난파선 코코넛 쥬스
		RAINBOW_SHAKE = "마시기 좋은 예쁜 젤리다!", --난파선 무지개 해파리 쉐이크
		QUARTZ_SHAKE = "볼프강 혼란스럽다. 물고기가 마시는 거였나?", --난파선 광대 물고기 쉐이크
		NETTLE_TEA = "",
		FRASH_BRAMBLE_TEA = "",
		TUBER_BLOOM_TEA = "",
		CHERRY_ROSEBERRIES_TEA = "예쁜 장미냄새 난다.", --체리숲 로즈힙 차
		CHERRY_HONEY_TEA = "엄청 달다!", --체리숲 벚꽃꿀 차
		SWEET_RICE_DRINK = "쌀만 넣었는데 단 맛이 나!", -- 비타협 식혜
		STRAWBERRY_SMOOTHIE = "씨가 엄청 많다.", -- 모어 푸드 팩 딸기 스무디
		STRAWBERRY_MILK_SMOOTHIE = "부드러운 맛이야.", -- 모어 푸드 팩 딸기 스무디 라떼

		--양조기 음료

		SPOILED_DRINK = "으으, 냄새나는 물이다!", --썩은 음료

		-- 양조소다
	
		SODA = "따끔한 물이다!", -- 탄산수
		FRUITSODA = "따끔하고 달달하다.", -- 과일소다
		LIMONSODA = "엄청 달다!", -- 레몬 라임소다(과일소다 상위 호환)
		COLA = "단맛 나고 검은 음료수다.", -- 콜라
		COLAQUANTUM = "강력한 음료로군! 아주 좋아!", --콜라 퀀텀
		LUMPY_BEER = "알싸하고 특이한 맛이 난다.", --루트비어(술이 아님)
		APPLEPINESODA = "시고 시원한 음료수다.", -- 탄산 파인애플(오란씨)
		CITROYUZUSODA = "달고 따끔하다.", -- 탄산 오랜지(환타)
		DAWN_FOG = "",
		MOON_CAP_DRINK = "",

		-- 양조주

		CORN_BEER = "옥수수로 만든 술이다.", -- 콘 맥주
		MADHU = "화난 벌 꿀로 만든 술이다.", --벌꿀주
		WINE = "좋은날에 먹는 술이다.", --와인 (그냥 베리 양조)
		NOBLEWINE = "구운과일로 귀한 술 만들었다!", --노블 와인(구운 베리 양조)
		SPARKLINGWINE = "따끔하고 노란 술이다!", --스파클링 와인
		GLOWBERRYWINE = "반짝거리는 술이다.", --글로우 베리 와인
		KUMIS = "우유로 술을 만들었다", -- 크므즈,산양유주
		LUMPY_WINE = "풀 뿌리로 만든 술이야.", --서주(감자 고구마등 뿌리 술)
		PULQUE = "가시없는 술로 변했다.", --풀케(선인주)
		RUINCACAO_WINE = "초콜릿으로 술도 만드나?", -- 카카오 와인 
		MIDNIGHT_STROM = "",
		APPLEPINE_CIDER = "",
		MENTHA_SPICATA_WINE = "",

		-- 콜라보 소다

		CHERRY_DOCTOR_COLA = "사탕같은 맛 난다!", --체리숲 닥터 페퍼(닥터 체리)
		STRAWBERRYSODA = "탄산만큼 씨앗도 가득하다!", -- 탄산 딸기(웰치스 딸기)

		--콜라보 양조주

		AUROBOW = "예쁜 술 젤리다.", -- 난파선 오로보우,무지개 해파리주
		COCONUT_WINE = "코코넛 음료 됐다", -- 난파선 코코넛 와인
		NETTLE_WINE = "",
		CHERRY_BLOOM_MADHU = "엄청 단 술이다!", -- 체리숲 벚꽃꿀주
		GIANT_BLUEBERRY_WINE = "볼프강 배속에서 터지려나?", -- 비타협 붐!베리 사파이어(불 붙히면 폭발함)
		RICE_WINE = "우유같은 흰색 술이다.", -- 비타협 막걸리
		WHEAT_BEER = "바이젠이군!", -- 힙 오브 푸드 밀맥주
		PALE_BEER = "꼬마 피부처럼 창백해.", -- 레기온 페일에일 (몬스트라 열매를 쓴 청록색 맥주)

		--증류주

		DISINFECTANT = "청소할때 쓰는 약이다.", -- 소독약
		CORN_WHISKEY = "스코틀랜드 방식 술이다.", -- 콘 위스키
		LUMPY_VODKA = "보드카! 고향에선 유명하지!", -- 보드카
		TEQUILA = "햇빛 아래에서 마시는게 좋다!", -- 데킬라
		MADHU_RUM = "바다 원숭이들이 좋아할것 같다.", -- 럼주
		BERRY_BRANDY = "귀한 맛 나는 술이다.", -- 베리 브랜디
		AREUHI = "우유 끓여서 만든 술이다.", -- 크므즈 증류주 아르히
		APPLEPINE_BRANDY = "",
		VOID = "",
		CITROYUZU_CURACAO = "",
		MENTHA_SPICATA_CURACAO = "",

		--왈리 전용 증류주

		BERRY_GIN = "토닉이랑 섞을때 최고다!", --진
		GLOWBERRY_GIN = "빛나는 술은 처음 본다!", --글로우 베리 진
		ABSINTHE = "우와.. 초록색 요정같은 술이다.", -- 압생트
		TEA_LUMPY_VODKA = "풀 맛 나는 신기한 보드카다!", -- 녹차 보ㄷㅡ카
		PETALS_BERRY_BRANDY = "향긋한 냄새 나는 술이다.", -- 장미향 브랜디
		KAHLUA = "콩 넣어서 만든 술이다.", -- 커피 리큐르 깔루아
		NUT_CORN_WHISKEY = "견과류 냄새 난다.", -- 너트 위스키
        RUINCACAO_CREAM_LIQUEUR = "초콜릿으로 술로 만드는거였나?", --베일리스 카카오 크림 리큐르
        RUMCHATA = "우유 들어간 신기한 술이다.", -- 럼차타(럼에 오우차타 라는 유제품 섞은)

		--콜라보 증류주

		MOONWAY = "예쁜 젤리 끓여서 만들었다.", -- 무지개 해파리주 증류주
		NETTLE_LIQUEUR = "",
		ARRACK = "끓여서 만든 코코넛 술이다.", -- 아락 인도네시아 버전 코코넛 와인 증류주
		CHERRY_BLOOM_RUM = "이정도로 단 술도 있었나?", -- 체리 꿀주 증류주 벛꽃잎 떠다
		RICE_SPIRITS = "흰 술이랑 같히 만들었다.", --청주
		WHEAT_WHISKEY = "볼프강은 센 위스키가 좋다!", -- 밀 위스키
		PALE_WHISKEY = "볼프강이 알기론 미국 방식이다.", -- 페일 몰트 위스키

		--왈리 전용 콜라보 증류주

		NUT_COCONUT_BRANDY = "세상은 넓고! 훔칠건 많다!", -- Take what you can! Give nothin' back! -- 캐러비안의 해적 조샤미 깁스, 잭 스패로우
	    GIANT_BLUEBERRY_GIN = "볼프강 근육처럼 터질것 같다!", -- 붐 베리 사파이어 (당근 폭발함)

		--냄비 요리

        DARK_RUINCOLATE = "으음, 써!", --다크 초콜릿.
        WHITE_RUINCOLATE = "지방으로 가득 찼다.", --화이트 초콜릿
        RUINCOLATE = "볼프강은 단 음식도 좋아한다!", -- 그냥 초콜릿
        RUIN_SCHOKAKOLA = "볼프강 옛날에 먹어본 적 있다!", -- 쇼카콜라
        APPLEPINE_PIE = "",
        APPLEPINE_FRIED_RICE = "",
        citroyuzu_bbq = "",

		BUCKET_STEEL_EMPTY = 
		{
			EMPTY = "볼프강 근육처럼 단단해!", --빈 양철 양동이
			FULL = "볼프강 위한 물이 준비됐다!", -- 깨끗한 빗물이 참
			FULL_ICE = "물은 추위에 져버렸다.", -- 빗물이 얼어버림
			DIRTY = "아까운 물이 더러워졌다...", --빗물이 더러워짐
			DIRTY_ICE = "아으! 아까워라!", --더러운 빗물이 얼어버림
		},

		BUCKET_WOODIE_EMPTY = 
		{
			EMPTY = "섬세하고 단단해.", --우디의 빈 나무 양동이
			FULL = "볼프강 위한 물이 준비됐다!",  --깨끗한 빗물이 참
			FULL_ICE = "물은 추위에 져버렸다.", --빗물이 얼어버림
			DIRTY = "아까운 물이 더러워졌다...", --빗물이 더러워짐
			DIRTY_ICE = "아으! 아까워라!", --더러운 빗물 얼어버림
		},

		BUCKET_DRIFTWOOD_EMPTY = 
		{
			EMPTY = "이 양동이는 가벼운데 더 튼튼하다.", -- 빈 나무 양동이
			FULL = "볼프강 위한 물이 준비됐다!", -- 깨끗한 빗물이 참
			FULL_ICE = "물은 추위에 져버렸다.", --빗물이 얼어버림
			DIRTY = "아까운 물이 더러워졌다...", --빗물이 더러워짐
			DIRTY_ICE = "아으! 아까워라!", --더러운 빗물 얼어버림
		},

		BUCKET_EMPTY = 
		{
			EMPTY = "하! 큰 볼프강을 위한 컵이군!", -- 빈 나무 양동이
			FULL = "볼프강 위한 물이 준비됐다!", -- 깨끗한 빗물이 참
			FULL_ICE = "물은 추위에 져버렸다.", --빗물이 얼어버림
			DIRTY = "아까운 물이 더러워졌다...", --빗물이 더러워짐
			DIRTY_ICE = "아으! 아까워라!", --더러운 빗물 얼어버림
		},

		DESALINATOR =
		{
			EMPTY = "짠 물이 없다.", --제염기에 물이 없음
			PURIFY_LONG = "아직 짠 내 난다.", -- 정수 끝나기까지 많이 남음
			PURIFY_SHORT = "거의 다 됐다!", -- 정수가 곧 끝남
			HASWATER = "이제 마실수 있겠다!", --제염기에 깨끗한 물이 있음
			BURNT = "흰 소금 나오는 기계 검게 탔다.",   --제염기가 타버림
			HASSALT = "안에서 짠 냄새 난다.", --제염기에 소금이 남아 있음
		},

		BARREL =
		{
			GENERIC = "볼프강은 힘들때를 대비한다.", -- 물통 조사 대사
			BURNT = "물 다 타버렸나?", -- 물통이 타버림
		},

		BREWERY =
		{
			EMPTY = "물을 술로 만든다.", --양조기 조사 대사
			BURNT = "술 이제 못 마시나?", --양조기 타버림
			FERMENTING_LONG = "엄청 오래 걸릴 거다.", --양조 끝나기 까지 많이 남음
			FERMENTING_SHORT = "이제 다 될것 같다!", --양조가 곧 끝남
			DONE = "이제야 끝났다!", --양조기에 음료가 들어있음
		},

		CAMPKETTLE_ITEM = "물 깨끗하게 만드는 거다!", --휴대 주전자 아이템 조사 대사
		CAMPKETTLE =
		{
			GENERIC = "끓일 물 필요하다.", -- 화덕에 건 휴대 주전자 안에 물이 없음
			BOILING_LONG = "물 아직 더럽다.", -- 물 끓이기 시작함
			BOILING_SHORT = "곧 끝난다!", -- 물 거의 다 끓음
			DONE = "이제 마실 수 있겠다!", --깨끗한 물이 들음
			STOP = "불이 운동 좀 해야겠다.", --화덕에 불이 없어서 더러운물이 끓지 않는 상태
		},

		CAMPDESALINATOR_ITEM = "이제 짠 물 마실수 있다!", --휴대 제염기 아이템 조사 대사
		CAMPDESALINATOR = 
		{
			GENERIC = "끓일 짠 물이 필요해.", --물 없음
			BOILING_LONG = "아직 짠 내 난다.", --물 끓이기 시작
			BOILING_SHORT = "거의 다 됐다!", --거의 다 끓음 
			DONE = "이제 마실 수 있겠다!", -- 깨끗한 물이 들음
			STOP = "불이 운동 좀 해야겠다.", -- 화덕에 불이 없어서 소금물이 정수 되지 않는 상태
		},

		KETTLE =
		{
			EMPTY = "주전자 물 필요하다.", --빈 주전자 조사대사
			BURNT = "강한 불에 져버렸다..", --주전자가 불탐
			BOILING_LONG = "좀 더 끓여야 될것 같다.", -- 음료를 만들기 시작한지 얼마 안됨
			BOILING_SHORT = "거의 다 끝났다!", --음료 조리가 거의 끝나감
			DONE = "마실 시간이다!", --음료가 완성됨
			PURIFY_LONG = "물 아직 더럽다.", -- 더러운 물을 끓이기 시작한지 얼마 안됨
			PURIFY_SHORT = "곧 끝난다!", --더러운물을 거의 다 끓여감
			HASWATER = "주전자 물이 찼다.", -- 깨끗한 물이 차 있는 상태
			MELT_LONG = "좀 더 녹아야 한다.", -- 얼음물을 녹이기 시작한지 얼마 안됨
			MELT_SHORT = "거의 다 됐다!", -- 얼음물을 거의 녹여감
		},

		PORTABLEKETTLE_ITEM =
		{
			GENERIC = "볼프강이 들고 옮길수 있다!", -- 휴대용 주전자(아이템) 조사 대사
			EMPTY = "주전자 물 필요하다.", -- 설치한 빈 휴대용 주전자 조사 대사
			BOILING_LONG = "좀더 끓여야 될것 같다.", -- 음료를 만들기 시작한지 얼마 안됨
			BOILING_SHORT = "거의 다 끝났다!", --음료 조리가 거의 끝나감
			DONE = "마실 시간이다!", --음료가 완성됨
			PURIFY_LONG = "물 아직 더럽다.", -- 더러운 물을 끓이기 시작한지 얼마 안됨
			PURIFY_SHORT = "곧 끝난다!", --더러운물을 거의 다 끓여감
			HASWATER = "주전자에 물이 찼다.", -- 깨끗한 물이 차 있는 상태
			MELT_LONG = "좀 더 녹아야 한다.", -- 얼음물을 녹이기 시작한지 얼마 안됨
			MELT_SHORT = "거의 다 됐다!", -- 얼음물을 거의 녹여감
		},
		
		DISTILLERS =
		{   
		    EMPTY = "왠지 무서운 기계다...", --증류기 조사 대사
			DISTILLTING_LONG = "오래 걸릴것 같다.", --증류가 끝나기 까지 많이 남음
			DISTILLING_SHORT = "거의 다 됐다!", --증류가 곧 끝남
			DONE = "무서운 기계 일 끝냈다!", --증류기에 음료가 들어있음
		},

		WELL_WATERPUMP = {
			HIGH_PRESSURE = "강한 우물은 볼프강만큼 강하다!", -- 압력 최대
			MIDDLE_PRESSURE = "강한 우물 아직 충분히 강하다.", -- 압력이 중간
			LOW_PRESSURE = "강한 우물이 힘들어 보인다..", -- 압력이 거의 없을때
			RECHARG_PRESSURE = "강한 우물 쉬고 있나?", -- 압력이 아예 없을때(여기까지 쓰면 압력이 최대가 될때까지 못씀.)
		},
		
		WELL_SPRINKLER =
		{ 
			LOWFUEL = "물뿌리개 힘 없어 보인다.", -- 연료가 거의 없는 상태에서의 조사 대사
			ON = "물뿌리개 열심히 일한다!", -- 작동중임
			OFF = "물뿌리개 쉬는 중이다.", --작동을 멈춘상태에서의 조사 대사
		},	
	},
}