return {
    ACTIONFAIL =
    {
        GIVE =
        {
            WELL_NOTEMPTY = "Nếu bạn định làm điều đó, bạn nên thêm một cái xô khác khi thiết kế nó.", -- Well có một cái xô khô đang treo, nhưng đang cố gắng treo một cái xô khác
            WELL_BUSY = "Dừng lại đi, giếng bị tắc rồi.", -- Giếng có một xô nước treo nhưng đang cố treo một xô khác
        }
    },

    ANNOUNCE_DRUNK = "Hic, tôi không thể làm điều này được nữa...", -- Say rượu
    ANNOUNCE_DRUNK_END = "Bây giờ cảm thấy tốt hơn một chút, tôi có nên cố gắng lấy lại sức không?", -- Tỉnh táo sau khi uống rượu (chảo loạn)
    ANNOUNCE_DRUNK_IMMUNITY = "", -- Tạm thời, chỉ dành cho Wigfrid
    ANNOUNCE_NOTCHARGE = "Hmm... Khi nào con dê này mới cho sữa?", -- Đang cố gắng vắt sữa một con dê Volt không được sạc nên không thể sử dụng xô
    ANNOUNCE_NOTHIRSTSLEEP = "Tôi nên uống nước trước khi ngủ.", -- Khát nhưng cố ngủ vào ban đêm
    ANNOUNCE_NOTHIRSTSIESTA = "Tôi nên uống nước trước khi nghỉ ngơi.", -- Khát nhưng cố gắng nghỉ ngơi trong ngày
    ANNOUNCE_SLEEP_END = "Phew, lần sau tôi không nên uống nhiều như vậy đâu.", -- Tỉnh dậy sau khi ngủ trong cơn say
    ANNOUNCE_THIRST = "Tôi cần uống một ít nước.", -- Khát nước!

    ANNOUNCE_CAFFINE_BUFF_START = "Đã kích hoạt dịch vụ sửa chữa tại chỗ!", -- Bắt đầu sử dụng caffeine
    ANNOUNCE_CAFFINE_BUFF_STOP = "Tôi cần quay lại công việc chế tạo.", -- Kết thúc việc sử dụng caffeine

    ANNOUNCE_CURE_WATERBORNE = "Bây giờ tôi cảm thấy tốt hơn nhiều.", -- Khi chữa khỏi bệnh do đường nước bằng một vật phẩm

    ANNOUNCE_DCAPACITY_CRITICAL = "Thật khó để tập trung...", -- Ngay trước khi say rượu
    ANNOUNCE_DCAPACITY_HALF = "Hmm, tôi nên bắt đầu tiết chế bản thân ngay bây giờ.", -- Bắt đầu say

        DESCRIBE =
        {
            BOILBOOK = "Có đầy đủ các công thức pha chế đồ uống và rượu.",

            WATER_CLEAN_ICE = "Tôi có nên nhai cái này không?", -- Đá sạch
            WATER_DIRTY_ICE = "Trông giống như băng trộn lẫn với bụi.", -- Băng bẩn

            SPICE_CAFFEINPEPPER = "Sẽ thật hoàn hảo nếu tôi có một ít thịt ăn kèm...", -- Gia vị hạt tiêu caffein

            WELL_KIT = "Tôi có nên thử không?", -- Bộ đồ đấy
            WELL_SPRINKLER_KIT = "Được làm tốt và khá phức tạp.", -- Bộ phun nước
            WELL_WATERPUMP_KIT = "Pin không thể đáp ứng được mức tiêu thụ năng lượng.", -- Bộ máy bơm nước hơi nước
            WELL_BURYING_KIT = "Bạn không nên bỏ mặc những cái hố trên mặt đất, anh bạn.", -- Bộ dụng cụ chôn lỗ
            WELL_DRILLING = "Tôi nên cẩn thận để không bị đá bay trúng.", -- Khoan lỗ bằng máy khoan
            WELL_DRILLING_ITEM = "Đảm bảo cố định nó chắc chắn xuống đất trước khi vận hành và tuân thủ các quy tắc an toàn!", -- Mục khoan
            HOLE = "Là cái hố nối với nguồn nước ngầm.", -- Giếng hố
            WELL = "Hmm, tôi tự hỏi liệu có cách nào để tự động hóa việc này không...", -- Chà

            WX78MODULE_NONEDRUNK = "Họ thực sự phải bắt đầu chăm sóc bản thân tốt hơn.", -- 78전용 묘듈

            -- Cây chế độ nước

            TEA_TREE = "Đó là một cái cây nhỏ và xinh xắn.", -- Cây trà
            DUG_TEA_TREE = "Tôi không ngại bị bẩn tay đâu.", -- Cây trà đào lên
            TEA_SEED = "Đây là những gì bạn cần để trồng cây.", -- Hạt giống cây trà
            TEA_SEED_COOKED = "Tôi đoán là tôi có thể ăn được. Nó không phức tạp lắm đâu!", -- Hạt cây trà đã nấu chín
            TEA_SEED_SAPLING = "Cây này vẫn đang phát triển.", -- Cây trà non
            TEALEAVES = "Những chiếc lá này có gì đặc biệt không?", -- Lá trà
            TEALEAVES_DRIED = "Hãy chuẩn bị một ít nước nóng.", -- Lá trà khô

            CAFFEINBERRY = "Hạt cà phê đang nổ tung! Thật tuyệt vời.", -- Bụi quả mọng caffeine
            DUG_CAFFEINBERRY = "Tôi nên trồng lại cây này nếu tôi có đất riêng. Ha!", -- Bụi cây caffeine đào lên
            CAFFEINBERRY_BEAN = "Tôi nên ném nó vào lửa trước nhỉ?", -- Hạt cà phê thô
            CAFFEINBERRY_BEAN_COOKED = "À, mùi thơm của hạt cà phê mới rang!", -- Hạt cà phê rang

            RUINCACAO_TREE = "Hmm, có vẻ như bản thiết kế cành của nó hơi sai.", -- Phá hoại cây cacao
            DUG_RUINCACAO_TREE = "Càng nhìn càng thấy lạ.", -- Cây cacao bị đào lên
            RUINCACAO_SEED = "Trong quả nó có hoa không?", -- Làm hỏng cây cacao
            RUINCACAO_SEED_SAPLING = "Giờ nghĩ lại tôi thấy hơi kỳ lạ.", -- Trồng cây cacao bị hủy hoại
            RUINCACAO = "Vậy đây là than hay trái cây?", -- Ruin cacao
            RUINCACAO_BEAN = "Tôi không nghĩ thứ này sẽ sớm biến thành dầu ăn được.", -- Làm hỏng hạt cacao
            RUINCACAO_BEAN_COOKED = "Tôi cho là nó có thể nhai được.", -- Hạt cacao rang hỏng

            -- Phụ gia chưng cất

            ADDITIVE_SEED = "Thu thập một số hạt lạ.", -- Phụ gia cho rượu mùi (hồi, quả bách xù, họa tiết hình bát giác)
            ADDITIVE_PETALS = "Bó lá và cánh hoa.", -- Phụ gia cho rượu mùi (thảo mộc, lá trà, cánh hoa)
            ADDITIVE_NUT = "Không thu thập những thứ này để ăn vặt.", -- Phụ gia cho rượu mùi (cây ngưu bàng, dừa, hạt cà phê, hạt cacao)
            ADDITIVE_DAIRY = "Đó là kem sữa.", -- Phụ gia sữa cho rượu mùi

            -- Đồ uống

            WATER_CLEAN = "Tôi nên biết ơn nước sạch, dù chỉ một ngụm.", -- Nước sạch
            WATER_DIRTY = "Dù có tuyệt vọng đến đâu, tôi cũng không nên uống nước tù đọng.", -- Nước bẩn
            WATER_SALTY = "Uống nước biển là tự tử.", -- Nước mặn

            GOOPYDRINK = "Bleh.", -- Đồ uống thất bại (khái niệm về chất bẩn ướt)

            -- Đồ uống ấm trà

            FRUITJUICE = "Có đủ mọi thứ trong đó.", -- Nước ép trái cây hỗn hợp
            BERRIES_JUICE = "Tôi sẽ không để nước ép dính vào tay đâu.", -- Nước ép quả mọng
            POMEGRANATE_JUICE = "Cuối cùng thì ăn quả này cũng sạch.", -- Nước ép lựu
            BANANA_JUICE = "Tôi thực sự không yêu cầu trà chuối ấm.", -- Nước chuối
            FIG_JUICE = "Kết cấu độc đáo.", -- Nước ép quả sung
            DRAGONJUICE = "Đó là nước ép cao cấp.", -- Nước ép thanh long
            GLOWBERRYJUICE = "Nó giống như các hợp chất bên trong que phát sáng.", -- Nước ép Glowberry
            WATERMELON_JUICE = "Sáng mát.", -- Nước ép dưa hấu

            VEGGIE_TEA = "Điều này sẽ giúp tôi lấy lại năng lượng.", -- Nước ép rau củ
            CARROT_TEA = "Đó chính là thứ tôi cần vào một ngày se lạnh.", -- Trà cà rốt
            CACTUS_TEA = "Ngay cả khi có gai, nó cũng trở nên nhão.", -- Trà xương rồng
            TOMATO_JUICE = "Tôi chưa bao giờ thực sự tìm kiếm nó, nhưng nó rất ngon.", -- Nước ép cà chua
            LUMPY_TEA = "Nó không tệ như tôi nghĩ. Không sao đâu.", -- Trà sần
            SEAWEED_SHAKE = "Hmm...nó có thể tốt cho chứng táo bón.", -- Rong biển lắc

            GREENTEA = "Nó có mùi thơm thoang thoảng.", -- Trà xanh
            BLACKTEA = "Tôi thích cà phê hơn, nhưng nếu không có gì khác thì tôi sẽ uống cái này.", -- Trà đen
            BLACKTEA_ICED = "Tôi nên uống nó sau khi đổ mồ hôi.", -- Trà đen đá
            FUER = "Thật ngạc nhiên là mùi thơm không tệ.", -- Trà thảo dược, trà lá, trà dương xỉ
            MIXFLOWER = "Có vẻ hợp với gu tinh tế của quý cô.", -- Trà cánh hoa hỗn hợp
            HIBISCUSTEA = "Mặc dù không có trái cây nhưng nó có vị thơm và ngọt.", -- Trà dâm bụt
            CACTUSFLOWER_TEA = "Có vẻ như đây là xu hướng pha trà từ hoa.", -- Trà hoa xương rồng
            LOTUSTEA = "Nó khá lạ.", -- Trà sen
            SUSHIBISCUS = "Có rất nhiều loại trà khác nhau.", -- Trà tự sát
            MOON_BLOSSOM_TEA = "Phew! Tâm trí tôi giờ đã tỉnh táo rồi.", -- Trà hoa trăng

            CAFFEINBERRY_JUICE = "Tôi thường dựa vào điều này khi làm việc vào đêm khuya.", -- Cà phê đen
            TOFFEE_LATTE = "Tôi thích cà phê không đường hơn.", -- Toffee nut latte
            RUINCHA_LATTE = "Cà phê và sô cô la, chọn cái nào?", -- Mocha latte (cà phê + sô cô la)

            HOTRUINCOLATE = "Ấm áp.", -- Sôcôla nóng
            RUINCOLATE_SMOOTHIE = "Tôi đã thấy những thứ này trong cửa hàng, nhưng tôi chưa bao giờ mua.", -- Sinh tố sô cô la (lạnh)
            RUINXOCOLATL = "Hương vị đậm đà như khói thải.", -- Xocolatl (vị đắng)
            TEA_RUINCOLATE_LATTE = "Thật khó hiểu, đây là trà sữa hay sinh tố sô cô la?", -- Matcha sô cô la latte

            MULLED = "Tôi không phải là phụ nữ với lò sưởi, nhưng tôi thích một ly!", -- Mulled wine
            BUTTERBEER = "Công nghệ quá tiên tiến cũng có thể kỳ diệu như chính phép thuật vậy.", -- Butterbeer trong bộ truyện Harry Potter

            -- Hợp tác Ấm trà Đồ uống

            COCONUT_JUICE = "Ngọt ngào và sảng khoái.", -- Nước cốt dừa đắm tàu
            RAINBOW_SHAKE = "Tôi có nên thử cầu vồng này không?", -- Thạch Cầu Vồng Shipwrecked
            QUARTZ_SHAKE = "Cái này chắc là đủ rồi.", -- Thạch lắc thạch anh đắm tàu
            CHERRY_ROSEBERRIES_TEA = "Vị chua càng khiến món ăn ngon hơn.", -- Trà Tầm Xuân Rừng Anh Đào
            CHERRY_HONEY_TEA = "Tôi nên uống một cốc để lọc bụi trong cổ họng.", -- Trà mật ong hoa anh đào rừng anh đào
            SWEET_RICE_DRINK = "Hmm, nó khá ngọt.", -- Vita Hyup Sikhye
            ANANAS_JUICE = "Chắc chắn tốt hơn chất lỏng trong đồ hộp.", -- Vùng nước ép dứa Lekia
            ORANGE_JUICE = "Tôi chưa bao giờ thấy ngày nào mà không có thứ này trong tủ lạnh Tangbisil.", -- Thêm gói thực phẩm Nước cam
            STRAWBERRY_SMOOTHIE = "Đó là hương vị mà những người phụ nữ sẽ yêu thích, à, tôi cũng vậy. Hm!", -- Thêm gói thực phẩm Sinh tố dâu tây
            STRAWBERRY_MILK_SMOOTHIE = "Nó có vị giống đồ uống tráng miệng ở quán trà.", -- Thêm gói thực phẩm Sinh tố sữa dâu

            -- Nhà máy chưng cất đồ uống ấm trà

            SPOILED_DRINK = "Thậm chí không phù hợp cho sử dụng công nghiệp.", -- Đồ uống hư hỏng

            -- Nước ngọt chưng cất

            SODA = "Nước có ga nguyên chất.", -- Nước Soda
            FRUITSODA = "Tôi không cần uống thứ này trừ khi tôi đi dự tiệc.", -- Fruit Soda
            LEMONLIMESODA = "Răng của tôi sẽ bị thối vì thứ này.", -- Lemon Lime Soda (soda trái cây cao cấp hơn)
            COLA = "Nếu tôi cố uống thì người khác đã uống hết rồi.", -- Cola
            COLAQUANTUM = "Ồ, uống thứ này có an toàn không?", -- Cola Quantum
            LUMPY_BEER = "Nó ngon hơn cola, nhưng không có ai đứng về phía tôi cả.", -- Root Beer (không cồn)

            -- Rượu chưng cất

            CORN_BEER = "Thật phù hợp để uống sau giờ làm việc!", -- Bia ngô
            MADHU = "Tôi nghĩ Wigfrid sẽ thích cái này.", -- Mead
            WINE = "Tôi không có thời gian để thưởng thức hương thơm, tôi có cả núi việc phải làm.", -- Rượu (bia loại quả mọng thông thường)
            NOBLEWINE = "Những điều tốt đẹp như vậy còn xa vời với tôi.", -- Noble Wine (bia nấu chín)
            SPARKLINGWINE = "Bạn phải lắc nó trước mặt Max.", -- Sparkling Wine
            GLOWBERRYWINE = "Sự lãng mạn của việc pha chế tại nhà.", -- Glow Berry Wine
            KUMIS = "Đây là lần đầu tiên tôi thấy sữa được dùng để làm rượu.", -- Kumis, Sữa bò lên men
            LUMPY_WINE = "Nó có hương vị khá sảng khoái phải không?", -- Sake (rượu ủ)
            PULQUE = "Thật tuyệt vời khi bạn có thể làm ra rượu từ xương rồng.", -- Pulque (Rượu xương rồng)
            RUINCACAO_WINE = "Nếu rượu vang có thể được làm từ cacao thì mọi thứ đều có thể làm được.", -- Cacao Wine

            -- Nước ngọt hợp tác

            CHERRY_DOCTOR_COLA = "Đây không phải là cola.", -- Cherry Forest Dr. Pepper (Tiến sĩ Cherry)
            ANANASSODA = "Có vị như soda dứa mua ở cửa hàng.", -- Pineapple Soda (Oranch Soda)
            ORANGESODA = "Nó có vị như soda cam mua ở cửa hàng.", -- Orange Soda (Frontera)
            STRAWBERRYSODA = "Tôi không ngạc nhiên khi có soda vị dâu.", -- Strawberry Soda (Welch's Strawberry)

            -- Tinh thần hợp tác

            AUROBOW = "Rượu cầu vồng, tuy nhiên thành phần có hơi khác thường.", -- Aurobow bị đắm tàu, Rượu thạch cầu vồng
            COCONUT_WINE = "Đó là rượu từ trái cọ.", -- Rượu dừa đắm tàu
            CHERRY_BLOOM_MADHU = "Bây giờ cỏ không giống nhau.", -- Rượu mật ong hoa anh đào rừng anh đào (Cầu vồng tạo bọt: Khi kiểm tra mật ong hoa anh đào với bài phát biểu của Winona 'Tôi không chắc đây là mật ong hay keo.', có một đoạn hội thoại có nội dung 'Đây là mật ong hay 'Cầu vồng tạo bọt'?')
            GIANT_BLUEBERRY_WINE = "Không có lý do gì bạn không thể làm rượu vang từ quả việt quất.", -- Vita Hyup Boom Berry Wine (Nổ khi đốt)
            RICE_WINE = "Rượu bây giờ khá trong!", -- Cheongju
            WHEAT_BEER = "Tôi nên uống một chút sau giờ làm việc!", -- Heap of Food Wheat Beer
            PALE_BEER = "Màu bia này có vấn đề gì vậy?", -- Vùng Lekia Pale Ale (Bia xanh làm từ trái cây Monstera)

            -- Rượu chưng cất

            DISINFECTANT = "Để điều trị khẩn cấp.", -- Thuốc khử trùng
            CORN_WHISKEY = "Tôi thích uống nhiều hơn là nhấm nháp.", -- Corn Whiskey
            LUMPY_VODKA = "Tôi nên giữ thứ này cho đến khi thời tiết lạnh hơn.", -- Vodka
            TEQUILA = "Mùi thơm khá đậm!", -- Tequila
            MADHU_RUM = "Thời đại thủy thủ trộn rượu rum với nước để bảo quản đã qua lâu rồi.", -- Rum
            BERRY_BRANDY = "Tôi không thường xuyên có cơ hội uống những loại rượu đắt tiền như thế này.", -- Berry Brandy
            AREUHI = "Đây là một loại rượu chưng cất không quen thuộc.", -- Krampus Rượu chưng cất Areuhi

            -- Rượu chưng cất độc quyền của Walani

            BERRY_GIN = "Nhờ điều này mà tôi đã có được khá nhiều bạn bè ở dưới.", -- Gin
            GLOWBERRY_GIN = "Tôi tự hỏi nó sẽ tiếp tục tỏa sáng trong bao lâu? Có lẽ là năng lượng vô hạn chăng?", -- Glow Berry Gin
            ABSINTHE = "Ít nhất chúng tôi không trộn nó với đồng sunfat!", -- Absinthe
            TEA_LUMPY_VODKA = "Nó có khác với rượu absinthe không?", -- Rượu mùi trà xanh
            PETALS_BERRY_BRANDY = "Có vẻ khá sang trọng.", -- Rose Petal Brandy
            KAHLUA = "Tôi nghĩ tôi sẽ phải uống rượu và cà phê riêng.", -- Coffee Liqueur Kahlua
            NUT_CORN_WHISKEY = "Mùi hương nồng nàn như chì.", -- Nut Whiskey
            RUINCACAO_CREAM_LIQUEUR = "Có một loại rượu mùi ngọt ngào như thế này à?", -- Baileys Cacao Cream Liqueur
            RUMCHATA = "Sữa cho người lớn!", -- Rumchata

            -- Hợp tác chưng cất rượu mạnh

            MOONWAY = "Nó có vẻ chứa nhiều calo. Có thể dùng làm nhiên liệu được không?", -- Tinh Linh Chưng Cất Sứa Cầu Vồng
            ARRACK = "Có mùi như nhựa cây cọ.", -- Arrack phiên bản rượu dừa của Indonesia
            CHERRY_BLOOM_RUM = "Trông giống như một món quà lưu niệm ở sân bay, nhưng cuối cùng chúng đều giống nhau.", -- Rượu mật ong hoa anh đào chưng cất cánh hoa nổi
            RICE_SPIRITS = "Bây giờ trời khá trong rồi!", -- Rượu gạo
            WHEAT_WHISKEY = "Không uống rượu khi làm việc.", -- Wheat Whiskey
            PALE_WHISKEY = "Tôi chưa bao giờ thấy loại rượu chưng cất có màu này trước đây.", -- Pale Malt Whiskey

            -- Hợp tác độc quyền của Walani Rượu chưng cất

            NUT_COCONUT_BRANDY = "Nó có mùi khá ngọt.", -- Coconut Brandy (Thay thế rượu Rum Caribbean vì cô ấy không thể làm được)
            GIANT_BLUEBERRY_GIN = "Có vẻ phù hợp cho sử dụng công nghiệp hơn là tiêu dùng.", -- Boom Berry Sapphire (Nổ nếu tiêu thụ)

            -- Món ăn nấu bằng chưng cất

            DARK_RUINCOLATE = "Có phải một người bạn đã chuẩn bị món này cho tôi để ăn nhẹ trong khi làm việc chậm phải không?", -- Sôcôla đen
            WHITE_RUINCOLATE = "Ồ, Wally, bạn biết tôi không thích đồ ngọt mà.", -- Sôcôla trắng
            RUINCOLATE = "Nó dễ tan nên tôi không ăn nó thường xuyên.", -- Plain Chocolate
            RUIN_SCHOKAKOLA = "Cái này không dễ tan chảy và nó có vỏ. Tôi cũng có thể tăng thêm sức mạnh khi làm việc.", -- Schokakola

            BUCKET_STEEL_EMPTY =
            {
                EMPTY = "Có vẻ như được làm tốt và chắc chắn.", -- Thùng thép rỗng
                FULL = "Nước mưa đã được thu thập.", -- Nước mưa sạch đã được thu thập
                FULL_ICE = "Sẽ phải nỗ lực để loại bỏ nó.", -- Nước mưa đã đóng băng
                DIRTY = "Có vẻ như nó cần được dọn dẹp sạch sẽ.", -- Nước mưa đã trở nên bẩn
                DIRTY_ICE = "Có phải họ quên dọn dẹp và đổ nó vào giữa mùa đông lạnh giá không?", -- Nước mưa bẩn đã đóng băng
            },

            BUCKET_WOODIE_EMPTY =
            {
                EMPTY = "Tôi nghi ngờ về độ bền của nó.", -- Thùng gỗ rỗng của Woody
                FULL = "Nước mưa đã được thu thập.", -- Nước mưa sạch đã được thu thập
                FULL_ICE = "Sẽ phải nỗ lực để loại bỏ nó.", -- Nước mưa đã đóng băng
                DIRTY = "Có vẻ như nó cần được dọn dẹp sạch sẽ.", -- Nước mưa đã trở nên bẩn
                DIRTY_ICE = "Có phải họ quên dọn dẹp và đổ nó vào giữa mùa đông lạnh giá không?", -- Nước mưa bẩn đã đóng băng
            },

            BUCKET_DRIFTWOOD_EMPTY =
            {
                EMPTY = "Ai chà, thứ đó chắc hẳn không thể nào đạt đủ chất lượng an toàn vệ sinh!", -- Thùng gỗ rỗng
                FULL = "Nước mưa đã được thu thập.", -- Nước mưa sạch đã được thu thập
                FULL_ICE = "Sẽ phải nỗ lực để loại bỏ nó.", -- Nước mưa đã đóng băng
                DIRTY = "Có vẻ như nó cần được dọn dẹp sạch sẽ.", -- Nước mưa đã trở nên bẩn
                DIRTY_ICE = "Có phải họ quên dọn dẹp và đổ nó vào giữa mùa đông lạnh giá không?", -- Nước mưa bẩn đã đóng băng
            },

            BUCKET_EMPTY =
            {
                EMPTY = "Tôi nên cho gì vào đây?", -- Thùng gỗ rỗng
                FULL = "Nước mưa đã được thu thập.", -- Nước mưa sạch đã được thu thập
                FULL_ICE = "Sẽ phải nỗ lực để loại bỏ nó.", -- Nước mưa đã đóng băng
                DIRTY = "Có vẻ như nó cần được dọn dẹp sạch sẽ.", -- Nước mưa đã trở nên bẩn
                DIRTY_ICE = "Có phải họ quên dọn dẹp và đổ nó vào giữa mùa đông lạnh giá không?", -- Nước mưa bẩn đã đóng băng
            },

            DESALINATOR =
            {
                EMPTY = "Họ đã suy nghĩ rất nhiều khi thiết kế cái này.", -- Không có nước trong máy khử muối
                PURIFY_LONG = "Để xem... độ mặn vẫn khá cao.", -- Vẫn còn một chặng đường dài để thanh lọc
                PURIFY_SHORT = "Bây giờ nó không quá mặn phải không?", -- Quá trình thanh lọc gần như hoàn tất
                HASWATER = "Không đảm bảo bên trong không phải nước biển.", -- Nước sạch có trong máy khử muối
                BURNT = "Điều này thật khó chịu.", -- Máy khử muối bị cháy
                HASSALT = "Muối cần được loại bỏ khỏi hộp lọc.", -- Còn muối trong máy khử muối
            },

            BARREL =
            {
                GENERIC = "Woody và tôi cùng chụm đầu lại để đảm bảo nước không bị hỏng.", -- Kiểm tra thùng
                BURNT = "Không sao đâu, chúng ta có thể làm cái khác.", -- Thùng đã cháy rồi
            },

            BREWERY =
            {
                EMPTY = "Tôi nói cho bạn biết trong đó có một số loại gỗ đắt tiền!", -- Kiểm tra nhà máy bia
                BURNT = "Dù nhìn thế nào đi nữa thì điều này thật đáng phẫn nộ.", -- Nhà máy bia đã cháy rồi
                FERMENTING_LONG = "Rốt cuộc thì quá trình lên men cũng mất một khoảng thời gian.", -- Còn một chặng đường dài cho đến khi quá trình lên men hoàn tất
                FERMENTING_SHORT = "Sắp xong rồi phải không?", -- Quá trình lên men gần như hoàn tất
                DONE = "Chúng ta nếm thử bây giờ nhé?", -- Có đồ uống trong nhà máy bia
            },

            CAMPKETTLE_ITEM = "Nặng hơn một chút so với loại do nhà máy sản xuất.", -- Kiểm tra hạng mục ấm đun nước di động
            CAMPKETTLE =
            {
                GENERIC = "Tôi cần lấy một ít nước cho nó.", -- Không có nước trong ấm cắm trại trong lò sưởi
                BOILING_LONG = "Nhiệt độ vẫn còn khoảng 68°F.", -- Bắt đầu đun sôi nước
                BOILING_SHORT = "Nó đang sôi ở 192,2°F.", -- Nước gần sôi
                DONE = "Đã đến lúc nghỉ ngơi!", -- Đã lấy được nước sạch
                STOP = "Ồ, không có nhiên liệu thì không sôi.", -- Lò sưởi không có lửa nên nước bẩn không sôi
            },

            CAMPDESALINATOR_ITEM = "Người ta nói là 'Di động' nhưng nó khá nặng.", -- Kiểm tra thiết bị khử muối trong trại
            CAMPDESALINATOR =
            {
                GENERIC = "Một hộp rỗng.", -- Không có nước trong máy khử muối của trại
                BOILING_LONG = "Mực nước biển vẫn còn cao.", -- Bắt đầu đun sôi nước biển
                BOILING_SHORT = "Mực nước ngọt hiện đã cao hơn.", -- Nước gần sôi
                DONE = "Đã thu được nước ngọt!", -- Đã có được nước sạch
                STOP = "Nó cần nhiên liệu.", -- Không có lửa trong lò sưởi nên nước mặn sẽ không lọc được
            },

            KETTLE =
            {
                EMPTY = "Tôi sắp pha một tách cà phê thật phong cách.", -- Kiểm tra ấm đun nước rỗng
                BURNT = "Tôi có làm quá tay không?", -- Ấm đun nước đã cháy rồi
                BOILING_LONG = "Vẫn cần thêm thời gian.", -- Mới bắt đầu nấu đồ uống
                BOILING_SHORT = "Sắp xong rồi.", -- Nấu đồ uống gần xong
                DONE = "Giải lao!", -- Đồ uống đã sẵn sàng
                PURIFY_LONG = "Nhiệt độ vẫn còn khoảng 68°F.", -- Mới bắt đầu đun sôi nước bẩn
                PURIFY_SHORT = "Nó đang sôi ở 192,2°F.", -- Nước bẩn gần sôi xong
                HASWATER = "Xem nào, nếu có cà phê thì tốt quá.", -- Có nước sạch bên trong
                MELT_LONG = "Nó vẫn đông cứng.", -- Băng vừa bắt đầu tan
                MELT_SHORT = "Băng gần hết rồi.", -- Băng gần tan
            },

            PORTABLEKETTLE_ITEM =
            {
                GENERIC = "Về chất lượng thì không thua gì ấm trà sản xuất tại xưởng.", -- Kiểm tra hạng mục ấm đun nước di động
                EMPTY = "Không có một giọt nước nào trong đó.", -- Kiểm tra ấm đun nước di động trống đã đặt
                BOILING_LONG = "Rốt cuộc thì những điều tốt đẹp cũng cần có thời gian.", -- Mới bắt đầu đun sôi đồ uống
                BOILING_SHORT = "Mọi việc sẽ xong trong chớp mắt!", -- Đồ uống gần như đã được nấu xong
                DONE = "Có xứng đáng với nỗ lực đó không?", -- Đồ uống đã sẵn sàng
                PURIFY_LONG = "Vẫn còn ấm.", -- Mới bắt đầu đun sôi nước bẩn
                PURIFY_SHORT = "Tôi có thể nghe thấy tiếng bong bóng.", -- Nước bẩn gần sôi
                HASWATER = "Bây giờ tôi cần thêm nguyên liệu.", -- Bên trong có nước sạch
                MELT_LONG = "Tất cả đều ở dạng rắn đông cứng.", -- Băng vừa bắt đầu tan
                MELT_SHORT = "Băng gần tan rồi.", -- Băng gần tan rồi
            },

            DISTILLERS =
            {
                EMPTY = "Được thiết kế để chịu được nhiệt và áp suất.", -- Kiểm tra máy chưng cất
                DISTILLTING_LONG = "Đồng hồ đếm giờ hầu như không di chuyển.", -- Vẫn còn một chặng đường dài để chưng cất
                DISTILLING_SHORT = "Sẽ không lâu nữa đâu.", -- Quá trình chưng cất gần như đã hoàn tất
                DONE = "Chúng ta nếm thử bây giờ nhé?", -- Có đồ uống trong máy chưng cất
            },

            WELL_WATERPUMP = {
                HIGH_PRESSURE = "Mở nước với áp suất xấp xỉ 123 psi.", -- Áp suất tối đa
                MIDDLE_PRESSURE = "Mở nước với áp suất xấp xỉ 81 psi.", -- Áp suất ở giữa
                LOW_PRESSURE = "Mở nước với áp suất xấp xỉ 47 psi.", -- Hầu như không có áp suất
                RECHARG_PRESSURE = "Ở áp suất này, sẽ mất rất nhiều thời gian để rút nước.", -- Không có áp suất (không thể sử dụng cho đến khi áp suất tối đa)
            },

            WELL_SPRINKLER =
            {
                LOWFUEL = "Nó cần tiếp nhiên liệu.", -- Kiểm tra vòi phun nước giếng có ít nhiên liệu
                ON = "Đừng đến gần thiết bị của tôi.", -- Nó đang hoạt động
                OFF = "Một số bộ phận hoạt động 'kỳ diệu' khi tắt.", -- Kiểm tra vòi phun nước giếng khi tắt
            },
        },
    }