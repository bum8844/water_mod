return {
	ACTIONFAIL =
	{
		GIVE =
		{
			WELL_NOTEMPTY = "먼저 두레박을 치워야 하리라!", -- 우물에 양동이가 달려있는데 양동이 달려 함
			WELL_BUSY = "인내심을 가져라, 아직 두레박은 저 아래에 있으니.", -- 우물 속에 양동이가 들어가 있는데 달려 함
		}
	},

	ANNOUNCE_DRUNK = "으하하... 몇 잔이고... 몇 병이고... 나는...!", -- 취함

	ANNOUNCE_DRUNK_MUMBLE =
	{
		"끄윽!",
		"더... 한 잔 더...!",
		"난 아직도 부족하다!",
		"우리는 아스가르드의 수호자...!",
		"그 용맹 이길 자 어디 있더냐...!",
		"그 누가 나를 보고 지는 별이라 하더냐!!",
		"크하하하하... 노래를 부르고픈 기분이로군!",
		"가자, 전사들이여, 우리가 살육하고 승리하리라!",
		"으으으윽...!",
	},

	ANNOUNCE_DRUNK_END = "여기는 어디인가? 혹 내가 발할라에라도 온 것인가?", --술에서 좀 깸 (그로기)
	ANNOUNCE_DRUNK_IMMUNITY = "크하하! 한 잔 더!", --임시. 위그 전용,
	ANNOUNCE_NOTCHARGE = "아직 준비되지 않았군!", --번개염소가 충전이 안되서 양동이로 젖을 짤수 없음
	ANNOUNCE_NOTHIRSTSLEEP = "타는 갈증에 잠을 이룰 수가 없구나! 목부터 축이자.", -- 목이 마른데 밤에 잘려고 시도
	ANNOUNCE_NOTHIRSTSIESTA = "목부터 축이도록 하지.", -- 목이 마른데 낮에 잘려고 시도
	ANNOUNCE_SLEEP_END = "...에잇, 원통하다! 고작 술 몇 잔에 그런 수치를!", --자고 일어나서 술에서 완전히 깸 
	ANNOUNCE_THIRST = "한 모금의 물이라도 마셨으면 좋으련만!", --너무 목말라!

    ANNOUNCE_CAFFINE_BUFF_START = "헤르모드와 같은 날렵함으로!", -- 카페인 버프 시작
    ANNOUNCE_CAFFINE_BUFF_STOP = "평소의 발걸음으로 돌아왔군.",  -- 카페인 버프 끝

    ANNOUNCE_SATIETY_BUFF_START = "" , -- 포만감 버프 시작
    ANNOUNCE_SATIETY_BUFF_STOP = "" ,  -- 포만감 버프 끝
    
    ANNOUNCE_CURE_WATERBORNE = "이질을 이겨냈노라!" ,  -- 수인성 질병을 아이템으로 치료했을때의 대사

	ANNOUNCE_DCAPACITY_CRITICAL = "몇 잔이고, 몇 병이고 나는 끄떡없다!", --취하기 직전
	ANNOUNCE_DCAPACITY_HALF = "기분 좋은 취기로다!", -- 취기가 돌기 시작

	DESCRIBE =
	{
		BOILBOOK_BASIC = "축배를 들기 좋은 음료가 있었으면 하네.",
		BOILBOOK_ADVANCED = "축배를 들기 좋은 음료가 있었으면 하네.",

		WATER_CLEAN_ICE = "얼어붙었군.",--깨끗한 얼음물
		WATER_DIRTY_ICE = "불결한 얼음이로군.", --더러운 얼음물

		SPICE_CAFFEINPEPPER = "내 만찬에 전투의 흥분을 더하는 가루로다.", --후추 향신료
		SPICE_RUINCOLATE_SPREAD = "",

		WELL_KIT = "내 기꺼이 우물을 설치하리.", --우물 키트
		WELL_SPRINKLER_KIT = "구름없이 비를 뿌리는 기계로다.", --스프링클러 키트
		WELL_WATERPUMP_KIT = "지하 세계를 약탈하는 기계란 말인가?", --스팀 물펌프 키트
		WELL_BURYING_KIT = "혹여나 헬로 떨어지는 이가 생기면 안 되지 않은가.", -- 구멍 매설 키트
		WELL_DRILLING = "헬까지도 닿을 듯한 기세로다!", --드릴로 구멍 뚫는 중
		WELL_DRILLING_ITEM = "지하 세계까지도 닿을 기계로다.", --드릴 아이템
		HOLE = "마치 망자의 울음 같은 소리로다.", --우물 구멍
		WELL = "목마른 자가 우물을 파는 법.", --우물
		BOTTLE_POUCH_SMALL = "",
		BOTTLE_POUCH_BIG = "",
		THERMOS_BOTTLE_SMALL = "",
		THERMOS_BOTTLE_BIG = "",
		WINE_CELLAR_PART = "",
		WINE_CELLAR = "",

		WX78MODULE_NONEDRUNK = "이 물건이 우리의 철갑 전사에게 힘을 보태리라.", -- 78전용 묘듈
		PURIFICATION_TABLETS = "",

		-- 물 모드 식물

		TEA_TREE = "향기로운 관목이로다.",--차나무
		DUG_TEA_TREE = "대지의 여신께 돌려보내야 마땅하리라.", --땅에서 파낸 차나무
		TEA_SEED = "붉은 면포 속에 어린 나무가 들어있군.", -- 차나무 열매
		TEA_SEED_COOKED = "어린 나무가 요리되어 버렸구나.", --구운 차나무 열매
		TEA_SEED_SAPLING = "굳세어라, 어린 나무야!", --차나무 새싹
		TEALEAVES = "그저 좋은 향이 나는 이파리일 뿐.", --찻잎
		TEALEAVES_DRIED = "찻잎 한 줌이로군.", --말린 찻잎

		CAFFEINBERRY = "마니의 축복을 받은 식물이로다.", --커피 덤불
		DUG_CAFFEINBERRY = "나와 함께 가자꾸나.", --파낸 커피덤불
		CAFFEINBERRY_BEAN = "검게 볶아야 하리라.", --생 커피콩
		CAFFEINBERRY_BEAN_COOKED = "기운이 솟는 향이로군.", --구운 커피콩

		RUINCACAO_TREE = "암흑의 시대에서 온 나무로다.", --카카오 나무
		DUG_RUINCACAO_TREE = "땅의 여신께 되돌아 갔으면 좋겠구나.", --파낸 카카오 나무
		RUINCACAO_SEED = "공포를 이겨내고 싹을 틔우어라.", --카카오 새싹 아이템
		RUINCACAO_SEED_SAPLING = "두려움을 떨쳐내고 꽃을 피우어라!", -- 카카오 새싹 심은거
		RUINCACAO = "신들의 축복을 받은 열매로다.", --부수기 전 카카오 열매
		RUINCACAO_BEAN = "기름지지만 향기롭군.", --부순 후 카카오 콩  
		RUINCACAO_BEAN_COOKED = "이것이 고대의 향기인가.", --구운 카카오 콩

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

		ADDITIVE_SEED = "연회주에 향기로움을 더하세.", -- 리큐르에 제조에 첨가 할 씨허브(아니스,쥬니퍼베리,팔각 모티브)첨가제 
		ADDITIVE_PETALS = "프레야의 선물을 담았군.", -- 리큐르에 제조에 첨가 할 허브,녹차,꽃잎 첨가제
		ADDITIVE_NUT = "어린 나무들이 모여있구나.", -- 리큐르에 제조에 첨가 할 버치넛,코코넛,커피콩,카카오콩 첨가제
		ADDITIVE_DAIRY = "술에 젖을 넣는단 말인가?", -- 리큐르에 제조에 첨가할 유제품 첨가제

		-- 음료

		WATER_CLEAN = "순수한 물이로군.", --깨끗한 물
		WATER_DIRTY = "길들여지지 않은 야생의 물이로다.", --더러운 물
		WATER_SALTY = "뇨르드 그 자체로다.", --바닷물

		GOOPYDRINK = "축축한 음식물 찌꺼기로군.", --실패한 음료(웻 굽 개념)
		
		-- 주전자 음료

		FRUITJUICE = "입술만은 조금 적시도록 하지.", --잡 과일쥬스
		BERRIES_JUICE = "붉은 과일로 향을 냈군.", -- 베리 쥬스
		POMEGRANATE_JUICE = "과육의 피라 생각해야겠군.", -- 석류 쥬스
		BANANA_JUICE = "이것 역시 원숭이의 음료로군.", -- 바나나 쥬스
		FIG_JUICE = "끈적이는 과육이 불쾌하군.", -- 무화과 쥬스
		DRAGONJUICE = "하얀 과육으로 가득하군.", --용과 쥬스
		GLOWBERRYJUICE = "역겨운 비육류의 즙이로다.", -- 발광베리 쥬스
		WATERMELON_JUICE = "으깨진 비육류의 피로다.", --수박 쥬스

		VEGGIE_TEA = "정녕 이걸 마시라는 말인가!", --녹즙
		CARROT_TEA = "전사가 어찌 토끼밥 따위를 먹는단 말인가!", --당근차
		CACTUS_TEA = "칼날 달린 식물을 녹여내었군.", --선인차
		TOMATO_JUICE = "비육류의 피를 마시려니 치욕스럽군.", --토마토 쥬스
		LUMPY_TEA = "난쟁이들이 마시는 음료 같군.", --뿌리차,
		SEAWEED_SHAKE = "흉물스럽기 그지없도다!", --해초 쉐이크
		
		GREENTEA = "그저 이파리를 우린 물일 뿐.", --생잎 녹차
		BLACKTEA = "잠깐의 휴식으로서는... 나쁘지 않군.", --홍차
		BLACKTEA_ICED = "이가 시리는군.", -- 홍차 아이스티
		FUER = "약으로는 쓸만하겠군.", --보이차,이파리차,고사리차
		MIXFLOWER = "프레이의 축복을 담았구나.", --잡 꽃잎 차
		HIBISCUSTEA = "꽃이 피를 흘리는군.", --히비스커스 차
		CACTUSFLOWER_TEA = "아름다움만은 훌륭하군.", --선인꽃차
		LOTUSTEA = "물꽃 우린 물이 아닌 물고기 수프를 먹었으면.", --연꽃차
		SUSHIBISCUS = "이 불경스러운 음료는 대체 뭐지?", -- 자살차
		MOON_BLOSSOM_TEA = "마니의 축복이 가득하군.", --달꽃차

		CAFFEINBERRY_JUICE = "심장이 고동치게 하는군.", -- 블랙 커피
        TOFFEE_LATTE = "마치 신이 내린 달콤함 같군.", --토피넛 라떼
		RUINCHA_LATTE = "마음의 눈이 트이는 듯한 향이로군.", --모카 라떼(커피+초코)
		
		HOTRUINCOLATE = "영혼을 데워주는구나.", --핫초코
		RUINCOLATE_SMOOTHIE = "서리 거인들의 음료인가?", --초코 스무디(차가움)
		RUINXOCOLATL = "난폭한 고대 전사들의 음료로다.", --쇼콜라틀(매캐함)
		TEA_RUINCOLATE_LATTE = "내 영혼을 깨워주는군.", -- 말차 초코 라떼

		MULLED = "지친 심신에 온기를 불어넣는군.", --뱅쇼
		BUTTERBEER = "마법사들의 용맹의 근원이로다.", --해리포터 시리즈의 버터비어

		APPLEPINE_JUICE = "질긴 비늘을 찢고 과육을 갈아냈군.",
		APPLEPINE_SMOOTHIE = "",
		APPLEPINE_CAPPUCCINO = "",

		CITROYUZU_JUICE = "시큼하기만 하군.",
		CITROYUZU_TEA = "",
		EARLGREY_TEA = "",

		-- 콜라보 주전자 음료

		COCONUT_JUICE = "말랑한 과육으로 가득하군.", --난파선 코코넛 쥬스
		RAINBOW_SHAKE = "프레이가 내린 아름다움을 담아.", --난파선 무지개 해파리 쉐이크
		QUARTZ_SHAKE = "내 기꺼이 마시리라!", --난파선 광대 물고기 쉐이크
		NETTLE_TEA = "",
		FRASH_BRAMBLE_TEA = "",
		TUBER_BLOOM_TEA = "",
		CHERRY_ROSEBERRIES_TEA = "이런 추악한 열매를 담은 음료를 마셔야 하는가?", --체리숲 로즈힙 차
		CHERRY_HONEY_TEA = "참 고급진 꿀물이로군.", --체리숲 벚꽃꿀 차
		SWEET_RICE_DRINK = "달콤한 물만을 취하리라.", -- 비타협 식혜
		STRAWBERRY_SMOOTHIE = "차갑고 붉은 과일 곤죽이로군.", -- 모어 푸드 팩 딸기 스무디
		STRAWBERRY_MILK_SMOOTHIE = "전사에게 걸맞지 못한 음료로다.", -- 모어 푸드 팩 딸기 스무디 라떼

		--양조기 음료

		SPOILED_DRINK = "시간은 이 음식에게 현명함이 아니라 역겨움을 주었군.", --썩은 음료

		-- 양조소다
	
		SODA = "광천수로군.", -- 탄산수
		FRUITSODA = "과일 펀치로군.", -- 과일소다
		LIMONSODA = "전사에게 걸맞는 음료는 아니로다.", -- 레몬 라임소다(과일소다 상위 호환)
		COLA = "검은 유혹과도 같구나.", -- 콜라
		COLAQUANTUM = "내 심장을 뛰게 하는군!", --콜라 퀀텀
		LUMPY_BEER = "흙냄새 나는 비육류로 만든 음료가 상쾌하기도 하군.", --루트비어(술이 아님)
		APPLEPINESODA = "솔방울이라 하든 사과라 하든 무슨 상관이랴, 어느 쪽이든 불경한 것을.", -- 탄산 파인애플(오란씨)
		CITROYUZUSODA = "시큼한 과일즙이 들어간 광천수로다.", -- 탄산 오랜지(환타)
		DAWN_FOG = "",
		MOON_CAP_DRINK = "",		

		-- 양조주

		CORN_BEER = "이것을 어찌 맥주라 부를 수 있단 말인가?", -- 콘 맥주
		MADHU = "시예의 봉밀주로다!", --벌꿀주
		WINE = "피를 떠올리게 하는군.", --와인 (그냥 베리 양조)
		NOBLEWINE = "참으로 고귀한 와인이로다!", --노블 와인(구운 베리 양조)
		SPARKLINGWINE = "언젠가 크게 축배를 들 날을 위해 아껴두세!", --스파클링 와인
		GLOWBERRYWINE = "크바시르의 피로 담근 술이로군.", --글로우 베리 와인
		KUMIS = "일각수 맙소사, 젖으로 술을 담근단 말인가?", -- 크므즈,산양유주
		LUMPY_WINE = "내게는 좀 약하군.", --서주(감자 고구마등 뿌리 술)
		PULQUE = "신성과 죄악이 공존하는 술이라 하던가.", --풀케(선인주)
		RUINCACAO_WINE = "고대의 향을 담은 술이로다.", -- 카카오 와인
		MIDNIGHT_STORM = "",
		APPLEPINE_CIDER = "",
		MENTHA_SPICATA_WINE = "",

		-- 콜라보 소다

		CHERRY_DOCTOR_COLA = "검붉은 혼돈이로다.", --체리숲 닥터 페퍼(닥터 체리)
		STRAWBERRYSODA = "붉은 열매로 만든 광천수로군.", -- 탄산 딸기(웰치스 딸기)

		--콜라보 양조주

		AUROBOW = "아름답게도 빛나는군!", -- 난파선 오로보우,무지개 해파리주
		COCONUT_WINE = "묵직한 향기가 은은하게 퍼지는군.", -- 난파선 코코넛 와인
		NETTLE_WINE = "",
		CHERRY_BLOOM_MADHU = "입과 눈을 동시에 즐겁게 하는군.", -- 체리숲 벚꽃꿀주
		GIANT_BLUEBERRY_WINE = "강력한 술이로다.", -- 비타협 붐!베리 사파이어(불 붙히면 폭발함)
		RICE_WINE = "비육류로 만든 우유로다.", -- 비타협 막걸리
		WHEAT_BEER = "이 정도면 충분히 맥주라 불러 마땅하리라.", -- 힙 오브 푸드 밀맥주
		PALE_BEER = "참으로 독특한 맥주로다.", -- 레기온 페일에일 (몬스트라 열매를 쓴 청록색 맥주)

		--증류주

		DISINFECTANT = "상처를 태워 낫게 하리라!", -- 소독약
		CORN_WHISKEY = "달고 향기롭구나.", -- 콘 위스키
		LUMPY_VODKA = "생명의 물이라 불러 마땅하리로다!", -- 보드카
		TEQUILA = "거칠고 야성적인 술이로군!", -- 데킬라
		MADHU_RUM = "바이킹의 술은 아니로군.", -- 럼주
		BERRY_BRANDY = "호사스런 귀족들의 술이로다.", -- 베리 브랜디
		AREUHI = "생각보다 나쁘지 않군.", -- 크므즈 증류주 아르히
		APPLEPINE_BRANDY = "",
		VOID_BRANDY = "",
		VOID_GIN  = "",
		CITROYUZU_CURACAO = "",
		MENTHA_SPICATA_CURACAO = "",

		--왈리 전용 증류주

		BERRY_GIN = "적게 마시면 약주요, 많이 마시면 망주라.", --진
		GLOWBERRY_GIN = "발데르의 축복을 받은 술이로군.", --글로우 베리 진
		ABSINTHE = "청량한 향이 마음에 드는군!", -- 압생트
		TEA_LUMPY_VODKA = "술에서 이파리 향이 나는군.", -- 녹차 리큐르
		PETALS_BERRY_BRANDY = "무대 위로 흩날리던 장미꽃이 눈앞에 선하군.", -- 장미향 브랜디
		KAHLUA = "전사의 술이라기에는 많이 달군.", -- 커피 리큐르 깔루아
		NUT_CORN_WHISKEY = "묵직한 향이 느껴지는군.", -- 너트 위스키
        RUINCACAO_CREAM_LIQUEUR = "어린 아이들을 위한 술인가?", --베일리스 카카오 크림 리큐르
        RUMCHATA = "술과 젖을 섞는 건 바람직하지 못한 일이리라.", -- 럼차타(럼에 오우차타 라는 유제품 섞은)

		--콜라보 증류주

		MOONWAY = "빛의 정수로다!", -- 무지개 해파리주 증류주
		NETTLE_LIQUEUR = "",
		ARRACK = "야자나무의 풍채가 느껴지는 것 같군.", -- 아락 인도네시아 버전 코코넛 와인 증류주
		CHERRY_BLOOM_RUM = "화려함을 담아냈도다.", -- 체리 꿀주 증류주 벛꽃잎 떠다니는 술
		RICE_SPIRITS = "맑고 깨끗한 맛이로다!", --청주
		WHEAT_WHISKEY = "달고 향기롭구나.", -- 밀 위스키
		PALE_WHISKEY = "이 거칠고 씁쓸한 향기.", -- 페일 몰트 위스키

		--왈리 전용 콜라보 증류주

		NUT_COCONUT_BRANDY = "모든 바이킹이 해적인 것은 아니다.", -- 코코넛 브랜디 (캐러비안 럼을 만들수 없어서 카리브 브랜디 라는 이름으로 대체)
	    GIANT_BLUEBERRY_GIN = "압도적인 힘으로!", -- 붐 베리 사파이어 (당근 폭발함)

		--냄비 요리

        DARK_RUINCOLATE = "이 달콤하고도 쌉싸름한 맛.", --다크 초콜릿.
        WHITE_RUINCOLATE = "기분 좋은 달콤함이로군.", --화이트 초콜릿
        RUINCOLATE = "신들께 바쳐야 마땅할 음식이로다!", -- 그냥 초콜릿
        RUIN_SCHOKAKOLA = "전장의 흥분을 갈망하게 하는군.", -- 쇼카콜라
        APPLEPINE_PIE = "",
        APPLEPINE_FRIED_RICE = "",
        CITROYUZU_BBQ = "",
        
		BUCKET_STEEL_EMPTY = 
		{
			EMPTY = "양철동이로군.", --빈 양철 양동이
			FULL = "맑은 물이 차 있구나.", -- 깨끗한 빗물이 참
			FULL_ICE = "참으로 맑은 얼음이로고.", -- 빗물이 얼어버림
			DIRTY = "불결하기 그지없군.", --빗물이 더러워짐
			DIRTY_ICE = "불결함의 결정체로다.", --더러운 빗물이 얼어버림
		},

		BUCKET_WOODIE_EMPTY = 
		{
			EMPTY = "나무토막을 솜씨좋게 속을 비워냈군.", --우디의 빈 나무 양동이
			FULL = "맑은 물이 차 있구나.", -- 깨끗한 빗물이 참
			FULL_ICE = "참으로 맑은 얼음이로고.", -- 빗물이 얼어버림
			DIRTY = "불결하기 그지없군.", --빗물이 더러워짐
			DIRTY_ICE = "불결함의 결정체로다.", --더러운 빗물이 얼어버림
		},

		BUCKET_DRIFTWOOD_EMPTY = 
		{
			EMPTY = "바다를 이 안에 담으리라.", -- 유목양동이
			FULL = "맑은 물이 차 있구나.", -- 깨끗한 빗물이 참
			FULL_ICE = "참으로 맑은 얼음이로고.", -- 빗물이 얼어버림
			DIRTY = "불결하기 그지없군.", --빗물이 더러워짐
			DIRTY_ICE = "불결함의 결정체로다.", --더러운 빗물이 얼어버림
		},

		BUCKET_EMPTY = 
		{
			EMPTY = "빈 나무동이로다.", -- 빈 나무 양동이
			FULL = "맑은 물이 차 있구나.", -- 깨끗한 빗물이 참
			FULL_ICE = "참으로 맑은 얼음이로고.", -- 빗물이 얼어버림
			DIRTY = "불결하기 그지없군.", --빗물이 더러워짐
			DIRTY_ICE = "불결함의 결정체로다.", --더러운 빗물이 얼어버림
		},

		DESALINATOR =
		{
			EMPTY = "텅 비어 있구나.", --제염기에 물이 없음
			PURIFY_LONG = "잠시 다른 일을 하는 것이 좋겠군.", -- 정수 끝나기까지 많이 남음
			PURIFY_SHORT = "꽤나 싱거워졌군.", -- 정수가 곧 끝남
			HASWATER = "깨끗한 물을 가득 머금었군.", --제염기에 깨끗한 물이 있음
			BURNT = "불꽃에 삼켜져 버렸구나.",   --제염기가 타버림
			HASSALT = "소금기를 덜어내야 하리라.", --제염기에 소금이 남아 있음
		},

		BARREL =
		{
			GENERIC = "깨끗한 물을 담을 통이로다.", -- 물통 조사 대사
			BURNT = "로기의 손길에서 벗어나진 못했군.", -- 물통이 타버림
		},

		BREWERY =
		{
			EMPTY = "비육류를 길들여 향기로운 술로 만드노라.", --양조기 조사 대사
			BURNT = "말라버린 술을 두고 울어서 무슨 소용이랴.", --양조기 타버림
			FERMENTING_LONG = "벌써부터 연회가 기대되는군!", --양조 끝나기 까지 많이 남음
			FERMENTING_SHORT = "연회를 준비해야겠구나!", --양조가 곧 끝남
			DONE = "자, 축배를 드세, 전우들이여!", --양조기에 음료가 들어있음
		},

		CAMPKETTLE_ITEM = "간이 주전자로다.", --휴대 주전자 아이템 조사 대사
		CAMPKETTLE =
		{
			GENERIC = "솥 안에 가뭄이 들었구나.", -- 화덕에 건 휴대 주전자 안에 물이 없음
			BOILING_LONG = "쳐다보는 솥은 끓지 않는 법.", -- 물 끓이기 시작함
			BOILING_SHORT = "끓어오르는군!", -- 물 거의 다 끓음
			DONE = "이제 마셔도 되겠군.", --깨끗한 물이 들음
			STOP = "먼저 불을 지펴야 하겠지.", --화덕에 불이 없어서 더러운물이 끓지 않는 상태
		},

		CAMPDESALINATOR_ITEM = "바닷물을 샘물로 만드는 장치로다.", --휴대 제염기 아이템 조사 대사
		CAMPDESALINATOR = 
		{
			GENERIC = "솥 안에 가뭄이 들었구나.", --물 없음
			BOILING_LONG = "쳐다보는 솥은 끓지 않는 법.", --물 끓이기 시작
			BOILING_SHORT = "솥 안에 비가 내리고 있구나!", --거의 다 끓음 
			DONE = "이제 마셔도 되겠군.", -- 깨끗한 물이 들음
			STOP = "먼저 불을 지펴야 하겠지.", -- 화덕에 불이 없어서 소금물이 정수 되지 않는 상태
		},

		TEA_POT =
		{
			EMPTY = "물 없는 주전자가 무슨 소용인가?", --빈 주전자 조사대사
			BURNT = "불길에 삼켜져 버렸군.", --주전자가 불탐
			BOILING_LONG = "기다리는 동안 다른 것을 하는 것이 좋겠군.", -- 음료를 만들기 시작한지 얼마 안됨
			BOILING_SHORT = "오래 걸리지 않을 것이야!", --음료 조리가 거의 끝나감
			DONE = "드디어 완성되었군!", --음료가 완성됨
			PURIFY_LONG = "쳐다보는 솥은 끓지 않는 법.", -- 더러운 물을 끓이기 시작한지 얼마 안됨
			PURIFY_SHORT = "끓어오르는군!", --더러운물을 거의 다 끓여감
			HASWATER = "샘물로 가득하군.", -- 깨끗한 물이 차 있는 상태
			MELT_LONG = "차가운 얼음을 받아들여라.", -- 얼음물을 녹이기 시작한지 얼마 안됨
			MELT_SHORT = "그리고 얼어붙은 심장을 녹여라!", -- 얼음물을 거의 녹여감
		},

		PORTABLE_TEA_POT_ITEM =
		{
			GENERIC = "나의 전우들은 전장에서 다과를 즐기려 하는군.", -- 휴대용 주전자(아이템) 조사 대사
			EMPTY = "물 없는 주전자는 무용지물일 터.", -- 설치한 빈 휴대용 주전자 조사 대사
			BOILING_LONG = "잠시 휴식을 취하도록 하세.", -- 음료를 만들기 시작한지 얼마 안됨
			BOILING_SHORT = "차를 거의 다 끓여냈군!", --음료 조리가 거의 끝나감
			DONE = "얼른 마시고 다시 전장으로 향하세나.", --음료가 완성됨
			PURIFY_LONG = "쳐다보는 솥은 끓지 않는 법.", -- 더러운 물을 끓이기 시작한지 얼마 안됨
			PURIFY_SHORT = "끓어오르는군!", --더러운물을 거의 다 끓여감
			HASWATER = "전사에게 다과는 어울리지 않거늘!", -- 깨끗한 물이 차 있는 상태
			MELT_LONG = "차가운 얼음을 받아들여라.", -- 얼음물을 녹이기 시작한지 얼마 안됨
			MELT_SHORT = "그리고 얼어붙은 심장을 녹여라!", -- 얼음물을 거의 녹여감
		},

		KETTLE =
		{
			EMPTY = "물 없는 주전자가 무슨 소용인가?", --빈 주전자 조사대사
			BURNT = "불길에 삼켜져 버렸군.", --주전자가 불탐
			DONE = "드디어 완성되었군!", --음료가 완성됨
			PURIFY_LONG = "쳐다보는 솥은 끓지 않는 법.", -- 더러운 물을 끓이기 시작한지 얼마 안됨
			PURIFY_SHORT = "끓어오르는군!", --더러운물을 거의 다 끓여감
			HASWATER = "샘물로 가득하군.", -- 깨끗한 물이 차 있는 상태
			MELT_LONG = "차가운 얼음을 받아들여라.", -- 얼음물을 녹이기 시작한지 얼마 안됨
			MELT_SHORT = "그리고 얼어붙은 심장을 녹여라!", -- 얼음물을 거의 녹여감
		},

		PORTABLEKETTLE_ITEM =
		{
			GENERIC = "나의 전우들은 전장에서 다과를 즐기려 하는군.", -- 휴대용 주전자(아이템) 조사 대사
			EMPTY = "물 없는 주전자는 무용지물일 터.", -- 설치한 빈 휴대용 주전자 조사 대사
			DONE = "얼른 마시고 다시 전장으로 향하세나.", --음료가 완성됨
			PURIFY_LONG = "쳐다보는 솥은 끓지 않는 법.", -- 더러운 물을 끓이기 시작한지 얼마 안됨
			PURIFY_SHORT = "끓어오르는군!", --더러운물을 거의 다 끓여감
			HASWATER = "전사에게 다과는 어울리지 않거늘!", -- 깨끗한 물이 차 있는 상태
			MELT_LONG = "차가운 얼음을 받아들여라.", -- 얼음물을 녹이기 시작한지 얼마 안됨
			MELT_SHORT = "그리고 얼어붙은 심장을 녹여라!", -- 얼음물을 거의 녹여감
		},
		
		DISTILLERS =
		{   
		    EMPTY = "가히 히미르의 가마솥이라 할 수 있겠구나!", --증류기 조사 대사
			DISTILLTING_LONG = "잠시 대련을 하기에 충분한 시간이겠지.", --증류가 끝나기 까지 많이 남음
			DISTILLING_SHORT = "단시에 끝나리라!", --증류가 곧 끝남
			DONE = "자, 축배를 드세, 전우들이여!", --증류기에 음료가 들어있음
		},

		WELL_WATERPUMP = {
			HIGH_PRESSURE = "그 힘이 거인과 맞먹는구나.", -- 압력 최대
			MIDDLE_PRESSURE = "기계가 열심히 일하고 있노라.", -- 압력이 중간
			LOW_PRESSURE = "기계가 기력을 잃고 있구나.", -- 압력이 거의 없을때
			RECHARG_PRESSURE = "기계가 쉬고 있군.", -- 압력이 아예 없을때(여기까지 쓰면 압력이 최대가 될때까지 못씀.)
		},
		
		WELL_SPRINKLER =
		{ 
			LOWFUEL = "연료가 거의 다 떨어졌군.", -- 연료가 거의 없는 상태에서의 조사 대사
			ON = "땅 속으로부터 내리는 비로다.", -- 작동중임
			OFF = "비를 뿌릴 때를 기다리는 것이느냐?", --작동을 멈춘상태에서의 조사 대사
		},	
	},
}