return {
	ACTIONFAIL =
	{
		GIVE =
		{
			WELL_NOTEMPTY = "Have to remove the bucket first.", --
			WELL_BUSY = "The water's still coming up.",
		}
	},

	ANNOUNCE_DRUNK = "I heard a story on a radio once...hic",

    ANNOUNCE_DRUNKING =
    {
        "Huff... Pant...",
        "I should have built... a lifting machine...",
        "Lift... with your back...",
        "This isn't... gentleman's work...",
        "For... science... oof!",
        "Is this... messing up my hair?",
        "Hngh...!",
        "Pant... Pant...",
        "This is the worst... experiment...",
    },

	ANNOUNCE_DRUNK_END = "I feel much better now!",
	ANNOUNCE_DRUNK_IMMUNITY = "only_used_by_wathgrithr",
	ANNOUNCE_NOTCHARGE = "Can't milk it, it's utterly dry! Heh, that was good.", --
	ANNOUNCE_NOTHIRSTSLEEP = "I'm too thirsty to sleep.",
	ANNOUNCE_NOTHIRSTSIESTA = "I need a drink before bedtime.",
	ANNOUNCE_SLEEP_END = "I feel a bit better after sleeping", --
	ANNOUNCE_THIRST = "How about taking a moment to have some water?",  --

	ANNOUNCE_CAFFINE_BUFF_START = "I wanna start exploring right now." , -- 카페인 버프 시작
    ANNOUNCE_CAFFINE_BUFF_STOP = "Getting a little tired..." ,  -- 카페인 버프 끝
    
    ANNOUNCE_CURE_WATERBORNE = "I'm feeling better now." ,  -- 수인성 질병을 아이템으로 치료했을때의 대사

	ANNOUNCE_DCAPACITY_CRITICAL = "Why do I feel so heavy...",
	ANNOUNCE_DCAPACITY_HALF = "I'm feeling like something's wrong...", --

	DESCRIBE =
	{
		BOILBOOK =  "It doesn't hurt to memorize one more handbook.", --

		WATER_CLEAN_ICE = "Oh, gosh,It's frozen.", --
		WATER_DIRTY_ICE = "The ice is so black!.",

		SPICE_CAFFEINPEPPER = "Makes camping food taste much better.",

		WELL_KIT = "Don't dwell around the well. Heh.", 
		WELL_SPRINKLER_KIT = "Let's give our plants some 'irri-gation' now!", --
		WELL_WATERPUMP_KIT = "High-Draw Pump! It leads the water from low to high?",
		WELL_BURYING_KIT = "I should fill in any holes that I can't even step down into for safety!", --
		WELL_DRILLING = "One well at a time!",
		WELL_DRILLING_ITEM = "Wanna dig a well hole Woby?", --
		HOLE = "I wonder if it leads to the other side of the world?",
		WELL = "What's wrong Woby? Did somebody fall in?",

		WX78MODULE_NONEDRUNK = "Robot guts! Neat!", -- 78전용 묘듈
		
	    -- 물 모드 식물

		TEA_TREE = "Nothing about tee treas in the handbook.",
		DUG_TEA_TREE = "Let's look for a place to plant Woby!",
		TEA_SEED = "This will grow into a new tree.",
		TEA_SEED_COOKED = "We can eat this.",
		TEA_SEED_SAPLING = "It's growing.",
		TEALEAVES = "Smells grassy.",
		TEALEAVES_DRIED = "The leaves are rustly.",

		CAFFEINBERRY = "I thought coffee grew from trees.",
		DUG_CAFFEINBERRY = "Take this to camp, and the grown-ups will love it.", --
		CAFFEINBERRY_BEAN = "This is what coffee looks like?",
		CAFFEINBERRY_BEAN_COOKED = "Now it smells more like coffee!",
		
		RUINCACAO_TREE = "It's a mini chocolate factory!",
		DUG_RUINCACAO_TREE = "Let's find a place for my own chocolate facory.",
		RUINCACAO_SEED = "This will grow into a new tree.",
		RUINCACAO_SEED_SAPLING = "It's blooming already.",
		RUINCACAO = "They say it's dwarf treasure!",
		RUINCACAO_BEAN = "Wait, chocolate is white...and smells like grease?",
		RUINCACAO_BEAN_COOKED = "This isn't the chocolate I know.",

       -- 증류기 첨가제

		ADDITIVE_SEED = "I think I'll make a sample out of these seeds.",
		ADDITIVE_NUT = "Trail mix! Oh never mind...",
		ADDITIVE_DAIRY = "Is it cake cream?",
		ADDITIVE_PETALS = "It's dried leaves and petals!",

		-- 음료

		WATER_CLEAN = "Staying hydrated is key to survival!",
		WATER_DIRTY = "This needs more boiling.",
		WATER_SALTY = "Drinking sea water will make you more thirsty.",

		GOOPYDRINK = "Um...will Woby eat this?",

		-- 주전자 음료
		
		FRUITJUICE = "It's fruit so it's good for me!",
		BERRIES_JUICE = "Berry berry good! See? It's made out of berries.",
		POMEGRANATE_JUICE = "Is this juice from inside a fruit which was already inside another fruit?",
		BANANA_JUICE = "This is better than I thought it'd be.",
		FIG_JUICE = "Not good as a juice either...",
		DRAGONJUICE = "Is this...dragon blood?",
		GLOWBERRYJUICE = "I wonder if this'll make me bright?",
		WATERMELON_JUICE = "Should I call this watermelon water?",

		VEGGIE_TEA = "Um,This looks...healthy.",--
		CARROT_TEA = "Poor carrot...but not really.",
		CACTUS_TEA = "Hope i don't get a thorn in my mouth.",
		TOMATO_JUICE = "This looks like a vampire drink.",
		LUMPY_TEA =  "Ew... I hope it doesn't smell like dirt." , --
		SEAWEED_SHAKE = "What if it starts growing sea weeds inside me?", --

		GREENTEA = "I think I saw a bug! Just kidding.",
		BLACKTEA = "Which dinosaur enjoys tea? Tea-Rex!",
		BLACKTEA_ICED = "Ice is in the pot-tea.",
		FUER = "How about trying some 'Folli-Tea' for a refreshing taste of nature?", --
		MIXFLOWER = "Do bees drink tea? Probably not.",
		HIBISCUSTEA = "I have a feeling it's gonna be sour.",
		CACTUSFLOWER_TEA = "This is how you survive in the desert.",
		LOTUSTEA = "Back to where it came from. Hot water.",
		SUSHIBISCUS = "Maybe just one sip?",
		MOON_BLOSSOM_TEA = "I wanted cheese, not tea.",

		CAFFEINBERRY_JUICE = "Drinking too much will be a ca-pain! Heh...",
		TOFFEE_LATTE = "It's coffee, but with everything I like!",
		RUINCHA_LATTE = "Never for Woby!",

		HOTRUINCOLATE = "Now I don't have to wait for Christmas.",
		RUINCOLATE_SMOOTHIE = "Chocolate and ice will be crunchy.",
		RUINXOCOLATL = "Is this cocoa? Really?", --
		TEA_RUINCOLATE_LATTE = "It's green...which I don't like.",

		MULLED = "Bitter is good for you!",
		BUTTERBEER = "It's the drink the wizard had in that novel!",
		
		-- 콜라보 주전자 음료

		COCONUT_JUICE = "This is coco'not'. Why? Because it's not coco'nut', heh heh.",
		RAINBOW_SHAKE = "It's a delicious color!",
		QUARTZ_SHAKE = "Better than fish eyes, right?",
		CHERRY_ROSEBERRIES_TEA = "It's so hip! And relaxed.",
		CHERRY_HONEY_TEA = "It's like syrup medicine!",
		SWEET_RICE_DRINK = "Not a juice, But not a tea!",
		APPLEPINE_JUICE = "Do you know who Anana's brother is? Banana!", 
		CITROYUZU_JUICE = "Meet my 'oranginal' juice.", 
		STRAWBERRY_SMOOTHIE = "Strong but soft. Because it's a strawng berry smoothie.", -- 
		STRAWBERRY_MILK_SMOOTHIE = "Refreshing and cool!", 

		-- 양조기 음료

		SPOILED_DRINK = "I don't think I should drink this...",

		--소다 

		SODA = "I've never seen mineral water near camp.",
		FRUITSODA = "Home made fruit soda!",
		LIMONSODA = "Sweet and stingy.",
		COLA = "Who knew I'd drink cola again.",
		COLAQUANTUM = "I can hear it bouncing inside!",
		LUMPY_BEER = "Veggies even in drinks is good for me!",

		--양조주

		CORN_BEER = "I think it's beer!",
		MADHU = "Did bees figure out how to brew drinks with honey?",
		WINE = "Thought it'd be sweet. Why is it so bitter?",
		NOBLEWINE = "This looks sweet. Only if it wasn't alcohol.",
		SPARKLINGWINE = "I wanna shake this!!",
		GLOWBERRYWINE = "I wonder if this'll make me bright...er?",
		KUMIS = "I wish it were yogurt.",
		LUMPY_WINE = "Maybe for disinfecting scars on my adventures?",
		PULQUE = "There wern't instructions in the handbook drinking cactus like this.",
		RUINCACAO_WINE = "Cocoa for grown ups!",


		--콜라보 소다

		CHERRY_DOCTOR_COLA = "Definitely not a dentist.",
		APPLEPINESODA = "We'll call it the Pinetree Pioneer Apple Soda.", 
		CITROYUZUSODA = "What do you call it when an CITROYUZU soda dreams? Fanta-sy!", --  -- 
		STRAWBERRYSODA = "I've never seen strawberry soda before!", -- 

		--콜라보 양조주

		AUROBOW = "I wanna drink that color. Maybe just a sip?", 
		COCONUT_WINE = "Looks sweet!", -- 난파선 코코넛 와인
		CHERRY_BLOOM_MADHU = "Looks like alcohol in a gift shop!", 
		GIANT_BLUEBERRY_WINE = "Uh, at least that kept its temper.", --  -- 
		RICE_WINE = "Probably not milk.", -- 비타협 막걸리
		WHEAT_BEER = "Looks like real beer!", -- 힙 오브 푸드 밀맥주
		PALE_BEER = "Now I know why grown ups call it pale ail.", 

		--증류주

		DISINFECTANT = "The handbook said disinfectants saved a bunch of lives.",
		CORN_WHISKEY = "Not sure, but I think it's whiskey!",
		LUMPY_VODKA = "Ugh! How do grown ups drink this?",
		TEQUILA = "Back to being prickly, huh?",
		MADHU_RUM = "They say this is how they stored water on boats!",
		BERRY_BRANDY = "Not too sure, but I'm guessing brandy?",
		AREUHI = "Milk for grown ups is transparent.",

		--왈리 전용 증류주

		BERRY_GIN = "I heard it was made for medicinal purposes, but it made a lot of people sick.", --
		GLOWBERRY_GIN = "Shiney Gin! But it's not in a lamp.",
		ABSINTHE = "I think I heard it's called the green fairy!",
		TEA_LUMPY_VODKA = "This looks healthy! but it's still alcohol.",
		PETALS_BERRY_BRANDY = "I don't know about the taste, but it looks pretty!",
		KAHLUA = "I think Mr. Warly wanted to drink coffee and alcohol",
		NUT_CORN_WHISKEY = "It would have been better if it was a form that I could eat.",-- 
        RUINCACAO_CREAM_LIQUEUR = "Looks tasty! Too bad it's alcohol.",
        RUMCHATA = "Looks sweet and soft!",

		--콜라보 증류주

		MOONWAY = "Seven colors are shining in my palm.",
		ARRACK = "I wish the fruit was in my hand.",
		CHERRY_BLOOM_RUM = "This will look good behind my bug collection!",
		RICE_SPIRITS = "Ugh, why would anybody like this?",
		WHEAT_WHISKEY = "This could work as a disinfectant in a jiffy!",
		PALE_WHISKEY = "I think it's some type of medicine.",

		--왈리 전용 콜라보 증류주

		NUT_COCONUT_BRANDY = "Pirate drink!",
	    GIANT_BLUEBERRY_GIN = "No firearms!",

		--냄비 요리

        DARK_RUINCOLATE = "I think Mr. Warly made a mistake.",
        WHITE_RUINCOLATE = "Let's save it so that we don't eat too much at once!", --
        RUINCOLATE = "Oompa- loompa- doompety- doo-.",
        RUIN_SCHOKAKOLA = "At least the chocolate won't get squashed on my adventures.",

		BUCKET_STEEL_EMPTY = 
		{
			EMPTY = "Too small for head gear.",
			FULL = "Safe for drinking now!",
			FULL_ICE = "Aw, now I have to boil it.",
			DIRTY = "I think this went bad!",
			DIRTY_ICE = "I don't think I can eat this ice.",
		},

		BUCKET_WOODIE_EMPTY = 
		{
			EMPTY = "This bucket is wild!",
			FULL = "Safe to drink now!",
			FULL_ICE = "Aw, now I have to boil it.",
			DIRTY = "I think this went bad!",
			DIRTY_ICE = "I don't think I can eat this ice.",
		},

		BUCKET_DRIFTWOOD_EMPTY = 
		{
			EMPTY = "Looks like a bucket that has drifted onto a deserted island!",
			FULL = "Safe to drink now!",
			FULL_ICE = "Aw, now I have to boil it.",
			DIRTY = "I think this went bad!",
			DIRTY_ICE = "I don't think I can eat this ice.",
		},

		BUCKET_EMPTY = 
		{
			EMPTY = "Saving rain water is good for survival!",
			FULL = "Safe to drink now!",
			FULL_ICE = "Aw, now I have to boil it.",
			DIRTY = "I think this went bad!",
			DIRTY_ICE = "I don't think I can eat this ice.",
		},

		DESALINATOR =
		{
			EMPTY = "There wasn't anything about purifying salt water in the handbook.",
			PURIFY_LONG = "This'll take long. I'll go exploring with Woby.",
			PURIFY_SHORT = "I think it's almost done!",
			HASWATER = "No more salt!",
			BURNT = "So this is...burnt.",
			HASSALT = "Salt is just extra!",
		},

		BARREL =
		{
			GENERIC = "The water will always be clean!",
			BURNT = "Not my water!!",
		},

		BREWERY =
		{
			EMPTY = "That's a big barrel!",
			BURNT = "It burnt when it was supposed to brew.",
			FERMENTING_LONG = "This'll take long. Come on Woby, let's go play.",
			FERMENTING_SHORT = "If you listen closely, you can hear the bubbles.",
			DONE = "I think it's done!",
		},

		CAMPKETTLE_ITEM = "It's never smart to drink something from the wilderness.",
		CAMPKETTLE =
		{
			GENERIC = "It's safer to boil nature's water.",
			BOILING_LONG = "Better make sure it doesn't boil too much.",
			BOILING_SHORT = "It's boiling!",
			DONE = "Safe to drink now!",
			STOP = "Let's look for kindling before we get thirst Woby.",
		},

		CAMPDESALINATOR_ITEM = "The handbook said to never drink salt water.",
		CAMPDESALINATOR =
		{
			GENERIC = "We'll boil the sea water into steam to make plain water.",
			BOILING_LONG = "Do you guys wanna hear a story while we wait?",
			BOILING_SHORT = "Think it's almost done!",
			DONE = "It won't be salty anymore!",
			STOP = "Let's look for kindling before we get thirsty Woby.",
		},

		KETTLE =
		{
			EMPTY = "3 3 3 rule! You won't last 3 days without water!",
			BURNT = "So this is...burnt.",
			BOILING_LONG = "This'll take long. Come on Woby, let's go play.",
			BOILING_SHORT = "Almost ready!",
			DONE = "I should tell everyone at camp it's done!",
			PURIFY_LONG = "Not finishing is worse.",
			PURIFY_SHORT = "We'll survive three days more!",
			HASWATER = "Now let's look for something to brew with Woby!",
			MELT_LONG = "Needs to melt more.",
			MELT_SHORT = "Almost done melting.",
		},

		PORTABLEKETTLE_ITEM =
		{
			GENERIC = "Now we can drink in the wilderness!",
			EMPTY = "Think we should find water first.", 
			BOILING_LONG = "This'll take long. Come on Woby, let's go play.",
			BOILING_SHORT = "Almost ready!",
			DONE = "I can have a fancy cup of tea in the wild too!",
			PURIFY_LONG = "Not finishing is worse.",
			PURIFY_SHORT = "Now we can explore for three more days!",
			HASWATER = "Now let's find something to brew with Woby!",
			MELT_LONG = "Needs to melt more.",
			MELT_SHORT = "Almost done melting.",
		},

		DISTILLERS =
		{   
		    EMPTY = "It's got all kinds of complicated gadgets attached!", --
			DISTILLTING_LONG = "This'll be a while.", --
			DISTILLING_SHORT = "I think it's for alcohol?", --
			DONE = "I should tell the guys at camp drinks are ready.", --
		},

		WELL_WATERPUMP = {
			HIGH_PRESSURE = "The power of steam is awesome!", -- 
			MIDDLE_PRESSURE = "It's as good as Mr. Wolfgang!", --
			LOW_PRESSURE = "Does the machine need more food?", -- 
			RECHARG_PRESSURE = "We need to find a pond Woby.", -- 
		},

		WELL_SPRINKLER =
		{ 
			LOWFUEL = "I need to put in more wood.",
			ON = "That's odd, Woby likes it!",
			OFF = "It's taking a break.",
		},
	}
}