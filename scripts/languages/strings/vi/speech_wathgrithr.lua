return {
    ACTIONFAIL =
    {
        GIVE =
        {
            WELL_NOTEMPTY = "Trước tiên hãy dọn sạch thùng hiện có.", -- Cố gắng đưa một thùng khi giếng đã có một thùng
            WELL_BUSY = "Hãy kiên nhẫn, cái xô vẫn còn trong giếng.", -- Cố gắng đưa một cái xô khi giếng vẫn còn một cái
        }
    },

        ANNOUNCE_DRUNK = "Tôi có thua trong trò chơi uống rượu không? Nấc cụt.", -- Say rượu
        ANNOUNCE_DRUNK_END = "Tôi vẫn còn ở bữa tiệc của Egir à?", -- Tỉnh dậy vì say (nôn nao)
        ANNOUNCE_DRUNK_IMMUNITY = "Hahahaha! Thêm cốc nữa nào!", -- Tạm thời. Dành riêng cho Wigfrid.
        ANNOUNCE_NOTCHARGE ="Kỳ lân nói rằng có vẻ như họ vẫn chưa sẵn sàng.", -- Cố gắng vắt sữa dê sét bằng xô khi nó chưa được sạc
        ANNOUNCE_NOTHIRSTSLEEP = "Nếu ngủ như thế này, tôi sẽ khát cả đêm! Tôi nên uống chút nước trước đã.", -- Cố gắng ngủ vào ban đêm khi khát
        ANNOUNCE_NOTHIRSTSIESTA = "Làm sao tôi có thể nghỉ ngơi như thế này khi cổ họng tôi khô khốc thế này!", -- Cố gắng nghỉ ngơi trong ngày khi khát nước
        ANNOUNCE_SLEEP_END = "Tôi cảm thấy sảng khoái!", -- Thức dậy sau khi ngủ và hoàn toàn tỉnh táo
        ANNOUNCE_THIRST = "Tôi ước gì tôi có thể tham gia bữa tiệc ngay bây giờ.", -- Khát nước!

        ANNOUNCE_CAFFINE_BUFF_START = "Bây giờ không ai có thể bắt kịp tốc độ của tôi!", -- Quá trình kích hoạt caffeine bắt đầu
        ANNOUNCE_CAFFINE_BUFF_STOP = "Tôi đã trở lại nhịp độ thường ngày của mình.", -- Hết hiệu ứng caffeine

        ANNOUNCE_CURE_WATERBORNE = "Lần sau, tôi nên uống nước tinh khiết để tránh bị ốm khi chiến đấu.", -- Công bố chữa bệnh qua đường nước bằng một vật phẩm

        ANNOUNCE_DCAPACITY_CRITICAL = "Thor, tôi có thể uống cả ngày!", -- Ngay trước khi say
        ANNOUNCE_DCAPACITY_HALF = "Tôi cảm thấy nỗi sợ hãi dần tan biến!", -- Bắt đầu say

        DESCRIBE =
        {
            BOILBOOK = "Bao nhiêu rượu vang được liệt kê cho bữa tiệc tối?",

            WATER_CLEAN_ICE = "Đó là chất rắn đông lạnh.", -- Đá sạch
            WATER_DIRTY_ICE = "Đá có tạp chất.", -- Đá bẩn

            SPICE_CAFFEINPEPPER = "Một loại bột tăng thêm hứng thú chiến đấu cho bữa tiệc của tôi.", -- Pepper pepper

            WELL_KIT = "Tôi rất sẵn lòng lắp đặt một cái giếng.", -- Bộ dụng cụ tốt
            WELL_SPRINKLER_KIT = "Máy mưa không mây.", -- Bộ phun nước
            WELL_WATERPUMP_KIT = "Máy móc sẽ cướp bóc thế giới dưới lòng đất.", -- Bộ máy bơm nước bằng hơi nước
            WELL_BURYING_KIT = "Hãy chắc chắn rằng không ai vấp ngã.", -- Bộ dụng cụ chôn lỗ
            WELL_DRILLING = "Đẩy nó đến tận Styx!", -- Khoan lỗ bằng máy khoan
            WELL_DRILLING_ITEM = "Một công cụ mạnh mẽ để mở đường đến thế giới dưới lòng đất.", -- Vật phẩm khoan
            HOLE = "Tôi nghe thấy tiếng nước ở dưới đó.", -- Lỗ giếng
            WELL = "Hãy đào giếng ngay trước khi chết khát.", -- Vâng

            WX78MODULE_NONEDRUNK = "Những lợi ích này sẽ tiếp thêm sức mạnh cho chiến binh kim loại của chúng ta.", -- 78전용 묘듈

            -- Cây bị úng

            TEA_TREE = "Cây bụi thơm.", -- Cây trà
            DUG_TEA_TREE = "Tôi hy vọng nó sẽ trở về với nữ thần Trái đất.", -- Cây trà bị đào lên
            TEA_SEED = "Cây non này được bọc trong tấm vải đỏ.", -- Hạt giống cây trà
            TEA_SEED_COOKED = "Cây non đã được nấu chín.", -- Hạt cây chè đã nấu chín
            TEA_SEED_SAPLING = "Cây non hãy phát triển mạnh mẽ!", -- Cây chè non
            TEALEAVES = "Một chùm lá thơm.", -- Lá trà
            TEALEAVES_DRIED = "Một nắm lá trà khô.", -- Lá trà khô

            CAFFEINBERRY = "Những bụi cây đậu đã được Mani phù hộ.", -- Bụi cà phê
            DUG_CAFFEINBERRY = "Chúng ta cùng đi nhé.", -- Đào bụi cà phê
            CAFFEINBERRY_BEAN = "Cần rang cho đến khi chuyển sang màu đen.", -- Hạt cà phê thô
            CAFFEINBERRY_BEAN_COOKED = "Hạt cà phê tràn đầy sức sống.", -- Hạt cà phê nấu chín

            RUINCACAO_TREE = "Cây từ thời kỳ bóng tối.", -- Cây Cacao
            DUG_RUINCACAO_TREE = "Tôi hy vọng nó sẽ trở về với nữ thần Trái đất.", -- Đào cây cacao
            RUINCACAO_SEED = "Nó vượt qua nỗi sợ hãi và nở hoa.", -- Vật phẩm cây giống Cacao
            RUINCACAO_SEED_SAPLING = "Nó đã trút bỏ được nỗi sợ hãi. Hãy lớn lên đi, cây non!", -- Đã trồng cây cacao
            RUINCACAO = "Có phải những cây non sẽ bị đốt cháy trong khi chúng bị giam giữ?", -- Vỏ ca cao trước khi đập
            RUINCACAO_BEAN = "Nó rỉ ra dầu.", -- Hạt cacao nghiền nát
            RUINCACAO_BEAN_COOKED = "Cây non đã được nấu chín.", -- Hạt cacao đã nấu chín

            -- Phụ gia chưng cất

            ADDITIVE_SEED = "Nó sẽ nâng cao chất lượng của rượu mạnh trong bữa tiệc.", -- Phụ gia hạt giống (Anise, Juniper Berry, Star of Motif) cho rượu mùi
            ADDITIVE_PETALS = "Có vẻ như là quà tặng từ Freya.", -- Phụ gia thảo mộc, lá trà và cánh hoa cho rượu mùi
            ADDITIVE_NUT = "Cây non đã tụ tập về đây.", -- Hạt bạch dương, Dừa, Hạt cà phê, Hạt Cacao Phụ gia cho rượu mùi
            ADDITIVE_DAIRY = "Chúng ta có cho sữa vào rượu không?", -- Phụ gia sữa cho rượu mùi

            -- Đồ uống

            WATER_CLEAN = "Thứ này là nước tinh khiết", -- Nước sạch
            WATER_DIRTY = "Một thứ nước đầy hoang dã cần được thuần hoá!", -- Nước bẩn
            WATER_SALTY = "Một cốc nước biển.", -- Nước biển

            GOOPYDRINK = "Thức uống thừa có vẻ khá ẩm ướt.", -- Đồ uống không thành công (khái niệm nướng ướt)

            -- Đồ uống ấm trà

            FRUITJUICE = "Tôi sẽ chỉ uống nước của đồ uống này.", -- Nước ép trái cây hỗn hợp
            BERRIES_JUICE = "Nó tỏa ra mùi trái cây màu đỏ.", -- Nước ép quả mọng
            POMEGRANATE_JUICE = "Tôi nên coi nó như máu của trái cây.", -- Nước ép lựu
            BANANA_JUICE = "Có vẻ như là nước ép khỉ.", -- Nước chuối
            FIG_JUICE = "Có một số lượng quá lớn thịt trái cây bất kính.", -- Nước ép quả sung
            DRAGONJUICE = "Đầy thịt trái cây màu trắng.", -- Nước ép thanh long
            GLOWBERRYJUICE = "Hãy giả vờ đó là nước từ một con suối rực sáng.", -- Nước ép Glowberry
            WATERMELON_JUICE = "Hãy tưởng tượng rằng đây không phải là trái cây mà là nước.", -- Nước ép dưa hấu

            VEGGIE_TEA = "Tôi có thực sự phải uống thứ này không?", -- Nước ép rau củ
            CARROT_TEA = "Sao các chiến binh có thể phục vụ thức ăn cho thỏ như thế này!", -- Trà cà rốt
            CACTUS_TEA = "Được rồi, hãy coi nó như một lời tri ân dành cho cỏ phiến.", -- Trà xương rồng
            TOMATO_JUICE = "Tôi sẽ chỉ uống nước của loại rau này.", -- Nước ép cà chua
            LUMPY_TEA = "Làm sao bạn có thể đưa một thứ có mùi bẩn thỉu như vậy cho một chiến binh!", -- Trà rễ
            SEAWEED_SHAKE = "Kinh khủng. Hoàn toàn khủng khiếp!", -- Rong biển lắc

            GREENTEA = "Chỉ là... nước có vị lá.", -- Trà xanh lá tươi
            BLACKTEA = "Tôi không có thời gian để tụ tập nhàn nhã.", -- Trà đen
            BLACKTEA_ICED = "Chỉ nhìn thôi cũng thấy nhức răng.", -- Trà đen đá
            FUER = "Chỉ là một chút dương xỉ thôi!", -- Trà Bohee, trà lá, trà dương xỉ
            MIXFLOWER = "Những phước lành của Freya được chứa đựng bên trong.", -- Trà cánh hoa hỗn hợp
            HIBISCUSTEA = "Bông hoa đang đổ máu.", -- Trà dâm bụt
            CACTUSFLOWER_TEA = "Tôi sẽ uống nước, nhưng không uống hoa.", -- Trà hoa xương rồng
            LOTUSTEA = "Cho tôi cá! Cá!!", -- Trà hoa sen
            SUSHIBISCUS = "Thức uống này chắc chắn bị nguyền rủa.", -- Trà tự sát
            MOON_BLOSSOM_TEA = "Quả thực, nó chứa đựng những phước lành của Mani.", -- Trà hoa trăng

            CAFFEINBERRY_JUICE = "Vị đắng và tim tôi đập mạnh.", -- Cà phê đen
            TOFFEE_LATTE = "Thật ngọt ngào và hấp dẫn.", -- Latte hạt bơ cứng
            RUINCHA_LATTE = "Tâm trí của tôi đang thức tỉnh.", -- Mocha latte (Cà phê + Sôcôla)

            HOTRUINCOLATE = "Sưởi ấm tâm hồn.", -- Sôcôla nóng
            RUINCOLATE_SMOOTHIE = "Đây có phải là thức uống của Hrim-thurs không?", -- Sinh tố sô cô la (Lạnh)
            RUINXOCOLATL = "Thức uống của các chiến binh cổ xưa.", -- Chocolatl (cay)
            TEA_RUINCOLATE_LATTE = "Nó đánh thức tâm hồn tôi.", -- Matcha sô cô la latte

            MULLED = "Nó sẽ mang lại sự nghỉ ngơi cho những tâm hồn mệt mỏi.", -- Bhang
            BUTTERBEER = "Tôi đánh giá cao lòng dũng cảm của các pháp sư trẻ.", -- Bia bơ trong bộ truyện Harry Potter

            -- Hợp tác Ấm trà Đồ uống

            COCONUT_JUICE = "Nó chứa đầy thịt mềm.", -- Nước cốt dừa đắm tàu
            RAINBOW_SHAKE = "Nó chứa đựng phước lành của Freya!", -- Thạch Cầu vồng bị đắm tàu
            QUARTZ_SHAKE = "Tôi rất sẵn lòng uống thứ này!", -- Moonrock Shake có miệng núi lửa bị đắm tàu
            CHERRY_ROSEBERRIES_TEA = "Tôi có phải uống đồ uống có trái cây hèn hạ như vậy không?", -- Trà Tầm Xuân Anh Đào
            CHERRY_HONEY_TEA = "Đây thực sự là nước mật ong tinh tế.", -- Trà mật ong hoa anh đào rừng anh đào
            SWEET_RICE_DRINK = "Cái này không chứa hạt à?", -- Vita-Hybiscus Sweet Rice Punch
            PINEANANAS_JUICE = "Nó đã nghiền nát những vảy cứng để lấy thịt.", -- Reign of Giants Pineananas Juice
            ORANGE_JUICE = "Nó bảo tôi uống nước ép chua của nó à?", -- Thêm gói thực phẩm Nước cam
            STRAWBERRY_SMOOTHIE = "Đó là một loại nước ép trái cây màu đỏ, lạnh.", -- Thêm gói thực phẩm Sinh tố dâu tây
            STRAWBERRY_MILK_SMOOTHIE = "Đồ uống này không thích hợp cho một chiến binh.", -- Gói thực phẩm khác Sinh tố sữa dâu

            -- Đồ uống chưng cất

            SPOILED_DRINK = "Thời gian đã cho thức uống này không phải sự khôn ngoan mà là sự kinh tởm.", -- Đồ uống hư hỏng

            -- Nhà máy chưng cất soda

            SODA = "Đó là nước suối có ga.", -- Nước có ga
            FRUITSODA = "Giống như nước ép trái cây.", -- Fruit Punch Soda
            LEMONLIMESODA = "Nó không phải là thức uống xứng đáng của một chiến binh.", -- Lemon Lime Soda (Phiên bản cao cấp của Fruit Soda)
            COLA = "Nó quyến rũ như chính bóng tối vậy.", -- Cola
            COLAQUANTUM = "Nó khiến tim tôi đập nhanh hơn!", -- Quantum Cola
            LUMPY_BEER = "Nó có nhiều mùi hương khác nhau.", -- Root Beer (Không cồn)

            -- Rượu chưng cất

            ORN_BEER = "Đó là bia giả của Đức.", -- Bia ngô
            MADHU = "Đó là đồng cỏ của Nord!", -- Mead
            WINE = "Nó được làm từ máu của nhà tiên tri.", -- Rượu (Rượu vang cơ bản)
            NOBLEWINE = "Thịt đi kèm ở đâu?", -- Noble Wine (Rượu nấu chín)
            SPARKLINGWINE = "Đây không phải là thức uống ăn mừng dành cho các chiến binh.", -- Sparkling Wine
            GLOWBERRYWINE = "Nó giống như máu của Kvasir.", -- Glow Berry Wine
            KUMIS = "Cầu xin các vị thần giúp chúng ta làm rượu từ sữa?", -- Kumis, sữa yak lên men
            LUMPY_WINE = "Nó sẽ không thỏa mãn cơn khát của tôi.", -- Mead với khoai tây, khoai lang hoặc rễ
            PULQUE = "Đó là máu của Mayahuel!", -- Pulque (Agave brew)
            RUINCACAO_WINE = "Đây có phải là rượu của người Toltec không?", -- Rượu Cacao

            -- Hợp tác Soda

            CHERRY_DOCTOR_COLA = "Đó là một sự hỗn loạn màu đỏ thẫm kinh tởm.", -- Cherry Forest Doctor Pepper (Doctor Cherry)
            PINEANANASSODA = "Dù là quả thông hay trái cây thì đều không đúng.", -- Pineapple Soda (Orang-Soda)
            ORANGESODA = "Là nước suối có vị trái cây thơm.", -- Orange Soda (Fanta)
            STRAWBERRYSODA = "Soda này không phù hợp với chiến binh.", -- Strawberry Soda (Welch's Strawberry)

            -- Tinh thần hợp tác

            AUROBOW = "Nó lấp lánh thật đẹp!", -- Oroborou bị đắm tàu, Tinh linh thạch cầu vồng
            COCONUT_WINE = "Mùi dầu cọ nồng nặc.", -- Rượu dừa đắm tàu
            CHERRY_BLOOM_MADHU = "Một thức uống ngon và bắt mắt.", -- Cherry Forest Cherry Blossom Mead
            GIANT_BLUEBERRY_WINE = "Đó là một thức uống mạnh mẽ!", -- Vita-Hybiscus Boom! Berry Sapphire (Nổ khi đánh lửa)
            RICE_WINE = "Tôi không thể thấy bất kỳ sự khác biệt nào giữa nó và sữa.", -- Vita-Hybiscus Makgeolli
            WHEAT_BEER = "Đó là bia của Egir.", -- Hip of Food Wheat Beer
            PALE_BEER = "Đây cũng là bia à?", -- Reign of Giants Pale Ale (Bia màu ngọc lam làm từ Monsterlas)

            -- Rượu chưng cất

            DISINFECTANT = "Sẽ đốt vết thương của bạn để chữa lành chúng!", -- Thuốc khử trùng
            CORN_WHISKEY = "Ngọt và thơm.", -- Corn Whiskey
            LUMPY_VODKA = "Tôi tuyên bố, tôi sẽ uống thứ này như uống nước.", -- Vodka
            TEQUILA = "Đó là một thức uống thô và hoang dã!", -- Tequila
            MADHU_RUM = "Người Viking không uống như vậy.", -- Rum
            BERRY_BRANDY = "Đây là rượu của giới quý tộc kiêu kỳ.", -- Berry Brandy
            AREUHI = "Nó không tệ như tôi nghĩ.", -- Kumis, sữa ngựa lên men

            -- Rượu chưng cất độc quyền của Warly

            BERRY_GIN = "Đó là một thức uống nhẹ khi uống ở mức vừa phải, nhưng sẽ trở thành đồ uống có hại nếu uống quá mức.", -- Gin
            GLOWBERRY_GIN = "Đó là thức uống được Balder's ban tặng.", -- Glow Berry Gin
            ABSINTHE = "Nó có mùi thơm sảng khoái!", -- Absinthe
            TEA_LUMPY_VODKA = "Mùi hương của lá trà tỏa ra từ rượu.", -- Rượu mùi trà xanh
            PETALS_BERRY_BRANDY = "Chiến binh không có thời gian để thưởng thức hương thơm của hoa.", -- Rose Petal Brandy
            KAHLUA = "Là một chiến binh, đồ uống này quá ngọt đối với tôi.", -- Coffee Liqueur Kahlua
            NUT_CORN_WHISKEY = "Hương thơm của các loại hạt nổi bật.", -- Nut Whiskey
            RUINCACAO_CREAM_LIQUEUR = "Cái này dành cho trẻ em à?", -- Rượu mùi kem Cacao Baileys
            RUMCHATA = "Tôi thích uống rượu và sữa riêng.", -- Rumchata (Hỗn hợp rượu rum và sữa)

            -- Hợp tác chưng cất rượu mạnh

            MOONWAY = "Đó là bản chất của ánh sáng!", -- Tinh dầu thạch cầu vồng Shipwrecked được chưng cất
            ARRACK = "Tôi có thể cảm nhận được khung cảnh của những cây cọ.", -- Arrack, phiên bản Indonesia của Rượu dừa chưng cất
            CHERRY_BLOOM_RUM = "Nó nắm bắt được bản chất của sự hùng vĩ.", -- Rượu rum mật ong hoa anh đào chưng cất, Đồ uống nổi cánh hoa anh đào
            RICE_SPIRITS = "Trong trẻo và sảng khoái!", -- Soju
            WHEAT_WHISKEY = "Ngọt và thơm.", -- Wheat Whiskey
            PALE_WHISKEY = "Nó có mùi nồng và đắng.", -- Pale Malt Whiskey

            -- Sự hợp tác độc quyền của Warly Rượu chưng cất

            NUT_COCONUT_BRANDY = "Người Viking là những chiến binh và nhà thám hiểm, không phải cướp biển.", -- Coconut Brandy (Được đổi tên thành Caribbean Brandy vì bạn không thể làm rượu Rum Caribbean)
            GIANT_BLUEBERRY_GIN = "Sức mạnh áp đảo!", -- Boom Berry Sapphire (Nổ như củ cà rốt)

            -- Nấu nồi

            DARK_RUINCOLATE = "Tôi nên hỏi đồng minh của mình xem anh ấy có thể làm salmiakki không.", -- Sôcôla đen
            WHITE_RUINCOLATE = "Người Viking không thích đồ ăn nhẹ ngọt ngào như vậy.", -- Sôcôla trắng
            RUINCOLATE = "Đó là một khẩu phần có thể chấp nhận được.", -- Just Chocolate
            RUIN_SCHOKAKOLA = "Nó khuấy động sự phấn khích của chiến trường.", -- Schokakola

            BUCKET_STEEL_EMPTY =
            {
                EMPTY = "Đó là một cái xô sắt.", -- Xô sắt rỗng
                FULL = "Nó chứa đầy nước sạch.", -- Bên trong có nước mưa sạch
                FULL_ICE = "Nó gợi lên một cảm giác hoài niệm.", -- Nước mưa đã đóng băng
                DIRTY = "Thật bẩn.", -- Nước mưa đã trở nên bẩn
                DIRTY_ICE = "Nó đã biến thành một cục bẩn.", -- Nước mưa bẩn đã đóng băng
            },

            BUCKET_WOODIE_EMPTY =
            {
                EMPTY = "Bạn đã đổ khúc gỗ một cách khéo léo.", -- Thùng gỗ rỗng
                FULL = "Nó chứa đầy nước sạch.", -- Bên trong có nước mưa sạch
                FULL_ICE = "Nó gợi lên một cảm giác hoài niệm.", -- Nước mưa đã đóng băng
                DIRTY = "Thật bẩn.", -- Nước mưa đã trở nên bẩn
                DIRTY_ICE = "Nó đã biến thành một cục bẩn.", -- Nước mưa bẩn đã đóng băng
            },

            BUCKET_EMPTY =
            {
                EMPTY = "Đó là một cái xô gỗ rỗng.", -- Xô gỗ rỗng
                FULL = "Nó chứa đầy nước sạch.", -- Bên trong có nước mưa sạch
                FULL_ICE = "Nó gợi lên một cảm giác hoài niệm.", -- Nước mưa đã đóng băng
                DIRTY = "Thật bẩn.", -- Nước mưa đã trở nên bẩn
                DIRTY_ICE = "Nó đã biến thành một cục bẩn.", -- Nước mưa bẩn đã đóng băng
            },

            DESALINATOR =
            {
                EMPTY = "Nó hoàn toàn trống rỗng.", -- Không có nước trong máy khử muối
                PURIFY_LONG = "Tốt hơn là nên làm việc khác trong khi chờ đợi.", -- Vẫn còn rất nhiều quá trình thanh lọc còn lại
                PURIFY_SHORT = "Bây giờ khá sảng khoái.", -- Quá trình thanh lọc gần như đã hoàn tất
                HASWATER = "Có đầy nước suối.", -- Có nước sạch trong máy khử muối
                BURNT = "Nó đã bị ngọn lửa nuốt chửng.", -- Máy khử muối đã cháy rụi
                HASSALT = "Có quá nhiều khoáng chất trong đó.", -- Vẫn còn muối trong máy khử muối
            },

            BARREL =
            {
                GENERIC = "Nó sẽ giữ nước cho tôi.", -- Kiểm tra thùng
                BURNT = "Nó không thể thoát khỏi sự đụng chạm của Logi.", -- Thùng đã cháy rụi
            },

            BREWERY =
            {
                EMPTY = "Nghe này, nghe đây! Tôi sẽ chuẩn bị một bữa tiệc rượu bằng cách sử dụng những món quà, rau và trái cây ngon nhất của thiên nhiên.", -- Kiểm tra nhà máy bia
                BURNT = "Khóc lóc vì rượu đổ có ích gì?", -- Nhà máy bia đã cháy rụi
                FERMENTING_LONG = "Tốt hơn là nên kiếm thịt cho bữa tiệc bằng cách săn bắn thay vì chỉ chờ đợi.", -- Vẫn còn rất nhiều quá trình lên men
                FERMENTING_SHORT = "Đã đến lúc chuẩn bị cho bữa tiệc!", -- Quá trình lên men gần như đã hoàn tất
                DONE = "Rượu đã sẵn sàng cho bữa tiệc chưa?", -- Có đồ uống trong nhà máy bia
            },

            CAMPKETTLE_ITEM = "Đó là một chiếc ấm đun nước tạm thời.", -- Kiểm tra hạng mục ấm đun nước di động
            CAMPKETTLE =
            {
                GENERIC = "Nó trống rỗng.", -- Không có nước trong chiếc ấm tạm thời trên lửa trại
                BOILING_LONG = "Hãy kiên nhẫn, nó chưa sôi đâu.", -- Nước bắt đầu sôi
                BOILING_SHORT = "Sẽ không mất nhiều thời gian đâu.", -- Nước gần sôi
                DONE = "Bây giờ có thể uống được.", -- Thu được nước sạch
                STOP = "Trước tiên phải đốt củi đã.", -- Việc thiếu lửa trong lửa trại sẽ ngăn cản nước bẩn sôi lên
            },

            CAMPDESALINATOR_ITEM = "Đó là một cái nồi chuyển nước biển thành nước suối.", -- Kiểm tra vật phẩm khử muối di động
            CAMPDESALINATOR =
            {
                GENERIC = "Chậu có vẻ đang hạn hán.", -- Không có nước
                BOILING_LONG = "Nước biển biến thành mây.", -- Nước bắt đầu sôi
                BOILING_SHORT = "Trong nồi đang mưa!", -- Nước gần sôi
                DONE = "Có đầy nước suối.", -- Có được nước sạch
                STOP = "Bạn cần đốt củi trước đã.", -- Việc thiếu lửa trong lửa trại khiến nước mặn không thể lọc được
            },

            KETTLE =
            {
                EMPTY = "Nó sẽ không làm được món thịt hầm.", -- Kiểm tra một chiếc ấm rỗng
                BURNT = "Nó đã bị ngọn lửa nuốt chửng.", -- Ấm đun nước đã cháy rụi
                BOILING_LONG = "Đừng chờ đợi và làm việc khác.", -- Quá trình pha chế đồ uống vừa mới bắt đầu
                BOILING_SHORT = "Trà gần như đã sẵn sàng.", -- Đồ uống gần như đã sẵn sàng
                DONE = "Trà đã sẵn sàng.", -- Đồ uống đã sẵn sàng
                PURIFY_LONG = "Hãy kiên nhẫn, nó chưa sôi đâu.", -- Quá trình đun sôi nước bẩn vừa mới bắt đầu
                PURIFY_SHORT = "Sẽ không mất nhiều thời gian đâu.", -- Nước bẩn gần như đã sẵn sàng
                HASWATER = "Nước suối đầy rồi.", -- Có nước sạch trong ấm
                MELT_LONG = "Trời vẫn còn khá lạnh.", -- Quá trình làm tan nước đá vừa mới bắt đầu
                MELT_SHORT = "Nước suối gần như đã sẵn sàng.", -- Nước đá gần như tan hết
            },

            PORTABLEKETTLE_ITEM =
            {
                GENERIC = "Chiến trường không phải là nơi tổ chức tiệc trà.", -- Kiểm tra vật phẩm ấm đun nước di động
                EMPTY = "Không còn chỗ cho thịt.", -- Kiểm tra một ấm đun nước di động được đặt trống
                BOILING_LONG = "Thà đi tìm kẻ thù còn hơn là pha đồ uống.", -- Quá trình pha đồ uống vừa mới bắt đầu
                BOILING_SHORT = "Đồ uống gần như đã sẵn sàng.", -- Đồ uống gần như đã sẵn sàng
                DONE = "Hãy uống nhanh và ra trận.", -- Đồ uống đã sẵn sàng
                PURIFY_LONG = "Hãy kiên nhẫn, nó vẫn chưa sôi đâu", -- Quá trình đun sôi nước bẩn vừa mới bắt đầu
                PURIFY_SHORT = "Sẽ không mất nhiều thời gian đâu.", -- Nước bẩn gần như đã sẵn sàng
                HASWATER = "Một chiến binh không có thời gian cho một bữa tiệc trà; khô máu thôi.", -- Có nước sạch trong ấm di động
                MELT_LONG = "Trời vẫn còn khá lạnh.", -- Quá trình làm tan nước đá vừa mới bắt đầu
                MELT_SHORT = "Nước suối gần như đã sẵn sàng.", -- Nước đá gần như tan hết
            },

            DISTILLERS =
            {
                EMPTY = "Nó có thể được gọi là cái vạc thánh ca!", -- Kiểm tra máy chưng cất
                DISTILLTING_LONG = "Tâm trạng đang tụt dốc... Nhanh lên, vạc!", -- Vẫn còn rất nhiều rượu chưng cất
                DISTILLING_SHORT = "Việc chưng cất sẽ được thực hiện ngay lập tức!", -- Quá trình chưng cất gần như đã hoàn tất
                DONE = "Nó có chứa linh hồn không?", -- Có đồ uống trong máy chưng cất
            },

            WELL_WATERPUMP = {
                HIGH_PRESSURE = "Sức mạnh của nó có thể sánh ngang với người khổng lồ.", -- Áp lực tối đa
                MIDDLE_PRESSURE = "Máy đang hoạt động mạnh.", -- Áp suất trung bình
                LOW_PRESSURE = "Máy thiếu nguồn.", -- Áp suất thấp
                RECHARG_PRESSURE = "Máy đang nghỉ.", -- Không có áp suất (không thể sử dụng cho đến khi đạt áp suất tối đa)
            },

            WELL_SPRINKLER =
            {
                LOWFUEL = "Hết nhiên liệu.", -- Kiểm tra vòi phun nước khi sắp hết nhiên liệu
                ON = "Mưa này đến từ dưới lòng đất.", -- Vòi phun nước đang hoạt động
                OFF = "Bạn đã tìm được chỗ rắc mưa chưa?", -- Vòi phun nước đã tắt
            },
        },
    }

   