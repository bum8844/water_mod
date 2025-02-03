return {
    ACTIONFAIL =
    {
        GIVE =
        {
            WELL_NOTEMPTY = "Đơn hàng bị xáo trộn.", -- Cố gắng đưa xô khi giếng đã có xô
            WELL_BUSY = "Trước tiên hãy làm những gì đã có.", -- Cố gắng đưa một cái xô khi trong giếng đã có một cái xô
        }
    },

    ANNOUNCE_DRUNK = "Hic, tôi cảm thấy như một khúc gỗ...", -- Đang say

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

    ANNOUNCE_DRUNK_END = "Tôi suýt rung chuông.", -- Tỉnh táo sau khi say
    ANNOUNCE_DRUNK_IMMUNITY = "", -- Tạm thời, dành riêng cho Wigfrid
    ANNOUNCE_NOTCHARGE = "Huh? Không có điện?", -- Cố gắng vắt sữa một con dê Volt đã tích điện bằng một cái xô
    ANNOUNCE_NOTHIRSTSLEEP = "Tôi khát quá không ngủ được.", -- Cố gắng ngủ vào ban đêm trong khi rất khát
    ANNOUNCE_NOTHIRSTSIESTA = "Tôi khát quá không thể nghỉ ngơi được.", -- Cố gắng nghỉ ngơi trong ngày khi rất khát
    ANNOUNCE_SLEEP_END = "Lucy? Bạn sẽ không cắn tôi chứ? Đó là một cơn ác mộng khủng khiếp.", -- Thức dậy sau khi ngủ và tỉnh táo
    ANNOUNCE_THIRST = "Tôi hơi khát.", -- Cảm thấy khát

    ANNUNCE_CAFFINE_BUFF_START = "Phóng to như chó sói!", -- Bắt đầu sử dụng caffeine
    ANNOUNCE_CAFFINE_BUFF_STOP = "Tôi đoán đã đến lúc đứng yên và gặm một khúc gỗ.", -- Kết thúc việc sử dụng caffeine

    ANNOUNCE_CURE_WATERBORNE = "Dạ dày của tôi cảm thấy ổn định một chút.", -- Chữa bệnh lây qua đường nước bằng một vật phẩm

    ANNOUNCE_DCAPACITY_CRITICAL = "Tôi cảm thấy hơi nặng nề...", -- Ngay trước khi say
    ANNOUNCE_DCAPACITY_HALF = "Ồ, cái này ngon quá!", -- Bắt đầu cảm thấy say

        DESCRIBE =
        {
            BOILBOOK = "Khá tiện lợi. Lucy, bạn có thể giúp tôi theo dõi thời gian trong khi chúng ta pha cà phê không?",

            WATER_CLEAN_ICE = "Chúng ta cần làm tan chảy nó, phải không?", -- Đá sạch
            WATER_DIRTY_ICE = "Nó đóng băng và bẩn.", -- Đá bẩn

            SPICE_CAFFEINPEPPER = "Bạn biết đấy, tôi chỉ nghĩ đến muối cho thịt thôi.", -- Gia vị Caffeinpepper

            WELL_KIT = "Tôi sẽ giúp một tay với việc này.", -- Well kit
            WELL_SPRINKLER_KIT = "Hoàn toàn tự động phải không?", -- Bộ phun nước
            WELL_WATERPUMP_KIT = "Điều này có vẻ khá tiện lợi phải không?", -- Bộ máy bơm nước
            WELL_BURYING_KIT = "Chúng ta nên bịt kín những lỗ không cần thiết.", -- Bộ chôn lỗ
            WELL_DRILLING = "Có vẻ như nó đang hoạt động bình thường.", -- Khoan lỗ bằng máy khoan
            WELL_DRILLING_ITEM = "Máy khoan lỗ trên mặt đất.", -- Mục khoan
            HOLE = "Rất tiếc, chúng ta nên cẩn thận ở đây.", -- Well Hole
            WELL = "Mỗi thị trấn nên có một trong những thứ này.", -- Vâng

            WX78MODULE_NONEDRUNK = "Một số robot lạ mắt.", -- 78전용 묘듈
           
            -- Cây chế độ nước

            TEA_TREE = "Trông giống hàng rào làm bằng cây.", -- Tea Tree
            DUG_TEA_TREE = "Đã đến lúc làm một chút cảnh quan.", -- Đào Cây Trà
            TEA_SEED = "Có vẻ như nó có nhiều gỗ hơn quả.", -- Tea Tree Seed
            TEA_SEED_COOKED = "Thật tiếc khi lãng phí gỗ như thế này.", -- Hạt giống cây trà đã nấu chín
            TEA_SEED_SAPLING = "Còn một chặng đường dài trước khi nó trở thành một cái cây.", -- Tea Tree Sapling
            TEALEAVES = "Trông giống như lá trà tươi.", -- Lá trà
            TEALEAVES_DRIED = "Trông giống như lá trà khô.", -- Lá trà khô

            CAFFEINBERRY = "Hạt cà phê!", -- Caffeinberry Bush
            DUG_CAFFEINBERRY = "Tôi nên mang nó theo mọi lúc mọi nơi.", -- Dug Caffeinberry Bush
            CAFFEINBERRY_BEAN = "Tôi cần chuẩn bị những thứ này bằng cách nào đó.", -- Caffeinberry thô
            CAFFEINBERRY_BEAN_COOKED = "Người Canada thực sự thích cà phê phải không?", -- Caffeinberry nấu chín

            RUINCACAO_TREE = "Nó mọc ở khu vực phía Nam, nhưng trông khác với những gì tôi biết.", -- Ruincacao Tree
            DUG_RUINCACAO_TREE = "Cành cây kêu rắc rắc khắp nơi.", -- Cây đào Ruincacao
            RUINCACAO_SEED = "Một bông hoa trông có vẻ nham hiểm đã nở ở đây.", -- Ruincacao Seed
            RUINCACAO_SEED_SAPLING = "Một bông hoa trông có vẻ nham hiểm đã nở ở đây.", -- Ruincacao Sapling
            RUINCACAO = "Có mùi than củi.", -- Ruincacao (đập sẵn)
            RUINCACAO_BEAN = "Nó không có vị giống bơ ăn chút nào.", -- Ruincacao Bean
            RUINCACAO_BEAN_COOKED = "Tôi thường không ăn bơ theo cách này.", -- Đậu Ruincacao nấu chín

            -- Phụ gia chưng cất

            ADDITIVE_SEED = "Có phải chúng ta đang tạo ra rượu moonshine bằng thứ này không?", -- Phụ gia Seed Herbs (Anise, Juniper Berry, Allspice) cho rượu
            ADDITIVE_PETALS = "Những thứ này có pha được vào rượu không?", -- Phụ gia thảo dược cánh hoa (Trà xanh, Cánh hoa) cho rượu
            ADDITIVE_NUT = "Một hỗn hợp các món ăn nhẹ.", -- Phụ gia Nut Herbs (Hạt bạch dương, Dừa, Hạt cà phê, Đậu Ruincacao) cho rượu
            ADDITIVE_DAIRY = "Giống như kem phải không?", -- Phụ gia sữa cho rượu

            -- Đồ uống

            WATER_CLEAN = "Đó là nước sạch.", -- Nước sạch
            WATER_DIRTY = "Nó bẩn.", -- Nước bẩn
            WATER_SALTY = "Là nước biển.", -- Nước mặn

            GOOPYDRINK = "Trước đây tôi từng pha đồ uống tệ hơn.", -- Đồ uống không thành công (khái niệm đun sôi)

            -- Đồ uống ấm trà

            FRUITJUICE = "Nước ép trái cây tươi.", -- Nước ép trái cây thông thường
            BERRIES_JUICE = "Họ đã giảm bớt nước một chút.", -- Nước ép quả mọng
            POMEGRANATE_JUICE = "Họ đã giúp chúng tôi không phải mất công nhặt hạt.", -- Nước ép lựu
            BANANA_JUICE = "Thức uống nhiệt đới.", -- Nước chuối
            FIG_JUICE = "Nước trái cây không tệ chút nào.", -- Nước ép quả sung
            DRAGONJUICE = "Có thể dùng một chút xi-rô.", -- Nước ép thanh long
            GLOWBERRYJUICE = "Tôi có thể tiếp tục uống thứ này.", -- Nước ép Glowberry
            WATERMELON_JUICE = "Thật nhiều nước.", -- Nước ép dưa hấu

            VEGGIE_TEA = "Tôi không nghĩ món này hợp khẩu vị của tôi.", -- Trà rau
            CARROT_TEA = "Có phải nó được phục vụ kèm thức ăn cho thỏ không?", -- Trà cà rốt
            CACTUS_TEA = "Tôi nghi ngờ về gai.", -- Trà xương rồng
            TOMATO_JUICE = "Cần thêm một ít xi-rô.", -- Nước ép cà chua
            LUMPY_TEA = "Tôi thích làm món băm từ nó hơn.", -- Trà rễ
            SEAWEED_SHAKE = "Không có cách nào tốt hơn để sử dụng nó sao?", -- Rong biển lắc

            GREENTEA = "Tôi có thể đi uống một tách trà.", -- Trà xanh tươi
            BLACKTEA = "Đã đến giờ uống trà chưa?", -- Trà đen
            BLACKTEA_ICED = "Hoàn hảo cho ngày nóng.", -- Trà đen đá
            FUER = "Tôi sẽ uống dù nó đến thế nào.", -- Trà Bồi (Boi Cha, Trà Lá,Trà chiến binh)
            MIXFLOWER = "Một loại trà khá tình cảm.", -- Trà Hoa Hỗn Hợp
            HIBISCUSTEA = "Nó có màu đỏ như Lucy.", -- Trà dâm bụt
            CACTUSFLOWER_TEA = "Tôi nghi ngờ về gai.", -- Trà hoa xương rồng
            LOTUSTEA = "Tôi chưa bao giờ thấy loại trà này trước đây.", -- Trà hoa sen
            SUSHIBISCUS = "Lucy, bạn nghĩ sao? Chúng ta thử xem nhé?", -- Hibiscus Sushi
            MOON_BLOSSOM_TEA = "Mùi hương khá ấn tượng.", -- Trà hoa trăng

            CAFFEINBERRY_JUICE = "Đã đến giờ uống cà phê rồi phải không?", -- Black Coffee
            TOFFEE_LATTE = "Cà phê thật sự rất ngọt.", -- Toffeenut Latte
            RUINCHA_LATTE = "Đây không phải là mocha.", -- Mocha Latte (Cà phê + Sôcôla)

            HOTRUINCOLATE = "Hoàn hảo để nhấm nháp bên đống lửa ấm cúng.", -- Sôcôla nóng
            RUINCOLATE_SMOOTHIE = "Ngọt ngào và sảng khoái.", -- Sinh tố Sôcôla (Lạnh)
            RUINXOCOLATL = "Vị đắng thực sự đã vượt qua.", -- Chocolatl (Đắng)
            TEA_RUINCOLATE_LATTE = "Thật ngạc nhiên, hương vị hòa quyện rất tốt.", -- Matcha Latte

            MULLED = "Món này thật hoàn hảo khi bạn cảm thấy không khỏe.", -- Bánh Xèo (Bánh Crepes mặn Việt Nam)
            BUTTERBEER = "Trông tôi giống sinh vật huyền bí hay người khổng lồ tí hon? Hah.", -- Butterbeer (tham khảo Harry Potter)

            -- Hợp tác Ấm trà Đồ uống

            COCONUT_JUICE = "Không còn nhiều phần dừa nữa phải không?", -- Nước cốt dừa bị đắm tàu
            RAINBOW_SHAKE = "Sức mạnh của nó là nó không có mùi vị gì cả.", -- Shipwrecked Rainbow Jelly Shake
            QUARTZ_SHAKE = "Chúng tôi có thể làm sushi với nó.", -- Thạch lắc thạch anh đắm tàu
            CHERRY_ROSEBERRIES_TEA = "Tôi nghi ngờ liệu còn sót lại phần giống tóc nào không.", -- Trà Tầm Xuân Rừng Anh Đào
            CHERRY_HONEY_TEA = "Mùi mật ong và mùi cây, thật thú vị.", -- Trà mật ong hoa anh đào rừng anh đào
            SWEET_RICE_DRINK = "Đây là một loại nước ép ngũ cốc đặc biệt.", -- Nước gạo ngọt Vitacomp
            APPLEPINE_JUICE = "Thật là sảng khoái, nhưng tôi không thể uống nhiều như thế này được.", -- Legion Pineapple Juice
            CITROYUZU_JUICE = "Thêm một ít xi-rô vào và nó sẽ hoàn hảo.", -- Thêm gói thực phẩm Nước cam
            STRAWBERRY_SMOOTHIE = "Tôi không chủ động tìm kiếm nó, nhưng nó rất ngon.", -- Thêm gói thực phẩm Sinh tố dâu tây
            STRAWBERRY_MILK_SMOOTHIE = "Thật mịn màng và sảng khoái.", -- Thêm gói thực phẩm Sinh tố sữa dâu

            -- Phụ gia chưng cất

            SPOILED_DRINK = "Ôi trời, hỏng rồi.", -- Đồ uống bị hỏng

            -- Nước ngọt chưng cất

            SODA = "Đó là nước có ga.", -- Soda
            FRUITSODA = "Đó là nước ép trái cây phải không?", -- Fruit Soda
            LIMONSODA = "Thật ngọt ngào và sảng khoái.", -- Soda chanh chanh (biến thể Soda trái cây)
            COLA = "Tôi nên uống nó khi làm việc mệt mỏi.", -- Cola
            COLAQUANTUM = "Cái này khá gây nghiện.", -- Cola Quantum
            LUMPY_BEER = "Đây có phải là đồ uống sarsaparilla không?", -- Bia Lumpy (không cồn)

            -- Rượu chưng cất

            CORN_BEER = "Đó không phải là bia thật, nhưng theo tôi thì nó ổn.", -- Corn Beer
            MADHU = "Nó được làm từ mật ong.", -- Madhu (Rượu mật ong)
            WINE = "Nó không được làm từ nho, nhưng nó sẽ làm được.", -- Wine (Basic Berry Brew)
            NOBLEWINE = "Đây là một loại rượu ưa thích.", -- Noble Wine (Roasted Berry Brew)
            SPARKLINGWINE = "Ai đó sẽ làm xáo trộn nó, và tôi sẽ không chấp nhận điều đó.", -- Sparkling Wine
            GLOWBERRYWINE = "Hương vị không tệ.", -- Glowberry Wine
            KUMIS = "Đây là đồ uống từ sữa lên men hay gì đó?", -- Kumis (Rượu sữa lên men)
            LUMPY_WINE = "Nó không phải là ánh trăng, nhưng nó sẽ làm được.", -- Lumpy Wine (Root Brew)
            PULQUE = "Đó là thức uống mà người dân bản địa ở quê hương tôi thường uống.", -- Pulque (Agave Wine)
            RUINCACAO_WINE = "Tôi chưa bao giờ nghe nói đến rượu ca cao.", -- Ruincacao Wine (Rượu ca cao)

            -- Nước ngọt hợp tác

            CHERRY_DOCTOR_COLA = "Chỉ cần ngọt ngào và sảng khoái là đủ.", -- Cherry Forest Doctor Pepper (Doctor Cherry)
            APPLEPINESODA = "Đó là soda dứa.", -- Soda dứa (Orancee)
            CITROYUZUSODA = "Đó là soda cam.", -- CITROYUZU Soda (Fanta)
            STRAWBERRYSODA = "Đó là soda dâu tây.", -- Strawberry Soda (Dâu tây của Welch)

            -- Tinh thần hợp tác

            AUROBOW = "Tôi thấy rằng họ làm rượu từ sứa, trong mọi thứ.", -- Shipwrecked Aurobow (Rượu sứa cầu vồng)
            COCONUT_WINE = "Nó có mùi gỗ nồng nặc.", -- Rượu dừa đắm tàu
            CHERRY_BLOOM_MADHU = "Nếu không có ai uống nó, tôi đoán là tôi sẽ phải uống.", -- Rượu mật ong hoa anh đào Cherry Forest
            GIANT_BLUEBERRY_WINE = "Bây giờ nó chứa đầy quả việt quất.", -- Vitacomp Boom! Berry Sapphire (Nổ khi bắt lửa)
            RICE_WINE = "Chẳng phải rượu gạo này không được lên men đúng cách sao?", -- Vitacomp Makgeolli (Rượu gạo)
            WHEAT_BEER = "Đó là bia thật.", -- Hip of Food Wheat Beer
            PALE_BEER = "Màu bia thật lạ.", -- Legion Pale Ale (Bia xanh làm từ Monsteras)

            -- Rượu chưng cất

            DISINFECTANT = "Khử trùng rất quan trọng phải không?", -- Chất khử trùng
            CORN_WHISKEY = "Đó là rượu whisky kiểu Mỹ.", -- Corn Whiskey
            LUMPY_VODKA = "Uống cái này khi trời lạnh sẽ làm bạn ấm lên phải không?", -- Vodka
            TEQUILA = "Đó là một loại rượu mạnh của miền Nam phải không?", -- Tequila
            MADHU_RUM = "Đó là rượu rum thủy thủ.", -- Rum
            BERRY_BRANDY = "Loại rượu mạnh này có vẻ khá lạ mắt.", -- Berry Brandy
            AREUHI = "Đây có phải vodka làm từ sữa không?", -- Rượu chưng cất Kumis Areuhi

            -- Rượu chưng cất độc quyền của Warly

            BERRY_GIN = "Có vẻ giống rượu gin.", -- Gin
            GLOWBERRY_GIN = "Thật tươi sáng và tuyệt vời phải không?", -- Glowberry Gin
            ABSINTHE = "Toàn mùi ngải cứu.", -- Absinthe
            TEA_LUMPY_VODKA = "Tôi chưa bao giờ thấy loại rượu này trước đây, nhưng nó không tệ.", -- Matcha Liqueur
            PETALS_BERRY_BRANDY = "Nó thơm và dễ chịu.", -- Rượu Brandy thơm hoa hồng
            KAHLUA = "Tôi thích uống cà phê và rượu riêng biệt.", -- Coffee Liqueur Kahlua
            NUT_CORN_WHISKEY = "Nó có mùi thơm hơi nồng.", -- Nut Whiskey
            RUINCACAO_CREAM_LIQUEUR = "Tôi không biết có nên coi đây là rượu hay không.", -- Rượu mùi kem ca cao Baileys
            RUMCHATA = "Người miền Nam có pha rượu với sữa không?", -- Rumchata (Trộn với Horchata)

            -- Hợp tác chưng cất rượu mạnh

            MOONWAY = "Màu sắc thì đẹp, nhưng tôi thấy nghi ngờ.", -- Rượu Sứa Cầu Vồng Chưng Cất Rượu
            ARRACK = "Là rượu dừa từ Indonesia phải không?", -- Arrack (Rượu dừa) Phiên bản tiếng Indonesia
            CHERRY_BLOOM_RUM = "Nếu không có ai khác xem, tôi đoán tôi sẽ lấy nó và uống nó?", -- Cherry Blossom Honey Rum Rượu chưng cất Cánh hoa anh đào nổi
            RICE_SPIRITS = "Không phải còn quá trẻ để uống rượu sao?", -- Cheongju (Rượu gạo Hàn Quốc)
            WHEAT_WHISKEY = "Khi khách hàng đến, tôi sẽ hỏi họ muốn cà phê hay rượu whisky.", -- Wheat Whiskey
            PALE_WHISKEY = "Màu sắc lạ, nhưng nếu họ yêu cầu rượu whisky, tôi sẽ phục vụ.", -- Pale Malt Whiskey

            -- Rượu mạnh hợp tác độc quyền của Warly

            NUT_COCONUT_BRANDY = "Mọi thứ đã sẵn sàng chưa mọi người?", -- Coconut Brandy (SpongeBob mở đầu trò nhại cướp biển)
            GIANT_BLUEBERRY_GIN = "Vậy bạn đã thắng trò chơi khúc côn cầu trên băng chưa?", -- Boom Berry Sapphire (Cà rốt phát nổ)

            -- Nấu nồi

            DARK_RUINCOLATE = "Warly đang cố gắng nấu ăn hay đây là nỗ lực để có một bữa ăn lành mạnh?", -- Sôcôla đen
            WHITE_RUINCOLATE = "Nó có ngọt và không nặng không?", -- Sôcôla trắng
            RUINCOLATE = "Tôi không có nhiều cơ hội ăn sô cô la, nhưng cảm ơn.", -- Plain Chocolate
            RUIN_SCHOKAKOLA = "Nó sẽ giúp tôi tiếp thêm năng lượng.", -- Schokakola

            BUCKET_STEEL_EMPTY = 
            {
                EMPTY = "Một cái xô rất chắc chắn.", -- Xô thép rỗng
                FULL = "Nó chứa đầy nước mưa sạch.", -- Nước mưa sạch trong xô
                FULL_ICE = "Ai đã bỏ xô ra ngoài để đóng băng?", -- Nước mưa đóng băng trong xô
                DIRTY = "Tôi nên dùng cái này để tưới vườn.", -- Nước mưa đã trở nên bẩn
                DIRTY_ICE = "Nó đóng băng trước khi tôi kịp làm sạch.", -- Nước mưa bẩn đóng băng trong xô
            },

            BUCKET_WOODIE_EMPTY = 
            {
                EMPTY = "Làm tốt lắm, Lucy!", -- Xô gỗ rỗng của Woodie
                FULL = "Hãy đổ hết nước mưa trong xô đi trước khi nó mục nát.", -- Làm sạch nước mưa trong xô
                FULL_ICE = "Ai đã bỏ xô ra ngoài để đóng băng?", -- Nước mưa đóng băng trong xô
                DIRTY = "Tôi nên dùng cái này để tưới vườn.", -- Nước mưa đã trở nên bẩn
                DIRTY_ICE = "Nó đóng băng trước khi tôi kịp làm sạch.", -- Nước mưa bẩn đóng băng trong xô
            },

            BUCKET_DRIFTWOOD_EMPTY =
            {
                EMPTY = "Hửm... tôi nghĩ tôi nên phủ một lớp cát nên nó một chút.", -- Xô gỗ rỗng
                FULL = "Hãy đổ hết nước mưa trong xô đi trước khi nó mục nát.", -- Làm sạch nước mưa trong xô
                FULL_ICE = "Ai đã bỏ xô ra ngoài để đóng băng?", -- Nước mưa đóng băng trong xô
                DIRTY = "Tôi nên dùng cái này để tưới vườn.", -- Nước mưa đã trở nên bẩn
                DIRTY_ICE = "Nó đóng băng trước khi tôi kịp làm sạch.", -- Nước mưa bẩn đóng băng trong xô
            },

            BUCKET_EMPTY = 
            {
                EMPTY = "Một cái xô làm bằng ván gỗ.", -- Xô gỗ rỗng
                FULL = "Hãy đổ hết nước mưa trong xô đi trước khi nó mục nát.", -- Làm sạch nước mưa trong xô
                FULL_ICE = "Ai đã bỏ xô ra ngoài để đóng băng?", -- Nước mưa đóng băng trong xô
                DIRTY = "Tôi nên dùng cái này để tưới vườn.", -- Nước mưa đã trở nên bẩn
                DIRTY_ICE = "Nó đóng băng trước khi tôi kịp làm sạch.", -- Nước mưa bẩn đóng băng trong xô
            },

            DESALINATOR = 
            {
                EMPTY = "Công nghệ tuyệt vời. Hãy thử sử dụng nước biển.", -- Không có nước trong máy khử muối
                PURIFY_LONG = "Nó sẽ không loại bỏ muối nhanh như vậy được.", -- Vẫn còn một chặng đường dài để thanh lọc
                PURIFY_SHORT = "Tốt, nó sắp trở thành nước sạch.", -- Quá trình lọc gần như hoàn tất
                HASWATER = "Nó chứa đầy nước.", -- Nước sạch trong máy khử muối
                BURNT = "Thật lãng phí.", -- Máy khử muối đã cháy
                HASSALT = "Còn quá nhiều muối nên máy sẽ không lọc sạch được.", -- Muối vẫn còn trong máy khử muối
            },

            BARREL = 
            {
                GENERIC = "Nó được niêm phong tốt.", -- Kiểm tra thùng
                BURNT = "Nó đã cháy rụi hoàn toàn.", -- Thùng đã cháy hết
            },

            BREWERY = 
            {
                EMPTY = "Một nhà sản xuất bia khá tinh vi.", -- Kiểm tra nhà máy bia
                BURNT = "Thật tiếc là nó đã bị cháy.", -- Nhà máy bia đã bị cháy
                FERMENTING_LONG = "Vẫn chỉ là nước trái cây.", -- Quá trình sản xuất bia còn một chặng đường dài
                FERMENTING_SHORT = "Hương thơm của rượu đang bốc lên.", -- Quá trình nấu bia gần như hoàn tất
                DONE = "Hãy thử uống nó.", -- Đồ uống đã sẵn sàng trong nhà máy bia
            },

            CAMPKETTLE_ITEM = "Làm tôi nhớ đến nước sôi trong rừng.", -- Kiểm tra ấm đun nước cắm trại di động (vật phẩm)
            CAMPKETTLE = 
            {
                GENERIC = "Chúng ta có nên dọn dẹp nếu không sử dụng nó không?", -- Kiểm tra chiếc ấm cắm trại trống trong lò sưởi
                BOILING_LONG = "Tôi có thực sự muốn uống trà nóng không?", -- Bắt đầu đun nước
                BOILING_SHORT = "Sắp xong rồi!", -- Nước trong ấm gần sôi
                DONE = "Đã đến giờ uống trà!", -- Nước sạch đã sẵn sàng trong ấm
                STOP = "Lucy, chúng ta cùng kiếm củi nhé.", -- Ấm đun nước sẽ không sôi nếu không có lửa
            },

            CAMPDESALINATOR_ITEM = "Cái này có dùng được trên thuyền không?", -- Kiểm tra máy khử muối di động trong trại (vật phẩm)
            CAMPDESALINATOR = 
            {
                GENERIC = "Bên trong trống rỗng.", -- Kiểm tra máy khử muối của trại trống
                BOILING_LONG = "Vẫn là nước biển.", -- Bắt đầu đun sôi nước biển
                BOILING_SHORT = "Sắp xong rồi!", -- Nước biển gần như đã được lọc sạch
                DONE = "Đã sẵn sàng để uống.", -- Nước sạch đã sẵn sàng trong máy khử muối
                STOP = "Lucy, chúng ta cùng kiếm củi nhé.", -- Máy khử muối sẽ không hoạt động nếu không có lửa
            },

            KETTLE = 
            {
                EMPTY = "Tôi có nên lấy nó nếu tôi không định sử dụng nó không?", -- Kiểm tra ấm nước rỗng
                BURNT = "Nó đã cháy rụi hoàn toàn.", -- Ấm đun nước đã cháy rụi
                BOILING_LONG = "Sẽ mất nhiều thời gian hơn phải không?", -- Bắt đầu đun sôi đồ uống
                BOILING_SHORT = "Tuyệt vời! Sắp xong rồi!", -- Đồ uống trong ấm sắp xong rồi
                DONE = "Chúng ta thử uống nó nhé?", -- Đồ uống đã sẵn sàng trong ấm
                PURIFY_LONG = "Tôi không muốn bị bệnh vì uống nước bẩn.", -- Bắt đầu lọc nước bẩn
                PURIFY_SHORT = "Sắp được đun sôi sạch.", -- Nước bẩn gần như được lọc sạch
                HASWATER = "Nước đã sẵn sàng; tôi chỉ cần nguyên liệu thôi.", -- Nước sạch đã có trong ấm
                MELT_LONG = "Bạn có nghĩ tôi có thể pha trà với đá tan không?", -- Bắt đầu làm tan đá cho trà
                MELT_SHORT = "Sắp tan chảy rồi.", -- Băng gần tan rồi
            },

            PORTABLEKETTLE_ITEM = 
            {
                GENERIC = "Tôi có nên mang theo một ít lá trà không?", -- Kiểm tra ấm đun nước di động (vật phẩm)
                EMPTY = "Tôi nên mang theo nếu không sử dụng ở đây.", -- Kiểm tra ấm đun nước di động trống được đặt
                BOILING_LONG = "Sẽ mất nhiều thời gian hơn phải không?", -- Bắt đầu đun sôi đồ uống
                BOILING_SHORT = "Tuyệt vời! Gần xong rồi!", -- Đồ uống trong ấm đun nước di động cũng sắp xong rồi
                DONE = "Chúng ta thử uống nó nhé?", -- Đồ uống đã sẵn sàng trong ấm di động
                PURIFY_LONG = "Tôi không muốn bị bệnh vì uống nước bẩn.", -- Bắt đầu lọc nước bẩn
                PURIFY_SHORT = "Sắp được đun sôi sạch.", -- Nước bẩn gần như được lọc sạch
                HASWATER = "Nước đã sẵn sàng; tôi chỉ cần nguyên liệu thôi.", -- Nước sạch đã có trong ấm di động
                MELT_LONG = "Bạn có nghĩ tôi có thể pha trà với đá tan không?", -- Bắt đầu làm tan đá cho trà
                MELT_SHORT = "Sắp tan chảy rồi.", -- Băng gần tan rồi
            },

            DISTILLERS = 
            {
                EMPTY = "Tôi thực sự không hiểu cách thức hoạt động của nó.", -- Kiểm tra máy chưng cất rỗng
                DISTILLTING_LONG = "Sẽ mất nhiều thời gian hơn.", -- Quá trình chưng cất còn một chặng đường dài
                DISTILLING_SHORT = "Sắp xong rồi.", -- Quá trình chưng cất gần như hoàn tất
                DONE = "Hãy thử uống nó.", -- Đồ uống đã sẵn sàng trong máy chưng cất
            },

            WELL_WATERPUMP = {
                HIGH_PRESSURE = "Bạn đang làm rất tốt.", -- Áp lực ở mức tối đa
                MIDDLE_PRESSURE = "Bạn đang nỗ lực bơm nước.", -- Áp suất ở giữa
                LOW_PRESSURE = "Áp lực nước đã giảm.", -- Áp suất gần như không còn
                RECHARG_PRESSURE = "Nước không chảy ra.", -- Áp suất đã hết (không thể sử dụng cho đến khi áp suất được nạp lại)
            },

            WELL_SPRINKLER = 
            {
                LOWFUEL = "Dường như sắp hết nhiên liệu.", -- Kiểm tra vòi phun nước khi sắp hết nhiên liệu
                ON = "Nó đang làm việc chăm chỉ.", -- Sprinkler hiện đang bật
                OFF = "Nhờ vậy mà tôi có ít việc phải làm ngoài vườn hơn.", -- Sprinkler đã tắt
            },
        },
    }