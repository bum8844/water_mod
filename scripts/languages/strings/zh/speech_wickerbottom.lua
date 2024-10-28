return {
    ACTIONFAIL =
    {
        GIVE =
        {
            WELL_NOTEMPTY = "这口井只能容纳一个桶。",
            WELL_BUSY = "先等等吧。",
        }
    },

        ANNOUNCE_DRUNK = "消-消化系统……思考能力也……嗯唔……",
        ANNOUNCE_DRUNK_END = "嗯，绝对不能喝太多了。",
        ANNOUNCE_DRUNK_IMMUNITY = "only_used_by_wathgrithr", -- 女武神专用，不用改
        ANNOUNCE_NOTCHARGE = "这羊还没到可以挤奶的时候。",
        ANNOUNCE_NOTHIRSTSLEEP = "身体缺水了，虽然我本来就睡不着。", -- 自己加的，反正没有意义，就当保险起见（just in case）
        ANNOUNCE_NOTHIRSTSIESTA = "身体缺水了，虽然我白天也睡不着。", -- 自己加的，反正没有意义，就当保险起见（just in case）
        ANNOUNCE_SLEEP_END = "酒醒后需要补充身体的水分。", -- 自己加的，反正没有意义，就当保险起见（just in case）
        ANNOUNCE_THIRST = "图书管理员需要喝水。",

        ANNOUNCE_CAFFINE_BUFF_START = "腺苷体感受到咖啡因的作用了。",
        ANNOUNCE_CAFFINE_BUFF_STOP = "咖啡因被代谢完了。",

        ANNOUNCE_CURE_WATERBORNE = "这流行病的疼痛感开始平息了。",

        ANNOUNCE_DCAPACITY_CRITICAL = "不能喝太多了，对肝不好而且……",
        ANNOUNCE_DCAPACITY_HALF = "适度饮酒还是有益的。", -- 翻译忠告：能不碰就不碰

        DESCRIBE =
        {
            BOILBOOK = "饮料资讯的锦集。",

            WATER_CLEAN_ICE = "固态的水。",
            WATER_DIRTY_ICE = "有微生物的固态水。",

            SPICE_CAFFEINPEPPER = "它在以前是稀有且值钱的香料。",

            WELL_KIT = "用来做出从地下水脉取水的建筑材料。",
            WELL_SPRINKLER_KIT = "从地下水脉取水用于灌溉的机器。",
            WELL_WATERPUMP_KIT = "从地下水脉把水泵出来的机器。",
            WELL_BURYING_KIT = "把没用了的洞埋起来的工具。",
            WELL_DRILLING = "它在探查这里有没有地下水。",
            WELL_DRILLING_ITEM = "需要找个有地下水的合适地点。",
            HOLE = "能听到水声，我应该挖到位了。",
            WELL = "用来从地下水脉取水的建筑。",

            WX78MODULE_NONEDRUNK = "尽管TA不喜欢有机物，但似乎并不反对从它们那里获得灵感。", -- 可以写成“对有机物的反感不影响从它们那里得到灵感。”

            -- 模组植物

            TEA_TREE = "一种山茶属小树。",
            DUG_TEA_TREE = "它需要泥土才能成长。",
            TEA_SEED = "茶树的种子。",
            TEA_SEED_COOKED = "拿来种植比起这样会更好。",
            TEA_SEED_SAPLING = "茶树的种子正在长大。",
            TEALEAVES = "山茶科山茶属的一种叶子。",
            TEALEAVES_DRIED = "可以用来做红茶。",

            CAFFEINBERRY = "长在月亮沙土的矮小灌丛。",
            DUG_CAFFEINBERRY = "是咖啡和胡椒的合体。",
            CAFFEINBERRY_BEAN = "它有着独特的香味。",
            CAFFEINBERRY_BEAN_COOKED = "烤出了略带胡椒风味的强烈咖啡味。",

            RUINCACAO_TREE = "它的果子应该是从天坑掉下来的。",
            DUG_RUINCACAO_TREE = "它需要泥土才能成长。",
            RUINCACAO_SEED = "可可树的种子。",
            RUINCACAO_SEED_SAPLING = "可可树的种子正在长大。",
            RUINCACAO = "古阿兹塔克文明的一种货币。",
            RUINCACAO_BEAN = "由少量黄油和可可豆组成。",
            RUINCACAO_BEAN_COOKED = "用来做巧克力或者饮料。",

            -- 添加剂

            ADDITIVE_SEED = "给酒加些种子的风味。",
            ADDITIVE_PETALS = "给酒加些花朵和叶子的风味。",
            ADDITIVE_NUT = "给酒加些坚果的风味。",
            ADDITIVE_DAIRY = "给酒加些奶油的风味。",

            -- 水

            WATER_CLEAN = "生物的生存要素之一，化学式H₂O。",
            WATER_DIRTY = "有着大量的微生物，流行病的元凶。",
            WATER_SALTY = "喝下这个会导致缺水。",

            GOOPYDRINK = "哦，不，不，不。这根本不行。",

            -- 茶壶饮料

            FRUITJUICE = "用有缺陷的水果做的也不错。",
            BERRIES_JUICE = "朱砂根浆果有着清热和消炎的功能。",
            POMEGRANATE_JUICE = "富含天然雌激素。",
            BANANA_JUICE = "来杯暖和的饮料也不错。",
            FIG_JUICE = "中东地区的传统清凉饮料。",
            DRAGONJUICE = "白色果肉的略带芳香。",
            GLOWBERRYJUICE = "没见过这样的饮料，真神奇！",
            WATERMELON_JUICE = "它丰富的水含量有助于解渴。",

            VEGGIE_TEA = "健康饮料一般是苦的。",
            CARROT_TEA = "富含维生素和铁，多方面的。",
            CACTUS_TEA = "来自墨西哥区域的传统茶水。",
            TOMATO_JUICE = "它有着有助于解酒的成分。",
            LUMPY_TEA = "它有着可以缓解流行病的成分。",
            SEAWEED_SHAKE = "它里面的藻酸赋予了它的粘性。",

            GREENTEA = "起源于亚洲地区。",
            BLACKTEA = "配得上一本好书。",
            BLACKTEA_ICED = "它有助于提神。",
            FUER = "它有着可以缓解流行病的成分。",
            MIXFLOWER = "用多种花瓣做出来的饮料。",
            HIBISCUSTEA = "用木槿属的花做的。",
            CACTUSFLOWER_TEA = "一些地方认为这个对身体有益。",
            LOTUSTEA = "在部分亚洲地区的节日饮料。",
            SUSHIBISCUS = "等等，这和洛神花茶不一样。",
            MOON_BLOSSOM_TEA = "看着就能令我安心。",

            CAFFEINBERRY_JUICE = "一杯咖啡和一本好书也是不错的组合。",
            TOFFEE_LATTE = "它有着附带坚果风味的浓厚香味。",
            RUINCHA_LATTE = "咖啡和巧克力的混合物，它的名字起源于某个地方。",

            HOTRUINCOLATE = "辛辣热巧克力传入欧洲后的改版。",
            RUINCOLATE_SMOOTHIE = "热巧克力的改版！",
            RUINXOCOLATL = "古阿兹塔克的饮料。",
            TEA_RUINCOLATE_LATTE = "这个方法使饮料种类变得更丰富了。",

            MULLED = "像是年关期间的喜庆氛围。",
            BUTTERBEER = "著名的虚构饮料，同时也不是酒。",

            -- 联动茶壶饮料

            COCONUT_JUICE = "椰汁发酵后形成果冻了。",
            RAINBOW_SHAKE = "有趣，它还保留着原生物的发光特性。",
            QUARTZ_SHAKE = "我应该为它搞个独立研究。",
            CHERRY_ROSEBERRIES_TEA = "又香又甜。",
            CHERRY_HONEY_TEA = "感觉身体暖和起来了。",
            SWEET_RICE_DRINK = "发酵后更甜且易于消化。",
            ANANAS_JUICE = "富含使口腔溃疡的蛋白酶，别喝太多了。",
            ORANGE_JUICE = "橘子汁，像是饮料界的立体音声。",
            STRAWBERRY_SMOOTHIE = "混在一起的草莓和冰，再加上奶会更好。",
            STRAWBERRY_MILK_SMOOTHIE = "一个受欢迎的饮料，也可以用酸奶代替。",

            -- 其它

            SPOILED_DRINK = "这饮料已经变成微生物滋生的温床了。",

            -- 气泡水

            SODA = "二氧化碳溶解在水里并离子化后的产物。",
            FRUITSODA = "加了果汁的碳酸水。",
            LEMONLIMESODA = "它有很强烈的甜味。",
            COLA = "美国近期的流行饮料。", -- 背景是1907的时候
            COLAQUANTUM = "唔……该研究下过量喝这个有什么副作用。",
            LUMPY_BEER = "混合了多种根茎蔬菜。",

            -- 酿酒

            CORN_BEER = "它的历史可以追溯到古印加时期。",
            MADHU = "蜂蜜酒，人类酿出来的第一种酒精饮料。",
            WINE = "一般是用葡萄酿出来的，虽然以前也有用树莓的案例。",
            NOBLEWINE = "一种叫灰葡萄孢菌的微生物赋予了它深沉的甜味。",
            SPARKLINGWINE = "二氧化碳一般是经由发酵产生的，不过这里是人工加进去的。",
            GLOWBERRYWINE = "一种新的酿酒，得找出它是怎样维持发酵前的发光特性。",
            KUMIS = "传统中亚饮料。",
            LUMPY_WINE = "主要产自于冰岛。",
            PULQUE = "中美洲土著的传统饮料。",
            RUINCACAO_WINE = "没见过的酿酒，真是令人好奇。",

            -- 联动气泡水

            CHERRY_DOCTOR_COLA = "有医药价值的饮料，用23种香料做出来的。",
            ANANASSODA = "加了松萝汁的碳酸水。",
            ORANGESODA = "含有橘子汁。",
            STRAWBERRYSODA = "含有草莓汁的碳酸水。",

            -- 联动酿酒

            AUROBOW = "我该研究一下这个是怎样发光的。",
            COCONUT_WINE = "热带地区产出的棕榈酒。",
            CHERRY_BLOOM_MADHU = "用繁花蜜做的，颜色真好看。",
            GIANT_BLUEBERRY_WINE = "发酵后还留存着不稳定性。",
            RICE_WINE = "一种长期储存谷类的方法。",
            WHEAT_BEER = "起源于古埃及。",
            PALE_BEER = "在上层发酵的一种酒。",

            -- 烈酒

            DISINFECTANT = "消毒用乙醇，化学式C₂H₅OH。",
            CORN_WHISKEY = "美国肯塔基州的波本威士忌还是很出名的。",
            LUMPY_VODKA = "来自俄语“вода”，也就是“水”。",
            TEQUILA = "以前的征服者用龙舌草作为葡萄的替代品做出这些酒。",
            MADHU_RUM = "用水稀释它是为了在航海期间保证饮用水不会坏掉。",
            BERRY_BRANDY = "以高价格和复杂工序闻名的“烈酒之王”。",
            AREUHI = "通过多次蒸馏奶酒来移除里面的杂质。",

            --烈酒（添加剂）

            BERRY_GIN = "原本是以利尿，清热和促进消化作为用途的药用饮料。",
            GLOWBERRY_GIN = "在发酵和蒸馏后还是维持着它的发光特性。",
            ABSINTHE = "加入了多种药草的蒸馏烈酒。",
            TEA_LUMPY_VODKA = "有趣，它的多种风味还是如此般配。",
            PETALS_BERRY_BRANDY = "为白兰地增添花香使得它更加叹为观止。",
            KAHLUA = "它的咖啡香和甜味使它经常用于调配鸡尾酒。",
            NUT_CORN_WHISKEY = "着重于加强威士忌作为主体的特性。",
            RUINCACAO_CREAM_LIQUEUR = "曾经作为处理过剩威士忌和奶油的经济方案。",
            RUMCHATA = "朗姆酒混了奶油有助于入口。",

            -- 联动烈酒

            MOONWAY = "蒸馏后还是会发光，有趣。",
            ARRACK = "南亚土著用椰树花汁液做的蒸馏酒。", -- 就是树液
            CHERRY_BLOOM_RUM = "很漂亮，它的作用机制也值得发掘。",
            RICE_SPIRITS = "很像日本的米酒。",
            WHEAT_WHISKEY = "源自于爱尔兰或者苏格兰。",
            PALE_WHISKEY = "没见过这种有着独特气味的威士忌。",

            -- 联动烈酒（添加剂）

            NUT_COCONUT_BRANDY = "它已经尽可能衬托出海盗的氛围了。",
            GIANT_BLUEBERRY_GIN = "考虑到原材料的特性，这个饮料有着和发酵与蒸馏相对的特性。",

            -- Pot Cooking

            DARK_RUINCOLATE = "高可可含量的黑巧克力！",
            WHITE_RUINCOLATE = "高可可脂含量的白巧克力！",
            RUINCOLATE = "固态巧克力！",
            RUIN_SCHOKAKOLA = "加强了提神作用的新型巧克力！",

            BUCKET_STEEL_EMPTY =
            {
                EMPTY = "用钢做的桶。",
                FULL = "装着你能喝的干净水。",
                FULL_ICE = "装着碎成小块的冰。",
                DIRTY = "装着有微生物活动的水。",
                DIRTY_ICE = "装着有微生物活动的冰块。",
            },

            BUCKET_WOODIE_EMPTY =
            {
                EMPTY = "用圆木做的桶。",
                FULL = "装着你能喝的干净水。",
                FULL_ICE = "装着碎成小块的冰。",
                DIRTY = "装着有微生物活动的水。",
                DIRTY_ICE = "装着有微生物活动的冰块。",
            },

            BUCKET_DRIFTWOOD_EMPTY = 
            {
                EMPTY = "用浮木做的桶。",
                FULL = "装着你能喝的干净水。",
                FULL_ICE = "装着碎成小块的冰。",
                DIRTY = "装着有微生物活动的水。",
                DIRTY_ICE = "装着有微生物活动的冰块。",
            },

            BUCKET_EMPTY =
            {
                EMPTY = "用木头做的桶。",
                FULL = "装着你能喝的干净水。",
                FULL_ICE = "装着碎成小块的冰。",
                DIRTY = "装着有微生物活动的水。",
                DIRTY_ICE = "装着有微生物活动的冰块。",
            },

            DESALINATOR =
            {
                EMPTY = "海水可以通过这个分离出净水和盐。",
                PURIFY_LONG = "还需要一段时间。",
                PURIFY_SHORT = "它就快好了！",
                HASWATER = "只剩下干净的水了。",
                BURNT = "哎呀，它现在失去作用了。",
                HASSALT = "堆积的盐够多了。",
            },

            BARREL =
            {
                GENERIC = "加了木炭来维持水的质量。",
                BURNT = "天啊，水都没了！",
            },

            BREWERY =
            {
                EMPTY = "以前的人为了保存粮食会把它们酿成酒。",
                BURNT = "看来这段时间研究不了发酵机制了。",
                FERMENTING_LONG = "现在得耐心等里面的材料发酵。",
                FERMENTING_SHORT = "就快发酵好了！",
                DONE = "从远处都能闻到它散发着的气味。",
            },

            CAMPKETTLE_ITEM = "记得把脏水煮开，灭菌很重要。",
            CAMPKETTLE =
            {
                GENERIC = "是空的。",
                BOILING_LONG = "灭菌流程还需要一段时间。",
                BOILING_SHORT = "灭菌流程就快好了！",
                DONE = "灭菌完成，可以喝了。",
                STOP = "得加些木柴完成灭菌流程。",
            },

            CAMPDESALINATOR_ITEM = "把海水蒸发成干净的水。",
            CAMPDESALINATOR =
            {
                GENERIC = "里面没有能喝的水。",
                BOILING_LONG = "还需要一段时间收集干净的水。",
                BOILING_SHORT = "就快满了！",
                DONE = "它装满了干净的水。",
                STOP = "火灭了，里面干净的水还不够多。",
            },

            KETTLE =
            {
                EMPTY = "需要加一些水。",
                BURNT = "真是可悲。",
                BOILING_LONG = "还需要一些时间提取精华。",
                BOILING_SHORT = "就快好了！",
                DONE = "来尝尝它的味道吧。",
                PURIFY_LONG = "灭菌流程还需要一段时间。",
                PURIFY_SHORT = "灭菌流程就快好了！",
                HASWATER = "得多加一些材料。",
                MELT_LONG = "得等冰块完全化开。",
                MELT_SHORT = "就快化完了！",
            },

            PORTABLEKETTLE_ITEM =
            {
                GENERIC = "可以随处泡茶了。",
                EMPTY = "需要加一些水才能用。",
                BOILING_LONG = "懂得忍耐是美德！",
                BOILING_SHORT = "就快好了！",
                DONE = "它散发的香气真迷人。",
                PURIFY_LONG = "灭菌流程还需要一段时间。",
                PURIFY_SHORT = "灭菌流程就快好了！",
                HASWATER = "唔，来泡些茶好了。",
                MELT_LONG = "得等冰块完全化开。",
                MELT_SHORT = "就快化完了！",
            },

            DISTILLERS =
            {
                EMPTY = "用来蒸馏出烈酒。",
                DISTILLTING_LONG = "它还在分离阶段。",
                DISTILLING_SHORT = "就快蒸馏完了！",
                DONE = "来看看是不是蒸馏完了。",
            },

            WELL_WATERPUMP = {
                HIGH_PRESSURE = "里面的压力绰绰有余。",
                MIDDLE_PRESSURE = "里面的压力够用了。",
                LOW_PRESSURE = "里面的压力很低了。",
                RECHARGE_PRESSURE = "里面的压力恢复之前暂时不能用了。",
            },

            WELL_SPRINKLER =
            {
                LOWFUEL = "燃料不多了。",
                ON = "先穿上雨衣才过去吧。",
                OFF = "它能保持周遭环境潮湿。",
            },
        },
    }