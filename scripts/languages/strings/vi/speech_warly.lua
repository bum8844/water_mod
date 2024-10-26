return {
    ACTIONFAIL =
    {
        GIVE =
        {
            WELL_NOTEMPTY = "Trước tiên hãy giải quyết vấn đề xô đầy.", -- Cố gắng đưa xô đầy khi giếng không trống
            WELL_BUSY = "Rất tiếc, có vẻ như cái xô đang trên đường rơi xuống.", -- Cố gắng đưa cái xô khi nó đã ở trong giếng
        }
    },

    ANNOUNCE_DRUNK = "Nấc cụt, tui đã cố nhắc nhở bản thân phải thưởng thức, chứ không để say mèm thế này....", -- Say rượu

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

    ANNOUNCE_DRUNK_END = "Hừm... tôi nghĩ tôi nên cần chuẩn bị một bữa ăn để giải quyết tàn dư của cơn say này.", -- Tỉnh táo sau cơn say (nôn nao)
    ANNOUNCE_DRUNK_IMMUNITY = "", -- Tạm thời. Chỉ dành cho Wigfrid.
    ANNOUNCE_NOTCHARGE = "Vắt sữa bây giờ sẽ không mang lại kết quả gì.", -- Cố gắng vắt sữa Dê Điện mà không cần sạc điện
    ANNOUNCE_NOTHIRSTSLEEP = "Cơn khát của tôi còn gay gắt hơn cơn mệt mỏi của mình!", -- Cố gắng ngủ vào ban đêm với ít khát nước
    ANNOUNCE_NOTHIRSTSIESTA = "Cơn khát của tôi còn gay gắt hơn cơn mệt mỏi của mình!", -- Cố gắng ngủ trưa trong ngày với mức độ khát nước thấp
    ANNOUNCE_SLEEP_END = "À... Lần sau tôi phải thận trọng hơn và tránh uống quá nhiều.", -- Thức dậy sau khi ngủ và hoàn toàn tỉnh táo
    ANNOUNCE_THIRST = "Tôi phải uống gì đó...", -- Rất khát

    ANNOUNCE_CAFFINE_BUFF_START = "À, tôi cảm thấy như được tiếp thêm sinh lực!", -- Bắt đầu sử dụng caffeine
    ANNOUNCE_CAFFINE_BUFF_STOP = "Tôi khao khát một ly cà phê espresso mới pha.", -- Kết thúc cơn mê caffeine

    ANNOUNCE_CURE_WATERBORNE = "Dạ dày của tôi đã ổn định lại một chút.", -- Wigfrid từ chối uống nước bị ô nhiễm

    ANNOUNCE_DCAPACITY_CRITICAL = "Tôi nên ngưng uống lại.", -- Gần như say rượu
    ANNOUNCE_DCAPACITY_HALF = "Uừmm, tôi cảm thấy hơi say say rồi.", -- Bắt đầu cảm nhận được tác dụng của việc uống rượu

    DESCRIBE =
    {
        BOILBOOK = "Tôi cũng nên ghi lại một số công thức pha chế cocktail.",

        WATER_CLEAN_ICE = "Tôi có nên xay mịn để làm đá bào không?", -- Đá sạch
        WATER_DIRTY_ICE = "Tôi không thể sử dụng đá bẩn này để nấu ăn.", -- Đá bẩn

        SPICE_CAFFEINPEPPER = "Nó làm tăng hương vị của bất kỳ món ăn nào.", -- Gia vị hạt tiêu caffein

        WELL_KIT = "Giá như bây giờ có một nguồn nước sạch thì tốt biết mấy.", -- Well Kit
        WELL_SPRINKLER_KIT = "Tôi có thể dễ dàng phục vụ nước cho khách trong vườn của mình bằng cái này.", -- Bộ phun nước
        WELL_WATERPUMP_KIT = "Giống như máy lọc nước!", -- Bộ bơm nước bằng hơi nước
        WELL_BURYING_KIT = "Nếu như ai đó trượt chân vào cái lỗ kia thì quả thật là một tai nạn đầy đáng tiếc!", -- Bộ chôn lỗ
        WELL_DRILLING = "Nó sẽ tìm mạch nước và đào lên.", -- Khoan lỗ bằng máy khoan
        WELL_DRILLING_ITEM = "Nó sẽ tìm mạch nước và đào lên.", -- Vật phẩm khoan
        HOLE = "Tôi có thể nghe thấy tiếng nước chảy.", -- Lỗ giếng
        WELL = "Hãy mở rộng nguồn cung cấp nước uống của chúng ta!", -- Vâng

        WX78MODULE_NONEDRUNK = "Thứ đó mang lại cho người bạn kim loại của chúng ta thêm một chút niềm say mê, phải không?", -- 78전용 묘듈

        -- Mod cây ngập nước

        TEA_TREE = "Tôi cho là thường được tìm thấy ở bên kia biển.", -- Cây trà
        DUG_TEA_TREE = "Tôi sẽ tìm nguồn cung cấp lá trà tại địa phương.", -- Cây trà đào từ mặt đất
        TEA_SEED = "Không biết bên trong hạt này có gì nhỉ.", -- Hạt cây trà
        TEA_SEED_COOKED = "Tôi là người phải tìm ra cách sử dụng thứ này trong nấu ăn.", -- Hạt cây trà đã rang
        TEA_SEED_SAPLING = "Nó vẫn còn khá non.", -- Cây non trà
        TEALEAVES = "Tôi nên xử lý chúng trước.", -- Lá trà
        TEALEAVES_DRIED = "Bây giờ, tất cả những gì tôi cần là nước nóng...", -- Lá trà khô

        CAFFEINBERRY = "Giá như nó mọc hạt cà phê vào mỗi buổi sáng.", -- Bụi cà phê
        DUG_CAFFEINBERRY = "Đây là cà phê mang đi.", -- Bụi cà phê đào từ mặt đất
        CAFFEINBERRY_BEAN = "Đợi đã, nó có chút... mùi thơm của hạt tiêu...?", -- Hạt cà phê thô
        CAFFEINBERRY_BEAN_COOKED = "Tuyệt vời!", -- Hạt cà phê rang

        RUINCACAO_TREE = "Bạn thường phải vượt biển để tìm thấy những thứ này.", -- Cây Cacao
        DUG_RUINCACAO_TREE = "Tôi có nên hồi sinh nó không?", -- Cây cacao đào từ lòng đất
        RUINCACAO_SEED = "Thật lạnh sống lưng.", -- Vật phẩm cây giống Cacao
        RUINCACAO_SEED_SAPLING = "Loài hoa này có màu sắc thật kỳ lạ phải không?", -- Trồng cây cacao
        RUINCACAO = "Tôi nên kiểm tra xem bên trong có gì.", -- Vỏ cacao nguyên khối
        RUINCACAO_BEAN = "Ugh, mùi dầu mỡ đó!", -- Vỏ cacao vỡ
        RUINCACAO_BEAN_COOKED = "Tôi không thể ăn nó như thế này được.", -- Vỏ cacao rang

        -- Phụ gia chưng cất

        ADDITIVE_SEED = "Tôi sẽ thêm thứ này để tăng hương vị của rượu mạnh.", -- Hạt phụ gia rượu (hồi, quả bách xù hoặc họa tiết ngôi sao)
        ADDITIVE_PETALS = "Nó mang lại cảm giác sang trọng cho rượu mạnh.", -- Phụ gia rượu hoặc cánh hoa
        ADDITIVE_NUT = "Điều này sẽ mang lại cho rượu mạnh một mùi thơm độc đáo.", -- Hạt phụ gia rượu (hạt burchi, dừa, hạt cà phê hoặc hạt cacao)
        ADDITIVE_DAIRY = "Hoàn hảo để pha chế đồ uống dành cho người mới bắt đầu.", -- Sản phẩm sữa phụ gia rượu

        -- Đồ uống

        WATER_CLEAN = "Tinh khiết, vô vị dùng để nấu ăn!", -- Nước sạch
        WATER_DIRTY = "Tôi không thể dùng nước này để nấu ăn.", -- Nước bẩn
        WATER_SALTY = "Bạn có chắc thứ này đủ đạt để làm nước dùng không?", -- Saltwater

        GOOPYDRINK = "Đây là một thứ hỗn mang! Hoàn toàn là một thứ hỗn mang thuần khiết!", -- Đồ uống thất bại (đồ uống ướt) - Câu nói của Gordon Ramsay

        -- Đồ uống ấm trà

        FRUITJUICE = "Đó là sự pha trộn của nhiều hương vị trái cây khác nhau!", -- Nước ép trái cây hỗn hợp
        BERRIES_JUICE = "Đơn giản, hơi chua và ngọt.", -- Nước ép quả mọng
        POMEGRANATE_JUICE = "Vị sắc của nó đánh thức cảm giác thèm ăn!", -- Nước ép lựu
        BANANA_JUICE = "Chắc chắn sẽ làm hài lòng đám đông.", -- Nước chuối
        FIG_JUICE = "Hạt mang lại kết cấu thú vị.", -- Nước ép quả sung
        DRAGONJUICE = "Vừa nhẹ nhàng vừa lạ miệng, hoàn hảo cho những ai thích phiêu lưu.", -- Nước ép thanh long
        GLOWBERRYJUICE = "Tôi đã làm loại nước ép này với những loại quả mọng đặc biệt.", -- Nước ép Glowberry
        WATERMELON_JUICE = "Càng khát nước càng ngọt!", -- Nước ép dưa hấu

        VEGGIE_TEA = "Vị đắng có thể tốt cho bạn.", -- Nước ép xanh
        CARROT_TEA = "Ngay cả khi không phải món ưa thích của mọi người thì nó vẫn tốt cho sức khỏe.", -- Trà cà rốt
        CACTUS_TEA = "Phần thịt bên trong thật tuyệt vời!", -- Trà xương rồng
        TOMATO_JUICE = "Thức uống mà ngay cả ma cà rồng cũng thích!", -- Nước ép cà chua
        LUMPY_TEA = "Tôi càng uống thì càng ngọt!", -- Trà rễ
        SEAWEED_SHAKE = "Tôi chưa bao giờ nghĩ rằng bạn có thể làm ra đồ uống từ thứ này...", -- Sinh tố rong biển

        GREENTEA = "Giống như trà thảo mộc, không tệ chút nào.", -- Trà xanh
        BLACKTEA = "Tôi nên mang theo một ít bánh quy.", -- Trà đen
        BLACKTEA_ICED = "Trà đá sảng khoái, đặc biệt sau bữa ăn no.", -- Trà đen đá
        FUER = "Đáng ngạc nhiên là nó có mùi thơm dễ chịu.", -- Trà Baozi, trà lá, trà dương xỉ
        MIXFLOWER = "Nó có mùi thơm dễ chịu và tốt cho việc xoa dịu thần kinh!", -- Trà hoa hỗn hợp
        HIBISCUSTEA = "Tôi thực sự muốn giới thiệu nó cho các vị khách nữ của chúng tôi.", -- Trà dâm bụt
        CACTUSFLOWER_TEA = "Giống như uống một tác phẩm nghệ thuật.", -- Trà hoa xương rồng
        LOTUSTEA = "Nó thực sự đẹp và lạ!", -- Trà sen
        SUSHIBISCUS = "Đây là một sự nhạo báng trà.", -- Trà tự sát
        MOON_BLOSSOM_TEA = "Nó có hương vị độc đáo.", -- Trà hoa mặt trăng

        CAFFEINBERRY_JUICE = "Từ bây giờ tôi sẽ gọi nó là 'Blue Moon-tain'.", -- Cà phê đen
        TOFFEE_LATTE = "Một loại cà phê ngọt ngào và đậm đà dành cho những ai đang tìm kiếm thứ gì đó dễ uống.", -- Toffee Nut Latte
        RUINCHA_LATTE = "Tôi nhớ một ly Mocha Martini đích thực.", -- Mocha Latte (Cà phê + Sôcôla)

        HOTRUINCOLATE = "Bạn có thể thưởng thức ở bất cứ đâu để có cảm giác thư giãn.", -- Hot Chocolate
        RUINCOLATE_SMOOTHIE = "Sô cô la chip dai và đá thật đặc biệt.", -- Sinh tố sô cô la (ướp lạnh)
        RUINXOCOLATL = "Thức uống kỳ lạ chứa đựng trí tuệ của người Nam Mỹ!", -- Xocolatl (cay)
        TEA_RUINCOLATE_LATTE = "Vị đắng của lá trà bù đắp cho vị ngọt của sô cô la.", -- Matcha Latte

        MULLED = "Tôi khuyên bạn nên dùng đồ uống này khi nào cảm thấy thật sự khó chịu.", -- Bungsho
        BUTTERBEER = "Thức uống ngon nhất ở Hẻm Xéo.", -- Bia bơ trong bộ truyện Harry Potter

        -- Hợp tác Ấm trà Đồ uống

        COCONUT_JUICE = "Ăn miếng thạch trong thứ nước này khiến tôi có cảm giác như đang ở rì-sọt vậy!", -- Castaway Coconut Juice
        RAINBOW_SHAKE = "Nó không hẳn là có vị của bảy sắc cầu vòng cơ mà không quá tệ đâu.", -- Castaway Rainbow Jelly Shake
        QUARTZ_SHAKE = "Theo ý kiến của tôi thì, thứ này sẽ tốt hơn khi dùng để làm Nạm Plà", -- Castaway Quartz Crystals Shake
        CHERRY_ROSEBERRIES_TEA = "Nó có hương thơm thú vị và giúp điều hòa nhiệt độ cơ thể.", -- Trà hoa hồng hoa anh đào
        CHERRY_HONEY_TEA = "Đó là cách chữa đau họng nhanh chóng.", -- Trà mật ong anh đào hoa anh đào
        SWEET_RICE_DRINK = "Nó ngọt ngào và có kết cấu khác thường!", -- Vitahebhi Sikhye
        ANANAS_JUICE = "Tốt nhất không nên uống quá nhiều, MỒM của tôi sẽ chảy máu mất.", -- Legion Pineapple Juice
        ORANGE_JUICE = "Đó là nước cam mới vắt!", -- Thêm gói thực phẩm Nước cam
        STRAWBERRY_SMOOTHIE = "Thật sảng khoái và ngon miệng!", -- Gói thực phẩm khác Sinh tố dâu tây
        STRAWBERRY_MILK_SMOOTHIE = "Đây là một trong những món đồ uống tráng miệng từ dâu tây được các chị em vô cùng yêu thích.", -- Thêm gói thực phẩm Strawberry Smoothie Latte

        --Đồ uống nhà máy bia

        SPOILED_DRINK = "Hết hạn sử dụng rồi.", -- Đồ uống bị hỏng

        -- Nhà máy bia Soda

        SODA = "Nước có ga không có mùi vị lạ.", -- Nước có ga
        FRUITSODA = "Trải nghiệm hương vị trái cây tươi mát bằng đá có ga!", -- Soda trái cây
        LEMONLIMESODA = "Mới mẻ như ngọt ngào!", -- Soda chanh chanh (Tốt hơn so với soda trái cây)
        COLA = "Trẻ em luôn thích nó.", -- Cola
        COLAQUANTUM = "Một quý cô đã phát điên khi tìm kiếm thứ này...", -- Cola Quantum (Tham khảo Forn McRain: Fallout 3 Sierra Petrovita)
        LUMPY_BEER = "Khách hàng thích đồ uống này chỉ yêu cầu loại này.", -- Root beer (không cồn)

        -- Rượu mạnh nhà máy bia

        CORN_BEER = "Thậm chí còn ngon hơn sau bữa ăn nhiều dầu mỡ.", -- Bia ngô
        MADHU = "Tôi tự hỏi liệu Bilroad có còn sản xuất rượu mật ong với trái cây sồi không.", -- Mead (Forn McRain: Skyrim Honningbrew Mead story)
        WINE = "Đó là món quà tuyệt vời nhất mà thần thánh ban tặng cho con người!", -- Rượu vang (Ủ quả mọng thường xuyên)
        NOBLEWINE = "Sẽ ngon hơn với một ít phô mai xanh và các loại hạt.", -- Noble wine (Ủ quả mọng rang)
        SPARKLINGWINE = "Giải khát và kích thích cảm giác ngon miệng.", -- Rượu vang sủi
        GLOWBERRYWINE = "Một thử nghiệm mới về rượu vang!", -- Rượu Glowberry
        KUMIS = "Trí tuệ từ người dân Trung Á.", -- Kumis, sữa ngựa lên men
        LUMPY_WINE = "Nó có độ vang nhẹ với độ axit êm dịu.", -- Sake (Rượu gốc, bao gồm khoai tây, khoai lang, v.v.)
        PULQUE = "Nó có vị chua kéo dài trong vòm miệng.", -- Pulque (Nhựa cây thùa)
        RUINCACAO_WINE = "Đầy hương vị cacao.", -- Rượu Cacao

        -- Hợp tác Soda

        CHERRY_DOCTOR_COLA = "Đó là một thức uống phù hợp và có lượng người hâm mộ cuồng nhiệt.", -- Cherry Forest Dr. Pepper (Dr. Cherry)
        ANANASSODA = "Đây là thức uống hoàn hảo giúp bạn tiêu hóa sau bữa liên hoan lớn.", -- Soda dứa (Oran C)
        ORANGESODA = "Giải khát sau bữa ăn!", -- Soda cam (Fanta)
        STRAWBERRYSODA = "Soda vị dâu ngọt ngào.", -- Soda dâu (Dâu tây của Welch)

        -- Tinh thần hợp tác

        AUROBOW = "Thứ này quả thật là một thức uống đầy sắc cầu vòng", -- Rượu sứa cầu vồng (Aurobo)
        COCONUT_WINE = "Vị ngọt kem với một chút axit và độ nhớt.", -- Rượu dừa (Rượu dừa Aurobo)
        CHERRY_BLOOM_MADHU = "Bạn có thể cảm nhận được hương thơm của dâu tây quả mâm xôi và một chút hương vani.", -- Cherry Blossom Honey Mead (Cherry Forest Cherry Blossom Mead)
        GIANT_BLUEBERRY_WINE = "Có vẻ như ý tưởng của tôi đã đi theo một hướng hơi khác.", -- Boom Berry Wine (Nổ khi bắt lửa)
        RICE_WINE = "Đây là thức uống truyền thống của Đông Á.", -- Vitahebhi Makgeolli
        WHEAT_BEER = "Hương chuối độc đáo và dễ uống.", -- Heap of Food Wheat Beer
        PALE_BEER = "Một nỗ lực mới với bia!", -- Legion Pale Ale (Bia màu xanh nhạt với trái cây Munstera)

        -- Rượu chưng cất

        DISINFECTANT = "Đừng nhầm lẫn nó với rượu!", -- Thuốc khử trùng
        CORN_WHISKEY = "Thứ này được đặc trưng bởi sự cân bằng của hương vị ngọt ngào, vị cay nồng đánh thức các giác quan và kết cấu kem đậm đà.", -- Corn Whiskey
        LUMPY_VODKA = "Rượu vodka chất lượng cao phải trong, có vị trung tính và không có mùi thơm rõ rệt.", -- Vodka
        TEQUILA = "Mùi thơm êm dịu như gỗ.", -- Tequila
        MADHU_RUM = "Hương thơm ngọt ngào đặc trưng của rượu chưng cất.", -- Rum
        BERRY_BRANDY = "Bạn có thể cảm nhận được hương thơm đậm đà.", -- Berry Brandy
        AREUHI = "Hương vị tươi mát và dịu nhẹ, nhưng hãy cẩn thận đừng lạm dụng nó.", -- Rượu chưng cất Kumis Areuhi

        -- Rượu chưng cất độc quyền của Warly

        BERRY_GIN = "Mùi thơm của cây thông gợi nhớ đến việc đi dạo trong rừng.", -- Gin
        GLOWBERRY_GIN = "Hương thơm bí ẩn như thể nuốt chửng ánh sáng.", -- Glow Berry Gin
        ABSINTHE = "Vị ngọt tinh tế, mùi ngải cứu và sự hòa quyện giữa hương vị gia vị và thảo dược.", -- Absinthe
        TEA_LUMPY_VODKA = "Nó đã hòa quyện vị đắng và hương thơm nồng nàn của lá trà.", -- Rượu mùi trà xanh
        PETALS_BERRY_BRANDY = "Bạn có thể cảm nhận được mùi thơm của quả mâm xôi, quýt, dâu tây và hoa.", -- Rose Petal Brandy
        KAHLUA = "Loại này có hương vị cà phê đen đậm đà với hương thơm bơ ngọt ngào và hương vị đậm đà.", -- Coffee Liqueur Kahlua
        NUT_CORN_WHISKEY = "Sự hòa quyện phức tạp giữa vị đắng và vị ngọt trong hương vani quyến rũ đến nỗi tôi không thể không uống nó.", -- Nut Whiskey
        RUINCACAO_CREAM_LIQUEUR = "Bạn có thể thưởng thức hương thơm kem và vị ngọt ngào của sôcôla Bỉ.", -- Rượu mùi kem Cacao Baileys
        RUMCHATA = "Hương quế kết hợp với vani, tạo cảm giác kem và béo ngậy.", -- Rumchata (Rum trộn với horchata, một loại đồ uống từ sữa)

        -- Hợp tác chưng cất rượu mạnh

        MOONWAY = "Trông như có cầu vồng, với màu sắc và mùi thơm phức tạp.", -- Tinh dầu chưng cất sứa cầu vồng (Rượu sứa cầu vồng)
        ARRACK = "Hương thơm phong phú và phức tạp, với những nốt hương hạt dẻ gợi nhớ đến mùi cọ.", -- Arrack Phiên bản Rượu dừa của Arrack
        CHERRY_BLOOM_RUM = "Chỉ cần nhìn thôi cũng thấy thú vị rồi.", -- Rượu rum mật ong hoa anh đào (Cánh hoa anh đào bồng bềnh)
        RICE_SPIRITS = "Kết thúc sạch sẽ và sắc nét!", -- Cheongju (rượu gạo Hàn Quốc)
        WHEAT_WHISKEY = "Tôi cần chuẩn bị món ăn để kết hợp với nó.", -- Wheat Whiskey
        PALE_WHISKEY = "Hương thơm của đất và gồ ghề, với một chút phức tạp.", -- Pale Malt Whiskey

        -- Hợp tác độc quyền của Warly Rượu chưng cất

        NUT_COCONUT_BRANDY = "Sẽ thật tuyệt nếu làm một ly Piña Colada với trái cây.", -- Coconut Brandy (Caribbean Brandy, được đổi tên thành Caribbean Brandy do không thể làm rượu Rum Caribe)
        GIANT_BLUEBERRY_GIN = "Đùa giỡn bằng cách ăn nó là một tội lỗi!", -- Boom Berry Sapphire (Nổ khi bắt lửa)

        -- Nấu nồi

        DARK_RUINCOLATE = "Tôi đã thử nghiệm và làm theo cách của mình.", -- Sôcôla đen
        WHITE_RUINCOLATE = "Bọn trẻ phát cuồng vì nó.", -- Sôcôla trắng
        RUINCOLATE = "Ngọt ngào và đáng yêu.", -- Just Chocolate
        RUIN_SCHOKAKOLA = "Một miếng chắc chắn sẽ đánh thức bạn.", -- Schokakola

        BUCKET_STEEL_EMPTY = 
        {
            EMPTY = "Tôi nảy ra ý tưởng làm bánh pudding bằng cái này.", -- Thùng thép rỗng
            FULL = "Đó là nước sạch!", -- Nước mưa sạch là tốt
            FULL_ICE = "Thật hoàn hảo để đựng rượu.", -- Nước mưa đã đóng băng
            DIRTY = "Có nhiều khách xanh bất tiện.", -- Nước mưa đã trở nên bẩn
            DIRTY_ICE = "Sau khi loại bỏ đá, tôi cần rửa bát đúng cách.", -- Nước mưa bẩn đã đóng băng
        },

        BUCKET_WOODIE_EMPTY = 
        {
            EMPTY = "Anh ta cẩn thận và tỉ mỉ làm sạch nó.", -- Thùng rỗng của Woody bằng gỗ
            FULL = "Đó là nước sạch!", -- Nước mưa sạch là tốt
            FULL_ICE = "Thật hoàn hảo để đựng rượu.", -- Nước mưa đã đóng băng
            DIRTY = "Có nhiều khách xanh bất tiện.", -- Nước mưa đã trở nên bẩn
            DIRTY_ICE = "Sau khi loại bỏ đá, tôi cần rửa bát đúng cách.", -- Nước mưa bẩn đã đóng băng
        },

        BUCKET_DRIFTWOOD_EMPTY =
        {
            EMPTY = "Liệu nó có ổn khi sử dụng chiếc xô này cho việc múc nước không nhỉ?", -- Xô gỗ rỗng
            FULL = "Đó là nước sạch!", -- Nước mưa sạch là tốt
            FULL_ICE = "Thật hoàn hảo để đựng rượu.", -- Nước mưa đã đóng băng
            DIRTY = "Có nhiều khách xanh bất tiện.", -- Nước mưa đã trở nên bẩn
            DIRTY_ICE = "Sau khi loại bỏ đá, tôi cần rửa bát đúng cách.", -- Nước mưa bẩn đã đóng băng
        },


        BUCKET_EMPTY = 
        {
            EMPTY = "Đó là xô nước làm từ gỗ chạm khắc.", -- Xô gỗ rỗng
            FULL = "Đó là nước sạch!", -- Nước mưa sạch là tốt
            FULL_ICE = "Thật hoàn hảo để đựng rượu.", -- Nước mưa đã đóng băng
            DIRTY = "Có nhiều khách xanh bất tiện.", -- Nước mưa đã trở nên bẩn
            DIRTY_ICE = "Sau khi loại bỏ đá, tôi cần rửa bát đúng cách.", -- Nước mưa bẩn đã đóng băng
        },

        DESALINATOR =
        {
            EMPTY = "Tôi có nên đổ đầy nước biển vào không?", -- Không có nước trong máy khử muối
            PURIFY_LONG = "Tôi nên chuẩn bị một số đồ ăn nhẹ đơn giản trong khi nó hoạt động.", -- Vẫn còn một chặng đường dài cho đến khi quá trình thanh lọc hoàn tất
            PURIFY_SHORT = "Nước đã trở nên khá trong.", -- Quá trình lọc gần như hoàn tất
            HASWATER = "Có đủ để nấu ăn!", -- Nước sạch trong máy khử muối
            BURNT = "Nó đang cố làm muối rang phải không?", -- Máy khử muối đã cháy
            HASSALT = "Thật là sai lầm, lẽ ra tôi nên thu hoạch muối trước.", -- Có muối trong máy khử muối
        },

        BARREL =
        { 
            GENERIC = "Tôi luôn có thể giữ nước sạch.", -- Kiểm tra thùng nước
            BURNT = "Comment est-ce possible?! (Sao có thể thế được?!) ", -- Thùng nước đã cháy rồi
        },

        BREWERY =
        {
            EMPTY = "Chỉ cần một ít đồ uống đi kèm bữa ăn sẽ nâng tầm trải nghiệm.", -- Kiểm tra nhà máy bia
            BURNT = "Trái tim tôi cũng như bị đốt cháy!", -- Nhà máy bia đã cháy rồi
            FERMENTING_LONG = "Quá trình lên men tự nhiên sẽ mất một thời gian.", -- Vẫn còn một chặng đường dài cho đến khi quá trình sản xuất bia hoàn tất
            FERMENTING_SHORT = "Tôi nên nhanh chóng chuẩn bị một món ăn để kết hợp với nó.", -- Quá trình nấu bia gần như đã hoàn tất
            DONE = "À, xong rồi!", -- Có đồ uống trong nhà máy bia
        },

        CAMPKETTLE_ITEM = "Nó trung thành với chức năng cốt lõi của nó là đun sôi nước.", -- Kiểm tra hạng mục ấm đun nước cắm trại
        CAMPKETTLE =
        {
            GENERIC = "Có phải tất cả nước đã bay hơi khỏi nó không?", -- Không có nước trong ấm cắm trại trên bếp
            BOILING_LONG = "Tôi nên làm ít đồ ăn trong khi nó đang hoạt động.", -- Nước bắt đầu sôi
            BOILING_SHORT = "Nước đã trở nên khá sạch phải không?", -- Nước gần như đã sôi
            DONE = "Tôi nên dùng cái này để pha trà.", -- Thu được nước sạch
            STOP = "Trời lạnh rồi.", -- Không còn nước sôi do bếp không có lửa
        },

        CAMPDESALINATOR_ITEM = "Trông khá phức tạp phải không?", -- Kiểm tra thiết bị khử muối của trại
        CAMPDESALINATOR = 
        {
            GENERIC = "Nó hoàn toàn trống rỗng.", -- Không có nước
            BOILING_LONG = "Tôi nên làm ít đồ ăn trong khi nó đang hoạt động.", -- Nước bắt đầu sôi
            BOILING_SHORT = "Nước đã trở nên khá sạch.", -- Gần sôi rồi
            DONE = "Tôi nên dùng cái này để nấu súp.", -- Thu được nước sạch
            STOP = "Vẫn là nước biển.", -- Không thể lọc nước biển nếu không đốt lửa trong bếp
        },

        KETTLE =
        {
            EMPTY = "Ngay cả ấm đun nước cũng trống rỗng và cổ họng tôi khô rát.", -- Hộp thoại kiểm tra ấm đun nước rỗng
            BURNT = "J'ai juste versé des larmes.. (Tôi vừa rơi nước mắt...)", -- Ấm đun nước đã cháy rồi
            BOILING_LONG = "Tôi cần đun sôi vừa đủ để phát huy hết hương vị.", -- Mới bắt đầu làm đồ uống
            BOILING_SHORT = "Sắp xong rồi.", -- Đồ uống gần như đã sẵn sàng
            DONE = "À, xong rồi!", -- Đồ uống đã xong
            PURIFY_LONG = "Tôi không thể có bất kỳ mùi vị lạ nào trong đồ uống.", -- Mới bắt đầu đun sôi nước bẩn
            PURIFY_SHORT = "Nó gần như đã loại bỏ được tạp chất!", -- Gần xong việc đun sôi nước bẩn
            HASWATER = "Tôi không biết nên pha loại đồ uống nào.", -- Ấm đun nước có nước sạch
            MELT_LONG = "Những vị khách lạnh lùng đã đến.", -- Nước đá vừa mới bắt đầu tan
            MELT_SHORT = "Nó gần như tan chảy.", -- Nước đá gần tan hết
        },

        PORTABLEKETTLE_ITEM =
        {
            GENERIC = "Nó cho phép tôi cảm nhận được hơi ấm của trà mọi lúc, mọi nơi.", -- Kiểm tra hạng mục ấm đun nước di động
            EMPTY = "Tôi không thể ra ngoài mà không có cái này!", -- Kiểm tra ấm đun nước di động trống đã được lắp đặt
            BOILING_LONG = "Đồ uống ngon cần sự nỗ lực của chính mình.", -- Mới bắt đầu làm đồ uống
            BOILING_SHORT = "Tôi sẽ rời khỏi đây sớm!", -- Đồ uống gần như đã sẵn sàng
            DONE = "Ok đồ uống của bạn gọ..., à xin lỗi bệnh nghề nghiệp tí!", -- Đồ uống đã uống xong
            PURIFY_LONG = "Vệ sinh trong nhà bếp luôn là điều quan trọng.", -- Mới bắt đầu đun sôi nước bẩn
            PURIFY_SHORT = "Tôi gần như đã loại bỏ được tạp chất!", -- Gần xong việc đun sôi nước bẩn
            HASWATER = "Tôi không biết nên pha loại đồ uống nào.", -- Ấm đun nước có nước sạch
            MELT_LONG = "Những vị khách lạnh lùng đã đến.", -- Nước đá vừa mới bắt đầu tan
            MELT_SHORT = "Nó gần như tan chảy.", -- Nước đá gần tan hết
        },

        DISTILLERS =
        {   
            EMPTY = "Tôi sẽ chiêu đãi bạn một loại rượu mùi ngon!", -- Kiểm tra máy chưng cất
            DISTILLTING_LONG = "Tôi có nên đi thu thập một số nguyên liệu cho món cocktail không?", -- Vẫn còn một chặng đường dài cho đến khi quá trình chưng cất hoàn tất
            DISTILLING_SHORT = "Tôi nên nhanh chóng chuẩn bị một món ăn để kết hợp với nó.", -- Quá trình chưng cất gần như hoàn tất
            DONE = "Trợ lý của chúng tôi đã chuẩn bị một số rượu mạnh.", -- Có đồ uống trong máy chưng cất
        },

        WELL_WATERPUMP = {
            HIGH_PRESSURE = "Có vẻ như đây là nước ngầm chất lượng cao.", -- Áp suất tối đa
            MIDDLE_PRESSURE = "Có thể lấy nước ngọt bất cứ lúc nào là một điều may mắn.", -- Áp suất trung bình
            LOW_PRESSURE = "Áp suất quá thấp!", -- Hầu như không có áp suất
            RECHARG_PRESSURE = "Áp suất đã hết hoàn toàn!", -- Không có áp suất (không thể sử dụng cho đến khi áp suất được phục hồi)
        },

        WELL_SPRINKLER =
        { 
            LOWFUEL = "Dường như đã hết nhiên liệu.", -- Kiểm tra vòi phun nước khi có rất ít nhiên liệu
            ON = "Nó đang làm việc chăm chỉ!", -- Hiện đang hoạt động
            OFF = "Đã đến giờ giải lao.", -- Kiểm tra khi nó không hoạt động
        },
    },
}  