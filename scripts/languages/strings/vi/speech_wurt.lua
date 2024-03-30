return {
    ACTIONFAIL =
    {
        GIVE =
        {
            WELL_NOTEMPTY = "Đã có sẵn một cái xô rồi, baaah!", -- Đang cố gắng đưa một cái xô vào giếng nước
            WELL_BUSY = "Nó ở trong hố xô, baaah!", -- Cố gắng đưa một cái xô xuống giếng với một cái xô đầy
        }
    },

    ANNOUNCE_DRUNK = "Đầu tôi đau...Tôi cảm thấy chóng mặt, baaah...", -- Đang say
    ANNOUNCE_DRUNK_END = "Baaah! Bây giờ tôi cảm thấy tốt hơn một chút rồi.", -- Trở nên tỉnh táo (nôn nao)
    ANNOUNCE_DRUNK_IMMUNITY = "", -- Tạm thời. Dành riêng cho Wigfrid.
    ANNOUNCE_NOTCHARGE = "Không có sữa chảy ra!", -- Cố gắng vắt sữa một con dê Volt đã tích điện bằng một cái xô
    ANNOUNCE_NOTHIRSTSLEEP = "Tôi cần nước, sau đó tôi sẽ ngủ.", -- Cố gắng ngủ vào ban đêm với cơn khát
    ANNOUNCE_NOTHIRSTSIESTA = "Tôi cần nước, sau đó tôi sẽ chợp mắt một lát.", -- Cố gắng ngủ trưa trong ngày với cơn khát
    ANNOUNCE_SLEEP_END = "Baaah, tôi thấy khỏe hơn sau một giấc ngủ ngắn!", -- Thức dậy và hoàn toàn tỉnh táo sau giấc ngủ
    ANNOUNCE_THIRST = "Tôi cần uống nước!", -- Cảm thấy khát

    ANNOUNCE_CAFFINE_BUFF_START = "Tôi đã sẵn sàng chạy!", -- Bắt đầu sử dụng caffeine
    ANNOUNCE_CAFFINE_BUFF_STOP = "Tôi không muốn chạy nữa.", -- Kết thúc quá trình sử dụng caffeine

    ANNOUNCE_CURE_WATERBORNE = "Bây giờ tôi cảm thấy khá hơn một chút rồi, baaah.", -- Chữa bệnh lây qua đường nước bằng một vật phẩm

    ANNOUNCE_DCAPACITY_CRITICAL = "Baaah, tôi cảm thấy chóng mặt!", -- Sắp say
    ANNOUNCE_DCAPACITY_HALF = "Mặt tôi đỏ bừng, baaah!", -- Bắt đầu say

        DESCRIBE =
        {
            BOILBOOK = "Cuốn sách đầy đủ các công thức pha chế đồ uống!", -- Sách công thức pha chế đồ uống

            WATER_CLEAN_ICE = "Brrr, lạnh quá!", -- Nước đá sạch
            WATER_DIRTY_ICE = "Brrr, nước đóng băng!", -- Nước đá bẩn

            SPICE_CAFFEINPEPPER = "Có mùi cay!", -- Gia vị: Caffeinpepper

            WELL_KIT = "Tôi chưa bao giờ thấy thịt bò làm món gì như thế này.", -- Well kit
            WELL_SPRINKLER_KIT = "Chỉ cần nhấn một lần thôi, baaah!", -- Bộ phun nước
            WELL_WATERPUMP_KIT = "Có vẻ khó làm nhỉ, baaah.", -- Bộ máy bơm nước hơi nước
            WELL_BURYING_KIT = " Bịt kín lỗ trên mặt đất!", -- Bộ chôn lỗ
            WELL_DRILLING = "Khoan lỗ trên mặt đất, baaah!", -- Khoan lỗ trên mặt đất
            WELL_DRILLING_ITEM = "Tại sao phải khoan lỗ trên mặt đất?", -- Mục khoan
            HOLE = "Tôi có thể nghe thấy tiếng nước.", -- Lỗ giếng
            WELL = "Bò uống từ những cái lỗ nhẵn này, tại sao vậy?", -- Vâng

            WX78MODULE_NONEDRUNK = "Giòn.", -- 78전용 묘듈

            -- Cây chế độ nước

            TEA_TREE = "Lá có mùi thơm!", -- Cây trà
            DUG_TEA_TREE = "Đi đâu đó đi, baaah.", -- Đào cây trà
            TEA_SEED = "Có rất nhiều lá trên hạt cây này!", -- Hạt cây trà
            TEA_SEED_COOKED = "Không còn ngon nữa...", -- Hạt cây chè đã nấu chín
            TEA_SEED_SAPLING = "Mọc lớn!", -- Cây chè non
            TEALEAVES = "Lá trà thơm, baaah.", -- Lá trà
            TEALEAVES_DRIED = "Mùi thơm thật tuyệt vời!", -- Lá trà khô

            CAFFEINBERRY = "Một bữa ăn nhẹ được tiết lộ!", -- Bụi Caffeinberry
            DUG_CAFFEINBERRY = "Bạn sẽ tìm được một nơi tốt.", -- Đào bụi cây caffeinberry
            CAFFEINBERRY_BEAN = "Một món ăn nhẹ ngon tuyệt!", -- Hạt Caffeinberry
            CAFFEINBERRY_BEAN_COOKED = "Nó không còn ngon nữa.", -- Đậu caffein nấu chín

            RUINCACAO_TREE = "Quả đen tự nó không ngon.", -- Cây Ruincacao
            DUG_RUINCACAO_TREE = "Bạn sẽ tìm được một nơi tốt.", -- Đào cây cacao đổ nát
            RUINCACAO_SEED = "Ewww, baaah.", -- Vật phẩm hạt giống Ruincacao
            RUINCACAO_SEED_SAPLING = "Nó quá nhỏ để kết trái.", -- Cây non Ruincacao từ hạt
            RUINCACAO = "Ôi! Khó quá!", -- Quả Ruincacao trước khi đập vỡ
            RUINCACAO_BEAN = "Nó có nhiều dầu lắm, baaah.", -- Đậu Ruincacao sau khi đập vỡ
            RUINCACAO_BEAN_COOKED = "Chưa phải là sôcôla đâu!", -- Đậu cacao nấu chín

            -- Phụ gia chưng cất

            ADDITIVE_SEED = "Bạn không định trồng nó xuống đất à?", -- Hạt giống thảo mộc (Hồi, Juniper Berry, Star Motif) cho nhà máy chưng cất
            ADDITIVE_PETALS = "Tôi đã thu thập được rất nhiều cánh hoa.", -- Phụ gia cánh hoa, thảo mộc, trà cho nhà máy chưng cất
            ADDITIVE_NUT = "Bạn sẽ không ăn món ăn nhẹ này à?", -- Phụ gia hạt (Birchnut, Coconut, Coffee Bean, Cacao Bean) cho nhà máy chưng cất
            ADDITIVE_DAIRY = "Trắng như nền đất nhà chúng ta!", -- Phụ gia sữa cho nhà máy chưng cất

            -- Đồ uống

            WATER_CLEAN = "Nước không có mùi gì cả!", -- Nước sạch
            WATER_DIRTY = "Giống như nước ao nhà mình!", -- Nước bẩn
            WATER_SALTY = "Giống như nước trong ao lớn!", -- Nước mặn

            GOOPYDRINK = "Đây có phải là nước ao nhà chúng ta không?", -- Đồ uống không thành công (Khái niệm đun sôi nước)

            -- Ấm đun nước uống

            FRUITJUICE = "Nó có hương vị của nhiều loại trái cây khác nhau!", -- Nước ép trái cây hỗn hợp
            BERRIES_JUICE = "Nước ép từ bụi quả mọng!", -- Nước ép quả mọng
            POMEGRANATE_JUICE = "Cùi trái cây màu đỏ dai, baaah!", -- Nước ép lựu
            BANANA_JUICE = "Ngay cả khi trời ấm, nước ép trái cây vẫn ngon!", -- Nước chuối
            FIG_JUICE = "Hmm, nó dai và ăn rất ngon!", -- Nước ép sung
            DRAGONJUICE = "Hơi nhạt nhẽo, baaah.", -- Nước ép thanh long
            GLOWBERRYJUICE = "Đó là nước ép tỏa sáng!!", -- Nước ép Glowberry
            WATERMELON_JUICE = "Dưa hấu ngon ngọt!", -- Nước ép dưa hấu

            VEGGIE_TEA = "Hmm, tôi thích nó!", -- Nước ép rau củ
            CARROT_TEA = "Giờ nó còn ngon hơn nữa!", -- Trà cà rốt
            CACTUS_TEA = "Không có gai? Tốt!", -- Trà xương rồng
            TOMATO_JUICE = "Nước ép cà chua!", -- Nước ép cà chua
            LUMPY_TEA = "Tôi thích nước rau củ!", -- Trà rễ
            SEAWEED_SHAKE = "Tôi cũng thích những thứ nhầy nhụa!", -- Rong biển lắc

            GREENTEA = "Có mùi như nước!", -- Lá trà tươi
            BLACKTEA = "Nước nóng có mùi thơm quá!", -- Trà đen
            BLACKTEA_ICED = "Nước lạnh có mùi thơm quá!", -- Trà đen trà đá
            FUER = "Cây trong hang chuyển sang màu đỏ, baaah!", -- Boik cha, Yip cha, Guk cha
            MIXFLOWER = "Những bông hoa xấu xí đã rơi vào đó!", -- Cánh hoa hỗn hợp
            HIBISCUSTEA = "Hehe, tôi luộc hoa đỏ!", -- Trà dâm bụt
            CACTUSFLOWER_TEA = "Có những bông hoa xấu xí cắm vào đó và nó thật ngọt ngào, baaah!", -- Cacttrà hoa chúng tôi
            LOTUSTEA = "Da mịn như nước hoa này, không biết nữa, baaah!", -- Trà sen
            SUSHIBISCUS = "Có những bông hoa rất xấu xí trong nước.", -- Sushi cha
            MOON_BLOSSOM_TEA = "Mùi này lạ quá.", -- Trà hoa mặt trăng

            CAFFEINBERRY_JUICE = "Ôi...không ngon chút nào.", -- Cà phê đen
            TOFFEE_LATTE = "Mmm! Thật hấp dẫn và ngọt ngào!", -- Toffee Nut Latte
            RUINCHA_LATTE = "Chắc chắn rồi. Hoàn hảo. Ngon quá!", -- Mocha Latte (Cà phê + Sôcôla)

            HOTRUINCOLATE = "Nó rất. Ngon. Và ấm áp!", -- Sôcôla nóng
            RUINCOLATE_SMOOTHIE = "Brrr, nó làm tôi đau đầu quá!", -- Sinh Tố Sôcôla (Lạnh)
            RUINXOCOLATL = "Kachunk! Đắng quá!", -- Chocolatl (Đắng)
            TEA_RUINCOLATE_LATTE = "Có mùi cỏ và tôi đang uống nó!", -- Matcha Latte

            MULLED = "Mmm, trời ấm và làm tôi buồn ngủ!", -- Banoosh
            BUTTERBEER = "Nó không có vị như côn trùng và rất ngọt!", -- Butterbeer (loạt phim Harry Potter)

            -- Đồ uống ấm đun nước cộng tác

            COCONUT_JUICE = "Nó đầy hương trái cây, húp xúp!", -- Nước cốt dừa đắm tàu
            RAINBOW_SHAKE = "Glooorp!!", -- Thạch Cầu Vồng bị đắm tàu
            QUARTZ_SHAKE = "Thật khủng khiếp!!", -- Thạch thạch anh bị đắm tàu
            CHERRY_ROSEBERRIES_TEA = "Trái cây xấu, không có tóc?", -- Trà tầm xuân anh đào
            CHERRY_HONEY_TEA = "Uống nước rám nắng mật ong làm ấm cơ thể!", -- Trà mật ong hoa anh đào rừng anh đào
            SWEET_RICE_DRINK = "Tiên cá không tạo ra rượu từ món ăn vặt nước này.", -- Nước Cơm Ngọt Vitacorp
            PINEANANAS_JUICE = "Trái cây chua trong nước ngọt, húp xì xụp.", -- Nước ép dứa Legion
            ORANGE_JUICE = "Ngon ngọt và sảng khoái, húp xì xụp!", -- Gói Thực phẩm Moore Nước Cam
            STRAWBERRY_SMOOTHIE = "Hoan hô, tôi đã nghiền nát nước ép đỏ đông lạnh!", -- Sinh tố dâu tây gói thực phẩm Moore
            STRAWBERRY_MILK_SMOOTHIE = "Hoan hô, mịn thật!", -- Sinh Tố Sữa Dâu Moore Food Pack

            -- Đồ uống chưng cất

            SPOILED_DRINK = "Uống thứ này có được không khi nó hư?", -- Đồ uống hư

            -- Máy làm soda

            SODA = "Nước thật kỳ lạ, sủi bọt.", -- Nước có ga
            FRUITSODA = "Nó có vị trái cây nhưng sủi bọt rất khó chịu.", -- Fruit Soda
            LEMONLIMESODA = "Vị ngọt và ngon nhưng lạ quá!", -- Lemon Lime Soda (cao cấp hơn Fruit Soda)
            COLA = "Chà, ngon quá, húp úp!", -- Cola
            COLAQUANTUM = "Nó lấp lánh và phát ra âm thanh, xì xụp!", -- Cola Quantum
            LUMPY_BEER = "Nó có vị thuốc nhưng ngọt và sủi bọt.", -- Root Beer (không cồn)

            -- Đồ uống nhà máy bia

            CORN_BEER = "Nó có bọt ở đầu, húp xúp.", -- Bia ngô
            MADHU = "Những người phụ nữ Viking đang tìm kiếm điều này một cách mãnh liệt.", -- Mead
            WINE = "Súp... màu đỏ, nhưng không ngọt.", -- Rượu (Ủ quả mọng)
            NOBLEWINE = "Nó có màu nâu nhạt và không ngọt lắm, nhưng có ngon không?", -- Noble Wine (Ủ dâu rang)
            SPARKLINGWINE = "Wicker đã cảnh báo không được lắc nó.", -- Sparkling Wine
            GLOWBERRYWINE = "Hãy cho tôi nước trái cây thay vì rượu hoa quả.", -- Glow Berry Wine
            KUMIS = "Sữa chua này bị hỏng à?", -- Kumis (Sữa dê núi)
            LUMPY_WINE = "Nước rau củ này có mùi khó chịu.", -- Sake (Ủ rau củ)
            PULQUE = "Tôi vắt cây có gai và làm 'baro'!", -- Pulque (Mật hoa Agave)
            RUINCACAO_WINE = "Quả đen đã trở nên có hương vị lạ hơn.", -- Rượu Cacao

            -- Nước ngọt hợp tác

            CHERRY_DOCTOR_COLA = "Nước đen sủi bọt và có vị như nước trái cây màu đỏ!", -- Cherry Forest Dr. Pepper (Dr. Cherry)
            PINEANANASSODA = "Nước hoa quả chua sủi bọt!", -- Dứa có ga (Oran-C)
            ORANGESODA = "Suỵt, thật sảng khoái và mát mẻ!", -- Cam có ga (Fanta)
            STRAWBERRYSODA = "Đó là một loại nước hoa quả màu đỏ sủi bọt, sền sệt.", -- Dâu có ga (Dâu xứ Wales)

            -- Đồ uống hợp tác của nhà máy bia

            AUROBOW = "Cá đẹp... tại sao?", -- Thạch cầu vồng bị đắm tàu
            COCONUT_WINE = "Có mùi như nước trái cây trộn với rượu.", -- Rượu dừa đắm tàu
            CHERRY_BLOOM_MADHU = "Bạn có làm rượu bằng mật ong hoa anh đào đẹp không?", -- Cherry Forest Cherry Blossom Honey Mead
            GIANT_BLUEBERRY_WINE = "Nó phát nổ khi bạn đốt cháy.", -- Vitacorp Boom! Berry Sapphire (Nổ khi đốt)
            RICE_WINE = "Nước ăn vặt biến thành rượu...", -- Vitacorp Makgeolli (Rượu gạo)
            WHEAT_BEER = "Nó có bọt, sủi bọt.", -- Hip of Food Wheat Beer
            PALE_BEER = "Tôi chưa bao giờ thấy trái cây đầm lầy được sử dụng để làm rượu trước đây.", -- Legion Pale Ale (Sử dụng trái cây Monstrata để làm rượu)ake bia xanh nhạt)

            -- Rượu chưng cất

            DISINFECTANT = "Nước này lạnh và nhanh chóng biến mất.", -- Chất khử trùng
            CORN_WHISKEY = "Nó có mùi độc, húp xúp.", -- Corn Whisky
            LUMPY_VODKA = "Đây không phải là nước, úp úp!", -- Vodka
            TEQUILA = "Có mùi cây gai, hư à?", -- Tequila
            MADHU_RUM = "Có phải người cá trộn sinh tố với nước khi chúng bị đau bụng không?", -- Rum
            BERRY_BRANDY = "Trái cây ăn vặt của tôi đâu rồi, húp xì xụp?", -- Berry Brandy
            AREUHI = "Sữa đi đâu rồi?", -- Rượu chưng cất Kumis (Arhi)

            -- Rượu chưng cất độc quyền của Warly

            BERRY_GIN = "Nó có mùi thơm nồng hơn, sền sệt.", -- Gin
            GLOWBERRY_GIN = "Thật lấp lánh!", -- Glow Berry Gin
            ABSINTHE = "Nó có màu xanh như chất độc và có mùi lạ!", -- Absinthe
            TEA_LUMPY_VODKA = "Tôi không thể ăn lá thay vì cho vào rượu được sao?", -- Rượu mùi trà xanh
            PETALS_BERRY_BRANDY = "Mùi hoa xấu xí quá nồng, húp xì xụp.", -- Rose Scented Brandy
            KAHLUA = "Tôi không thể ăn snack đậu mà không trộn với rượu được sao, húp xì xụp..", -- Coffee Liqueur Kahlua
            NUT_CORN_WHISKEY = "Tôi ước gì họ đưa cho tôi hạt thay vì dùng chúng để làm rượu, húp xì xụp.", -- Nut Whiskey
            RUINCACAO_CREAM_LIQUEUR = "Chà... có mùi như đồ ăn nhẹ ngon tuyệt..", -- Rượu mùi kem Cacao Baileys
            RUMCHATA = "Tại sao phải trộn sữa với rượu khi đó không phải là nước?", -- Rumchata (Rum với Horchata, một loại đồ uống từ sữa)

            -- Rượu chưng cất hợp tác

            MOONWAY = "......", -- Rượu chưng cất Rainbow Jelly Mead
            ARRACK = "Merm, cho tôi nước trái cây nguyên chất, húp xì xụp.", -- Arrack (Caribbean Rum với dừa)
            CHERRY_BLOOM_RUM = "Những bông hoa xấu xí đang nhảy múa, húp xì xụp!", -- Rượu chưng cất rượu rum mật ong anh đào
            RICE_SPIRITS = "Trông giống nước nhưng có mùi độc!", -- Soju
            WHEAT_WHISKEY = "Thay vì uống rượu ăn vặt, tôi thích bánh mì, húp xì xụp!", -- Wheat Whiskey
            PALE_WHISKEY = "Tôi thà đi đến đầm lầy hái trái cây để ăn.", -- Pale Malt Whiskey

            -- Rượu chưng cất hợp tác độc quyền của Warly

            NUT_COCONUT_BRANDY = "Mùi nước trái cây nồng nhưng độc hại!", -- Coconut Brandy (Caribbean Brandy)
            GIANT_BLUEBERRY_GIN = "Kwagwang!", -- Boom Berry Sapphire (Nổ khi đốt)

            -- Nấu nồi

            DARK_RUINCOLATE = "Người đàn ông nấu ăn đã cho tôi những món ăn vặt kỳ lạ.", -- Sôcôla đen
            WHITE_RUINCOLATE = "Ngon quá! Ngon quá!", -- Sôcôla trắng
            RUINCOLATE = "Khi bạn nhai nó, nó dính và ngọt ngào!", -- Just Chocolate
            RUIN_SCHOKAKOLA = "Nó ngon nhưng nếu ăn quá nhiều sẽ không ngủ được!", -- Chokola

            BUCKET_STEEL_EMPTY =
            {
                EMPTY = "Xô chắc chắn!", -- Xô thép rỗng
                FULL = "Đầy nước mưa!", -- Làm sạch nước mưa bên trong
                FULL_ICE = "Brrr, không muốn chạm vào nó.", -- Nước mưa đã đóng băng
                DIRTY = "Nó biến thành một cái ao nhỏ, ribbit!", -- Nước mưa đã trở nên bẩn
                DIRTY_ICE = "Brrr, cái ao nhỏ đã đóng băng.", -- Nước mưa bẩn đã đóng băng
            },

            BUCKET_WOODIE_EMPTY =
            {
                EMPTY = "Tiều phu đã bảo đừng ngồi lên nó.", -- Làm rỗng thùng gỗ của Woodie
                FULL = "Đầy nước mưa!", -- Làm sạch nước mưa bên trong
                FULL_ICE = "Brrr, không muốn chạm vào nó.", -- Nước mưa đã đóng băng
                DIRTY = "Nó biến thành một cái ao nhỏ, ribbit!", -- Nước mưa đã trở nên bẩn
                DIRTY_ICE = "Brrr, cái ao nhỏ đã đóng băng.", -- Nước mưa bẩn đã đóng băng
            },

            BUCKET_EMPTY =
            {
                EMPTY = "Đó là một cái xô, ribbit.", -- Xô gỗ rỗng
                FULL = "Đầy nước mưa!", -- Làm sạch nước mưa bên trong
                FULL_ICE = "Brrr, không muốn chạm vào nó.", -- Nước mưa đã đóng băng
                DIRTY = "Nó biến thành một cái ao nhỏ, ribbit!", -- Nước mưa đã trở nên bẩn
                DIRTY_ICE = "Brrr, cái ao nhỏ đã đóng băng.", -- Nước mưa bẩn đã đóng băng
            },

            DESALINATOR =
            {
                EMPTY = "Họ làm ra nó để uống từ một cái ao lớn!", -- Máy khử muối không có nước
                PURIFY_LONG = "Ròng rọc, ríu rít, sẽ mất một lúc!", -- Vẫn còn một thời gian dài cho đến khi quá trình thanh lọc hoàn tất
                PURIFY_SHORT = "Sắp sẵn sàng để uống rồi, ribbit!", -- Quá trình thanh lọc gần như hoàn tất
                HASWATER = "Nước không còn mặn nữa, ribbit!", -- Máy khử muối có nước sạch
                BURNT = "Không phải tôi đâu, ribbit!", -- Máy khử muối đã cháy
                HASSALT = "Quá nhiều muối, không có tác dụng, ribbit.", -- Máy khử muối có lượng muối dư thừa
            },

            BARREL =
            {
                GENERIC = "Bà đan liễu gai nổi giận với họ vì nuôi cá trong cái này, ribbit.", -- Kiểm tra thùng
                BURNT = "Tại sao lại cháy khi có nước bên trong?", -- Thùng bị cháy
            },

            BREWERY =
            {
                EMPTY = "Có thể làm soda, không chỉ rượu, ribbit!", -- Kiểm tra nhà máy bia
                BURNT = "Ồ không, ribbit.", -- Nhà máy bia bị cháy
                FERMENTING_LONG = "Mất quá nhiều thời gian, ribbit!", -- Vẫn còn một thời gian dài cho đến khi quá trình lên men hoàn tất
                FERMENTING_SHORT = "Soda chưa? Gần xong rồi à?", -- Quá trình lên men gần như hoàn tất
                DONE = "Có phải soda không, ribbit?", -- Có đồ uống trong nhà máy bia
            },

            CAMPKETTLE_ITEM = "Cần cho làn da mịn màng uống nước ao!", -- Kiểm tra vật phẩm ấm đun nước cắm trại
            CAMPKETTLE =
            {
                GENERIC = "Aww, nó trống rỗng.", -- Kiểm tra chiếc ấm cắm trại trống trên hố lửa
                BOILING_LONG = "Nước vẫn còn lạnh, ribbit.", -- Bắt đầu đun sôi nước
                BOILING_SHORT = "Nóng quá!!", -- Nước gần sôi
                DONE = "Nước không có mùi, ribbit?", -- Có được nước sạch
                STOP = "Bên trong có nước ao.", -- Lò lửa tắt nên nước bẩn không sôi
            },

            CAMPDESALINATOR_ITEM = "Cái này nặng quá.", -- Kiểm tra vật dụng khử muối trong trại
            CAMPDESALINATOR =
            {
                GENERIC = "Ôi, nó trống rỗng.", -- Không có nước trong máy khử muối của trại
                BOILING_LONG = "Slooosh, slooosh, ribbit~", -- Bắt đầu đun nước
                BOILING_SHORT = "Nước gần như chuyển động, thật hấp dẫn!", -- Nước gần như sôi
                DONE = "Nước không còn mặn nữa, ribbit!", -- Có được nước sạch
                STOP = "Bên trong có một cái ao lớn, ribbit.", -- Hố lửa tắt nên nước mặn không được lọc sạch
            },

            KETTLE =
            {
                EMPTY = "Sẽ thật tuyệt nếu bên trong có thứ gì đó để uống, ribbit.", -- Kiểm tra cái ấm rỗng
                BURNT = "Ồ không, ribbit.", -- Ấm đun nước bị cháy
                BOILING_LONG = "Mất quá nhiều thời gian, ribbit.", -- Mới bắt đầu pha đồ uống
                BOILING_SHORT = "Sắp xong rồi, ribbit!", -- Đồ uống sắp xong rồi
                DONE = "Đã đến giờ uống gì đó rồi, ribbit!", -- Đồ uống đã sẵn sàng
                PURIFY_LONG = "Nếu bạn không đun sôi nước ao, đồ uống sẽ có vị rất tệ, ribbit.", -- Mới bắt đầu đun sôi nước bẩn
                PURIFY_SHORT = "Hầu như không còn mùi nữa, ribbit!", -- Nước bẩn gần như đã sôi xong
                HASWATER = "Bạn cũng cần thức ăn, ribbit.", -- Ấm đun nước có nước sạch
                MELT_LONG = "Brrr, trời vẫn lạnh.", -- Nước đá vừa bắt đầu tan
                MELT_SHORT = "Trời ấm quá!", -- Nước đá gần tan rồi
            },

            PORTABLEKETTLE_ITEM =
            {
                GENERIC = "Làm cho nước có vị ngon hơn, ribbit!", -- Kiểm tra vật phẩm ấm đun nước di động
                EMPTY = "Cần nước và thức ăn!", -- Kiểm tra ấm đun nước di động trống được đặt
                BOILING_LONG = "Mất quá nhiều thời gian, ribbit!", -- Mới bắt đầu pha đồ uống
                BOILING_SHORT = "Uống! Uống! Uống!", -- Uống gần xong rồi
                DONE = "Wow!", -- Đồ uống đã sẵn sàng
                PURIFY_LONG = "Nếu bạn không đun sôi nước ao, đồ uống sẽ có vị rất tệ, ribbit.", -- Mới bắt đầu đun sôi nước bẩn
                PURIFY_SHORT = "Hầu như không còn mùi nữa, ribbit!", -- Nước bẩn gần như đã sôi xong
                HASWATER = "Bạn cũng cần thức ăn, ribbit.", -- Ấm đun nước di động có nước sạch
                MELT_LONG = "Brrr, trời vẫn lạnh.", -- Nước đá vừa bắt đầu tan
                MELT_SHORT = "Trời ấm quá!", -- Nước đá gần tan rồi
            },

            DISTILLERS =
            {
                EMPTY = "Một cái vạc xinh xắn làm bằng đá!", -- Kiểm tra máy chưng cất
                DISTILLTING_LONG = "Nếu bạn xem nó, nó sẽ kêu ping!", -- Vẫn còn một thời gian dài cho đến khi quá trình chưng cất hoàn tất
                DISTILLING_SHORT = "Tôi không uống rượu, ribbit.", -- Quá trình chưng cất gần như hoàn tất
                DONE = "Hãy đưa nó cho người biết uống, ribbit!", -- Có đồ uống trong máy chưng cất
            },

            WELL_WATERPUMP = {
                HIGH_PRESSURE = "Nó tràn đầy năng lượng!", -- Áp suất tối đa
                MIDDLE_PRESSURE = "Đang bơm nước từ dưới lòng đất, ribbit.", -- Áp suất trung bình
                LOW_PRESSURE = "Có vẻ mệt mỏi, ribbit.", -- Hầu như không có áp lực
                RECHARG_PRESSURE = "Nó không hoạt động, ribbit.", -- Không có áp lực nào cả (không thể sử dụng cho đến khi áp suất tối đa).
            },

            WELL_SPRINKLER =
            {
                LOWFUEL = "Thêm nhiên liệu để phun thêm nước, ribbit.", -- Kiểm tra vòi phun nước ít nhiên liệu
                ON = "Tiếp tục phun nước, có thể sẽ thành đầm lầy, ribbit!", -- Máy phun nước đang hoạt động
                OFF = "Một hòn đá tròn phun nước!", -- Kiểm tra vòi phun nước đã tắt
            },
        },
    }   