return {
    ACTIONFAIL =
    {
        GIVE =
        {
            WELL_NOTEMPTY = "Tôi nên loại bỏ thùng đó trước.",
            WELL_BUSY = "Cái thùng vẫn ở dưới vực thẳm.",
        }
    },

    ANNOUNCE_DRUNK = "Nức nở... Abigail, tôi cô đơn quá...", -- Say rượu
    ANNOUNCE_DRUNK_END = "Đừng cười, Abigail. Thật xấu hổ.", -- Tỉnh táo (Hungover)
    ANNOUNCE_DRUNK_IMMUNITY = "",
    ANNOUNCE_NOTCHARGE = "Không có sữa để vắt à?", -- Lightning dê không sạc được nên không thể vắt sữa vào xô
    ANNOUNCE_NOTHIRSTSLEEP = "Cổ họng tôi chìm trong vực thẳm. Bây giờ tôi không thể ngủ được.", -- Cố gắng ngủ vào ban đêm trong khi khát nước
    ANNOUNCE_NOTHIRSTSIESTA = "Cổ họng tôi khô rát vì nắng. Bây giờ tôi không thể ngủ được.", -- Cố gắng ngủ vào ban ngày trong khi khát nước
    ANNOUNCE_SLEEP_END = "Đó không phải là một giấc mơ. Vẫn là một cơn ác mộng!", -- Tỉnh dậy sau khi ngủ và hoàn toàn tỉnh táo
    ANNOUNCE_THIRST = "Cổ họng tôi khô rát!", -- Khát nước

    ANNOUNCE_CAFFINE_BUFF_START = "Tôi cảm thấy tay chân mình nhẹ nhàng hơn.", -- Quá trình bắt đầu sử dụng caffeine
    ANNOUNCE_CAFFINE_BUFF_STOP = "Cơ thể tôi cảm thấy nặng nề như thường lệ.", -- Hết hiệu ứng caffeine

    ANNOUNCE_CURE_WATERBORNE = "Mặc dù cơn đau này đã dịu đi nhưng chắc chắn sẽ còn nhiều cơn đau hơn nữa.", -- Chữa bệnh do đường nước bằng một vật phẩm

    ANNOUNCE_DCAPACITY_CRITICAL = "Tôi có thể quên đi sự xấu hổ, nhưng Abigail thì không.", -- Cảnh báo thiếu tỉnh táo
    ANNOUNCE_DCAPACITY_HALF = "Bây giờ tôi đã hiểu tại sao tôi lại xấu hổ đến thế.", -- Cảnh báo nửa tỉnh táo

        DESCRIBE =
        {
            BOILBOOK = "Ngay cả khi tôi có thể sôi cổ họng, nó cũng chỉ chảy nước mắt.",

            WATER_CLEAN_ICE = "Cóng như trái tim tôi.",
            WATER_DIRTY_ICE = "Nước bẩn và đóng băng.",

            SPICE_CAFFEINPEPPER = "Nó linh hoạt hơn tôi.",

            WELL_KIT = "Nặng nề nhưng tôi cần tìm ra động lực.",
            WELL_SPRINKLER_KIT = "Nếu tôi cho nó biết nơi cài đặt, máy sẽ tự tìm vị trí của nó.",
            WELL_WATERPUMP_KIT = "Trái tim máy móc lạnh lùng.",
            WELL_BURYING_KIT = "Tạo một cái hố sâu như vậy và cắm cọc vào đó sẽ không giúp được gì.",
            WELL_DRILLING = "Khoan một lỗ lớn vào lòng đất.",
            WELL_DRILLING_ITEM = "Nó sẽ khoan một lỗ sâu vào lòng đất.",
            HOLE = "Tôi vẫn chưa chạm đáy, làm sao tôi có thể về nhà được?", -- (Cuộc phiêu lưu của Alice ở xứ sở thần tiên)
            WELL = "Tôi tự hỏi liệu tôi ném một đồng xu vào có mang lại điều ước không?",

            WX78MODULE_NONEDRUNK = "Nó trông mỏng manh quá...hy vọng không có tai nạn thương tâm nào xảy ra với nó.", -- 78전용 묘듈

            -- Cây bị úng

            TEA_TREE = "Lá tươi tốt.", -- Cây Trà
            DUG_TEA_TREE = "Tôi thích nó chết như vậy nhưng tôi nên trả nó xuống đất.", -- Đào cây trà lên
            TEA_SEED = "Cuộc sống đã tìm được chỗ đứng giữa những bất ổn.", -- Tea Tree Seed
            TEA_SEED_COOKED = "Nó đã bị nướng chết.", -- Hạt giống cây trà đã nấu chín
            TEA_SEED_SAPLING = "Rễ có thể là một, nhưng thân không hòa hợp được.", -- Cây non cây trà
            TEALEAVES = "Những chiếc lá sẽ không bao giờ tự gắn vào thân cây nữa.", -- Lá trà
            TEALEAVES_DRIED = "Chúng nhăn nheo nhiều dưới ánh nắng.", -- Lá trà khô

            CAFFEINBERRY = "Cây tạo ra hạt đậu.", -- Caffeine Bush
            DUG_CAFFEINBERRY = "Hãy yên nghỉ. Bây giờ bạn không có nhà.", -- Đào lên Caffeine Bush
            CAFFEINBERRY_BEAN = "Có vẻ khá kích thích.", -- Caffeine Bean
            CAFFEINBERRY_BEAN_COOKED = "Ai có thể nghĩ rằng bạn có thể có được quyết tâm từ một hạt đậu?", -- Đậu Caffeine nấu chín

            RUINCACAO_TREE = "Nó đốt hạt và biến chúng thành chất dinh dưỡng.", -- Ruincacao Tree
            DUG_RUINCACAO_TREE = "Hang động đó có phải là địa ngục của bạn không?", -- Đào cây Ruincacao lên
            RUINCACAO_SEED = "Tôi đã cứu nó trước khi nó có thể cháy.", -- Ruincacao Seed
            RUINCACAO_SEED_SAPLING = "Sự sống nảy sinh từ bóng tối.", -- Ruincacao Seedling
            RUINCACAO = "Một lọ trang điểm với những sinh vật nhỏ bé bị mắc kẹt bên trong.", -- Ruincacao
            RUINCACAO_BEAN = "Nó chứa đầy dầu.", -- Ruincacao Bean
            RUINCACAO_BEAN_COOKED = "Cuối cùng thì mọi thứ đều giống nhau.", -- Đậu Ruincacao đã nấu chín

            -- Phụ gia chưng cất rượu mạnh

            ADDITIVE_SEED = "Tôi đã thu thập những hạt giống có mùi thơm khác thường.", -- Phụ gia rượu mùi (Hồi, Juniperberry, Parrot Motif)
            ADDITIVE_PETALS = "Cánh và lá hoa khô.", -- Phụ gia rượu mùi (Trà thảo dược, Cánh hoa)
            ADDITIVE_NUT = "Các loại hạt thái nhỏ.", -- Phụ gia rượu mùi (Birchnut, Coconut, Coffee Bean, Cacao Bean)
            ADDITIVE_DAIRY = "Kem kín.", -- Phụ gia rượu mùi (sữa)

            -- Đồ uống

            WATER_CLEAN = "Nó kéo dài tuổi thọ trong giây lát.", -- Nước sạch
            WATER_DIRTY = "Nếu bạn muốn trải nghiệm cơn đau kéo dài, hãy thử cách này.", -- Dirty Water
            WATER_SALTY = "Nó mang lại sự sống nhưng cũng dẫn đến cái chết bằng chất độc của nó.", -- Nước Muối (từ tiểu thuyết "Chúa Ruồi")

            GOOPYDRINK = "Rối tung như chính cuộc sống vậy.", -- Đồ uống thất bại (Rang Ướt)

            -- Đồ uống ấm trà

            FRUITJUICE = "Được làm từ nhiều loại trái cây.", -- Nước ép trái cây hỗn hợp
            BERRIES_JUICE = "Chắc phải mất rất nhiều quả nam việt quất để làm ra một chai.", -- Berry Juice
            POMEGRANATE_JUICE = "Nó sẽ làm quần áo của bạn bị ố đỏ nếu bạn làm đổ nó.", -- Nước ép lựu
            BANANA_JUICE = "Giá như tôi có thể chia sẻ nó với Abigail...", -- Banana Juice
            FIG_JUICE = "Những hạt nhỏ đang mắc vào cổ họng tôi.", -- Fig Juice
            DRAGONJUICE = "À, bây giờ là nước trái cây.", -- Nước ép thanh long
            GLOWBERRYJUICE = "Cơ thể tôi có phát sáng màu xanh không?", -- Glowberry Juice
            WATERMELON_JUICE = "Nước như nước.", -- Nước ép dưa hấu

            VEGGIE_TEA = "Tôi trộn rau và luộc chúng.", -- Trà xanh (Trà rau)
            CARROT_TEA = "Tôi ngâm cà rốt trong nước.", -- Trà cà rốt
            CACTUS_TEA = "Chết đuối đến mức cần nước.", -- Trà xương rồng
            TOMATO_JUICE = "Nó đặc hơn nước nhưng thứ tôi muốn uống chỉ là nước.", -- Tomato Juice
            LUMPY_TEA = "Tôi không thể chiết xuất thêm rễ nào nữa.", -- Trà rễ
            SEAWEED_SHAKE = "Tôi không hiểu các từ nước ngoài.", -- Seaweed Shake

            GREENTEA = "Không biết có thể gọi loại trà này là trà không.", -- Trà xanh lá tươi
            BLACKTEA = "Một khoảng nghỉ ngắn cho những tâm hồn mệt mỏi...", -- Trà đen (Jane Austen / Kiêu hãnh và định kiến)
            BLACKTEA_ICED = "Một khoảng nghỉ ngắn cho tâm hồn mệt mỏi...", -- Trà đen đá
            FUER = "Người bán mũ cho những ngày không phải sinh nhật.", -- Fuertea, Trà lá, Trà dương xỉ (Cuộc phiêu lưu của Alice ở xứ sở thần tiên)
            MIXFLOWER = "Tôi đã hái những cánh hoa và luộc chúng.", -- Trà cánh hoa hỗn hợp
            HIBISCUSTEA = "Nó khá thơm.", -- Trà dâm bụt
            CACTUSFLOWER_TEA = "Dù đã đun sôi nhưng vẫn đẹp. Ghen tị à?", -- Trà hoa xương rồng
            LOTUSTEA = "Sự bình tĩnh đã bén rễ ngay cả trong đau khổ.", -- Trà Sen
            SUSHIBISCUS = "Giá như tôi có thể dành chút thời gian với Abigail...", -- Suicide Tea
            MOON_BLOSSOM_TEA = "Tôi không thể đẹp hơn được nữa.", -- Trà hoa trăng

            CAFFEINBERRY_JUICE = "Đậm và đắng.", -- Cà phê đen
            TOFFEE_LATTE = "Thật ngọt đến nỗi tôi không thể nếm được cà phê.", -- Toffeenut Latte
            RUINCHA_LATTE = "Cà phê dành cho người lớn không uống được thứ đắng.", -- Mocha Latte (Cà phê + Sôcôla)

            HOTRUINCOLATE = "Tôi nhớ ca cao ấm.", -- Sôcôla nóng
            RUINCOLATE_SMOOTHIE = "Vòng xoáy ngọt ngào.", -- Sinh tố Sôcôla (Lạnh)
            RUINXOColaTL = "Tôi và trái tim mình đã lăn xuống cầu thang à?", -- Chocolatl (cay)
            TEA_RUINCOLATE_LATTE = "Đắng nhưng cũng ngọt.", -- Matcha Latte

            MULLED = "Tôi có thể làm tan chảy một trái tim lạnh giá và tan vỡ không?", -- Bancha (Mulled)
            BUTTERBEER = "Ngọt ngào như ma thuật.", -- Butterbeer (loạt phim Harry Potter)

            -- Đồ uống ấm trà hợp tác

            COCONUT_JUICE = "Giá như tôi có thể củng cố nội tâm của mình một lần nữa.", -- Shipwrecked Coconut Juice
            RAINBOW_SHAKE = "Đó là một cái chết đẹp đẽ trong một chiếc cốc.", -- Shipwrecked Rainbow Jelly Shake
            QUARTZ_SHAKE = "Một cái chết xứng đáng cho một kẻ ngốc.", -- Lắc cá vàng của kẻ ngốc bị đắm tàu
            CHERRY_ROSEBERRIES_TEA = "Tôi sẽ cẩn thận không nuốt nụ hoa.", -- Trà hoa hồng anh đào rừng
            CHERRY_HONEY_TEA = "Nó có thể ngọt hơn thế này không?", -- Trà mật ong hoa anh đào rừng anh đào
            SWEET_RICE_DRINK = "Có gì đó dai trong đó.", -- Vita-Hybiscus Sikhye
            PINEANANAS_JUICE = "Tôi xé lớp vỏ cứng và nghiền nát cùi.", -- Nước Dứa Legacy
            ORANGE_JUICE = "Nước ép trái cây thơm và ngọt.", -- Moer Food Pack Orange Juice
            STRAWBERRY_SMOOTHIE = "Thức uống được làm bằng cách nghiền dâu tây với đá.", -- Moer Food Pack Strawberry Smoothie
            STRAWBERRY_MILK_SMOOTHIE = "Mượt mà quấn quanh đầu lưỡi của bạn.", -- Moer Food Pack Strawberry Smoothie Latte

            -- Pha đồ uống

            SPOILED_DRINK = "Nó có thể tệ hơn thế này nữa không?", -- Đồ uống hư hỏng

            -- Máy làm soda

            SODA = "Nó sủi bọt.", -- Nước có ga
            FRUITSODA = "Soda với nước ép trái cây.", -- Soda trái cây
            LEMONLIMESODA = "Đồ uống có ga quá ngọt.", -- Soda chanh chanh (Tốt hơn Soda trái cây)
            COLA = "Một chất ngọt ngào, đậm đà khiến nhiều người mê mẩn.", -- Cola
            COLAQUANTUM = "Thức uống đen mới thậm chí còn phát ra ánh sáng.", -- Cola Quantum
            LUMPY_BEER = "Có vẻ hợp với khẩu vị của tôi.", -- Root Beer (Không cồn)

            -- Rượu chưng cất

            CORN_BEER = "Bia đắng nhiều bọt.", -- Bia ngô
            MADHU = "Tôi đã lấy trộm bao nhiêu mật ong?", -- Bee's Honey Wine
            WINE = "Đỏ và sẫm như máu.", -- Rượu (Berry Brewing)
            NOBLEWINE = "Được làm từ trái cây có tính sốt cao.", -- Noble Wine (Baked Berry Brewing)
            SPARKLINGWINE = "Nó đang trấn áp nội tạng của tôi bằng một nút chai nhỏ.", -- Sparkling Wine
            GLOWBERRYWINE = "Có phải những linh hồn phát sáng đã ghé thăm nó trong rượu không?", -- Glow Berry Wine
            KUMIS = "Thật đáng tiếc cho các bạn trẻ.", -- Kumis, Sữa ngựa lên men
            LUMPY_WINE = "Nó trong suốt và có màu hơi mù tạt.", -- Soju (Root Brewing)
            PULQUE = "Tất cả những chiếc kim kiêu hãnh đã tan chảy.", -- Pulque (Saminju)
            RUINCACAO_WINE = "Sẽ gặp rắc rối nếu nó ngọt hơn chút nữa.", -- Cacao Wine

            -- Soda hợp tác

            CHERRY_DOCTOR_COLA = "Tôi không phải là bác sĩ thực sự, nhưng nó có thể mang lại sự thoải mái nhất thời.", -- Cherry Forest Doctor Pepper (Doctor Cherry)
            PINEANANASSODA = "Soda thơm và ngọt.", -- Dứa có ga (Orangina)
            ORANGESODA = "Đồ uống có ga với nước cam ép.", -- Cam có ga (Fanta)
            STRAWBERRYSODA = "Đồ uống có ga với dâu tây nghiền.", -- Dâu có ga (Dâu tây của Welch)

            -- Rượu chưng cất hợp tác

            AUROBOW = "Đó là cầu vồng chết chóc.", -- Aurobou bị đắm tàu, Rượu thạch cầu vồng
            COCONUT_WINE = "Ngọt ngào như tôi.", -- Rượu dừa đắm tàu
            CHERRY_BLOOM_MADHU = "Nó có muốn tận hưởng vẻ đẹp phù du lâu hơn một chút không?", -- Rượu mật ong hoa anh đào rừng anh đào
            GIANT_BLUEBERRY_WINE = "Rượu có mùi thơm bùng nổ.", -- Boom Berry Wine (Nổ khi thắp sáng)
            RICE_WINE = "Rượu làm từ gạo.", -- Vita-Hybiscus Makgeolli
            WHEAT_BEER = "Bạn không thể nếm được vị ngọt của ngũ cốc.", -- Heap of Food Wheat Beer
            PALE_BEER = "Nhạt như tên gọi của nó.", -- Legacy Pale Ale (Bia xanh làm từ trái Monstra)

            -- Rượu chưng cất

            DISINFECTANT = "Nó chỉ biến vết thương thành bãi rác bằng cách đốt nóng chúng.", -- Thuốc khử trùng
            CORN_WHISKEY = "Đó chỉ là chất độc giết người từ từ.", -- Corn Whiskey
            LUMPY_VODKA = "Nó sẽ làm bỏng họng tôi.", -- Vodka
            TEQUILA = "Thô và độc hại.", -- Tequila
            MADHU_RUM = "Nó sẽ tự chết đuối từ từ mà không hề hay biết.", -- Rum
            BERRY_BRANDY = "Nó sẽ khiến bạn quên ngay cả hành động muốn quên.", -- Berry Brandy
            AREUHI = "Ngay cả khi không có lactose thì cũng vẫn cảm thấy đau đớn.", -- Rượu chưng cất Kumis Areuhi

            -- Rượu chưng cất độc quyền dành cho Warly

            BERRY_GIN = "Tôi chưa bao giờ thấy nó được dùng làm thuốc.", -- Gin
            GLOWBERRY_GIN = "Nó quyến rũ mọi người với ánh sáng xanh.", -- Glow Berry Gin
            ABSINTHE = "Người phụ nữ mặc trang phục màu xanh lá cây cải trang thành một con rắn.", -- Absinthe (Biên niên sử Narnia)
            TEA_LUMPY_VODKA = "Nó sẽ không giúp bạn khỏe mạnh hơn.", -- Rượu mùi trà xanh
            PETALS_BERRY_BRANDY = "Nó quyến rũ với mùi hương của hoa.", -- Rose Petal Brandy
            KAHLUA = "Có mùi cà phê đậm đặc.", -- Coffee Liqueur Kahlua
            NUT_CORN_WHISKEY = "Nếu bạn bị dị ứng đậu phộng thì nó sẽ rất hoàn hảo.", -- Nut Whiskey
            RUINCACAO_CREAM_LIQUEUR = "Có mùi hương ngọt ngào.", -- Rượu mùi kem Cacao Baileys
            RUMCHATA = "Hãy đưa thức uống này cho những đứa trẻ đang đau khổ.", -- Rumchata (Hỗn hợp rượu Rum và Horchata)

            -- Rượu chưng cất hợp tác

            MOONWAY = "Cầu vồng của cái chết.", -- Rượu thạch chưng cất rượu thạch cầu vồng
            ARRACK = "Rượu cọ chưng cất thành rượu.", -- Arrack (phiên bản tiếng Indonesia của Rượu dừa chưng cất)
            CHERRY_BLOOM_RUM = "Thà nhìn còn hơn uống.", -- Rượu mật ong anh đào Rượu chưng cất với cánh hoa anh đào nổi
            RICE_SPIRITS = "Đó là rượu được ngụy trang thành nước.", -- Makgeolli
            WHEAT_WHISKEY = "Đó chỉ là chất độc giết người từ từ.", -- Wheat Whiskey
            PALE_WHISKEY = "Hiệp sĩ xanh xao trông chừng những người uống nó.", -- Pale Malt Whiskey

            -- Rượu chưng cất hợp tác độc quyền dành cho Warly

            NUT_COCONUT_BRANDY = "Không còn nghi ngờ gì nữa, tôi đang vô tình đi vào miệng tử thần...", -- Coconut Brandy (Được đổi tên thành Caribbean Brandy vì tôi không thể làm rượu Rum Caribbean)
            GIANT_BLUEBERRY_GIN = "Nó có sức quyến rũ hủy diệt.", -- Boom Berry Sapphire (Nổ khi thắp sáng)

            -- Nấu nồi

            DARK_RUINCOLATE = "Cay đắng và đen tối như cuộc đời tôi.", -- Sôcôla đen
            WHITE_RUINCOLATE = "Giá như tôi có thể chia sẻ sự ngọt ngào này với Abigail...", -- Sôcôla trắng
            RUINCOLATE = "Nhiên liệu đen ăn được.", -- Just Chocolate
            RUIN_SCHOKAKOLA = "Tôi đã dùng mọi thứ để đánh thức tôi.", -- Schokakola

            BUCKET_STEEL_EMPTY =
            {
                EMPTY = "Mạnh mẽ nhưng vô tâm.", -- Xô thép rỗng
                FULL = "Tràn đầy nước mưa.", -- Làm sạch nước mưa bên trong
                FULL_ICE = "Nó đã đông cứng.", -- Nước mưa đã đóng băng
                DIRTY = "Chứa đầy nước độc hại giàu sự sống.", -- Nước mưa đã trở nên bẩn
                DIRTY_ICE = "Đóng băng sẽ không làm sạch được.", -- Nước mưa bẩn đã đóng băng
            },

            BUCKET_WOODIE_EMPTY =
            {
                EMPTY = "Một khúc gỗ bị cái chết làm trống rỗng.", -- Thùng gỗ rỗng
                FULL = "Tràn đầy nước mưa.", -- Làm sạch nước mưa bên trong
                FULL_ICE = "Nó đã đông cứng.", -- Nước mưa đã đóng băng
                DIRTY = "Chứa đầy nước độc hại giàu sự sống.", -- Nước mưa đã trở nên bẩn
                DIRTY_ICE = "Đóng băng sẽ không làm sạch được.", -- Nước mưa bẩn đã đóng băng
            },

            BUCKET_DRIFTWOOD_EMPTY =
            {
                EMPTY = "Hãy rải tro cốt nên nó rồi cho trôi trong lòng đại dương!", -- Xô gỗ rỗng
                FULL = "Tràn đầy nước mưa.", -- Làm sạch nước mưa bên trong
                FULL_ICE = "Nó đã đông cứng.", -- Nước mưa đã đóng băng
                DIRTY = "Chứa đầy nước độc hại giàu sự sống.", -- Nước mưa đã trở nên bẩn
                DIRTY_ICE = "Đóng băng sẽ không làm sạch được.", -- Nước mưa bẩn đã đóng băng
            },

            BUCKET_EMPTY =
            {
                EMPTY = "Chỉ là một cái xô rỗng.", -- Xô gỗ rỗng
                FULL = "Tràn đầy nước mưa.", -- Làm sạch nước mưa bên trong
                FULL_ICE = "Nó đã đông cứng.", -- Nước mưa đã đóng băng
                DIRTY = "Chứa đầy nước độc hại giàu sự sống.", -- Nước mưa đã trở nên bẩn
                DIRTY_ICE = "Đóng băng sẽ không làm sạch được.", -- Nước mưa bẩn đã đóng băng
            },

            DESALINATOR =
            {
                EMPTY = "Chỉ nghe thấy âm thanh trống rỗng.", -- Không có nước trong máy khử muối
                PURIFY_LONG = "Chỉ mới bắt đầu lọc muối.", -- Còn rất nhiều thời gian cho đến khi quá trình lọc hoàn tất
                PURIFY_SHORT = "Nước đã trở nên khá trong lành.", -- Quá trình lọc gần như hoàn tất
                HASWATER = "Nước sạch đã sẵn sàng.", -- Nước sạch đã có trong máy khử muối
                BURNT = "Chỉ còn lại mùi muối cháy.", -- Máy khử muối đã cháy
                HASSALT = "Có vẻ như đang lọc muối bằng muối.", -- Còn muối trong máy khử muối
            },

            BARREL =
            {
                GENERIC = "Tôi sẽ trữ nước trong đó.", -- Kiểm tra thùng
                BURNT = "Cổ họng của tôi cũng sẽ sớm bị bỏng.", -- Thùng đã cháy rồi
            },

            BREWERY =
            {
                EMPTY = "Nó chỉ làm cho nguyên liệu ngon miệng hơn.", -- Kiểm tra một nhà máy bia
                BURNT = "Chỉ còn lại mùi hôi thối.", -- Nhà máy bia đã cháy
                FERMENTING_LONG = "Có lẽ sẽ mất một lúc.", -- Còn rất nhiều thời gian cho đến khi quá trình ủ hoàn tất
                FERMENTING_SHORT = "Cần thêm chút thời gian để lên men.", -- Quá trình ủ bia gần như đã hoàn tất
                DONE = "Một nhiệm vụ nữa đã hoàn thành.", -- Có đồ uống trong nhà máy bia
            },

            CAMPKETTLE_ITEM = "Một ấm đun nước có tay cầm.", -- Kiểm tra vật phẩm ấm đun nước cắm trại
            CAMPKETTLE =
            {
                GENERIC = "Tôi có thể lấy nước từ ao bằng nó.", -- Ấm đun nước di động rỗng trên hố lửa
                BOILING_LONG = "Nước ấm.", -- Nó bắt đầu sôi
                BOILING_SHORT = "Tôi cần đun sôi thêm chút nữa.", -- Nước gần sôi rồi
                DONE = "Tôi đã kéo dài tuổi thọ của nó thêm một chút.", -- Thu được nước sạch
                STOP = "Chưa đun sôi đủ.", -- Nước không sôi do thiếu lửa
            },

            CAMPDESALINATOR_ITEM = "Tôi phải mang nó một cách miễn cưỡng.", -- Kiểm tra vật dụng khử muối di động
            CAMPDESALINATOR =
            {
                GENERIC = "Tôi có thể lấy nước biển bằng nó.", -- Không có nước trong máy khử muối
                BOILING_LONG = "Hầu hết là nước biển.", -- Nó bắt đầu sôi
                BOILING_SHORT = "Rất nhiều nước sạch đã tích tụ.", -- Nó gần như đã sôi
                DONE = "Tôi đã kéo dài tuổi thọ của nó thêm một chút.", -- Thu được nước sạch
                STOP = "Chưa đun sôi đủ.", -- Nước mặn không được lọc sạch do thiếu lửa
            },

            KETTLE =
            {
                EMPTY = "Khô như nhãn cầu của tôi.", -- Kiểm tra một cái ấm rỗng
                BURNT = "Nó bị cháy sém.", -- Ấm đun nước đã cháy
                BOILING_LONG = "Không quan trọng bên trong có gì; nó vẫn còn sống.", -- Nó mới bắt đầu pha đồ uống
                BOILING_SHORT = "Cần thêm chút thời gian để nấu.", -- Gần như đã nấu xong đồ uống
                DONE = "Cuối cùng tôi cũng có thể làm ướt còi của mình.", -- Đồ uống đã sẵn sàng
                PURIFY_LONG = "Nước vẫn còn âm ấm.", -- Nước bẩn vừa mới bắt đầu sôi
                PURIFY_SHORT = "Tôi cần đun sôi thêm chút nữa.", -- Gần xong việc đun sôi nước bẩn
                HASWATER = "Tôi có nên thu thập nguyên liệu để làm đồ uống không?", -- Bên trong có nước sạch
                MELT_LONG = "Nó vẫn còn đóng băng.", -- Nước đá vừa mới bắt đầu tan
                MELT_SHORT = "Tôi cần đun sôi thêm chút nữa để làm tan chảy nó.", -- Nước đá gần như đã tan hết
            },

            PORTABLEKETTLE_ITEM =
            {
                GENERIC = "Khi cổ họng tôi khô rát.", -- Kiểm tra vật phẩm ấm đun nước di động
                EMPTY = "Khô như nhãn cầu của tôi.", -- Kiểm tra một ấm đun nước di động được đặt trống
                BOILING_LONG = "Không quan trọng bên trong có gì; nó vẫn còn sống.", -- Nó mới bắt đầu pha đồ uống
                BOILING_SHORT = "Cần thêm chút thời gian để nấu.", -- Gần như đã nấu xong đồ uống
                DONE = "Cuối cùng tôi cũng có thể làm ướt còi của mình.", -- Đồ uống đã sẵn sàng
                PURIFY_LONG = "Nước vẫn còn âm ấm.", -- Nước bẩn vừa mới bắt đầu sôi
                PURIFY_SHORT = "Tôi cần đun sôi thêm chút nữa.", -- Gần xong việc đun sôi nước bẩn
                HASWATER = "Tôi có nên thu thập nguyên liệu để làm đồ uống không?", -- Bên trong có nước sạch
                MELT_LONG = "Nó vẫn còn đóng băng.", -- Nước đá vừa mới bắt đầu tan
                MELT_SHORT = "Tôi cần đun sôi thêm chút nữa để làm tan chảy nó.", -- Nước đá gần như đã tan hết
            },

            DISTILLERS =
            {
                EMPTY = "Máy tiêu thụ rượu và rượu tiêu thụ con người.", -- Kiểm tra máy chưng cất
                DISTILLTING_LONG = "Có lẽ sẽ mất một lúc.", -- Còn rất nhiều thời gian cho đến khi quá trình chưng cất hoàn tất
                DISTILLING_SHORT = "Tôi cần đợi thêm một chút.", -- Quá trình chưng cất gần như đã hoàn tất
                DONE = "Một nhiệm vụ nữa đã hoàn thành.", -- Có đồ uống trong máy chưng cất
            },

            WELL_WATERPUMP = {
                HIGH_PRESSURE = "Nó đang bơm mạnh.", -- Áp suất tối đa
                MIDDLE_PRESSURE = "Nó sẽ đẩy nước ra ngoài khi có chuyển động.", -- Áp suất trung bình
                LOW_PRESSURE = "Dường như có rối loạn nhịp tim.", -- Hầu như không có áp lực
                RECHARG_PRESSURE = "Tim đã ngừng đập.", -- Không có áp lực nào cả (không thể sử dụng cho đến khi áp suất đạt mức tối đa)
            },

            WELL_SPRINKLER =
            {
                LOWFUEL = "Nó có thể hoạt động trở lại với nhiên liệu.", -- Kiểm tra vòi phun nước giếng có ít nhiên liệu
                ON = "Nó đã cướp mất công việc của tôi.", -- Nó đang hoạt động
                OFF = "Nó đã ngừng hoạt động.", -- Kiểm tra vòi phun nước giếng đã tắt
            },
        },
}