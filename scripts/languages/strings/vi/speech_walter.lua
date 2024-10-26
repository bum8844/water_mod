return {
	ACTIONFAIL =
	{
		GIVE =
		{
			WELL_NOTEMPTY = "Tôi cần loại bỏ cái xô trước đã",
			WELL_BUSY = "Nước vẫn đang lên.",
		}
	},

	ANNOUNCE_DRUNK = "Tôi từng nghe một câu chuyện trên radio...hic",

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
	
	ANNOUNCE_DRUNK_END = "Bây giờ tôi cảm thấy tốt hơn nhiều!",
	ANNOUNCE_DRUNK_IMMUNITY = "",--only_used_by_wathgrithr
	ANNOUNCE_NOTCHARGE = "Không thể vắt sữa được, nó khô quá rồi! Heh, điều đó thật tốt.",
	ANNOUNCE_NOTHIRSTSLEEP = "Tôi khát quá không ngủ được.",
	ANNOUNCE_NOTHIRSTSIESTA = "Tôi cần uống nước trước khi đi ngủ.",
	ANNOUNCE_SLEEP_END = "Tôi cảm thấy tốt hơn một chút sau khi ngủ",
	ANNOUNCE_THIRST = "Bạn có muốn dành một chút thời gian để uống nước không?",
	
	ANNOUNCE_CAFFINE_BUFF_START = "Tôi muốn bắt đầu khám phá ngay bây giờ." , -- 카페인 버프 시작
	ANNOUNCE_CAFFINE_BUFF_STOP = "Hơi mệt một chút..." , -- 카페인 버프 끝
	ANNOUNCE_CURE_WATERBORNE = "Bây giờ tôi thấy khỏe hơn rồi." , -- 수인성 질병을 아이템으로 치료했을때의 대사
	ANNOUNCE_DCAPACITY_CRITICAL = "Sao tôi thấy nặng nề quá...",
	ANNOUNCE_DCAPACITY_HALF = "Tôi cảm thấy như có điều gì đó không ổn...",

	DESCRIBE =
	{
		BOILBOOK =  "Sẽ không có hại gì khi ghi nhớ thêm một cuốn sổ tay nữa.", --

		WATER_CLEAN_ICE = "Ôi Chúa ơi, nó bị đóng băng rồi.", --
		WATER_DIRTY_ICE = "Băng trông đen quá!",
		
		SPICE_CAFFEINPEPPER = "Làm cho đồ ăn cắm trại ngon hơn nhiều.",
		
		WELL_KIT = "Đừng ở quanh giếng. Heh.",
		WELL_SPRINKLER_KIT = "Hãy 'tưới nước' cho cây của chúng ta ngay bây giờ!", --
		WELL_WATERPUMP_KIT = "Máy bơm hút cao! Nó dẫn nước từ thấp lên cao?",
		WELL_BURYING_KIT = "Tôi nên lấp đầy những cái lỗ mà tôi không thể bước xuống để đảm bảo an toàn!", --
		WELL_DRILLING = "Mỗi lần một giếng!",
		WELL_DRILLING_ITEM = "Muốn đào một cái giếng không em, Woby?", --
		HOLE = "Tôi tự hỏi liệu nó có dẫn đến bên kia thế giới không?",
		WELL = "Sao vậy Woby? Có ai rơi vào à?",
		
		WX78MODULE_NONEDRUNK = "Ruột robot! Gọn gàng!", -- 78전용 묘듈
		
	    -- 물 모드 식물

		TEA_TREE = "Không có gì về tee trong sổ tay.",
		DUG_TEA_TREE = "Hãy tìm nơi trồng Woby!",
		TEA_SEED = "Cái này sẽ phát triển thành một cây mới.",
		TEA_SEED_COOKED = "Chúng ta có thể ăn cái này.",
		TEA_SEED_SAPLING = "Nó đang phát triển.",
		TEALEAVES = "Có mùi cỏ.",
		TEALEAVES_DRIED = "Lá bị rỉ sét.",
		
		CAFFEINBERRY = "Tôi tưởng cà phê mọc từ cây.",
		DUG_CAFFEINBERRY = "Mang cái này đi cắm trại, người lớn sẽ thích nó.", --
		CAFFEINBERRY_BEAN = "Cà phê trông như thế này à?",
		CAFFEINBERRY_BEAN_COOKED = "Bây giờ nó có mùi giống cà phê hơn!",
		
		RUINCACAO_TREE = "Đó là một nhà máy sản xuất sôcôla mini!",
		DUG_RUINCACAO_TREE = "Hãy tìm một nơi cho mặt tiền sô-cô-la của riêng tôi.",
		RUINCACAO_SEED = "Cái này sẽ phát triển thành một cây mới.",
		RUINCACAO_SEED_SAPLING = "Nó nở rồi.",
		RUINCACAO = "Họ nói đó là kho báu của người lùn!",
		RUINCACAO_BEAN = "Đợi đã, sôcôla có màu trắng...và có mùi dầu mỡ?",
		RUINCACAO_BEAN_COOKED = "Đây không phải là sôcôla mà tôi biết.",

       -- 증류기 첨가제

	    ADDITIVE_SEED = "Tôi nghĩ tôi sẽ làm mẫu từ những hạt giống này.",
	    ADDITIVE_NUT = "Kết hợp đường mòn! Ôi đừng bận tâm...",
		ADDITIVE_DAIRY = "Có phải là bánh kem không?",
		ADDITIVE_PETALS = "Đó là lá và cánh hoa khô!",

		-- 음료

		WATER_CLEAN = "Luôn đủ nước là chìa khóa để sinh tồn!",
		WATER_DIRTY = "Cái này cần đun sôi nhiều hơn.",
		WATER_SALTY = "Uống nước biển sẽ khiến bạn khát hơn.",
		
		GOOPYDRINK = "Ừm...Woby sẽ ăn cái này chứ?",

		-- 주전자 음료
		
		FRUITJUICE = "Đó là trái cây mọng nên nó tốt cho tôi!",
		BERRIES_JUICE = "Quả mọng ngon! Bạn thấy không? Nó được làm từ quả mọng.",
		POMEGRANATE_JUICE = "Nước ép này có phải từ bên trong một loại trái cây vốn đã ở bên trong một loại trái cây khác không?",
		BANANA_JUICE = "Cái này tốt hơn tôi nghĩ.",
		FIG_JUICE = "Cũng không tốt bằng nước trái cây...",
		DRAGONJUICE = "Đây có phải...máu rồng không?",
		GLOWBERRYJUICE = "Tôi tự hỏi liệu điều này có làm tôi tươi sáng không?",
		WATERMELON_JUICE = "Tôi có nên gọi đây là nước dưa hấu không?",
		
		VEGGIE_TEA = "Cái này trông...khỏe mạnh nhỉ?",
		CARROT_TEA = "Cà rốt tội nghiệp...nhưng không hẳn.",
		VEGGIE_TEA = "Hừm, thứ này.... trông thật tốt cho sức khoẻ",--
		TOMATO_JUICE = "Thứ này trông giống đồ uống của ma cà rồng.",
		LUMPY_TEA =  "Eo ôi,... tôi mong rằng nó không có vị như đất" , --
		SEAWEED_SHAKE = "Không biết liệu rong biển sẽ \"đâm chồi nảy lộc\" trong bụng tôi không nhỉ?", --
		
		GRENTEA = "Tôi nghĩ tôi đã nhìn thấy một con bọ! Đùa thôi.",
		BLACKTEA = "Con khủng long nào thích trà? Tea-Rex!",
		BLACKTEA_ICED = "Có đá trong ấm trà.",
		FUER = "Thử một chút 'Folli-Tea' để thưởng thức hương vị sảng khoái từ thiên nhiên nào!!", --
		MIXFLOWER = "Ong có uống trà không? Có lẽ là không.",
		HIBISCUSTEA = "Tôi có cảm giác nó sẽ chua.",
		CACTUSFLOWER_TEA = "Đây là cách bạn sống sót trong sa mạc.",
		LOTUSTEA = "Quay lại nơi nó xuất phát. Nước nóng.",
		SUSHIBISCUS = "Có lẽ chỉ một ngụm thôi?",
		MOON_BLOSSOM_TEA = "Tôi muốn phô mai, không phải trà.",
		
		CAFFEINBERRY_JUICE = "Uống nhiều sẽ bị đau bụng! Heh...",
		TOFFEE_LATTE = "Đó là cà phê, nhưng với mọi thứ tôi thích!",
		RUINCHA_LATTE = "Không bao giờ dành cho Woby!",
		
		HOTRUINCOLATE = "Bây giờ tôi không phải đợi đến Giáng sinh.",
		RUINCOLATE_SMOOTHIE = "Sô cô la và đá sẽ giòn.",
		RUINXOCOLATL = "Đây là cacao hả? Thật đấy à", --
		TEA_RUINCOLATE_LATTE = "Nó có màu xanh...mà tôi không thích.",
		
		MULLED = "Thuốc đắng giã tật",
		BUTTERBEER = "Đó là đồ uống mà phù thủy đã uống trong cuốn tiểu thuyết đó!",
		
		-- 콜라보 주전자 음료

		COCONUT_JUICE = "Đây là dừa'. Tại sao? Bởi vì nó không phải là dừa', heh heh.",
		RAINBOW_SHAKE = "Đó là một màu sắc tuyệt vời!",
		QUARTZ_SHAKE = "Tốt hơn mắt cá phải không?",
		CHERRY_ROSEBERRIES_TEA = "Thật sành điệu! Và thư giãn.",
		CHERRY_HONEY_TEA = "Giống như thuốc sirô!",
		SWEET_RICE_DRINK = "Không phải nước ép, không phải trà!",
		ANANAS_JUICE = "Bạn có biết anh trai của Anana là ai không? Chuối!", -- Legion Pineapple Juice
		ORANGE_JUICE = "Gặp nước ép 'oranginal' của tôi.", -- Thêm gói thực phẩm Nước cam.
		STRAWBERRY_SMOOTHIE = "Cường mạnh và mềm lỏng, đó là thức uống sinh tố dâu tằm", -- 
		STRAWBERRY_MILK_SMOOTHIE = "Sáng mát và sảng khoái!", -- Thêm gói thực phẩm Strawberry Smoothie Latte

		-- 양조기 음료

		SPOILED_DRINK = "Tôi không nghĩ mình nên uống thứ này...",

		--소다 

		SODA = "Tôi chưa bao giờ thấy nước khoáng gần trại.",
		FRUITSODA = "Soda trái cây làm tại nhà!",
		LEMONLIMESODA = "Ngọt ngào và keo kiệt.",
		COLA = "Ai biết tôi lại uống cola.",
		COLAQUANTUM = "Tôi có thể nghe thấy nó nảy bên trong!",
		LUMPY_BEER = "Rau ngay cả trong đồ uống cũng tốt cho tôi!",

		--양조주

		CORN_BEER = "Tôi nghĩ đó là bia!",
		MADHU = "Có phải ong đã tìm ra cách pha đồ uống bằng mật ong không?",
		WINE = "Tưởng ngọt. Sao lại đắng thế?",
		NOBLEWINE = "Món này trông thật ngọt ngào. Chỉ khi đó không phải là rượu.",
		SPARKLINGWINE = "Tôi muốn lắc cái này!!",
		GLOWBERRYWINE = "Tôi tự hỏi liệu điều này có làm tôi tươi sáng...er không?",
		KUMIS = "Tôi ước gì đó là sữa chua.",
		LUMPY_WINE = "Có thể để khử trùng vết sẹo trong chuyến phiêu lưu của tôi?",
		PULQUE = "Không có hướng dẫn nào trong sổ tay cách uống xương rồng như thế này.",
		RUINCACAO_WINE = "Ca cao dành cho người lớn!",


		--콜라보 소다

		CHERRY_DOCTOR_COLA = "Chắc chắn không phải là nha sĩ.",
		ANANASSODA = "Chúng tôi sẽ gọi nó là soda Thông Phong Táo.", -- Dứa có ga (Oran)
		ORANGESODA = "Bạn gọi nó là gì khi trông thấy một cốc soda cam? Fanta-sy :>", --  -- 
		STRAWBERRYSODA = "Tôi chưa bao giờ thấy soda dâu trước đây!", -- Dâu tây có ga (dâu tây của Welch)

		--콜라보 양조주

		AUROBOW = "Tôi muốn uống màu đó. Có lẽ chỉ một ngụm thôi?", -- Shipwreck Aurobow, Rainbow Jellyfish Wine
		COCONUT_WINE = "Trông thật ngọt ngào!", -- Rượu dừa đắm tàu
		CHERRY_BLOOM_MADHU = "Trông giống như rượu trong cửa hàng quà tặng!", -- Rượu mật ong hoa anh đào rừng anh đào
		GIANT_BLUEBERRY_WINE = "Uh, ít nhất thứ đó giữ được bình tĩnh.", --  -- 
		RICE_WINE = "Có lẽ không phải sữa.", -- Makgeolli không khoan nhượng
		WHEAT_BEER = "Trông giống bia thật!", -- Đống thức ăn Bia lúa mì
		PALE_BEER = "Bây giờ tôi biết tại sao người lớn gọi nó là bia nhạt.", -- Legion Pale Ale (bia màu ngọc lam làm từ trái cây Monstra)

		--증류주

		DISINFECTANT = "Sổ tay nói rằng chất khử trùng đã cứu được rất nhiều sinh mạng.",
		CORN_WHISKEY = "Không chắc lắm, nhưng tôi nghĩ đó là rượu whisky!",
		LUMPY_VODKA = "Ugh! Người lớn làm sao uống được thứ này?",
		TEQUILA = "Trở lại gai góc hả?",
		MADHU_RUM = "Họ nói đây là cách họ trữ nước trên thuyền!",
		BERRY_BRANDY = "Không chắc lắm, nhưng tôi đoán là rượu mạnh?",
		AREUHI = "Sữa dành cho người lớn có dạng trong suốt.",

		--왈리 전용 증류주

		BERRY_GIN = "Tôi nghe nói nó được sản xuất với mục đích chữa bệnh nhưng nó đã khiến rất nhiều người bị bệnh.", --
		GLOWBERRY_GIN = "Rượu Gin lấp lánh! Nhưng nó không có trong đèn.",
		ABSINTHE = "Tôi nghĩ tôi nghe nói nó được gọi là nàng tiên xanh!",
		TEA_LUMPY_VODKA = "Thứ này trông có vẻ tốt cho sức khỏe! Nhưng nó vẫn là rượu.",
		PETALS_BERRY_BRANDY = "Tôi không biết mùi vị thế nào, nhưng nó trông khá ngon!",
		KAHLUA = "Tôi nghĩ ông Warly muốn uống cà phê và rượu",
		NUT_CORN_WHISKEY = "Sẽ tốt hơn nếu nó ở dạng mà tôi có thể ăn được.",-- 
		RUINCACAO_CREAM_LIQUEUR = "Trông ngon quá! Tiếc là lại là rượu.",
		RUMCHATA = "Trông ngọt ngào và mềm mại!",

		--콜라보 증류주

		MOONWAY = "Bảy màu sắc tỏa sáng trong lòng bàn tay tôi.",
		ARRACK = "Tôi ước gì trái cây nằm trong tay mình.",
		CHERRY_BLOOM_RUM = "Bộ sưu tập lỗi của tôi trông sẽ rất đẹp!",
		RICE_SPIRITS = "Ugh, sao lại có người thích cái này nhỉ?",
		WHEAT_WHISKEY = "Cái này có thể hoạt động như một chất khử trùng trong chốc lát!",
		PALE_WHISKEY = "Tôi nghĩ đó là một loại thuốc nào đó.",

		--왈리 전용 콜라보 증류주

		NUT_COCONUT_BRANDY = "Đồ uống cho cướp biển!",
		GIANT_BLUEBERRY_GIN = "Không lấy vũ khí!",

		--냄비 요리

		DARK_RUINCOLATE = "Tôi nghĩ ông Warly đã phạm sai lầm.",
        WHITE_RUINCOLATE = "Chúng ta hãy tiết kiệm để không ăn quá nhiều cùng một lúc nhé!", --
		RUINCOLATE = "Oompa loompa doompety doo.",
		RUIN_SCHOKAKOLA = "Ít nhất sô cô la sẽ không bị đè bẹp trong chuyến phiêu lưu của tôi.",

		BUCKET_STEEL_EMPTY = 
		{
			EMPTY = "Quá nhỏ để đeo đầu.",
			FULL = "Bây giờ có thể uống an toàn!",
			FULL_ICE = "Ồ, bây giờ tôi phải đun nó.",
			DIRTY = "Tôi nghĩ chuyện này trở nên tệ rồi!",
			DIRTY_ICE = "Tôi không nghĩ mình có thể ăn được cục đá nước này.",
		},

		BUCKET_WOODIE_EMPTY = 
		{
			EMPTY = "Cái thùng này thật hoang tàn!",
			FULL = "An toàn để uống bây giờ!",
			FULL_ICE = "Ồ, bây giờ tôi phải đun nó.",
			DIRTY = "Tôi nghĩ chuyện này trở nên tệ rồi!",
			DIRTY_ICE = "Tôi không nghĩ mình có thể ăn được đá.",
		},

		BUCKET_DRIFTWOOD_EMPTY =
		{
			EMPTY = "Cảm như một chiếc xô trôi dạt vào đảo hoang vậy!",
			FULL = "An toàn để uống bây giờ!",
			FULL_ICE = "Ồ, bây giờ tôi phải đun nó.",
			DIRTY = "Tôi nghĩ chuyện này trở nên tệ rồi!",
			DIRTY_ICE = "Tôi không nghĩ mình có thể ăn được đá.",
		},

		BUCKET_EMPTY = 
		{
			EMPTY = "Tốt nhất nên tiết kiệm nước mưa cho công cuộc sinh tồn này!",
			FULL = "An toàn để uống bây giờ!",
			FULL_ICE = "Ồ, bây giờ tôi phải đun nó.",
			DIRTY = "Tôi nghĩ chuyện này trở nên tệ rồi!",
			DIRTY_ICE = "Tôi không nghĩ mình có thể ăn được đá.",
		},

		DESALINATOR =
		{
			EMPTY = "Sổ tay không nói gì về việc lọc nước muối.",
			PURIFY_LONG = "Việc này sẽ mất nhiều thời gian. Tôi sẽ đi khám phá cùng Woby.",
			PURIFY_SHORT = "Tôi nghĩ mọi việc gần như đã hoàn tất!",
			HASWATER = "Không còn muối nữa!",
			BURNT = "Vậy cái này...cháy rồi.",
			HASSALT = "Muối chỉ là chất bổ sung!",
		},

		BARREL =
		{
			GENERIC = "Nước sẽ luôn sạch!",
			BURNT = "Không phải nước của tôi!!",
		},

		BREWERY =
		{
			EMPTY = "Đó là một cái thùng lớn!",
			BURNT = "Nó bị cháy đáng lẽ việc của nó là ủ rượu.",
			FERMENTING_LONG = "Việc này sẽ mất nhiều thời gian. Thôi nào Woby, đi chơi thôi.",
			FERMENTING_SHORT = "Nếu bạn lắng nghe kỹ, bạn có thể nghe thấy tiếng bong bóng.",
			DONE = "Tôi nghĩ là xong rồi!",
		},

		CAMPKETTLE_ITEM = "Không bao giờ là thông minh nếu uống thứ gì đó từ vùng hoang dã.",
		CAMPKETTLE =
		{
			GENERIC = "Đun sôi nước thiên nhiên sẽ an toàn hơn.",
			BOILING_LONG = "Tốt hơn hết hãy đảm bảo nó không sôi quá nhiều.",
			BOILING_SHORT = "Nó đang sôi!",
			DONE = "An toàn để uống bây giờ!",
			STOP = "Hãy tìm củi trước khi chúng ta khát Woby.",
		},

		CAMPDESALINATOR_ITEM = "Sổ tay nói không được uống nước muối.",
		CAMPDESALINATOR =
		{
			GENERIC = "Chúng ta sẽ đun sôi nước biển thành hơi nước để tạo thành nước thường.",
			BOILING_LONG = "Các bạn có muốn nghe kể chuyện trong khi chúng tôi chờ đợi không?",
			BOILING_SHORT = "Tôi nghĩ mọi việc gần như đã hoàn tất!",
			DONE = "Nó sẽ không còn mặn nữa!",
			STOP = "Hãy tìm củi trước khi chúng ta khát Woby.",
		},

		KETTLE =
		{
			EMPTY = "Quy tắc 3-3-3! Bạn sẽ không thể tồn tại 3 ngày nếu không có nước!",
			BURNT = "Vậy cái này... bị cháy!",
			BOILING_LONG = "Việc này sẽ mất nhiều thời gian. Thôi nào Woby, đi chơi thôi.",
			BOILING_SHORT = "Gần như sẵn sàng!",
			DONE = "Tôi nên nói với mọi người ở trại rằng mọi việc đã xong!",
			PURIFY_LONG = "Không hoàn thành còn tệ hơn.",
			PURIFY_SHORT = "Chúng ta sẽ sống sót thêm ba ngày nữa!",
			HASWATER = "Bây giờ hãy tìm thứ gì đó để pha với Woby!",
			MELT_LONG = "Cần tan chảy nhiều hơn.",
			MELT_SHORT = "Gần như đã tan chảy xong.",
		},

		PORTABLEKETTLE_ITEM =
		{
			GENERIC = "Bây giờ chúng ta có thể uống rượu ở nơi hoang dã!",
			EMPTY = "Tôi nghĩ chúng ta nên tìm nước trước.",
			BOILING_LONG = "Việc này sẽ mất nhiều thời gian. Thôi nào Woby, đi chơi thôi.",
			BOILING_SHORT = "Gần như sẵn sàng!",
			DONE = "Tôi cũng có thể thưởng thức một tách trà ưa thích ở nơi hoang dã!",
			PURIFY_LONG = "Không hoàn thành còn tệ hơn.",
			PURIFY_SHORT = "Bây giờ chúng ta có thể khám phá thêm ba ngày nữa!",
			HASWATER = "Bây giờ hãy tìm thứ gì đó để pha với Woby!",
			MELT_LONG = "Cần tan chảy nhiều hơn.",
			MELT_SHORT = "Gần như đã tan chảy xong.",
		},

		DISTILLERS =
		{   
		    EMPTY = "Nó có đủ loại tiện ích phức tạp kèm theo!", --
			DISTILLTING_LONG = "Sẽ mất một lúc.", --Còn rất nhiều cho đến khi quá trình chưng cất hoàn tất.
			DISTILLING_SHORT = "Tôi nghĩ đó là rượu?", --Quá trình chưng cất sẽ sớm kết thúc
			DONE = "Tôi nên nói với những người ở trại đồ uống đã sẵn sàng.", --Có đồ uống trong máy chưng cất.
		},

		WELL_WATERPUMP = {
			HIGH_PRESSURE = "Sức mạnh của hơi nước thật tuyệt vời!", -- Áp suất tối đa
			MIDDLE_PRESSURE = "Giỏi như ông Wolfgang!", -- Áp suất trung bình
			LOW_PRESSURE = "Máy có cần thêm thức ăn không?", -- 
			RECHARG_PRESSURE = "Chúng ta cần tìm một cái ao Woby.", -- Khi không có áp lực nào cả.
		},

		WELL_SPRINKLER =
		{ 
			LOWFUEL = "Tôi cần cho thêm gỗ vào.", 
			ON = "Kỳ lạ đấy, Woby thích nó!",
			OFF = "Đang tạm nghỉ.",
		},
	}
}