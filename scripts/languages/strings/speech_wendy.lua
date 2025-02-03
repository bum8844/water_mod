return {
	ACTIONFAIL =
	{
		GIVE =
		{
			WELL_NOTEMPTY = "달려 있는 물동이부터 치워야 해.",
			WELL_BUSY = "물동이가 아직 심연 속에 있어.",
		}
	},

	ANNOUNCE_DRUNK = "아비게일... 나 너무 외로워...", -- 취함

	ANNOUNCE_DRUNK_MUMBLE =
	{
		"...히끅!",
		"나는 어디에서 왔고... 어떤 사람이고... 어디로 가는 걸까?",
		"...아아...",
		"아빠는 잘 지내고 계실까...",
		"...흑흑.",
		"아비게일, 다시는 내 곁에서 안 떠날 거지? 그치?",
		"흐흐흑... 히끅!",
		"이렇게라도 함께인 게 다행인 걸까?",
		"아니야, 아비게일... 나 정말 괜찮아...",
	},

	ANNOUNCE_DRUNK_END = "...웃지 마, 아비게일. 창피하단 말야.", --술에서 좀 깸 (그로기)
	ANNOUNCE_DRUNK_IMMUNITY = "only_used_by_wolfgang_and_wathgrithr",
	ANNOUNCE_NOTCHARGE = "나눠줄 젖이 없나 보구나.", --번개염소가 충전이 안되서 양동이로 젖을 짤수 없음
	ANNOUNCE_NOTHIRSTSLEEP = "내 목이 심연에 잠기고 있어. 지금은 잘 수 없어.", -- 목이 마른데 밤에 잘려고 시도
	ANNOUNCE_NOTHIRSTSIESTA = "내 육신이 말라붙고 있어. 지금은 잘 수 없어.", -- 목이 마른데 낮에 잘려고 시도
	ANNOUNCE_SLEEP_END = "아아, 차라리 그 잠에서 영영 깨어나지 않았더라면!", --자고 일어나서 술에서 완전히 깸 
	ANNOUNCE_THIRST = "목이 바싹 갈라지고 있어.", --너무 목말라!

	ANNOUNCE_CAFFINE_BUFF_START = "저 멀리 날아갈 수도 있을 것 같은 기분이야!", -- 카페인 버프 시작
    ANNOUNCE_CAFFINE_BUFF_STOP = "다시 땅에 묶이고 말았어.",  -- 카페인 버프 끝

    ANNOUNCE_SATIETY_BUFF_START = "" , -- 포만감 버프 시작
    ANNOUNCE_SATIETY_BUFF_STOP = "" ,  -- 포만감 버프 끝
    
    ANNOUNCE_CURE_WATERBORNE = "이 고통이 멎어도 또다른 고통이 찾아올 뿐이겠지." ,  -- 수인성 질병을 아이템으로 치료했을때의 대사

	ANNOUNCE_DCAPACITY_CRITICAL = "창피한 건 잊어도 아비게일은 잊지 않을 거야.",
	ANNOUNCE_DCAPACITY_HALF = "왜 그렇게 창피해 했는지 알겠네.",

	DESCRIBE =
	{
     	BOILBOOK_BASIC = "목을 축일 수 있다해도, 눈물로 다 흘려보낼 뿐이야.",
     	BOILBOOK_ADVANCED = "목을 축일 수 있다해도, 눈물로 다 흘려보낼 뿐이야.",

		WATER_CLEAN_ICE = "내 심장처럼 얼어붙었어.",
		WATER_DIRTY_ICE = "더럽혀진 차가운 마음이야.",

		SPICE_CAFFEINPEPPER = "나보다도 쓰임새가 많아.",
		SPICE_RUINCOLATE_SPREAD = "",

		WELL_KIT = "무겁지만 의욕을 내봐야 겠지.",
		WELL_SPRINKLER_KIT = "설치할 곳만 알려주면 기계가 알아서 자리를 잡을 거야.",
		WELL_WATERPUMP_KIT = "차가운 기계 심장이야.",
		WELL_BURYING_KIT = "그렇게 막는대도 결국 흉터는 남겠지.",
		WELL_DRILLING = "땅 위에 깊은 상흔을 남기고 있어.",
		WELL_DRILLING_ITEM = "대지를 꿰뚫는 드릴이야.",
		HOLE = "나는 아직 밑바닥에 닿지도 않았는데, 어떻게 집에 돌아갈 수 있을까?", -- (이상한 나라의 엘리스)
		WELL = "어떤 어두운 비밀이 숨어있을지 누가 알겠어.",
<<<<<<< HEAD
		BOTTLE_POUCH = "",
=======
		BOTTLE_POUCH_SMALL = "",
		BOTTLE_POUCH_BIG = "",
		THERMOS_BOTTLE_SMALL = "",
		THERMOS_BOTTLE_BIG = "",
>>>>>>> Beta_1.2.8
		WINE_CELLAR_PART = "",
		WINE_CELLAR = "",

		WX78MODULE_NONEDRUNK = "매우 연약해 보여... 안타까운 사고는 없었으면 좋겠네.", -- 78전용 묘듈
<<<<<<< HEAD
=======
		PURIFICATION_TABLETS = "",
>>>>>>> Beta_1.2.8
		
		-- 물 모드 식물

		TEA_TREE = "잎이 무성해.",--차나무
		DUG_TEA_TREE = "죽은 그대로가 맘에 들지만, 땅으로 되돌려줘야 할 것 같아.", --땅에서 파낸 차나무
		TEA_SEED = "불안정한 죽음 속에 자리잡은 생명이야.", -- 차나무 열매
		TEA_SEED_COOKED = "구워져 죽어버렸어.", --구운 차나무 열매
		TEA_SEED_SAPLING = "뿌리는 하나지만 줄기끼리는 사이가 나빠.", --차나무 새싹
		TEALEAVES = "가지로부터 꺾여진 잎사귀야.", --찻잎
		TEALEAVES_DRIED = "햇빛 속에서 바싹 말라버렸어.", --말린 찻잎

		CAFFEINBERRY = "콩을 맺는 식물이야.", --커피 덤불
		DUG_CAFFEINBERRY = "슬퍼라. 넌 집이 없구나.", --파낸 커피덤불
		CAFFEINBERRY_BEAN = "자극적인 것 같아.", --생 커피콩
		CAFFEINBERRY_BEAN_COOKED = "삶의 의지를 콩에서 얻을 줄을 누가 알았을까?", --구운 커피콩

		RUINCACAO_TREE = "자기 종자를 태우고 양분으로 삼아.", --카카오 나무
		DUG_RUINCACAO_TREE = "그 동굴이 너의 지옥이였을까?", --파낸 카카오 나무
		RUINCACAO_SEED = "불타기 전에 구해냈어.", --카카오 새싹 아이템
		RUINCACAO_SEED_SAPLING = "어둠 속에서 피어난 생명이야.", -- 카카오 새싹 심은거
		RUINCACAO = "작은 생명들이 갇힌 화장용 관이야.", --부수기 전 카카오 열매
		RUINCACAO_BEAN = "기름으로 가득해.", --부순 후 카카오 콩  
		RUINCACAO_BEAN_COOKED = "결국 끝은 똑같았구나.", --구운 카카오 콩

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

		ADDITIVE_SEED = "특이한 향이 나는 씨앗들을 모아 놨어.", -- 리큐르에 제조에 첨가 할 씨허브(아니스,쥬니퍼베리,팔각 모티브)첨가제 
		ADDITIVE_PETALS = "바싹 말라버린 꽃잎과 이파리들.", -- 리큐르에 제조에 첨가 할 허브,녹차,꽃잎 첨가제
		ADDITIVE_NUT = "우리가 미래의 식물을 부숴버렸어.", -- 리큐르에 제조에 첨가 할 버치넛,코코넛,커피콩,카카오콩 첨가제
		ADDITIVE_DAIRY = "굳게 밀봉한 크림이야.", -- 리큐르에 제조에 첨가할 유제품 첨가제

		-- 음료

		WATER_CLEAN = "찰나의 삶을 조금 연장할 뿐.", --깨끗한 물
		WATER_DIRTY = "천천히 고통스럽게 말라죽고 싶다면야.", --더러운 물
		WATER_SALTY = "생명을 주지만, 동시에 죽음에 이르게 하는 독이야.", --바닷물 (소설 파리 대왕)

		GOOPYDRINK = "삶이 그렇듯, 끔찍하게 엉망이야.", --실패한 음료(웻 굽 개념)
		
		-- 주전자 음료

		FRUITJUICE = "여러 과일이 으깨져 하나가 되었어.", --잡 과일쥬스
		BERRIES_JUICE = "그 한 모금을 위해 얼마나 많은 베리를 찧어야 했을까.", -- 베리 쥬스
		POMEGRANATE_JUICE = "석류를 알알이 고통스럽게 으깬 거야.", -- 석류 쥬스
		BANANA_JUICE = "아비게일도 맛볼 수 있었으면 좋았을 텐데...", -- 바나나 쥬스
		FIG_JUICE = "작은 씨앗들이 목에 걸려.", -- 무화과 쥬스
		DRAGONJUICE = "뭐, 이젠 주스가 되었네.", --용과 쥬스
		GLOWBERRYJUICE = "몸이 파랗게 빛날까?", -- 발광베리 쥬스
		WATERMELON_JUICE = "물에 물 탄 듯이..", --수박 쥬스

		VEGGIE_TEA = "야채를 한데 섞고 끓여버렸어.", --녹즙
		CARROT_TEA = "당근을 물에 불렸어.", --당근차
		CACTUS_TEA = "물을 탐하던 식물은 결국 물에 빠져 죽었어.", --선인차
		TOMATO_JUICE = "피는 물보다 진하다지만, 내가 마시고 싶은건 물인걸.", --토마토 쥬스
		LUMPY_TEA = "더는 뿌리를 내릴 순 없겠지.", --뿌리차,
		SEAWEED_SHAKE = "영문을 모르겠네.", --해초 쉐이크
		
		GREENTEA = "이것도 차는 차인 걸까.", --생잎 녹차
		BLACKTEA = "진짜 다과회를 열 수 있게 됐어!", --홍차 (제인 오스틴 / 소설 오만과 편견)
		BLACKTEA_ICED = "지친 삶에 잠깐의 쉴 시간을 가질 뿐이야.", -- 홍차 아이스티
		FUER = "그럼, 모자 장수 역할은 누가 맡지?", --보이차,이파리차,고사리차 (이상한 나라의 엘리스)
		MIXFLOWER = "꽃잎을 한데 모아 끓여버렸어.", --잡 꽃잎 차
		HIBISCUSTEA = "꽤 시어.", --히비스커스 차
		CACTUSFLOWER_TEA = "삶아져도 예쁘네. 질투심이 들어.", --선인꽃차
		LOTUSTEA = "고통 속에서도 평온이 자리잡고 있어.", --연꽃차
		SUSHIBISCUS = "잠시라도 아비게일과 함께 할 수만 있다면...", -- 자살차
		MOON_BLOSSOM_TEA = "더 이상 아름다움을 뽐낼 수 없겠지.", --달꽃차

		CAFFEINBERRY_JUICE = "어둡고, 씁쓸해.", -- 블랙 커피
        TOFFEE_LATTE = "단맛이 커피의 향을 덮어버렸어.", --토피넛 라떼
		RUINCHA_LATTE = "쓴 걸 못 마시는 어른들을 위한 커피야.", --모카 라떼(커피+초코)
		
		HOTRUINCOLATE = "따뜻한 코코아가 그리웠어.", --핫초코
		RUINCOLATE_SMOOTHIE = "달콤함의 소용돌이야.", --초코 스무디(차가움)
		RUINXOCOLATL = "나도 심장도 계단 아래로 굴러 떨어진걸까?", --쇼콜라틀(매캐함)
		TEA_RUINCOLATE_LATTE = "씁쓸하지만 달기도 해.", -- 말차 라떼

		MULLED = "차디 차고 부셔진 심장도 녹여줄수 있을까?", --뱅쇼
		BUTTERBEER = "마법처럼 달콤해.", --해리포터 시리즈의 버터비어

		APPLEPINE_JUICE = "질긴 과피를 찢고 과육을 갈아냈어.",
		APPLEPINE_SMOOTHIE = "",
		APPLEPINE_CAPPUCCINO = "",

		CITROYUZU_JUICE = "두꺼운 과피만큼이나 시어.",
		CITROYUZU_TEA = "",
		EARLGREY_TEA = "",		

		-- 콜라보 주전자 음료

		COCONUT_JUICE = "부서진 내 마음도 이리 굳었으면.", --난파선 코코넛 쥬스
		RAINBOW_SHAKE = "아름다움의 파멸이야.", --난파선 무지개 해파리 쉐이크
		QUARTZ_SHAKE = "바보에게 알맞은 죽음이구나.", --난파선 광대 물고기 쉐이크
		NETTLE_TEA = "",
		FRASH_BRAMBLE_TEA = "",
		TUBER_BLOOM_TEA = "",
		CHERRY_ROSEBERRIES_TEA = "꽃 봉우리를 들이키지 않도록 조심해야지.", --체리숲 로즈힙 차
		CHERRY_HONEY_TEA = "그 어떤 달콤함도 아비게일을 대신하진 못해.", --체리숲 벚꽃꿀 차
		SWEET_RICE_DRINK = "씹히는 무언가가 있어.", -- 비타협 식혜
		STRAWBERRY_SMOOTHIE = "딸기를 얼음과 함께 갈아냈어.", -- 모어 푸드 팩 딸기 스무디
		STRAWBERRY_MILK_SMOOTHIE = "부드러움이 혀 끝에 휘감기는 맛이야.", -- 모어 푸드 팩 딸기 스무디 라떼

		--양조기 음료

		SPOILED_DRINK = "이보다 더 나빠질 수 있을까?", --썩은 음료

		-- 양조소다
	
		SODA = "그저 톡 쏘는 물일 뿐이야.", -- 탄산수
		FRUITSODA = "과일즙을 갈아 넣은 소다야.", -- 과일소다
		LIMONSODA = "이조차도 아비게일만큼 달콤하진 않아.", -- 레몬 라임소다(과일소다 상위 호환)
		COLA = "수많은 사람을 지배하는 검은 단물이야.", -- 콜라
		COLAQUANTUM = "새까만 음료가 빛까지 내네.", --콜라 퀀텀
		LUMPY_BEER = "내 입맛에는 잘 맞는 것 같아.", --루트비어(술이 아님)
		APPLEPINESODA = "시고 달콤한 소다야.", -- 탄산 파인애플(오란씨)
		CITROYUZUSODA = "오렌지 과즙을 짜 넣은 탄산음료야.", -- 탄산 오랜지(환타)
		DAWN_FOG = "",
		MOON_CAP_DRINK = "",

		-- 양조주

		CORN_BEER = "거품이 많은 씁쓸한 술이야.", -- 콘 맥주
		MADHU = "한 모금을 위해 얼마나 많은 꿀을 훔쳐야 했을까.", --벌꿀주
		WINE = "피처럼 붉고 진해.", --와인 (그냥 베리 양조)
		NOBLEWINE = "백혈병에 걸린 과일로 만들었을까?", --노블 와인(구운 베리 양조)
		SPARKLINGWINE = "기포가 새지 않게 하려 해 봤자 부질없는 노력이야.", --스파클링 와인
		GLOWBERRYWINE = "술 안에 빛나는 유령이 깃든 걸까?", --글로우 베리 와인
		KUMIS = "아기 짐승들에게는 유감이야.", -- 크므즈,산양유주
		LUMPY_WINE = "투명하고, 살짝 겨자색이야.", --서주(감자 고구마등 뿌리 술)
		PULQUE = "자랑하는 바늘들이 전부 녹아버렸네.", --풀케(선인주)
		RUINCACAO_WINE = "달콤해지긴 글렀어.", -- 카카오 와인 
<<<<<<< HEAD
		MIDNIGHT_STROM = "",
=======
		MIDNIGHT_STORM = "",
>>>>>>> Beta_1.2.8
		APPLEPINE_CIDER = "",
		MENTHA_SPICATA_WINE = "",

		-- 콜라보 소다

		CHERRY_DOCTOR_COLA = "진짜 의사는 아니지만 잠깐의 위안은 되겠지.", --체리숲 닥터 페퍼(닥터 체리)
		STRAWBERRYSODA = "딸기를 으깨넣은 탄산음료야.", -- 탄산 딸기(웰치스 딸기)

		--콜라보 양조주

		AUROBOW = "술로 만들어도 다채로운 색깔로 빛나는구나.", -- 난파선 오로보우,무지개 해파리주
		COCONUT_WINE = "은은한 단 내음이 나.", -- 난파선 코코넛 와인
		NETTLE_WINE = "",
		CHERRY_BLOOM_MADHU = "덧없는 아름다움을 얼마나 오래 즐기려 할 셈이었을까?", -- 체리숲 벚꽃꿀주
		GIANT_BLUEBERRY_WINE = "폭발하는 듯한 향의 와인이야.", -- 붐 베리 와인 (불 붙히면 폭발함)
		RICE_WINE = "쌀로 만든 술이야.", -- 비타협 막걸리
		WHEAT_BEER = "곡물의 단맛은 느껴지지 않아.", -- 힙 오브 푸드 밀맥주
		PALE_BEER = "이름처럼 창백하네.", -- 레기온 페일에일 (몬스트라 열매를 쓴 청록색 맥주)

		--증류주

		DISINFECTANT = "상처 위를 불모지로 만들어.", -- 소독약
		CORN_WHISKEY = "목을 축이기 위해 불을 마시다니.", -- 콘 위스키
		LUMPY_VODKA = "불이기도 하고, 물이기도 해.", -- 보드카
		TEQUILA = "거칠고 독해.", -- 데킬라
		MADHU_RUM = "스스로 깨닫기도 전에 가라앉고 있을 테지.", -- 럼주
		BERRY_BRANDY = "무엇을 잊어버리려 했는지조차 잊어버리겠지.", -- 베리 브랜디
		AREUHI = "유당이 없더라도 고통스럽겠지.", -- 크므즈 증류주 아르히
		APPLEPINE_BRANDY = "",
<<<<<<< HEAD
		VOID = "",
=======
		VOID_BRANDY = "",
		VOID_GIN  = "",
>>>>>>> Beta_1.2.8
		CITROYUZU_CURACAO = "",
		MENTHA_SPICATA_CURACAO = "",

		--왈리 전용 증류주

		BERRY_GIN = "약으로 쓰이는 걸 본 적이 없어.", --진
		GLOWBERRY_GIN = "푸른 빛으로 사람을 유혹해.", --글로우 베리 진
		ABSINTHE = "독사가 둔갑한 초록 옷의 여인이야.", -- 압생트 (나니아 연대기)
		TEA_LUMPY_VODKA = "건강해지지는 않을 거야.", -- 녹차 리큐르
		PETALS_BERRY_BRANDY = "꽃 향기로 유혹하고 있어.", -- 장미향 브랜디
		KAHLUA = "커피를 진하게 응축한 듯한 향이야.", -- 커피 리큐르 깔루아
		NUT_CORN_WHISKEY = "내게 땅콩 알레르기가 있었더라면.", -- 너트 위스키
        RUINCACAO_CREAM_LIQUEUR = "향은 달콤해.", --베일리스 카카오 크림 리큐르
        RUMCHATA = "달콤한 유혹이지만 아비게일만큼 달콤하지는 않아.", -- 럼차타(럼에 오우차타 라는 유제품 섞은)

		--콜라보 증류주

		MOONWAY = "죽음의 무지개야.", -- 무지개 해파리주 증류주
		NETTLE_LIQUEUR = "",
		ARRACK = "야자술을 증류한 술이야.", -- 아락 인도네시아 버전 코코넛 와인 증류주
		CHERRY_BLOOM_RUM = "눈으로만 마시는 게 최선이겠지.", -- 체리 꿀주 증류주 벛꽃잎 떠다
		RICE_SPIRITS = "물로 위장한 독주야.", --청주
		WHEAT_WHISKEY = "천천히 내장부터 문드러지게 만들어.", -- 밀 위스키
		PALE_WHISKEY = "창백한 청기사가 놓은 덫이야.", -- 페일 몰트 위스키

		--왈리 전용 콜라보 증류주

		NUT_COCONUT_BRANDY = "같은 열매지만 다른 버전들이지. 그리고 모두 진실이야.", -- 코코넛 브랜디 (캐러비안 럼을 만들수 없어서 카리브 브랜디 라는 이름으로 대체) 대사: 티아 달마
	    GIANT_BLUEBERRY_GIN = "나만큼이나 자기파괴적이야.", -- 붐 베리 사파이어 (당근 폭발함)

		--냄비 요리

        DARK_RUINCOLATE = "내 삶만큼이나 쓰고 어두워.", --다크 초콜릿.
        WHITE_RUINCOLATE = "아비게일 너도 이 달콤함을 맛볼 수 있었으면 좋았을 텐데.", --화이트 초콜릿
        RUINCOLATE = "먹을 수 있는 검은 연료야.", -- 그냥 초콜릿
        RUIN_SCHOKAKOLA = "이것으로조차도 깨지 않을 만큼 깊이 잠드는 게 내 소원이야.", -- 쇼카콜라
        APPLEPINE_PIE = "",
        APPLEPINE_FRIED_RICE = "",
<<<<<<< HEAD
        citroyuzu_bbq = "",
=======
        CITROYUZU_BBQ = "",
>>>>>>> Beta_1.2.8

		BUCKET_STEEL_EMPTY = 
		{
			EMPTY = "단단하지만 마음이 없어.", --빈 양철 양동이
			FULL = "빗물로 채워져 있어.", -- 깨끗한 빗물이 참
			FULL_ICE = "얼어붙은 심장이야.", -- 빗물이 얼어버림
			DIRTY = "생명이 가득한 동시에 죽음이 가득해.", --빗물이 더러워짐
			DIRTY_ICE = "얼었다고 깨끗해지지는 않아.", --더러운 빗물이 얼어버림
		},

		BUCKET_WOODIE_EMPTY = 
		{
			EMPTY = "죽어서 속을 비워낸 나무토막이야.", --우디의 빈 나무 양동이
			FULL = "빗물로 채워져 있어.", -- 깨끗한 빗물이 참
			FULL_ICE = "얼어붙은 심장이야.", -- 빗물이 얼어버림
			DIRTY = "생명이 가득한 동시에 죽음이 가득해.", --빗물이 더러워짐
			DIRTY_ICE = "얼었다고 깨끗해지지는 않아.", --더러운 빗물이 얼어버림
		},

		BUCKET_DRIFTWOOD_EMPTY = 
		{
			EMPTY = "뼛가루를 담자, 그대로 바다로 돌려보내자.", -- 유목양동이
			FULL = "빗물로 채워져 있어.", -- 깨끗한 빗물이 참
			FULL_ICE = "얼어붙은 심장이야.", -- 빗물이 얼어버림
			DIRTY = "생명이 가득한 동시에 죽음이 가득해.", --빗물이 더러워짐
			DIRTY_ICE = "얼었다고 깨끗해지지는 않아.", --더러운 빗물이 얼어버림
		},

		BUCKET_EMPTY = 
		{
			EMPTY = "그저 빈 물동이야.", -- 빈 나무 양동이
			FULL = "빗물로 채워져 있어.", -- 깨끗한 빗물이 참
			FULL_ICE = "얼어붙은 심장이야.", -- 빗물이 얼어버림
			DIRTY = "생명이 가득한 동시에 죽음이 가득해.", --빗물이 더러워짐
			DIRTY_ICE = "얼었다고 깨끗해지지는 않아.", --더러운 빗물이 얼어버림
		},

		DESALINATOR =
		{
			EMPTY = "공허하게 울리는 소리만 들려.", --제염기에 물이 없음
			PURIFY_LONG = "물이 소금을 떠나고 있어.", -- 정수 끝나기까지 많이 남음
			PURIFY_SHORT = "이제 곧 마무리될 거야.", -- 정수가 곧 끝남
			HASWATER = "오직 물만이 남았어.", --제염기에 깨끗한 물이 있음
			BURNT = "그슬린 소금 냄새만 피어오르고 있어.",   --제염기가 타버림
			HASSALT = "소금으로 소금을 거르는 꼴이야.", --제염기에 소금이 남아 있음
		},

		BARREL =
		{
			GENERIC = "내 물을 저장할 수 있어.", -- 물통 조사 대사
			BURNT = "내 육신도 이제 말라버리겠구나.", -- 물통이 타버림
		},

		BREWERY =
		{
			EMPTY = "양조는 그저 절제된 부패일 뿐이야.", --양조기 조사 대사
			BURNT = "그슬린 향만이 남았어.", --양조기 타버림
			FERMENTING_LONG = "재료가 부패하고 있어.", --양조 끝나기 까지 많이 남음
			FERMENTING_SHORT = "좀 더 숙성시켜야 해.", --양조가 곧 끝남
			DONE = "잡일을 또 하나 끝냈어.", --양조기에 음료가 들어있음
		},

		CAMPKETTLE_ITEM = "손잡이 달린 주전자야.", --휴대 주전자 아이템 조사 대사
		CAMPKETTLE =
		{
			GENERIC = "연못에서 물을 떠와야 하려나.", -- 화덕에 건 휴대 주전자 안에 물이 없음
			BOILING_LONG = "물이 미지근해.", -- 물 끓이기 시작함
			BOILING_SHORT = "좀 더 끓여야 해.", -- 물 거의 다 끓음
			DONE = "이 비루한 삶을 조금 더 이어나갈 수 있게 됐어.", --깨끗한 물이 들음
			STOP = "아직 덜 끓였어.", --화덕에 불이 없어서 더러운물이 끓지 않는 상태
		},

		CAMPDESALINATOR_ITEM = "굳이 끙끙대면서 들고다녀야 할까?", --휴대 제염기 아이템 조사 대사
		CAMPDESALINATOR = 
		{
			GENERIC = "바닷물을 구해와야 하려나.", --물 없음
			BOILING_LONG = "대부분 바닷물이야.", --물 끓이기 시작
			BOILING_SHORT = "많은 생명이 죽었겠지.", --거의 다 끓음 
			DONE = "이 비루한 삶을 조금 더 이어나갈 수 있게 됐어.", -- 깨끗한 물이 들음
			STOP = "아직 덜 끓였어.", -- 화덕에 불이 없어서 소금물이 정수 되지 않는 상태
		},

<<<<<<< HEAD
		KETTLE =
=======
		TEA_POT =
>>>>>>> Beta_1.2.8
		{
			EMPTY = "내 희망처럼 말라붙었어.", --빈 주전자 조사대사
			BURNT = "바싹 태워졌어.", --주전자가 불탐
			BOILING_LONG = "안에 무엇이 들어있든 아직 살아 있을 거야.", -- 음료를 만들기 시작한지 얼마 안됨
			BOILING_SHORT = "좀 더 조리해야 해.", --음료 조리가 거의 끝나감
			DONE = "드디어 목을 축일 수 있어.", --음료가 완성됨
			PURIFY_LONG = "물이 여전히 미지근해.", -- 더러운 물을 끓이기 시작한지 얼마 안됨
			PURIFY_SHORT = "좀 더 끓여야 해.", --더러운물을 거의 다 끓여감
			HASWATER = "찻잎은 없을까?", -- 깨끗한 물이 차 있는 상태
			MELT_LONG = "여전히 얼어 있어.", -- 얼음물을 녹이기 시작한지 얼마 안됨
			MELT_SHORT = "조금 더 녹여야 해.", -- 얼음물을 거의 녹여감
		},

<<<<<<< HEAD
		PORTABLEKETTLE_ITEM =
=======
		PORTABLE_TEA_POT_ITEM =
>>>>>>> Beta_1.2.8
		{
			GENERIC = "역시 차 말고는 아무것도 먹고 싶지 않아.", -- 휴대용 주전자(아이템) 조사 대사 (맨스필드 파크, "But indeed I would rather have nothing but tea")
			EMPTY = "내 희망처럼 말라붙었어.", -- 설치한 빈 휴대용 주전자 조사 대사
			BOILING_LONG = "안에 무엇이 들어있든 아직 살아 있을 거야.", -- 음료를 만들기 시작한지 얼마 안됨
			BOILING_SHORT = "좀 더 조리해야 해.", --음료 조리가 거의 끝나감
			DONE = "드디어 목을 축일 수 있어.", --음료가 완성됨
			PURIFY_LONG = "물이 여전히 미지근해.", -- 더러운 물을 끓이기 시작한지 얼마 안됨
			PURIFY_SHORT = "좀 더 끓여야 해.", --더러운물을 거의 다 끓여감
			HASWATER = "찻잎이 필요해.", -- 깨끗한 물이 차 있는 상태
			MELT_LONG = "여전히 얼어 있어.", -- 얼음물을 녹이기 시작한지 얼마 안됨
			MELT_SHORT = "조금 더 녹여야 해.", -- 얼음물을 거의 녹여감
		},
<<<<<<< HEAD
=======

		KETTLE =
		{
			EMPTY = "내 희망처럼 말라붙었어.", --빈 주전자 조사대사
			BURNT = "바싹 태워졌어.", --주전자가 불탐
			DONE = "드디어 목을 축일 수 있어.", --음료가 완성됨
			PURIFY_LONG = "물이 여전히 미지근해.", -- 더러운 물을 끓이기 시작한지 얼마 안됨
			PURIFY_SHORT = "좀 더 끓여야 해.", --더러운물을 거의 다 끓여감
			HASWATER = "찻잎은 없을까?", -- 깨끗한 물이 차 있는 상태
			MELT_LONG = "여전히 얼어 있어.", -- 얼음물을 녹이기 시작한지 얼마 안됨
			MELT_SHORT = "조금 더 녹여야 해.", -- 얼음물을 거의 녹여감
		},

		PORTABLEKETTLE_ITEM =
		{
			GENERIC = "역시 차 말고는 아무것도 먹고 싶지 않아.", -- 휴대용 주전자(아이템) 조사 대사 (맨스필드 파크, "But indeed I would rather have nothing but tea")
			EMPTY = "내 희망처럼 말라붙었어.", -- 설치한 빈 휴대용 주전자 조사 대사
			DONE = "드디어 목을 축일 수 있어.", --음료가 완성됨
			PURIFY_LONG = "물이 여전히 미지근해.", -- 더러운 물을 끓이기 시작한지 얼마 안됨
			PURIFY_SHORT = "좀 더 끓여야 해.", --더러운물을 거의 다 끓여감
			HASWATER = "찻잎이 필요해.", -- 깨끗한 물이 차 있는 상태
			MELT_LONG = "여전히 얼어 있어.", -- 얼음물을 녹이기 시작한지 얼마 안됨
			MELT_SHORT = "조금 더 녹여야 해.", -- 얼음물을 거의 녹여감
		},
>>>>>>> Beta_1.2.8
		
		DISTILLERS =
		{   
		    EMPTY = "사람이 술을 먹고, 머지않아 술이 술을 먹게 되겠지.", --증류기 조사 대사
			DISTILLTING_LONG = "아마도 오래 걸리겠지.", --증류가 끝나기 까지 많이 남음
			DISTILLING_SHORT = "조금만 더 기다려야 해.", --증류가 곧 끝남
			DONE = "잡일을 또 하나 끝냈어.", --증류기에 음료가 들어있음
		},

		WELL_WATERPUMP = {
			HIGH_PRESSURE = "크게 박동하고 있어.", -- 압력 최대
			MIDDLE_PRESSURE = "움직임에 맞춰 물을 분출하고 있어.", -- 압력이 중간
			LOW_PRESSURE = "기계 심장이 파르르 떨리고 있어.", -- 압력이 거의 없을때
			RECHARG_PRESSURE = "심장이 멎었어.", -- 압력이 아예 없을때(여기까지 쓰면 압력이 최대가 될때까지 못씀.)
		},
		
		WELL_SPRINKLER =
		{ 
			LOWFUEL = "다시 작동시킬 수 있을 거야. 연료만 넣어준다면.", -- 연료가 거의 없는 상태에서의 조사 대사
			ON = "내 할일을 빼앗아 갔어.", -- 작동중임
			OFF = "작동을 멈췄어.", --작동을 멈춘상태에서의 조사 대사
		},	
	},
}