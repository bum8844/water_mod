return {
    ACTIONFAIL =
    {
        GIVE =
        {
            WELL_NOTEMPTY = "Bạn cần đổ xô rỗng trước đã.", -- Giếng có một xô rỗng khô ráo nhưng bạn đã cố gắng đưa xô ra
            WELL_BUSY = "Tôi quên mình đã đổ nước vào giếng à?", -- Giếng có một thùng chứa đầy nước nhưng bạn đã cố gắng đưa xô đó
        }
    },

    ANNOUNCE_DRUNK = "Ồ, tôi cảm thấy chóng mặt quá!", -- Say rượu
    ANNOUNCE_DRUNK_END = "Không còn thời gian để lãng phí nữa!", -- Tỉnh táo vì rượu (nôn nao)
    ANNOUNCE_DRUNK_IMMUNITY = "", -- Tạm thời, dành riêng cho Wigfrid,
    ANNOUNCE_NOTCHARGE = "Hiện tại tôi không mang theo sữa.", -- Giai đoạn thời gian = (時相)
    ANNOUNCE_NOTHIRSTSLEEP = "Tôi nên tìm thứ gì đó để uống trước đã.", -- Cố gắng ngủ vào ban đêm trong khi khát nước
    ANNOUNCE_NOTHIRSTSIESTA = "Tôi nên tìm thứ gì đó để uống trước đã.", -- Cố gắng chợp mắt trong ngày khi khát nước
    ANNOUNCE_SLEEP_END = "Ôi trời, bây giờ tôi đang ở giai đoạn nào rồi?", -- Thức dậy hoàn toàn tỉnh táo sau khi ngủ
    ANNOUNCE_THIRST = "Không biết đã bao lâu rồi tôi chưa uống nước nhỉ?", -- Khát quá!

    ANNOUNCE_CAFFINE_BUFF_START = "Tuyệt vời, tôi cảm thấy mình có thể đuổi theo thời gian!" , -- Quá trình tăng cường caffeine bắt đầu
    ANNOUNCE_CAFFINE_BUFF_STOP = "Chết tiệt! Thời gian lại trôi nhanh quá!" , -- Quá trình hỗ trợ caffeine kết thúc
   
    ANNOUNCE_CURE_WATERBORNE = "Cuối cùng tôi đã sửa được chiếc đồng hồ bỏ túi." , -- Đối thoại khi chữa bệnh qua đường nước bằng vật phẩm

    ANNOUNCE_DCAPACITY_CRITICAL = "Thời gian đang tăng tốc!", -- Ngay trước khi say (Dòng thời gian = dòng thời gian)
    ANNOUNCE_DCAPACITY_HALF = "Tôi bắt đầu cảm thấy bình tĩnh hơn khi cơn say đã qua đi.", -- Cơn say đang bắt đầu vơi đi

    DESCRIBE =
    {
        BOILBOOK = "Ai có thời gian nghĩ đến trà khi đã có nước đun sôi?",

        WATER_CLEAN_ICE = "Khi nào rã đông thì mới uống thứ này?", -- Nước đá sạch
        WATER_DIRTY_ICE = "Tôi muốn uống nước đá sạch hơn.", -- Nước đá bẩn

        SPICE_CAFFEINPEPPER = "Ước gì tôi có thời gian để ướp.", -- Gia vị hạt tiêu caffein

        WELL_KIT = "Chỉ cần có nó trong tay thì nước sẽ không chảy được, tôi cần phải lắp đặt nó!", -- Well Kit
        WELL_SPRINKLER_KIT = "Sẽ không mất hơn một giây để thiết lập cài đặt chính xác này.", -- Bộ phun nước
        WELL_WATERPUMP_KIT = "Tôi có thể lấy nước ngầm mà không tốn thời gian.", -- Bộ máy bơm nước bằng hơi nước
        WELL_BURYING_KIT = "Ôi trời, thật là một công việc tốn thời gian.", -- Bộ chôn lỗ
        WELL_DRILLING = "Nó sẽ tự làm được; hãy tiết kiệm thời gian của tôi.", -- Khoan lỗ
        WELL_DRILLING_ITEM = "Tôi nên quyết định nơi đào nước ngầm trước.", -- Hạng mục khoan
        HOLE = "Phải mất nhiều thời gian để trèo ra ngoài khi bạn rơi vào.", -- Well Hole
        WELL = "Xem nó sẽ không làm cho nước xuất hiện một cách kỳ diệu; tôi cần một công cụ!", -- Well

        WX78MODULE_NONEDRUNK = "Aha! Tôi đang thắc mắc họ bắt đầu làm những thứ này từ khi nào.", -- 78전용 묘듈

        -- Waterlogged Plant Mode

        TEA_TREE = "Cây này đã đạt đến giới hạn tăng trưởng.", -- Cây trà
        DUG_TEA_TREE = "Không có thời gian để lãng phí; tôi sẽ lấy hết!", -- Cây trà đào lên
        TEA_SEED = "Nó sẽ mọc thành cây mới khi đến thời điểm thích hợp.", -- Hạt giống cây trà
        TEA_SEED_COOKED = "Nó bị ăn hoặc bị thối; không có tương lai cho việc này.", -- Hạt cây trà đã rang
        TEA_SEED_SAPLING = "Cậu bé này dường như đang cố tình lớn chậm.", -- Cây non trà
        TEALEAVES = "Đây là những lá trà được hái.", -- Lá trà
        TEALEAVES_DRIED = "Lá trà khô.", -- Lá trà khô

        CAFFEINBERRY = "Kiếp trước của một loài thực vật ngoài hành tinh treo cổ.", -- Coffee Bush (Tưởng nhớ Peppernut không giải phóng oxy từ bản cập nhật DST thứ 20 trước đó)
        DUG_CAFFEINBERRY = "Nếu tôi uống nó, có lẽ tôi có thể tiết kiệm được chút thời gian để nghỉ ngơi.", -- Dug-up Coffee Bush
        CAFFEINBERRY_BEAN = "Nó kết hợp các trạng thái của cà phê và hạt tiêu.", -- Hạt cà phê tươi
        CAFFEINBERRY_BEAN_COOKED = "Tôi có thể ăn ngay, nhưng có lẽ tôi nên ổn định thời gian trước đã.", -- Hạt cà phê rang

        RUINCACAO_TREE = "Nó cũng bị bóp méo như dòng thời gian vậy.", -- Cây Cacao
        DUG_RUINCACAO_TREE = "Không có thời gian để lãng phí; tôi sẽ lấy hết!", -- Cây cacao đào lên
        RUINCACAO_SEED = "Một cuộc sống mới đang dần nảy mầm.", -- Vật phẩm hạt Cacao
        RUINCACAO_SEED_SAPLING = "Cậu bé này dường như đang cố tình phát triển chậm.", -- Cây cacao từ hạt giống
        RUINCACAO = "Bạn không thể biết đó là trái cây hay than củi cho đến khi mở nó ra.", -- Vỏ cacao chưa chín

        RUINCACAO_BEAN = "Ăn món này chắc bụng tôi sẽ lộn ngược mất.", -- Vỏ cacao nghiền
        RUINCACAO_BEAN_COOKED = "Đây có phải là lãng phí thời gian hay không? Tôi không thể biết được.", -- Vỏ cacao rang

        -- Phụ gia chưng cất

        ADDITIVE_SEED = "Những loại thảo mộc này mơ ước một ngày nào đó sẽ được đóng chai.", -- Phụ gia thảo mộc (Anise, Juniper Berry, Allspice) để làm rượu
        ADDITIVE_PETALS = "Bó cánh hoa già khao khát vẻ đẹp vượt thời gian.", -- Phụ gia thảo mộc, lá trà, cánh hoa để làm rượu
        ADDITIVE_NUT = "Tôi có nên cho nó vào miệng không?", -- Phụ gia hạt (Birchnut, Coconut, Coffee Bean, Cacao Bean) để làm rượu
        ADDITIVE_DAIRY = "Khi nó dễ uống hơn, tôi sẽ uống nhanh hơn.", -- Phụ gia sữa để làm rượu

        -- Đồ uống

        WATER_CLEAN = "Nước tinh khiết từ dòng thời gian khác.", -- Nước sạch
        WATER_DIRTY = "Nếu tôi đang vội, có lẽ...!", -- Nước bẩn
        WATER_SALTY = "Tạp chất từ các đám mây trong tương lai lẫn vào.", -- Nước mặn

        GOOPYDRINK = "Ôi trời, tôi thiếu kiên nhẫn quá!", -- Uống không thành công (Khái niệm về Wet Goop)

        -- Đồ uống ấm trà

        FRUITJUICE = "Tuyệt vời, tôi có thể ăn nhiều loại trái cây cùng một lúc.", -- Nước ép trái cây hỗn hợp
        BERRIES_JUICE = "Không phải chỉ cần hái và ăn chúng là nhanh hơn sao?", -- Nước ép quả mọng
        POMEGRANATE_JUICE = "Bây giờ tôi cũng có thể ăn hạt.", -- Nước ép lựu
        BANANA_JUICE = "Nó làm bạn ấm lên khi trời nóng.", -- Nước chuối
        FIG_JUICE = "Bản chất của vị ngọt!", -- Nước ép quả sung
        DRAGONJUICE = "Đây chắc chắn là nước ép trái cây.", -- Nước ép thanh long
        GLOWBERRYJUICE = "Ngon và hữu ích!", -- Nước ép Glowberry
        WATERMELON_JUICE = "Thật là sảng khoái!", -- Nước ép dưa hấu

        VEGGIE_TEA = "Tôi không có thời gian uống trà.", -- Nước ép rau củ
        CARROT_TEA = "Uống nhanh nhé.", -- Trà cà rốt
        CACTUS_TEA = "Nó sẽ hỗ trợ tiêu hóa.", -- Trà xương rồng
        TOMATO_JUICE = "Mịn; hoàn hảo để uống nhanh.", -- Nước ép cà chua
        LUMPY_TEA = "Tôi không có thời gian uống một tách, nhưng...", -- Trà rễ
        SEAWEED_SHAKE = "Có vẻ lãng phí thời gian so với các lựa chọn khác.", -- Rong biển lắc

        GREENTEA = "Không có thời gian để phân biệt các loại trà.", -- Trà xanh
        BLACKTEA = "Có lẽ thỉnh thoảng tôi có thể thưởng thức một món gì đó?", -- Trà đen
        BLACKTEA_ICED = "Một ngụm đồ lạnh thật tuyệt.", -- Trà đen đá
        FUER = "Có lẽ thỉnh thoảng tôi có thể thưởng thức một tách.", -- Trà lá (Boikhaai/Trà lá/Sarsaparilla)
        MIXFLOWER = "Nó cho phép bạn dành chút thời gian để ngửi mùi hoa.", -- Trà cánh hoa hỗn hợp
        HIBISCUSTEA = "Sao chua thế?", -- Trà dâm bụt
        CACTUSFLOWER_TEA = "Không còn mùi hương của hoa.", -- Trà hoa xương rồng
        LOTUSTEA = "Ngày xưa, nó có thể là một bông hoa hoặc có thể là một con cá.", -- Trà hoa sen
        SUSHIBISCUS = "Không có thời gian uống trà nhưng... bây giờ là sao đây?", -- Trà tự sát (Tôn kính sự kỳ lạ trong bữa tiệc trà của Wilba)
        MOON_BLOSSOM_TEA = "Thật lãng phí thời gian khi quyết định xem đó là loại trà gì.", --Trà hoa trăng

        CAFFEINBERRY_JUICE = "Hoàn hảo để thức suốt đêm trong xưởng.", -- Cà phê đen
        TOFFEE_LATTE = "Vừa là cà phê vừa là món tráng miệng.", -- Toffee-nut latte
        RUINCHA_LATTE = "Tôi đã tiết kiệm được thời gian bằng cách quyết định uống gì.", -- Mocha latte (Cà phê + Ca cao)

        HOTRUINCOLATE = "Sự ấm áp và ngọt ngào vô cùng.", -- Sôcôla nóng
        RUINCOLATE_SMOOTHIE = "Mát mát và ngọt ngào vô cùng.", -- Sinh tố sô cô la (Lạnh)
        RUINXOColaTL = "Điều này thực sự kỳ lạ; nó thể hiện kiến thức từ dòng thời gian khác!", -- Chocolatl (Đắng)
        TEA_RUINCOLATE_LATTE = "Nó rất hợp với khẩu vị của tôi!", -- Matcha latte

        MULLED = "Tôi không thể nhớ lần cuối cùng tôi nằm trên giường bệnh là khi nào...", -- Bancha
        BUTTERBEER = "Tôi có thể tiết kiệm thời gian trong bữa ăn bằng cách ăn cái này.", -- Butterbeer (loạt phim Harry Potter)

        -- Hợp tác Ấm trà Đồ uống

        COCONUT_JUICE = "Tôi đã bù phần trống bằng thạch.", -- Shipwrecked Coconut Juice
        RAINBOW_SHAKE = "Hiệu quả!", -- Thạch cầu vồng bị đắm tàu
        QUARTZ_SHAKE = "Ít nhất tôi sẽ không mất thời gian nhai cá.", -- Shipwrecked Moon Glass Jelly Shake
        CHERRY_ROSEBERRIES_TEA = "Đôi khi, thật tuyệt khi vừa uống một tách trà vừa ngắm hoa.", -- Trà Tầm Xuân Rừng Anh Đào
        CHERRY_HONEY_TEA = "Thật thanh lịch và ấm áp.", -- Trà mật ong hoa anh đào rừng anh đào
        SWEET_RICE_DRINK = "Tôi không biết tại sao những hạt này lại ăn lâu như vậy...", -- Vita Hyphy Sikhye
        ANANAS_JUICE = "Ngay cả khi không có vỏ, nó vẫn khiến bạn thèm ăn hơn.", -- Legion Dứa
        ORANGE_JUICE = "Tôi nên dùng nó như một bữa ăn nhẹ sau bữa ăn.", -- Thêm gói thực phẩm Nước cam
        STRAWBERRY_SMOOTHIE = "Tôi phải uống nó nhanh thôi.", -- Thêm gói thực phẩm Sinh tố dâu tây
        STRAWBERRY_MILK_SMOOTHIE = "Thật là một món tráng miệng tuyệt vời!", -- Gói thực phẩm khác Sinh tố sữa dâu

        -- Đồ uống chưng cất

        SPOILED_DRINK = "Nó từng là đồ uống.", -- Đồ uống hư hỏng (đồ uống hư hỏng)

        -- Nước ngọt

        SODA = "Tôi không nghĩ họ đã phải trải qua tất cả rắc rối này chỉ để thêm bọt vào nước.", -- Nước có ga
        FRUITSODA = "Sẽ không mất quá nhiều thời gian để thưởng thức đồ uống có ga này.", -- Fruit Soda
        LEMONLIMESODA = "Đồ uống có ga rất ngon vì chúng ngọt.", -- Lemon Lime Soda (cao cấp hơn Fruit Soda)
        COLA = "Thật tuyệt vời, ngoại trừ việc ợ hơi.", -- Cola
        COLAQUANTUM = "Thú vị đấy, đó là một loại đồ uống không nên tồn tại trong dòng thời gian này.", -- Quantum Cola
        LUMPY_BEER = "Lần cuối cùng tôi sử dụng rễ cây xá xị là khi nào?", -- Root Beer (Trong bối cảnh thế giới Đói cho mọi thời đại, nó đã bị cấm vào năm 1979.)

        -- Tinh thần

        CORN_BEER = "Khi nào tôi mới có thời gian để thưởng thức đồ uống?", -- Bia ngô
        MADHU = "Nó mất đi vị ngọt, nhưng ít nhất tôi cũng có được chút thời gian.", -- Mead
        WINE = "Nó sẽ không biến thành giấm quá nhanh.", -- Rượu vang (lên men quả mọng thường xuyên)
        NOBLEWINE = "Không phải chỉ là rượu trong thôi sao?", -- Noble Wine (lên men quả mọng nấu chín)
        SPARKLINGWINE = "Trong một dòng thời gian khác, tôi có thể là người bật sâm panh trong một bữa tiệc.", -- Sparkling Wine
        GLOWBERRYWINE = "Chính là nó! Nó không dễ hư hỏng và rất hiệu quả!", -- Glow Berry Wine
        KUMIS = "Tôi hy vọng sự đầu tư thời gian là xứng đáng.", -- Kumis, Sữa lên men
        LUMPY_WINE = "Tôi sẽ coi đó là một lợi ích.", -- Moonshine (rượu mạnh lên men)
        PULQUE = "Nó có thể hư hỏng nhanh chóng so với thời gian đầu tư.", -- Pulque (rượu Agave sap)
        RUINCACAO_WINE = "Đó là một ý tưởng kỳ lạ, nhưng dù sao đi nữa, tôi đã có thêm chút thời gian.", -- Cacao Wine

        -- Nước ngọt hợp tác

        CHERRY_DOCTOR_COLA = "Tôi không nghĩ đồ uống này liên quan đến việc du hành thời gian.", -- Cherry Forest Dr. Pepper (Doctor Cherry) (nhại lại Doctor Who)
        ANANASSODA = "Tốt, tôi sẽ không lãng phí quá nhiều thời gian để thưởng thức món này.", -- Dứa có ga (Ohranjii)
        ORANGESODA = "Tốt, tôi sẽ không lãng phí quá nhiều thời gian để thưởng thức món này.", -- Carbonated Oranj (Fanta)
        STRAWBERRYSODA = "Tốt, tôi sẽ không lãng phí quá nhiều thời gian để thưởng thức món này.", -- Dâu có ga (Dâu xứ Wales)

        -- Tinh thần hợp tác

        AUROBOW = "Đó là một tinh linh có khả năng chống chịu cầu vồng.", -- Aurobow bị đắm tàu (Linh hồn sứa cầu vồng)
        COCONUT_WINE = "Nếu chuyến đi kéo dài hơn, tôi nên mang theo nó.", -- Rượu dừa đắm tàu
        CHERRY_BLOOM_MADHU = "Nó khá thanh lịch!", -- Rượu mật ong hoa anh đào rừng anh đào
        GIANT_BLUEBERRY_WINE = "Nó làm tôi hơi lo lắng.", -- Vita Hyphy Boom!Berry Sapphire (Nổ khi thắp sáng)
        RICE_WINE = "Dù sao thì tôi cũng không dành nhiều thời gian cho nó.", -- Rượu gạo Vita Hyphy (Makgeolli)
        WHEAT_BEER = "Làm bia từ trái bánh mì là một cách không tồi.", -- Heap of Food Breadfruit Beer
        PALE_BEER = "Tôi đã thấy rất nhiều điều kỳ lạ nên điều này không làm tôi ngạc nhiên.", -- Legion Pale Ale (Bia làm từ trái cây quái vật)

        -- Rượu chưng cất

        DISINFECTANT = "Tôi vô dụng. Tôi chỉ cần thời gian!", -- Thuốc khử trùng
        CORN_WHISKEY = "Thành thật mà nói, tôi không biết mùi vị, nhưng ít nhất nó sẽ không bị hỏng nhanh.", -- Corn Whiskey
        LUMPY_VODKA = "Cẩn thận đừng lãng phí thời gian say xỉn.",
        -- Rượu vodka
        TEQUILA = "Đừng chần chừ, hãy nhắm mắt lại và uống đi!", -- Tequila
        MADHU_RUM = "Với thứ này, tôi có thể ra khơi, có thể là ngày mai hoặc thậm chí bây giờ.", -- Rum
        BERRY_BRANDY = "Whiskey, Brandy... Thành thật mà nói, tôi không biết sự khác biệt, miễn là nó không bị hỏng.", -- Berry Brandy
        AREUHI = "Tôi hy vọng bây giờ nó sẽ không bị hỏng nhanh.", -- Kumis, Sữa lên men (Arouhi)

        -- Rượu chưng cất độc quyền của Wolly

        BERRY_GIN = "Chỉ cần một ly là đủ.", -- Gin
        GLOWBERRY_GIN = "Đó là một tinh thần tuyệt vời, nhưng tôi vẫn cần phải thận trọng để không uống quá nhiều.", -- Glow Berry Gin
        ABSINTHE = "Không có thời gian để nhấm nháp nó một cách chậm rãi.", -- Absinthe
        TEA_LUMPY_VODKA = "Thành thật mà nói, tôi không chắc nó có mùi trà hay không.", -- Rượu mùi trà xanh
        PETALS_BERRY_BRANDY = "Tôi không có thời gian để thưởng thức hương hoa trong đồ uống của mình.", -- Rose Scented Brandy
        KAHLUA = "Thật tuyệt vời! Nó giúp tôi vượt qua nỗi sợ hãi và tăng cường năng lượng cho tôi.", -- Coffee Liqueur Kahlúa
        NUT_CORN_WHISKEY = "Thật lãng phí thời gian để phân biệt giữa các loại rượu mạnh.", -- Nut Whiskey
        RUINCACAO_CREAM_LIQUEUR = "Nó phù hợp với khẩu vị của tôi, nhưng tôi nên thận trọng nếu ăn quá nhiều.", -- Baileys Cacao Cream Liqueur
        RUMCHATA = "Bây giờ nó bớt ghê tởm hơn một chút rồi.", -- Rumchata (hỗn hợp rượu rum và Horchata, một loại đồ uống làm từ sữa)

        -- Hợp tác chưng cất rượu mạnh

        MOONWAY = "Một tinh thần có độ bền cao, tỏa sáng với 7 màu.", -- Tinh thần chưng cất sứa cầu vồng
        ARRACK = "Vượt qua các hòn đảo, thoát khỏi sự ràng buộc của thời gian.", -- Arrack Phiên bản Indonesia Rượu dừa chưng cất
        CHERRY_BLOOM_RUM = "Đó là một cái chai đẹp, nhưng tôi sẽ không lãng phí thời gian để chiêm ngưỡng nó.", -- Cherry Blossom Honey Rum Distilled Spirit Cherry Blossom Petals Float
        RICE_SPIRITS = "Một ngụm là tôi sẽ tỉnh táo.", -- Makgeolli (Rượu gạo)
        WHEAT_WHISKEY = "Thành thật mà nói, tôi không biết mùi vị, nhưng ít nhất nó không bị hỏng nhanh.", -- Wheat Whiskey
        PALE_WHISKEY = "Một khi cho vào miệng, tất cả các loại rượu mạnh đều có hương vị giống nhau.", -- Pale Malt Whiskey

        -- Hợp tác độc quyền của Wolly Rượu chưng cất

        NUT_COCONUT_BRANDY = "Biển hay thay đổi; tôi cần thứ gì đó để chinh phục nỗi sợ hãi của mình.", -- Coconut Brandy (Được đổi tên thành Caribbean Brandy do không thể sản xuất rượu Rum Caribbean)
        GIANT_BLUEBERRY_GIN = "Một ngày nào đó, chắc chắn sẽ có người gây rắc rối với việc này.", -- Boom!Berry Sapphire (Vụ nổ cà rốt)

        -- Món ăn trong nồi

        DARK_RUINCOLATE = "Wolie có hiểu bí quyết của món ăn nhẹ này không?", -- Sôcôla đen
        WHITE_RUINCOLATE = "Wollie biết rõ sở thích của tôi!", -- Sôcôla trắng
        RUINCOLATE = "Vị ngọt và không mất quá nhiều thời gian để uống!", -- Sôcôla
        RUIN_SCHOKAKOLA = "Một món ăn nhẹ hoàn hảo!", -- Chokola

        BUCKET_STEEL_EMPTY =
        {
            EMPTY = "Có thực sự cần thiết phải nhìn chằm chằm vào cái thùng rỗng này không?", -- Thùng Thép Rỗng
            FULL = "Hãy lấy nó trước khi thủy triều thay đổi!", -- Nước mưa sạch đã đầy
            FULL_ICE = "Ôi trời, nó đã đóng băng theo thời gian rồi.", -- Nước mưa đã đóng băng
            DIRTY = "Ôi trời, nó bị ô nhiễm theo thời gian rồi.", -- Nước mưa đã trở nên bẩn rồi
            DIRTY_ICE = "Ôi trời, nó bị đóng băng trong khi vẫn bị ô nhiễm.", -- Nước mưa bẩn đã đóng băng
        },

        BUCKET_WOODIE_EMPTY =
        {
            EMPTY = "Tôi cảm thấy bất ngờ khi những nguyên liệu cũ vẫn làm được đồ mới ngon nghẻ vậy luôn á!", -- Thùng gỗ rỗng của Woodie
            FULL = "Hãy lấy nó trước khi thủy triều thay đổi!", -- Nước mưa sạch đã đầy
            FULL_ICE = "Ôi trời, nó đã đóng băng theo thời gian rồi.", -- Nước mưa đã đóng băng
            DIRTY = "Ôi trời, nó bị ô nhiễm theo thời gian rồi.", -- Nước mưa đã trở nên bẩn rồi
            DIRTY_ICE = "Ôi trời, nó bị đóng băng trong khi vẫn bị ô nhiễm.", -- Nước mưa bẩn đã đóng băng
        },

        BUCKET_DRIFTWOOD_EMPTY =
        {
            EMPTY = "Nó chỉ là một cái xô bình thường thôi.", -- Xô Gỗ Rỗng
            FULL = "Hãy lấy nó trước khi thủy triều thay đổi!", -- Nước mưa sạch đã đầy
            FULL_ICE = "Ôi trời, nó đã đóng băng theo thời gian rồi.", -- Nước mưa đã đóng băng
            DIRTY = "Ôi trời, nó bị ô nhiễm theo thời gian rồi.", -- Nước mưa đã trở nên bẩn rồi
            DIRTY_ICE = "Ôi trời, nó bị đóng băng trong khi vẫn bị ô nhiễm.", -- Nước mưa bẩn đã đóng băng
        },

        BUCKET_EMPTY =
        {
            EMPTY = "Nó chỉ là một cái xô bình thường thôi.", -- Xô Gỗ Rỗng
            FULL = "Hãy lấy nó trước khi thủy triều thay đổi!", -- Nước mưa sạch đã đầy
            FULL_ICE = "Ôi trời, nó đã đóng băng theo thời gian rồi.", -- Nước mưa đã đóng băng
            DIRTY = "Ôi trời, nó bị ô nhiễm theo thời gian rồi.", -- Nước mưa đã trở nên bẩn rồi
            DIRTY_ICE = "Ôi trời, nó bị đóng băng trong khi vẫn bị ô nhiễm.", -- Nước mưa bẩn đã đóng băng
        },

        DESALINATOR =
        {
            EMPTY = "Thiết bị biến nước biển thành nước ngọt.", -- Máy khử muối không dùng nước
            PURIFY_LONG = "Tôi không thể chỉ đứng đợi cho đến khi nó kết thúc; thời gian là quý giá!", -- Quá trình thanh lọc còn một chặng đường dài phía trước
            PURIFY_SHORT = "Nhanh lên, nhanh lên!", -- Quá trình thanh lọc gần như hoàn tất
            HASWATER = "Cuối cùng!", -- Đã có nước sạch
            BURNT = "Có một chút trục trặc.", -- Máy khử muối bị cháy
            HASSALT = "Hãy nắm bắt, chúng ta cần loại bỏ muối trước!", -- Máy khử muối vẫn còn muối
        },

        BARREL =
        {
            GENERIC = "Ít nhất tôi không phải lo lắng về việc nước bị hỏng.", -- Kiểm tra thùng
            BURNT = "Ai có thể đoán trước được thùng nước sẽ bốc cháy?", -- Thùng bị cháy
        },

        BREWERY =
        {
            EMPTY = "Việc sản xuất bia cần có thời gian tuyệt vời.", -- Kiểm tra nhà máy bia trống
            BURNT = "Tôi cho rằng đây là định mệnh của nó.", -- Nhà máy bia bị cháy
            FERMENTING_LONG = "Quá trình lên men cần có thời gian và tôi không thể chỉ chờ đợi được.", -- Quá trình lên men còn một chặng đường dài phía trước
            FERMENTING_SHORT = "Tôi đã đợi khá lâu rồi!", -- Quá trình lên men gần như hoàn tất
            DONE = "Cuối cùng cũng có thứ để trưng bày!", -- Có đồ uống trong nhà máy bia
        },

        CAMPKETTLE_ITEM = "Tôi nên mang theo cái này một lúc.", -- Kiểm tra vật dụng ấm đun nước cắm trại
        CAMPKETTLE =
        {
            GENERIC = "Tôi quên đổ nước vào đây à?", -- Kiểm tra ấm cắm trại không có nước
            BOILING_LONG = "Tôi không thể đứng đây đợi được!", -- Nước đang sôi
            BOILING_SHORT = "Nó vẫn chưa sẵn sàng để uống à?", -- Nước gần sôi rồi
            DONE = "Chỉ pha đồ uống mà mất nhiều thời gian thế này à?", -- Có nước sạch trong ấm cắm trại
            STOP = "Ôi trời, lửa chưa đủ mạnh!", -- Ấm trại không có lửa
        },

        CAMPDESALINATOR_ITEM = "Nó có thể hữu ích vì luôn có biển gần đó.", -- Kiểm tra thiết bị khử muối trong trại
        CAMPDESALINATOR =
        {
            GENERIC = "Lúc đầu ở đây có nước không, hay nó luôn trống rỗng?", -- Máy khử muối của trại trống rỗng
            BOILING_LONG = "Tôi không thể đứng đây đợi được!", -- Nước đang sôi
            BOILING_SHORT = "Nó vẫn chưa sẵn sàng để uống à?", -- Nước gần sôi rồi
            DONE = "Chỉ để uống nước mà mất nhiều thời gian thế?", -- Có nước sạch trong máy khử muối của trại
            STOP = "Ôi trời, lửa chưa đủ mạnh!", -- Máy khử muối trong trại không có lửa
        },

        KETTLE =
        {
            EMPTY = "Ít nhất tôi có thể đun sôi nhiều nước cùng lúc với cái này.", -- Kiểm tra ấm rỗng
            BURNT = "Ôi chao, lát nữa tôi phải liếm sương trên lá mất.", -- Ấm đun nước bị cháy rồi
            BOILING_LONG = "Tại sao phải mất nhiều thời gian để uống một ly?", -- Chỉ mới bắt đầu đun sôi
            BOILING_SHORT = "Tôi hy vọng nó không bị chiết xuất quá mức; bây giờ tôi có thể uống được không?", -- Gần như đã nấu xong đồ uống
            DONE = "Cuối cùng cũng có thứ để trưng bày!", -- Có đồ uống trong ấm
            PURIFY_LONG = "Tôi không thể chỉ đứng đợi cho đến khi nó kết thúc; thời gian là quý giá!", -- Quá trình thanh lọc còn một chặng đường dài phía trước
            PURIFY_SHORT = "Nhanh lên, nhanh lên!", -- Quá trình thanh lọc gần như hoàn tất
            HASWATER = "Bây giờ tôi có thể uống được không?", -- Ấm có nước sạch
            MELT_LONG = "Tôi không thể làm tan đá và uống nó bây giờ được sao?", -- Bắt đầu làm tan đá
            MELT_SHORT = "Nó gần như tan chảy rồi!", -- Nước đá gần như tan hoàn toàn
        },

        PORTABLEKETTLE_ITEM =
        {
            GENERIC = "Tôi không có thời gian để trải chăn dã ngoại và tổ chức tiệc trà.", -- Kiểm tra hạng mục ấm đun nước di động
            EMPTY = "Tốt hơn hết tôi nên bổ sung chất lỏng từ quả mọng hoặc cà rốt.", -- Kiểm tra ấm đun nước di động trống đã đặt
            BOILING_LONG = "Tại sao phải mất nhiều thời gian để uống một ly?", -- Chỉ mới bắt đầu đun sôi
            BOILING_SHORT = "Sẽ không mất quá nhiều thời gian phải không?", -- Gần như nấu xong đồ uống rồi
            DONE = "Cuối cùng cũng có thứ để trưng bày!", -- Có đồ uống trong ấm di động
            PURIFY_LONG = "Tôi không thể đứng chờ đợi được!", -- Quá trình thanh lọc còn một chặng đường dài phía trước
            PURIFY_SHORT = "Nhanh lên, nhanh lên!", -- Quá trình thanh lọc gần như hoàn tất
            HASWATER = "Bây giờ tôi có thể uống được không?", -- Ấm di động có nước sạch
            MELT_LONG = "Tôi không thể làm tan đá và uống nó bây giờ được sao?", -- Bắt đầu làm tan đá
            MELT_SHORT = "Nó gần như tan chảy rồi!", -- Nước đá gần như tan hoàn toàn
        },

        DISTILLERS =
        {
            EMPTY = "Ít nhất, rượu mạnh được làm bằng chất này sẽ không dễ bị hỏng.", -- Kiểm tra máy chưng cất
            DISTILLTING_LONG = "Nếu tôi xem hết phần này, tôi sẽ già đi nhanh hơn đồ uống.", -- Việc chưng cất còn một chặng đường dài phía trước
            DISTILLING_SHORT = "Sẽ không mất quá nhiều thời gian!", -- Quá trình chưng cất gần như hoàn tất
            DONE = "Cuối cùng!", -- Có đồ uống trong máy chưng cất
        },

        WELL_WATERPUMP = {
            HIGH_PRESSURE = "Mọi công sức bỏ ra đã được đền đáp!", -- Áp lực tối đa
            MIDDLE_PRESSURE = "Tôi có thể lấy nước sạch ngay lập tức.", -- Áp suất vừa phải
            LOW_PRESSURE = "Có vẻ như nguồn điện đang yếu.", -- Hầu như không có áp suất
            RECHARG_PRESSURE = "Ôi trời, sẽ mất một thời gian để bơm nước trở lại.", -- Không có áp lực nào cả (không thể sử dụng cho đến khi áp suất tối đa).
        },

        WELL_SPRINKLER =
        {
            LOWFUEL = "Nếu tôi muốn, tôi có thể tiếp nhiên liệu.", -- Kiểm tra khi gần hết nhiên liệu
            ON = "Điều này giúp tôi tiết kiệm thời gian tưới nước!", -- Nó đang hoạt động
            OFF = "Nó có thể được kích hoạt bất cứ lúc nào.", -- Kiểm tra khi nó tắt
        },
    },
}