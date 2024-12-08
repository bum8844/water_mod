return {
ACTIONFAIL =
{
    GIVE =
    {
            WELL_NOTEMPTY = "Có vẻ như chỉ còn lại một chỗ.", -- Giếng khô ráo chỉ còn một thùng rỗng.
            WELL_BUSY = "Đó là một suy nghĩ thú vị, nhưng nếu giếng bị tắc, chúng ta sẽ gặp rắc rối.", -- Giếng có gắn xô đựng đầy nước.
    }
},

ANNOUNCE_DRUNK = "Bốn? mười sáu? KHÔNG chúng ta có cả bầy nè... hahahaha", -- Say rượu

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

ANNOUNCE_DRUNK_END = "Không... giờ chúng ta chỉ là một...", -- Tỉnh táo sau khi uống rượu (nôn nao)
ANNOUNCE_DRUNK_IMMUNITY = "", -- Tạm thời. Chỉ dành cho Wickerbottom.
ANNOUNCE_NOTCHARGE = "Con dê sẽ không cho sữa bây giờ đâu.", -- Dê tia chớp không thể sạc sữa bằng xô
ANNOUNCE_NOTHIRSTSLEEP = "Cổ họng của chúng tôi quá khô để có thể ngủ thoải mái.", -- Khát nước cố ngủ vào ban đêm
ANNOUNCE_NOTHIRSTSIESTA = "Cổ họng của chúng tôi quá khô để có thể chợp mắt vào ban ngày.", -- Khát nước cố gắng ngủ vào ban ngày
ANNOUNCE_SLEEP_END = "Chúng ta là một. Chúng ta không bao giờ được nhân lên!", -- Thức dậy hoàn toàn tỉnh táo sau giấc ngủ
ANNOUNCE_THIRST = "Đã đến giờ uống trà!", -- Rất khát

ANNOUNCE_CAFFINE_BUFF_START = "Hmm, tôi cảm thấy như đang chạy marathon.", -- Bắt đầu yêu thích caffeine
ANNOUNCE_CAFFINE_BUFF_STOP = "À, dạo này thấy uể oải quá.", -- Kết thúc việc sử dụng caffeine

ANNOUNCE_CURE_WATERBORNE = "", --"À, sảng khoái!" -- Đối thoại khi chữa bệnh đường nước bằng vật phẩm

ANNOUNCE_DCAPACITY_CRITICAL = "Chúng ta cần phải chạy nhiều ngay giờ đây.", -- Sắp say
ANNOUNCE_DCAPACITY_HALF = "Không hiểu sao đầu tôi bắt đầu quay cuồng.", -- Bắt đầu say

    DESCRIBE =
    {
        BOILBOOK = "Ugh, có quá nhiều công thức nấu ăn để ghi nhớ.",

        WATER_CLEAN_ICE = "Ay da, nó lạnh quá.", -- Nước đá sạch
        WATER_DIRTY_ICE = "Nó bị đóng băng. Bleh.", -- Nước đá bẩn

        SPICE_CAFFEINPEPPER = "Hắt-xìiiiiiii", -- Gia vị hạt tiêu caffein

        WELL_KIT = "Hãy cùng xây dựng cái giếng lộng lẫy của chúng ta!", -- Bộ đồ tốt
        WELL_SPRINKLER_KIT = "Nó tự động thiết lập chỉ bằng một nút nhấn, thật tuyệt vời!", -- Bộ phun nước
        WELL_WATERPUMP_KIT = "Có nên lắp gần nguồn nước trong nhà không?", -- Bộ máy bơm nước hơi nước
        WELL_BURYING_KIT = "Hả? Chúng ta lại đào hố nữa à?", -- Bộ dụng cụ đào hố
        WELL_DRILLING = "Nó cực kỳ ồn ào nhưng thú vị!", -- Khoan lỗ bằng máy khoan
        WELL_DRILLING_ITEM = "Thứ này trông thật men-lỳ", -- Vật phẩm khoan
        HOLE = "Xin chào? Có ai ở đó không?", -- Well Hole
        WELL = "Chúng tôi đã được dặn là không được trốn ở đây.", -- Well

        WX78MODULE_NONEDRUNK = "Hả. Bên trong robot trông như thế này à?", -- 78전용 묘듈

        -- Cây Chế Độ Nước

        TEA_TREE = "Nó hơi nhỏ để trốn.", -- Cây trà
        DUG_TEA_TREE = "Với một chút tình yêu, nó sẽ mọc lại.", -- Cây trà đào từ lòng đất
        TEA_SEED = "Không ăn nhiều vì kích thước của nó.", -- Hạt cây trà
        TEA_SEED_COOKED = "Không ngon chút nào.", -- Hạt cây trà nấu chín
        TEA_SEED_SAPLING = "Chà, nó đang nảy mầm!", -- Cây trà non
        TEALEAVES = "Những chiếc lá này có mùi hương khá độc đáo.", -- Lá trà
        TEALEAVES_DRIED = "Nó hơi giống đất.", -- Lá trà khô

        CAFFEINBERRY = "Trông như đầy đậu.", -- Bụi quả mọng caffein
        DUG_CAFFEINBERRY = "Chỉ cần một chút yêu thương, nó sẽ mọc lại.", -- Đào bụi cây caffeine
        CAFFEINBERRY_BEAN = "Chúng ta có thể làm món ớt con carne với cái này không?", -- Hạt caffeine thô
        CAFFEINBERRY_BEAN_COOKED = "Có vị rất đắng.", -- Hạt caffeine nấu chín

        RUINCACAO_TREE = "Tôi đoán là một cây hang động nhiệt đới khác?", -- Cây Ruincacao
        DUG_RUINCACAO_TREE = "Xuống đất cùng bạn!", -- Đào cây cacao đổ nát
        RUINCACAO_SEED = "Chà, hoa nở rồi!", -- Vật phẩm cây giống Ruincacao
        RUINCACAO_SEED_SAPLING = "Nó sẽ lớn lên và sinh trái đẹp.", -- Cây non Ruincacao
        RUINCACAO = "Dường như có thứ gì đó bên trong và phát ra âm thanh chói tai.", -- Quả Ruincacao trước khi đập vỡ
        RUINCACAO_BEAN = "Tôi không thể ăn món này vì có mùi dầu mỡ.", -- Đậu cacao nghiền nát
        RUINCACAO_BEAN_COOKED = "Nó cực kỳ đắng!", -- Đậu cacao nấu chín

        -- Phụ gia chưng cất

        ADDITIVE_SEED = "Nhứng thứ hạt này có mùi kì kì!", -- Hạt phụ gia cho nhà máy chưng cất rượu (hồi, quả bách xù, họa tiết ngôi sao)
        ADDITIVE_PETALS = "Đây là những thứ thường thấy trong tự nhiên!", -- Phụ gia chưng cất rượu và phụ gia cánh hoa (trà, cánh hoa)
        ADDITIVE_NUT = "Chỉ là tập hợp những thứ cứng cáp thôi!", -- Phụ gia hạt chưng cất rượu (hạt bạch dương, dừa, hạt cà phê, hạt cacao)
        ADDITIVE_DAIRY = "Chúng ta có bị mắng nếu ăn như vậy không?", -- Phụ gia sữa chưng cất rượu

        -- Đồ uống

        WATER_CLEAN = "Đó là nước sạch!", -- Nước sạch
        WATER_DIRTY = "Nước từ ao.", -- Nước bẩn
        WATER_SALTY = "Uống nước biển là điều không nên.", -- Nước mặn

        GOOPYDRINK = "Đồ uống cho trò chơi trừng phạt!", -- Đồ uống thất bại (khái niệm nướng ướt)

        -- Đồ uống ấm trà

        FRUITJUICE = "Nước ép làm từ nhiều loại trái cây.", -- Nước ép trái cây hỗn hợp
        BERRIES_JUICE = "Nước ép mâm xôi!", -- Nước ép quả mọng
        POMEGRANATE_JUICE = "Nó ngon nhưng hơi chua.", -- Nước ép lựu
        BANANA_JUICE = "Hừm, mùi như chuối vậy.", -- Nước chuối
        FIG_JUICE = "Nó khá ngọt!", -- Nước ép quả sung
        DRAGONJUICE = "Bây giờ nó trông giống như thứ gì đó có thể ăn được.", -- Nước ép thanh long
        GLOWBERRYJUICE = "Vị trông thật bắt mắt", -- Nước ép Glowberry
        WATERMELON_JUICE = "Thật sảng khoái!", -- Nước ép dưa hấu

        VEGGIE_TEA = "Đây là set rau trộn!!", -- Nước ép rau củ
        CARROT_TEA = "Tôi không muốn ăn nhiều thế này.", -- Trà cà rốt
        CACTUS_TEA = "Miệng tôi sẽ đầy thịt xương rồng", -- Trà xương rồng
        TOMATO_JUICE = "Vậy đây là nước ép rau hay nước ép trái cây?", 
        LUMPY_TEA = "Nhìn có vẻ đắng và cũng có vị đắng.", 
        SEAWEED_SHAKE = "Nó sẽ trơn và nhầy nhụa.", -- Sinh tố rong biển

            GREENTEA = "Ừm, có mùi lá cây.", -- Trà xanh lá tươi
            BLACKTEA = "Chúng ta cần một số bánh quy kèm theo thứ này.", -- Trà đen
            BLACKTEA_ICED = "Trà đen đá với đá.", -- Trà đen đá
            FUER = "Mưmmm, Đó là một loại trà giải nhiệt.", -- Trà đuôi chồn, trà lá, trà dương xỉ
            MIXFLOWER = "Một loại trà với nhiều cánh hoa khác nhau.",-- Trà hoa thập cẩm
            HIBISCUSTEA = "Nó chuyển sang màu đỏ.", -- Trà dâm bụt
            CACTUSFLOWER_TEA = "Hãy uống ba lần một ngày.", -- Trà hoa xương rồng
            LOTUSTEA = "Trà làm từ hoa sống trong nước.", -- Trà hoa sen
            SUSHIBISCUS = "Tôi nghe nói ta không nên đùa giỡn với thức ăn.", -- Trà tự tử
            MOON_BLOSSOM_TEA = "Có vẻ như mặt trăng ở trong trà.", -- Trà hoa trăng

            CAFFEINBERRY_JUICE = "Đắng!", -- Cà phê đen
            TOFFEE_LATTE = "Trông giống như bánh bơ tan chảy!", -- Toffee nut latte
            RUINCHA_LATTE = "Nó rất ngon, nhưng chúng ta nghe nói không nên uống quá nhiều.", -- Mocha latte (cà phê + sô cô la)

            HOTRUINCOLATE = "Làm ấm cả móng vuốt và dạ dày của chúng tôi.", -- Sôcôla nóng
            RUINCOLATE_SMOOTHIE = "Làm lạnh để giữ cho móng vuốt và dạ dày của chúng ta mát mẻ.", -- Sinh tố sô cô la (lạnh)
            RUINXOCOLATL = "Tôi không muốn uống nó, và anh ta cũng vậy.", -- Chocolatl (cay)
            TEA_RUINCOLATE_LATTE = "Màu sô cô la nóng này trông kỳ lạ.", -- Matcha latte

            MULLED = "Làm cho cơ thể chúng ta ấm lên ngay khi ta uống nó!", -- Bancha
            BUTTERBEER = "Wendy nói với tôi rằng đây là một thức uống ngon từ bộ tiểu thuyết nổi tiếng!", -- Bia bơ trong bộ truyện Harry Potter

            -- Cộng tác Ấm trà Đồ uống

            COCONUT_JUICE = "Vị nó không tệ như cách thức của nó!", -- Nước cốt dừa Castaway
            RAINBOW_SHAKE = "Chúng tôi thích vẻ ngoài đầy màu sắc!", -- Castaway Rainbow Jelly Shake
            QUARTZ_SHAKE = "Mmmm, dù nhìn thế nào thì đây cũng là cá nghiền.", -- Castaway Clown Fish Shake
            CHERRY_ROSEBERRIES_TEA = "Nó có lấy máu từ con nhện ngoài hành tinh đó không?", -- Trà tầm xuân rừng anh đào
            CHERRY_HONEY_TEA = "Ngọt và ấm, nhưng màu lạ!", -- Trà mật ong hoa anh đào rừng anh đào
            SWEET_RICE_DRINK = "Có hạt mềm bên trong!", -- Vita Coop Sikhye
            APPLEPINE_JUICE = "Răng của tôi cảm thấy kỳ lạ sau khi uống thứ này.", -- Nước ép dứa Regione
            CITROYUZU_JUICE = "Tốt nhất là tôi nên tạm dừng việc đánh răng một lúc.", -- Thêm gói thực phẩm Nước cam
            STRAWBERRY_SMOOTHIE = "Uống từ từ để tránh não đơ.", -- More Food Pack Strawberry Smoothie
            STRAWBERRY_MILK_SMOOTHIE = "Đây là món sinh tố dâu tây thật sự!", -- Gói thực phẩm khác Sinh tố sữa dâu

            -- Nhà máy chưng cất đồ uống ấm trà

            SPOILED_DRINK = "Hư hỏng hoàn toàn!", -- Đồ uống bị hỏng

            -- Nhà máy chưng cất soda

            SODA = "Cái này là cái gì? Thật nhạt nhẽo!", -- Soda
            FRUITSODA = "Mmm, soda trái cây ngọt ngào!", -- Soda trái cây
            LIMONSODA = "Thật sảng khoái, nhưng sau đó cổ họng tôi lại cảm thấy dính!", -- Lemon Lime Soda (tốt hơn Fruit Soda)
            COLA = "Tôi chưa bao giờ nghĩ rằng tôi sẽ nhìn thấy điều này một lần nữa!", -- Cola
            COLAQUANTUM = "Soda có màu xanh và thậm chí còn phát sáng!", -- Cola Quantum
            LUMPY_BEER = "Ugh, mùi này lạ quá.", -- Root Beer (không phải rượu thật)

            -- Rượu chưng cất

            CORN_BEER = "Chà! Chúng ta có thể uống thứ này được không?", -- Bia ngô
            MADHU = "Ugh, nó không ngọt chút nào, chỉ là rượu thôi.", -- Madhu (Honey Wine)
            WINE = "Đắng!", -- Rượu (ủ quả mọng thông thường)
            NOBLEWINE = "Nó có thể khá ngọt ấy, Chúng ta thử một chút nhé?", -- Noble Wine (ủ dâu nấu chín)
            SPARKLINGWINE = "Chúng ta muốn lắc nó lên, cơ mà không nên đâu!", -- Sparkling Wine
            GLOWBERRYWINE = "Rượu này đang tỏa sáng!", -- Glow Berry Wine
            KUMIS = "Đây có phải là sữa hư không?", -- Kumis (Sữa cừu lên men)
            LUMPY_WINE = "Thứ này thực sự vừa cay vừa đắng.", -- Soju (rượu mạnh)
            PULQUE = "Nó là rượu trông giống sữa nhưng được tạo ra từ gạo sao?", -- Pulque (cây thùa lên men)
            RUINCACAO_WINE = "Chúng ta trông giống như những thanh sô cô la hơn là nó!", -- Rượu Cacao

            -- Hợp tác Soda

            CHERRY_DOCTOR_COLA = "Nó chỉ giống cola, chứ vị thì chưa chắc, cơ mà chúng tôi thích nó phết!", -- Cherry Forest Doctor Pepper (Tiến sĩ Cherry)
            APPLEPINESODA = "Chúng ta nên uống nó ít thôi nếu không muốn bị sâu răng.", -- Pineapple Soda (Oranchi)
            CITROYUZUSODA = "Là đồ uống có ga vị cam!", -- CITROYUZU Soda (Fanta)
            STRAWBERRYSODA = "Wickerbottom khuyên nên uống đồ uống có ga một cách điều độ.", -- Strawberry Soda (Welch's Strawberry)

            -- Tinh thần hợp tác

            AUROBOW = "Tôi nghe nói họ nghiền những con sứa phát sáng để làm món này.", -- Castaway Aurorabow, Tinh linh sứa cầu vồng
            COCONUT_WINE = "Chúng ta có thể ngửi thấy mùi hương gỗ ngọt ngào từ đây.", -- Rượu dừa Castaway
            CHERRY_BLOOM_MADHU = "Là rượu, nhưng lại có màu hồng!", -- Rượu mật ong hoa anh đào rừng anh đào
            GIANT_BLUEBERRY_WINE = "Trái cây ngon ngọt biến thành rượu.", -- Vita Coop Boom! Berry Sapphire (Nổ khi đánh lửa)
            RICE_WINE = "Đây có phải là sữa làm từ hạt không?", -- Vita Coop Makgeolli (Rượu gạo)
            WHEAT_BEER = "Nó đầy bọt.",-- Thực phẩm Bia lúa mì
            PALE_BEER = "Bia này lạ thật!", -- Regione Pale Ale (Bia màu ngọc lam làm từ trái Monstra)

            -- Rượu chưng cất

            DISINFECTANT = "Vốn dĩ nó được sử dụng để điều trị, nhưng sử dụng nó còn đau đớn hơn.", -- Thuốc khử trùng
            CORN_WHISKEY = "Rượu này thậm chí còn mạnh hơn!", -- Corn Whiskey
            LUMPY_VODKA = "Willow nói uống nó sẽ khiến cổ họng chúng tôi bốc cháy.", -- Vodka
            TEQUILA = "Họ làm rượu từ xương rồng.", -- Tequila
            MADHU_RUM = "Họ làm nó với đường, nhưng tôi không thể uống được!", -- Rum
            BERRY_BRANDY = "Tôi thấy bố giấu cái này trong phòng làm việc!", -- Berry Brandy
            AREUHI = "Món này được làm bằng sữa, nhưng chúng tôi không nghĩ mình có thể nuốt nổi nó.", -- Kumis Spirits Areuhi

            -- Hợp tác Rượu chưng cất (Độc quyền của Warly)

            BERRY_GIN = "Rượu này thậm chí còn có mùi nồng hơn.", -- Gin
            GLOWBERRY_GIN = "Ừmmm, tôi không muốn thử nó đâu.", -- Glow Berry Gin
            ABSINTHE = "Màu xanh lá cây sống động!", -- Absinthe
            TEA_LUMPY_VODKA = "Rượu này làm từ rau củ phải không?", -- Rượu mùi trà xanh
            PETALS_BERRY_BRANDY = "Nó có mùi thơm dễ chịu.", -- Rượu Brandy thơm hoa hồng
            KAHLUA = "Có vẻ như nó sẽ có vị đắng.", -- Coffee Liqueur Kahlua
            NUT_CORN_WHISKEY = "Chúng tôi nghĩ về Woodie có lẽ sẽ thích điều này!", -- Nut Whiskey
            RUINCACAO_CREAM_LIQUEUR = "Ồ! Đây có phải là rượu mùi sôcôla không?", -- Rượu mùi kem Cacao Baileys
            RUMCHATA = "Chỉ cần cho tôi sữa bình thường.", -- Rumchata (Rum trộn với sản phẩm từ sữa)

            -- Hợp tác Rượu chưng cất (Độc quyền của Warly)

            MOONWAY = "Màu sắc thật đẹp!", -- Rượu mùi sứa cầu vồng
            ARRACK = "Chúng ta chỉ nên ăn dừa thôi.", -- Arrack (Phiên bản tiếng Indonesia của Rượu dừa)
            CHERRY_BLOOM_RUM = "Hmm, chúng ta có nên sử dụng thứ này để trang trí nhà cho những người bạn nhện của mình không?", -- Rượu mùi rượu mật ong hoa anh đào trôi nổi trong rừng anh đào
            RICE_SPIRITS = "Thứ, này, không, phải, nước!!!", -- Cheongju (rượu gạo Hàn Quốc)
            WHEAT_WHISKEY = "Tôi thích nó là bánh mì hơn!", -- Whisky lúa mì
            PALE_WHISKEY = "Ugh, loại rượu này lạ thật.", -- Pale Malt Whiskey

            -- Rượu chưng cất hợp tác độc quyền của Warly

            NUT_COCONUT_BRANDY = "Sốc và kinh hãi, ôi những kẻ thua cuộc trên biển!!", -- Coconut Brandy (Được đổi tên thành Caribbean Brandy vì bạn không thể làm rượu Rum Caribbean)
            GIANT_BLUEBERRY_GIN = "Quackowak!", -- Boom Berry Sapphire (Nổ thành cà rốt)

            -- Bí quyết nấu nồi

            DARK_RUINCOLATE = "Warly dường như chưa rang nó, vậy chuyện gì đã xảy ra?", -- Sôcôla đen
            WHITE_RUINCOLATE = "Hãy chia sẻ nó với bạn bè của chúng ta!", -- Sôcôla trắng
            RUINCOLATE = "Thật đậm đà và ngọt ngào!", -- Sôcôla thường
            RUIN_SCHOKAKOLA = "Hmm, hương vị sô cô la hơi nhạt.", -- Schokakola

            -- Bucket Descriptions

            BUCKET_STEEL_EMPTY =
            {
                EMPTY = "Hãy làm lâu đài cát bằng cái này!", -- Xô Thép Rỗng
                FULL = "Nó chứa đầy nước mưa sạch!", -- Nước mưa sạch trong xô
                FULL_ICE = "Nó đông cứng lại!", -- Nước mưa đóng băng thành băng
                DIRTY = "Có vẻ có vài con lăng quăng trong này.", -- Nước mưa trở nên bẩn
                DIRTY_ICE = "Nó đã đóng băng rồi!", -- Nước mưa bẩn đóng băng thành băng
            },

            BUCKET_WOODIE_EMPTY =
            {
                EMPTY = "Có vẻ hơi dễ vỡ khi chúng ta sử dụng làm ghế.", -- Empty Woodie's Bucket
                FULL = "Nó chứa đầy nước mưa sạch!", -- Nước mưa sạch trong xô
                FULL_ICE = "Nó đông cứng lại!", -- Nước mưa đóng băng thành băng
                DIRTY = "Có vẻ có vài con lăng quăng trong này.", -- Nước mưa trở nên bẩn
                DIRTY_ICE = "Nó đã đóng băng rồi!", -- Nước mưa bẩn đóng băng thành băng
            },

            BUCKET_DRIFTWOOD_EMPTY =
            {
                EMPTY = "Hãy đặt những món đồ chơi của chúng ta lên đây và trôi dạt chúng trên biển!", -- Xô gỗ rỗng
                FULL = "Nó chứa đầy nước mưa sạch!", -- Nước mưa sạch trong xô
                FULL_ICE = "Nó đông cứng", -- Nước mưa đóng băng thành băng
                DIRTY = "Có vẻ có vài con lăng quăng trong này.", -- Nước mưa trở nên bẩn
                DIRTY_ICE = "Nó đã đóng băng rồi!", -- Nước mưa bẩn đóng băng thành băng
            },

            BUCKET_EMPTY =
            {
                EMPTY = "Nó hơi nhỏ để bạn bè tôi có thể nhét vào.", -- Xô gỗ rỗng
                FULL = "Nó chứa đầy nước mưa sạch!", -- Nước mưa sạch trong xô
                FULL_ICE = "Nó đông cứng", -- Nước mưa đóng băng thành băng
                DIRTY = "Có vẻ có vài con lăng quăng trong này.", -- Nước mưa trở nên bẩn
                DIRTY_ICE = "Nó đã đóng băng rồi!", -- Nước mưa bẩn đóng băng thành băng
            },

            DESALINATOR =
            {
                EMPTY = "Ngài Khử muối, ông có nước không?", -- Máy khử muối không có nước
                PURIFY_LONG = "Sẽ mất một thời gian để loại bỏ muối!", -- Còn rất nhiều thời gian để thanh lọc
                PURIFY_SHORT = "Bây giờ nước gần như tinh khiết!", -- Quá trình lọc gần như hoàn tất
                HASWATER = "Tôi có thể lấy một ít nước sạch không, thưa ông Máy khử muối?", -- Máy khử muối có nước sạch
                BURNT = "Ngài Khử muối trông không được khỏe.", -- Máy khử muối bị cháy
                HASSALT = "Ngài Khử muối, ngài có thừa muối không?", -- Máy khử muối có thừa muối
            },

            BARREL =
            {
                GENERIC = "Chúng ta có thể trữ nước ở đây.", -- Kiểm tra một cái thùng
                BURNT = "Bây giờ nó sẽ không có ích gì nhiều cho chúng ta.", -- Thùng bị cháy
            },

            BREWERY =
            {
                EMPTY = "Tôi không nghĩ trốn trong thùng này là ý hay đâu!", -- Kiểm tra một nhà máy bia trống
                BURNT = "Tất cả của thứ này đã bị cháy rụi.", -- Nhà máy bia bị cháy
                FERMENTING_LONG = "Sư phụ nói chúng ta phải đợi rất lâu cho việc này.", -- Còn rất nhiều thời gian để lên men
                FERMENTING_SHORT = "Nó sẽ sớm sẵn sàng!", -- Quá trình lên men gần như hoàn tất
                DONE = "Đồ uống đã sẵn sàng!", -- Đồ uống đang ở trong nhà máy bia
            },

            CAMPKETTLE_ITEM = "Tôi sẽ phải mang nó đi bằng một tay!", -- Kiểm tra ấm đun nước di động (vật phẩm)
            CAMPKETTLE =
            {
                GENERIC = "Nó sẽ không hữu ích như thế này.", -- Kiểm tra ấm đun nước cắm trại không có nước
                BOILING_LONG = "Nó chưa đủ nóng làm bỏng tay chúng ta.", -- Mới bắt đầu sôi
                BOILING_SHORT = "Hơi nước đang bốc ra!", -- Gần sôi rồi
                DONE = "Nước sạch!", -- Nước đã sẵn sàng
                STOP = "Nó không còn sôi nữa.", -- Không có lửa dưới ấm
            },

            CAMPDESALINATOR_ITEM = "Tôi sẽ phải mang nó đi bằng nhiều tay!", -- Kiểm tra (vật phẩm) máy khử muối di động
            CAMPDESALINATOR =
            {
                GENERIC = "Nó sẽ không hữu ích như thế này.", -- Kiểm tra máy khử muối trong trại không có nước
                BOILING_LONG = "Vẫn còn nhiều nước biển.", -- Mới bắt đầu khử muối
                BOILING_SHORT = "Hầu hết đã trở thành nước sạch!", -- Gần như đã khử muối xong
                DONE = "Đã đến giờ uống!", -- Nước sạch đã sẵn sàng
                STOP = "Chong chóng đã ngừng quay.", -- Không có lửa dưới máy khử muối
            },

            KETTLE =
            {
                EMPTY = "Cho một số nguyên liệu vào và làm đồ uống!", -- Kiểm tra một chiếc ấm rỗng
                BURNT = "Bây giờ tôi không thể uống bất cứ thứ gì.", -- Ấm đun nước bị cháy
                BOILING_LONG = "Nó chưa sẵn sàng ngay đâu.", -- Mới bắt đầu pha đồ uống
                BOILING_SHORT = "Sắp xong rồi!", -- Đồ uống gần như đã sẵn sàng
                DONE = "Đồ uống đã sẵn sàng!", -- Đồ uống đã được pha
                PURIFY_LONG = "Chúng tôi không thể pha chế đồ uống bằng nước ao như hiện nay.", -- Mới bắt đầu lọc nước bẩn
                PURIFY_SHORT = "Nó gần sạch rồi!", -- Gần xong việc lọc nước bẩn
                HASWATER = "Chúng ta thu thập nguyên liệu nhé?", -- Ấm đun nước có nước sạch
                MELT_LONG = "Nguyên liệu không xay tốt bằng nước đá.", -- Đá vừa bắt đầu tan
                MELT_SHORT = "Hmm, băng gần tan rồi!", -- Băng gần tan rồi
            },

            PORTABLEKETTLE_ITEM =
            {
                GENERIC = "Hãy pha nước trái cây khi đang di chuyển!", -- Kiểm tra ấm đun nước di động (vật phẩm)
                EMPTY = "Ôi, chẳng có gì bên trong cả.", -- Kiểm tra một ấm đun nước di động được đặt trống
                BOILING_LONG = "Mất quá nhiều thời gian.", -- Mới bắt đầu sôi
                BOILING_SHORT = "Đồ uống sẽ sớm sẵn sàng!", -- Gần sôi rồi
                DONE = "Mmm, uống nhanh thôi!", -- Đồ uống đã sẵn sàng
                PURIFY_LONG = "Tôi muốn nhanh chóng biến nó thành đồ uống.", -- Mới bắt đầu lọc nước bẩn
                PURIFY_SHORT = "Sắp sạch rồi!", -- Gần xong việc lọc nước bẩn
                HASWATER = "Hãy thêm một số nguyên liệu!", -- Ấm đun nước di động có nước sạch
                MELT_LONG = "Nguyên liệu không xay tốt bằng nước đá.", -- Đá vừa bắt đầu tan
                MELT_SHORT = "Băng gần như tan rồi.", -- Băng gần tan rồi
            },

            DISTILLERS =
            {
                EMPTY = "Wow, Trông giống như một thiết bị thí nghiệm khoa học khổng lồ.", -- Kiểm tra một máy chưng cất rỗng
                DISTILLTING_LONG = "Sẽ mất một lúc để hoàn thành.", -- Còn rất nhiều thời gian để chưng cất
                DISTILLING_SHORT = "Có cảm giác như cuộc thử nghiệm sẽ sớm kết thúc!", -- Quá trình chưng cất gần như hoàn tất
                DONE = "Hãy xem chúng ta đã làm được gì!", -- Đồ uống được đựng trong máy chưng cất
            },

            WELL_WATERPUMP = {
                HIGH_PRESSURE = "Nó cực kỳ mạnh!", -- Áp lực tối đa
                MIDDLE_PRESSURE = "Nó đang làm việc chăm chỉ.", -- Áp suất trung bình
                LOW_PRESSURE = "Có vẻ như đang cạn kiệt năng lượng.", -- Hầu như không có áp lực
                RECHARG_PRESSURE = "Chúng ta sẽ lấy một ít nước!", -- Không có áp suất (cần đạt mức tối đa)
            },

            WELL_SPRINKLER =
            {
                LOWFUEL = "Hết nhiên liệu.", -- Kiểm tra vòi phun nước có ít nhiên liệu
                ON = "Đã đến giờ vui chơi dưới nước!", -- Vòi phun nước đang bật
                OFF = "Nó đang bắn nước xung quanh.", -- Vòi phun nước đã tắt
            },
        },
    }
