return {
	ACTIONFAIL =
	{
		GIVE =
		{
			WELL_NOTEMPTY = "자리가 하나밖에 없나 봐.", -- 우물에 말라 빈 양동이 달려있는데 양동이 달려 함
			WELL_BUSY = "재밌는 생각이지만 그러다 우물이 막히면 혼날 거야.", -- 우물에 물 든 양동이 달려있는데 달려 함
		}
	},

	ANNOUNCE_DRUNK = "으으... 세상이 둘로 보여...", -- 취함

	ANNOUNCE_DRUNK_MUMBLE =
	{
		"우웅...",
		"히끅! 어지러워...",
		"어른들은 왜 이런 걸 먹는 거지?",
		"머리 어깨 무릎 발 무릎 발...",
		"우으응... 캬아!",
		"세상이 하나, 둘, 셋...",
		"엄마 아빠 보고 싶어...",
		"우리는 하나면서 둘... 아니, 셋이었나? 열여덟?",
		"난 커서 이런 거 먹지 말아야지...",
	},

	ANNOUNCE_DRUNK_END = "아니야... 둘이서 하나야...", --술에서 좀 깸 (그로기)
	ANNOUNCE_DRUNK_IMMUNITY = "only_used_by_wolfgang_and_wathgrithr", --임시. 위그 전용,
	ANNOUNCE_NOTCHARGE = "지금은 젖이 나오지 않을 것 같아.", --번개염소가 충전이 안되서 양동이로 젖을 짤수 없음
	ANNOUNCE_NOTHIRSTSLEEP = "우리 목이 너무 타서 편하게 잘 수가 없어.", -- 목이 마른데 밤에 잘려고 시도
	ANNOUNCE_NOTHIRSTSIESTA = "우리 목이 너무 타는데 낮잠을 잘 순 없어.", -- 목이 마른데 낮에 잘려고 시도
	ANNOUNCE_SLEEP_END = "우웅... 여기가 어디지?", --자고 일어나서 술에서 완전히 깸 
	ANNOUNCE_THIRST = "차 마실 시간이야!", --너무 목말라!

    ANNOUNCE_CAFFINE_BUFF_START = "엄청 뛰고 싶은 기분이야!" , -- 카페인 버프 시작
    ANNOUNCE_CAFFINE_BUFF_STOP = "아이, 나른해...",  -- 카페인 버프 끝

    ANNOUNCE_SATIETY_BUFF_START = "" , -- 포만감 버프 시작
    ANNOUNCE_SATIETY_BUFF_STOP = "" ,  -- 포만감 버프 끝
    
    ANNOUNCE_CURE_WATERBORNE = "휴, 이제 배 안 아프다!", --"속이 시원해!",  -- 수인성 질병을 아이템으로 치료했을때의 대사

	ANNOUNCE_DCAPACITY_CRITICAL = "머리가 점점 어지러워져...", --취하기 직전
	ANNOUNCE_DCAPACITY_HALF = "뭔가 몸이 화끈거려.", -- 취기가 돌기 시작

	DESCRIBE =
	{
		BOILBOOK_BASIC = "으으, 외워야 할 레시피가 늘었어.",
		BOILBOOK_ADVANCED = "으으, 외워야 할 레시피가 늘었어.",

		WATER_CLEAN_ICE = "앗 차거!",--깨끗한 얼음물
		WATER_DIRTY_ICE = "차갑고 더러워!", --더러운 얼음물

		SPICE_CAFFEINPEPPER = "한 꼬집이면 충분해!", --후추 향신료
		SPICE_RUINCOLATE_SPREAD = "",

		WELL_KIT = "우리 멋진 우물을 지어 보자!", --우물 키트
		WELL_SPRINKLER_KIT = "버튼만 누르면 자동으로 설치된다니 완전 멋져!", --스프링클러 키트
		WELL_WATERPUMP_KIT = "캠프 근처 물구멍에 조립하면 되겠지?", --스팀 물펌프 키트
		WELL_BURYING_KIT = "어라? 구멍을 다시 막는 거야?", -- 구멍 매설 키트
		WELL_DRILLING = "엄청나게 시끄럽지만 재밌어!", --드릴로 구멍 뚫는 중
		WELL_DRILLING_ITEM = "되게 남자다운 도구 같아.", --드릴 아이템
		HOLE = "여보세요- 거기 누구 있나요--", --우물 구멍
		WELL = "여기 숨으면 혼난댔어.", --우물
		BOTTLE_POUCH_SMALL = "",
		BOTTLE_POUCH_BIG = "",
		THERMOS_BOTTLE_SMALL = "",
		THERMOS_BOTTLE_BIG = "",
		WINE_CELLAR_PART = "",
		WINE_CELLAR = "",

		WX78MODULE_NONEDRUNK = "허, 로봇의 장기가 이렇게 생긴 건가?", -- 78전용 묘듈
		PURIFICATION_TABLETS = "맑은 물로 돌아갈 거야!", -- 정화제

		-- 물 모드 식물

		TEA_TREE = "그늘로 쓰기엔 너무 작아.",--차나무
		DUG_TEA_TREE = "조금만 사랑을 주면 다시 자랄 거야!", --땅에서 파낸 차나무
		TEA_SEED = "먹을 게 많지 않아.", -- 차나무 열매
		TEA_SEED_COOKED = "하나도 맛 없어.", --구운 차나무 열매
		TEA_SEED_SAPLING = "우와아, 싹이 나잖아!", --차나무 새싹
		TEALEAVES = "뭔가 좋은 향기가 나.", --찻잎
		TEALEAVES_DRIED = "웬디가 좋아하겠어!", --말린 찻잎

		CAFFEINBERRY = "콩들이 달려있는 것 같아.", --커피 덤불
		DUG_CAFFEINBERRY = "조금만 사랑을 주면 다시 자랄 거야!", --파낸 커피덤불
		CAFFEINBERRY_BEAN = "이걸로 칠리라도 만드는 건가?", --생 커피콩
		CAFFEINBERRY_BEAN_COOKED = "씹어봤는데 엄청 써.", --구운 커피콩

		RUINCACAO_TREE = "또다른 동굴 나무야!", --카카오 나무
		DUG_RUINCACAO_TREE = "땅으로 보내줄게!", --파낸 카카오 나무
		RUINCACAO_SEED = "우와아, 꽃이 폈어!", --카카오 새싹 아이템
		RUINCACAO_SEED_SAPLING = "쑥쑥 커서 멋진 열매를 맺으렴!", -- 카카오 새싹 심은거
		RUINCACAO = "무언가 들었는데 질척거리는 소리가 나.", --부수기 전 카카오 열매
		RUINCACAO_BEAN = "기름기가 되게 많아.", --부순 후 카카오 콩  
		RUINCACAO_BEAN_COOKED = "우웩, 엄청 써!", --구운 카카오 콩

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

		ADDITIVE_SEED = "이상한 냄새나는 씨앗들이야!", -- 리큐르에 제조에 첨가 할 씨허브(아니스,쥬니퍼베리,팔각 모티브)첨가제 
		ADDITIVE_PETALS = "들에서 흔히 볼 수 있는 것들이야!", -- 리큐르에 제조에 첨가 할 허브,녹차,꽃잎 첨가제
		ADDITIVE_NUT = "딱딱한 것들을 모아 놨어.", -- 리큐르에 제조에 첨가 할 버치넛,코코넛,커피콩,카카오콩 첨가제
		ADDITIVE_DAIRY = "그냥 먹으면 혼나려나?", -- 리큐르에 제조에 첨가할 유제품 첨가제

		-- 음료

		WATER_CLEAN = "깨끗한 물이야!", --깨끗한 물
		WATER_DIRTY = "연못에서 뜬 물이야.", --더러운 물
		WATER_SALTY = "바닷물은 마시면 안 돼.", --바닷물

		GOOPYDRINK = "벌칙게임용 음료야!", --실패한 음료(웻 굽 개념)
		
		-- 주전자 음료

		FRUITJUICE = "우린 과일이 좋아!", --잡 과일쥬스
		BERRIES_JUICE = "산딸기 주스야!", -- 베리 쥬스
		POMEGRANATE_JUICE = "맛있긴 한데 좀 셔.", -- 석류 쥬스
		BANANA_JUICE = "으음, 바나나 향이야.", -- 바나나 쥬스
		FIG_JUICE = "많이 달아!", -- 무화과 쥬스
		DRAGONJUICE = "이제 좀 먹을 것처럼 보이네.", --용과 쥬스
		GLOWBERRYJUICE = "맛있겠다!", -- 발광베리 쥬스
		WATERMELON_JUICE = "정말 시원해!", --수박 쥬스

		VEGGIE_TEA = "우린 야채 먹기 싫어!!", --녹즙
		CARROT_TEA = "그렇다고 이렇게까지 먹고 싶진 않았어.", --당근차
		CACTUS_TEA = "엽육이 입안 가득이야.", --선인차
		TOMATO_JUICE = "과채라고 하는 게 맞을 것 같아.", --토마토 쥬스
		LUMPY_TEA = "쓸 것 같은데 써.", --뿌리차,
		SEAWEED_SHAKE = "점액으로 미끌미끌거려.", --해초 쉐이크
		
		GREENTEA = "으음, 잎 비린내.", --생잎 녹차
		BLACKTEA = "쿠키랑 같이 먹으면 최고야!", --홍차
		BLACKTEA_ICED = "얼음 넣은 차가운 차야.", -- 홍차 아이스티
		FUER = "으으음, 알쏭달송한 차야.", --보이차,이파리차,고사리차
		MIXFLOWER = "이런저런 꽃잎 넣은 차야.", --잡 꽃잎 차
		HIBISCUSTEA = "붉은색으로 물들었어.", --히비스커스 차
		CACTUSFLOWER_TEA = "하루 세 번 마시자.", --선인꽃차
		LOTUSTEA = "물에 사는 꽃으로 만든 차야.", --연꽃차
		SUSHIBISCUS = "엄마가 먹을 거 가지고 장난치면 안 된다고 그러셨어.", -- 자살차
		MOON_BLOSSOM_TEA = "차에 달이 꽉 찼어.", --달꽃차
		MENTHA_SPICATA_TEA = "입안이 시원해지는 기분이야!", -- 박하차

		CAFFEINBERRY_JUICE = "써-!", -- 블랙 커피
        TOFFEE_LATTE = "으음, 버터캔디 맛이야!", --토피넛 라떼
		RUINCHA_LATTE = "맛있다고 너무 많이 먹으면 안 돼.", --모카 라떼(커피+초코)
		
		HOTRUINCOLATE = "우리 발톱과 뱃속을 따듯하게 해줘.", --핫초코
		RUINCOLATE_SMOOTHIE = "우리 발톱과 뱃속을 차갑게 해줘.", --초코 스무디(차가움)
		RUINXOCOLATL = "마시기 싫어...", --쇼콜라틀(매캐함)
		TEA_RUINCOLATE_LATTE = "핫초코 색이 이상해.", -- 말차 라떼

		MULLED = "마시자마자 몸이 따듯해져!", --뱅쇼
		BUTTERBEER = "요정들이 먹는 음료래!", --해리포터 시리즈의 버터비어
		-- AFS: 해리 포터는 1997년에 출판되었습니다

		APPLEPINE_JUICE = "마시고 나면 이가 좀 뻑뻑해.",
		APPLEPINE_SMOOTHIE = "",
		APPLEPINE_CAPPUCCINO = "",

		CITROYUZU_JUICE = "양치는 좀 미뤄야겠네.",	
		CITROYUZU_TEA = "",
		EARLGREY_TEA = "",

		-- 콜라보 주전자 음료

		COCONUT_JUICE = "흐음, 보기보다 맛이 안나.", --난파선 코코넛 쥬스
		RAINBOW_SHAKE = "화려한 색이 좋아!", --난파선 무지개 해파리 쉐이크
		QUARTZ_SHAKE = "으으음, 아무리 생각해도 생선 죽이야.", --난파선 광대 물고기 쉐이크
		NETTLE_TEA = "",
		FRASH_BRAMBLE_TEA = "",
		TUBER_BLOOM_TEA = "",
		CHERRY_ROSEBERRIES_TEA = "그 외계 거미한테서 피를 뽑아낸 거야?", --체리숲 로즈힙 차
		CHERRY_HONEY_TEA = "달고 따뜻하고, 색이 이상해!", --체리숲 벚꽃꿀 차
		SWEET_RICE_DRINK = "말랑한 씨앗들이 들어있어!", -- 비타협 식혜
		STRAWBERRY_SMOOTHIE = "머리가 띵하지 않도록 천천히 마시자.", -- 모어 푸드 팩 딸기 스무디
		STRAWBERRY_MILK_SMOOTHIE = "진짜 딸기로 만들었어!", -- 모어 푸드 팩 딸기 스무디 라떼

		--양조기 음료

		SPOILED_DRINK = "완전 상했잖아!", --썩은 음료

		-- 양조소다
	
		SODA = "뭐야, 밍밍해!", -- 탄산수
		FRUITSODA = "으음, 달콤한 과일 소다야!", -- 과일소다
		LIMONSODA = "시원한데 마시고 나면 목이 끈적여!", -- 레몬 라임소다(과일소다 상위 호환)
		COLA = "이걸 다시볼 줄은 꿈도 못 꿨어!", -- 콜라
		COLAQUANTUM = "예쁜 파란 빛이 나!", --콜라 퀀텀
		LUMPY_BEER = "으으음, 이거 맛이 이상해.", --루트비어(술이 아님)
		APPLEPINESODA = "", -- Pineapple Soda
		CITROYUZUSODA = "", -- Orange Soda (Similar to Fanta CITROYUZU)
		DAWN_FOG = "",
		MOON_CAP_DRINK = "",

		-- 양조주

		CORN_BEER = "우리가 마셔도 괜찮을까?", -- 콘 맥주
		MADHU = "벌꿀로 만들었는데 하나도 안 달아.", --벌꿀주
		WINE = "주스가 아니야!", --와인 (그냥 베리 양조)
		NOBLEWINE = "아마 달 것 같은데, 조금만 마셔볼까?", --노블 와인(구운 베리 양조)
		SPARKLINGWINE = "흔들면 안 돼... 아, 흔들고 싶어...", --스파클링 와인
		GLOWBERRYWINE = "술이 빛나!", --글로우 베리 와인
		KUMIS = "요구르트랑은 좀 달라.", -- 크므즈,산양유주
		LUMPY_WINE = "으음, 엄청 쓰겠어.", --서주(감자 고구마등 뿌리 술)
		PULQUE = "풀로 만든 우유 같은 술이야!", --풀케(선인주)
		RUINCACAO_WINE = "우린 초콜릿이 좋은데.", -- 카카오 와인 
		MIDNIGHT_STORM = "",
		APPLEPINE_CIDER = "",
		MENTHA_SPICATA_WINE = "",

		-- 콜라보 소다

		CHERRY_DOCTOR_COLA = "콜라처럼 맛있는데 콜라는 아니야!", --체리숲 닥터 페퍼(닥터 체리)
		APPLEPINESODA = "이가 안 썩게 조심해야지.", -- 탄산 파인애플(오란씨)
		CITROYUZUSODA = "오렌지향 탄산음료야!", -- 탄산 오랜지(환타)
		STRAWBERRYSODA = "위커바텀 선생님이 탄산음료는 적당히 마시랬어.", -- 탄산 딸기(웰치스 딸기)

		--콜라보 양조주

		AUROBOW = "빛나는 해파리로 만들었다고?", -- 난파선 오로보우,무지개 해파리주
		COCONUT_WINE = "좀 단내나는 나무 향이 나.", -- 난파선 코코넛 와인
		NETTLE_WINE = "",
		CHERRY_BLOOM_MADHU = "술인데 분홍색이야!", -- 체리숲 벚꽃꿀주
		GIANT_BLUEBERRY_WINE = "과즙 가득한 열매가 술이 되었네.", -- 비타협 붐!베리 사파이어(불 붙히면 폭발함)
		RICE_WINE = "씨앗으로 만든 우유 같은 걸까?", -- 비타협 막걸리
		WHEAT_BEER = "으음, 거품이 가득해.", -- 힙 오브 푸드 밀맥주
		PALE_BEER = "완전 이상한 맥주야!", -- 레기온 페일에일 (몬스트라 열매를 쓴 청록색 맥주)

		--증류주

		DISINFECTANT = "아야 하는거 고치는데 쓰는데 더 아야 해.", -- 소독약
		CORN_WHISKEY = "술인데 더 독한거야!", -- 콘 위스키
		LUMPY_VODKA = "볼프강 아저씨는 물이라 하고, 윌로우 누나는 불이래. 헷갈리네.", -- 보드카
		TEQUILA = "선인장으로 술을 담근 거랬어.", -- 데킬라
		MADHU_RUM = "단 걸로 만든 술인데 안 달아. 이상해!", -- 럼주
		BERRY_BRANDY = "아빠가 서재에 이런 걸 숨겼던 것 같아.", -- 베리 브랜디
		AREUHI = "우유로 만들었다는데 못 삼킬 것 같아.", -- 크므즈 증류주 아르히
		APPLEPINE_BRANDY = "",
		VOID_BRANDY = "",
		VOID_GIN  = "",
		CITROYUZU_CURACAO = "",
		MENTHA_SPICATA_CURACAO = "",

		--왈리 전용 증류주

		BERRY_GIN = "술 중에서도 더 독한 냄새가 나.", --진
		GLOWBERRY_GIN = "우웅, 마셔보고 싶진 않아.", --글로우 베리 진
		ABSINTHE = "선명하게 녹색이야!", -- 압생트
		TEA_LUMPY_VODKA = "야채로 만든 술일까?", -- 녹차 리큐르
		PETALS_BERRY_BRANDY = "뭔가 엄마 향수 같은 냄새가 나.", -- 장미향 브랜디
		KAHLUA = "뭔가 엄청 쓸 것 같은데...", -- 커피 리큐르 깔루아
		NUT_CORN_WHISKEY = "우디 아저씨가 좋아할 것 같아!", -- 너트 위스키
        RUINCACAO_CREAM_LIQUEUR = "술과 핫초코를 섞었어?", --베일리스 카카오 크림 리큐르
        RUMCHATA = "우린 그냥 우유 먹을래...", -- 럼차타(럼에 오우차타 라는 유제품 섞은)

		--콜라보 증류주

		MOONWAY = "색이 예뻐!", -- 무지개 해파리주 증류주
		NETTLE_LIQUEUR = "",
		ARRACK = "우린 그냥 야자열매나 먹어야겠어.", -- 아락 인도네시아 버전 코코넛 와인 증류주
		CHERRY_BLOOM_RUM = "꽃잎이 둥둥 떠 있어!", -- 체리 꿀주 증류주 벛꽃잎 떠다님
		RICE_SPIRITS = "물이 아니잖아!", --청주
		WHEAT_WHISKEY = "차라리 빵이었으면!", -- 밀 위스키
		PALE_WHISKEY = "으음, 완전 이상한 술이야.", -- 페일 몰트 위스키

		--왈리 전용 콜라보 증류주

		NUT_COCONUT_BRANDY = "충격과 공포다, 바다 야그들아!", -- 코코넛 브랜디 (캐러비안 럼을 만들수 없어서 카리브 브랜디 라는 이름으로 대체)
	    GIANT_BLUEBERRY_GIN = "콰과광!", -- 붐 베리 사파이어 (당근 폭발함)

		--냄비 요리

        DARK_RUINCOLATE = "왈리 아저씨가 실수로 태우신 걸까?", --다크 초콜릿.
        WHITE_RUINCOLATE = "친구이랑 나눠 먹어야겠어!", --화이트 초콜릿
        RUINCOLATE = "진하고 달아!", -- 그냥 초콜릿
        RUIN_SCHOKAKOLA = "뭔가 심장이 쿵쿵거려.", -- 쇼카콜라
        APPLEPINE_PIE = "",
        APPLEPINE_FRIED_RICE = "",
        CITROYUZU_BBQ = "",

		BUCKET_STEEL_EMPTY = 
		{
			EMPTY = "이걸로 모래성을 만들자!", --빈 양철 양동이
			FULL = "빗물이 담겼어!", -- 깨끗한 빗물이 참
			FULL_ICE = "꽁-꽁!", -- 빗물이 얼어버림
			DIRTY = "벌레가 가득해.", --빗물이 더러워짐
			DIRTY_ICE = "우웩, 얼어버렸어!", --더러운 빗물이 얼어버림
		},

		BUCKET_WOODIE_EMPTY = 
		{
			EMPTY = "의자로 쓰기에는 약해 보여.", --우디의 빈 나무 양동이
			FULL = "빗물이 담겼어!", -- 깨끗한 빗물이 참
			FULL_ICE = "꽁-꽁!", -- 빗물이 얼어버림
			DIRTY = "벌레가 가득해.", --빗물이 더러워짐
			DIRTY_ICE = "우웩, 얼어버렸어!", --더러운 빗물이 얼어버림
		},

		BUCKET_DRIFTWOOD_EMPTY = 
		{
			EMPTY = "우리 장난감을 넣어서 물가에 띄워보자!", -- 유목양동이
			FULL = "빗물이 담겼어!", -- 깨끗한 빗물이 참
			FULL_ICE = "꽁-꽁!", -- 빗물이 얼어버림
			DIRTY = "벌레가 가득해.", --빗물이 더러워짐
			DIRTY_ICE = "우웩, 얼어버렸어!", --더러운 빗물이 얼어버림
		},

		BUCKET_EMPTY = 
		{
			EMPTY = "거미 친구들이 들어가기에는 좀 작겠어.", -- 빈 나무 양동이
			FULL = "빗물이 담겼어!", -- 깨끗한 빗물이 참
			FULL_ICE = "꽁-꽁!", -- 빗물이 얼어버림
			DIRTY = "벌레가 가득해.", --빗물이 더러워짐
			DIRTY_ICE = "우웩, 얼어버렸어!", --더러운 빗물이 얼어버림
		},

		DESALINATOR =
		{
			EMPTY = "물이 없어서 그런가?", --제염기에 물이 없음
			PURIFY_LONG = "소금기가 빠지려면 오래 걸릴 거야!", -- 정수 끝나기까지 많이 남음
			PURIFY_SHORT = "소금이 거의 다 빠졌어!", -- 정수가 곧 끝남
			HASWATER = "물 좀 가져갈게요, 통 아저씨!", --제염기에 깨끗한 물이 있음
			BURNT = "통 아저씨가 아파 보여.",   --제염기가 타버림
			HASSALT = "통 아저씨가 배 아프대.", --제염기에 소금이 남아 있음
		},

		BARREL =
		{
			GENERIC = "우리 물을 담아둘 수 있어!", -- 물통 조사 대사
			BURNT = "이제는 별 쓸모가 없을 거야.", -- 물통이 타버림
		},

		BREWERY =
		{
			EMPTY = "여기에 숨는 건 좋은 생각이 아닐 것 같아.", --양조기 조사 대사
			BURNT = "으음, 다 타 버렸네.", --양조기 타버림
			FERMENTING_LONG = "얼마나 오래 걸릴까?", --양조 끝나기 까지 많이 남음
			FERMENTING_SHORT = "곧 끝날 것 같아!", --양조가 곧 끝남
			DONE = "음료가 완성됐나 봐!", --양조기에 음료가 들어있음
		},

		CAMPKETTLE_ITEM = "내 팔 하나로 들고 다녀야겠어!", --휴대 주전자 아이템 조사 대사
		CAMPKETTLE =
		{
			GENERIC = "으음, 이대로는 별 쓸모가 없을 거야.", -- 화덕에 건 휴대 주전자 안에 물이 없음
			BOILING_LONG = "하나도 안 뜨거워.", -- 물 끓이기 시작함
			BOILING_SHORT = "수증기가 뿜어져 나오고 있어!", -- 물 거의 다 끓음
			DONE = "깨끗한 물이야!", --깨끗한 물이 들음
			STOP = "끓이다 말았어.", --화덕에 불이 없어서 더러운물이 끓지 않는 상태
		},

		CAMPDESALINATOR_ITEM = "팔 하나로 들기는 조금 무거워!", --휴대 제염기 아이템 조사 대사
		CAMPDESALINATOR = 
		{
			GENERIC = "으음, 이대로는 별 쓸모가 없을 거야.", --물 없음
			BOILING_LONG = "아직은 바닷물 쪽이 많아.", --물 끓이기 시작
			BOILING_SHORT = "깨끗한 물이 많아졌어!", --거의 다 끓음 
			DONE = "어서 마시자!", -- 깨끗한 물이 들음
			STOP = "바람개비가 멈췄어.", -- 화덕에 불이 없어서 소금물이 정수 되지 않는 상태
		},

		TEA_POT =
		{
			EMPTY = "음식과 물을 넣으면 음료가 돼서 나와!", --빈 주전자 조사대사
			BURNT = "이제 음료는 못 마시겠네.", --주전자가 불탐
			BOILING_LONG = "바로는 안 만들어질거야.", -- 음료를 만들기 시작한지 얼마 안됨
			BOILING_SHORT = "거의 다 됐어!", --음료 조리가 거의 끝나감
			DONE = "음료가 준비됐어!", --음료가 완성됨
			PURIFY_LONG = "더러운 걸 끓여서 없애야 해.", -- 더러운 물을 끓이기 시작한지 얼마 안됨
			PURIFY_SHORT = "거의 깨끗해졌어!", --더러운물을 거의 다 끓여감
			HASWATER = "이제 뭘 넣으면 좋을까?", -- 깨끗한 물이 차 있는 상태
			MELT_LONG = "얼음으로는 차를 끓일 수가 없어.", -- 얼음물을 녹이기 시작한지 얼마 안됨
			MELT_SHORT = "으음, 얼음이 거의 녹았어.", -- 얼음물을 거의 녹여감
		},

		PORTABLE_TEA_POT_ITEM =
		{
			GENERIC = "들고 다니면서 주스를 만들어보자!", -- 휴대용 주전자(아이템) 조사 대사
			EMPTY = "에이, 안에 아무것도 없네.", -- 설치한 빈 휴대용 주전자 조사 대사
			BOILING_LONG = "이거 너~무 오래 걸려.", -- 음료를 만들기 시작한지 얼마 안됨
			BOILING_SHORT = "음료가 금방 나올 거야!", --음료 조리가 거의 끝나감
			DONE = "으으음, 어서 마시자!", --음료가 완성됨
			PURIFY_LONG = "얼른 음료로 만들어 마시고 싶어.", -- 더러운 물을 끓이기 시작한지 얼마 안됨
			PURIFY_SHORT = "거의 깨끗해졌어!", --더러운물을 거의 다 끓여감
			HASWATER = "얼른 재료를 넣어보자!", -- 깨끗한 물이 차 있는 상태
			MELT_LONG = "얼음으로는 차를 끓일 수가 없어.", -- 얼음물을 녹이기 시작한지 얼마 안됨
			MELT_SHORT = "으음, 얼음이 거의 녹았어.", -- 얼음물을 거의 녹여감
		},

		KETTLE =
		{
			EMPTY = "음식과 물을 넣으면 음료가 돼서 나와!", --빈 주전자 조사대사
			BURNT = "이제 음료는 못 마시겠네.", --주전자가 불탐
			DONE = "음료가 준비됐어!", --음료가 완성됨
			PURIFY_LONG = "더러운 걸 끓여서 없애야 해.", -- 더러운 물을 끓이기 시작한지 얼마 안됨
			PURIFY_SHORT = "거의 깨끗해졌어!", --더러운물을 거의 다 끓여감
			HASWATER = "이제 뭘 넣으면 좋을까?", -- 깨끗한 물이 차 있는 상태
			MELT_LONG = "얼음으로는 차를 끓일 수가 없어.", -- 얼음물을 녹이기 시작한지 얼마 안됨
			MELT_SHORT = "으음, 얼음이 거의 녹았어.", -- 얼음물을 거의 녹여감
		},

		PORTABLEKETTLE_ITEM =
		{
			GENERIC = "들고 다니면서 주스를 만들어보자!", -- 휴대용 주전자(아이템) 조사 대사
			EMPTY = "에이, 안에 아무것도 없네.", -- 설치한 빈 휴대용 주전자 조사 대사
			DONE = "으으음, 어서 마시자!", --음료가 완성됨
			PURIFY_LONG = "얼른 음료로 만들어 마시고 싶어.", -- 더러운 물을 끓이기 시작한지 얼마 안됨
			PURIFY_SHORT = "거의 깨끗해졌어!", --더러운물을 거의 다 끓여감
			HASWATER = "얼른 재료를 넣어보자!", -- 깨끗한 물이 차 있는 상태
			MELT_LONG = "얼음으로는 차를 끓일 수가 없어.", -- 얼음물을 녹이기 시작한지 얼마 안됨
			MELT_SHORT = "으음, 얼음이 거의 녹았어.", -- 얼음물을 거의 녹여감
		},
		
		DISTILLERS =
		{   
		    EMPTY = "우와, 엄청 큰 과학실험 장치 같아.", --증류기 조사 대사
			DISTILLTING_LONG = "끝날 때까지 오래 걸릴 것 같아.", --증류가 끝나기 까지 많이 남음
			DISTILLING_SHORT = "실험이 곧 끝날 것 같아!", --증류가 곧 끝남
			DONE = "뭐가 만들어졌는지 확인해보자!", --증류기에 음료가 들어있음
		},

		WELL_WATERPUMP = {
			HIGH_PRESSURE = "힘이 엄청 강해!", -- 압력 최대
			MIDDLE_PRESSURE = "열심히 일하고 있어.", -- 압력이 중간
			LOW_PRESSURE = "왠지 기운이 없네.", -- 압력이 거의 없을때
			RECHARG_PRESSURE = "으음, 내가 물을 길어올게!", -- 압력이 아예 없을때(여기까지 쓰면 압력이 최대가 될때까지 못씀.)
		},
		
		WELL_SPRINKLER =
		{ 
			LOWFUEL = "연료가 떨어졌어.", -- 연료가 거의 없는 상태에서의 조사 대사
			ON = "첨벙 첨벙!", -- 작동중임
			OFF = "주변에 물을 마구 뿌려.", --작동을 멈춘상태에서의 조사 대사
		},	
	},
}