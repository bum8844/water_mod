return {
	ACTIONFAIL =
	{
		GIVE =
		{
			WELL_NOTEMPTY = "일단 있는것부터 치워야지.", -- 우물에 말라 빈 양동이 달려있는데 양동이 달려 함
			WELL_BUSY = "우물쭈물하고 있는게 맘에 안들어!", -- 우물에 물 든 양동이 달려있는데 달려 함
		}
	},

	ANNOUNCE_DRUNK = "흐헤헤... 아이 좋다...",
	ANNOUNCE_DRUNK_END = "으...몸이 식고 있어.", --술에서 좀 깸 (그로기)
	ANNOUNCE_DRUNK_IMMUNITY = "", --임시. 위그 전용,
	ANNOUNCE_NOTCHARGE = "어머, 너 젖이 안나오는구나.", --번개염소가 충전이 안되서 양동이로 젖을 짤수 없음
	ANNOUNCE_NOTHIRSTSLEEP = "자고 싶은데 목이 너무 타!", -- 목이 마른데 밤에 잘려고 시도
	ANNOUNCE_NOTHIRSTSIESTA = "쉬고 싶은데 목이 너무 타!", -- 목이 마른데 낮에 잘려고 시도
	ANNOUNCE_SLEEP_END = "좋아. 또 마셔야 겠어.", --자고 일어나서 술에서 완전히 깸 
	ANNOUNCE_THIRST = "왜 내 목은 내화성이 아닐까?", --너무 목말라!

	ANNOUNCE_DCAPACITY_CRITICAL = "아~ 왠지 고양되는데?", --취하기 직전
	ANNOUNCE_DCAPACITY_HALF = "불은 안보이는데 따듯해!", -- 취기가 돌기 시작

	ANNOUNCE_CAFFINE_BUFF_START = "왠지 불태우기 좋은 기분이야." , -- 카페인 버프 시작
    ANNOUNCE_CAFFINE_BUFF_STOP = "좋아, 내일로 미루자." ,  -- 카페인 버프 끝

    ANNOUNCE_CURE_WATERBORNE = "그건 정말이지 끔찍했어." , -- 수인성 질병을 아이템으로 치료했을때의 대사

	DESCRIBE =
	{
		BOILBOOK = "하나도 재미없을것 같아.",

		WATER_CLEAN_ICE = "참 차갑기도 해라.",--깨끗한 얼음물
		WATER_DIRTY_ICE = "너 정말 못생겼구나.", --더러운 얼음물

		SPICE_CAFFEINPEPPER = "맘에 안드는 사람 코에서 불을 뿜게 만들어봐야겠어.", --후추 향신료

		WELL_KIT = "나 혼자 이걸 다 설치하라고?", --우물 키트
		WELL_SPRINKLER_KIT = "뭐? 나 보고 이걸 설치하라고?", --스프링클러 키트
		WELL_WATERPUMP_KIT = "나 기계조립 같은거 잘 못한단 말이야.", --스팀 물펌프 키트
		WELL_BURYING_KIT = "잘 됬네. 마침 물 소리가 거슬렀어.", -- 구멍 매설 키트
		WELL_DRILLING = "불을 붙히면 좀 조용해질까?", --드릴로 구멍 뚫는 중
		WELL_DRILLING_ITEM = "이걸로 불은 못 붙히는거야?", --드릴 아이템
		HOLE = "절대로 빠지지 않을거야.", --우물 구멍
		WELL = "'우물'이 있으면 '좌불'도 있어야 하는거 아니야? ", --우물

		WX78MODULE_NONEDRUNK = "야 WX, 화염방사기 설치해보는 건 어때?", -- 78전용 묘듈

		-- 물 모드 식물

		TEA_TREE = "너 정말 잘 타게 생겼다?",--차나무
		DUG_TEA_TREE = "불을 붙히면 더 예쁠거야.", --땅에서 파낸 차나무
		TEA_SEED = "안녕 나무 씨앗아.", -- 차나무 열매
		TEA_SEED_COOKED = "이제 나무는 못 되는 거네?", --구운 차나무 열매
		TEA_SEED_SAPLING = "곧 진짜 나무가 될수 있을거야.", --차나무 새싹
		TEALEAVES = "태우면 좋은향이 날것 같네.", --찻잎
		TEALEAVES_DRIED = "땔감으로 쓰기 딱 좋아보이네.", --말린 찻잎

		CAFFEINBERRY = "이번엔 차가운 달에서 널 보네.", --커피 덤불
		DUG_CAFFEINBERRY = "이제 내가 널 어떻게 해줄까?", --파낸 커피덤불
		CAFFEINBERRY_BEAN = "결국 불 속에 넣어야 하는건 똑같네.", --생 커피콩
		CAFFEINBERRY_BEAN_COOKED = "아, 향긋한걸?", --구운 커피콩

		RUINCACAO_TREE = "보아하니 너도 불이랑 친구 먹었구나?", --카카오 나무
		DUG_RUINCACAO_TREE = "왜 그래, 흙이 없어서 그래?", --파낸 카카오 나무
		RUINCACAO_SEED = "벌써 예쁜 꽃이 폈잖아?", --카카오 새싹 아이템
		RUINCACAO_SEED_SAPLING = "무럭 무럭 자라럼.", -- 카카오 새싹 심은거
		RUINCACAO = "흐음- 스모키해.", --부수기 전 카카오 열매
		RUINCACAO_BEAN = "너도 결국 불의 도움이 필요하구나?", --부순 후 카카오 콩  
		RUINCACAO_BEAN_COOKED = "하- 향긋해라.", --구운 카카오 콩

		-- 증류주 첨가제

		ADDITIVE_SEED = "지루하기 짝이없는 씨앗들이야.", -- 리큐르에 제조에 첨가 할 씨허브(아니스,쥬니퍼베리,팔각 모티브)첨가제 
		ADDITIVE_PETALS = "잘 타는걸 모아 놨네.", -- 리큐르에 제조에 첨가 할 허브,녹차,꽃잎 첨가제
		ADDITIVE_NUT = "태우면 더 고소할것 들이야.", -- 리큐르에 제조에 첨가 할 버치넛,코코넛,커피콩,카카오콩 첨가제
		ADDITIVE_DAIRY = "술에 우유는 왜?", -- 리큐르에 제조에 첨가할 유제품 첨가제

		-- 음료

		WATER_CLEAN = "내가 다 마셔서 없에버려야겠어.", --깨끗한 물
		WATER_DIRTY = "응, 아니야.", --더러운 물
		WATER_SALTY = "세상엔 물이 왜 이리 많을까?", --바닷물

		GOOPYDRINK = "차라리 불속에 넣었으면 이렇게될일은 없었잖아.", --실패한 음료(웻 굽 개념)
		
		-- 주전자 음료

		FRUITJUICE = "과일은 그냥 그대로 먹지 그래?", --잡 과일쥬스
		BERRIES_JUICE = "새 빨갛게 우려냈네", -- 베리 쥬스
		POMEGRANATE_JUICE = "빨간게 맛 없을리가 없지.", -- 석류 쥬스
		BANANA_JUICE = "이거 껍질 채로 우려낸거야?", -- 바나나 쥬스
		FIG_JUICE = "물을 쓰니깐 당연히 더 별로야.", -- 무화과 쥬스
		DRAGONJUICE = "불같은 과일을 왜 물에 넣었어?", --용과 쥬스
		GLOWBERRYJUICE = "물이 빛나다니 진짜 이상해.", -- 발광베리 쥬스
		WATERMELON_JUICE = "물이 너무 많아서 '강'박적이야.", --수박 쥬스

		VEGGIE_TEA = "안, 마실래.", --녹즙
		CARROT_TEA = "우웩. 당근를 물에넣고 끓인거야?", --당근차
		CACTUS_TEA = "완전 물컹거려.", --선인차
		TOMATO_JUICE = "적어도 내 손에 과즙이 튈일은 없겠네.", --토마토 쥬스
		LUMPY_TEA = "차라리 구워 먹는게 낫겠어.", --뿌리차
		SEAWEED_SHAKE = "더 나빠졌잖아!", --해초 쉐이크
		
		GREENTEA = "그냥 이파리 우린 물이잖아.", --생잎 녹차
		BLACKTEA = "아무 잎이나 우러서 되는게 아니라고? 어쩌라구.", --홍차
		BLACKTEA_ICED = "왜 얼음을 못 넣어서 안달이지?", -- 홍차 아이스티
		FUER = "차는 다 똑같은거 아니야?", --보이차,이파리차,고사리차
		MIXFLOWER = "적어도 물이 좀 더 향긋해 졌네.", --잡 꽃잎 차
		HIBISCUSTEA = "이거 시큼한데 맛있네.", --히비스커스 차
		CACTUSFLOWER_TEA = "그냥 또 다른 꽃 차야.", --선인꽃차
		LOTUSTEA = "물속으로 돌아갔으니깐 만족했을거야.", --연꽃차
		SUSHIBISCUS = "누구 식탁위에 올려볼까?", -- 자살차
		MOON_BLOSSOM_TEA = "이건 좀 인상적이네.", --달꽃차

		CAFFEINBERRY_JUICE = "갑자기 의욕이 생기네?", -- 블랙 커피
        TOFFEE_LATTE = "고소한 견과류가 같히 씹히는걸?", --토피넛 라떼
		RUINCHA_LATTE = "씁쓸하면서도 달콤하네.", --모카 라떼(커피+초코)
		
		HOTRUINCOLATE = "초콜릿도 뜨겁게 마시면 더 맛있어.", --핫초코
		RUINCOLATE_SMOOTHIE = "차가우면 덜 달게 느껴진단 말이야.", --초코 스무디(차가움)
		RUINXOCOLATL = "음료인데 불향이 가득한게 정말 맘에 드네.", --쇼콜라틀(매캐함)
		TEA_RUINCOLATE_LATTE = "왜 핫초코에 잎을 갈아넣은거야?", -- 말차 라떼

		MULLED = "아, 뱃속에 난로 켜둔것 같아.", --뱅쇼
		BUTTERBEER = "불을 붙힐수 있을것 같은데, 한 번 해볼까?", --해리포터 시리즈의 버터비어

		-- 콜라보 주전자 음료

		COCONUT_JUICE = "이제 뭔가 음식같긴 하네.", --난파선 코코넛 쥬스
		RAINBOW_SHAKE = "물을 이상하게 빛나게 만들었네.", --난파선 무지개 해파리 쉐이크
		QUARTZ_SHAKE = "물과 물고기의 환장의 콜라보네.", --난파선 광대 물고기 쉐이크
		CHERRY_ROSEBERRIES_TEA = "그래, 향긋해라.", --체리숲 로즈힙 차
		CHERRY_HONEY_TEA = "거 색깔은 예쁘네.", --체리숲 벚꽃꿀 차
		SWEET_RICE_DRINK = "난 구운쪽이 더 맘에 드는데.", -- 비타협 식혜
		PINEANANAS_JUICE = "마실땐 좋은데, 마시고 나면 입안이 얼얼해 질거야.", -- 레기온 파인애플 주스
		ORANGE_JUICE = "누가 마시고 있으면 양치를 권해봐야지.", -- 모어 푸드 팩 오랜지 주스
		STRAWBERRY_SMOOTHIE = "빨갛게 잘 갈았네.", -- 모어 푸드 팩 딸기 스무디
		STRAWBERRY_MILK_SMOOTHIE = "가끔은 차가운 것도 나쁘지 않네.", -- 모어 푸드 팩 딸기 스무디 라떼

		--양조기 음료

		SPOILED_DRINK = "땔감으로 쓰지도 못해.", --썩은 음료

		-- 양조소다
	
		SODA = "톡 쏘는 물이야.", -- 탄산수
		FRUITSODA = "음료중에선 이게 제일 맛있어.", -- 과일소다
		LEMONLIMESODA = "꿀물은 따듯하게 마시는거라구.", -- 레몬 라임소다(과일소다 상위 호환)
		COLA = "콜라를 여기서 다 보네.", -- 콜라
		COLAQUANTUM = "정말 비 정상적인 물이네.", --콜라 퀀텀
		LUMPY_BEER = "소다중에서 최악이야.", --루트비어(술이 아님)

		-- 양조주

		CORN_BEER = "완전 아저씨 같아.", -- 콘 맥주
		MADHU = "꿀로 만들었는데 달진않네.", --벌꿀주
		WINE = "오크통째로 태우면 향이 엄청날텐데.", --와인 (그냥 베리 양조)
		NOBLEWINE = "가볍게 잘 넘어가네.", --노블 와인(구운 베리 양조)
		SPARKLINGWINE = "잔뜩 흔든다음- 펑!", --스파클링 와인
		GLOWBERRYWINE = "불이 없는데 타는듯히 빛이 나는 와인이네.", --글로우 베리 와인
		KUMIS = "시고 고약해.", -- 크므즈,산양유주
		LUMPY_WINE = "술에서 흙냄새 나겠다.", --서주(감자 고구마등 뿌리 술)
		PULQUE = "우웩, 끈적거리고 셔.", --풀케(선인주)
		RUINCACAO_WINE = "뜨거운 핫초코가 더 좋기는 하는데 이것도 나름 괜찮네.", -- 카카오 와인 

		-- 콜라보 소다

		CHERRY_DOCTOR_COLA = "홈 메이드 짝퉁이야.", --체리숲 닥터 페퍼(닥터 체리)
		PINEANANASSODA = "파인애플 과즙 탄 소다일 뿐이야.", -- 탄산 파인애플(오란씨)
		ORANGESODA = "그저 특별할거 없는 오렌지 소다야.", -- 탄산 오랜지(환타)
		STRAWBERRYSODA = "빨갛고 톡쏘기도 해서 맛있다니깐?", -- 탄산 딸기(웰치스 딸기)

		--콜라보 양조주

		AUROBOW = "해파릴 태워도 이렇게 색이 바뀌어가면서 타진 않는데말이지.", -- 난파선 오로보우,무지개 해파리주
		COCONUT_WINE = "술은 맛있네, 나무는 태워버려.", -- 난파선 코코넛 와인
		CHERRY_BLOOM_MADHU = "난 불타서 흩날리는 꽃잎이 더 재밌어.", -- 체리숲 벚꽃꿀주
		GIANT_BLUEBERRY_WINE = "내 맘에드는 성질로 바뀌었어!", -- 비타협 붐베리 와인(불 붙히면 폭발함)
		RICE_WINE = "이상한걸로 술도 만드네.", -- 비타협 막걸리
		WHEAT_BEER = "입가에 거품묻히긴 싫어.", -- 힙 오브 푸드 밀맥주
		PALE_BEER = "어째서 맥주가 푸른색이야?", -- 레기온 페일에일 (몬스트라 열매를 쓴 청록색 맥주)

		--증류주

		DISINFECTANT = "내가 태워봤는데, 얘는 불꽃이 잘 안보여.", -- 소독약
		CORN_WHISKEY = "거칠게 마시고 가볍게 취해 보자!", -- 콘 위스키
		LUMPY_VODKA = "태우듯히 마시고 뱃속에 불을 붙혀보자!", -- 보드카
		TEQUILA = "꼬릿한 향을 참고 넘길만해.", -- 데킬라
		MADHU_RUM = "물 대신 이걸 마실래!", -- 럼주
		BERRY_BRANDY = "으히히... 좋아라.", -- 베리 브랜디
		AREUHI = "우유로 만들었다는게 느껴지지 않을정도로 깔끔하네?", -- 크므즈 증류주 아르히

		--왈리 전용 증류주

		BERRY_GIN = "내가 진정으로 태우고 싶었던건 이 썩어빠진 세상이였다구.", --진
		GLOWBERRY_GIN = "빛도 나고, 내 목에 불꽃 붙혀줄거야.", --글로우 베리 진
		ABSINTHE = "방화도 예술로 봐달라구우.", -- 압생트
		TEA_LUMPY_VODKA = "야,이게 진짜 차지.", -- 녹차 리큐르
		PETALS_BERRY_BRANDY = "꽃향기가 나네, 취할수 있음 뭐든지 좋아.", -- 장미향 브랜디
		KAHLUA = "커피도 마시고 술도 마시고, 으히히...", -- 커피 리큐르 깔루아
		NUT_CORN_WHISKEY = "위스키에 견과류 좀 넣었나 보네?", -- 너트 위스키
        RUINCACAO_CREAM_LIQUEUR = "이거 정말 맛있고 달다!", --베일리스 카카오 크림 리큐르
        RUMCHATA = "못보던 술인데 마실만해 보이네.", -- 럼차타(럼에 오우차타 라는 유제품 섞은)

		--콜라보 증류주

		MOONWAY = "뭘로 만들었든 취할수 있으면 그만 아니겠어?", -- 무지개 해파리주 증류주
		ARRACK = "은은하게 열매향이 나는게 맘에 들어.", -- 아락 인도네시아 버전 코코넛 와인 증류주
		CHERRY_BLOOM_RUM = "예쁘네, 다 마시고 불 좀 질러봐야겠어.", -- 체리 꿀주 증류주 벛꽃잎 떠다님
		RICE_SPIRITS = "독한게 내 취향이야.", --청주
		WHEAT_WHISKEY = "밀밭을 태우는것 만큼 맛있을거야.", -- 밀 위스크
		PALE_WHISKEY = "하다하다 위스키도 새파래.", -- 페일 몰트 위스키

		--왈리 전용 콜라보 증류주

		NUT_COCONUT_BRANDY = "바다를 가질수 없다면 모두 잿더미로 만들어 주겠어.", -- 코코넛 브랜디 (캐러비안 럼을 만들수 없어서 카리브 브랜디 라는 이름으로 대체)
	    GIANT_BLUEBERRY_GIN = "와아.이거 정말 맘에 드는데?", -- 붐 베리 사파이어 (당근 폭발함)

		--냄비 요리

        DARK_RUINCOLATE = "왈리가 나한데 쌓인게 많았던 거야?", --다크 초콜릿.
        WHITE_RUINCOLATE = "흐음-달콤해라.", --화이트 초콜릿
        RUINCOLATE = "잘 녹여서 퍼지로 만들면 더 맛있어!", -- 그냥 초콜릿
        RUIN_SCHOKAKOLA = "불을 붙히면 광이 더 잘 날거야. 뭐, 초콜릿이라고?", -- 쇼카콜라

		BUCKET_STEEL_EMPTY = 
		{
			EMPTY = "안 탈 것 같은데, 땔감이나 담을까?", --빈 양철 양동이
			FULL = "빗물이 고여있어.", -- 깨끗한 빗물이 참
			FULL_ICE = "통째로 얼어버렸네.", -- 빗물이 얼어버림
			DIRTY = "더러운물이 고여있잖아!", --빗물이 더러워짐
			DIRTY_ICE = "통째로 가열하면 만사가 해결되지 않을까?", --더러운 빗물이 얼어버림
		},

		BUCKET_WOODIE_EMPTY = 
		{
			EMPTY = "속을 비워낸 땔감아니야?", --우디의 빈 나무 양동이
			FULL = "빗물이 고여있어.",  --깨끗한 빗물이 참
			FULL_ICE = "통째로 얼어버렸네.", --빗물이 얼어버림
			DIRTY = "더러운물이 고여있잖아!", --빗물이 더러워짐
			DIRTY_ICE = "통째로 태우면 모든게 해결되지 않을까?", --더러운 빗물 얼어버림
		},

		BUCKET_DRIFTWOOD_EMPTY = 
		{
			EMPTY = "불을 담으면 얼마나 멋질까?", -- 유목양동이
			FULL = "빗물이 고여있어.",  --깨끗한 빗물이 참
			FULL_ICE = "통째로 얼어버렸네.", --빗물이 얼어버림
			DIRTY = "더러운물이 고여있잖아!", --빗물이 더러워짐
			DIRTY_ICE = "통째로 태우면 모든게 해결되지 않을까?", --더러운 빗물 얼어버림
		},

		BUCKET_EMPTY = 
		{
			EMPTY = "땔감을 넣고 통째로 태우면 재밌겠다!", -- 빈 나무 양동이
			FULL = "빗물이 고여있어.", -- 깨끗한 빗물이 참
			FULL_ICE = "통째로 얼어버렸네.", --빗물이 얼어버림
			DIRTY = "더러운물이 고여있잖아!", --빗물이 더러워짐
			DIRTY_ICE = "통째로 태우면 모든게 해결되지 않을까?", --더러운 빗물 얼어버림
		},

		DESALINATOR =
		{
			EMPTY = "풍차에 불 붙히면 좋은 구경거리가 될 텐데.", --제염기에 물이 없음
			PURIFY_LONG = "불을 안쓰니깐 지루하네.", -- 정수 끝나기까지 많이 남음
			PURIFY_SHORT = "조만간 정수가 끝날거야.", -- 정수가 곧 끝남
			HASWATER = "정수가 끝났어.", --제염기에 깨끗한 물이 있음
			BURNT = "적어도 엄청나게 재밌었잖아?",   --제염기가 타버림
			HASSALT = "소금을 먼저 치워야 쓸수있어.", --제염기에 소금이 남아 있음
		},

		BARREL =
		{
			GENERIC = "물통 말고 화약통은 어때?", -- 물통 조사 대사
			BURNT = "화력앞에 물도 장사 없다고.", -- 물통이 타버림
		},

		BREWERY =
		{
			EMPTY = "불을 쓰면 못 하는게 없다니깐.", --양조기 조사 대사
			BURNT = "정말 화끈하게 발효됬네.", --양조기 타버림
			FERMENTING_LONG = "불이 따듯하게 효모를 품어줄거야.", --양조 끝나기 까지 많이 남음
			FERMENTING_SHORT = "불아 어서, 목이 탄단 말이야.", --양조가 곧 끝남
			DONE = "불이 품어 낸 음료가 들어 있을거야.", --양조기에 음료가 들어있음
		},

		CAMPKETTLE_ITEM = "불로 물을 살균 할 거야.", --휴대 주전자 아이템 조사 대사
		CAMPKETTLE =
		{
			GENERIC = "텅 텅 비었잖아.", -- 화덕에 건 휴대 주전자 안에 물이 없음
			BOILING_LONG = "더러운 것을 걷어내는 거야. 나는 깨끗한 아이로 자랐거든.", -- 물 끓이기 시작함
			BOILING_SHORT = "불순물을 거의 다 끓여냈어.", -- 물 거의 다 끓음
			DONE = "불로 가열하면 물이라고 예외는 없지.", --깨끗한 물이 들음
			STOP = "화력이 필요해. 더 큰 화력!", --화덕에 불이 없어서 더러운물이 끓지 않는 상태
		},

		CAMPDESALINATOR_ITEM = "바닷물과 불을 싸움 붙힐거야.", --휴대 제염기 아이템 조사 대사
		CAMPDESALINATOR = 
		{
			GENERIC = "싸움을 붙힐 선'수'가 없잖아.", --물 없음
			BOILING_LONG = "불아 힘내!", --물 끓이기 시작
			BOILING_SHORT = "거의 다 넘어 갔어!", --거의 다 끓음 
			DONE = "승자는 언제나 불인 셈이지", -- 깨끗한 물이 들음
			STOP = "야,야! 불이 없잖아!", -- 화덕에 불이 없어서 소금물이 정수 되지 않는 상태
		},

		KETTLE =
		{
			EMPTY = "모든 물은 불로 살균해야해.", --빈 주전자 조사대사
			BURNT = "물이 없음 별것도 아니네.", --주전자가 불탐
			BOILING_LONG = "불이 열심히 재료를 우리기 시작했어.", -- 음료를 만들기 시작한지 얼마 안됨
			BOILING_SHORT = "불이 재료를 거의 다 우려냈어!", --음료 조리가 거의 끝나감
			DONE = "불로 가열하면 물도 더 나아질수 있다니깐?", --음료가 완성됨
			PURIFY_LONG = "불이 열심히 물을 살균하기 시작했어.", -- 더러운 물을 끓이기 시작한지 얼마 안됨
			PURIFY_SHORT = "불이 균을 거의 다 씼어 냈어!", --더러운물을 거의 다 끓여감
			HASWATER = "그럼 이제 뭘 삶아볼까?", -- 깨끗한 물이 차 있는 상태
			MELT_LONG = "불이 열심히 얼음을 녹이기 시작했어.", -- 얼음물을 녹이기 시작한지 얼마 안됨
			MELT_SHORT = "얼음 같은게 불을 이길수 있겠어?", -- 얼음물을 거의 녹여감
		},

		PORTABLEKETTLE_ITEM =
		{
			GENERIC = "그저 아무것도 아닌 깡통.", -- 휴대용 주전자(아이템) 조사 대사
			EMPTY = "물 없이는 그저 깡통일 뿐이야.", -- 설치한 빈 휴대용 주전자 조사 대사
			BOILING_LONG = "주저하지 말고 얼른 우려!", -- 음료를 만들기 시작한지 얼마 안됨
			BOILING_SHORT = "불아, 어서! 목이 탄단 말이야!", --음료 조리가 거의 끝나감
			DONE = "좋아, 얼른 마시자.", --음료가 완성됨
			PURIFY_LONG = "주저하지 말고 얼른 끓여!", -- 더러운 물을 끓이기 시작한지 얼마 안됨
			PURIFY_SHORT = "불아, 어서!", --더러운물을 거의 다 끓여감
			HASWATER = "그럼 이제 뭘 삶아 볼까?", -- 깨끗한 물이 차 있는 상태
			MELT_LONG = "주저하지 말고 얼른 녹여!", -- 얼음물을 녹이기 시작한지 얼마 안됨
			MELT_SHORT = "불아, 빨리!", -- 얼음물을 거의 녹여감
		},
		
		DISTILLERS =
		{   
		    EMPTY = "불을 정말 효과적으로 쓰는 기계야.", --증류기 조사 대사
			DISTILLTING_LONG = "안쪽에 불을 던져 넣었으면 더 빨리 끝나지 않았을까?", --증류가 끝나기 까지 많이 남음
			DISTILLING_SHORT = "어서, 난 술이 마시고 싶다구우.", --증류가 곧 끝남
			DONE = "내 거야!", --증류기에 음료가 들어있음
		},

		WELL_WATERPUMP = {
			HIGH_PRESSURE = "필요해서 쓸 뿐이야.", -- 압력 최대
			MIDDLE_PRESSURE = "봐 봐 벌써 약해 졌잖아.", -- 압력이 중간
			LOW_PRESSURE = "화력이 부족한거야, 분명해.", -- 압력이 거의 없을때
			RECHARG_PRESSURE = "불을 붙혀보면 열심히 일 하지 않을까?", -- 압력이 아예 없을때(여기까지 쓰면 압력이 최대가 될때까지 못씀.)
		},
		
		WELL_SPRINKLER =
		{ 
			LOWFUEL = "내가 쟤한데 연료를 공급해줘야해?", -- 연료가 거의 없는 상태에서의 조사 대사
			ON = "정말 신경 긁는 소릴 내네.", -- 작동중임
			OFF = "내 방해는 하지마렴.", --작동을 멈춘상태에서의 조사 대사
		},	
	},
}