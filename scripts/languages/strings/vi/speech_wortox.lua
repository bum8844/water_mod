return {
    ACTIONFAIL =
    {
        GIVE =
        {
            WELL_NOTEMPTY = "Một thùng là đủ.", -- Cố gắng cho một thùng khi giếng đã có sẵn.
            WELL_BUSY = "Bạn sẽ không nhận được quà nếu tham lam.", -- Cố gắng đưa một cái xô khi trong giếng đã có một cái xô.
        }
    },

    ANNOUNCE_DRUNK = "Có thể nhìn thấy cả thế giới vật chất và thế giới bóng tối!", -- Đang say

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

    ANNOUNCE_DRUNK_END = "Thế giới vật chất đang bắt đầu trở nên rõ ràng trở lại.", -- Tỉnh táo sau rượu (nôn nao)
    ANNOUNCE_DRUNK_IMMUNITY = "", -- Tạm thời. Dành riêng cho Wickerbottom.
    ANNOUNCE_NOTCHARGE = "Tôi cần sạc pin, anh bạn!", -- Wolfgang không thể vắt sữa nếu không sạc đủ.
    ANNOUNCE_NOTHIRSTSLEEP = "Nếu ngủ như thế này, sáng mai tôi sẽ biến thành một con tiểu quỷ ăn vặt mất.", -- Cố ngủ khi khát vào ban đêm
    ANNOUNCE_NOTHIRSTSIESTA = "Tôi không muốn bị khô vì khát trong ngày.", -- Cố gắng ngủ trưa khi khát trong ngày
    ANNOUNCE_SLEEP_END = "Tôi hoàn toàn trở lại thế giới vật chất!", -- Thức dậy sau khi ngủ và hoàn toàn tỉnh táo vì rượu
    ANNOUNCE_THIRST = "Trông tôi có vẻ phàm tục, nhưng tôi cần uống nước!", -- Khi cực kỳ khát nước
    ANNOUNCE_CAFFINE_BUFF_START = "Ôi, tôi thấy bồn chồn quá!", -- Bắt đầu quá trình yêu thích caffeine
    ANNOUNCE_CAFFINE_BUFF_STOP = "Tôi tự hỏi mình còn lại bao nhiêu tinh thần?", -- Kết thúc cơn nghiện caffeine
    ANNOUNCE_CURE_WATERBORNE = "Ồ, điều đó không tệ chút nào.", -- Đối thoại khi chữa bệnh lây qua đường nước bằng một vật phẩm
    ANNOUNCE_DCAPACITY_CRITICAL = "Đồ uống đang cố kéo tôi vào thế giới bóng tối!", -- Sắp say
    ANNOUNCE_DCAPACITY_HALF = "Ồ, tôi cảm thấy khá tốt!", -- Khi bắt đầu cảm thấy say

    DESCRIBE =
    {
        BOILBOOK = "Có hướng dẫn sử dụng nước sôi không?",
        WATER_CLEAN_ICE = "Chắc là khó uống lắm.", -- Nước đá sạch
        WATER_DIRTY_ICE = "Ôi, bẩn quá!", -- Nước đá bẩn

        SPICE_CAFFEINPEPPER = "Gia vị cướp cay.", -- Gia vị hạt tiêu caffein

        WELL_KIT = "Hướng dẫn cách đào giếng cho người phàm.", -- Well kit
        WELL_SPRINKLER_KIT = "Tôi không thích bị xịt.", -- Bộ phun nước
        WELL_WATERPUMP_KIT = "Một cái giếng dựa vào phép thuật, thật thú vị!", -- Bộ máy bơm nước bằng hơi nước
        WELL_BURYING_KIT = "Một công cụ để chôn vùi những sai lầm trong quá khứ.", -- Bộ chôn cất lỗ
        WELL_DRILLING = "Tạo lỗ trên thế giới.", -- Khoan lỗ
        WELL_DRILLING_ITEM = "Hãy đào một chút!", -- Mục khoan
        HOLE = "Bên trong khá sâu!", -- Lỗ giếng
        WELL = "Tôi cần tìm một cái xô để hạ xuống.", -- Vâng

        WX78MODULE_NONEDRUNK = "Bạn có phải là người sáng nhất trong nhóm không?", -- 78전용 묘듈

        -- Cây ở chế độ nước

        TEA_TREE = "Cây thơm và yếu ớt.", -- Cây trà
        DUG_TEA_TREE = "Tôi nên trồng nó ở đâu đó nhanh lên.", -- Đào cây trà
        TEA_SEED = "Có cái gì đó nhỏ bên trong cái lớn.", -- Hạt cây trà
        TEA_SEED_COOKED = "Nó không thể chịu được nhiệt.", -- Hạt cây trà đã rang
        TEA_SEED_SAPLING = "Nó phát triển chăm chỉ quá!", -- Cây trà non
        TEALEAVES = "Lá có mùi thơm.", -- Lá trà
        TEALEAVES_DRIED = "Chúng đã cạn kiệt. Sự tàn ác có sức hấp dẫn riêng!", -- Lá trà khô

        CAFFEINBERRY = "Nó có màu xanh, không giống tôi.", -- Bụi cây cafein
        DUG_CAFFEINBERRY = "Có chỗ nào trồng cây này không?", -- Đào bụi cây caffeine
        CAFFEINBERRY_BEAN = "Một loại đậu có mùi sống động.", -- Hạt caffeine tươi
        CAFFEINBERRY_BEAN_COOKED = "Nó có mùi thơm tiếp thêm sinh lực.", -- Hạt caffeine rang

        RUINCACAO_TREE = "Một cái cây vui vẻ và kỳ lạ. Thật thú vị!", -- Cây Cacao
        DUG_RUINCACAO_TREE = "Trồng cây này gần nhà có được không?", -- Đào cây cacao
        RUINCACAO_SEED = "Nó đang nảy mầm à?", -- Mặt hàng hạt cacao
        RUINCACAO_SEED_SAPLING = "Nó phát triển một cách kỳ lạ!", -- Cây giống Cacao
        RUINCACAO = "Tôi không phải Krampus, nhưng...", -- Cacao trước khi tan vỡ
        RUINCACAO_BEAN = "Không có mùi khét.", -- Hạt cacao nghiền
        RUINCACAO_BEAN_COOKED = "Kỳ lạ là nó có mùi thơm.", -- Hạt cacao rang

        -- Phụ gia chưng cất rượu mạnh

        ADDITIVE_SEED = "Nó có mùi cay.", -- Phụ gia thảo dược (Anise, Juniper Berry, Palgak Motive) cho rượu mùi
        ADDITIVE_PETALS = "Đây là những loại thảo mộc dùng để pha đồ uống.", -- Phụ gia thảo dược, trà và cánh hoa cho rượu mùi
        ADDITIVE_NUT = "Con người có thể gãy răng vì thứ này!", -- Phụ gia hạt (Hạt Burchi, Dừa, Hạt cà phê, Đậu Cacao) cho rượu mùi
        ADDITIVE_DAIRY = "Tôi tự hỏi lần này con người làm gì với sữa nhỉ?", -- Phụ gia sữa cho rượu mùi

        -- Đồ uống

        WATER_CLEAN = "Con người không thể sống thiếu thứ này.", -- Nước sạch
        WATER_DIRTY = "Ôi, nó bẩn thật!", -- Nước bẩn
        WATER_SALTY = "Ôi, càng uống càng khát!", -- Saltwater

        GOOPYDRINK = "Một thử nghiệm thất bại khó chịu.", -- Đồ uống thất bại (Khái niệm Wet Goop)

        -- Đồ uống ấm trà

        FRUITJUICE = "Có tất cả mọi thứ trong đó.", -- Nước ép trái cây hỗn hợp
        BERRIES_JUICE = "Nó có vị ngọt như con người.", -- Nước ép quả mọng
        POMEGRANATE_JUICE = "Tôi có nên uống nó dù phải ở dưới lòng đất không?", -- Nước ép lựu
        BANANA_JUICE = "Con người sẽ thích đồ uống này.", -- Nước chuối
        FIG_JUICE = "Uống thứ này sẽ khiến tôi bị đuổi khỏi trang trại.", -- Nước ép quả sung
        DRAGONJUICE = "Vị rồng hay vị ruồi?", -- Nước ép thanh long
        GLOWBERRYJUICE = "Tỏa sáng thì tốt, nhưng không nên uống.", -- Nước ép Glowberry
        WATERMELON_JUICE = "Hmm, tôi sẽ vượt qua.", -- Nước ép dưa hấu

        VEGGIE_TEA = "Tôi ổn. Chỉ có tâm hồn mới quan trọng.", -- Nước ép rau củ
        CARROT_TEA = "Uống cà rốt sẽ không hại gì nhiều đâu.", -- Trà cà rốt
        CACTUS_TEA = "Thức uống không có gai và tầm nhìn đẹp.", -- Trà xương rồng
        TOMATO_JUICE = "Cà chua buồn. Hehe!", -- Nước ép cà chua
        LUMPY_TEA = "Hương vị rễ cây có vị như thế nào?", -- Trà rễ
        SEAWEED_SHAKE = "Rong biển trở lại sau khi sấy khô.", -- Rong biển lắc

        GREENTEA = "Cảm giác như thiếu thứ gì đó.", -- Trà xanh lá tươi
        BLACKTEA = "Lá không có màu đỏ.", -- Trà đen
        BLACKTEA_ICED = "Ôi. Trời lạnh quá. Hehe!", -- Trà đen đá
        FUER = "Chỉ đun sôi lá.", -- Fu Cha, Trà lá, Trà Goshari
        MIXFLOWER = "Trà hoa của bậc thầy.", -- Trà cánh hoa hỗn hợp
        HIBISCUSTEA = "Cảm giác như có linh hồn vậy. Hehe!", -- Trà dâm bụt
        CACTUSFLOWER_TEA = "Đó là một bông hoa đẹp. Bây giờ nó ở dạng lỏng!", -- Trà hoa xương rồng
        LOTUSTEA = "Tuy nhiên, không có tâm hồn màu hồng.", -- Trà sen
        SUSHIBISCUS = "Sushi, trời ơi bạn bè. Muốn xem tôi mang gì không?", -- Trà Seosalt
        MOON_BLOSSOM_TEA = "Ngay cả đồ uống cũng tỏa sáng dưới ánh trăng!", -- Trà hoa trăng

        CAFFEINBERRY_JUICE = "Nó sẽ cung cấp cho bạn năng lượng. Tôi thấy nó không ngon lắm.", -- Cà phê đen
        TOFFEE_LATTE = "Tôi không thực sự thích đồ uống.", -- Toffee Nut Latte
        RUINCHA_LATTE = "Tôi đoán mình nên thử món này.", -- Mocha Latte (Cà phê + Sôcôla)

        HOTRUINCOLATE = "Giải pháp cho người không có lông trong mùa đông.", -- Sôcôla nóng
        RUINCOLATE_SMOOTHIE = "Tôi thích đồ uống lạnh hơn. Không phải khẩu vị của tôi.", -- Sinh tố sô cô la (ướp lạnh)
        RUINXOCOLATL = "Ngay cả khi bạn chỉ nếm một nửa, nó vẫn đắng!", -- Chocolatl (cay)
        TEA_RUINCOLATE_LATTE = "Tôi không thực sự thích uống rượu.", -- Matcha Latte

        MULLED = "Làm ấm ruột.", -- Banchou
        BUTTERBEER = "Tôi cảm thấy có phép thuật một cách kỳ lạ.", -- Bia bơ trong bộ truyện Harry Potter

            -- Đồ uống ấm trà hợp tác

        COCONUT_JUICE = "Uống thứ gì đó chẳng có mùi vị gì cả.", -- Nước cốt dừa đắm tàu
        RAINBOW_SHAKE = "Chỉ cần nhìn màu sắc là đủ.", -- Shipwrecked Rainbow Jelly Shake
        QUARTZ_SHAKE = "Cá uống thứ này? Tôi không thể tưởng tượng nổi.", -- Shipwrecked Brainy Matter Shake
        CHERRY_ROSEBERRIES_TEA = "Có mùi hoa hồng thoang thoảng.", -- Trà tầm xuân rừng anh đào
        CHERRY_HONEY_TEA = "Ngọt vừa phải để uống.", -- Trà mật ong hoa anh đào rừng anh đào
        SWEET_RICE_DRINK = "Họ nói rằng bạn nên uống và ăn cùng lúc!", -- Vita Co-op Sikhye
        ANANAS_JUICE = "Tôi có thể là một tinh chất.", -- Legion Dứa
        ORANGE_JUICE = "Chỉ nhìn màu cam là tôi đã thấy hài lòng rồi.", -- Thêm gói thực phẩm Nước cam
        STRAWBERRY_SMOOTHIE = "Đó là một loại trái cây màu đỏ.", -- Gói thực phẩm khác Sinh tố dâu tây
        STRAWBERRY_MILK_SMOOTHIE = "Ít nhất nó phải mịn.", -- Thêm gói thực phẩm Strawberry Smoothie Latte

        -- Đồ uống nhà máy bia

        SPOILED_DRINK = "Đó thực sự là nước hư!", -- Đồ uống hư

        -- Nhà máy bia Soda

        SODA = "Hmm, cứ như nước đang tấn công tôi vậy!", -- Soda Water
        FRUITSODA = "Cảm giác như trái cây đang gào thét!", -- Fruit Soda
        LEMONLIMESODA = "Là đồ uống ngọt có vị trái cây.", -- Lemon Lime Soda (Cao cấp hơn so với Soda trái cây)
        COLA = "Thứ gì đó màu đen cũng được!", -- Cola
        COLAQUANTUM = "Hmm, độ phóng xạ tốt!", -- Cola Quantum
        LUMPY_BEER = "Có vẻ như nó được thiết kế cho cảnh sát.", -- Root Beer (Không phải rượu)

        -- Rượu mạnh nhà máy bia

        CORN_BEER = "Tất cả ngô đã đi đâu rồi?", -- Bia ngô
        MADHU = "Nếu bạn uống nó, bạn sẽ vo ve như một con ong!", -- Madhu
        WINE = "Nó có vị như một loại rượu sang trọng.", -- Wine (Berry Brewing)
        NOBLEWINE = "Làm sao màu đỏ có thể chuyển thành màu trắng?", -- Noble Wine (Baked Berry Brewing)
        SPARKLINGWINE = "Hmm, nó chứa đầy những thứ không tốt cho cơ thể!", -- Sparkling Wine
        GLOWBERRYWINE = "Tôi sắp uống thứ gì đó lạ.", -- Glow Berry Wine
        KUMIS = "Chà, uống nó sẽ không phải là một món quà đâu các em.", -- Kumis
        LUMPY_WINE = "Tôi không thể tin tưởng ai đó từ lòng đất.", -- Sake (Rễ như khoai tây và khoai lang)
        PULQUE = "Ai có thể nghĩ rằng cây có gai lại được dùng để uống?", -- Pulque
        RUINCACAO_WINE = "Ồ, bây giờ bạn có thể làm rượu bằng đậu à?", -- Rượu Cacao

        -- Soda hợp tác

        CHERRY_DOCTOR_COLA = "Nó có thể là một công cụ tra tấn tốt. Hohoho!", -- Cherry Forest Doctor Pepper (Doctor Cherry)
        ANANASSODA = "Tôi thích tận hưởng tinh chất hơn là uống nó.", -- Pineapple Soda (Orangina)
        ORANGESODA = "Quả cam không thể ép thành nước được.", -- Orange Soda (Fanta)
        STRAWBERRYSODA = "Liệu hạt có nổ như bom không?", -- Strawberry Soda (Dâu tây xứ Welch)

        -- Tinh thần hợp tác

        AUROBOW = "Sẽ là đồ uống xuất hiện sau khi trời mưa phải không? Hohoho!", -- Shipwrecked Rainbow Jelly Wine
        COCONUT_WINE = "Nó chẳng có vị gì đặc biệt cả.", -- Rượu dừa đắm tàu
        CHERRY_BLOOM_MADHU = "Ngọt vừa phải để uống.", -- Rượu mật ong hoa anh đào
        GIANT_BLUEBERRY_WINE = "Uống được thì tốt. Dùng làm vũ khí thì tốt hơn!", -- Boom Berry Wine (Nổ khi đốt)
        RICE_WINE = "Gạo có hòa tan trong nước không?", -- Vita Co-op Makgeolli
        WHEAT_BEER = "Tôi sẽ uống bia lúa mì khi thủy triều lên.", -- Heap of Food Wheat Beer
        PALE_BEER = "Liệu nước da của tôi có bị tái đi không?", -- Legion Pale Ale (Bia làm từ Trái cây Quái vật)

        -- Rượu chưng cất

        DISINFECTANT = "Chỉ cần bạn còn linh hồn thì không cần khử trùng.", -- Thuốc khử trùng
        CORN_WHISKEY = "Chỉ là rượu ngô thôi.", -- Corn Whisky
        LUMPY_VODKA = "Imps sẽ gặp khó khăn với điều này.", -- Vodka
        TEQUILA = "Ca ngợi mặt trời! Hohoho!", -- Tequila
        MADHU_RUM = "Cáiy nói con người cố gắng uống thuốc độc, bạn biết đấy.", -- Rum
        BERRY_BRANDY = "Nó có hương vị mà những người sành sỏi thường thích. Không phải tôi.", -- Berry Brandy
        AREUHI = "Tôi tự hỏi liệu trẻ em phàm trần có uống nó và hành động như người lớn không.", -- Kumis Distilled Areuhi

        -- Rượu chưng cất độc quyền của Warly

        BERRY_GIN = "Người ta nói con người trộn nó với những thứ khác.", -- Gin
        GLOWBERRY_GIN = "Dạ dày của bạn sẽ sáng lên chứ?", -- Glow Berry Gin
        ABSINTHE = "Giống tôi khi bạn loại bỏ màu.", -- Absinthe
        TEA_LUMPY_VODKA = "Không, không, không.", -- Rượu mùi trà xanh
        PETALS_BERRY_BRANDY = "Tôi không hợp với những thứ cao cấp.", -- Rose Scented Brandy
        KAHLUA = "Cân bằng giữa ngủ và thức.", -- Coffee Liqueur Kahlua
        NUT_CORN_WHISKEY = "Có chốt trong đó không?", -- Nut Whiskey
        RUINCACAO_CREAM_LIQUEUR = "Hmm, tôi ổn.", -- Rượu mùi kem Cacao Baileys
        RUMCHATA = "Điều này có phổ biến trong xã hội phàm trần không?", -- Rumchata (Rum trộn với Ouatza)

        -- Rượu chưng cất hợp tác

        MOONWAY = "Tôi biết suy nghĩ của họ về sự bất tử, nhưng tôi không hiểu.", -- Shipwrecked Rainbow Jelly Distilled Wine
        ARRACK = "Nó vẫn hơi đơn giản.", -- Arrack (phiên bản tiếng Indonesia của Rượu dừa chưng cất)
        CHERRY_BLOOM_RUM = "Uống là đủ.", -- Rượu vang mật ong hoa anh đào Rượu chưng cất với hoa anh đào nổi
        RICE_SPIRITS = "Giấu nó trong nước sẽ rất thú vị.", -- Cheongju
        WHEAT_WHISKEY = "Con người nên trộn nó với đồ uống của họ. Hohoho.", -- Wheat Whiskey
        PALE_WHISKEY = "Nó thực sự rất nhạt.", -- Pale Malt Whiskey

        -- Rượu chưng cất hợp tác độc quyền của Warly

        NUT_COCONUT_BRANDY = "Này, đầu bạch tuộc! Bạn đang tìm kiếm thứ gì đó à? Có thể là cái này không? Trông ngon đấy!", -- Ôi, mặt cá! Mất thứ gì đó? Hở? Hiểu rồi!. -- Calypso, Cướp biển vùng Caribe
        GIANT_BLUEBERRY_GIN = "Hohoho, chuyện này chắc vui lắm đây!", -- Boom Berry Sapphire (Nổ khi thêm cà rốt vào)

            -- Bí quyết nấu nồi

        DARK_RUINCOLATE = "Đó là hương vị của thế giới bóng tối!", -- Sôcôla đen
        WHITE_RUINCOLATE = "Nó vẫn mượt mà hơn cả tâm hồn.", -- Sôcôla trắng
        RUINCOLATE = "Nó chủ yếu là khối yêu thích.", -- Plain Chocolate
        RUIN_SCHOKAKOLA = "Con người có cố gắng ăn những thực vật mà họ chưa từng thấy trước đây không?", -- Chocacola

        BUCKET_STEEL_EMPTY =
        {
            EMPTY = "Nó có vị như sắt trong nước phải không?", -- Xô thép rỗng
            FULL = "Nước cho con người.", -- Nước mưa sạch được đổ đầy
            FULL_ICE = "Một thế giới quá lạnh để sống mặc dù nó trông giống như nước.", -- Nước mưa đã đóng băng
            DIRTY = "Đó là nước bẩn.", -- Nước mưa đã trở nên bẩn
            DIRTY_ICE = "Dường như đã trải qua mọi biến động trên thế giới.", -- Nước mưa bẩn đã đóng băng
        },

        BUCKET_WOODIE_EMPTY =
        {
            EMPTY = "Nó gần như chỉ là một cái thùng.", -- Cái xô gỗ rỗng của Woodie
            FULL = "Nước cho con người.", -- Nước mưa sạch được đổ đầy
            FULL_ICE = "Một thế giới quá lạnh để sống mặc dù nó trông giống như nước.", -- Nước mưa đã đóng băng
            DIRTY = "Đó là nước bẩn.", -- Nước mưa đã trở nên bẩn
            DIRTY_ICE = "Dường như đã trải qua mọi biến động trên thế giới.", -- Nước mưa bẩn đã đóng băng
        },

        BUCKET_DRIFTWOOD_EMPTY =
        {
            EMPTY = "Hyuyu, Không biết mảnh vụn có dính vào tay tôi khi dùng thứ này để múc nước không!", -- Thùng gỗ rỗng
            FULL = "Nước cho con người.", -- Nước mưa sạch được đổ đầy
            FULL_ICE = "Một thế giới quá lạnh để sống mặc dù nó trông giống như nước.", -- Nước mưa đã đóng băng
            DIRTY = "Đó là nước bẩn.", -- Nước mưa đã trở nên bẩn
            DIRTY_ICE = "Dường như đã trải qua mọi biến động trên thế giới.", -- Nước mưa bẩn đã đóng băng
        },

        BUCKET_EMPTY =
        {
            EMPTY = "Xô đựng nước.", -- Xô gỗ rỗng
            FULL = "Nước cho con người.", -- Nước mưa sạch được đổ đầy
            FULL_ICE = "Một thế giới quá lạnh để sống mặc dù nó trông giống như nước.", -- Nước mưa đã đóng băng
            DIRTY = "Đó là nước bẩn.", -- Nước mưa đã trở nên bẩn
            DIRTY_ICE = "Dường như đã trải qua mọi biến động trên thế giới.", -- Nước mưa bẩn đã đóng băng
        },

        DESALINATOR =
        {
            EMPTY = "Nó muốn nước mặn, không giống con người.", -- Máy khử muối không có nước
            PURIFY_LONG = "Sẽ mất khá nhiều thời gian.", -- Còn nhiều thời gian để thanh lọc
            PURIFY_SHORT = "Sắp xong rồi!", -- Quá trình thanh lọc sắp hoàn tất
            HASWATER = "Có vẻ như cuối cùng cũng xong!", -- Máy khử muối có nước sạch
            BURNT = "Chắc lại phải uống nước mặn nữa rồi. Hehehe!", -- Máy khử muối đã cháy rồi
            HASSALT = "Eek! Có mùi muối!", -- Máy khử muối vẫn còn muối
        },

        BARREL =
        {
            GENERIC = "Đầy nước thay vì linh hồn.", -- Kiểm tra thùng nước
            BURNT = "Nước cũng cháy à?", -- Thùng đã cháy
        },

        BREWERY =
        {
            EMPTY = "Tôi thực sự không hiểu được sở thích của con người.", -- Kiểm tra một nhà máy bia trống rỗng
            BURNT = "Hehehe, tôi không thể hiểu được cách nấu ăn của người phàm chút nào.", -- Nhà máy bia đã cháy
            FERMENTING_LONG = "Sẽ mất khá nhiều thời gian.", -- Còn nhiều thời gian cho quá trình lên men
            FERMENTING_SHORT = "Sắp xong rồi!", -- Quá trình lên men gần như đã hoàn tất
            DONE = "Tôi tưởng mình sẽ chết trong khi chờ đợi!", -- Nhà máy bia có đồ uống trong đó
        },

        CAMPKETTLE_ITEM = "Một cách để người phàm sống sót.", -- Kiểm tra vật phẩm ấm đun nước trong trại

        CAMPKETTLE =
        {
            GENERIC = "Không thể tạo ra thứ gì đó từ con số không!", -- Kiểm tra một chiếc ấm cắm trại không có nước
            BOILING_LONG = "Sẽ mất khá nhiều thời gian.", -- Nước đã bắt đầu sôi
            BOILING_SHORT = "Tôi thực sự mong chờ điều này!", -- Nước sôi gần xong
            DONE = "Bây giờ tôi có nên thử một ít nước không?", -- Có được nước sạch
            STOP = "Yếu, yếu, yếu!", -- Nước bẩn không sôi vì không có lửa
        },

        CAMPDESALINATOR_ITEM = "Một công cụ đơn giản để loại bỏ muối.", -- Kiểm tra vật dụng khử muối trong trại

        CAMPDESALINATOR =
        {
            GENERIC = "Nó muốn nước mặn, không giống con người.", -- Máy khử muối của trại không có nước
            BOILING_LONG = "Sẽ mất khá nhiều thời gian.", -- Nước đã bắt đầu sôi
            BOILING_SHORT = "Tôi sắp hoàn tất!", -- Việc loại bỏ muối gần như đã hoàn tất
            DONE = "Bây giờ tôi có thể uống được rồi!", -- Có được nước sạch
            STOP = "Yếu, yếu, yếu!", -- Việc loại bỏ muối không xảy ra vì không có lửa
        },

        KETTLE =
        {
            EMPTY = "Nó hoàn toàn trống rỗng.", -- Kiểm tra một cái ấm rỗng
            BURNT = "Tôi chẳng hiểu gì về ẩm thực trần tục cả.", -- Ấm đun nước đã cháy rồi
            BOILING_LONG = "Sẽ mất khá nhiều thời gian.", -- Việc nấu đồ uống đã bắt đầu
            BOILING_SHORT = "Tôi thực sự mong chờ điều này!", -- Việc chuẩn bị đồ uống gần như đã hoàn tất
            DONE = "Bây giờ tôi nên thử chút nước nhé?", -- Uống xong rồi
            PURIFY_LONG = "Sẽ mất khá nhiều thời gian.", -- Quá trình lọc nước bẩn đã bắt đầu
            PURIFY_SHORT = "Tôi sắp xong rồi!", -- Nước bẩn gần như đã được lọc sạch
            HASWATER = "Tôi đoán là tôi cần phải đun sôi lại. Có rất nhiều yêu cầu!", -- Ấm đun nước có nước sạch
            MELT_LONG = "Sẽ mất khá nhiều thời gian.", -- Nước đá tan đã bắt đầu
            MELT_SHORT = "Nó gần tan rồi!", -- Nước đá gần tan rồi
        },

        PORTABLEKETTLE_ITEM =
        {
            GENERIC = "Tôi có thể đun sôi linh hồn trong đó không?", -- Kiểm tra vật phẩm ấm đun nước di động
            EMPTY = "Nó hoàn toàn trống rỗng.", -- Kiểm tra một chiếc ấm di động được đặt trống
            BOILING_LONG = "Sẽ mất khá nhiều thời gian.", -- Việc nấu đồ uống đã bắt đầu
            BOILING_SHORT = "Tôi thực sự mong chờ điều này!", -- Việc chuẩn bị đồ uống gần như đã hoàn tất
            DONE = "Bây giờ tôi nên thử chút nước nhé?", -- Uống xong rồi
            PURIFY_LONG = "Sẽ mất khá nhiều thời gian.", -- Quá trình lọc nước bẩn đã bắt đầu
            PURIFY_SHORT = "Tôi sắp xong rồi!", -- Nước bẩn gần như đã được lọc sạch
            HASWATER = "Tôi đoán là tôi cần phải đun sôi lại. Có rất nhiều yêu cầu!", -- Đặt ấm đun nước di động có nước sạch
            MELT_LONG = "Sẽ mất khá nhiều thời gian.", -- Nước đá tan đã bắt đầu
            MELT_SHORT = "Nó gần tan rồi!", -- Nước đá gần tan rồi
        },

        DISTILLERS =
        {
            EMPTY = "Chà, chúng ta uống chút rượu nhé?", -- Kiểm tra một máy chưng cất rỗng
            DISTILLTING_LONG = "Sẽ mất khá nhiều thời gian.", -- Quá trình chưng cất mất nhiều thời gian
            DISTILLING_SHORT = "Đã quá lâu!", -- Quá trình chưng cất gần như đã hoàn tất
            DONE = "Tôi tưởng cổ họng mình sẽ khô mất!", -- Máy chưng cất có đồ uống trong đó
        },

        WELL_WATERPUMP = {
            HIGH_PRESSURE = "Nó gây ra tiếng ồn khá lớn!", -- Áp suất tối đa
            MIDDLE_PRESSURE = "Âm thanh đã yếu đi một chút.", -- Áp suất trung bình
            LOW_PRESSURE = "Có vẻ như nó sắp tắt.", -- Hầu như không có áp lực
            RECHARG_PRESSURE = "Tôi đoán là tôi cần phải sạc lại!", -- Không có áp lực (không thể sử dụng cho đến khi áp suất đạt mức tối đa)
        },

        WELL_SPRINKLER =
        {
            LOWFUEL = "Có vẻ như nó cần nhiều nhiên liệu hơn.", -- Kiểm tra gần như không có nhiên liệu
            ON = "Buổi trình diễn đài phun nước!", -- Nó đang hoạt động
            OFF = "Nó không hoạt động, chỉ đang nghỉ ngơi.", -- Kiểm tra khi không hoạt động
        },
    }
}