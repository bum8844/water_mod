return {
	ACTIONFAIL =
	{
		GIVE =
		{
			WELL_NOTEMPTY = "", -- 우물에 말라 빈 양동이 달려있는데 양동이 달려 함
			WELL_BUSY = "", -- 우물에 물 든 양동이 달려있는데 달려 함
		}
	},

	ANNOUNCE_DRUNK = "아이고 이런, 몸을 못 가누겠네!", -- 취함
	ANNOUNCE_DRUNK_END = "더는 낭비할 시간이 없어!", --술에서 좀 깸 (그로기)
	ANNOUNCE_DRUNK_IMMUNITY = "", --임시. 위그 전용,
	ANNOUNCE_NOTCHARGE = "현 시상에서는 우유를 가지고 있지 않아.", -- 시상 = (時相)
	ANNOUNCE_NOTHIRSTSLEEP = "빨리 마실 것 부터 찾아야 해.", -- 목이 마른데 밤에 잘려고 시도
	ANNOUNCE_NOTHIRSTSIESTA = "빨리 마실 것 부터 찾아야 해.", -- 목이 마른데 낮에 잘려고 시도
	ANNOUNCE_SLEEP_END = "아이고야, 내가 지금 어느 시상에 서 있지?", --자고 일어나서 술에서 완전히 깸 
	ANNOUNCE_THIRST = "내가 뭘 마신지가 얼마나 됐더라?", --너무 목말라!

    ANNOUNCE_CAFFINE_BUFF_START = "훌룡해, 시간을 쫒을수 있을것 같아!" , -- 카페인 버프 시작
    ANNOUNCE_CAFFINE_BUFF_STOP = "젠장! 시간이 다시 가속하고 있어!" ,  -- 카페인 버프 끝
    
    ANNOUNCE_CURE_WATERBORNE = "이제야 겨우 배꼽시계를 고쳤어." ,  -- 수인성 질병을 아이템으로 치료했을때의 대사

	ANNOUNCE_DCAPACITY_CRITICAL = "시류가 가속하고 있어!", --취하기 직전 (시류(時流) = 시간의 흐름)
	ANNOUNCE_DCAPACITY_HALF = "취기가 돌아서 차분해 지는군.", -- 취기가 돌기 시작

	DESCRIBE =
	{
		BOILBOOK = "물 끓일 시간도 아까운데 언제 다과를 생각할 여유가 있겠냐!",

		WATER_CLEAN_ICE = "이걸 어느 세월에 녹여 먹지?",--깨끗한 얼음물
		WATER_DIRTY_ICE = "차라리 새 얼음을 구해 먹는게 빠르겠어!", --더러운 얼음물

		SPICE_CAFFEINPEPPER = "마리네이드 할 여유가 좀 있었으면." --후추 향신료

		WELL_KIT = "손에 들고 있다고 해서 물이 저절로 생기진 않아, 설치해야 해!", --우물 키트
		WELL_SPRINKLER_KIT = "이제 물 뿌릴 시간을 아낄수 있어.", --스프링클러 키트
		WELL_WATERPUMP_KIT = "시간낭비 없이 지하수를 얻을수 있겠어.", --스팀 물펌프 키트
		WELL_BURYING_KIT = "아이고야, 이게 무슨 또 시간낭비람.", -- 구멍 매설 키트
		WELL_DRILLING = "스스로 알아서 할거야, 내 시간을 아끼자.", --드릴로 구멍 뚫는 중
		WELL_DRILLING_ITEM = "지하수 팔 곳부터 정해야 겠어.", --드릴 아이템
		HOLE = "빠지면 나오는데 한 세월이 걸릴거야.", --우물 구멍
		WELL = "보고 있다고 물이 솟아나진 않아, 도구가 필요해!", --우물

		-- 물 모드 식물

		TEA_TREE = "이 나무는 성장 한계점을 맞이했어.",--차나무
		DUG_TEA_TREE = "딸시간 없어, 그냥 통째로 가져갈거야!", --땅에서 파낸 차나무
		TEA_SEED = "때 되면 새 나무가 될거야.", -- 차나무 열매
		TEA_SEED_COOKED = "이건 먹히거나 썩는 미래 외에는 존재하지 않아.", --구운 차나무 열매
		TEA_SEED_SAPLING = "이 녀석, 일부러 화 돋구러고 느리게 자라는것 같아.", --차나무 새싹
		TEALEAVES = "따낸 찻잎이야", --찻잎
		TEALEAVES_DRIED = "말린 찻잎이야.", --말린 찻잎

		CAFFEINBERRY = "매달린 외계덩쿨의 과거 시상이야.", --커피 덤불 (산소미포함의 꼬집 후추풀 오마주)
		DUG_CAFFEINBERRY = "가져가기만 한다면 쉴 시간을 아낄수 있겠지.", --파낸 커피덤불
		CAFFEINBERRY_BEAN = "커피와 후추의 상태가 중첩되어 있어.", --생 커피콩
		CAFFEINBERRY_BEAN_COOKED = "바로 먹을수도 있겠지만, 먼저 시상을 고정시킬수 있겠지.", --구운 커피콩

		RUINCACAO_TREE = "뒤틀린 시간선 만큼이나 들짝날쭉해.", --카카오 나무
		DUG_RUINCACAO_TREE = "딸시간 없어, 그냥 통째로 가져갈거야!", --파낸 카카오 나무
		RUINCACAO_SEED = "새 생명이 작게 피어나고 있어.", --카카오 새싹 아이템
		RUINCACAO_SEED_SAPLING = "이 녀석, 일부러 화 돋구러고 느리게 자라는것 같아.", -- 카카오 새싹 심은거
		RUINCACAO = "까보기 전엔 열매인지 숯 인지 알 수 없지.", --부수기 전 카카오 열매
		RUINCACAO_BEAN = "그냥 먹으면 속이 뒤집어 질거야.", --부순 후 카카오 콩  
		RUINCACAO_BEAN_COOKED = "이게 시간낭비 아닌가 모르겠네.", --구운 카카오 콩

		-- 증류주 첨가제

		ADDITIVE_SEED = "장래가 주당인 꿈나무들이로군.", -- 리큐르에 제조에 첨가 할 씨허브(아니스,쥬니퍼베리,팔각 모티브)첨가제 
		ADDITIVE_PETALS = "영원한 아름다움을 갈망하는 늙어버린 꽃잎사귀 뭉치야.", -- 리큐르에 제조에 첨가 할 허브,녹차,꽃잎 첨가제
		ADDITIVE_NUT = "그대로 입에 털어 넣어버리면 안될까?", -- 리큐르에 제조에 첨가 할 버치넛,코코넛,커피콩,카카오콩 첨가제
		ADDITIVE_DAIRY = "마시기 편해지면 그만큼 빨리 마실수 있겠지.", -- 리큐르에 제조에 첨가할 유제품 첨가제

		-- 음료

		WATER_CLEAN = "시간상으로 순수한 물이야.", --깨끗한 물
		WATER_DIRTY = "정 당장 급하다면..!", --더러운 물
		WATER_SALTY = "미래의 구름과 불순물이 섞여있어.", --바닷물

		GOOPYDRINK = "아이고야, 내가 너무 성급했네!", --실패한 음료(웻 굽 개념)
		
		-- 주전자 음료

		FRUITJUICE = "훌룡해, 여러 과일을 단숨에 들이킬수 있어.", --잡 과일쥬스
		BERRIES_JUICE = "그냥 따서 먹는게 빠르지 않나?", -- 베리 쥬스
		POMEGRANATE_JUICE = "이제 씨앗째로 전부 들이킬수 있어.", -- 석류 쥬스
		BANANA_JUICE = "따뜻하면 목 매이는데.", -- 바나나 쥬스
		FIG_JUICE = "달콤함의 정수야!", -- 무화과 쥬스
		DRAGONJUICE = "이건 확실해, 과일쥬스야.", --용과 쥬스
		GLOWBERRYJUICE = "정말 맛있고 쓸모 있는 쥬스야!", -- 발광베리 쥬스
		WATERMELON_JUICE = "정말 시원하네!", --수박 쥬스

		VEGGIE_TEA = "혀 끝에 닿을때마다 나는 쓴맛을 참을수가 없어!", --녹즙
		CARROT_TEA = "얼른 들이키자.", --당근차
		CACTUS_TEA = "소화는 잘 되겠네.", --선인차
		TOMATO_JUICE = "부드럽, 빨리 마시기 좋아.", --토마토 쥬스
		LUMPY_TEA = "차 한잔 할 여유는 없다만.." --뿌리차,
		SEAWEED_SHAKE = "시간대비 손해 본 것 같은데.", --해초 쉐이크
		
		GREENTEA = "차를 가릴 여유따윈 없어.", --생잎 녹차
		BLACKTEA = "정말 한번 정도는 다과를 즐겨도 되지 않을까?", --홍차
		BLACKTEA_ICED = "시원한 거 한 모금은 좋지.", -- 홍차 아이스티
		FUER = "진짜 가끔은 차 한잔 정도는 음미 해 봐도 좋겠지.", --보이차,이파리차,고사리차
		MIXFLOWER = "아주 멱살잡고 꽃향기를 맡게 해주네.", --잡 꽃잎 차
		HIBISCUSTEA = "이건 왜 이렇게 시어?", --히비스커스 차
		CACTUSFLOWER_TEA = "꽃 향기를 느낄 여운은 없어.", --선인꽃차
		LOTUSTEA = "과거에 꽃이 였거나 혹은 물고기 였을거야.", --연꽃차
		SUSHIBISCUS = "차를 가릴 여유따윈-- 아니, 이건 또 뭐야?", -- 자살차
		MOON_BLOSSOM_TEA = "뭔지 모를 차 지만 고민할 시간이 아까워.", --달꽃차

		CAFFEINBERRY_JUICE = "공방에서 밤 새고 집 돌아가기에 완벽해.", -- 블랙 커피
        TOFFEE_LATTE = "커피이자 디저트야.", --토피넛 라떼
		RUINCHA_LATTE = "고민할 시간을 아꼈어.", --모카 라떼(커피+초코)
		
		HOTRUINCOLATE = "따뜻함과 달콤함이 가득해.", --핫초코
		RUINCOLATE_SMOOTHIE = "차가움과 달콤함이 가득해.", --초코 스무디(차가움)
		RUINXOCOLATL = "진짜로 이상한데, 다른 시간선의 지식이 보여!", --쇼콜라틀(매캐함)
		TEA_RUINCOLATE_LATTE = "내 입맛에 잘 맞네!", -- 말차 라떼

		MULLED = "앓아 누웠던게 언제였는지...", --뱅쇼
		BUTTERBEER = "밥 먹을 시간을 아끼겠어.", --해리포터 시리즈의 버터비어 

		-- 콜라보 주전자 음료

		COCONUT_JUICE = "속이 비어있는 부분만큼 젤리로 바꿔 보상했네.", --난파선 코코넛 쥬스
		RAINBOW_SHAKE = "효율적이야!", --난파선 무지개 해파리 쉐이크
		QUARTZ_SHAKE = "적어도 씹을 시간은 아꼈네.", --난파선 광대 물고기 쉐이크
		CHERRY_ROSEBERRIES_TEA = "가끔은 꽃보면서 차 한잔 하는것도 좋을지도 모르지..", --체리숲 로즈힙 차
		CHERRY_HONEY_TEA = "고급스러우면서 따뜻해.", --체리숲 벚꽃꿀 차
		SWEET_RICE_DRINK = "이 씨앗은 먹으러면 뭐가 이렇게 시간을 쓰는지..", -- 비타협 식혜
		PINEANANAS_JUICE = "과일이 왕관을 쓴 만큼이나 맛있고 상쾌해.", -- 레기온 파인애플 주스
		ORANGE_JUICE = "밥먹고 입가심 해야지.", -- 모어 푸드 팩 오랜지 주스
		STRAWBERRY_SMOOTHIE = "급하게 들이키다 체하겠어.", -- 모어 푸드 팩 딸기 스무디
		STRAWBERRY_MILK_SMOOTHIE = "멋진 디저트네!", -- 모어 푸드 팩 딸기 스무디 라떼

		--양조기 음료

		SPOILED_DRINK = "음료 였던거야.", --썩은 음료 (주식 할떄 그 주)

		-- 양조소다
	
		SODA = "고작 물에 기포 좀 넣겠다고 이 고생을 한 건 아니겠지.", -- 탄산수
		FRUITSODA = "", -- 과일소다
		LEMONLIMESODA = "", -- 레몬 라임소다(과일소다 상위 호환)
		COLA = "", -- 콜라
		COLAQUANTUM = "본적이 있어!" --콜라 퀀텀
		LUMPY_BEER = "", --루트비어(술이 아님)

		-- 양조주

		CORN_BEER = "", -- 콘 맥주
		MADHU = "", --벌꿀주
		WINE = "", --와인 (그냥 베리 양조)
		NOBLEWINE = "", --노블 와인(구운 베리 양조)
		SPARKLINGWINE = "", --스파클링 와인
		GLOWBERRYWINE = "", --글로우 베리 와인
		KUMIS = "", -- 크므즈,산양유주
		LUMPY_WINE = "", --서주(감자 고구마등 뿌리 술)
		PULQUE = "", --풀케(선인주)
		RUINCACAO_WINE = "", -- 카카오 와인 

		-- 콜라보 소다

		CHERRY_DOCTOR_COLA = "", --체리숲 닥터 페퍼(닥터 체리)
		PINEANANASSODA = "", -- 탄산 파인애플(오란씨)
		ORANGESODA = "", -- 탄산 오랜지(환타)
		STRAWBERRYSODA = "", -- 탄산 딸기(웰치스 딸기)

		--콜라보 양조주

		AUROBOW = "", -- 난파선 오로보우,무지개 해파리주
		COCONUT_WINE = "", -- 난파선 코코넛 와인
		CHERRY_BLOOM_MADHU = "", -- 체리숲 벚꽃꿀주
		GIANT_BLUEBERRY_WINE = "", -- 비타협 붐!베리 사파이어(불 붙히면 폭발함)
		RICE_WINE = "", -- 비타협 막걸리
		WHEAT_BEER = "", -- 힙 오브 푸드 밀맥주
		PALE_BEER = "", -- 레기온 페일에일 (몬스트라 열매를 쓴 청록색 맥주)

		--증류주

		DISINFECTANT = "", -- 소독약
		CORN_WHISKEY = "", -- 콘 위스키
		LUMPY_VODKA = "", -- 보드카
		TEQUILA = "", -- 데킬라
		MADHU_RUM = "", -- 럼주
		BERRY_BRANDY = "", -- 베리 브랜디
		AREUHI = "", -- 크므즈 증류주 아르히

		--왈리 전용 증류주

		BERRY_GIN = "", --진
		GLOWBERRY_GIN = "", --글로우 베리 진
		ABSINTHE = "", -- 압생트
		TEA_LUMPY_VODKA = "", -- 보드카
		PETALS_BERRY_BRANDY = "", -- 장미향 브랜디
		KAHLUA = "", -- 커피 리큐르 깔루아
		NUT_CORN_WHISKY = "", -- 너트 위스키
        RUINCACAO_CREAM_LIQUEUR = "", --베일리스 카카오 크림 리큐르
        RUMCHATA = "", -- 럼차타(럼에 오우차타 라는 유제품 섞은)

		--콜라보 증류주

		MOONWAY = "", -- 무지개 해파리주 증류주
		ARRACK = "", -- 아락 인도네시아 버전 코코넛 와인 증류주
		CHERRY_BLOOM_RUM = "", -- 체리 꿀주 증류주 벛꽃잎 떠다
		RICE_SPIRITS = "", --청주
		WHEAT_WHISKEY = "", -- 밀 위스크
		PALE_WHISKEY = "", -- 페일 몰트 위스키

		--왈리 전용 콜라보 증류주

		NUT_COCONUT_BRANDY = "", -- 코코넛 브랜디 (캐러비안 럼을 만들수 없어서 카리브 브랜디 라는 이름으로 대체)
	    GIANT_BLUEBERRY_GIN = "", -- 붐 베리 사파이어 (당근 폭발함)

		--냄비 요리

        DARK_RUINCOLATE = "왈리가 이 간식의 비밀을 이해하고 있는걸까?", --다크 초콜릿.
        WHITE_RUINCOLATE = "", --화이트 초콜릿
        RUINCOLATE = "", -- 그냥 초콜릿
        RUIN_SCHOKAKOLA = "", -- 쇼카콜라

		BUCKET_STEEL_EMPTY = 
		{
			EMPTY = "", --빈 양철 양동이
			FULL = "", -- 깨끗한 빗물이 참
			FULL_ICE = "", -- 빗물이 얼어버림
			DIRTY = "", --빗물이 더러워짐
			DIRTY_ICE = "", --더러운 빗물이 얼어버림
		},

		BUCKET_WOODIE_EMPTY = 
		{
			EMPTY = "", --우디의 빈 나무 양동이
			FULL = "",  --깨끗한 빗물이 참
			FULL_ICE = "", --빗물이 얼어버림
			DIRTY = "", --빗물이 더러워짐
			DIRTY_ICE = "", --더러운 빗물 얼어버림
		},

		BUCKET_EMPTY = 
		{
			EMPTY = "", -- 빈 나무 양동이
			FULL = "", -- 깨끗한 빗물이 참
			FULL_ICE = "", --빗물이 얼어버림
			DIRTY = "", --빗물이 더러워짐
			DIRTY_ICE = "", --더러운 빗물 얼어버림
		},

		DESALINATOR =
		{
			EMPTY = "", --제염기에 물이 없음
			PURIFY_LONG = "", -- 정수 끝나기까지 많이 남음
			PURIFY_SHORT = "", -- 정수가 곧 끝남
			HASWATER = "", --제염기에 깨끗한 물이 있음
			BURNT = "",   --제염기가 타버림
			HASSALT = "", --제염기에 소금이 남아 있음
		},

		BARREL =
		{
			GENERIC = "", -- 물통 조사 대사
			BURNT = "", -- 물통이 타버림
		},

		BREWERY =
		{
			EMPTY = "", --양조기 조사 대사
			BURNT = "", --양조기 타버림
			FERMENTING_LONG = "", --양조 끝나기 까지 많이 남음
			FERMENTING_SHORT = "", --양조가 곧 끝남
			DONE = "", --양조기에 음료가 들어있음
		},

		CAMPKETTLE_ITEM = "", --휴대 주전자 아이템 조사 대사
		CAMPKETTLE =
		{
			GENERIC = "", -- 화덕에 건 휴대 주전자 안에 물이 없음
			BOILING_LONG = "", -- 물 끓이기 시작함
			BOILING_SHORT = "", -- 물 거의 다 끓음
			DONE = "", --깨끗한 물이 들음
			STOP = "", --화덕에 불이 없어서 더러운물이 끓지 않는 상태
		},

		CAMPDESALINATOR_ITEM = "", --휴대 제염기 아이템 조사 대사
		CAMPDESALINATOR = 
		{
			GENERIC = "", --물 없음
			BOILING_LONG = "", --물 끓이기 시작
			BOILING_SHORT = "", --거의 다 끓음 
			DONE = "", -- 깨끗한 물이 들음
			STOP = "", -- 화덕에 불이 없어서 소금물이 정수 되지 않는 상태
		},

		KETTLE =
		{
			EMPTY = "", --빈 주전자 조사대사
			BURNT = "", --주전자가 불탐
			BOILING_LONG = "", -- 음료를 만들기 시작한지 얼마 안됨
			BOILING_SHORT = "", --음료 조리가 거의 끝나감
			DONE = "", --음료가 완성됨
			PURIFY_LONG = "", -- 더러운 물을 끓이기 시작한지 얼마 안됨
			PURIFY_SHORT = "", --더러운물을 거의 다 끓여감
			HASWATER = "", -- 깨끗한 물이 차 있는 상태
			MELT_LONG = "", -- 얼음물을 녹이기 시작한지 얼마 안됨
			MELT_SHORT = "", -- 얼음물을 거의 녹여감
		},

		PORTABLEKETTLE_ITEM =
		{
			GENERIC = "", -- 휴대용 주전자(아이템) 조사 대사
			EMPTY = "", -- 설치한 빈 휴대용 주전자 조사 대사
			BOILING_LONG = "", -- 음료를 만들기 시작한지 얼마 안됨
			BOILING_SHORT = "", --음료 조리가 거의 끝나감
			DONE = "", --음료가 완성됨
			PURIFY_LONG = "", -- 더러운 물을 끓이기 시작한지 얼마 안됨
			PURIFY_SHORT = "", --더러운물을 거의 다 끓여감
			HASWATER = "", -- 깨끗한 물이 차 있는 상태
			MELT_LONG = "", -- 얼음물을 녹이기 시작한지 얼마 안됨
			MELT_SHORT = "", -- 얼음물을 거의 녹여감
		},
		
		DISTILLERS =
		{   
		    EMPTY = "시간을 투자해서 음료를 만들지.", --증류기 조사 대사
			DISTILLTING_LONG = "", --증류가 끝나기 까지 많이 남음
			DISTILLING_SHORT = "", --증류가 곧 끝남
			DONE = "", --증류기에 음료가 들어있음
		},

		WELL_WATERPUMP = {
			HIGH_PRESSURE = "", -- 압력 최대
			MIDDLE_PRESSURE = "", -- 압력이 중간
			LOW_PRESSURE = "", -- 압력이 거의 없을때
			RECHARG_PRESSURE = "", -- 압력이 아예 없을때(여기까지 쓰면 압력이 최대가 될때까지 못씀.)
		},
		
		WELL_SPRINKLER =
		{ 
			LOWFUEL = "", -- 연료가 거의 없는 상태에서의 조사 대사
			ON = "", -- 작동중임
			OFF = "", --작동을 멈춘상태에서의 조사 대사
		},	
	},
}