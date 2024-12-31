return {
	ACTIONFAIL =
	{
		GIVE =
		{
			WELL_NOTEMPTY = "물동이부터 떼내야겠군.", -- 우물에 말라 빈 양동이 달려있는데 양동이 달려 함
			WELL_BUSY = "아주 우물을 들고 마시겠네.", -- 우물에 물 든 양동이 달려있는데 달려 함
		}
	},
	
	ANNOUNCE_DRUNK = "으윽, 좀... 취한 것 같군...", -- 취함

	ANNOUNCE_DRUNK_MUMBLE = 
	{
		"으음...",
		"과음해 버렸군.",
		"이거... 히끅...! 이거야 원.",
		"으윽... 나도 참 가관이군!",
		"이래서야 맵시가 안 살잖아.",
		"내가 정말 이런 신세라니...",
		"아, 찰리...",
		"많은 걸 보았고, 많은 걸 만들었었지...",
		"감사합니다, 여러분... 다들 정말 친절하시군요...",
	},

	ANNOUNCE_DRUNK_END = "크흠. 이제 좀 낫군.", --술에서 좀 깸 (그로기)
	ANNOUNCE_DRUNK_IMMUNITY = "only_used_by_wolfgang_and_wathgrithr", --임시. 위그 전용,
	ANNOUNCE_NOTCHARGE = "쓸모없는 녀석.", --번개염소가 충전이 안되서 양동이로 젖을 짤수 없음
	ANNOUNCE_NOTHIRSTSLEEP = "너무 목말라. 잠을 잘 수가 없어.", -- 목이 마른데 밤에 잘려고 시도
	ANNOUNCE_NOTHIRSTSIESTA = "목이 마른데 쉴 수 있을 리가 없잖아.", -- 목이 마른데 낮에 잘려고 시도
	ANNOUNCE_SLEEP_END = "악몽이라도 꾼 것 같군.", --자고 일어나서 술에서 완전히 깸
	ANNOUNCE_THIRST = "목이 마르군.", --너무 목말라!

    ANNOUNCE_CAFFINE_BUFF_START = "이거 흥분되는군!" , -- 카페인 버프 시작
    ANNOUNCE_CAFFINE_BUFF_STOP = "쇼는 끝났어." ,  -- 카페인 버프 끝
    
    ANNOUNCE_SATIETY_BUFF_START = "" , -- 포만감 버프 시작
    ANNOUNCE_SATIETY_BUFF_STOP = "" ,  -- 포만감 버프 끝
    
    ANNOUNCE_CURE_WATERBORNE = "속이 좀 잠잠해지는군." ,  -- 수인성 질병을 아이템으로 치료했을때의 대사

	ANNOUNCE_DCAPACITY_CRITICAL = "적당히 마시고 여기서 끝내는 게 좋겠지.", --취하기 직전
	ANNOUNCE_DCAPACITY_HALF = "술이 들어가니 기분은 좋군.", -- 취기가 돌기 시작

	DESCRIBE =
	{
		BOILBOOK_BASIC = "차 내리는 게 설마 요리보다도 어렵겠어?",
		BOILBOOK_ADVANCED = "차 내리는 게 설마 요리보다도 어렵겠어?",

		WATER_CLEAN_ICE = "이가 다 시리는군.",--깨끗한 얼음물
		WATER_DIRTY_ICE = "얼어붙은 쓰레기야.", --더러운 얼음물

		SPICE_CAFFEINPEPPER = "어디에 뿌리든 제 값은 하지.", --후추 향신료
		SPICE_RUINCOLATE_SPREAD = "",

		WELL_KIT = "지금 이걸 나 보고 옮기라는 건가?", --우물 키트
		WELL_SPRINKLER_KIT = "기계와 마법의 혼종이로군.", --스프링클러 키트
		WELL_WATERPUMP_KIT = "차라리 나도 공학자가 돼 볼걸 그랬나?", --스팀 물펌프 키트
		WELL_BURYING_KIT = "이럴 거면 대체 왜 그 난리를 부린 건지.", -- 구멍 매설 키트
		WELL_DRILLING = "알아서 작동하는 건 편리하군.", --드릴로 구멍 뚫는 중
		WELL_DRILLING_ITEM = "꽤 험하게 생겼군.", --드릴 아이템
		HOLE = "잘못 빠지면 뼈도 못 건지겠군.", --우물 구멍
		WELL = "우물 옆에서 목말라 죽겠군.", --우물
		BOTTLE_POUCH = "",
		WINE_CELLAR_PART = "",
		WINE_CELLAR = "",

		WX78MODULE_NONEDRUNK = "저 로봇 녀석 자제 좀 해야 할 텐데.", -- 78전용 묘듈

		-- 물 모드 식물

		TEA_TREE = "이걸 여기서 보다니 뭔가 반갑군.",--차나무
		DUG_TEA_TREE = "내가 정원사라도 되는 줄 아는가?", --땅에서 파낸 차나무
		TEA_SEED = "어디 나무 키울 줄 아는 놈이 쓸모를 알겠지.", -- 차나무 열매
		TEA_SEED_COOKED = "내가 이런 거나 먹어야 하는 신세라니.", --구운 차나무 열매
		TEA_SEED_SAPLING = "허, 땅으로 가야 했던 모양이군.", --차나무 새싹
		TEALEAVES = "한 번 말려야 쓸만할 걸세.", --찻잎
		TEALEAVES_DRIED = "차 한 잔이 그리워지는군.", --말린 찻잎

		CAFFEINBERRY = "달의 영향을 받은 커피덤불이군.", --커피 덤불
		DUG_CAFFEINBERRY = "다시 심을 가치가 있어.", --파낸 커피덤불
		CAFFEINBERRY_BEAN = "내가 아는 커피콩과는 다르게 생겼군.", --생 커피콩
		CAFFEINBERRY_BEAN_COOKED = "날것보다는 낫지만, 좀 더 가공해야 좋지 않겠나?", --구운 커피콩

		RUINCACAO_TREE = "흑마법의 영향을 받은 게 분명하군.", --카카오 나무
		DUG_RUINCACAO_TREE = "어디 나무 키울 줄 아는 놈이 쓸모를 알겠지.", --파낸 카카오 나무
		RUINCACAO_SEED = "꽃이 폈군.", --카카오 새싹 아이템
		RUINCACAO_SEED_SAPLING = "아무래도 저절로 심어지진 않겠지.", -- 카카오 새싹 심은거
		RUINCACAO = "저걸 먹겠다고 주먹질을 하진 않을걸세.", --부수기 전 카카오 열매
		RUINCACAO_BEAN = "'콩'이라고 보이지는 않는군.", --부순 후 카카오 콩  
		RUINCACAO_BEAN_COOKED = "이것만으로는 많이 부족해 보이는군.", --구운 카카오 콩

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

		ADDITIVE_SEED = "진이라도 만들려나 보지?", -- 리큐르에 제조에 첨가 할 씨허브(아니스,쥬니퍼베리,팔각 모티브)첨가제 
		ADDITIVE_PETALS = "술에 이런 게 굳이 필요한가?", -- 리큐르에 제조에 첨가 할 허브,녹차,꽃잎 첨가제
		ADDITIVE_NUT = "이건 대체 누가 생각해낸 거지?", -- 리큐르에 제조에 첨가 할 버치넛,코코넛,커피콩,카카오콩 첨가제
		ADDITIVE_DAIRY = "술에 크림을 넣다니, 근본 없기는.", -- 리큐르에 제조에 첨가할 유제품 첨가제

		-- 음료

		WATER_CLEAN = "깨끗한 물 한 모금도 귀한 세상이로군.", --깨끗한 물
		WATER_DIRTY = "이봐 친구, 내 물 색이 좋지 않군.", --더러운 물
		WATER_SALTY = "마시면 안 되겠지.", --바닷물

		GOOPYDRINK = "정말 교양없군.", --실패한 음료(웻 굽 개념)
		
		-- 주전자 음료

		FRUITJUICE = "온갖 과일을 뒤섞어 놨군.", --잡 과일쥬스
		BERRIES_JUICE = "뭐, 나쁘지는 않군.", -- 베리 쥬스
		POMEGRANATE_JUICE = "그나마 구색은 갖췄군.", -- 석류 쥬스
		BANANA_JUICE = "더 좋은 방법은 없었나?", -- 바나나 쥬스
		FIG_JUICE = "많이 달군.", -- 무화과 쥬스
		DRAGONJUICE = "뭐야? 그냥 희뿌연 물이잖아.", --용과 쥬스
		GLOWBERRYJUICE = "나름 영리한 발상이군.", -- 발광베리 쥬스
		WATERMELON_JUICE = "수박 향 정도만 느낄 정도로 물이 많군.", --수박 쥬스

		VEGGIE_TEA = "건강 챙길 때가 되긴 했지.", --녹즙
		CARROT_TEA = "어쩔 수 없지.", --당근차
		CACTUS_TEA = "내 손 안에 작은 오아시스가 있군.", --선인차
		TOMATO_JUICE = "목넘김이 부드럽군.", --토마토 쥬스
		LUMPY_TEA = "이렇게 하니 나름 품위가 있군.", --뿌리차,
		SEAWEED_SHAKE = "이걸 대체 누구 먹으라고 만든 겐가?", --해초 쉐이크
		
		GREENTEA = "잎 비린내가 나는군.", --생잎 녹차
		BLACKTEA = "차 한 잔이 이렇게 반가울 줄이야.", --홍차
		BLACKTEA_ICED = "상쾌하군.", -- 홍차 아이스티
		FUER = "이거 참 이국적이군.", --보이차,이파리차,고사리차
		MIXFLOWER = "은은하게 달짝지근한 뒷맛이 있군.", --잡 꽃잎 차
		HIBISCUSTEA = "참 아름답기 짝이 없군.", --히비스커스 차
		CACTUSFLOWER_TEA = "역시 실망시키지 않는군.", --선인꽃차
		LOTUSTEA = "혹시 내가 생각하는 그건가?", --연꽃차
		SUSHIBISCUS = "어둠의 정수로군.", -- 자살차
		MOON_BLOSSOM_TEA = "날 변이시키진 않겠지?", --달꽃차

		CAFFEINBERRY_JUICE = "맛이 기대되는군.", -- 블랙 커피
        TOFFEE_LATTE = "어린 애도 아니고, 버터스카치를 넣은 커피라니...", --토피넛 라떼
		RUINCHA_LATTE = "진짜 모카커피가 뭔지는 알지도 못하겠지.", --모카 라떼(커피+초코)
		
		HOTRUINCOLATE = "내가 처음 왔을 때는 꿈도 못 꿨는데 말일세.", --핫초코
		RUINCOLATE_SMOOTHIE = "먹기에는 치아 건강이 걱정되는군.", --초코 스무디(차가움)
		RUINXOCOLATL = "영적인 감각이 느껴지는군.", --쇼콜라틀(매캐함)
		TEA_RUINCOLATE_LATTE = "차와 초콜릿을 한데에 몰아넣다니, 품위 없기는.", -- 말차 라떼

		MULLED = "날씨는 빌어먹게 춥더라도 여유를 좀 느낄 수 있지.", --뱅쇼
		BUTTERBEER = "목이 아플 때 이만한 게 없더군.", --해리포터 시리즈의 버터비어

		APPLEPINE_JUICE = "흥, 주스를 쓸데없이 경박하게 만들어 놓았군.",
		APPLEPINE_SMOOTHIE = "",
		APPLEPINE_CAPPUCCINO = "",

		CITROYUZU_JUICE = "예전에는 쳐다도 안 봤었는데 말이야.",
		CITROYUZU_TEA = "",
		EARLGREY_TEA = "",

		-- 콜라보 주전자 음료

		COCONUT_JUICE = "하와이에 온 것 같은 기분이군.", --난파선 코코넛 쥬스
		RAINBOW_SHAKE = "애들 불량식품 같군.", --난파선 무지개 해파리 쉐이크
		QUARTZ_SHAKE = "레몬이나 라임이라도 좀 있어야지.", --난파선 광대 물고기 쉐이크
		NETTLE_TEA = "",
		FRASH_BRAMBLE_TEA = "",
		TUBER_BLOOM_TEA = "",
		CHERRY_ROSEBERRIES_TEA = "그래... 비스킷은 없나?", --체리숲 로즈힙 차
		CHERRY_HONEY_TEA = "벚꽃 향이 심신의 안정을 주는군.", --체리숲 벚꽃꿀 차
		SWEET_RICE_DRINK = "흐물흐물하군.", -- 비타협 식혜
		STRAWBERRY_SMOOTHIE = "죄다 갈아서 으깨놨군.", -- 모어 푸드 팩 딸기 스무디
		STRAWBERRY_MILK_SMOOTHIE = "내 취향에는 맞지 않는군.", -- 모어 푸드 팩 딸기 스무디 라떼

		--양조기 음료

		SPOILED_DRINK = "내가 썩혀버리기 전에는 음료였는데 말이지.", --썩은 음료

		-- 양조소다
	
		SODA = "정말 시도할 생각조차 못했던 일이군.", -- 탄산수 (대충 먼지로 탄산 만들 생각 따위 못했다는 예기)
		FRUITSODA = "참신하기도 하지, 과일을 대충 섞어넣다니.", -- 과일소다
		LIMONSODA = "이가 썩을 것 같군.", -- 레몬 라임소다(과일소다 상위 호환)
		COLA = "개인적으로 빨대가 있었으면 좋겠네.", -- 콜라
		COLAQUANTUM = "의심쩍지만 훌룡해.", --콜라 퀀텀
		LUMPY_BEER = "음? 이 맛은...", --루트비어(술이 아님)
		RUINCACAO_WINE = "이것도 와인이라고 할 수가 있는 겐가?", -- 카카오 와인 
		APPLEPINESODA = "꽤 문명적인 음료로군.", -- 탄산 파인애플(오란씨)
		CITROYUZUSODA = "이거 상상이 과했던 거 아닌가?", -- 탄산 오랜지(환타) "A bit too much fantasy, isn't it?"
		DAWN_FOG = "",
		MOON_CAP_DRINK = "",

		-- 양조주

		CORN_BEER = "밑술을 그냥 마시다니 품위 없기는.", -- 콘 맥주 (wash - 위스키를 만들기 전 밑술.)
		MADHU = "바이킹 전통 방식으로 만들진 않았겠지...", --벌꿀주
		WINE = "보르도 품종은 아니지만, 봐줄 만하군.", --와인 (그냥 베리 양조)
		NOBLEWINE = "삶이 꽤나 윤택해졌구만.", --노블 와인(구운 베리 양조)
		SPARKLINGWINE = "샴페인이 그립군.", --스파클링 와인
		GLOWBERRYWINE = "나가서 팔 수만 있다면 큰 돈을 벌겠군.", --글로우 베리 와인
		KUMIS = "야성적이로군.", -- 크므즈,산양유주
		LUMPY_WINE = "생각보다 깔끔하군.", --서주(감자 고구마등 뿌리 술)
		PULQUE = "내 입맛에는 맞지 않는군.", --풀케(선인주)
		MIDNIGHT_STROM = "",
		APPLEPINE_CIDER = "",
		MENTHA_SPICATA_WINE = "",

		-- 콜라보 소다

		CHERRY_DOCTOR_COLA = "진짜 의사가 이 자리에 없는 건 좀 아쉽군.", --체리숲 닥터 페퍼(닥터 체리)
		STRAWBERRYSODA = "탄산이 너무 강하군.", -- 탄산 딸기(웰치스 딸기) "The sparkling is too strong."

		--콜라보 양조주

		AUROBOW = "해괴망측한 발상이군.", -- 난파선 오로보우,무지개 해파리주
		COCONUT_WINE = "게살을 안주 삼아야겠군.", -- 난파선 코코넛 와인
		NETTLE_WINE = "",
		CHERRY_BLOOM_MADHU = "정장에 묻어도 적어도 세탁에 어려움을 겪진 않겠네.", -- 체리숲 벚꽃꿀주
		GIANT_BLUEBERRY_WINE = "교양인처럼 행동하자고.", -- 비타협 붐!베리 와인(불 붙히면 폭발함)
		RICE_WINE = "시큼하군.", -- 비타협 막걸리
		WHEAT_BEER = "홉도 안 넣었단 말인가?", -- 힙 오브 푸드 밀맥주
		PALE_BEER = "좋은 홉 대체재는 아니었던 것 같군.", -- 레기온 페일에일 (몬스트라 열매를 쓴 청록색 맥주)

		--증류주

		DISINFECTANT = "절단마술 해봤나? 이게 필요할 걸세.", -- 소독약
		CORN_WHISKEY = "아, 드디어.", -- 콘 위스키
		LUMPY_VODKA = "술보다는 소독약에 가까워 보이는군.", -- 보드카
		TEQUILA = "너무 촌티 나는 맛이군.", -- 데킬라
		MADHU_RUM = "천박하군.", -- 럼주
		BERRY_BRANDY = "내 품격에 딱 맞는군.", -- 베리 브랜디
		AREUHI = "이상한 향이 나는군.", -- 크므즈 증류주 아르히
		APPLEPINE_BRANDY = "",
		VOID = "",
		CITROYUZU_CURACAO = "",
		MENTHA_SPICATA_CURACAO = "",

		--왈리 전용 증류주

		BERRY_GIN = "이게 그렇게 천박한 술은 아니었는데 말이지.", --진
		GLOWBERRY_GIN = "마실 때는 쭉 들이키라고.", --글로우 베리 진
		ABSINTHE = "아, 내 인생처럼 복잡하고도 오묘한 이 향.", -- 압생트
		TEA_LUMPY_VODKA = "흠, 좀 애매하군.", -- 녹차 리큐르
		PETALS_BERRY_BRANDY = "화려함이 좀 과하군.", -- 장미향 브랜디
		KAHLUA = "그렇게 나쁘진 않군.", -- 커피 리큐르 깔루아
		NUT_CORN_WHISKEY = "짭짤한 고기 요리가 있으면 어울리겠어.", -- 너트 위스키
        RUINCACAO_CREAM_LIQUEUR = "이런 근본 없는 조합 하고는...", --베일리스 카카오 크림 리큐르
        RUMCHATA = "이건 대체 뭐하는 술이지?", -- 럼차타(럼에 오우차타 라는 유제품 섞은)

		--콜라보 증류주

		MOONWAY = "이걸 어떻게 만들었나?", -- 무지개 해파리주 증류주
		NETTLE_LIQUEUR = "",
		ARRACK = "그야말로 버릴 게 없는 나무로군.", -- 아락 인도네시아 버전 코코넛 와인 증류주
		CHERRY_BLOOM_RUM = "사치스럽기 그지없군.", -- 체리 꿀주 증류주 벛꽃잎 떠다
		RICE_SPIRITS = "꽤 깔끔하군.", --청주
		WHEAT_WHISKEY = "완벽해.", -- 밀 위스키
		PALE_WHISKEY = "정정하지, 썩 나쁘지 않군.", -- 페일 몰트 위스키

		--왈리 전용 콜라보 증류주

		NUT_COCONUT_BRANDY = "그래 말해 봐... 내 배가 어떻게 됐다고?", -- So tell me... What's become of my ship? - 캐러비안의 해적 바르보사의 대사
	    GIANT_BLUEBERRY_GIN = "파괴의 정수를 담았군.", -- 붐 베리 사파이어 (당근 폭발함)

		--냄비 요리

        DARK_RUINCOLATE = "요리사가 흑마술에도 관심이 있었나 보군.", --다크 초콜릿.
        WHITE_RUINCOLATE = "사양하겠네.", --화이트 초콜릿
        RUINCOLATE = "꼬마 손님들을 끌어들일 미끼로군.", -- 그냥 초콜릿
        RUIN_SCHOKAKOLA = "효율의 집약체로군.", -- 쇼카콜라
        APPLEPINE_PIE = "",
        APPLEPINE_FRIED_RICE = "",
        CITROYUZU_BBQ = "",

		BUCKET_STEEL_EMPTY = 
		{
			EMPTY = "빈 깡통이로군.", --빈 양철 양동이
			FULL = "빗물이나 받아먹는 신세라니.", -- 깨끗한 빗물이 참
			FULL_ICE = "내가 저걸 꺼내야 하는 건가?", -- 빗물이 얼어버림
			DIRTY = "추악해라.", --빗물이 더러워짐
			DIRTY_ICE = "처다보기도 싫군.", --더러운 빗물이 얼어버림
		},

		BUCKET_WOODIE_EMPTY = 
		{
			EMPTY = "본 내추럴 하군.", --우디의 빈 나무 양동이
			FULL = "빗물이나 받아먹는 신세라니.",  --깨끗한 빗물이 참
			FULL_ICE = "내가 저걸 꺼내야 하는 건가?", --빗물이 얼어버림
			DIRTY = "추악해라.", --빗물이 더러워짐
			DIRTY_ICE = "처다보기도 싫군.", --더러운 빗물 얼어버림
		},

		BUCKET_DRIFTWOOD_EMPTY = 
		{
			EMPTY = "이봐, 양동이를 너무 대충 만든거 아닌가?", -- 유목양동이
			FULL = "빗물이나 받아먹는 신세라니.", -- 깨끗한 빗물이 참
			FULL_ICE = "내가 저걸 꺼내야 하는 건가?", --빗물이 얼어버림
			DIRTY = "추악해라.", --빗물이 더러워짐
			DIRTY_ICE = "처다보기도 싫군.", --더러운 빗물 얼어버림
		},

		BUCKET_EMPTY = 
		{
			EMPTY = "내 손이 더러워지는 것보단 낫지.", -- 빈 나무 양동이
			FULL = "빗물이나 받아먹는 신세라니.", -- 깨끗한 빗물이 참
			FULL_ICE = "내가 저걸 꺼내야 하는 건가?", --빗물이 얼어버림
			DIRTY = "추악해라.", --빗물이 더러워짐
			DIRTY_ICE = "처다보기도 싫군.", --더러운 빗물 얼어버림
		},

		DESALINATOR =
		{
			EMPTY = "발상 하나는 굉장하군.", --제염기에 물이 없음
			PURIFY_LONG = "오래 걸리겠어.", -- 정수 끝나기까지 많이 남음
			PURIFY_SHORT = "거의 다 끝났군!", -- 정수가 곧 끝남
			HASWATER = "다 된 것 같군.", --제염기에 깨끗한 물이 있음
			BURNT = "쓸모 없어졌군.",   --제염기가 타버림
			HASSALT = "뭔가 막혔나 보군.", --제염기에 소금이 남아 있음
		},

		BARREL =
		{
			GENERIC = "물통이군.", -- 물통 조사 대사
			BURNT = "불을 물 쓰듯이 쓰는군.", -- 물통이 타버림
		},

		BREWERY =
		{
			EMPTY = "이런 곳에서까지 술을 마시겠다면야.", --양조기 조사 대사
			BURNT = "속을 너무 태운 거 아닌가?", --양조기 타버림
			FERMENTING_LONG = "오래 걸릴걸세.", --양조 끝나기 까지 많이 남음
			FERMENTING_SHORT = "거의 다 끝났군!", --양조가 곧 끝남
			DONE = "마실만한 게 나왔기를 빌어야지.", --양조기에 음료가 들어있음
		},

		CAMPKETTLE_ITEM = "에휴, 내 신세야.", --휴대 주전자 아이템 조사 대사
		CAMPKETTLE =
		{
			GENERIC = "그러니까, 이제 물 찾아서 걸어가야 하는 건가?", -- 화덕에 건 휴대 주전자 안에 물이 없음
			BOILING_LONG = "아직 차갑군.", -- 물 끓이기 시작함
			BOILING_SHORT = "끓는 소리가 들리는군.", -- 물 거의 다 끓음
			DONE = "내가 웅덩이 물이나 끓여마시는 신세라니.", --깨끗한 물이 들음
			STOP = "끓이다 말았잖아.", --화덕에 불이 없어서 더러운물이 끓지 않는 상태
		},

		CAMPDESALINATOR_ITEM = "많이 무거워 보이는데.", --휴대 제염기 아이템 조사 대사
		CAMPDESALINATOR = 
		{
			GENERIC = "바닷물은 할 일 없는 누가 대신 퍼다 주겠지.", --물 없음
			BOILING_LONG = "언제까지 기다려야 하는 거지?", --물 끓이기 시작
			BOILING_SHORT = "거의 다 된 것 같군.", --거의 다 끓음 
			DONE = "다 되었나 보군.", -- 깨끗한 물이 들음
			STOP = "끓이다 말았잖아.", -- 화덕에 불이 없어서 소금물이 정수 되지 않는 상태
		},

		KETTLE =
		{
			EMPTY = "쓸쓸해 보이는군.", --빈 주전자 조사대사
			BURNT = "과추출은 별론데.", --주전자가 불탐
			BOILING_LONG = "기다리자고...", -- 음료를 만들기 시작한지 얼마 안됨
			BOILING_SHORT = "거의 다 됐군!", --음료 조리가 거의 끝나감
			DONE = "이제야 마실만한 음료를 먹겠군.", --음료가 완성됨
			PURIFY_LONG = "차는 깨끗한 물로 내려야지.", -- 더러운 물을 끓이기 시작한지 얼마 안됨
			PURIFY_SHORT = "끓는 소리가 들리는군.", --더러운물을 거의 다 끓여감
			HASWATER = "차 한 잔 할 수 있었으면 좋겠군.", -- 깨끗한 물이 차 있는 상태
			MELT_LONG = "아직 차갑군.", -- 얼음물을 녹이기 시작한지 얼마 안됨
			MELT_SHORT = "미지근해졌군.", -- 얼음물을 거의 녹여감
		},

		PORTABLEKETTLE_ITEM =
		{
			GENERIC = "앉아서 차 한잔 할 여유도 없군.", -- 휴대용 주전자(아이템) 조사 대사
			EMPTY = "텅 비어 있다네.", -- 설치한 빈 휴대용 주전자 조사 대사
			BOILING_LONG = "인내심을 좀 길러야겠군.", -- 음료를 만들기 시작한지 얼마 안됨
			BOILING_SHORT = "금방 끝날거야.", --음료 조리가 거의 끝나감
			DONE = "잠깐 차 마실 여유를 가질 수 있겠군.", --음료가 완성됨
			PURIFY_LONG = "차는 깨끗한 물로 내려야지.", -- 더러운 물을 끓이기 시작한지 얼마 안됨
			PURIFY_SHORT = "끓는 소리가 들리는군.", --더러운물을 거의 다 끓여감
			HASWATER = "차 한 잔 할 수 있었으면 좋겠군.", -- 깨끗한 물이 차 있는 상태
			MELT_LONG = "아직 차갑군.", -- 얼음물을 녹이기 시작한지 얼마 안됨
			MELT_SHORT = "미지근해졌군.", -- 얼음물을 거의 녹여감
		},
		
		DISTILLERS =
		{   
		    EMPTY = "튼튼하고 고급스런 가마솥이로군.", --증류기 조사 대사
			DISTILLTING_LONG = "증류기가 일하게 놔 두자고.", --증류가 끝나기 까지 많이 남음
			DISTILLING_SHORT = "거의 다 된 것 같군.", --증류가 곧 끝남
			DONE = "이제 술다운 술을 마셔 보겠군.", --증류기에 음료가 들어있음
		},

		WELL_WATERPUMP = {
			HIGH_PRESSURE = "이봐, 이거 좀 시끄럽지 않나?", -- 압력 최대
			MIDDLE_PRESSURE = "내 손으로 일하지 않아도 되는건 좋군.", -- 압력이 중간
			LOW_PRESSURE = "이거 제대로 작동하고 있는 건가?", -- 압력이 거의 없을때
			RECHARG_PRESSURE = "빌어먹을 기계는 왜 안 움직이는 거야?!", -- 압력이 아예 없을때(여기까지 쓰면 압력이 최대가 될때까지 못씀.)
		},
		
		WELL_SPRINKLER =
		{ 
			LOWFUEL = "내가 기계공이라도 되는 줄 아나?", -- 연료가 거의 없는 상태에서의 조사 대사
			ON = "내 정장을 망치지만 않는다면 괜찮겠군.", -- 작동중임
			OFF = "나름 인정은 해 줘야겠군.", --작동을 멈춘상태에서의 조사 대사
		},	
	},
}