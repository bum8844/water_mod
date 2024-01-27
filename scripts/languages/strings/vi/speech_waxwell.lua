return {
    ACTIONFAIL =
    {
        GIVE =
        {
            WELL_NOTEMPTY = "Tôi nên tháo xô ra khỏi giếng trước.", -- Cố gắng sử dụng xô khi đã có xô chứa nước trong giếng
            WELL_BUSY = "Tôi sẽ uống nước từ giếng bằng một cái xô.", -- Cố gắng sử dụng một cái xô khi đã có một cái xô gắn vào nó
        }
    },

    ANNOUNCE_DRUNK = "Ugh, tôi cảm thấy hơi say.", -- Cảm thấy say
    ANNOUNCE_DRUNK_END = "Bây giờ tôi bắt đầu tỉnh táo rồi.", -- Tỉnh táo vì rượu
    ANNOUNCE_DRUNK_IMMUNITY = "", -- Tạm thời. Dành riêng cho Wigfrid.
    ANNOUNCE_NOTCHARGE = "Cái này vô dụng.", -- Cố gắng vắt sữa một con dê Volt không được sạc điện
    ANNOUNCE_NOTHIRSTSLEEP = "Tôi khát quá không thể ngủ được.", -- Cố gắng ngủ vào ban đêm trong khi rất khát
    ANNOUNCE_NOTHIRSTSIESTA = "Tôi khát quá nên không thể nghỉ ngơi trong ngày.", -- Cố gắng nghỉ ngơi trong ngày khi đang rất khát
    ANNOUNCE_SLEEP_END = "Chắc hẳn tôi đã gặp ác mộng.", -- Thức dậy sau khi ngủ và tỉnh dậy vì rượu
    ANNOUNCE_THIRST = "Tôi khát.", -- Cảm thấy rất khát

    ANNOUNCE_CAFFINE_BUFF_START = "Tôi đang phấn khích quá!", -- Bắt đầu quá trình yêu thích caffeine
    ANNOUNCE_CAFFINE_BUFF_STOP = "Buổi biểu diễn đã kết thúc.", -- Kết thúc việc sử dụng caffeine

    ANNOUNCE_CURE_WATERBORNE = "Bây giờ tôi cảm thấy khá hơn một chút.", -- Chữa bệnh do đường nước bằng một vật phẩm

    ANNOUNCE_DCAPACITY_CRITICAL = "Tôi đang ngà ngà say.", -- Sắp say
    ANNOUNCE_DCAPACITY_HALF = "Tôi cảm thấy ấm áp và choáng váng.", -- Bắt đầu say

        DESCRIBE =
        {
            BOILBOOK = "Làm rượu cũng không khó đến thế phải không?",

            WATER_CLEAN_ICE = "Đây toàn là nước rắn.", -- Đá sạch
            WATER_DIRTY_ICE = "Rác đông lạnh.", -- Đá bẩn

            SPICE_CAFFEINPEPPER = "Nó không mang lại nhiều giá trị cho bất cứ thứ gì.", -- Gia vị hạt tiêu Caffein

            WELL_KIT = "Tôi có phải mang cái này đi khắp nơi và bay không?", -- Bộ đồ đấy
            WELL_SPRINKLER_KIT = "Có vẻ như là sự kết hợp giữa máy móc và ma thuật.", -- Bộ phun nước
            WELL_WATERPUMP_KIT = "Tôi có thực sự phải nghĩ đến điều đó không?", -- Bộ máy bơm nước hơi nước
            WELL_BURYING_KIT = "Tại sao tôi lại thực hiện những công việc không cần thiết?", -- Bộ chôn cất
            WELL_DRILLING = "Nó hoạt động tự động, rất tiện lợi.", -- Khoan lỗ bằng máy khoan
            WELL_DRILLING_ITEM = "Trông khá chắc chắn.", -- Dụng cụ khoan
            HOLE = "Tôi có thể không đỡ được xương nếu rơi vào đó.", -- Well Hole
            WELL = "Cạnh cái giếng này tôi chết khát rồi.", -- Chà

            WX78MODULE_NONEDRUNK = "Robot đó cần phải tập trung lại.", -- 78전용 묘듈

            -- Cây Chế Độ Nước

            TEA_TREE = "Những chiếc lá đang nở rộ trên vật nhỏ bé này.", -- Cây trà
            DUG_TEA_TREE = "Tôi biết cách trở thành người làm vườn phải không?", -- Cây trà đào từ lòng đất
            TEA_SEED = "Ai biết cách trồng cây có thể thấy điều này hữu ích.", -- Hạt giống cây trà
            TEA_SEED_COOKED = "Tôi không thể tin được mình phải ăn thứ như thế này.", -- Hạt cây trà rang
            TEA_SEED_SAPLING = "Tôi đoán là tôi phải tự mình trồng nó xuống đất.", -- Cây non trà
            TEALEAVES = "Tôi nên lau khô trước khi sử dụng.", -- Lá trà
            TEALEAVES_DRIED = "Tôi thèm một tách trà.", -- Lá trà khô

            CAFFEINBERRY = "Bụi cà phê chịu ảnh hưởng của mặt trăng.", -- Bụi caffeine
            DUG_CAFFEINBERRY = "Đáng để trồng lại.", -- Đào bụi cà phê
            CAFFEINBERRY_BEAN = "Trông khác với những hạt cà phê mà tôi biết.", -- Hạt cà phê thô
            CAFFEINBERRY_BEAN_COOKED = "Tốt hơn cà phê sống, nhưng chắc chắn phải có cách khác.", -- Hạt cà phê rang

            RUINCACAO_TREE = "Chắc chắn bị ảnh hưởng bởi ma thuật hắc ám.", -- Cây Cacao
            DUG_RUINCACAO_TREE = "Ai biết cách trồng cây có thể thấy điều này hữu ích.", -- Đào cây cacao
            RUINCACAO_SEED = "Có vẻ như nó đã nở hoa.", -- Mặt hàng hạt cacao
            RUINCACAO_SEED_SAPLING = "Tôi đoán nó sẽ không tự trồng.", -- Cây cacao đã được trồng
            RUINCACAO = "Tôi sẽ ăn nhưng không thích.", -- Quả Cacao trước khi bẻ ra
            RUINCACAO_BEAN = "Bọc trong dầu rẻ tiền.", -- Hạt cacao nghiền
            RUINCACAO_BEAN_COOKED = "Tốt hơn so với nguyên liệu thô, nhưng chắc chắn phải có cách khác.", -- Hạt cacao rang

            -- Phụ gia chưng cất rượu mạnh

            ADDITIVE_SEED = "Bạn đang cố gắng làm rượu thật à?", -- Hạt thảo mộc (hồi, quả bách xù, họa tiết hình bát giác) để thêm vào rượu mùi
            ADDITIVE_PETALS = "Rượu có thực sự cần thứ này không?", -- Phụ gia thảo mộc, trà xanh và cánh hoa để thêm vào rượu mùi
            ADDITIVE_NUT = "Những người trẻ tuổi có thực sự cho thứ này vào đồ uống của họ không?", -- Các chất phụ gia từ hạt, dừa, hạt cà phê và hạt cacao để thêm vào rượu mùi
            ADDITIVE_DAIRY = "Tôi tôn trọng sở thích của bạn, nhưng...", -- Phụ gia sữa để thêm vào rượu mùi

            -- Đồ uống

            WATER_CLEAN = "Một ngụm nước sạch quý giá.", -- Nước sạch
            WATER_DIRTY = "Này, nước của tôi trông không được tốt lắm.", -- Nước bẩn
            WATER_SALTY = "Tôi không nên uống thứ này.", -- Saltwater

            GOOPYDRINK = "Thiếu tinh tế.", -- Đồ uống thất bại (khái niệm rang ướt)

            -- Đồ uống ấm trà

            FRUITJUICE = "Nó bị lẫn lộn, nhưng nó có vị rất ngon.", -- Nước ép trái cây hỗn hợp
            BERRIES_JUICE = "Chà, nó không tệ.", -- Nước ép quả mọng
            POMEGRANATE_JUICE = "Ít nhất nó trông giống một phần.", -- Nước ép lựu
            BANANA_JUICE = "Không có cách nào tốt hơn để làm điều này à?", -- Nước chuối
            FIG_JUICE = "Khá ngọt.", -- Nước ép quả sung
            DRAGONJUICE = "Có vị ngọt đậm đà.", -- Nước ép thanh long
            GLOWBERRYJUICE = "Nước ép trái cây được sử dụng rất tốt.", -- Nước ép Glowberry
            WATERMELON_JUICE = "Hương dưa hấu có phần loãng.", -- Nước ép dưa hấu

            VEGGIE_TEA = "Đã đến lúc phải chăm sóc sức khỏe của mình.", -- Nước ép rau củ
            CARROT_TEA = "Tôi không còn cách nào khác ngoài nhấm nháp nó.", -- Trà cà rốt
            CACTUS_TEA = "Tôi có một ốc đảo nhỏ trong tay.", -- Trà xương rồng
            TOMATO_JUICE = "Mịn màng và dễ uống.", -- Nước ép cà chua
            LUMPY_TEA = "Cách này trông có vẻ trang nghiêm.", -- Trà rễ
            SEAWEED_SHAKE = "Làm ơn, không...", -- Rong biển lắc

            GREENTEA = "Có mùi lá cây.", -- Trà xanh tươi
            BLACKTEA = "Một tách trà được chào đón một cách đáng ngạc nhiên.", -- Trà đen
            BLACKTEAICED = "Khai sáng bằng sự mát mẻ.", -- Trà đen đá
            FUER = "Khá kỳ lạ.", -- Trà bohe, trà lá, trà dương xỉ
            MIXFLOWER = "Có dư vị hơi lạ.", -- Trà cánh hoa hỗn hợp
            HIBISCUSTEA = "Đẹp không gì sánh bằng.", -- Trà dâm bụt
            CACTUSFLOWER_TEA = "Nó không làm bạn thất vọng.", -- Trà hoa xương rồng
            LOTUSTEA = "Đây có phải là điều tôi đang nghĩ tới không?", -- Trà sen
            SUSHIBISCUS = "Bản chất của bóng tối.", -- Trà tự sát
            MOON_BLOSSOM_TEA = "Nó sẽ không biến đổi tôi đâu, phải không?", -- Trà hoa mặt trăng

            CAFFEINBERRY_JUICE = "Tôi rất mong chờ được nếm thử.", -- Cà phê đen
            TOFFEE_LATTE = "Họ đun chảy kẹo Scotch để làm món này à?", -- Toffee nut latte
            RUINCHA_LATTE = "Tôi thậm chí còn không biết mocha thật là gì.", -- Mocha latte (cà phê + sô cô la)

            HOTRUINCOLATE = "Ngay cả khi tâm hồn tôi có bị xé nát, nó cũng sẽ lành lại.", -- Sôcôla nóng
            RUINCOLATE_SMOOTHIE = "Tôi lo lắng về răng nếu uống thứ này.", -- Sinh tố sô cô la (lạnh)
            RUINXOCOLATL = "Tôi có thể cảm nhận được linh hồn.", -- Chocolatl (cay)
            TEA_RUINCOLATE_LATTE = "Giới trẻ có thực sự uống thứ này không?", -- Matcha latte

            MULLED = "Tôi có thể tận hưởng sự thư giãn ngay cả khi thời tiết lạnh buốt.", -- Bangcho
            BUTTERBEER = "Linh hồn tôi sẽ gắn kết lại với nhau, ngay cả khi nó bị xé nát.", -- Butterbeer trong bộ truyện Harry Potter

            -- Đồ uống ấm trà hợp tác

            COCONUT_JUICE = "Uống chút nước cho no bụng một chút!", -- Nước dừa đắm tàu
            RAINBOW_SHAKE = "Có vẻ như đồ ăn vặt cho trẻ em.", -- Thạch cầu vồng bị đắm tàu
            QUARTZ_SHAKE = "Giá mà có chanh...", -- Thạch lắc thủy tinh đắm tàu
            CHERRY_ROSEBERRIES_TEA = "Vậy, bánh quy ở đâu?", -- Trà tầm xuân Rừng Anh Đào
            CHERRY_HONEY_TEA = "Sẽ ngon hơn với gừng và chanh...", -- Trà mật ong hoa anh đào Cherry Forest
            SWEET_RICE_DRINK = "Mmm, êm dịu.", -- Nước gạo ngọt Vitacomp
            PINEANANAS_JUICE = "Tôi không thể uống nước ép trái cây thơm này trong một lần được.", -- Nước ép dứa Regione
            ORANGE_JUICE = "Tôi chưa bao giờ nhận thấy điều này trong phòng nghỉ trước khi đến đây.", -- Nước cam Moore Food Pack
            STRAWBERRY_SMOOTHIE = "Trông giống như đồ uống bán rong.", -- Sinh tố dâu tây Moore Food Pack
            STRAWBERRY_MILK_SMOOTHIE = "Nó không hợp khẩu vị của tôi.", -- Sinh tố sữa dâu Moore Food Pack

            -- Rượu chưng cất

            SPOILED_DRINK = "Đó là đồ uống trước khi tôi làm hỏng nó.", -- Đồ uống bị hỏng

            -- Nhà máy chưng cất soda

            SODA = "Tôi thậm chí chưa bao giờ nghĩ đến việc thử cái này.", -- Nước có ga (tạo cacbonat thô bằng bụi)
            FRUITSODA = "Tôi có nên biểu diễn trước bát punch không?", -- Soda trái cây
            LEMONLIMESODA = "Thứ này sẽ làm hỏng răng của tôi.", -- Soda chanh chanh (phiên bản cao cấp của soda trái cây)
            COLA = "Ước gì nó có ống hút.", -- Cola
            COLAQUANTUM = "Đáng ngờ nhưng ngoạn mục.", -- Cola Quantum
            LUMPY_BEER = "Họ đã tạo lại hương vị như thế nào?", -- Bia gốc (không cồn)

            -- Đồ uống nhà máy bia

            CORN_BEER = "Hmm... Đây không phải chỉ là rượu moonshine làm từ ngô thôi sao?", -- Rượu whisky ngô (rửa - chưng cất trước khi làm rượu whisky)
            MADHU = "Tôi hy vọng họ không làm món này theo truyền thống của người Viking.", -- Mead
            WINE = "Ngay cả khi nó được làm bằng quả dại, nó cũng cần một chút tinh tế.", -- Rượu (cách ủ quả mọng đơn giản)
            NOBLEWINE = "Cuộc sống khá thịnh vượng nhỉ.", -- Rượu cao quý (ủ dâu nướng)
            SPARKLINGWINE = "Tôi nhớ sâm panh.", -- Rượu sủi tăm
            GLOWBERRYWINE = "Tôi có thể kiếm được nhiều tiền khi bán thứ này ở bên ngoài.", -- Rượu Glowberry
            KUMIS = "Khá hoang dã.", -- Kumis, sữa ngựa lên men
            LUMPY_WINE = "Sạch đến kinh ngạc.", -- Rượu gạo (khoai tây, khoai lang, v.v. rượu rễ cây)
            PULQUE = "Nó không hợp khẩu vị của tôi.", -- Pulque (đồ uống có cồn truyền thống của Mexico)
            RUINCACAO_WINE = "Đó là loại rượu hiếm bạn sẽ không tìm thấy ở bên ngoài.", -- Rượu Cacao

            -- Nước ngọt hợp tác

            CHERRY_DOCTOR_COLA = "Thật tiếc là ở đây không có bác sĩ thực sự.", -- Cherry Forest Dr. Pepper (Doctor Cherry)
            PINEANANASSODA = "Bây giờ tôi cảm thấy gần gũi hơn với nền văn minh.", -- Dứa có ga (Oransi)
            ORANGESODA = "Soda này có quá nhiều ga.", -- Cam có ga (Fanta)
            STRAWBERRYSODA = "Soda này có quá nhiều ga.", -- Dâu tây có ga (dâu tây của Welch)

            -- Cộng tác Đồ uống Nhà máy bia

            AUROBOW = "Một ý tưởng khá độc đáo.", -- Shipwrecked Oroboros, Rainbow Jelly Brew
            COCONUT_WINE = "Tôi nên ăn cua với món này.", -- Rượu dừa đắm tàu
            CHERRY_BLOOM_MADHU = "Tôi hy vọng sẽ không khó để rửa nó vứt cái này ra khỏi quần áo của tôi.", -- Cherry Forest hoa anh đào mật ong
            GIANT_BLUEBERRY_WINE = "Hãy cư xử như những cá nhân có văn hóa.", -- Vitacomp Boom! Rượu Berry (nổ khi đốt cháy)
            RICE_WINE = "Nó có vị thơm.", -- Vitacomp Makgeolli
            WHEAT_BEER = "Tôi tự hỏi họ lấy hoa bia ở đâu.", -- Hip of Food bia lúa mì
            PALE_BEER = "Tôi nghi ngờ loại bia này được làm bằng hoa bia.", -- Regione ale nhạt (bia xanh làm từ trái quái vật)

            -- Đồ uống chưng cất

            DISINFECTANT = "Bạn đã thử cắt phép thuật chưa? Bạn có thể cần cái này.", -- Thuốc khử trùng
            CORN_WHISKEY = "Cuối cùng.", -- Rượu whisky ngô
            LUMPY_VODKA = "Thật tiếc là giờ tôi chỉ là người làm công.", -- Vodka
            TEQUILA = "Cảm giác như một buổi biểu diễn mộc mạc.", -- Tequila
            MADHU_RUM = "Nó khá khó khăn.", -- Rum
            BERRY_BRANDY = "Phù hợp với sự tinh tế của tôi.", -- Berry brandy
            AREUHI = "Có mùi lạ.", -- Rượu chưng cất Kumis Areuhi

            -- Đồ uống chưng cất độc quyền của Warly

            BERRY_GIN = "Rốt cuộc đây không phải là đồ uống hạng thấp.", -- Gin
            GLOWBERRY_GIN = "Tôi nên xin lỗi cô ấy.", -- Glowberry gin
            ABSINTHE = "À, nó giống như vực thẳm cuộc đời tôi vậy!", -- Absinthe
            TEA_LUMPY_VODKA = "Hmm, thật tinh tế.", -- Rượu mùi trà xanh
            PETALS_BERRY_BRANDY = "Hơi quá đáng.", -- Rượu mạnh mùi hoa hồng
            KAHLUA = "Không tệ đến thế đâu.", -- Rượu mùi cà phê Kahlua
            NUT_CORN_WHISKEY = "Tôi thèm thịt hun khói.", -- Nut whisky
            RUINCACAO_CREAM_LIQUEUR = "Những người trẻ tuổi này...", -- Rượu mùi kem Cacao Baileys
            RUMCHATA = "Đây là loại đồ uống gì?", -- Rumchata (sự kết hợp giữa rượu rum và horchata, một loại đồ uống làm từ sữa)

            -- Cộng tác Nước cất

            MOONWAY = "Họ làm món này như thế nào?", -- Rượu chưng cất Rainbow Jelly Brew
            ARRACK = "Nó được làm từ một loại trái cây đa năng, được chứ.", -- Arrack, phiên bản rượu dừa của Indonesia, chưng cất
            CHERRY_BLOOM_RUM = "Thật lộng lẫy phải không?", -- Rượu rum mật ong hoa anh đào, cánh hoa anh đào bồng bềnh
            RICE_SPIRITS = "Khá sạch.", -- Rượu gạo
            WHEAT_WHISKEY = "Hoàn hảo.", -- Rượu whisky lúa mì
            PALE_WHISKEY = "Thành thật mà nói, nó không tệ.", -- Rượu whisky mạch nha nhạt

            -- Hợp tác độc quyền của Warly Rượu chưng cất

            NUT_COCONUT_BRANDY = "Vậy hãy nói cho tôi biết... Con tàu của tôi ra sao rồi?", -- Phát biểu bởi Barbosa, một tên cướp biển vùng Caribe
            GIANT_BLUEBERRY_GIN = "Nó đã nắm bắt được bản chất của sự hủy diệt.", -- Boom Berry Sapphire (Vụ nổ cà rốt)

            -- Nấu nồi

            DARK_RUINCOLATE = "Có phải người bạn đầu bếp cũng học ma thuật hắc ám không?", -- Sôcôla đen
            WHITE_RUINCOLATE = "Tôi sẽ vượt qua.", -- Sô cô la trắng
            RUINCOLATE = "Mồi nhử để thu hút những vị khách nhỏ.", -- Sô cô la nguyên chất
            RUIN_SCHOKAKOLA = "Một dạng hiệu quả tập trung.", -- Schokakola

            BUCKET_STEEL_EMPTY =
            {
                EMPTY = "Có vẻ như là một thùng thép rỗng.", -- Xô kim loại rỗng
                FULL = "Tôi đoán là tôi có thể thu thập nước mưa hoặc uống từ nó.", -- Quả thực là nước mưa sạch
                FULL_ICE = "Tôi có cần lấy nó ra không?", -- Nước mưa đã đóng băng
                DIRTY = "Thật kinh tởm.", -- Nước mưa đã trở nên bẩn
                DIRTY_ICE = "Tôi thậm chí còn không muốn nhìn vào nó.", -- Nước mưa bẩn đã đóng băng
            },

            BUCKET_WOODIE_EMPTY =
            {
                EMPTY = "Đó là cái xô gỗ rỗng của Woody.", -- Cái xô gỗ rỗng của Woody
                FULL = "Tôi đoán là tôi có thể thu thập nước mưa hoặc uống từ nó.", -- Quả thực là nước mưa sạch
                FULL_ICE = "Tôi có cần lấy nó ra không?", -- Nước mưa đã đóng băng
                DIRTY = "Thật kinh tởm.", -- Nước mưa đã trở nên bẩn
                DIRTY_ICE = "Tôi thậm chí còn không muốn nhìn vào nó.", -- Nước mưa bẩn đã đóng băng
            },

            BUCKET_EMPTY =
            {
                EMPTY = "Tôi thà không làm bẩn tay mình còn hơn.", -- Xô gỗ rỗng
                FULL = "Tôi đoán là tôi có thể thu thập nước mưa hoặc uống từ nó.", -- Quả thực là nước mưa sạch
                FULL_ICE = "Tôi có cần lấy nó ra không?", -- Nước mưa đã đóng băng
                DIRTY = "Thật kinh tởm.", -- Nước mưa đã trở nên bẩn
                DIRTY_ICE = "Tôi thậm chí còn không muốn nhìn vào nó.", -- Nước mưa bẩn đã đóng băng
            },

            DESALINATOR =
            {
                EMPTY = "Đó quả là một ý tưởng hay.", -- Không có nước trong máy khử muối
                PURIFY_LONG = "Sẽ mất một lúc.", -- Vẫn còn rất nhiều thời gian để thanh lọc
                PURIFY_SHORT = "Sắp hoàn tất!", -- Quá trình thanh lọc gần như hoàn tất
                HASWATER = "Có vẻ như mọi việc đã xong.", -- Làm sạch nước trong máy khử muối
                BURNT = "Bây giờ nó vô dụng rồi.", -- Máy khử muối đã cháy
                HASSALT = "Có thể giờ nó vô dụng rồi.", -- Vẫn còn muối trong máy khử muối
            },

            BARREL =
            {
                GENERIC = "Đó là một cái thùng.", -- Kiểm tra cái thùng
                BURNT = "Nó dùng lửa như nước.", -- Thùng đã cháy
            },

            BREWERY =
            {
                EMPTY = "Có mùi gỗ sồi nồng nặc.", -- Kiểm tra nhà máy bia
                BURNT = "À, mùi thơm mùi khói quá.", -- Nhà máy bia cháy rồi
                FERMENTING_LONG = "Sẽ mất một lúc.", -- Vẫn còn rất nhiều thời gian để pha
                FERMENTING_SHORT = "Sắp xong rồi!", -- Quá trình sản xuất bia gần như đã hoàn tất
                DONE = "Không biết nó có uống được không.", -- Có đồ uống ở nhà máy bia
            },

            CAMPKETTLE_ITEM = "Haiz, đó là số phận của tôi trong cuộc đời.", -- Kiểm tra vật phẩm ấm đun nước cắm trại
            CAMPKETTLE =
            {
                GENERIC = "Vậy tôi có phải đi tìm nước để đổ vào cái này không?", -- Ấm cắm trại trống trên lò sưởi
                BOILING_LONG = "Trời vẫn lạnh.", -- Bắt đầu đun sôi nước
                BOILING_SHORT = "Thật hoàn hảo để làm ấm bàn tay của tôi.", -- Nước gần sôi
                DONE = "Tôi đang trong hoàn cảnh phải đun sôi nước ao để uống.", -- Đã có được nước sạch
                STOP = "Chưa sôi hẳn.", -- Lửa tắt, nước bẩn không sôi
            },

            CAMPDESALINATOR_ITEM = "Trông nó khá nặng.", -- Kiểm tra vật dụng khử muối trong trại
            CAMPDESALINATOR =
            {
                GENERIC = "Vậy tôi có nên đi bộ tới và lấy nước biển bằng chân không?", -- Máy khử muối không có nước
                BOILING_LONG = "Tôi phải đợi bao lâu?", -- Bắt đầu đun sôi nước
                BOILING_SHORT = "Có vẻ như sắp xong rồi.", -- Đun sôi gần xong rồi
                DONE = "Có vẻ như mọi việc đã xong.", -- Làm sạch nước trong máy khử muối
                STOP = "Chưa sôi hẳn.", -- Lò sưởi không có lửa nên nước mặn sẽ không được lọc sạch
            },

            KETTLE =
            {
                EMPTY = "Trông có vẻ cô đơn.", -- Kiểm tra chiếc ấm rỗng
                BURNT = "Đã chiết quá mức.", -- Ấm bị cháy
                BOILING_LONG = "Hãy kiên nhẫn...", -- Mới bắt đầu pha đồ uống
                BOILING_SHORT = "Sắp xong rồi!", -- Đồ uống gần như đã sẵn sàng
                DONE = "Bây giờ cuối cùng tôi cũng có thể uống thứ gì đó đàng hoàng.", -- Đồ uống đã kết thúc
                PURIFY_LONG = "Nó sẽ không ngon đâu.", -- Mới bắt đầu đun sôi nước bẩn
                PURIFY_SHORT = "Thật hoàn hảo để làm ấm bàn tay của tôi.", -- Gần xong việc đun sôi nước bẩn
                HASWATER = "Ước gì tôi có thể uống một tách trà.", -- Có nước sạch trong đó
                MELT_LONG = "Trời vẫn lạnh.", -- Nước đá vừa bắt đầu tan
                MELT_SHORT = "Nóng.", -- Nước đá gần tan hết
            },

            PORTABLEKETTLE_ITEM =
            {
                GENERIC = "Tôi thậm chí còn không có thời gian để ngồi uống trà.", -- Kiểm tra vật phẩm ấm đun nước di động
                EMPTY = "Nó trống rỗng.", -- Kiểm tra ấm đun nước di động được đặt trống
                BOILING_LONG = "Tôi cần phải kiên nhẫn.", -- Mới bắt đầu pha đồ uống
                BOILING_SHORT = "Sẽ xong ngay thôi.", -- Đồ uống gần như đã sẵn sàng
                DONE = "Tôi có thể uống trà một lúc.", -- Uống xong
                PURIFY_LONG = "Nó sẽ không ngon đâu.", -- Mới bắt đầu đun sôi nước bẩn
                PURIFY_SHORT = "Thật hoàn hảo để làm ấm bàn tay của tôi.", -- Gần xong việc đun sôi nước bẩn
                HASWATER = "Ước gì tôi có thể uống một tách trà.", -- Có nước sạch trong đó
                MELT_LONG = "Trời vẫn lạnh.", -- Nước đá vừa bắt đầu tan
                MELT_SHORT = "Nóng.", -- Nước đá gần tan hết
            },

            DISTILLERS =
            {
                EMPTY = "Đó là một cái vạc chắc chắn và lạ mắt.", -- Kiểm tra máy chưng cất
                DISTILLTING_LONG = "Hãy để máy chưng cất hoạt động.", -- Vẫn còn rất nhiều thời gian để chưng cất
                DISTILLING_SHORT = "Có vẻ như gần xong rồi.", -- Quá trình chưng cất gần như hoàn tất
                DONE = "Bây giờ tôi sẽ thử rượu thật.", -- Có đồ uống trong máy chưng cất
            },

            WELL_WATERPUMP = {
                HIGH_PRESSURE = "Này, có phải hơi ồn quá không?", -- Áp suất tối đa
                MIDDLE_PRESSURE = "Thật tuyệt khi không phải làm việc bằng tay.", -- Áp suất trung bình
                LOW_PRESSURE = "Cái này có hoạt động bình thường không?", -- Hầu như không có áp lực
                RECHARG_PRESSURE = "Tôi đoán là tôi phải múc nước bằng tay, thở dài.", -- Không có áp lực, không thể sử dụng cho đến khi áp suất tối đa
            },

            WELL_SPRINKLER =
            {
                LOWFUEL = "Tôi đoán người bạn biết mày mò máy móc của tôi sẽ tìm ra.", -- Kiểm tra khi gần hết nhiên liệu
                ON = "Nó sẽ ướt sũng nếu tôi đến gần hơn.", -- Bật rồi
                OFF = "Nó đã tắt.", -- Kiểm tra khi nó tắt
            },
        },
    }