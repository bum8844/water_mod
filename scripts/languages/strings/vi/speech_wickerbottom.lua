return {
    ACTIONFAIL =
    {
        GIVE =
        {
            WELL_NOTEMPTY = "Bạn cần lấy nước từ giếng có đủ nước.", -- Trên giếng có một cái xô khô và bạn đã cố gắng đặt một cái xô lên đó.
            WELL_BUSY = "Đợi đã.", -- Trên giếng có một xô chứa đầy nước và bạn đã cố gắng đặt một xô lên đó.
        }
    },

    ANNOUNCE_DRUNK = "Fe...Cảm thấy hơi choáng váng...chóng mặt...", -- Say rượu
    ANNOUNCE_DRUNK_END = "Dù sao, việc uống rượu quá mức là hoàn toàn bị cấm.", -- Tỉnh táo sau rượu (Nôn nao)
    ANNOUNCE_DRUNK_IMMUNITY = "", -- Tạm thời. Chỉ có Wickerbottom.
    ANNOUNCE_NOTCHARGE = "Bạn không thể vắt sữa khi chưa sạc.", -- Không thể vắt sữa bằng xô vì Dê Volt không được sạc.
    ANNOUNCE_NOTHIRSTSLEEP = "", -- Khát nhưng cố ngủ vào ban đêm -- Không dùng cho Wickerbottom
    ANNOUNCE_NOTHIRSTSIESTA = "", -- Khát nhưng cố ngủ vào ban ngày -- Không dùng cho Wickerbottom
    ANNOUNCE_SLEEP_END = "", -- Hoàn toàn tỉnh táo sau khi ngủ -- Không dùng cho Wickerbottom
    ANNOUNCE_THIRST = "Tôi cần đồ uống từ căng tin.", -- Khát quá!

    ANNOUNCE_CAFFINE_BUFF_START = "Tác dụng của caffeine đang bắt đầu phát huy tác dụng.", -- Quá trình tăng cường caffeine bắt đầu
    ANNOUNCE_CAFFINE_BUFF_STOP = "Quá trình chuyển hóa caffeine trong cơ thể tôi đã kết thúc.", -- Quá trình buff caffeine kết thúc

    ANNOUNCE_CURE_WATERBORNE = "Nỗi đau do bệnh lây qua đường nước đang bắt đầu giảm bớt.", -- Đối thoại khi chữa bệnh lây qua đường nước bằng một vật phẩm

    ANNOUNCE_DCAPACITY_CRITICAL = "Không nên uống quá nhiều. Uống quá nhiều sẽ ảnh hưởng xấu đến gan và hệ tiêu hóa...", -- Ngay trước khi say
    ANNOUNCE_DCAPACITY_HALF = "Uống rượu vừa phải có một số lợi ích cho cơ thể.", -- Khi bắt đầu say

        DESCRIBE =
        {
            BOILBOOK = "Tổng hợp thông tin đồ uống.",

            WATER_CLEAN_ICE = "Nước đông đặc.", -- Đá sạch
            WATER_DIRTY_ICE = "Nước đông đặc chứa vi khuẩn.", -- Đá bẩn

            SPICE_CAFFEINPEPPER = "Từng là một loại gia vị rất có giá trị.", -- Gia vị Caffeinpepper

            WELL_KIT = "Vật liệu xây dựng dùng để lấy nước từ tầng ngậm nước sâu.", -- Bộ dụng cụ giếng
            WELL_SPRINKLER_KIT = "Máy dùng để hút nước từ tầng ngậm nước sâu cho nông nghiệp.", -- Bộ phun nước
            WELL_WATERPUMP_KIT = "Máy dùng để bơm nước từ tầng ngậm nước sâu.", -- Bộ máy bơm nước bằng hơi nước
            WELL_BURYING_KIT = "Dụng cụ chôn giếng khi nó không còn cần thiết hoặc không còn hoạt động.", -- Bộ chôn lấp
            WELL_DRILLING = "Tôi đang cố gắng tìm hiểu xem ở đây có tầng chứa nước hay không.", -- Khoan một lỗ
            WELL_DRILLING_ITEM = "Tôi cần tìm một vị trí thích hợp nơi có thể có tầng chứa nước.", -- Vật phẩm khoan
            HOLE = "Tôi nghe thấy tiếng nước nên có vẻ như tôi đã đào đúng cách.", -- Hố giếng
            WELL = "Một công trình dùng để lấy nước từ tầng ngậm nước sâu.", -- Well

            WX78MODULE_NONEDRUNK = "Họ không thích chất hữu cơ, nhưng dường như không phản đối việc lấy cảm hứng từ chúng.", -- 78전용 묘듈

            -- Cây chế độ nước

            TEA_TREE = "Một loại cây hoa trà nhỏ.", -- Cây trà
            DUG_TEA_TREE = "Nó cần đất để phát triển.", -- Cây chè (đào)
            TEA_SEED = "Hạt từ cây chè.", -- Hạt chè
            TEA_SEED_COOKED = "Trồng sẽ tốt hơn.", -- Hạt trà đã nấu chín
            TEA_SEED_SAPLING = "Cây giống cây trà sẽ phát triển.", -- Cây non cây trà
            TEALEAVES = "Đây là những lá trà nhỏ.", -- Lá trà
            TEALEAVES_DRIED = "Chúng sẽ được dùng để pha trà đen.", -- Lá trà khô

            CAFFEINBERRY = "Một loại cây bụi thấp mọc trên đất cát.", -- bụi Caffeinberry
            DUG_CAFFEINBERRY = "Sự kết hợp giữa cà phê và hạt tiêu.", -- Đào bụi cây Caffeinberry
            CAFFEINBERRY_BEAN = "Nó có mùi thơm độc đáo.", -- Hạt cà phê thô
            CAFFEINBERRY_BEAN_COOKED = "Rang sẽ tạo ra cà phê đậm đà và một chút hạt tiêu.", -- Hạt cà phê đã nấu chín

            RUINCACAO_TREE = "Quả này chắc chắn đã rơi xuống hố.", -- Cây Ruincacao
            DUG_RUINCACAO_TREE = "Nó cần đất để phát triển.", -- Cây Ruincacao (đào)
            RUINCACAO_SEED = "Hạt giống từ cây Ruincacao.", -- Hạt giống Ruincacao
            RUINCACAO_SEED_SAPLING = "Cây giống Ruincacao sẽ phát triển.", -- Cây non Ruincacao
            RUINCACAO = "Nó được sử dụng làm tiền tệ trong các nền văn minh Aztec cổ đại.", -- Ruincacao chưa được đập vỡ
            RUINCACAO_BEAN = "Nó được làm từ một ít bơ và đậu Ruincacao.", -- Đậu Ruincacao nghiền nát
            RUINCACAO_BEAN_COOKED = "Dùng làm sôcôla hoặc đồ uống.", -- Đậu Ruincacao nấu chín

            -- Phụ gia chưng cất

            ADDITIVE_SEED = "Thêm hương vị hạt vào rượu.", -- Phụ gia hạt giống cho rượu (họa tiết Anise, Juniperberry, Palgak)
            ADDITIVE_PETALS = "Thêm hương vị lá và hoa vào rượu.", -- Phụ gia thảo mộc và cánh hoa cho rượu (Trà xanh, Cánh hoa)
            ADDITIVE_NUT = "Thêm hương vị hạt vào rượu.", -- Phụ gia hạt cho rượu (Birchnut, Coconut, Coffee Bean, Ruincacao Bean)
            ADDITIVE_DAIRY = "Thêm hương vị kem cho rượu.", -- Phụ gia sữa cho rượu

            -- Đồ uống

            WATER_CLEAN = "Cần thiết cho sự sống. Về mặt hóa học, đó là H₂O.", -- Nước sạch
            WATER_DIRTY = "Việc đun sôi nước này có thể giúp ngăn ngừa các bệnh lây truyền qua đường nước.", -- Nước bẩn
            WATER_SALTY = "Uống thứ này có thể dẫn đến mất nước.", -- Nước mặn

            GOOPYDRINK = "Ồ không, điều này không đúng chút nào.", -- Đồ uống không thành công (Khái niệm về goop ướt)

            -- Đồ uống ấm trà

            FRUITJUICE = "Ngay cả với các loại trái cây ngẫu nhiên cũng không tệ.", -- Nước ép trái cây hỗn hợp
            BERRIES_JUICE = "Có đặc tính hạ sốt và chống viêm.", -- Nước ép quả mọng
            POMEGRANATE_JUICE = "Giàu estrogen tự nhiên.", -- Nước ép lựu
            BANANA_JUICE = "Uống nước ấm cũng không tệ.", -- Nước chuối
            FIG_JUICE = "Một loại nước ép giải khát được tiêu thụ theo truyền thống ở Trung Đông.", -- Nước ép sung
            DRAGONJUICE = "Loại màu trắng có mùi thơm nhất.", -- Nước ép thanh long
            GLOWBERRYJUICE = "Tôi chưa bao giờ thấy đồ uống như thế này trước đây, thật tuyệt vời!", -- Nước ép Glowberry
            WATERMELON_JUICE = "Độ ẩm cao, hoàn hảo để giải khát.", -- Nước ép dưa hấu

            VEGGIE_TEA = "Thức uống đắng tốt cho cơ thể.", -- Nước ép xanh
            CARROT_TEA = "Giàu vitamin và sắt.", -- Trà cà rốt
            CACTUS_TEA = "Trà truyền thống được sản xuất ở một số vùng của Mexico.", -- Trà xương rồng (Trà Nopales thực sự tồn tại)
            TOMATO_JUICE = "Chứa các thành phần giúp giải độc cơ thể.", -- Nước ép cà chua
            LUMPY_TEA = "Chứa các thành phần làm giảm các bệnh lây qua đường nước.", -- Trà rễ
            SEAWEED_SHAKE = "Giàu axit alginic, làm cho nó đặc.", -- Rong biển lắc

            GREENTEA = "Có nguồn gốc ở Châu Á.", -- Lá trà xanh tươi
            BLACKTEA = "Cần một tách trà và một cuốn sách hay.", -- Trà đen
            BLACKTEA_ICED = "Nó tiếp thêm sinh lực cho tinh thần.", -- Trà đen đá
            FUER = "Chứa các thành phần làm giảm các bệnh lây truyền qua đường nước.", -- Boichaa, Trà lá, Trà Gwessari
            MIXFLOWER = "Sự pha trộn của nhiều loại hoa.", -- Trà cánh hoa hỗn hợp
            HIBISCUSTEA = "Được làm từ hoa thuộc chi Hibiscus.", -- Trà dâm bụt
            CACTUSFLOWER_TEA = "Ở một số vùng, nó được cho là tốt cho sức khỏe.", -- Trà Nopales
            LOTUSTEA = "Theo truyền thống được tiêu thụ trong những dịp đặc biệt ở khu vực Châu Á.", -- Trà sen
            SUSHIBISCUS = "Đợi đã... Đây không phải là trà Hibiscus.", -- Trà tự sát
            MOON_BLOSSOM_TEA = "Chỉ cần ở gần nó thôi cũng khiến tôi cảm thấy bình yên.", -- Trà hoa trăng

            CAFFEINBERRY_JUICE = "Tôi thích một tách cà phê và một cuốn sách hay.", -- Cà phê đen
            TOFFEE_LATTE = "Hương thơm đậm đà được tăng cường.", -- Toffeenut latte
            RUINCHA_LATTE = "Nó lấy tên từ người Maya. Sự kết hợp giữa cà phê và sô cô la.", -- Mocha latte (Cà phê + Ca cao)

            HOTRUINCOLATE = "Thức uống phát triển giống sô-cô-la đã được du lịch tới Châu Âu.", -- Sôcôla nóng
            RUINCOLATE_SMOOTHIE = "Một phiên bản sửa đổi của sô cô la nóng thành sinh tố lạnh!", -- Sinh tố sô cô la (lạnh)
            RUINXOCOLATL = "Một loại đồ uống cổ xưa có nguồn gốc từ người Aztec.", -- Chocolatl (đậm đà và cay)
            TEA_RUINCOLATE_LATTE = "Phương pháp này mang lại sự đa dạng cho các lựa chọn đồ uống.", -- Matcha latte

            MULLED = "Có vị như niềm vui cuối năm.", -- Bancha
            BUTTERBEER = "Một loại đồ uống hư cấu phổ biến; nó không phải là bia thật.", -- Butterbeer (loạt phim Harry Potter)

            -- Đồ uống cộng tác

            COCONUT_JUICE = "Nước dừa đã được tạo thành thạch nhờ quá trình lên men vi sinh vật.", --Shipwrecked Coconut Juice
            RAINBOW_SHAKE = "Thú vị, nó duy trì sự phát quang sinh học.", --Shipwrecked Rainbow Jelly Shake
            QUARTZ_SHAKE = "Tôi nên nghiên cứu riêng đặc tính của món súp cá này.", --Shipwrecked Quacken Soup Shake
            CHERRY_ROSEBERRIES_TEA = "Ngọt và thơm.", --Trà tầm xuân rừng anh đào
            CHERRY_HONEY_TEA = "Cảm giác ấm áp.", --Trà mật ong hoa anh đào rừng anh đào
            SWEET_RICE_DRINK = "Được lên men để tạo vị ngọt và dễ tiêu hóa.", --Vitacorp Sweet Hyphae
            PINEANANAS_JUICE = "Giàu bromelain, nên uống điều độ.", --More Food Pack Nước ép dứa
            ORANGE_JUICE = "Nước cam, nó giống như loại nước ép nổi.", --More Food Pack Orange Juice
            STRAWBERRY_SMOOTHIE = "Đá và dâu tây hòa quyện với nhau, uống với sữa sẽ ngon hơn.", --More Food Pack Strawberry Smoothie
            STRAWBERRY_MILK_SMOOTHIE = "Một loại đồ uống dâu tây phổ biến, đôi khi được làm bằng sữa chua thay vì sữa.", --More Food Pack Strawberry Milk Smoothie

            -- Pha đồ uống

            SPOILED_DRINK = "Thứ bạn uống đang trở thành nơi sinh sản của vi khuẩn.", --Spoiled Drink

            -- Pha nước ngọt

            SODA = "Carbon dioxide được hòa tan và ion hóa trong nước.", --Nước có ga
            FRUITSODA = "Nước ép trái cây được thêm vào nước có ga.", --Fruit Soda
            LEMONLIMESODA = "Có vị ngọt đậm.", --Lemon Lime Soda (Fruit Soda Superior)
            COLA = "Đây là đồ uống phổ biến gần đây ở Hoa Kỳ.", --Cola (Bối cảnh năm 1907, Coca-Cola tồn tại)
            COLAQUANTUM = "Hmm... Tôi nên điều tra xem có bất kỳ tác dụng phụ nào của việc tiêu thụ quá mức không.", --Cola Quantum (Chưa có dấu hiệu của bức xạ Cherenkov (ước tính vào khoảng năm 1911))
            LUMPY_BEER = "Các loại rau củ khác nhau được trộn vào.", --Root Beer (Không phải đồ uống có cồn)

            -- Pha rượu mạnh

            CORN_BEER = "Nó có nguồn gốc từ người Inca cổ đại.", --Bia ngô
            MADHU = "Mead được biết đến là thức uống có cồn đầu tiên do con người tạo ra.", --Mead
            WINE = "Ban đầu được làm từ nho, nhưng nó có lịch sử lâu đời.", --Wine (Berry Brewing)
            NOBLEWINE = "Vị ngọt đậm là do một loại nấm tên là Botrytis cinerea.", --Noble Wine (Roasted Berry Brewing)
            SPARKLINGWINE = "Ban đầu, carbon dioxide được giải phóng thông qua quá trình lên men, nhưng loại này đã bơm cacbonat một cách nhân tạo.", --Sparkling Wine
            GLOWBERRYWINE = "Một loại rượu mới, tôi nên tìm hiểu lý do tại sao nó không bị mất đi ánh sáng trong quá trình lên men.", --Glow Berry Wine
            KUMIS = "Thức uống truyền thống Trung Á.", --Kumis (Sữa ngựa lên men)
            LUMPY_WINE = "Chủ yếu được ủ ở Iceland.", --Rượu Lumpy (Rượu từ rau củ)
            PULQUE = "Thức uống truyền thống của Người bản địa Mesoamerican.", --Pulque (Agave Wine)người bản địa có thể.", --Pulque (Agave Wine)
            RUINCACAO_WINE = "Một loại rượu pha chế tôi chưa từng thấy trước đây. Khá hấp dẫn.", --Cacao Wine

            -- Nước ngọt hợp tác

            CHERRY_DOCTOR_COLA = "Thức uống chữa bệnh Wetsville với 23 loại gia vị.", --Cherry Forest Doctor Pepper (Doctor Cherry)
            PINEANANASSODA = "Nước ép dứa được thêm vào nước có ga.", --Dứa có ga (Orancee)
            ORANGESODA = "Nó chứa nước cam.", --Cam có ga (Fanta)
            STRAWBERRYSODA = "Nước có ga với nước ép dâu tây.", --Dâu tây có ga (Dâu tây của Welch)

            -- Tinh thần hợp tác

            AUROBOW = "Tôi nên nghiên cứu lý do tại sao thức uống này lại phát sáng.", --Shipwrecked Auroboros (Tinh thần sứa phát quang sinh học)
            COCONUT_WINE = "Rượu cọ được sản xuất ở nhiều vùng nhiệt đới khác nhau.", --Rượu dừa đắm tàu
            CHERRY_BLOOM_MADHU = "Được làm từ mật hoa và màu sắc thực sự ấn tượng.", --Rừng anh đào Rượu mật ong hoa anh đào
            GIANT_BLUEBERRY_WINE = "Nó vẫn không ổn định ngay cả sau khi lên men.", --Vitacorp Boom Berry Wine (Nổ khi bắt lửa)
            RICE_WINE = "Một trong những phương pháp bảo quản ngũ cốc lâu dài.", --Vitacorp Makgeolli (rượu gạo Hàn Quốc)
            WHEAT_BEER = "Nó bắt đầu ở Ai Cập cổ đại.", --Heap of Food Wheat Beer
            PALE_BEER = "Một loại bia lên men bề mặt.", --Leigion Pale Ale (Bia xanh làm từ trái cây Monstra)

            -- Rượu chưng cất

            DISINFECTANT = "Ethanol dùng để khử trùng vết thương. Công thức hóa học của nó là C₂H₅OH.", --Disinfectant
            CORN_WHISKEY = "Rượu whisky Bourbon từ Kentucky, Mỹ nổi tiếng.", --Corn Whiskey
            LUMPY_VODKA = "Bắt nguồn từ 'вода', có nghĩa là 'nước' trong tiếng Nga.", --Vodka
            TEQUILA = "Những người chinh phục làm mescal từ cây thùa khi họ hết nho.", --Tequila
            MADHU_RUM = "Pha loãng bằng nước khi chèo thuyền để ngăn chặn sự biến chất của nước uống.", --Rum
            BERRY_BRANDY = "Được mệnh danh là 'vua rượu mạnh' do giá cao và quá trình sản xuất phức tạp.", --Berry Brandy
            AREUHI = "Makgeolli được chưng cất và tinh chế nhiều lần để loại bỏ tạp chất.", --Rượu chưng cất Kumis Areuhi

            -- Rượu chưng cất độc quyền của Warly

            BERRY_GIN = "Ban đầu được dùng làm thuốc lợi tiểu, hạ sốt và toát mồ hôi.", --Gin
            GLOWBERRY_GIN = "Ngay cả sau khi lên men và chưng cất, nó vẫn phát ra ánh sáng.", --Glow Berry Gin
            ABSINTHE = "Rượu chưng cất được làm bằng cách chiết xuất các loại thảo mộc khác nhau trong rượu.", --Absinthe
            TEA_LUMPY_VODKA = "Thật thú vị, sự cân bằng giữa các hương vị dường như được giữ nguyên.", --Rượu mùi trà xanh
            PETALS_BERRY_BRANDY = "Hương hoa được thêm vào rượu mạnh để làm cho rượu trở nên ngoạn mục hơn.", --Rose Petal Brandy
            KAHLUA = "Được sử dụng phổ biến hơn để pha chế cocktail do mùi thơm và vị ngọt của cà phê.", --Coffee Liqueur Kahlua
            NUT_CORN_WHISKEY = "Nhấn mạnh vào hương vị của rượu whisky, làm cho rượu mạnh mẽ.", --Nut Whiskey
            RUINCACAO_CREAM_LIQUEUR = "Ban đầu được tạo ra để xử lý rượu whisky và kem còn sót lại với giá rẻ.", --Baileys Cacao Cream Liqueur
            RUMCHATA = "Rum được trộn với kem để dễ uống hơn.", --Rumchata (Rum với Horchata)

            -- Rượu chưng cất hợp tác

            MOONWAY = "Ngay cả sau khi chưng cất, nó vẫn không mất đi ánh sáng. Thật thú vị.", --Shipwrecked Moonway (Rượu sứa phát quang sinh học chưng cất)
            ARRACK = "Rượu chưng cất do người dân bản địa Nam Á sử dụng nhựa hoa dừa.", --Arrack Phiên bản Indonesia Rượu dừa chưng cất
            CHERRY_BLOOM_RUM = "Đẹp và hấp dẫn trong cơ chế hoạt động.", --Quả anh đào Mật ong Rượu chưng cất Cánh hoa anh đào nổi trong rượu
            RICE_SPIRITS = "Tương tự như rượu sake.", --Cheongju (Rượu gạo Hàn Quốc)
            WHEAT_WHISKEY = "Nó bắt đầu được sản xuất ở Ireland hoặc Scotland.", --Heap of Food Malt Whiskey
            PALE_WHISKEY = "Tôi chưa bao giờ thấy loại rượu whisky này trước đây. Nó có mùi thơm khá độc đáo.", --Pale Malt Whiskey

            -- Rượu chưng cất hợp tác độc quyền của Warly

            NUT_COCONUT_BRANDY = "Chúng tôi đã nỗ lực tạo ra bầu không khí cướp biển.", --Coconut Brandy (Thay thế bằng Caribbean Brandy vì không thể làm rượu Rum Caribbean)
            GIANT_BLUEBERRY_GIN = "Nó có đặc tính trái ngược với quá trình lên men và chưng cất, xét đến đặc tính vốn có của các thành phần.", --Boom Berry Sapphire (Nổ khi bắt lửa)

            -- Nấu nồi

            DARK_RUINCOLATE = "Sô cô la đen! Nó có hàm lượng ca cao rất cao.", --Sô cô la đen
            WHITE_RUINCOLATE = "Sô cô la trắng! Nó có hàm lượng bơ ca cao cao.", --Sô cô la trắng
            RUINCOLATE = "Sô cô la! Một dạng sô cô la rắn.", --Chocolate
            RUIN_SCHOKAKOLA = "Một loại sôcôla mới! Chất thức tỉnh đã được tăng cường.", --Shocka-Cola

            BUCKET_STEEL_EMPTY =
            {
                EMPTY = "Xô làm bằng thép.", --Xô thép rỗng
                FULL = "Nước sạch có thể uống được.", -- Nước mưa sạch
                FULL_ICE = "Những khối băng nhỏ.", -- Nước mưa đóng băng
                DIRTY = "Nước có vi khuẩn sôi.", -- Nước mưa bị bẩn
                DIRTY_ICE = "Những khối băng nhỏ chứa vi khuẩn.", -- Nước mưa bẩn đóng băng
            },

            BUCKET_WOODIE_EMPTY =
            {
                EMPTY = "Một cái xô làm bằng gỗ.", --Thùng gỗ rỗng của Woody
                FULL = "Nước sạch có thể uống được.", -- Nước mưa sạch
                FULL_ICE = "Những khối băng nhỏ.", -- Nước mưa đóng băng
                DIRTY = "Nước có vi khuẩn sôi.", -- Nước mưa bị bẩn
                DIRTY_ICE = "Những khối băng nhỏ chứa vi khuẩn.", -- Nước mưa bẩn đóng băng
            },

            BUCKET_DRIFTWOOD_EMPTY =
            {
                EMPTY = "Nó là một cái xô được làm từ gỗ mục trôi.", -- Xô gỗ rỗng
                FULL = "Nước sạch có thể uống được.", -- Nước mưa sạch
                FULL_ICE = "Những khối băng nhỏ.", -- Nước mưa đóng băng
                DIRTY = "Nước có vi khuẩn sôi.", -- Nước mưa bị bẩn
                DIRTY_ICE = "Những khối băng nhỏ chứa vi khuẩn.", -- Nước mưa bẩn đóng băng
            },

            BUCKET_EMPTY =
            {
                EMPTY = "Một cái xô làm bằng gỗ.", -- Xô gỗ rỗng
                FULL = "Nước sạch có thể uống được.", -- Nước mưa sạch
                FULL_ICE = "Những khối băng nhỏ.", -- Nước mưa đóng băng
                DIRTY = "Nước có vi khuẩn sôi.", -- Nước mưa bị bẩn
                DIRTY_ICE = "Những khối băng nhỏ chứa vi khuẩn.", -- Nước mưa bẩn đóng băng
            },

            DESALINATOR =
            {
                EMPTY = "Nước và muối được tách ra bằng máy khử muối này với nước biển.", -- Máy khử muối không có nước
                PURIFY_LONG = "Còn một chặng đường dài để khử muối.", -- Còn một chặng đường dài cho đến khi quá trình thanh lọc hoàn tất
                PURIFY_SHORT = "Khử muối gần như hoàn tất!", -- Quá trình khử muối gần như hoàn tất
                HASWATER = "Chỉ còn lại nước tinh khiết.", -- Máy khử muối có nước sạch
                BURNT = "Wow, nó hoàn toàn vô dụng trong tình trạng đó.", -- Máy khử muối đã cháy
                HASSALT = "Đã thu thập đủ muối.", -- Máy khử muối có muối
            },

            BARREL =
            {
                GENERIC = "Than được thêm vào để trữ nước an toàn.", -- Kiểm tra thùng rỗng
                BURNT = "Ồ không, hết nước rồi!", -- Thùng bị cháy
            },

            BREWERY =
            {
                EMPTY = "Chúng tôi đã bắt đầu sản xuất rượu để bảo quản thực phẩm lâu dài.", -- Kiểm tra nhà máy bia rỗng
                BURNT = "Chúng tôi sẽ phải hoãn việc nghiên cứu lên men một thời gian.", -- Brewery burn
                FERMENTING_LONG = "Bây giờ chúng ta cần kiên nhẫn trong khi các nguyên liệu lên men.", -- Còn một chặng đường dài cho đến khi quá trình lên men hoàn tất
                FERMENTING_SHORT = "Quá trình lên men gần như hoàn tất!", -- Quá trình lên men gần như hoàn tất
                DONE = "Bạn có thể ngửi thấy nó từ xa.", -- Nhà máy bia có đồ uống
            },

            CAMPKETTLE_ITEM = "Đun sôi nước bẩn để loại bỏ vi khuẩn.", -- Kiểm tra ấm đun nước di động
            CAMPKETTLE =
            {
                GENERIC = "Nó trống.", -- Kiểm tra ấm cắm trại trống
                BOILING_LONG = "Vẫn còn một chặng đường dài để khử trùng.", -- Đun sôi vừa mới bắt đầu
                BOILING_SHORT = "Nó gần như đã được tiệt trùng!", -- Quá trình đun sôi gần như hoàn tất
                DONE = "Đã tiệt trùng và sẵn sàng để uống.", -- Nước sạch đã sẵn sàng
                STOP = "Bạn cần cho một ít củi vào để hoàn tất quá trình khử trùng.", -- Lửa trại không có lửa nên nước không sôi
            },

            CAMPDESALINATOR_ITEM = "Làm bay hơi nước biển để lấy nước ngọt.", -- Kiểm tra thiết bị khử muối di động
            CAMPDESALINATOR =
            {
                GENERIC = "Không có nước ngọt được thu.", -- Không có nước
                BOILING_LONG = "Vẫn còn một chặng đường dài để lấy được nước ngọt.", -- Nước sôi vừa mới bắt đầu
                BOILING_SHORT = "Sắp đầy rồi!", -- Đun sôi gần xong
                DONE = "Nó chứa đầy nước ngọt.", -- Nước sạch được thu thập
                STOP = "Lửa đã tắt nên chưa thu đủ nước mặn.", -- Lửa trại không có lửa nên nước mặn không được chưng cất
            },

            KETTLE =
            {
                EMPTY = "Chúng tôi cần nước.", -- Kiểm tra ấm đun nước rỗng
                BURNT = "Bây giờ thật hoang vắng.", -- Ấm đun nước bị cháy
                BOILING_LONG = "Còn một chặng đường dài để chiết xuất.", -- Đun sôi vừa mới bắt đầu
                BOILING_SHORT = "Sắp xong rồi!", -- Đun sôi gần xong
                DONE = "Hãy cùng thưởng thức hương vị.", -- Đồ uống đã sẵn sàng
                PURIFY_LONG = "Chúng ta cần đợi quá trình khử trùng hoàn tất.", -- Việc đun sôi nước bẩn vừa mới bắt đầu
                PURIFY_SHORT = "Gần như đã được khử trùng!", -- Việc đun sôi nước bẩn gần như đã hoàn tất
                HASWATER = "Cần có nguyên liệu.", -- Nước sạch có trong ấm
                MELT_LONG = "Chúng ta cần đợi băng tan.", -- Nước đá tan vừa mới bắt đầu
                MELT_SHORT = "Nó gần như tan chảy!", -- Nước đá tan gần như hoàn tất
            },

            PORTABLEKETTLE_ITEM =
            {
                GENERIC = "Chúng tôi có thể chuẩn bị trà ở bất cứ đâu.", -- Kiểm tra ấm đun nước di động
                EMPTY = "Chúng ta cần thêm nước trước khi sử dụng.", -- Kiểm tra ấm đun nước di động đã hết nước
                BOILING_LONG = "Kiên nhẫn là đức tính tốt!", -- Đun sôi vừa mới bắt đầu
                BOILING_SHORT = "Sắp xong rồi!", -- Quá trình đun sôi gần như hoàn tất
                DONE = "Mùi thơm sảng khoái.", -- Đồ uống đã sẵn sàng
                PURIFY_LONG = "Chúng ta cần đợi quá trình khử trùng hoàn tất.", -- Việc đun sôi nước bẩn vừa mới bắt đầu
                PURIFY_SHORT = "Gần như đã được khử trùng!", -- Việc đun sôi nước bẩn gần như đã hoàn tất
                HASWATER = "Hmm, có lẽ tôi sẽ pha trà.", -- Nước sạch có trong ấm di động
                MELT_LONG = "Chúng ta cần đợi băng tan.", -- Nước đá tan vừa mới bắt đầu
                MELT_SHORT = "Nó gần như tan chảy!", -- Nước đá tan gần như hoàn tất
            },

            DISTILLERS =
            {
                EMPTY = "Nó được sử dụng để chưng cất rượu mạnh hoặc làm rượu mùi.", -- Kiểm tra máy chưng cất
                DISTILLTING_LONG = "Tách, vẫn chưng cất.", -- Còn một chặng đường dài cho đến khi quá trình chưng cất hoàn tất
                DISTILLING_SHORT = "Quá trình chưng cất gần như hoàn tất!", -- Quá trình chưng cất gần như hoàn tất
                DONE = "Hãy đảm bảo rằng nó được chưng cất đúng cách.", -- Distiller có đồ uống
            },

            WELL_WATERPUMP = {
                HIGH_PRESSURE = "Áp suất là quá đủ.", -- Áp suất tối đa
                MIDDLE_PRESSURE = "Áp suất vừa phải.", -- Áp suất trung bình
                LOW_PRESSURE = "Áp suất rất thấp.", -- Hầu như không có áp suất
                RECHARGE_PRESSURE = "Không thể sử dụng cho đến khi áp suất được nạp lại.", -- Áp suất bằng 0
            },

            WELL_SPRINKLER =
            {
                LOWFUEL = "Nhiên liệu sắp hết.", -- Kiểm tra mức nhiên liệu thấp
                ON = "Nhớ mặc áo mưa trước khi đến gần.", -- Sprinkler đang chạy
                OFF = "Nó làm ẩm môi trường xung quanh.", -- Vòi phun nước không chạy
            },
        },
    }