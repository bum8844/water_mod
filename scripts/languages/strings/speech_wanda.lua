return {
	ACTIONFAIL =
	{
		GIVE =
		{
			WELL_NOTEMPTY = "양동이부터 치워야지.", -- 우물에 말라 빈 양동이 달려있는데 양동이 달려 함
			WELL_BUSY = "내가 우물안에 동이를 넣은걸 잊었던가?", -- 우물에 물 든 양동이 달려있는데 달려 함
		}
	},

	ANNOUNCE_DRUNK = "아이고 이런... 몸을 못 가누겠네!", -- 취함

	ANNOUNCE_DRUNK_MUMBLE =
	{
		"으응, 아이고야...",
		"히끅... 히끅...",
		"히끅... 내가 무슨 딸꾹시계도 아니고... 히끅!",
		"똑 딱 똑 딱... 히끅.",
		"아... 아버지 보고 싶다.",
		"시계추가 된 것 같은 기분이야!",
		"하여튼 요즘 것들은... 마음에 안 들어...",
		"몇 번이고 돌려도 난 후회 안 해... 안 한다고!",
		"아무튼 나 때는 말이야...",
	},

	ANNOUNCE_DRUNK_END = "으윽, 시간 멀미보다도 더하네.", --술에서 좀 깸 (그로기)
	ANNOUNCE_DRUNK_IMMUNITY = "only_used_by_wolfgang_and_wathgrithr", --임시. 위그 전용,
	ANNOUNCE_NOTCHARGE = "나중에 다시 짜러 와야겠어. 조금 전에 할 거였나?", -- 시상 = (時相)
	ANNOUNCE_NOTHIRSTSLEEP = "빨리 마실 것부터 찾아야 해.", -- 목이 마른데 밤에 잘려고 시도
	ANNOUNCE_NOTHIRSTSIESTA = "쉴 수가 없어! 빨리 마실 걸 찾아야 해!", -- 목이 마른데 낮에 잘려고 시도
	ANNOUNCE_SLEEP_END = "아이고 이런, 내가 시간을 얼마나 낭비했담?", --자고 일어나서 술에서 완전히 깸 
	ANNOUNCE_THIRST = "내가 뭘 마신 지가 얼마나 됐더라?", --너무 목말라!

    ANNOUNCE_CAFFINE_BUFF_START = "이 정도면 시간도 날 따라잡지 못하겠지!", -- 카페인 버프 시작
    ANNOUNCE_CAFFINE_BUFF_STOP = "아이고 이런, 내 시간이 다시 느려졌어!",  -- 카페인 버프 끝

    ANNOUNCE_SATIETY_BUFF_START = "" , -- 포만감 버프 시작
    ANNOUNCE_SATIETY_BUFF_STOP = "" ,  -- 포만감 버프 끝
    
    ANNOUNCE_CURE_WATERBORNE = "이제야 겨우 배꼽시계를 고쳤어.",  -- 수인성 질병을 아이템으로 치료했을때의 대사

	ANNOUNCE_DCAPACITY_CRITICAL = "이거 시공간이 뒤틀린 거야, 아니면 내가 취한 거야?", --취하기 직전 (시류(時流) = 시간의 흐름)
	ANNOUNCE_DCAPACITY_HALF = "아이고 이런, 너무 서둘러서 마셨나.", -- 취기가 돌기 시작

	DESCRIBE =
	{
		BOILBOOK_BASIC = "티타임 같은 데에 쓸 시간 없어.",
		BOILBOOK_ADVANCED = "티타임 같은 데에 쓸 시간 없어.",

		WATER_CLEAN_ICE = "이걸 어느 세월에 녹여먹지?",--깨끗한 얼음물
		WATER_DIRTY_ICE = "차라리 눈을 퍼먹고 말지!", --더러운 얼음물

		SPICE_CAFFEINPEPPER = "뭔가 반복적으로 찾게 되네.", --후추 향신료
		SPICE_RUINCOLATE_SPREAD = "",

		WELL_KIT = "아이고 이런, 내가 우물 구멍을 팔 것을 잊지 말았어야 할 텐데.", --우물 키트 "Oh botheration, I hope I remembered to dig "
		WELL_SPRINKLER_KIT = "정교한 기계지만, 조립하는 데에 1초도 안 걸리겠어.", --스프링클러 키트
		WELL_WATERPUMP_KIT = "시간을 크게 들이지 않아도 물을 얻을 수 있겠어.", --스팀 물펌프 키트
		WELL_BURYING_KIT = "아이고야, 이게 무슨 또 시간 낭비람.", -- 구멍 매설 키트
		WELL_DRILLING = "서둘러! 내 시간 낭비하지 말고!", --드릴로 구멍 뚫는 중
		WELL_DRILLING_ITEM = "우물을 어디다 팔지부터 정하자고.", --드릴 아이템
		HOLE = "여기 빠지면 나오는 데에 한 세월은 걸리겠어.", --우물 구멍
		WELL = "어디 보자, 우물을 작동시키려면 뭐가 필요했더라?", --우물
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

		WX78MODULE_NONEDRUNK = "아하! 녀석이 이런 건 또 언제 만드나 싶었지.", -- 78전용 묘듈
<<<<<<< HEAD
=======
		PURIFICATION_TABLETS = "",
>>>>>>> Beta_1.2.8

		-- 물 모드 식물

		TEA_TREE = "뭔가 향이 유난히 좋은데.",--차나무
		DUG_TEA_TREE = "일일이 딸 시간 없어! 그냥 통째로 가져가!", --땅에서 파낸 차나무
		TEA_SEED = "때가 되면 새 나무로 자랄 거야.", -- 차나무 열매
		TEA_SEED_COOKED = "적어도 이 시간선에는 나무로 자라지 못해.", --구운 차나무 열매
		TEA_SEED_SAPLING = "이 녀석, 일부러 화 돋구려고 느리게 자라는 것 같아.", --차나무 새싹
		TEALEAVES = "따낸 찻잎이야", --찻잎
		TEALEAVES_DRIED = "말린 찻잎이야.", --말린 찻잎

		CAFFEINBERRY = "이거 원래 매달려서 자라는 거였던 것 같은데.", --커피 덤불 (산소미포함의 꼬집 후추풀 오마주)
		DUG_CAFFEINBERRY = "가져가기만 한다면 시간 절약에 도움이 되겠어.", --파낸 커피덤불
		CAFFEINBERRY_BEAN = "커피와 후추의 상태가 중첩되어 있어.", --생 커피콩
		CAFFEINBERRY_BEAN_COOKED = "시간 없는데 그냥 이대로 먹어도 되겠어.", --구운 커피콩

		RUINCACAO_TREE = "오, 초콜릿이 열리는 나무라니, 좋은데!", --카카오 나무
		DUG_RUINCACAO_TREE = "일일이 딸 시간 없어! 그냥 통째로 가져가!", --파낸 카카오 나무
		RUINCACAO_SEED = "새 생명이 작게 피어나고 있어.", --카카오 새싹 아이템
		RUINCACAO_SEED_SAPLING = "이 녀석, 일부러 화 돋구려고 느리게 자라는것 같아.", -- 카카오 새싹 심은거
		RUINCACAO = "까보기 전엔 열매인지 숯인지 모르지.", --부수기 전 카카오 열매
		RUINCACAO_BEAN = "그냥 먹으면 속이 뒤집어질 거야.", --부순 후 카카오 콩  
		RUINCACAO_BEAN_COOKED = "이거 시간낭비 아닌가 모르겠네.", --구운 카카오 콩

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

		ADDITIVE_SEED = "장래가 주당인 꿈나무들이로군.", -- 리큐르에 제조에 첨가 할 씨허브(아니스,쥬니퍼베리,팔각 모티브)첨가제 
		ADDITIVE_PETALS = "오랜 아름다움을 갈망하는 늙은 꽃잎사귀뭉치야.", -- 리큐르에 제조에 첨가 할 허브,녹차,꽃잎 첨가제
		ADDITIVE_NUT = "그냥 씹어먹고 말지 왜 이렇게 해 놨담?", -- 리큐르에 제조에 첨가 할 버치넛,코코넛,커피콩,카카오콩 첨가제
		ADDITIVE_DAIRY = "마시기 편해지면 그만큼 빨리 마실 수 있겠지.", -- 리큐르에 제조에 첨가할 유제품 첨가제

		-- 음료

		WATER_CLEAN = "그냥 이대로 마셔도 충분해.", --깨끗한 물
		WATER_DIRTY = "차라리 그냥 말라 죽고 말지.", --더러운 물
		WATER_SALTY = "아무리 급해도 이걸 마실 정도는 아니야.", --바닷물

		GOOPYDRINK = "아이고야, 내가 너무 성급했네!", --실패한 음료(웻 굽 개념)
		
		-- 주전자 음료

		FRUITJUICE = "온갖 과일을 한 번에 먹을 수 있어.", --잡 과일쥬스
		BERRIES_JUICE = "그냥 따서 먹는 게 빠르지 않나?", -- 베리 쥬스
		POMEGRANATE_JUICE = "씨앗 빼느라 고생하지 않아도 되겠어.", -- 석류 쥬스
		BANANA_JUICE = "따뜻하면 목 매이는데.", -- 바나나 쥬스
		FIG_JUICE = "달콤함의 정수야!", -- 무화과 쥬스
		DRAGONJUICE = "파이 말고 주스도 되네.", --용과 쥬스
		GLOWBERRYJUICE = "정말 맛있고 쓸모있는 주스야!", -- 발광베리 쥬스
		WATERMELON_JUICE = "정말 시원하네!", --수박 쥬스

		VEGGIE_TEA = "혀에 닿을 때마다 나는 쓴맛을 참을 수가 없어!", --녹즙
		CARROT_TEA = "얼른 들이키자.", --당근차
		CACTUS_TEA = "소화는 잘 되겠네.", --선인차
		TOMATO_JUICE = "부드럽네. 후딱 마시기 좋겠어.", --토마토 쥬스
		LUMPY_TEA = "차 한 잔 할 여유는 없는데.", --뿌리차,
		SEAWEED_SHAKE = "시간대비 손해본것 같은데.", --해초 쉐이크
		
		GREENTEA = "차를 가릴 여유 따윈 없어.", --생잎 녹차
		BLACKTEA = "가끔 차 한 잔 할 여유 정도는 괜찮겠지.", --홍차
		BLACKTEA_ICED = "시원한 거 한 모금 해야겠네.", -- 홍차 아이스티
		FUER = "재료를 생각하면 나쁘진 않네.", --보이차,이파리차,고사리차
		MIXFLOWER = "아주 멱살잡고 꽃향기를 맡게 해주네.", --잡 꽃잎 차
		HIBISCUSTEA = "이건 왜 이렇게 시어?", --히비스커스 차
		CACTUSFLOWER_TEA = "꽃 향기 즐길 시간은 됐어.", --선인꽃차
		LOTUSTEA = "과거에 꽃이였거나 혹은 물고기였을거야.", --연꽃차
		SUSHIBISCUS = "차를 가릴 여유 따윈- 아니, 이건 또 뭐야?", -- 자살차
		MOON_BLOSSOM_TEA = "어떻게 아직도 김이 모락모락 나는 거지?", --달꽃차

		CAFFEINBERRY_JUICE = "시간은 상대적인 거야. 내 시간이 빠르든 주위 시간이 느리든 똑같다고.", -- 블랙 커피
        TOFFEE_LATTE = "커피랑 디저트를 한 번에 해결했네.", --토피넛 라떼
		RUINCHA_LATTE = "고민할 시간 따위 없으니까.", --모카 라떼(커피+초코)
		
		HOTRUINCOLATE = "따뜻함과 달콤함으로 가득해.", --핫초코
		RUINCOLATE_SMOOTHIE = "차가움과 달콤함으로 가득해.", --초코 스무디(차가움)
		RUINXOCOLATL = "맛이 너무 없어서 고대로 돌아간 기분이야.", --쇼콜라틀(매캐함)
		TEA_RUINCOLATE_LATTE = "의외로 입맛에 잘 맞네!", -- 말차 라떼

		MULLED = "앓아 누울 시간도 없거든.", --뱅쇼
		BUTTERBEER = "밥 먹을 시간을 아낄 수 있겠어.", --해리포터 시리즈의 버터비어

		APPLEPINE_JUICE = "과피가 없어도 많이 먹으면 입에서 피나지.",
		APPLEPINE_SMOOTHIE = "",
		APPLEPINE_CAPPUCCINO = "",

		CITROYUZU_JUICE = "밥 먹고 입가심 해야지.", 
		CITROYUZU_TEA = "",
		EARLGREY_TEA = "",

		-- 콜라보 주전자 음료

		COCONUT_JUICE = "속이 빈 부분을 젤리로 등가교환했어.", --난파선 코코넛 쥬스
		RAINBOW_SHAKE = "효율적인 것 같네!", --난파선 무지개 해파리 쉐이크
		QUARTZ_SHAKE = "생선 가시 씹을 일은 없겠네.", --난파선 광대 물고기 쉐이크
		NETTLE_TEA = "",
		FRASH_BRAMBLE_TEA = "",
		TUBER_BLOOM_TEA = "",
		CHERRY_ROSEBERRIES_TEA = "가끔은 꽃 구경과 차 한 잔의 여유를 즐기는 것도 나쁘지 않을지도...", --체리숲 로즈힙 차
		CHERRY_HONEY_TEA = "고급스러우면서 따뜻해.", --체리숲 벚꽃꿀 차
		SWEET_RICE_DRINK = "거 참 먹기 한 번 번거로운 씨앗이네.", -- 비타협 식혜
		STRAWBERRY_SMOOTHIE = "급하게 먹다가는 머리 아프겠어.", -- 모어 푸드 팩 딸기 스무디
		STRAWBERRY_MILK_SMOOTHIE = "그냥 녹게 뒀다가 쭉 들이키는 게 낫겠어.", -- 모어 푸드 팩 딸기 스무디 라떼

		--양조기 음료

		SPOILED_DRINK = "음료였던 거야.", --썩은 음료 (주식 할떄 그 주)

		-- 양조소다
	
		SODA = "고작 물에 기포 좀 넣겠다고 이 고생을 한 건 아니겠지.", -- 탄산수
		FRUITSODA = "음료 한 잔 마실 시간도 모자라.", -- 과일소다
		LIMONSODA = "뭔가 레모네이드랑 비슷한 맛인데.", -- 레몬 라임소다(과일소다 상위 호환)
		COLA = "사레 들리기 쉽다는 점만 빼면 훌룡해.", -- 콜라
		COLAQUANTUM = "흠, 이거는 이 시간선에 있으면 안 될 물건 같은데.", --콜라 퀀텀
		LUMPY_BEER = "이거 은근히 중독성 있는데.", --루트비어(미국 찰나무 = Sassafras 굶지마 세계관 기준으로 미래인 1979년에 금지됨;)
		APPLEPINESODA = "파인애플에 탄산이라, 뭔가 이상한데.", -- 탄산 파인애플(오란씨)
		CITROYUZUSODA = "뭐, 마실 거 한 모금의 여유 정도는 괜찮겠지.", -- 탄산 오랜지(환타)
		DAWN_FOG = "",
		MOON_CAP_DRINK = "",

		-- 양조주

		CORN_BEER = "앉아서 맥주나 마실 시간 없어.", -- 콘 맥주
		MADHU = "단맛을 잃은 대신 시간을 얻었지.", --벌꿀주
		WINE = "현재의 와인, 혹은 미래의 식초야.", --와인 (그냥 베리 양조)
		NOBLEWINE = "그냥 투명한 와인 아닌가?", --노블 와인(구운 베리 양조)
		SPARKLINGWINE = "어느 시간선에서는 파티에서 샴페인이나 터트리는 내가 있을 수도 있겠지.", --스파클링 와인
		GLOWBERRYWINE = "잘 상하지도 않는데 효율성도 갖췄어!", --글로우 베리 와인
		KUMIS = "시간을 투자한 가치가 있길 바래.", -- 크므즈,산양유주
		LUMPY_WINE = "이득 봤다고 봐야지.", --서주(감자 고구마등 뿌리 술)
		PULQUE = "시간 쓴 거에 비해 금방 상할 것 같은데.", --풀케(선인주)
		RUINCACAO_WINE = "그래, 초콜릿으로 술을 담갔단 말이지.", -- 카카오 와인 
<<<<<<< HEAD
		MIDNIGHT_STROM = "",
=======
		MIDNIGHT_STORM = "",
>>>>>>> Beta_1.2.8
		APPLEPINE_CIDER = "",
		MENTHA_SPICATA_WINE = "",

		-- 콜라보 소다

		CHERRY_DOCTOR_COLA = "이 음료가 시간여행을 하진 않겠지.", --체리숲 닥터 페퍼(닥터 체리) (대충 닥터후 패러디)
		STRAWBERRYSODA = "딸기가 아니라 무슨 약 맛이 나잖아.", -- 탄산 딸기(웰치스 딸기)

		--콜라보 양조주

		AUROBOW = "마시기보다는 장식장에 두는 게 낫겠어.", -- 난파선 오로보우,무지개 해파리주
		COCONUT_WINE = "항해가 길어질 때를 대비해야겠지.", -- 난파선 코코넛 와인
		NETTLE_WINE = "",
		CHERRY_BLOOM_MADHU = "고급스럽네!", -- 체리숲 벚꽃꿀주
		GIANT_BLUEBERRY_WINE = "어딘가 불안한데.", -- 비타협 붐!베리 사파이어(불 붙히면 폭발함)
		RICE_WINE = "어차피 시간들이지 않음 먹지도 못했어.", -- 비타협 막걸리
		WHEAT_BEER = "옥수수로 만드나 밀로 만드나 맥주 마실 시간 없어!", -- 힙 오브 푸드 밀맥주
		PALE_BEER = "이 정도 되면 진짜 놀랍지도 않다.", -- 레기온 페일에일 (몬스트라 열매를 쓴 청록색 맥주)

		--증류주

		DISINFECTANT = "시계 닦을 때나 좀 쓸만하겠네.", -- 소독약
		CORN_WHISKEY = "독한 술 마실 생각 말고 웬만하면 물을 마셔!", -- 콘 위스키
		LUMPY_VODKA = "괜히 만취해서 시간 낭비하지는 말자고.", -- 보드카
		TEQUILA = "어쩔 수 없을 때가 아니면야.", -- 데킬라
		MADHU_RUM = "그래도 바다 위에서는 이런 거라도 마셔야겠지.", -- 럼주
		BERRY_BRANDY = "위스키고 브랜디고 상관 없어. 안 썩는 게 중요하지.", -- 베리 브랜디
		AREUHI = "그나마 쉽게 변질되지는 않겠네.", -- 크므즈 증류주 아르히
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

		BERRY_GIN = "그래, 딱 한 잔만.", --진
		GLOWBERRY_GIN = "훌륭한 술이네. 그래도 과음은 주의해야겠지.", --글로우 베리 진
		ABSINTHE = "이런 거 음미할 시간은 없는데.", -- 압생트
		TEA_LUMPY_VODKA = "솔직히 차 향이 나는지도 모르겠어.", -- 녹차 리큐르
		PETALS_BERRY_BRANDY = "술에서 꽃 향기 나는 거 맡을 여유가 어디 있다고.", -- 장미향 브랜디
		KAHLUA = "시간 가속과 시간 감속을 동시에 하면 무슨 소용이야?", -- 커피 리큐르 깔루아
		NUT_CORN_WHISKEY = "오래 살고 싶으면 술은 적당히 마시는 게 좋을걸.", -- 너트 위스키
        RUINCACAO_CREAM_LIQUEUR = "달달하니 좋긴 한데, 적당히 마셔야겠지.", --베일리스 카카오 크림 리큐르
        RUMCHATA = "이런 술이면 가끔은 마셔도 좋겠어.", -- 럼차타(럼에 오우차타 라는 유제품 섞은)

		--콜라보 증류주

		MOONWAY = "이 녀석들은 술을 만들어도 영롱하네.", -- 무지개 해파리주 증류주
		NETTLE_LIQUEUR = "",
		ARRACK = "아무리 오래 들고 다녀도 잘 상하지 않아.", -- 아락 인도네시아 버전 코코넛 와인 증류주
		CHERRY_BLOOM_RUM = "예쁘긴 하네. 병채로 진열장에 둬도 좋겠어.", -- 체리 꿀주 증류주 벛꽃잎 떠다
		RICE_SPIRITS = "한잔이면 바싹 정신차릴수 있을거야.", --청주
		WHEAT_WHISKEY = "솔직히 술맛은 몰라, 거의 안 썩는다는것만 알지.", -- 밀 위스키
		PALE_WHISKEY = "어떻게 끓이고 나서도 창백한지 원.", -- 페일 몰트 위스키

		--왈리 전용 콜라보 증류주

		NUT_COCONUT_BRANDY = "그래, 배 위에서 휘청거리다 물에 빠지고 싶다면야.", -- 코코넛 브랜디 (캐러비안 럼을 만들수 없어서 카리브 브랜디 라는 이름으로 대체)
	    GIANT_BLUEBERRY_GIN = "예고된 폭발 사고나 마찬가지야.", -- 붐 베리 사파이어 (당근 폭발함)

		--냄비 요리

        DARK_RUINCOLATE = "이 간식에 숨은 비밀을 알기는 할까?", --다크 초콜릿.
        WHITE_RUINCOLATE = "왈리가 내 입맛을 잘 아네.", --화이트 초콜릿
        RUINCOLATE = "주머니 속에서 잘 녹는 것만 빼면 최고야!", -- 그냥 초콜릿
        RUIN_SCHOKAKOLA = "완벽한 간식이야!", -- 쇼카콜라
        APPLEPINE_PIE = "",
        APPLEPINE_FRIED_RICE = "",
<<<<<<< HEAD
        citroyuzu_bbq = "",
=======
        CITROYUZU_BBQ = "",
>>>>>>> Beta_1.2.8

		BUCKET_STEEL_EMPTY = 
		{
			EMPTY = "내가 왜 그냥 물동이나 보고 있지?", --빈 양철 양동이
			FULL = "깨끗한 물을 그냥 버릴 순 없지!", -- 깨끗한 빗물이 참
			FULL_ICE = "아이고야, 이걸 어느 세월에 녹여?", --빗물이 얼어버림
			DIRTY = "시간이 지나서 오염되어 버렸어.", --빗물이 더러워짐
			DIRTY_ICE = "오염된 것도 모자라서 얼어버리기까지 했네.", --더러운 빗물 얼어버림
		},

		BUCKET_WOODIE_EMPTY = 
		{
			EMPTY = "나무를 단숨에 파내다니, 솜씨 하나는 인정해야겠네.", --우디의 빈 나무 양동이
			FULL = "깨끗한 물을 그냥 버릴 순 없지!", -- 깨끗한 빗물이 참
			FULL_ICE = "아이고야, 이걸 어느 세월에 녹여?", --빗물이 얼어버림
			DIRTY = "시간이 지나서 오염되어 버렸어.", --빗물이 더러워짐
			DIRTY_ICE = "오염된 것도 모자라서 얼어버리기까지 했네.", --더러운 빗물 얼어버림
		},

		BUCKET_DRIFTWOOD_EMPTY = 
		{
			EMPTY = "오래된 나무로 만든게 더 튼튼하다니 아이러니하네.", -- 유목양동이
			FULL = "깨끗한 물을 그냥 버릴 순 없지!", -- 깨끗한 빗물이 참
			FULL_ICE = "아이고야, 이걸 어느 세월에 녹여?", --빗물이 얼어버림
			DIRTY = "시간이 지나서 오염되어 버렸어.", --빗물이 더러워짐
			DIRTY_ICE = "오염된 것도 모자라서 얼어버리기까지 했네.", --더러운 빗물 얼어버림
		},

		BUCKET_EMPTY = 
		{
			EMPTY = "특별할 거 없는 양동이야.", -- 빈 나무 양동이
			FULL = "깨끗한 물을 그냥 버릴 순 없지!", -- 깨끗한 빗물이 참
			FULL_ICE = "아이고야, 이걸 어느 세월에 녹여?", --빗물이 얼어버림
			DIRTY = "시간이 지나서 오염되어 버렸어.", --빗물이 더러워짐
			DIRTY_ICE = "오염된 것도 모자라서 얼어버리기까지 했네.", --더러운 빗물 얼어버림
		},

		DESALINATOR =
		{
			EMPTY = "바닷물을 민물로 만드는 장치야.", --제염기에 물이 없음
			PURIFY_LONG = "차라리 비가 오기를 기다리고 말지.", -- 정수 끝나기까지 많이 남음
			PURIFY_SHORT = "으으, 빨리빨리!", -- 정수가 곧 끝남
			HASWATER = "드디어!", --제염기에 깨끗한 물이 있음
			BURNT = "차질이 좀 생겼네.",   --제염기가 타버림
			HASSALT = "내가 소금 비우는 걸 깜빡했던가?", --제염기에 소금이 남아 있음
		},

		BARREL =
		{
			GENERIC = "적어도 물이 썩을 걱정은 치워놔도 되겠어.", -- 물통 조사 대사
			BURNT = "누가 물 담은 통이 불탈거라 예측할수 있겠어?", -- 물통이 타버림
		},

		BREWERY =
		{
			EMPTY = "그냥 차 끓여먹는 정도로는 만족을 못 했구만.", --양조기 조사 대사
			BURNT = "그렇게 될 운명이었나 보지.", --양조기 타버림
			FERMENTING_LONG = "시간 먹는 하마가 따로 없네.", --양조 끝나기 까지 많이 남음
			FERMENTING_SHORT = "참 오래도 기다리게 하네!", --양조가 곧 끝남
			DONE = "이제야 다 됐네!", --양조기에 음료가 들어있음
		},

		CAMPKETTLE_ITEM = "한동안 가지고 다녀야겠어.", --휴대 주전자 아이템 조사 대사
		CAMPKETTLE =
		{
			GENERIC = "내가 물 채우는 걸 잊었나?", -- 화덕에 건 휴대 주전자 안에 물이 없음
			BOILING_LONG = "왜 이렇게 오래 걸려?", -- 물 끓이기 시작함
			BOILING_SHORT = "으으, 조금만 더 빨리!", -- 물 거의 다 끓음
			DONE = "깨끗한 물 한 잔 먹기 참 힘드네.", --깨끗한 물이 들음
			STOP = "아이고 이런, 화력이 부족해!", --화덕에 불이 없어서 더러운물이 끓지 않는 상태
		},

		CAMPDESALINATOR_ITEM = "바닷물을 그대로 먹는 것보다는 훨씬 낫겠지.", --휴대 제염기 아이템 조사 대사
		CAMPDESALINATOR = 
		{
			GENERIC = "내가 물 채우는 걸 잊었나?", --물 없음
			BOILING_LONG = "왜 이렇게 오래 걸려?", --물 끓이기 시작
			BOILING_SHORT = "으으, 조금만 더 빨리!", --거의 다 끓음 
			DONE = "깨끗한 물 한 잔 먹기 참 힘드네.", -- 깨끗한 물이 들음
			STOP = "아이고 이런, 화력이 부족해!", -- 화덕에 불이 없어서 소금물이 정수 되지 않는 상태
<<<<<<< HEAD
=======
		},

		TEA_POT =
		{
			EMPTY = "이슬이나 핥아먹는 것보다는 훨씬 낫겠지.", --빈 주전자 조사대사
			BURNT = "아이고, 한동안 이슬이나 핥아야겠네!", --주전자가 불탐
			BOILING_LONG = "음료 한 잔 하려고 이런 시간 낭비라니.", -- 음료를 만들기 시작한지 얼마 안됨
			BOILING_SHORT = "이제 금방 되는 거 맞겠지?", --음료 조리가 거의 끝나감
			DONE = "마침내 음료가 나왔네!", --음료가 완성됨
			PURIFY_LONG = "왜 이렇게 오래 걸려?", -- 더러운 물을 끓이기 시작한지 얼마 안됨
			PURIFY_SHORT = "으으, 조금만 더 빨리!", --더러운물을 거의 다 끓여감
			HASWATER = "그냥 마셔도 될 것 같은데.", -- 깨끗한 물이 차 있는 상태
			MELT_LONG = "빨리 좀 녹아라, 빨리...", -- 얼음물을 녹이기 시작한지 얼마 안됨
			MELT_SHORT = "조금만 더 녹이면 되겠어!", -- 얼음물을 거의 녹여감
		},

		PORTABLE_TEA_POT_ITEM =
		{
			GENERIC = "난 여유롭게 다과회 즐길 여유는 없으니 알아둬.", -- 휴대용 주전자(아이템) 조사 대사
			EMPTY = "야채에도 물이 많은데 그냥 씹어먹으면 되지 않아?", -- 설치한 빈 휴대용 주전자 조사 대사
			BOILING_LONG = "음료 하나 만드는 데에 이게 뭔 난리인지.", -- 음료를 만들기 시작한지 얼마 안됨
			BOILING_SHORT = "이제 오래 안 걸리겠지?", --음료 조리가 거의 끝나감
			DONE = "마침내 음료가 나왔네!", --음료가 완성됨
			PURIFY_LONG = "왜 이렇게 오래 걸려?", -- 더러운 물을 끓이기 시작한지 얼마 안됨
			PURIFY_SHORT = "으으, 조금만 더 빨리!", --더러운물을 거의 다 끓여감
			HASWATER = "이제 마셔도 되는거 아닌가?", -- 깨끗한 물이 차 있는 상태
			MELT_LONG = "빨리 좀 녹아라, 빨리...", -- 얼음물을 녹이기 시작한지 얼마 안됨
			MELT_SHORT = "조금만 더 녹이면 되겠어!", -- 얼음물을 거의 녹여감
>>>>>>> Beta_1.2.8
		},

		KETTLE =
		{
			EMPTY = "이슬이나 핥아먹는 것보다는 훨씬 낫겠지.", --빈 주전자 조사대사
			BURNT = "아이고, 한동안 이슬이나 핥아야겠네!", --주전자가 불탐
<<<<<<< HEAD
			BOILING_LONG = "음료 한 잔 하려고 이런 시간 낭비라니.", -- 음료를 만들기 시작한지 얼마 안됨
			BOILING_SHORT = "이제 금방 되는 거 맞겠지?", --음료 조리가 거의 끝나감
=======
>>>>>>> Beta_1.2.8
			DONE = "마침내 음료가 나왔네!", --음료가 완성됨
			PURIFY_LONG = "왜 이렇게 오래 걸려?", -- 더러운 물을 끓이기 시작한지 얼마 안됨
			PURIFY_SHORT = "으으, 조금만 더 빨리!", --더러운물을 거의 다 끓여감
			HASWATER = "그냥 마셔도 될 것 같은데.", -- 깨끗한 물이 차 있는 상태
			MELT_LONG = "빨리 좀 녹아라, 빨리...", -- 얼음물을 녹이기 시작한지 얼마 안됨
			MELT_SHORT = "조금만 더 녹이면 되겠어!", -- 얼음물을 거의 녹여감
		},

		PORTABLEKETTLE_ITEM =
		{
			GENERIC = "난 여유롭게 다과회 즐길 여유는 없으니 알아둬.", -- 휴대용 주전자(아이템) 조사 대사
			EMPTY = "야채에도 물이 많은데 그냥 씹어먹으면 되지 않아?", -- 설치한 빈 휴대용 주전자 조사 대사
<<<<<<< HEAD
			BOILING_LONG = "음료 하나 만드는 데에 이게 뭔 난리인지.", -- 음료를 만들기 시작한지 얼마 안됨
			BOILING_SHORT = "이제 오래 안 걸리겠지?", --음료 조리가 거의 끝나감
=======
>>>>>>> Beta_1.2.8
			DONE = "마침내 음료가 나왔네!", --음료가 완성됨
			PURIFY_LONG = "왜 이렇게 오래 걸려?", -- 더러운 물을 끓이기 시작한지 얼마 안됨
			PURIFY_SHORT = "으으, 조금만 더 빨리!", --더러운물을 거의 다 끓여감
			HASWATER = "이제 마셔도 되는거 아닌가?", -- 깨끗한 물이 차 있는 상태
			MELT_LONG = "빨리 좀 녹아라, 빨리...", -- 얼음물을 녹이기 시작한지 얼마 안됨
			MELT_SHORT = "조금만 더 녹이면 되겠어!", -- 얼음물을 거의 녹여감
		},
		
		DISTILLERS =
		{   
		    EMPTY = "적어도 술이 쉽게 썩지는 않겠네.", --증류기 조사 대사
			DISTILLTING_LONG = "과정을 지켜본다고 시간을 낭비할 수는 없지.", --증류가 끝나기 까지 많이 남음
			DISTILLING_SHORT = "오래 걸리지 않을 거야!", --증류가 곧 끝남
			DONE = "드디어!", --증류기에 음료가 들어있음
		},

		WELL_WATERPUMP = {
			HIGH_PRESSURE = "그만한 고생을 한 가치가 있어!", -- 압력 최대
			MIDDLE_PRESSURE = "당장이라도 깨끗한 물을 얻을 수 있어.", -- 압력이 중간
			LOW_PRESSURE = "태엽이라도 감아줘야 하나?", -- 압력이 거의 없을때
			RECHARG_PRESSURE = "아이고야, 다시 물 뜨려면 시간 좀 버리겠네.", -- 압력이 아예 없을때(여기까지 쓰면 압력이 최대가 될때까지 못씀.)
		},
		
		WELL_SPRINKLER =
		{ 
			LOWFUEL = "내가 원한다면 연료를 보충해 줄 수 있겠지.", -- 연료가 거의 없는 상태에서의 조사 대사
			ON = "이걸로 물 주는 시간을 절약했어.", -- 작동중임
			OFF = "언제든 가동 가능해.", --작동을 멈춘상태에서의 조사 대사
		},	
	},
}