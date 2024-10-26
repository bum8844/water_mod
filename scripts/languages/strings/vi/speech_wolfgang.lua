return {
    ACTIONFAIL =
    {
        GIVE =
        {
            WELL_NOTEMPTY = "Không còn chỗ cho người khác.", -- Cố gắng đổ một thùng đầy vào giếng
            WELL_BUSY = "Tôi hết dây rồi!", -- Đang cố gắng đưa một xô nước vào giếng
        }
    },

    ANNOUNCE_DRUNK = "Ugh, yếu hơn rượu của Wolfgang...", -- Trở nên say xỉn

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

    ANNOUNCE_DRUNK_END = "Wolfgang cảm thấy khỏe hơn rồi.", -- Tỉnh táo vì rượu (nôn nao)
    ANNOUNCE_DRUNK_IMMUNITY = "Ha! Rượu chẳng là gì đối với Wolfgang hùng mạnh!", -- Trạng thái miễn nhiễm rượu mạnh mẽ
    ANNOUNCE_NOTCHARGE = "Wolfgang phải cung cấp năng lượng để sạc Dê!", -- Cố gắng vắt sữa Dê mà không cần thanh tích điện
    ANNOUNCE_NOTHIRSTSLEEP = "Wolfgang khát quá không ngủ được...", -- Cố gắng ngủ vào ban đêm mà ít khát
    ANNOUNCE_NOTHIRSTSIESTA = "Wolfgang cần uống nước trước khi ngủ trưa...", -- Cố gắng ngủ vào ban ngày với tình trạng ít khát
    ANNOUNCE_SLEEP_END = "Wolfgang mạnh hơn rượu nhỏ!", -- Thức dậy sau khi ngủ và tỉnh táo vì rượu
    ANNOUNCE_THIRST = "Cơ bắp săn chắc đang khô dần...", -- Khát nước quá mức

    ANNOUNCE_CAFFINE_BUFF_START = "Wolfgang chạy như sói!", -- Bắt đầu sử dụng caffeine
    ANNOUNCE_CAFFINE_BUFF_STOP = "Đã đến lúc Wolfgang tập luyện kỵ khí.", -- Kết thúc hoạt động kích thích caffeine

    ANNOUNCE_CURE_WATERBORNE = "Wolfgang cảm thấy nhẹ nhõm.", -- Thông báo khi chữa bệnh qua đường nước bằng một vật phẩm

    ANNOUNCE_DCAPACITY_CRITICAL = "Wolfgang nên ngừng uống rượu...", -- Sắp say
    ANNOUNCE_DCAPACITY_HALF = "Wolfgang cảm thấy ấm hơn một chút...", -- Bắt đầu say

        DESCRIBE =
        {
            BOILBOOK = "Hướng dẫn pha chế đồ uống!",

            WATER_CLEAN_ICE = "Nước uống của Wolfgang bị đóng băng...", -- Đá sạch
            WATER_DIRTY_ICE = "Đá này không phù hợp để uống.", -- Đá bẩn

            SPICE_CAFFEINPEPPER = "Hmm... Mùi thơm quá...", -- Gia vị hạt tiêu caffein

            WELL_KIT = "Wolfgang sẽ xây giếng cho bạn bè!", -- Well kit
            WELL_SPRINKLER_KIT = "Một vòi phun nước tự động mạnh mẽ!", -- Bộ phun nước
            WELL_WATERPUMP_KIT = "Vật liệu cho giếng khỏe.", -- Bộ máy bơm nước bằng hơi nước
            WELL_BURYING_KIT = "Liệu Wolfgang có thể bịt kín những cái hố mà anh ta đã đào không?", -- Bộ dụng cụ chôn lỗ
            WELL_DRILLING = "Máy đang va chạm với mặt đất!", -- Khoan lỗ
            WELL_DRILLING_ITEM = "Đào xuống đất. Rất mạnh mẽ!", -- Vật phẩm khoan
            HOLE = "Wolfgang lấy nước từ lỗ này.", -- Lỗ giếng
            WELL = "Bây giờ Wolfgang có thể lấy nước từ giếng!", -- Vâng

            WX78MODULE_NONEDRUNK = "Robot là đồ ăn vặt phải không?", -- 78전용 묘듈

            -- Cây chế độ nước

            TEA_TREE = "Đó là một cái cây nhỏ, hãy cẩn thận đừng dẫm lên nó!", -- Cây trà
            DUG_TEA_TREE = "Cây nhỏ này mọc lên từ mặt đất.", -- Cây trà đào
            TEA_SEED = "Wolfgang có thể nghiền nát nó bằng tay!", -- Hạt cây trà
            TEA_SEED_COOKED = "Những hạt nhỏ này quá nhỏ để ăn.", -- Hạt cây trà đã nấu chín
            TEA_SEED_SAPLING = "Đó là một cây rất nhỏ!", -- Cây trà non
            TEALEAVES = "Những chiếc lá này có mùi thơm.", -- Lá trà
            TEALEAVES_DRIED = "Lá xanh chuyển sang màu nâu sau khi sấy.", -- Lá trà khô

            CAFFEINBERRY = "Điều này khác với những gì Wolfgang biết.", -- Bụi cà phê
            DUG_CAFFEINBERRY = "Lạnh lùng và cô đơn.", -- Đào bụi cà phê
            CAFFEINBERRY_BEAN = "Hmm... Mùi thơm quá.", -- Hạt cà phê thô
            CAFFEINBERRY_BEAN_COOKED = "Những hạt cà phê nhỏ này làm cho Wolfgang mạnh hơn!", -- Hạt cà phê nấu chín

            RUINCACAO_TREE = "Ugh... Wolfgang có linh cảm không tốt về việc này.", -- Cây Cacao
            DUG_RUINCACAO_TREE = "Đây là một cái cây khó ưa.", -- Đào cây cacao
            RUINCACAO_SEED = "Cái cây đáng sợ này vẫn còn nhỏ và yếu.", -- Vật phẩm hạt Cacao
            RUINCACAO_SEED_SAPLING = "Một cái cây nhỏ và đáng sợ sẽ sớm mọc lên.", -- Trồng cây non Cacao
            RUINCACAO = "Wolfgang không thể phá vỡ thứ này với sức mạnh khủng khiếp của mình.", -- Quả Cacao trước khi bẻ
            RUINCACAO_BEAN = "Quả cứng đã bị đánh bại.", -- Hạt Cacao sau khi vỡ
            RUINCACAO_BEAN_COOKED = "Mùi thơm ngon nhưng cũng thật đáng sợ...", -- Hạt cacao nấu chín

            -- Phụ gia rượu chưng cất

            ADDITIVE_SEED = "Nó có mùi sảng khoái.", -- Phụ gia thảo mộc (cây hồi, quả bách xù và họa tiết hình ngôi sao) để sản xuất rượu mùi
            ADDITIVE_PETALS = "Wolfgang nên sử dụng những bông hoa nhỏ này ở đâu?", -- Phụ gia thảo mộc, lá trà và cánh hoa để sản xuất rượu mùi
            ADDITIVE_NUT = "Wolfgang có thể dễ dàng nghiền nát thứ này.", -- Các chất phụ gia từ hạt, dừa, hạt cà phê và hạt cacao để sản xuất rượu mùi
            ADDITIVE_DAIRY = "Wolfgang không nên uống sữa?", -- Phụ gia sản phẩm sữa để sản xuất rượu mùi

            -- Đồ uống

            WATER_CLEAN = "Nước rất quan trọng cho cơ bắp khỏe mạnh!", -- Nước sạch
            WATER_DIRTY = "Uống thứ này sẽ khiến Wolfgang bị bệnh.", -- Nước bẩn
            WATER_SALTY = "Wolfgang không thích nước mặn!", -- Nước mặn

            GOOPYDRINK = "Có phải Wolfgang đã bỏ thứ gì lạ vào trong đó không?", -- Đồ uống không thành công (Khái niệm Wet Goop)

            -- Đồ uống ấm trà

            FRUITJUICE = "Đó là nước có trái cây.", -- Nước ép trái cây hỗn hợp
            BERRIES_JUICE = "Ngọt và đỏ.", -- Nước ép quả mọng
            POMEGRANATE_JUICE = "Có hạt nào trong đó không?", -- Nước ép lựu
            BANANA_JUICE = "Mát và ngon!", -- Nước chuối
            FIG_JUICE = "Được làm từ những quả to, ngọt.", -- Nước ép sung
            DRAGONJUICE = "Tại sao quả màu đỏ mà nước ép lại màu trắng?", -- Nước ép thanh long
            GLOWBERRYJUICE = "Wolfgang có thể uống nước phát sáng được không?", -- Nước ép Glowberry
            WATERMELON_JUICE = "Làm từ quả dưa hấu lớn.", -- Nước ép dưa hấu

            VEGGIE_TEA = "Nó có vị như cỏ và rất đắng!", -- Nước ép xanh
            CARROT_TEA = "Wolfgang cũng thích uống cà rốt!", -- Trà cà rốt
            CACTUS_TEA = "Không có gai nhọn phải không?", -- Trà xương rồng
            TOMATO_JUICE = "Thức uống tốt cho sức khỏe!", -- Nước ép cà chua
            LUMPY_TEA = "Wolfgang đun sôi các cơ của thực vật.", -- Trà rễ
            SEAWEED_SHAKE = "Uống thứ này sẽ không làm Wolfgang mạnh hơn.", -- Rong biển lắc

            GREENTEA = "Có mùi cỏ nồng nặc.", -- Trà xanh tươi
            BLACKTEA = "Wolfgang cho rằng trà đen có thể nguy hiểm...", -- Trà đen
            BLACKTEA_ICED = "Đó là một loại trà giải khát! Wolfgangthích nó.", -- Trà đen đá
            FUER = "Làm từ lá cây.", -- Fuer, trà lá, trà dương xỉ
            MIXFLOWER = "Có mùi thơm quá.", -- Trà cánh hoa hỗn hợp
            HIBISCUSTEA = "Nó khiến Wolfgang xúc động.", -- Trà dâm bụt
            CACTUSFLOWER_TEA = "Trà làm từ hoa màu đỏ.", -- Trà hoa xương rồng
            LOTUSTEA = "Wolfgang đã từng nhìn thấy trà hồng chưa?", -- Trà sen
            SUSHIBISCUS = "Ngay cả cơ bắp của Wolfgang cũng run rẩy...", -- Trà tự sát
            MOON_BLOSSOM_TEA = "Trà thơm và đậm đặc làm cho tinh thần mạnh mẽ hơn!", -- Trà hoa dương quang

            CAFFEINBERRY_JUICE = "Tuy đắng nhưng khiến Wolfgang mạnh mẽ hơn!", -- Cà phê đen
            TOFFEE_LATTE = "Có vị hạt dẻ.", -- Toffeenut latte
            RUINCHA_LATTE = "Nó ngọt ngào và làm cho Wolfgang mạnh hơn!", -- Mocha latte (cà phê + ca cao)

            HOTRUINCOLATE = "Đó là sô cô la ngọt ngào và ấm áp.", -- Sôcôla nóng
            RUINCOLATE_SMOOTHIE = "Đó là đồ uống sô cô la lạnh.", -- Sinh tố sô cô la (lạnh)
            RUINXOCOLATL = "Thức uống sôcôla rất đắng!", -- Chocotlatl (cay)
            TEA_RUINCOLATE_LATTE = "Thức uống có vị cỏ với hương sô-cô-la.", -- Matcha latte

            MULLED = "Wolfgang không ngửi được mùi rượu.", -- Bancha
            BUTTERBEER = "Là bia nhưng ngọt ngào!", -- Bia bơ trong bộ truyện Harry Potter

            -- Hợp tác Ấm trà Đồ uống

            COCONUT_JUICE = "Trái cây dai bây giờ là đồ uống!", -- Nước cốt dừa đắm tàu
            RAINBOW_SHAKE = "Một thức uống thạch xinh xắn!", -- Thạch Cầu Vồng Shipwrecked
            QUARTZ_SHAKE = "Wolfgang bối rối. Đây có phải là thứ cá uống không?", -- Nước lắc cá kết tinh Shipwrecked
            CHERRY_ROSEBERRIES_TEA = "Có mùi như hoa hồng đáng yêu.", -- Trà Tầm Xuân Rừng Anh Đào
            CHERRY_HONEY_TEA = "Cực kỳ ngọt ngào!", -- Trà mật ong hoa anh đào rừng anh đào
            SWEET_RICE_DRINK = "Thật ngọt dù chỉ có cơm!", -- Vita Hybrids Sikhye
            ANANAS_JUICE = "Nước trái cây cực kỳ sảng khoái.", -- Nước ép dứa của Regal
            ORANGE_JUICE = "chua, ngọt và cam.", -- Gói thực phẩm khác Nước cam
            STRAWBERRY_SMOOTHIE = "Nó chứa đầy hạt.", -- Gói thực phẩm khác Sinh tố dâu tây
            STRAWBERRY_MILK_SMOOTHIE = "Mịn màng và thơm ngon.", -- Thêm gói thực phẩm Sinh tố sữa dâu

            -- Đồ uống nhà máy bia

            SPOILED_DRINK = "Ugh, mùi kinh quá!", -- Đồ uống bị hỏng

            -- Nhà máy bia Soda

            SODA = "Có ga!", -- Nước có ga
            FRUITSODA = "Có ga và ngọt ngào.", -- Soda trái cây
            LEMONLIMESODA = "Cực kỳ ngọt ngào!", -- Soda chanh chanh (Phiên bản cao cấp của Soda trái cây)
            COLA = "Thức uống ngọt và đen.", -- Cola
            COLAQUANTUM = "Thức uống cực mạnh! Wolfgang rất thích nó!", -- Cola Quantum
            LUMPY_BEER = "Nó có hương vị độc đáo và sảng khoái.", -- Root Beer (Không cồn)

            -- Rượu mạnh nhà máy bia

            CORN_BEER = "Làm từ ngô.", -- Bia ngô
            MADHU = "Được làm từ mật ong giận dữ.", -- Madhu
            WINE = "Thức uống cho những dịp đặc biệt.", -- Rượu vang (Được làm từ quả mọng)
            NOBLEWINE = "Làm từ trái cây rang!", -- Noble Wine (Được làm từ trái cây rang)
            SPARKLINGWINE = "Sủi bọt và có màu vàng!", -- Rượu vang sủi
            GLOWBERRYWINE = "Nó lấp lánh.", -- Glow Berry Wine
            KUMIS = "Làm sữa thành rượu.", -- Kumis (Sữa ngựa lên men)
            LUMPY_WINE = "Làm từ rau củ.", -- Sake (Làm từ khoai tây, khoai lang, v.v.)
            PULQUE = "Trở thành thức uống lê gai.", -- Pulque (Agave)
            RUINCACAO_WINE = "Bạn có thể làm rượu từ sôcôla được không?", -- Rượu Cacao

            -- Hợp tác Soda

            CHERRY_DOCTOR_COLA = "Có vị như kẹo!", -- Cherry Forest Doctor Pepper (Doctor Cherry)
            ANANASSODA = "chua và sảng khoái.", -- Dứa có ga (Orangina)
            ORANGESODA = "Ngọt và có ga.", -- Cam có ga (Fanta)
            STRAWBERRYSODA = "Nhiều hạt như bong bóng!", -- Dâu có ga (Dâu xứ Welch)

            -- Tinh thần hợp tác

            AUROBOW = "Một thức uống thạch xinh xắn.", -- Aurobouros bị đắm tàu (Rượu sứa cầu vồng)
            COCONUT_WINE = "Nó đã trở thành đồ uống từ dừa.", -- Rượu dừa đắm tàu
            CHERRY_BLOOM_MADHU = "Ngọt vô cùng!", -- Rượu mật ong hoa anh đào
            GIANT_BLUEBERRY_WINE = "Liệu bụng Wolfgang có nổ tung không?", -- Vita Hybrids Boom! Berry Sapphire (Nổ khi đánh lửa)
            RICE_WINE = "Nó có màu trắng như sữa.", -- Vita Koalefant Soju
            WHEAT_BEER = "Giống như Bavaria!", -- Hip of Food Wheat Beer
            PALE_BEER = "Tái nhợt như làn da của một con ma nhỏ.", -- Regiom Pale Ale (Bia làm từ Thịt quái vật)

            -- Mô tả rượu chưng cất

            DISINFECTANT = "Dùng để làm sạch.", -- Chất khử trùng
            CORN_WHISKEY = "Nó được làm theo cách của Scotland.", -- Corn Whisky
            LUMPY_VODKA = "Vodka! Nó nổi tiếng ở Quê hương tôi!", -- Vodka Lumpy
            TEQUILA = "Uống ngon nhất dưới ánh mặt trời!", -- Tequila
            MADHU_RUM = "Khỉ biển có thể thích điều này.", -- Madhu Rum
            BERRY_BRANDY = "Đó là một loại rượu có hương vị tuyệt vời.", -- Berry Brandy
            AREUHI = "Nó được làm bằng sữa sôi.", -- Rượu chưng cất kem Kremez Areuhi

            -- Rượu chưng cất dành riêng cho Warly

            BERRY_GIN = "Tốt nhất khi trộn với thuốc bổ!", -- Gin
            GLOWBERRY_GIN = "Chưa bao giờ nhìn thấy rượu mạnh phát sáng!", -- Glow Berry Gin
            ABSINTHE = "Wow... cứ như những linh hồn cổ tích xanh vậy.", -- Absinthe
            TEA_LUMPY_VODKA = "Đó là một loại vodka lạ có vị cỏ!", -- Vodka Trà Xanh
            PETALS_BERRY_BRANDY = "Nó có mùi thơm.", -- Rượu Brandy Cánh Hoa Hồng
            KAHLUA = "Được làm bằng đậu, đó là tinh thần.", -- Coffee Liqueur Kahlua
            NUT_CORN_WHISKEY = "Có mùi hạt dẻ.", -- Nutty Corn Whiskey
            RUINCACAO_CREAM_LIQUEUR = "Họ đã biến sô cô la thành rượu mạnh phải không?", -- Rượu mùi kem Cacao của Bailey
            RUMCHATA = "Đó là một tinh thần kỳ lạ với sữa.", -- Rumchata (Rum và Horchata, một loại đồ uống làm từ sữa)

            -- Rượu chưng cất hợp tác

            MOONWAY = "Được làm bằng cách đun sôi những viên thạch xinh xắn.", -- Tinh linh sứa cầu vồng
            ARRACK = "Rượu dừa được làm bằng cách đun sôi.", -- Arrack, phiên bản rượu dừa của Indonesia
            CHERRY_BLOOM_RUM = "Có một tinh thần ngọt ngào như vậy à?", -- Rượu mật ong anh đào với những cánh hoa anh đào bồng bềnh
            RICE_SPIRITS = "Được làm bằng rượu trắng.", -- Rượu gạo
            WHEAT_WHISKEY = "Wolfgang thích rượu whisky mạnh!", -- Whisky lúa mì
            PALE_WHISKEY = "Wolfgang biết đó là phong cách Mỹ.", -- Pale Malt Whiskey

            -- Tinh thần độc quyền của Warly

            NUT_COCONUT_BRANDY = "Thế giới rộng lớn! Có rất nhiều thứ để ăn trộm!", -- Hãy lấy những gì bạn có thể! Không trả lại gì cả! - Thuyền trưởng Jack Sparrow, Cướp biển vùng Caribe
            GIANT_BLUEBERRY_GIN = "Wolfgang cảm thấy như mình sắp nổ tung như một quả việt quất khổng lồ!", -- Boom Berry Sapphire (Carrot phát nổ)

            -- Mô tả cách nấu nồi

            DARK_RUINCOLATE = "Hmm, đắng quá!", -- Sôcôla đen
            WHITE_RUINCOLATE = "Nó chứa đầy chất béo.", -- Sôcôla trắng
            RUINCOLATE = "Wolfgang cũng thích đồ ngọt!", -- Sôcôla thường
            RUIN_SCHOKAKOLA = "Wolfgang đã thử điều này trước đây!", -- Schokakola

            BUCKET_STEEL_EMPTY =
            {
                EMPTY = "Cứng cáp như cơ bắp của Wolfgang!", -- Xô thép rỗng
                FULL = "Nước cho Wolfgang đã sẵn sàng!", -- Làm sạch nước mưa trong thùng thép
                FULL_ICE = "Nước đã đóng băng trong giá lạnh.", -- Nước mưa đã đóng băng trong thùng thép
                DIRTY = "Nước quý giá đã trở nên bẩn...", -- Nước mưa đã trở nên bẩn
                DIRTY_ICE = "Ồ không! Thật lãng phí!", -- Nước mưa bẩn đã đóng băng
            },

            BUCKET_WOODIE_EMPTY =
            {
                EMPTY = "Tinh tế và mạnh mẽ.", -- Xô gỗ rỗng
                FULL = "Nước cho Wolfgang đã sẵn sàng!", -- Làm sạch nước mưa trong xô gỗ
                FULL_ICE = "Nước đã đóng băng trong giá lạnh.", -- Nước mưa đã đóng băng trong thùng gỗ
                DIRTY = "Nước quý giá đã trở nên bẩn...", -- Nước mưa đã trở nên bẩn
                DIRTY_ICE = "Ồ không! Thật lãng phí!", -- Nước mưa bẩn đã đóng băng
            },

            BUCKET_DRIFTWOOD_EMPTY =
            {
                EMPTY = "Cái xô này nhẹ hơn nhiều nhưng lại khá chắc chắn đấy.", -- Thùng gỗ rỗng
                FULL = "Nước cho Wolfgang đã sẵn sàng!", -- Làm sạch nước mưa trong xô gỗ
                FULL_ICE = "Nước đã đóng băng trong giá lạnh.", -- Nước mưa đã đóng băng trong thùng gỗ
                DIRTY = "Nước quý giá đã trở nên bẩn...", -- Nước mưa đã trở nên bẩn
                DIRTY_ICE = "Ồ không! Thật lãng phí!", -- Nước mưa bẩn đã đóng băng
            },

            BUCKET_EMPTY =
            {
                EMPTY = "Ha! Một chiếc cốc dành cho Wolfgang hùng mạnh!", -- Thùng gỗ rỗng
                FULL = "Nước cho Wolfgang đã sẵn sàng!", -- Làm sạch nước mưa trong xô gỗ
                FULL_ICE = "Nước đã đóng băng trong giá lạnh.", -- Nước mưa đã đóng băng trong thùng gỗ
                DIRTY = "Nước quý giá đã trở nên bẩn...", -- Nước mưa đã trở nên bẩn
                DIRTY_ICE = "Ồ không! Thật lãng phí!", -- Nước mưa bẩn đã đóng băng
            },

            DESALINATOR =
            {
                EMPTY = "Không có nước mặn.", -- Không có nước trong máy khử muối
                PURIFY_LONG = "Vẫn còn nước mặn.", -- Quá trình thanh lọc đang được tiến hành, vẫn còn nhiều việc phải làm
                PURIFY_SHORT = "Sắp hoàn tất!", -- Quá trình thanh lọc gần như hoàn tất
                HASWATER = "Bây giờ Wolfgang có thể uống!", -- Nước sạch đã sẵn sàng trong máy khử muối
                BURNT = "Máy bị cháy, còn lại muối trắng.", -- Máy khử muối đã cháy
                HASSALT = "Có mùi mặn từ bên trong.", -- Muối vẫn còn bên trong máy khử muối
            },

            BARREL =
            {
                GENERIC = "Wolfgang chuẩn bị cho thời điểm khó khăn.", -- Kiểm tra thùng
                BURNT = "Có phải nước đã cháy hết không?", -- Thùng đã cháy
            },

            BREWERY =
            {
                EMPTY = "Biến nước thành đồ uống.", -- Kiểm tra một nhà máy bia trống
                BURNT = "Wolfgang không uống nữa được không?", -- Nhà máy bia đã cháy
                FERMENTING_LONG = "Sẽ mất nhiều thời gian.", -- Quá trình lên men sẽ mất một lúc
                FERMENTING_SHORT = "Sắp xong rồi!", -- Quá trình lên men gần hoàn tất
                DONE = "Cuối cùng cũng xong!", -- Nhà máy bia có chứa đồ uống
            },

            CAMPKETTLE_ITEM = "Tạo nước sạch bằng cái này!", -- Kiểm tra vật phẩm ấm đun nước cắm trại
            CAMPKETTLE =
            {
                GENERIC = "Chúng tôi cần nước sôi.", -- Kiểm tra một chiếc ấm cắm trại trống trên hố lửa
                BOILING_LONG = "Nước vẫn bẩn.", -- Bắt đầu đun sôi nước
                BOILING_SHORT = "Sắp xong rồi!", -- Nước gần sôi rồi
                DONE = "Bây giờ chúng ta có thể uống!", -- Nước sạch đã sẵn sàng trong ấm cắm trại
                STOP = "Lửa cần phải cố gắng nhiều hơn.", -- Không còn lửa để tiếp tục sôi
            },

            CAMPDESALINATOR_ITEM = "Bây giờ chúng ta có thể uống nước mặn!", -- Kiểm tra vật dụng khử muối trong trại
            CAMPDESALINATOR =
            {
                GENERIC = "Chúng ta cần đun sôi nước mặn.", -- Kiểm tra máy khử muối trong trại trống trên hố lửa
                BOILING_LONG = "Nước mặn vẫn còn.", -- Bắt đầu đun sôi nước mặn
                BOILING_SHORT = "Sắp xong rồi!", -- Nước mặn gần sôi rồi
                DONE = "Bây giờ chúng ta có thể uống!", -- Nước sạch đã sẵn sàng trong máy khử muối của trại
                STOP = "Lửa cần phải cố gắng nhiều hơn.", -- Không còn lửa để tiếp tục sôi
            },

            KETTLE =
            {
                EMPTY = "Ấm cần nước.", -- Ấm rỗng
                BURNT = "Có phải mọi thứ đều cháy, kể cả nước không?", -- Ấm đun nước đã cháy
                BOILING_LONG = "Cần thêm thời gian để đun sôi.", -- Bắt đầu nấu đồ uống
                BOILING_SHORT = "Sắp xong rồi!", -- Đồ uống gần như đã sẵn sàng
                DONE = "Đã đến giờ uống!", -- Đồ uống đã sẵn sàng
                PURIFY_LONG = "Nước vẫn bẩn.", -- Bắt đầu lọc nước bẩn
                PURIFY_SHORT = "Sắp xong rồi!", -- Nước gần như đã được lọc sạch
                HASWATER = "Bình đã đầy nước.", -- Nước sạch đã có sẵn trong bình
                MELT_LONG = "Cần thêm thời gian để tan chảy.", -- Bắt đầu tan băng
                MELT_SHORT = "Sắp xong rồi!", -- Băng gần tan rồi
            },

            PORTABLEKETTLE_ITEM =
            {
                GENERIC = "Wolfgang có thể mang nó đi khắp nơi!", -- Kiểm tra vật phẩm ấm đun nước di động
                EMPTY = "Ấm cần nước.", -- Kiểm tra ấm đun nước di động rỗng
                BOILING_LONG = "Cần thêm thời gian để đun sôi.", -- Bắt đầu nấu đồ uống
                BOILING_SHORT = "Sắp xong rồi!", -- Đồ uống gần như đã sẵn sàng
                DONE = "Đã đến giờ uống!", -- Đồ uống đã sẵn sàng
                PURIFY_LONG = "Nước vẫn bẩn.", -- Bắt đầu lọc nước bẩn
                PURIFY_SHORT = "Sắp xong rồi!", -- Nước gần như đã được lọc sạch
                HASWATER = "Bình đun đã đầy nước.", -- Nước sạch đã sẵn sàng trong ấm di động
                MELT_LONG = "Cần thêm thời gian để tan chảy.", -- Bắt đầu tan băng
                MELT_SHORT = "Sắp xong rồi!", -- Băng gần tan rồi
            },

            DISTILLERS =
            {
                EMPTY = "Một cỗ máy đáng sợ...", -- Kiểm tra một máy chưng cất rỗng
                DISTILLTING_LONG = "Sẽ mất một lúc.", -- Quá trình chưng cất sẽ mất một lúc
                DISTILLING_SHORT = "Sắp xong rồi!", -- Quá trình chưng cất gần hoàn tất
                DONE = "Cỗ máy đáng sợ đã hoàn thành công việc của nó!", -- Máy chưng cất có chứa đồ uống
            },

            WELL_WATERPUMP = {
                HIGH_PRESSURE = "Giếng hùng mạnh, giống như Wolfgang!", -- Áp lực nước trong giếng cao
                MIDDLE_PRESSURE = "Giếng vẫn đủ áp lực.", -- Áp lực nước trong giếng trung bình
                LOW_PRESSURE = "Giếng có vẻ yếu...", -- Áp lực nước trong giếng thấp
                RECHARG_PRESSURE = "Giếng đang tạm ngừng hoạt động phải không?", -- Không có áp lực nước, cần sạc lại (không thể đạt áp suất tối đa).
            },

            WELL_SPRINKLER =
            {
                LOWFUEL = "Vòi phun có vẻ yếu.", -- Tình trạng nhiên liệu thấp của vòi phun nước giếng
                ON = "Vòi phun đang làm việc chăm chỉ!", -- Sprinkler được bật
                OFF = "Vòi phun đang tạm nghỉ.", -- Sprinkler đã tắt
            },
        },
    }           