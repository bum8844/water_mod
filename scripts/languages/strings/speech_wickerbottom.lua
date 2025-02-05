return {
	ACTIONFAIL =
	{
		GIVE =
		{
			WELL_NOTEMPTY = "양동이를 하나만 달도록 만들어져 있단다.", -- 우물에 말라 빈 양동이 달려있는데 양동이 달려 함
			WELL_BUSY = "기다리자꾸나.", -- 우물에 물 든 양동이 달려있는데 달려 함
		}
	},

	ANNOUNCE_DRUNK = "호호 이런, 과음은 몸을 망치는 지름길인데 말이다...", -- 취함

	ANNOUNCE_DRUNK_MUMBLE =
	{
		"크흐음!",
		"아무래도 술은 불면증에 전혀 도움이 되지 않는 것 같구나...",
		"딸꾹!",
		"과음은 절대 금 물이란 다!",
		"간에도 나쁘고, 정신을 해치고...",
		"무엇보다 정 신적... 으로... 에헴!",
		"뇌를 비롯한 신경계 전반의 기능을 저하시켜서...",
		"그러니까, 술은 많이 마셔서 좋을 게 없는 게야...!",
		"으흠! 크흠! 으흐흠!",
	},

	ANNOUNCE_DRUNK_END = "...아무튼 과음은 절대 금물이란다.", --술에서 좀 깸 (그로기)
	ANNOUNCE_DRUNK_IMMUNITY = "only_used_by_wathgrithr", --임시. 위그 전용,
	ANNOUNCE_NOTCHARGE = "젖을 짤 수 있는 상태가 아니란다.", --번개염소가 충전이 안되서 양동이로 젖을 짤수 없음
	ANNOUNCE_NOTHIRSTSLEEP = "수분 보충 없이는 잠들 수가 없어!", -- 목이 마른데 밤에 잘려고 시도  -- 위커바텀 미사용
	ANNOUNCE_NOTHIRSTSIESTA = "적절한 수분 보충이 필요해!", -- 목이 마른데 낮에 잘려고 시도 -- 위커바텀 미사용
	ANNOUNCE_SLEEP_END = "이런, 너무 많이 마셨었나 보구나.", --자고 일어나서 술에서 완전히 깸  -- 위커바텀 미사용
	ANNOUNCE_THIRST = "사서에게 마실 것이 필요해.", --너무 목말라!

    ANNOUNCE_CAFFINE_BUFF_START = "운동 신경이 각성 상태구나!", -- 카페인 버프 시작
    ANNOUNCE_CAFFINE_BUFF_STOP = "각성 효과가 끝났어.",  -- 카페인 버프 끝

    ANNOUNCE_SATIETY_BUFF_START = "" , -- 포만감 버프 시작
    ANNOUNCE_SATIETY_BUFF_STOP = "" ,  -- 포만감 버프 끝
    
    ANNOUNCE_CURE_WATERBORNE = "풍토병의 고통이 완화되는구나.",  -- 수인성 질병을 아이템으로 치료했을때의 대사

	ANNOUNCE_DCAPACITY_CRITICAL = "과음은 몸에 해롭다는 것을 잊으면 안 돼.", --취하기 직전
	ANNOUNCE_DCAPACITY_HALF = "적당한 음주는 몸에 어느 정도 이롭단다.", -- 취기가 돌기 시작

	DESCRIBE =
	{
		BOILBOOK_BASIC = "음료 정보 모음집이란다.",
		BOILBOOK_ADVANCED = "음료 정보 모음집이란다.",

		WATER_CLEAN_ICE = "고체 상태의 물이야.",--깨끗한 얼음물
		WATER_DIRTY_ICE = "미생물에 오염된 고체 물이야.", --더러운 얼음물

		SPICE_CAFFEINPEPPER = "과거에는 매우 귀한 향신료였단다.", --후추 향신료
		SPICE_RUINCOLATE_SPREAD = "",

		WELL_KIT = "수맥에 구멍을 뚫고 그 위에 설치하자꾸나.", --우물 키트
		WELL_SPRINKLER_KIT = "수맥 구멍 위에 설치해야 해.", --스프링클러 키트
		WELL_WATERPUMP_KIT = "깊은 수맥에서 물을 퍼올리기 위한 기계란다.", --스팀 물펌프 키트
		WELL_BURYING_KIT = "수맥을 폐쇄할 때 사용하는 도구란다.", -- 구멍 매설 키트
		WELL_DRILLING = "시추 작업이 진행 중이구나.", --드릴로 구멍 뚫는 중
		WELL_DRILLING_ITEM = "수맥이 있을 만한 적당한 장소를 찾아야겠어.", --드릴 아이템
		HOLE = "물이 흘러나오는 소리가 들리는구나.", --우물 구멍
		WELL = "수맥 깊은 곳으로부터 물을 길어온단다.", --우물
		BOTTLE_POUCH_SMALL = "",
		BOTTLE_POUCH_BIG = "",
		THERMOS_BOTTLE_SMALL = "",
		THERMOS_BOTTLE_BIG = "",
		WINE_CELLAR_PART = "",
		WINE_CELLAR = "",

		WX78MODULE_NONEDRUNK = "유기체를 싫어하긴 하지만 유기체에게서 영감을 얻는 건 싫어하지 않는 것 같구나.", -- 78전용 묘듈
		PURIFICATION_TABLETS = "",

		-- 물 모드 식물

		TEA_TREE = "동백나무속의 차나무란다.",--차나무
		DUG_TEA_TREE = "성장하려면 토양이 필요하단다.", --땅에서 파낸 차나무
		TEA_SEED = "차나무의 씨앗이란다.", -- 차나무 열매
		TEA_SEED_COOKED = "심는 편이 더 나았겠어.", --구운 차나무 열매
		TEA_SEED_SAPLING = "조금씩 성장하고 있구나.", --차나무 새싹
		TEALEAVES = "찻잎 중에서도 소엽종이란다.", --찻잎
		TEALEAVES_DRIED = "홍차 마실 사람?", --말린 찻잎

		CAFFEINBERRY = "월토에서 자라는 낮은 덤불이야", --커피 덤불
		DUG_CAFFEINBERRY = "커피와 후추의 교잡종이라니, 흥미로워.", --파낸 커피덤불
		CAFFEINBERRY_BEAN = "향이 특이하구나.", --생 커피콩
		CAFFEINBERRY_BEAN_COOKED = "볶으니 진한 커피향과 약간의 후추향이 나는구나.", --구운 커피콩

		RUINCACAO_TREE = "열매가 싱크홀 아래로 떨어져 내린 게 틀림없구나.", --카카오 나무
		DUG_RUINCACAO_TREE = "성장하려면 토양이 필요하단다.", --파낸 카카오 나무
		RUINCACAO_SEED = "카카오 나무의 씨앗이란다.", --카카오 새싹 아이템
		RUINCACAO_SEED_SAPLING = "카카오 나무의 종자가 성장할 것이야.", -- 카카오 새싹 심은거
		RUINCACAO = "고대 아즈텍에서는 화폐로 이용되었었지.", --부수기 전 카카오 열매
		RUINCACAO_BEAN = "가공되지 않은 상태로는 활용이 어려워.", --부순 후 카카오 콩  
		RUINCACAO_BEAN_COOKED = "이제 특유의 풍미가 드러나는구나.", --구운 카카오 콩

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

		ADDITIVE_SEED = "씨앗의 향을 술에 더해준단다.", -- 리큐르에 제조에 첨가 할 씨허브(아니스,쥬니퍼베리,팔각 모티브)첨가제 
		ADDITIVE_PETALS = "꽃과 허브는 전통적으로 다양한 리큐르의 재료로 쓰였지.", -- 리큐르에 제조에 첨가 할 허브,녹차,꽃잎 첨가제
		ADDITIVE_NUT = "전통적인 리큐르 재료는 아니구나.", -- 리큐르에 제조에 첨가 할 버치넛,코코넛,커피콩,카카오콩 첨가제
		ADDITIVE_DAIRY = "술과 유제품의 조합이라니, 독특하구나.", -- 리큐르에 제조에 첨가할 유제품 첨가제

		-- 음료

		WATER_CLEAN = "생명에 필수적이란다. 화학식으로는 H₂O이지.", --깨끗한 물
		WATER_DIRTY = "물에 박테리아가 들끓어서 풍토병의 위험이 있어.", --더러운 물
		WATER_SALTY = "마시면 오히러 탈수를 일으킬 수 있어.", --바닷물

		GOOPYDRINK = "오 이런, 이러면 안 되는데.", --실패한 음료(웻 굽 개념)
		
		-- 주전자 음료

		FRUITJUICE = "모양새는 엉성하지만 맛은 나쁘지 않구나.", --잡 과일쥬스
		BERRIES_JUICE = "백량금 열매에는 해열과 소염 효과가 있단다.", -- 베리 쥬스
		POMEGRANATE_JUICE = "여성 건강에 매우 훌륭하단다.", -- 석류 쥬스
		BANANA_JUICE = "따뜻하게 마시는 것도 나쁘지 않겠지.", -- 바나나 쥬스
		FIG_JUICE = "무화과는 인류가 오래 전부터 재배해온 과일이지.", -- 무화과 쥬스
		DRAGONJUICE = "사실 용과는 향이 매우 옅은 편이란다.", --용과 쥬스
		GLOWBERRYJUICE = "참 특이한 음료구나.", -- 발광베리 쥬스
		WATERMELON_JUICE = "수분 보충에 매우 효과적이란다.", --수박 쥬스

		VEGGIE_TEA = "몸에 좋은 음료는 쓴 법이지.", --녹즙
		CARROT_TEA = "이것도 야채를 섭취하는 방법이긴 하겠지.", --당근차
		CACTUS_TEA = "멕시코의 전통적인 차란다.", --선인차(Nopales Tea차가 실제 존재함)
		TOMATO_JUICE = "숙취 완화에 도움이 된단다.", --토마토 쥬스
		LUMPY_TEA = "풍토병 치료에 유효한 성분이 들어 있어.", --뿌리차
		SEAWEED_SHAKE = "매우 끈적끈적한 질감이구나.", --해초 쉐이크
		
		GREENTEA = "차의 원형에 가까운 형태란다.", --생잎 녹차
		BLACKTEA = "향긋한 차 한 잔에 좋은 책 한 권이 더해지면 오후가 즐겁지.", --홍차
		BLACKTEA_ICED = "기운이 솟는구나.", -- 홍차 아이스티
		FUER = "풍토병 치료에 도움이 되는 성분이 들어있단다.", --보이차,이파리차,고사리차
		MIXFLOWER = "여러 종류의 꽃들이 섞여있구나.", --잡 꽃잎 차
		HIBISCUSTEA = "무궁화속 꽃을 차로 만들었구나.", --히비스커스 차
		CACTUSFLOWER_TEA = "일부 지역에서는 건강에 좋다고 여기지.", --선인꽃차
		LOTUSTEA = "아시아에서는 귀하게 여겨지는 음료란다.", --연꽃차
		SUSHIBISCUS = "가만... 이건 히비스커스 차가 아니구나.", -- 자살차
		MOON_BLOSSOM_TEA = "보고만 있어도 차분해지는 것 같아.", --달꽃차
		MENTHA_SPICATA_TEA = "", -- 박하차

		CAFFEINBERRY_JUICE = "커피 한 잔과 책 한 권의 여유도 좋지.", -- 블랙 커피
        TOFFEE_LATTE = "고소한 향을 한껏 올렸구나.", --토피넛 라떼
		RUINCHA_LATTE = "커피와 초콜릿의 조합으로 모카 원두를 모방했구나.", --모카 라떼(커피+초코)
		
		HOTRUINCOLATE = "쇼콜라틀이 유럽으로 넘어오면서 변형된 음료란다.", --핫초코
		RUINCOLATE_SMOOTHIE = "차가운 초콜릿 음료로구나.", --초코 스무디(차가움)
		RUINXOCOLATL = "고대 아즈텍에서부터 유래된 음료지.", --쇼콜라틀(매캐함)
		TEA_RUINCOLATE_LATTE = "특이하게도 나쁘지 않은 조합이구나.", -- 말차 라떼

		MULLED = "연말의 즐거운 맛이 나는구나.", --뱅쇼
		BUTTERBEER = "고도로 발달한 과학은 마법과 구분할 수 없는 법이지.", --해리포터 시리즈의 버터비어

		APPLEPINE_JUICE = "너무 많이 마시면 입안이 헐 수 있으니 주의하렴.",
		APPLEPINE_SMOOTHIE = "",
		APPLEPINE_CAPPUCCINO = "",

		CITROYUZU_JUICE = "주스 하면 역시 오렌지 주스가 대표적이지.",
		CITROYUZU_TEA = "",
		EARLGREY_TEA = "",

		-- 콜라보 주전자 음료

		COCONUT_JUICE = "발효 과정에서 섬유질이 생성되었어.", --난파선 코코넛 쥬스
		RAINBOW_SHAKE = "흥미롭군, 생물발광을 그대로 유지하고 있구나.", --난파선 무지개 해파리 쉐이크
		QUARTZ_SHAKE = "이 생선죽의 효능에 관해서는 독자적으로 연구해 봐야겠어.", --난파선 광대 물고기 쉐이크
		NETTLE_TEA = "",
		FRASH_BRAMBLE_TEA = "",
		TUBER_BLOOM_TEA = "",
		CHERRY_ROSEBERRIES_TEA = "달콤하고 향긋하구나.", --체리숲 로즈힙 차
		CHERRY_HONEY_TEA = "몸이 따뜻해지는 효과가 있구나.", --체리숲 벚꽃꿀 차
		SWEET_RICE_DRINK = "효소에 의해 녹말이 엿당으로 분해되었어.", -- 비타협 식혜
		STRAWBERRY_SMOOTHIE = "마시는 딸기 샤베트라니, 흥미로워.", -- 모어 푸드 팩 딸기 스무디
		STRAWBERRY_MILK_SMOOTHIE = "마시는 딸기 샤베트에 우유를 더했구나.", -- 모어 푸드 팩 딸기 스무디 라떼

		--양조기 음료

		SPOILED_DRINK = "박테리아가 들끓고 있구나.", --썩은 음료

		-- 양조소다
	
		SODA = "소화에 도움이 된다고 알려져 있지.", -- 탄산수
		FRUITSODA = "과일즙을 첨가한 탄산수로구나.", -- 과일소다
		LIMONSODA = "단 걸 너무 많이 먹으면 치아에 안 좋단다.", -- 레몬 라임소다(과일소다 상위 호환)
		COLA = "최근 미국에서 인기를 끌고있는 음료이지.", -- 콜라(배경이 1907임 코카콜라가 존재함)
		COLAQUANTUM = "흠... 섭취 시의 부작용은 없는지 연구해 봐야겠구나.", --콜라 퀀텀(아직 체랜코프 현상이 발견 안됨(1911년도로 추정))
		LUMPY_BEER = "여러 뿌리채소가 섞여있구나.", --루트비어(술이 아님)
		APPLEPINESODA = "파인애플 과즙을 첨가한 탄산수구나.", -- 탄산 파인애플(오란씨)
		CITROYUZUSODA = "탄산수에 오렌지 과즙을 첨가했어.", -- 탄산 오랜지(환타)
		DAWN_FOG = "",
		MOON_CAP_DRINK = "",

		-- 양조주

		CORN_BEER = "고대 잉카로부터 유래한 음료란다.", -- 콘 맥주
		MADHU = "봉밀주는 인류가 최초로 만든 술이라고 알려져 있지.", --벌꿀주
		WINE = "원래 포도로 만들지만, 산딸기로 만든 와인에 대한 역사도 꽤 깊단다.", --와인 (그냥 베리 양조)
		NOBLEWINE = "이 깊은 단맛은 보트리티스 시네레아의 작용에 의한 거란다.", --노블 와인(구운 베리 양조)
		SPARKLINGWINE = "이산화탄소를 주입한 화이트 와인이구나.", --스파클링 와인
		GLOWBERRYWINE = "발광 성분은 발효 과정에서 손실되지 않았구나.", --글로우 베리 와인
		KUMIS = "중앙아시아의 전통주란다.", -- 크므즈,산양유주
		LUMPY_WINE = "아이슬란드에서 먹는 술이라고 하지.", --서주(감자 고구마등 뿌리 술)
		PULQUE = "메소아메리카 원주민들이 만드는 전통주란다.", --풀케(선인주)
		RUINCACAO_WINE = "술의 재료로는 대단히 특이한 선택이구나.", -- 카카오 와인 
		MIDNIGHT_STORM = "",
		APPLEPINE_CIDER = "",
		MENTHA_SPICATA_WINE = "",

		-- 콜라보 소다

		CHERRY_DOCTOR_COLA = "소화에 효능이 있을지도 모르겠구나.", --체리숲 닥터 페퍼(닥터 체리)
		STRAWBERRYSODA = "딸기 과즙으로 만든 탄산음료란다.", -- 탄산 딸기(웰치스 딸기)

		--콜라보 양조주

		AUROBOW = "이 음료가 빛나는 이유를 연구해 봐야겠구나.", -- 난파선 오로보우,무지개 해파리주
		COCONUT_WINE = "여러 열대 지역에서는 코코넛으로 술을 담근단다.", -- 난파선 코코넛 와인
		NETTLE_WINE = "",
		CHERRY_BLOOM_MADHU = "꽃꿀로 만든 술이구나. 색이 정말 인상적이야.", -- 체리숲 벚꽃꿀주
		GIANT_BLUEBERRY_WINE = "불안정성을 그대로 간직했구나.", -- 비타협 붐베리 와인(불 붙히면 폭발함)
		RICE_WINE = "곡류를 장기간 보관하는 방법 중 하나란다.", -- 비타협 막걸리
		WHEAT_BEER = "고대 이집트로부터 시작되었지.", -- 힙 오브 푸드 밀맥주
		PALE_BEER = "상면발효식 맥주의 한 종류란다.", -- 레기온 페일에일 (몬스트라 열매를 쓴 청록색 맥주)

		--증류주

		DISINFECTANT = "상처를 소독하는데 사용하는 에탄올이란다. 화학식으로는 C₂H₅OH이지.", -- 소독약
		CORN_WHISKEY = "미국에서는 켄터키 지방의 위스키가 유명하지.", -- 콘 위스키
		LUMPY_VODKA = "이름은 '생명의 물'에서 따 왔지만, 많이 먹으면 생명에 좋지는 않을 게야.", -- 보드카
		TEQUILA = "브랜디 대체품으로 만들었다고 하지.", -- 데킬라
		MADHU_RUM = "뱃사람들에게 사랑받는 음료지.", -- 럼주
		BERRY_BRANDY = "비싼 가격과 제조의 까다로움 때문에 '술의 제왕'이라 불리기도 한단다.", -- 베리 브랜디
		AREUHI = "마유주를 반복증류, 분별해서 불순물을 제거했단다.", -- 크므즈 증류주 아르히
		APPLEPINE_BRANDY = "",
		VOID_BRANDY = "",
		VOID_GIN  = "",
		CITROYUZU_CURACAO = "",
		MENTHA_SPICATA_CURACAO = "",

		--왈리 전용 증류주

		BERRY_GIN = "본래는 일종의 약용주였단다.", --진
		GLOWBERRY_GIN = "발효와 증류를 거쳐도 여전히 빛을 내는구나.", --글로우 베리 진
		ABSINTHE = "주정에 여러 허브들을 침출시켜 만드는 증류주란다.", -- 압생트
		TEA_LUMPY_VODKA = "흥미롭게도 향의 밸런스는 잡혀 있는것 같구나.", -- 녹차 리큐르
		PETALS_BERRY_BRANDY = "브랜디에 꽃향기를 더해 화려해 졌구나.", -- 장미향 브랜디
		KAHLUA = "커피향과 달콤한 맛이 자극적이구나.", -- 커피 리큐르 깔루아
		NUT_CORN_WHISKEY = "위스키의 바디감을 강조해 묵직함을 살려냈구나.", -- 너트 위스키
        RUINCACAO_CREAM_LIQUEUR = "위스키에 크림을 섞었다니 좀 특이하구나.", --베일리스 카카오 크림 리큐르
        RUMCHATA = "럼주에 크림을 섞어서 마시기 쉽게 만들었구나.", -- 럼차타(럼에 오우차타 라는 유제품 섞은)

		--콜라보 증류주

		MOONWAY = "증류를 거쳐도 발광이 남아있다니, 정말 놀라워!", -- 무지개 해파리주 증류주
		NETTLE_LIQUEUR = "",
		ARRACK = "남아시아 원주민들이 코코넛 꽃의 꿀을 이용해서 만든 증류주란다.", -- 아락 인도네시아 버전 코코넛 와인 증류주
		CHERRY_BLOOM_RUM = "아름답기도 하지만 작용기전에도 관심이 가는구나.", -- 체리 꿀주 증류주 벛꽃잎이 떠다니는 술
		RICE_SPIRITS = "사케와 비슷하구나.", --청주
		WHEAT_WHISKEY = "아일랜드나 스코틀랜드에서 만들기 시작했단다.", -- 밀 위스키
		PALE_WHISKEY = "위스키에 몬스테라 추출물을 첨가했구나.", -- 페일 몰트 위스키

		--왈리 전용 콜라보 증류주

		NUT_COCONUT_BRANDY = "카리브 해의 운치가 느껴지는 듯하구나.", -- 코코넛 브랜디 (캐러비안 럼을 만들수 없어서 카리브 브랜디 라는 이름으로 대체)
	    GIANT_BLUEBERRY_GIN = "증류 도중에 폭발하지 않은 게 이상할 정도구나.", -- 붐 베리 사파이어 (당근 폭발함)

		--냄비 요리

        DARK_RUINCOLATE = "당분과 유지방의 함량을 줄인 초콜릿이란다.", --다크 초콜릿.
        WHITE_RUINCOLATE = "카카오에서 카카오버터를 분리해 만든 것이란다.", --화이트 초콜릿
        RUINCOLATE = "초콜릿을 고형화한 것이란다.", -- 그냥 초콜릿
        RUIN_SCHOKAKOLA = "각성 효과가 강화된 초콜릿이란다.", -- 쇼카콜라
        APPLEPINE_PIE = "",
        APPLEPINE_FRIED_RICE = "",
        CITROYUZU_BBQ = "",

		BUCKET_STEEL_EMPTY = 
		{
			EMPTY = "금속 재질로 만들어진 동이란다.", --빈 양철 양동이
			FULL = "마실 수 있는 깨끗한 물이야.", -- 깨끗한 빗물이 참
			FULL_ICE = "작은 얼음 덩어리야.", --빗물이 얼어버림
			DIRTY = "미생물에 오염되었구나.", --빗물이 더러워짐
			DIRTY_ICE = "다량의 미생물을 포함한 얼음 덩어리야.", --더러운 빗물 얼어버림
		},

		BUCKET_WOODIE_EMPTY = 
		{
			EMPTY = "통나무로 만들어진 동이란다.", --우디의 빈 나무 양동이
			FULL = "마실 수 있는 깨끗한 물이야.", -- 깨끗한 빗물이 참
			FULL_ICE = "작은 얼음 덩어리야.", --빗물이 얼어버림
			DIRTY = "미생물에 오염되었구나.", --빗물이 더러워짐
			DIRTY_ICE = "다량의 미생물을 포함한 얼음 덩어리야.", --더러운 빗물 얼어버림
		},

		BUCKET_DRIFTWOOD_EMPTY = 
		{
			EMPTY = "유목으로 만들어진 동이란다.", -- 유목양동이
			FULL = "마실 수 있는 깨끗한 물이야.", -- 깨끗한 빗물이 참
			FULL_ICE = "작은 얼음 덩어리야.", --빗물이 얼어버림
			DIRTY = "미생물에 오염되었구나.", --빗물이 더러워짐
			DIRTY_ICE = "다량의 미생물을 포함한 얼음 덩어리야.", --더러운 빗물 얼어버림
		},

		BUCKET_EMPTY = 
		{
			EMPTY = "나무로 만들어진 동이란다.", -- 빈 나무 양동이
			FULL = "마실 수 있는 깨끗한 물이야.", -- 깨끗한 빗물이 참
			FULL_ICE = "작은 얼음 덩어리야.", --빗물이 얼어버림
			DIRTY = "미생물에 오염되었구나.", --빗물이 더러워짐
			DIRTY_ICE = "다량의 미생물을 포함한 얼음 덩어리야.", --더러운 빗물 얼어버림
		},

		DESALINATOR =
		{
			EMPTY = "바닷물을 증류하면 물에서 소금을 분리할 수 있지.", --제염기에 물이 없음
			PURIFY_LONG = "제염이 되려면 아직 멀었어.", -- 정수 끝나기까지 많이 남음
			PURIFY_SHORT = "제염이 거의 끝났구나!", -- 정수가 곧 끝남
			HASWATER = "순수한 물만 남았단다.", --제염기에 깨끗한 물이 있음
			BURNT = "이 상태에서는 제 기능을 할 수 없겠구나.",   --제염기가 타버림
			HASSALT = "소금이 충분히 모였구나.", --제염기에 소금이 남아 있음
		},

		BARREL =
		{
			GENERIC = "숯을 사용해서 미생물의 번식을 막는단다.", -- 물통 조사 대사
			BURNT = "오 이런, 물이 다 날아갔구나!", -- 물통이 타버림
		},

		BREWERY =
		{
			EMPTY = "술은 인류사 전체에서 우리와 함께했단다.", --양조기 조사 대사
			BURNT = "한동안 발효에 관한 연구는 미뤄야 겠어.", --양조기 타버림
			FERMENTING_LONG = "이제 발효 과정을 기다리자꾸나.", --양조 끝나기 까지 많이 남음
			FERMENTING_SHORT = "발효가 거의 완료되었구나!", --양조가 곧 끝남
			DONE = "멀리서도 향이 느껴지는구나.", --양조기에 음료가 들어있음
		},

		CAMPKETTLE_ITEM = "더러운 물을 가열하여 소독한단다.", --휴대 주전자 아이템 조사 대사
		CAMPKETTLE =
		{
			GENERIC = "비어 있구나.", -- 화덕에 건 휴대 주전자 안에 물이 없음
			BOILING_LONG = "소독이 되려면 아직 멀었어.", -- 물 끓이기 시작함
			BOILING_SHORT = "거의 다 소독되었구나!", -- 물 거의 다 끓음
			DONE = "음용할 수 있게 되었구나.", --깨끗한 물이 들음
			STOP = "주전자를 가열할 열원이 필요해.", --화덕에 불이 없어서 더러운물이 끓지 않는 상태
		},

		CAMPDESALINATOR_ITEM = "바닷물을 끓여서 수증기를 포집하는 장치란다.", --휴대 제염기 아이템 조사 대사
		CAMPDESALINATOR = 
		{
			GENERIC = "우선 정수할 바닷물이 있어야겠지.", --물 없음
			BOILING_LONG = "물이 아직 끓지 않는구나.", --물 끓이기 시작
			BOILING_SHORT = "물이 끓기 시작했구나!", --거의 다 끓음 
			DONE = "담수를 충분히 모았어.", -- 깨끗한 물이 들음
			STOP = "이 장치는 열원이 있어야 작동하는구나.", -- 화덕에 불이 없어서 소금물이 정수 되지 않는 상태
		},

		TEA_POT =
		{
			EMPTY = "주전자에는 물이 있어야겠지.", --빈 주전자 조사대사
			BURNT = "이제 정말 황량하구나.", --주전자가 불탐
			BOILING_LONG = "침출이 끝날때까지 조금 남았구나.", -- 음료를 만들기 시작한지 얼마 안됨
			BOILING_SHORT = "거의 다 됐단다!", --음료 조리가 거의 끝나감
			DONE = "다과를 즐기자꾸나.", --음료가 완성됨
			PURIFY_LONG = "소독이 될때까지 기다리자구나.", -- 더러운 물을 끓이기 시작한지 얼마 안됨
			PURIFY_SHORT = "거의 다 소독되었구나!", --더러운물을 거의 다 끓여감
			HASWATER = "재료가 필요하단다.", -- 깨끗한 물이 차 있는 상태
			MELT_LONG = "얼음은 녹여야 쓸 수 있겠지.", -- 얼음물을 녹이기 시작한지 얼마 안됨
			MELT_SHORT = "거의 다 녹았구나!", -- 얼음물을 거의 녹여감
		},

		PORTABLE_TEA_POT_ITEM =
		{
			GENERIC = "이제 어디서든 차를 마실 수 있겠구나.", -- 휴대용 주전자(아이템) 조사 대사
			EMPTY = "우선 물을 넣고 끓여야겠지.", -- 설치한 빈 휴대용 주전자 조사 대사
			BOILING_LONG = "인내는 미덕이란다!", -- 음료를 만들기 시작한지 얼마 안됨
			BOILING_SHORT = "금방 끝날거야!", --음료 조리가 거의 끝나감
			DONE = "기운이 솟는 향이로구나.", --음료가 완성됨
			PURIFY_LONG = "소독이 될때까지 기다리자구나.", -- 더러운 물을 끓이기 시작한지 얼마 안됨
			PURIFY_SHORT = "거의 다 소독되었구나!", --더러운물을 거의 다 끓여감
			HASWATER = "흠, 그럼 어디 차를 내리자꾸나.", -- 깨끗한 물이 차 있는 상태
			MELT_LONG = "얼음은 녹여야 쓸 수 있겠지.", -- 얼음물을 녹이기 시작한지 얼마 안됨
			MELT_SHORT = "거의 다 녹았구나!", -- 얼음물을 거의 녹여감
		},

		KETTLE =
		{
			EMPTY = "주전자에는 물이 있어야겠지.", --빈 주전자 조사대사
			BURNT = "이제 정말 황량하구나.", --주전자가 불탐
			DONE = "다과를 즐기자꾸나.", --음료가 완성됨
			PURIFY_LONG = "소독이 될때까지 기다리자구나.", -- 더러운 물을 끓이기 시작한지 얼마 안됨
			PURIFY_SHORT = "거의 다 소독되었구나!", --더러운물을 거의 다 끓여감
			HASWATER = "재료가 필요하단다.", -- 깨끗한 물이 차 있는 상태
			MELT_LONG = "얼음은 녹여야 쓸 수 있겠지.", -- 얼음물을 녹이기 시작한지 얼마 안됨
			MELT_SHORT = "거의 다 녹았구나!", -- 얼음물을 거의 녹여감
		},

		PORTABLEKETTLE_ITEM =
		{
			GENERIC = "이제 어디서든 차를 마실 수 있겠구나.", -- 휴대용 주전자(아이템) 조사 대사
			EMPTY = "우선 물을 넣고 끓여야겠지.", -- 설치한 빈 휴대용 주전자 조사 대사
			DONE = "기운이 솟는 향이로구나.", --음료가 완성됨
			PURIFY_LONG = "소독이 될때까지 기다리자구나.", -- 더러운 물을 끓이기 시작한지 얼마 안됨
			PURIFY_SHORT = "거의 다 소독되었구나!", --더러운물을 거의 다 끓여감
			HASWATER = "흠, 그럼 어디 차를 내리자꾸나.", -- 깨끗한 물이 차 있는 상태
			MELT_LONG = "얼음은 녹여야 쓸 수 있겠지.", -- 얼음물을 녹이기 시작한지 얼마 안됨
			MELT_SHORT = "거의 다 녹았구나!", -- 얼음물을 거의 녹여감
		},
		
		DISTILLERS =
		{   
		    EMPTY = "양조주를 증류하여 증류주나 리큐르로 만든단다.", --증류기 조사 대사
			DISTILLING_LONG = "분별 증류가 진행 중이구나.", --증류가 끝나기 까지 많이 남음
			DISTILLING_SHORT = "증류가 거의 끝났단다!", --증류가 곧 끝남
			DONE = "어디 결과물을 확인해 보자꾸나.", --증류기에 음료가 들어있음
		},

		WELL_WATERPUMP = {
			HIGH_PRESSURE = "압력이 매우 충분하구나.", -- 압력 최대
			MIDDLE_PRESSURE = "압력이 적당하단다.", -- 압력이 중간
			LOW_PRESSURE = "압력이 매우 낮구나.", -- 압력이 거의 없을때
			RECHARG_PRESSURE = "압력이 다시 모일 때까지 시간이 걸릴 게야.", -- 압력이 아예 없을때(여기까지 쓰면 압력이 최대가 될때까지 못씀.)
		},
		
		WELL_SPRINKLER =
		{ 
			LOWFUEL = "연료가 부족하구나.", -- 연료가 거의 없는 상태에서의 조사 대사
			ON = "방수 대책 없이는 가까이 가지 않는 게 좋을 게다.", -- 작동중임
			OFF = "주변이 촉촉해지도록 물을 뿌려준단다.", --작동을 멈춘상태에서의 조사 대사
		},	
	},
}