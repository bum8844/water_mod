return {
    ACTIONFAIL =
    {
        GIVE =
        {
            WELL_NOTEMPTY = "Nó đã đầy.", -- Cố gắng đưa một cái xô không rỗng vào giếng 
            WELL_BUSY = "Nó bận.", -- Cố gắng đưa một xô nước vào giếng
        }
    },

    ANNOUNCE_DRUNK = "Woozy...", -- Nhân vật nói rượu

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

    ANNOUNCE_DRUNK_END = "Phew...", -- Nhân vật tỉnh táo (nôn nao)
    ANNOUNCE_DRUNK_IMMUNITY = "", -- Tạm thời. Dành riêng cho Wigfrid.
    ANNOUNCE_NOTCHARGE = "Người bạn nguệch ngoạc của tôi vẫn chưa sẵn sàng.", -- Cố gắng vắt sữa một con dê volt miễn phí
    ANNOUNCE_NOTHIRSTSLEEP = "Quá khát không ngủ được.", -- Nhân vật khát quá không ngủ được vào ban đêm
    ANNOUNCE_NOTHIRSTSIESTA = "Quá khát để ngủ trưa.", -- Nhân vật quá khát để ngủ trưa trong ngày
    ANNOUNCE_SLEEP_END = "", -- Nhân vật thức dậy sau khi ngủ và hoàn toàn tỉnh táo sau cơn say
    ANNOUNCE_THIRST = "Tôi cần uống nước.", -- Nhân vật rất khát

    ANNOUNCE_CAFFINE_BUFF_START = "Tôi cảm thấy thật bồng bềnh.", -- Nhân vật nhận được buff caffeine
    ANNOUNCE_CAFFINE_BUFF_STOP = "Bây giờ không còn nảy nữa.", -- Nhân vật mất buff caffeine

    ANNOUNCE_CURE_WATERBORNE = "", -- Thông báo khi chữa khỏi bệnh lây qua đường nước bằng một vật phẩm (trích dẫn của Wormwood, dành riêng cho anh ta)

    ANNOUNCE_DCAPACITY_CRITICAL = "Có gì đó không ổn...", -- Nhân vật sắp say
    ANNOUNCE_DCAPACITY_HALF = "Ugh...", -- Nhân vật bắt đầu cảm nhận được tác dụng của rượu

        DESCRIBE =
        {
            BOILBOOK = "Thức uống",

            WATER_CLEAN_ICE = "Lạnh. Rất lạnh", -- Nước đá sạch
            WATER_DIRTY_ICE = "Lạnh. Rất lạnh", -- Nước đá bẩn

            SPICE_CAFFEINPEPPER = "(Ngửi) Thật phấn khởi! Thật phấn khởi!", -- Gia vị hạt tiêu

            WELL_KIT = "Trồng nó vào hố", -- Bộ đồ tốt
            WELL_SPRINKLER_KIT = "Trồng gần hố hoặc vũng nước", -- Bộ phun nước
            WELL_WATERPUMP_KIT = "Trồng cây vào hố", -- Bộ máy bơm nước hơi nước
            WELL_BURYING_KIT = "Chặn lỗ", -- Bộ chôn lỗ
            WELL_DRILLING = "Đào một cái lỗ trên mặt đất", -- Khoan một cái lỗ
            WELL_DRILLING_ITEM = "Dụng cụ tạo lỗ", -- Dụng cụ khoan
            HOLE = "Có nước bên trong", -- Lỗ giếng
            WELL = "Bạn có thể lấy nước", -- Vâng

            WX78MODULE_NONEDRUNK = "Bíp bíp", -- 78전용 묘듈

            -- Cây chế độ nước

            TEA_TREE = "Người bạn sành điệu", -- Cây trà
            DUG_TEA_TREE = "Cần đất", -- Đào cây chè lên
            TEA_SEED = "Cô bé sành điệu!", -- Quả cây trà
            TEA_SEED_COOKED = "Bây giờ có thể ăn được", -- Quả cây trà đã nấu chín
            TEA_SEED_SAPLING = "Lớn lên là một người sành điệu!", -- Cây non trà
            TEALEAVES = "Cảm ơn, người bạn sành điệu!", -- Lá trà
            TEALEAVES_DRIED = "Hmm...tôi thích mùi này", -- Lá trà khô

            CAFFEINBERRY = "Người bạn đá ăn được", -- Bụi cây cà phê
            DUG_CAFFEINBERRY = "Cần đất", -- Đào bụi cà phê lên
            CAFFEINBERRY_BEAN = "Mùi thơm", -- Hạt cà phê thô
            CAFFEINBERRY_BEAN_COOKED = "Rất ngon!", -- Hạt cà phê nấu chín

            RUINCACAO_TREE = "Người bạn như cây xương rồng", -- Cây cacao
            DUG_RUINCACAO_TREE = "Cần đất", -- Đào cây cacao lên
            RUINCACAO_SEED = "Bạn bé cần đất", -- Vật phẩm cây giống Cacao
            RUINCACAO_SEED_SAPLING = "Làm tốt lắm!", -- Đã trồng cây cacao
            RUINCACAO = "Nhà bạn bé", -- Quả cacao trước khi bẻ
            RUINCACAO_BEAN = "Thực phẩm có dầu", -- Hạt cacao sau khi vỡ
            RUINCACAO_BEAN_COOKED = "Ăn liền", -- Hạt cacao nấu chín

            -- Phụ gia chưng cất

            ADDITIVE_SEED = "Có những hạt nhỏ bên trong", -- Phụ gia rượu mùi cho hạt (hồi, quả bách xù, v.v.)
            ADDITIVE_PETALS = "Có những thứ xinh đẹp bên trong", -- Phụ gia rượu mùi cho các loại thảo mộc, lá trà, cánh hoa
            ADDITIVE_NUT = "Những thứ ăn được ở bên trong", -- Phụ gia rượu mùi cho hạt bạch dương, dừa, hạt cà phê, hạt cacao
            ADDITIVE_DAIRY = "Hmm?", -- Phụ gia rượu mùi cho các sản phẩm sữa

            -- Đồ uống

            WATER_CLEAN = "Uống sạch", -- Nước sạch
            WATER_DIRTY = "Uống bẩn", -- Nước bẩn
            WATER_SALTY = "Không thể uống được", -- Nước mặn

            GOOPYDRINK = "Sulp", -- Đồ uống thất bại (khái niệm ướt át)

            -- Ấm đun nước uống

            FRUITJUICE = "Trái cây trộn để uống", -- Nước ép trái cây hỗn hợp
            BERRIES_JUICE = "Uống ngọt", -- Nước ép quả mọng
            POMEGRANATE_JUICE = "Hạt trái cây để uống", -- Nước ép lựu
            BANANA_JUICE = "Ngọt ngào với chút tóc", -- Nước chuối
            FIG_JUICE = "Nước ngọt túi", -- Nước ép sung
            DRAGONJUICE = "Trái cây đẹp để uống", -- Nước ép thanh long
            GLOWBERRYJUICE = "Uống một ngụm phát sáng", -- Nước ép Glowberry
            WATERMELON_JUICE = "Uống ẩm và ngọt", -- Nước ép dưa hấu

            VEGGIE_TEA = "Uống cam?", -- Nước ép xanh
            CARROT_TEA = "Uống cam", -- Trà cà rốt
            CACTUS_TEA = "Có gì đó gai góc bên trong", -- Trà xương rồng
            TOMATO_JUICE = "Nước bóng cẩu thả", -- Nước ép cà chua
            LUMPY_TEA = "Làm từ đất trồng để uống", -- Trà rễ
            SEAWEED_SHAKE = "Toàn đồ trơn", -- Sinh tố rong biển

            GREENTEA = "Khóc như người sành điệu", -- Trà xanh tươi
            BLACKTEA = "Mùi rất thơm", -- Trà đen
            BLACKTEA_ICED = "Sáng mát", -- Trà đen đá
            FUER = "Tốt cho bệnh viêm họng", -- Trà lá (lá thường xuân, lá nguyệt quế, dương xỉ)
            MIXFLOWER = "Mùi hương thơm ngào ngạt", -- Trà cánh hoa hỗn hợp
            HIBISCUSTEA = "Tôi thích mùi này", -- Trà dâm bụt
            CACTUSFLOWER_TEA = "Tôi muốn uống nó", -- Trà hoa xương rồng
            LOTUSTEA = "Mùi thơm", -- Trà sen
            SUSHIBISCUS = "Hmm... không thích mùi này", -- Trà tự sát (cây tầm ma, lá cà rốt, mù tạt)
            MOON_BLOSSOM_TEA = "Hmm... mùi thơm quá", -- Trà hoa trăng

            CAFFEINBERRY_JUICE = "Yeehaw!", -- Cà phê đen
            TOFFEE_LATTE = "Mùi hạt dẻ dễ chịu", -- Latte kẹo bơ cứng
            RUINCHA_LATTE = "Ngọt và đậm đà!", -- Mocha latte (cà phê + sô cô la)

            HOTRUINCOLATE = "Làm ấm", -- Sôcôla nóng
            RUINCOLATE_SMOOTHIE = "Làm lạnh", -- Sinh tố sô cô la (ướp lạnh)
            RUINXOCOLATL = "Uống nhưng đắng", -- Chocolatl (cay)
            TEA_RUINCOLATE_LATTE = "Có hương thơm phong cách", -- Matcha latte

            MULLED = "Hâm nóng bên trong, zzz", -- Bángshòu
            BUTTERBEER = "Uống một ngụm!", -- Bia bơ từ bộ truyện Harry Potter

            -- Đồ uống ấm đun nước cộng tác

            COCONUT_JUICE = "Sôi bong bóng", -- Nước cốt dừa bị đắm tàu
            RAINBOW_SHAKE = "Được làm bằng những thứ sủi bọt xinh xắn", -- Thạch lắc cầu vồng Shipwrecked
            QUARTZ_SHAKE = "Được làm bằng bong bóng cứng", -- Sự sang trọng có lớp vỏ bị đắm tàu
            CHERRY_ROSEBERRIES_TEA = "Có mùi thơm nồng", -- Trà Tầm Xuân Rừng Anh Đào
            CHERRY_HONEY_TEA = "Những con ong thích nó", -- Trà mật ong hoa anh đào rừng anh đào
            SWEET_RICE_DRINK = "Ngọt!", -- Sake VitaHive
            ANANAS_JUICE = "Dành cho vương miện", -- Nước ép Legion Pineananas
            ORANGE_JUICE = "Một quả cầu có múi để uống", -- Thêm gói thực phẩm Nước cam
            STRAWBERRY_SMOOTHIE = "Mát và thơm", -- Gói thực phẩm khác Sinh tố dâu tây
            STRAWBERRY_MILK_SMOOTHIE = "Kem và thơm", -- Gói thực phẩm khác Sinh tố sữa dâu

            -- Đồ uống chưng cất

            SPOILED_DRINK = "Có thể uống được, đáng ngạc nhiên", -- Đồ uống bị hỏng

            -- Nhà máy chưng cất soda

            SODA = "Nước có ga", -- Nước có ga
            FRUITSODA = "Nước trái cây sủi bọt", -- Soda trái cây
            LEMONLIMESODA = "Sủi bọt và ngọt ngào", -- Soda chanh chanh (loại Soda trái cây cao cấp hơn)
            COLA = "Nước đen sủi bọt", -- Cola
            COLAQUANTUM = "Xì hơi và rạng rỡ", -- Cola Quantum
            LUMPY_BEER = "Nước rễ cây có ga", -- Bia gốc (không phải đồ uống có cồn)

            -- Nhà máy chưng cất rượu

            CORN_BEER = "Hạt nhỏ lên men", -- Bia ngô
            MADHU = "Nước ép lên men", -- Madhu
            WINE = "Nhỏ và lên men", -- Rượu vang (đơn giản được làm từ quả mọng)
            NOBLEWINE = "Nhỏ và nướng, lên men", -- Noble Wine (làm từ quả nướng)
            SPARKLINGWINE = "Sủi bọt và lên men", -- Rượu vang sủi
            GLOWBERRYWINE = "Rực rỡ và lên men", -- Rượu Glowberry
            KUMIS = "Sah-ha-ye", -- Kumis, sữa ngựa lên men
            LUMPY_WINE = "Rooty và lên men", -- Sake (làm từ rễ như khoai tây hoặc khoai lang)
            PULQUE = "Hoàn toàn sah-ha-ye", -- Pulque (nước ép cây thùa lên men)
            RUINCACAO_WINE = "Không đắng lắm", -- Rượu Cacao

            -- Soda hợp tác

            CHERRY_DOCTOR_COLA = "Nước sẫm màu có mùi trái cây sủi bọt", -- Cherry Forest Doctor Pepper (Doctor Cherry)
            ANANASSODA = "Nước sủi bọt phù hợp cho vương miện", -- Thông có ga (Olimar's)
            ORANGESODA = "Nước quả cầu màu cam sủi bọt", -- Cam có ga (Fanta)
            STRAWBERRYSODA = "Nước trái cây sủi bọt và ngọt ngào", -- Dâu có ga (Dâu xứ Wales)

            -- Rượu hợp tác

            AUROBOW = "Đầy màu sắc!", -- Aurobouros bị đắm tàu, Thạch cầu vồng
            COCONUT_WINE = "Không có sợi gì đó rối rắm", -- Rượu dừa đắm tàu
            CHERRY_BLOOM_MADHU = "Cánh hoa xinh xắn nổi lềnh bềnh", -- Rừng anh đào Mật ong hoa anh đào Madhu
            GIANT_BLUEBERRY_WINE = "Đoàng! Trái cây nổ lên men", -- VitaHive Boom!Berry Sapphire (nổ khi bắt lửa)
            RICE_WINE = "Chả thấy ngọt...", -- VitaHive Makgeolli
            WHEAT_BEER = "Những hạt lúa xinh xắn được lên men", -- Hip của Bia lúa mì thực phẩm
            PALE_BEER = "Những quả tròn tròn được lên men", -- Legion Pale Ale (bia được làm từ nhiều loại rễ khác nhau như khoai mỡ)

            -- Rượu chưng cất

            DISINFECTANT = "Tốt cho vết thương", -- Thuốc khử trùng
            CORN_WHISKEY = "Uống hạt nhỏ", -- Whisky ngô
            LUMPY_VODKA = "Rõ ràng", -- Vodka
            TEQUILA = "Không có màu trắng", -- Tequila
            MADHU_RUM = "Nước ép bong bóng, khá sạch", -- Rum
            BERRY_BRANDY = "Ăn nhỏ, uống nhanh", -- Berry Brandy
            AREUHI = "Không phải Ha-ye", -- Rượu chưng cất Kruse Areuhi

            -- Rượu chưng cất độc quyền của Warly

            BERRY_GIN = "Không ngọt nhưng khá dễ uống", -- Gin
            GLOWBERRY_GIN = "Hoàng Quang và dễ uống", -- Rượu Gin Glowberry
            ABSINTHE = "Xanh lá và dễ uống", -- Absinthe
            TEA_LUMPY_VODKA = "Hey mấy ông đồng chí ngầu lòi của tôi, vào trong đi!", -- Vodka
            PETALS_BERRY_BRANDY = "Đầy màu sắc", -- Rượu mạnh hoa hồng
            KAHLUA = "Đen đặc và dễ uống", -- Rượu mùi cà phê Kahlua
            NUT_CORN_WHISKEY = "Có hương thơm của hạt dẻ", -- Whisky hạt
            RUINCACAO_CREAM_LIQUEUR = "Hương vị phong phú", -- Rượu mùi kem ca cao Baileys
            RUMCHATA = "Phong phú và tiếp thêm sinh lực", -- Rumchata (một sản phẩm từ sữa trộn với rượu rum)

            -- Hợp tác chưng cất rượu mạnh

            MOONWAY = "Đầy mùi vị như màu sắc của chúng", -- Rượu chưng cất sứa cầu vồng
            ARRACK = "Đồ uống không mịn cho lắm", -- Arrack phiên bản rượu dừa chưng cất của Indonesia
            CHERRY_BLOOM_RUM = "Sánh mịn để uống", -- Rượu anh đào Mật ong chưng cất Lá hoa anh đào nổi
            RICE_SPIRITS = "Rõ ràng đến khó tin!", -- Rượu gạo
            WHEAT_WHISKEY = "Nước từ hạt xinh xắn dễ uống", -- Whisky lúa mì
            PALE_WHISKEY = "Nước quả tròn tròn dễ uống", -- Whisky mạch nha nhạt

            -- Rượu hợp tác của nhà máy chưng cất độc quyền Warly

            NUT_COCONUT_BRANDY = "Trong suốt",
            GIANT_BLUEBERRY_GIN = "Dễ uống nhưng bùm bùm!", -- Boom Berry Sapphire (carrot explodes when ignited)

            -- Pot Recipes

            DARK_RUINCOLATE = "Ăn thứ gì đó tối", -- Sôcôla đen
            WHITE_RUINCOLATE = "Ăn thứ gì đó màu trắng", -- Sôcôla trắng
            RUINCOLATE = "Ăn thứ gì đó màu nâu", -- Sô cô la nguyên chất
            RUIN_SCHOKAKOLA = "Ăn thứ gì đó khiến mắt bạn lấp lánh", -- Schokakola

            BUCKET_STEEL_EMPTY =
            {
                EMPTY = "Một thùng thép rỗng", -- Xô thép rỗng
                FULL = "Nước sạch uống được", -- Nước mưa sạch được thu gom
                FULL_ICE = "Sạch và lạnh", -- Nước mưa đã đóng băng
                DIRTY = "Uống bẩn", -- Nước mưa đã trở nên bẩn
                DIRTY_ICE = "Bẩn và đóng băng", -- Nước mưa bẩn đã đóng băng
            },

            BUCKET_WOODIE_EMPTY =
            {
                EMPTY = "Tôi đã tìm hiểu về bạn bè, heh...", -- Thùng gỗ rỗng của Woodie
                FULL = "Nước sạch uống được", -- Nước mưa sạch được thu gom
                FULL_ICE = "Sạch và lạnh", -- Nước mưa đã đóng băng
                DIRTY = "Uống bẩn", -- Nước mưa đã trở nên bẩn
                DIRTY_ICE = "Bẩn và đóng băng", -- Nước mưa bẩn đã đóng băng
            },

            BUCKET_DRIFTWOOD_EMPTY =
            {
                EMPTY = "Được làm bởi những người bạn nước", -- Thùng gỗ rỗng
                FULL = "Nước sạch uống được", -- Nước mưa sạch được thu gom
                FULL_ICE = "Sạch và lạnh", -- Nước mưa đã đóng băng
                DIRTY = "Uống bẩn", -- Nước mưa đã trở nên bẩn
                DIRTY_ICE = "Bẩn và đóng băng", -- Nước mưa bẩn đã đóng băng
            },

            BUCKET_EMPTY =
            {
                EMPTY = "Làm từ bạn bè", -- Thùng gỗ rỗng
                FULL = "Nước sạch uống được", -- Nước mưa sạch được thu gom
                FULL_ICE = "Sạch và lạnh", -- Nước mưa đã đóng băng
                DIRTY = "Uống bẩn", -- Nước mưa đã trở nên bẩn
                DIRTY_ICE = "Bẩn và đóng băng", -- Nước mưa bẩn đã đóng băng
            },

            DESALINATOR =
            {
                EMPTY = "Tách nước mặn", -- Không có nước trong máy khử muối
                PURIFY_LONG = "Đợi đã...", -- Vẫn còn một thời gian dài để thanh lọc
                PURIFY_SHORT = "Sắp hoàn tất", -- Quá trình thanh lọc gần như hoàn tất
                HASWATER = "Xong!", -- Nước sạch có trong máy khử muối
                BURNT = "Không tốt", -- Máy khử muối đã cháy hết
                HASSALT = "Rất nhiều muối", -- Vẫn còn muối trong máy khử muối
            },

            BARREL =
            {
                GENERIC = "Cất trữ nước uống được", -- Kiểm tra thùng
                BURNT = "Ồ không", -- Thùng đã cháy rồi
            },

            BREWERY =
            {
                EMPTY = "Sủi bọt để làm", -- Kiểm tra nhà máy bia
                BURNT = "Không tốt", -- Nhà máy bia đã bị cháy
                FERMENTING_LONG = "Đợi...", -- Còn một thời gian dài để lên men
                FERMENTING_SHORT = "Sắp xong", -- Quá trình lên men gần như hoàn tất
                DONE = "Tất cả đã xong!", -- Đồ uống đã sẵn sàng trong nhà máy bia
            },

            CAMPKETTLE_ITEM = "Làm sạch nước bẩn", -- Kiểm tra hạng mục ấm đun nước di động
            CAMPKETTLE =
            {
                GENERIC = "Không có nước", -- Không có nước trong ấm cắm trại
                BOILING_LONG = "Đợi...", -- Nước vừa bắt đầu sôi
                BOILING_SHORT = "Sắp xong", -- Nước gần sôi
                DONE = "Xong!", -- Nước sạch đã sẵn sàng
                STOP = "Không sạch", -- Lửa trại đã tắt, nước bẩn không thể đun sôi
            },

            CAMPDESALINATOR_ITEM = "Nước mặn sạch", -- Kiểm tra thiết bị khử muối di động
            CAMPDESALINATOR =
            {
                GENERIC = "Không có nước", -- Không có nước trong máy khử muối của trại
                BOILING_LONG = "Đợi đã...", -- Mới bắt đầu khử muối trong nước
                BOILING_SHORT = "Sắp hoàn tất", -- Quá trình khử muối trong nước gần như hoàn tất
                DONE = "Xong!", -- Nước sạch đã sẵn sàng
                STOP = "Không thể uống được", -- Lửa trại đã tắt, nước mặn không thể lọc được
            },

            KETTLE =
            {
                EMPTY = "Chưa có nước", -- Ấm đã cạn
                BURNT = "Ồ không", -- Ấm đun nước đã cháy rồi
                BOILING_LONG = "Đợi đã...", -- Mới bắt đầu nấu đồ uống
                BOILING_SHORT = "Sắp xong", -- Đồ uống đã gần xong
                DONE = "Xong!", -- Đồ uống đã sẵn sàng
                PURIFY_LONG = "Nó bẩn", -- Mới bắt đầu lọc nước bẩn
                PURIFY_SHORT = "Sắp xong", -- Nước bẩn gần như được lọc sạch
                HASWATER = "Chúng ta muốn gì?", -- Nước sạch có trong ấm
                MELT_LONG = "Trời lạnh", -- Nước đá vừa bắt đầu tan
                MELT_SHORT = "Sắp xong", -- Nước đá gần tan
            },

            PORTABLEKETTLE_ITEM =
            {
                GENERIC = "Pha đồ uống", -- Kiểm tra hạng mục ấm đun nước di động
                EMPTY = "Không có nước...", -- Kiểm tra ấm đun nước di động được đặt trống
                BOILING_LONG = "Đợi...", -- Nước vừa bắt đầu sôi
                BOILING_SHORT = "Sắp xong", -- Nước gần sôi
                DONE = "Xong rồi!", -- Đồ uống đã sẵn sàng
                PURIFY_LONG = "Bẩn", -- Mới bắt đầu lọc nước bẩn
                PURIFY_SHORT = "Sắp xong", -- Nước bẩn gần như đã được lọc sạch
                HASWATER = "Bạn muốn làm món gì?", -- Nước sạch có trong ấm
                MELT_LONG = "Trời lạnh", -- Nước đá vừa bắt đầu tan
                MELT_SHORT = "Sắp xong", -- Nước đá gần tan
            },

            DISTILLERS =
            {
                EMPTY = "Bong bóng chưng cất", -- Kiểm tra máy chưng cất
                DISTILLTING_LONG = "Đợi...", -- Vẫn còn một thời gian dài để chưng cất
                DISTILLING_SHORT = "Sắp hoàn thành", -- Quá trình chưng cất gần như hoàn tất
                DONE = "Tất cả đã xong!", -- Đồ uống đã sẵn sàng trong máy chưng cất
            },

            WELL_WATERPUMP = {
                HIGH_PRESSURE = "Phun phun", -- Áp suất tối đa
                MIDDLE_PRESSURE = "Đủ", -- Áp suất trung bình
                LOW_PRESSURE = "Cần hơi nước", -- Hầu như không có áp suất
                RECHARG_PRESSURE = "Hết hơi", -- Không có áp suất nào cả (không thể sử dụng tính năng này cho đến khi áp suất trở lại mức tối đa)
            },

            WELL_SPRINKLER =
            {
                LOWFUEL = "Cần nhiên liệu", -- Gần hết nhiên liệu
                ON = "Tặng nước cho bạn bè", -- Hiện đang hoạt động
                OFF = "Người bạn tốt của bạn bè", -- Đã tắt và không hoạt động
            },
        },
    }