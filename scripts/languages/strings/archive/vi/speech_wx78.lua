return {
    ACTIONFAIL =
    {
        GIVE =
        {
            WELL_NOTEMPTY = "ĐẦU VÀO TRÙNG LẶP BỊ TỪ CHỐI", -- Attempt to give a full bucket to a well
            WELL_BUSY = "LỖI: THIẾT BỊ BẬN", -- Attempt to give a filled bucket to a well (parody of "Printer is busy")
        }
    },

    ANNOUNCE_DRUNK = "CẢNH BÁO: ĐẦU RA BỊ SAY", -- Say rượu

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

    ANNOUNCE_DRUNK_END = "ĐẦU RA ĐỘNG CƠ HÓA HỌC ỔN ĐỊNH", -- Tỉnh táo một chút (nôn nao)
    ANNOUNCE_DRUNK_IMMUNITY = "TỰ CHẨN ĐOÁN: ĐỘNG CƠ HÓA HỌC / BÌNH THƯỜNG", -- Tạm thời chỉ dành cho Wigfrid
    ANNOUNCE_NOTCHARGE = "BẮT BUỘC SẠC CHO THỰC THỂ NÀY", -- Cố gắng vắt sữa dê Volt miễn phí
    ANNOUNCE_NOTHIRSTSLEEP = "CHẤT LÀM MÁT KHÔNG ĐỦ CHO CHẾ ĐỘ NGỦ", -- Cố gắng ngủ vào ban đêm với cơn khát dữ dội
    ANNOUNCE_NOTHIRSTSIESTA = "CHẤT LÀM MÁT KHÔNG ĐỦ CHO PHẦN ĐÔNG", -- Cố gắng ngủ trưa trong ngày với cơn khát dữ dội
    ANNOUNCE_SLEEP_END = "ĐẦU RA ĐỘNG CƠ HÓA HỌC ĐƯỢC PHỤC HỒI", -- Thức dậy và hoàn toàn tỉnh táo sau khi uống rượu
    ANNOUNCE_THIRST = "CẦN BỔ SUNG CHẤT LÀM MÁT", -- Rất khát!

    ANNOUNCE_CAFFINE_BUFF_START = "TẤT CẢ GIỚI HẠN TỶ LỆ CỐT LÕI: 49", -- Bắt đầu buff caffeine (TẤT CẢ GIỚI HẠN TỶ LỆ CỐT LÕI: 49)
    ANNOUNCE_CAFFINE_BUFF_STOP = "GIỚI HẠN CORE ĐƯỢC CẤU HÌNH LẠI", -- Quá trình hỗ trợ caffeine kết thúc

    ANNOUNCE_CURE_WATERBORNE = "ĐIỀU CHỈNH TỶ LỆ PH CỦA NƯỚC", -- 78 không thực sự được sử dụng

    ANNOUNCE_DCAPACITY_CRITICAL = "CẢNH BÁO: ĐẦU RA ĐỘNG CƠ HÓA HỌC BẤT THƯỜNG", -- Sắp say
    ANNOUNCE_DCAPACITY_HALF = "ĐÃ PHÁT HIỆN BIẾN ĐỘNG ĐẦU RA ĐỘNG CƠ HÓA HỌC", -- Cơn say đang ập đến

        DESCRIBE =
        {
            BOILBOOK = "DANH MỤC CHỨA HƯỚNG DẪN TỔNG HỢP CÁC CHẤT LÀM MÁT",

            WATER_CLEAN_ICE = "NƯỚC ĐÔNG LẠNH VÀ BỊ BẮC HEHE", -- Nước đá sạch
            WATER_DIRTY_ICE = "BẨN THỈU VÀ KHÓ CHỊU", -- Nước đá bẩn

            SPICE_CAFFEINPEPPER = "THÊM HƯƠNG VỊ CHO MÓN ĂN NHẠT NHẼO", -- Gia vị hạt tiêu caffein

            WELL_KIT = "CẦN NGUỒN NƯỚC ĐỂ LẮP ĐẶT", -- Bộ dụng cụ giếng
            WELL_SPRINKLER_KIT = "SỬ DỤNG THẬN TRỌNG", -- Bộ phun nước
            WELL_WATERPUMP_KIT = "THIẾT BỊ BƠM NƯỚC HIỆU SUẤT CAO", -- Bộ máy bơm nước bằng hơi nước
            WELL_BURYING_KIT = "DỤNG CỤ LẤP LỖ", -- Bộ chôn lấp lỗ
            WELL_DRILLING = "KHÁM PHÁ MẠCH NƯỚC", -- Khoan lỗ bằng máy khoan
            WELL_DRILLING_ITEM = "THIẾT BỊ PHÁT TRIỂN MẠCH NƯỚC", -- Vật phẩm khoan (AFS: "THIẾT BỊ PHÁT TRIỂN TỐT"?)
            HOLE = "LỖ ĐỂ KHAI THÁC NƯỚC", -- Lỗ giếng
            WELL = "NGUỒN NƯỚC ỔN ĐỊNH", -- Vâng

            WX78MODULE_NONEDRUNK = "HỖ TRỢ ĐẦU RA ĐỘNG CƠ HÓA CHẤT", -- 78전용 모듈

            -- Water Mode Plants

            TEA_TREE = "MỘT NGUỒN LÁ TRÀ LIÊN TỤC", -- Cây trà
            DUG_TEA_TREE = "CẦN ĐẤT", -- Cây chè đào lên
            TEA_SEED = "GÓI MÃ NGUỒN", -- Hạt giống cây trà
            TEA_SEED_COOKED = "HOẠT ĐỘNG CUỘC SỐNG TẠM NGỪNG", -- Hạt cây trà đã nấu chín
            TEA_SEED_SAPLING = "CÂY TRONG GIAI ĐOẠN TĂNG TRƯỞNG SỚM", -- Cây trà non
            TEALEAVES = "LÁ ĐƠN GIẢN", -- Lá trà (CHỈ MỘT BÚP LÁ)
            TEALEAVES_DRIED = "ĐÃ SỬA ĐỔI", -- Lá trà khô (ĐÃ ĐƯỢC SỬA ĐỔI)

            CAFFEINBERRY = "CÂY ĐẬU CÓ THỂ UỐNG ĐƯỢC BỊ THAY ĐỔI BỞI MẶT TRĂNG", -- Bụi quả mọng chứa caffein (CÂY ĐẬU CÓ THỂ UỐNG ĐƯỢC BỊ THAY ĐỔI MẶT TRĂNG)
            DUG_CAFFEINBERRY = "YÊU CẦU ĐẤT", -- Bụi cây caffeine đào lên
            CAFFEINBERRY_BEAN = "ĐẬU CÓ THỂ UỐNG", -- Hạt caffeine thô
            CAFFEINBERRY_BEAN_COOKED = "TỐI ƯU VIỆC SƯỞI ẤM", -- Hạt caffeine nấu chín (Đậu được tối ưu hóa bằng lửa)

            RUINCACAO_TREE = "MỘT DẠNG CÂY COCOA ĐẶC BIỆT", -- Cây cacao
            DUG_RUINCACAO_TREE = "CẦN ĐẤT", -- Cây cacao đào lên
            RUINCACAO_SEED = "TĂNG TRƯỞNG NGAY LẬP TỨC ĐỂ CUNG CẤP TRÁI CÂY", -- Vật phẩm cây giống ca cao
            RUINCACAO_SEED_SAPLING = "CÓ MỘT DẤM BÓNG VÀ SỰ CỘNG HỢP", -- Cây ca cao được trồng cây non
            RUINCACAO = "CẦN MỘT SỐ CHẾ BIẾN SAU", -- Quả ca cao vỡ sẵn
            RUINCACAO_BEAN = "ĐÁNG CHẾ BIẾN", -- Hạt ca cao sau khi vỡ
            RUINCACAO_SEED_COOKED = "ĐẬU ĐEN RANG TRÊN LỬA", -- Hạt cacao rang

            -- Distillery Additives

            ADDITIVE_SEED = "SỰ TUYỆT VỜI CUỘC SỐNG LÀ VUI VẺ", -- Hạt thảo mộc (Hồi, Bách Xù, Octagon Motif) làm phụ gia cho rượu mùi
            ADDITIVE_PETALS = "CÁC LOẠI THẢO MỘC ĐỂ TĂNG HƯƠNG THƠM", -- Các loại thảo mộc, lá trà và cánh hoa làm phụ gia cho rượu mùi
            ADDITIVE_NUT = "PHỤ GIA RẮN", -- Phụ gia hạt cho rượu mùi (Hạt bạch dương, Dừa, Hạt cà phê, Hạt ca cao)
            ADDITIVE_DAIRY = "KHÔNG ĐƯA CÁC TẠP CHẤT TUYỆT VỜI TRONG ETHANOL", -- Phụ gia sữa cho rượu mùi

            -- Drinks

            WATER_CLEAN = "CHẤT LÀM MÁT TIÊU CHUẨN THẬN TRỌNG: RÒ RỈ", -- Clean water
            WATER_DIRTY = "CẦN THIẾT BỊ LỌC BÊN NGOÀI", -- Dirty water
            WATER_SALTY = "ĂN MÒN CƠ THỂ", -- Saltwater

            GOOPYDRINK = "NƯỚC BIẾN THÀNH ĐIỀU KHỦNG KHIẾP", -- Failed drink (concept of wet roast)

            -- Kettle Drinks

            FRUITJUICE = "HỖN HỢP POD NĂNG LƯỢNG", -- Nước ép trái cây hỗn hợp
            BERRIES_JUICE = "NGUỒN NGỌT TUYỆT VỜI", -- Nước ép quả mọng
            POMEGRANATE_JUICE = "GHI NHỚ: CHẤT LỎNG MÀU ĐỎ LÀ MÁU", -- Nước ép lựu
            BANANA_JUICE = "KHÔNG PHẢI SẢN PHẨM SỮA", -- Nước chuối
            FIG_JUICE = "MỘT DẠNG CHẤT DINH DƯỠNG", -- Nước ép quả sung
            DRAGONJUICE = "SỢI LỎNG", -- Nước ép thanh long
            GLOWBERRYJUICE = "CHẤT LỎNG PHÁT QUANG", -- Nước ép Glowberry
            WATERMELON_JUICE = "UỐNG NHIỀU NƯỚC ÉP", -- NƯỚC ÉP DƯA HẤU

            VEGGIE_TEA = "HỮU CƠ CHẤT LỎNG", -- NƯỚC RAU CỦ
            CARROT_TEA = "BETA-CAROTENE ĐẬM", -- NƯỚC CÀ RÊ
            CACTUS_TEA = "HOÀN THÀNH VÔ HIỆU HÓA TƯỜNG CHÁY", -- NƯỚC CACTUS (HÀNH HÓA RÀO CẢN BẢO VỆ)
            TOMATO_JUICE = "CÓ HOÀN TOÀN NGHỈ HA HA", -- NƯỚC CÀ CHUA (CÓ HOÀN TOÀN NGHỈ HA HA)
            LUMPY_TEA = "CẤP TRUY CẬP ROOT", -- ROOT TEA (CẤP QUYỀN ROOT)
            SEAWEED_SHAKE = "50% BIỂN, 50% CỎ", -- RONG BIỂN (AFS: TÀI LIỆU THAM KHẢO SPONGEBOB, NHẠY CẢM MỘT TẬP TRONG NƠI SINH VẬT KIỂM SOÁT SPONGEBOB VÀ NÓI 50% ÁC)

            GREENTEA = "CHỈ ĐUN LÁ", -- TRÀ XANH NGUYÊN LIỆU (CHỈ LÀ NƯỚC LÁ)
            BLACKTEA = "CHIẾT XUẤT ĐỎ TỪ CHẤT LƯỢNG ĐEN", -- TRÀ ĐEN (CHIẾT XUẤT ĐỎ TỪ CHỐNG CHỈNH LÁ ĐEN)
            BLACKTEA_ICED = "TĂNG CƯỜNG LÀM MÁT", -- TRÀ ĐEN ĐÁ
            FUER = "CHIẾT XUẤT TỪ LÁ TƯƠI", -- FU'ER, TRÀ LÁ, TRÀ FERN
            MIXFLOWER = "HƯƠNG VỊ VẺ ĐẸP PHÁ HỦY", -- TRÀ CÁNH HOA HỖN HỢP
            HIBISCUSTEA = "DỊCH CHUA ĐẬM ĐẶC", -- TRÀ HIBISCUS (DUNG DỊCH CHUỘT ĐẬM)
            CACTUSFLOWER_TEA = "NƯỚC ÉP TƯƠI", -- TRÀ HOA CACTUS (Nước ép từ thịt!) (AFS: TRÀ HOA CACTUS LÀ XANH ĐÂY LÀ THAM KHẢO ĐẾN TRÒ CHƠI NHẠI CỦA YICHENGUNSO)
            LOTUSTEA = "NẤU HOA LOTUS THÀNH NƯỚC", -- TRÀ SEN
            SUSHIBISCUS = "KHÁ ĐẶC BIỆT", -- TRÀ TỰ TỬ
            MOON_BLOSSOM_TEA = "KHÔNG CÓ KHẢ NĂNG TÁI SINH HEHEHE",

            CAFFEINBERRY_JUICE = "CHẤT LÀM MÁT ĐỂ ÉP XUNG", -- CÀ PHÊ ĐEN
            TOFFEE_LATTE = "KHÔNG BAO GỒM BOLT", -- TOFFEE NUT LATTE (KHÔNG BAO GỒM BOLT)
            RUINCHA_LATTE = "HỖN HỢP ĐẬU HỖN HỢP", -- MOCHA LATTE (CÀ PHÊ + CHOCOLATE)

            HOTRUINCOLATE = "Chất LÀM MÁT COCOA", -- CHOCOLATE NÓNG
            RUINCOLATE_SMOOTHIE = "CHẤT LÀM MÁT COCOA CÓ ĐƯỜNG CAO", -- CHOCOLATE SMOOTHIE (LẠNH)
            RUINXOColaTL = "CHẤT LÀM MÁT COCOA KHÔNG ĐƯỜNG", -- CHOCOLATL (ĐẮNG)
            TEA_RUINCOLATE_LATTE = "LÁ TRÀ NGHIỀN VÀ CHIẾT XUẤT ĐẬU", -- MATCHA LATTE

            MULLED = "MẤT ETHANOL NHIỀU NHẤT", -- BANCHAO (RƯỢU MULLED)
            BUTTERBEER = "CHỐNG ĐÔNG ETHANOL KHÔNG CỒN", -- BƯỚM (CHỐNG ĐÔNG ETHANOL KHÔNG Cồn)

            -- COLLABORATIVE KETTLE DRINKS

            COCONUT_JUICE = "Giàu chất điện giải", -- LOẠI NƯỚC DỪA
            RAINBOW_SHAKE = "TÁO RAINBOW TIA", -- Đuổi thạch cầu vồng
            QUARTZ_SHAKE = "HỖN HỢP CÁC SINH VẬT ĐẤT VÀ BIỂN", -- BỎ ĐI GLITTER JELLY SHAKE
            CHERRY_ROSEBERRIES_TEA = "FLUID VỚI HƯƠNG HOA HỒNG", -- TRÀ HƯƠNG RỪNG CHERRY
            CHERRY_HONEY_TEA = "ĐO ĐỘ NGỌT ĐÃ ĐƯỢC THỰC HIỆN: THẤT BẠI", -- TRÀ MẬT ONG CHERRY RỪNG ANH ĐÀO
            SWEET_RICE_DRINK = "CẢNH BÁO: NỘI DUNG MALTOSE QUÁ QUÁ", -- VITAHEBOK SIKHYE (CẢNH BÁO: CHỨA SỐ LƯỢNG MALTOSE QUÁ)
            APPLEPINE_JUICE = "TỪ CHỐI LIÊN KẾT VỚI BỌT BIỂN", -- NƯỚC DỨA LEGION
            CITROYUZU_JUICE = "nghiền để tiêu thụ", -- THÊM GÓI THỰC PHẨM NƯỚC CAM
            STRAWBERRY_SMOOTHIE = "KẾT CẤU LÀM TÔI KHÔNG THOẢI MÁI", -- THÊM GÓI THỰC PHẨM MẶT NẠ DÂU TUYỆT VỜI
            STRAWBERRY_MILK_SMOOTHIE = "Dâu tây được chụp dưới dạng", -- THÊM GÓI THỰC PHẨM DÂU TUYỆT VỜI LATTE

            -- BREWERY DRINKS

            SPOILED_DRINK = "KHÔNG TƯƠNG THÍCH VỚI HỆ THỐNG LÀM LẠNH", -- SPOILED_DRINK

            -- BREWERY SODA

            SODA = "DUNG DỊCH CARBON DIOXIDE", -- NƯỚC Cacbonat (DUNG DỊCH CO2)
            FRUITSODA = "DUNG DỊCH CARBON DIOXIDE CÓ THÊM FRUCTOSE", -- SODA TRÁI CÂY (DUNG DỊCH CO2 VỚI FRUCTOSE)
            LIMONSODA = "CHỨA LƯỢNG LỚN ACID CITRIC", -- LEMON LIME SODA (NÂNG CẤP SODA TRÁI CÂY)
            COLA = "Chất lỏng caramel được các sinh vật ngu ngốc yêu thích", -- Cola
            COLAQUANTUM = "CHỨA LƯỢNG BỨC XẠ LỚN", -- Cola QUANTUM
            LUMPY_BEER = "NĂM KIẾM KHÔNG THỂ KIẾM ĐƯỢC VỚI SỰ THẬT CARBON CỦA SINH VẬT", -- BIA GỐC (KHÔNG CÓ CỒN)

            -- BREWERY SPIRITS

            CORN_BEER = "BẮP - CÀI ĐẶT RƯỢU BỔ SUNG", -- BIA BẮP
            MADHU = "SẢN PHẨM CHẾ BIẾN CỦA MỘT NGÀY LÀM VIỆC", -- RƯỢU MẬT ONG MADHU
            WINE = "CÁI QUẢ ĐÃ QUA QUY TRÌNH KHÔNG HIỆU QUẢ", -- RƯỢU (PHÁT BERRY CƠ BẢN)
            NOBLEWINE = "ĐANG ĐANG THÊM MỘT QUY TRÌNH Ủ", -- RƯỢU VANG NOBLE (PHƯƠNG PHÁP Ủ BERRY)
            SPARKLINGWINE = "CHỨA TẤT CẢ CÁC YẾU TỐ TUYỆT VỜI CHO HỆ TIÊU HÓA", -- SparkLING WINE
            GLOWBERRYWINE = "RƯỢU TỰ PHÁT SÁNG", -- RƯỢU GLOW BERRY
            KUMIS = "'/D3D7D4' ĐƯỢC BẢO QUẢN", -- KUMIS, SỮA NGỰA LÊN MEN (LÊN MEN: D3D7D4 LÀ MÃ MÀU TRẮNG NHẸ)
            LUMPY_WINE = "RỐC CỦA SINH VẬT ĐƯỢC SỬ DỤNG CHO NHIỀU MỤC ĐÍCH KHÁC NHAU", -- RƯỢU SUR (KHOAI TAY, KHOAI TÂY NGỌT, RƯỢU ETC ROOT)
            PULQUE = "BAO GIỜ SẼ KẾT THÚC QUÁ TRÌNH TỰ TIẾN HÓA CỦA VI SINH VẬT BAO GỒM?", -- PULQUE (RƯỢU TRÁI AgAVE)
            RUINCACAO_WINE = "KHÁM PHÁ KHẢ NĂNG MỚI CỦA CACAO", -- RƯỢU CACAO

            -- COLLABORATIVE SODA

            CHERRY_DOCTOR_COLA = "AI TẠO RA MỘT HYBRID NHƯ VẬY?", -- CHERRY FOREST DOCTOR PEPPER (DOCTOR CHERRY)
            APPLEPINESODA = "ĐÃ SỬ DỤNG ĐIỀU CHỈNH THÔNG", -- Dứa có ga (ORANCHI)
            CITROYUZUSODA = "Được sản xuất để khuyến khích hành vi của sinh vật", -- CAM có ga (FANTA)
            STRAWBERRYSODA = "Gợi lên ý nghĩ của linh hồn quỷ", -- DÂU CÓ Cacbonat (WELCH'S STRAWBERRY)

            -- COLLABORATIVE SPIRITS

            AUROBOW = "BAO GỒM MỘT PHẦN BỔ SUNG VUI CHƠI", -- RƯỢU THÁI CẦU VỒNG CAST AWAY
            COCONUT_WINE = "DẦU BÔI TRƠN CHUYỂN THÀNH ĐỒ UỐNG", -- RƯỢU DỪA ĐANG BỎ
            CHERRY_BLOOM_MADHU = "ETHANOL ĐƯỢC LÀM TRƯỚC", -- RƯỢU MẬT ONG CHERRY RỪNG CHERRY BLOSSOM
            GIANT_BLUEBERRY_WINE = "VẪN NGUY HIỂM", -- VITAHEBOK BÙM! BERRY SAPPHIRE (PHÁT NỔ KHI ĐÁNH LỬA)
            RICE_WINE = "SẢN PHẨM PHỤ ĐƯỢC CHẾ BIẾN", -- VITAHEBOK MAKGEOLLI (RƯỢU GẠO)
            WHEAT_BEER = "HẠT LÃNG PHÍ", -- ĐỒNG THỰC PHẨM BIA LÚA MÌ
            PALE_BEER = "KHẢ NĂNG KHÔNG THỂ TUYỆT VỜI", -- LEGION PALE ALE (SỬ DỤNG TRÁI CÂY MONSTERA CHO MÀU XANH)

            -- DISTILLED SPIRITS

            DISINFECTANT = "DUNG DỊCH Diệt khuẩn", -- CHẤT KHUẨN TRỊ (CHỮA CHỮA CHỮA KHÍ KHÁNG SINH)
            CORN_WHISKEY = "Đạt được nồng độ cao hơn", -- CORN WHISKEY
            LUMPY_VODKA = "Nồng độ ETHANOL RẤT CAO", -- VODKA
            TEQUILA = "Hồng Ngoại VÀ CỘNG HƯỚNG CỦA MẶT TRỜI", -- TEQUILA
            MADHU_RUM = "Tương thích với môi trường trên dạ dày", -- RUM
            BERRY_BRANDY = "QUY TRÌNH THẬT SỰ DÀI", -- BERRY BRANDY
            AREUHI = "P-TYPE FLUID", -- RƯỢU CHƯA TỪ KUMIS (LÊN MEN: D3D7D4 LÀ MÃ MÀU TRẮNG NHẸ)

            -- WARLY EXCLUSIVE DISTILLED SPIRITS

            BERRY_GIN = "PHỔ BIẾN TRONG XÃ HỘI CON NGƯỜI", -- GIN
            GLOWBERRY_GIN = "CHỨA NĂNG LƯỢNG NĂNG ĐỘNG TUYỆT VỜI", -- GLOW BERRY GIN (PHÁT NỔ KHI BẮT ĐẦU)
            ABSINTHE = "BẠN MUỐN CẮT TAI", -- ABSINTHE
            TEA_LUMPY_VODKA = "HÀM LƯỢNG CHLOROPHYLL Dồi dào", -- LIQUEUR TRÀ XANH
            PETALS_BERRY_BRANDY = "CHỈ GIỐNG NHƯ MỘT NGƯỜI KHÁC BIỆT", -- ROSE PETAL BRANDY
            KAHLUA = "BAO GỒM CHỨC NĂNG NĂNG LƯỢNG CAO", -- CÀ PHÊ LIQUEUR KAHLUA
            NUT_CORN_WHISKEY = "BULT Ở ĐÂU?", -- NUT WHISKEY (KAHLUA)
            RUINCACAO_CREAM_LIQUEUR = "CHIẾT XUẤT TAR VÀ PROTEIN ETHANOL TUYỆT VỜI",
            RUMCHATA = "TẠI SAO PHA TRỘN CÁC CHẤT HỮU CƠ TUYỆT VỜI?",

            -- COLLABORATIVE DISTILLED SPIRITS

            MOONWAY = "BẢO QUẢN VẬT CHẤT HỮU CƠ PHÁT SÁNG", -- BỎ LOẠI THẦN CƯỢC CẦU VỒNG CẦU VỒNG
            ARRACK = "ETANOL CÓ XƠ CAO", -- ARRACK (PHIÊN BẢN RƯỢU DỪA INDONESIAN)
            CHERRY_BLOOM_RUM = "BAO GỒM VFX KHÔNG CẦN THIẾT", -- RUM MẬT ONG CHERRY BLOSSOM (Cánh hoa anh đào nổi)
            RICE_SPIRITS = "SẢN PHẨM PHỤ CÒN LẠI", -- RƯỢU GẠO (CHEONGJU)
            WHEAT_WHISKEY = "THỜI GIAN ĐẦU TƯ VÀ NGŨ CÂY QUÝ", -- WHEAT WHISKEY
            PALE_WHISKEY = "PHONG CÁCH MỸ", -- PALE MALT WHISKEY

            -- WARLY EXCLUSIVE COLLABORATIVE DISTILLED SPIRITS

            NUT_COCONUT_BRANDY = "ĐỘC QUYỀN DÀNH CHO CÁC SẢN PHẨM PHỤ CỦA SINH VẬT BIỂN KHÓ CHỊU", -- BRANDY DỪA (ĐỔI TÊN THÀNH THƯƠNG HIỆU CARIBBEAN VÌ KHÔNG THỂ TẠO RA RUM CARIBBEAN)
            GIANT_BLUEBERRY_GIN = "ĐÃ CÓ NĂNG LƯỢNG ĐỘNG TUYỆT VỜI", -- BÙM BERRY SAPPHIRE (PHÁT NỔ KHI BẮT ĐẦU)

            -- POT RECIPES

            DARK_RUINCOLATE = "KHỐI LƯỢNG CACAO NGUYÊN CHẤT ĐÃ CHẾ BIẾN", -- SÔ CÔ LA ĐEN
            WHITE_RUINCOLATE = "CHỨA 20% BƠ COCOA", -- SÔ CÔ LA TRẮNG
            RUINCOLATE = "CACAO ĐÃ CHẾ BIẾN", -- CHỈ LÀ SÔ CÔ LA
            RUIN_SCHOKAKOLA = "BOOSTER NHIÊN LIỆU RẮN", -- CHOKAKOLA

            BUCKET_STEEL_EMPTY =
            {
                EMPTY = "CHẮC CHẮN NÂNG CAO", -- XÔ THÉP RỖNG (CHẮC CHẮN NÂNG CAO)
                FULL = "Ngay cả mưa chết tiệt cũng có công dụng", -- NƯỚC MƯA SẠCH (Ngay cả mưa chết tiệt cũng có công dụng)
                FULL_ICE = "ĐÔNG LẠNH", -- NƯỚC MƯA ĐÔNG LẠNH (ĐÓ LÀ ĐÔNG LẠNH)
                DIRTY = "NỘI DUNG BỊ HỎNG", -- NƯỚC BẨN (NỘI DUNG BỊ HỎNG)
                DIRTY_ICE = "NƯỚC RẮN LỌC", -- NƯỚC ĐÔNG LẠNH BẨN (NƯỚC RẮN LỌC)
            },

            BUCKET_WOODIE_EMPTY =
            {
                EMPTY = "KHÔNG CÓ VẤN ĐỀ VỀ TÍNH CHÍNH TRỌNG MẶC BẰNG BẰNG NGOẠI MÔ TẢ", -- XÔ GỖ RỖNG (KHÔNG CÓ VẤN ĐỀ VỀ TÍNH CHÍNH TRỰC DÙ BẰNG NGOẠI TUYỆT VỜI MÔ TẢ)
                FULL = "Ngay cả mưa chết tiệt cũng có công dụng", -- NƯỚC MƯA SẠCH (Ngay cả mưa chết tiệt cũng có công dụng)
                FULL_ICE = "ĐÔNG LẠNH", -- NƯỚC MƯA ĐÔNG LẠNH (ĐÓ LÀ ĐÔNG LẠNH)
                DIRTY = "NỘI DUNG BỊ HỎNG", -- NƯỚC BẨN (NỘI DUNG BỊ HỎNG)
                DIRTY_ICE = "NƯỚC RẮN LỌC", -- NƯỚC ĐÔNG LẠNH BẨN (NƯỚC RẮN LỌC)
            },

            BUCKET_DRIFTWOOD_EMPTY =
            {
                EMPTY = "NÓ CÓ CẢI THIỆN HIỆU SUẤT THÌ CŨNG CHẢ KHIẾN TÔI ẤN TƯỢNG ĐÂU", -- XÔ GỖ RỖNG (KHÔNG CÓ VẤN ĐỀ VỀ TÍNH CHÍNH TRỰC DÙ BẰNG NGOẠI TUYỆT VỜI MÔ TẢ)
                FULL = "Ngay cả mưa chết tiệt cũng có công dụng", -- NƯỚC MƯA SẠCH (Ngay cả mưa chết tiệt cũng có công dụng)
                FULL_ICE = "ĐÔNG LẠNH", -- NƯỚC MƯA ĐÔNG LẠNH (ĐÓ LÀ ĐÔNG LẠNH)
                DIRTY = "NỘI DUNG BỊ HỎNG", -- NƯỚC BẨN (NỘI DUNG BỊ HỎNG)
                DIRTY_ICE = "NƯỚC RẮN LỌC", -- NƯỚC ĐÔNG LẠNH BẨN (NƯỚC RẮN LỌC)
            },

            BUCKET_EMPTY =
            {
                EMPTY = "NÓ CHỨA NƯỚC KHỦNG", -- XÔ GỖ RỖNG (NÓ CHỨA NƯỚC KHỦNG)
                FULL = "Ngay cả mưa chết tiệt cũng có công dụng", -- NƯỚC MƯA SẠCH (Ngay cả mưa chết tiệt cũng có công dụng)
                FULL_ICE = "ĐÔNG LẠNH", -- NƯỚC MƯA ĐÔNG LẠNH
                DIRTY = "NỘI DUNG BỊ HỎNG", -- NƯỚC BẨN (NỘI DUNG BỊ HỎNG)
                DIRTY_ICE = "BẨN VÀ RẮN", -- NƯỚC ĐÔNG BẨN
            },

            DESALINATOR =
            {
                EMPTY = "INPUT REQUIRED", -- DESALINATOR (KHÔNG CÓ NƯỚC)
                PURIFY_LONG = "ĐANG TÁCH MUỐI ĐANG TIẾN HÀNH", -- DESALINATOR (Còn RẤT NHIỀU THỜI GIAN)
                PURIFY_SHORT = "Tách MUỐI GẦN HOÀN THÀNH", -- CÔNG CỤ DESALINATOR (CẦN HOÀN THÀNH)
                HASWATER = "Khử Mặn THÀNH CÔNG", -- Khử Muối (NƯỚC SẠCH)
                BURNT = "MẤT CHỨC NĂNG", -- BỘ Khử Mặn CHÁY (KHÔNG ĐẶT HÀNG)
                HASSALT = "CẦN LOẠI BỎ MUỐI", -- Khử muối (TRÁI MUỐI)
            },

            BARREL =
            {
                GENERIC = "THIẾT BỊ LƯU TRỮ NƯỚC BÊN NGOÀI", -- THÙNG (RỖNG)
                BURNT = "WATER.EXE KHÔNG TRẢ LỜI", -- BURNT BARREL
            },

            BREWERY =
            {
                EMPTY = "VÒNG ƯỚP VI SINH VẬT", -- NHÀ MÁY BIA (RỖNG)
                BURNT = "ĐANG TẮT ĐANG CƯỠNG BỨC", -- NHÀ MÁY BIA CHÁY (THIẾT BỊ TẮT)
                FERMENTING_LONG = "SẼ MẤT THỜI GIAN DÀI", -- BIA (RẤT NHIỀU THỜI GIAN)
                FERMENTING_SHORT = "GẦN HOÀN THÀNH", -- NHÀ MÁY BIA (GẦN HOÀN THÀNH)
                DONE = "HOÀN THÀNH LÊN MEN", -- NHÀ MÁY BIA (HOÀN THÀNH Ủ)
            },

            CAMPKETTLE_ITEM = "PHƯƠNG PHÁP LỌC SÁNG TUYỆT VỜI", -- MỤC ẤM TRẠI (PHƯƠNG PHÁP LỌC SƠN)
            CAMPKETTLE =
            {
                GENERIC = "CẦN BỔ SUNG ĐỘ ẨM", -- Ấm TRẠI (KHÔNG CÓ NƯỚC)
                BOILING_LONG = "SẼ MẤT THỜI GIAN", -- Ấm TRẠI (BẮT ĐẦU SÔI)
                BOILING_SHORT = "GẦN HOÀN THÀNH", -- Ấm đun nước TRẠI (CẦN HOÀN THÀNH)
                DONE = "HOÀN THÀNH THANH LỌC", -- Ấm TRẠI (HOÀN THÀNH THANH LỌC)
                STOP = "CẦN NHIỆT", -- Ấm TRẠI (KHÔNG CHÁY, NỘI DUNG BỊ HỎNG)
            },

            CAMPDESALINATOR_ITEM = "THIẾT BỊ ĐỂ LOẠI BỎ MUỐI", -- MỤC DESALINATOR TRẠI
            CAMPDESALINATOR =
            {
                GENERIC = "CẦN BỔ SUNG NƯỚC MẶN", -- MÁY Khử Mặn TRẠI (KHÔNG CÓ NƯỚC)
                BOILING_LONG = "SẼ MẤT THỜI GIAN", -- CAMP DESALINATOR (BẮT ĐẦU SÔI)
                BOILING_SHORT = "GẦN HOÀN THÀNH", -- CÔNG CỤ TUYỆT VỜI TRẠI (CẦN HOÀN THÀNH)
                DONE = "HOÀN THÀNH LOẠI BỎ MUỐI", -- MÁY Khử Mặn TRẠI (HOÀN THÀNH LỌC)
                STOP = "CẦN LÀM NHIỆT", -- MÁY Khử Mặn TRẠI (KHÔNG LỬA, TRÁI MUỐI)
            },

            KETTLE =
            {
                EMPTY = "MỤC ĐÍCH TỐT NHẤT KHI NƯỚC HORRIBLE", -- Ấm đun nước rỗng (RỖNG)
                BURNT = "ẤM QUÁ NHIỆT", -- Ấm CHÁY
                BOILING_LONG = "SẼ MẤT THỜI GIAN", -- KETTLE (BẮT ĐẦU SÔI)
                BOILING_SHORT = "GẦN HOÀN THÀNH", -- KETTLE (CẦN HOÀN THÀNH)
                DONE = "HỖN HỢP LÀM MÁT HOÀN THÀNH", -- KETTLE (HỖN HỢP LÀM MÁT HOÀN THÀNH)
                PURIFY_LONG = "ĐANG LÀM SẠCH BỔ SUNG", -- KETTLE (BẮT ĐẦU LÀM SẠCH)
                PURIFY_SHORT = "SẮC LỌC GẦN HOÀN THÀNH", -- KETTLE (GẦN HOÀN THÀNH)
                HASWATER = "YÊU CẦU ĐẦU VÀO BỔ SUNG", -- Ấm đun nước (NƯỚC SẠCH)
                MELT_LONG = "ĐANG TAN BĂNG", -- KETTLE (BẮT ĐẦU TUYỆT VỜI)
                MELT_SHORT = "RÃ ĐÔNG GẦN HOÀN THÀNH", -- KETTLE (ALMOST DONE)
            },

            PORTABLEKETTLE_ITEM =
            {
                GENERIC = "RẤT VUI KHI ĐƯỢC GẶP EM, EM TRAI CỦA TÔI", -- MÓN ẤM DI ĐỘNG
                EMPTY = "CODE 418: TRÀ PHÒNG", -- ẤM ẤM DI ĐỘNG RỖNG ĐƯỢC LẮP ĐẶT (MÃ 418: ĐÂY LÀ NẤM TRÀ)
                BOILING_LONG = "SẼ MẤT THỜI GIAN", -- Ấm DI ĐỘNG (BẮT ĐẦU SÔI)
                BOILING_SHORT = "GẦN HOÀN THÀNH", -- Ấm DI ĐỘNG (CẦN HOÀN THÀNH)
                DONE = "HỖN HỢP LÀM MÁT HOÀN THÀNH", -- Ấm DI ĐỘNG (HỖN HỢP LÀM MÁT HOÀN THÀNH)
                PURIFY_LONG = "ĐANG LÀM SẠCH BỔ SUNG", -- Ấm DI ĐỘNG (BẮT ĐẦU LÀM SẠCH)
                PURIFY_SHORT = "SẮC LỌC GẦN HOÀN THÀNH", -- Ấm DI ĐỘNG (GẦN HOÀN THÀNH)
                HASWATER = "YÊU CẦU ĐẦU VÀO BỔ SUNG", -- Ấm DI ĐỘNG (NƯỚC SẠCH)
                MELT_LONG = "Đang tan băng", -- Ấm DI ĐỘNG (BẮT ĐẦU TUYỆT VỜI)
                MELT_SHORT = "ĐANG Rã đông GẦN HOÀN THÀNH", -- Ấm DI ĐỘNG (GẦN HOÀN THÀNH)
            },

            DISTILLERS =
            {
                EMPTY = "MỘT NGƯỜI EM TUYỆT VỜI", -- MÁY CHưng cất (EMPTY)
                DISTILLTING_LONG = "SẼ MẤT THỜI GIAN DÀI", -- MÁY CHưng cất (Còn RẤT NHIỀU THỜI GIAN)
                DISTILLING_SHORT = "HẦU HOÀN THÀNH", -- MÁY CHẾ BIẾN (HẦU HOÀN THÀNH)
                DONE = "HOÀN THÀNH QUY TRÌNH Chưng Cất", -- MÁY CHưng Cất (HOÀN THÀNH Ủ)
            },

            WELL_WATERPUMP = {
                HIGH_PRESSURE = "ÁP LỰC LẠI TỐI ĐA", -- BƠM NƯỚC Giếng (ÁP LỰC TỐI ĐA)
                MIDDLE_PRESSURE = "ÁP SUẤT Ở MỨC ĐÚNG", -- BƠM NƯỚC Giếng (ÁP SUẤT TRUNG BÌNH)
                LOW_PRESSURE = "ÁP SUẤT CÒN LẠI THẤP", -- BƠM NƯỚC Giếng (ÁP LỰC THẤP)
                RECHARG_PRESSURE = "THỜI GIAN CẦN ĐỂ KHÔI PHỤC ÁP SUẤT", -- BƠM NƯỚC Giếng (KHÔNG ĐẶT HÀNG)
            },

            WELL_SPRINKLER =
            {
                LOWFUEL = "TÔI CÓ CẦN CUNG CẤP NHIÊN LIỆU CHO PHÂN TỬ NGUY HIỂM không?", -- MÁY TẮM TỐT (NHIÊN LIỆU THẤP)
                ON = "AAAAH!", -- MÁY TẮM TỐT (CHẠY)
                OFF = "GIỮ XEM", -- TẮM RƯỢU TỐT (TẮT)
            },
        },
    }