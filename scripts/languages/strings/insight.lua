return
{
	INSIGHT =
	{	
<<<<<<< HEAD
=======
		COLOR_CODE = 
		{
			EMPTY = "<color=#FFFFFF>",
			DIRTY = "<color=#4E5347>",
			DIRTY_ICE = "<color=#BBC6B7>",
			CLEAN = "<color=#2F70C0>",
			CLEAN_ICE = "<color=#91B4DE>",
			ACID = "<color=#D2FF46>",
			SALTY = "<color=#71BEB8>",
			UNCLEAN_MINERAL = "<color=#47886D>",
			MINERAL = "<color=#78B29A>",
			MOONGLASS = "<color=#A8DCC7>",
			SALT = "<color=#E0E0E0>",
		},
>>>>>>> Beta_1.2.8
		STATE =
		{
			MELT = "<color=#85AFAF>해동</color>",
			PURIFY = "<color=#2F70C0>정수</color>",
			DESALINATION = "<color=#71BEB8>제염</color>",
			EMPTY = "<color=#FFFFFF>비어있음</color>",
			DIRTY = "<color=#4E5347>더러운 물</color>",
			DIRTY_ICE = "<color=#BBC6B7>더러운 물(얼어붙음)</color>",
			CLEAN = "<color=#2F70C0>깨끗한 물</color>",
			CLEAN_ICE = "<color=#91B4DE>깨끗한 물(얼어붙음)</color>",
<<<<<<< HEAD
			SALTY = "<color=#71BEB8>바닷물</color>",
=======
			ACID = "<color=#D2FF46>산성용액</color>",
			SALTY = "<color=#71BEB8>바닷물</color>",
			UNCLEAN_MINERAL = "<color=#78B29A>결정화된 미네랄 워터</color>",
>>>>>>> Beta_1.2.8
			MINERAL = "<color=#78B29A>미네랄 워터</color>",
			SOPIL = "<color=#4E5347>썩기</color>",
			GAIN = "<color=#2F70C0>차기</color>",
			DRY = "마르기",
			REFRESH = "<color=#2F70C0>정수</color>",
			BUCKET_EMPTY = "<color=#785F4F>양동이</color>",
			BUCKET_WOODIE_EMPTY = "<color=#524129>속 빈 나무동이</color>",
			BUCKET_STEEL_EMPTY = "<color=#8C8B84>강철 양동이</color>",
<<<<<<< HEAD
=======
			SALT = "<color=#E0E0E0>소금</color>",
			MOONGLASS = "<color=#A8DCC7>달유리</color>"
		},

		WATER =
		{
			RAWTEXT = "상태 : %s",
			RAWTEXT_EXT = "상태 : %s / 남은 양 : %s",
			RAWTEXT_TIME =  "상태 : {state} / 초기화 까지 : {time}",
			RAWTEXT_TIME_EXT =  "상태 : {state} / 남은 양 : {num} / 초기화 까지 : {time}",
>>>>>>> Beta_1.2.8
		},

		DISTILLER =
		{
			RAWTEXT = "%s 끝나기까지 %s 초(s).",
		},

		WATERLEVEL =
		{
<<<<<<< HEAD
			RAWTEXT = "상태 : %s / 수량 : <color=#2F70C0>%s/%s</color>",
=======
			RAWTEXT = "상태 : %s / 수량 : %s%s/%s</color>",
>>>>>>> Beta_1.2.8
		},

		WATERSPOILAGE =
		{
<<<<<<< HEAD
			RAWTEXT = "{state},이(가) 까지 {time},",
			RAWTEXT_EXT = "{state},이(가) 까지 {time},({percent},)",
=======
			RAWTEXT = "{state}가 완료 될 까지 {time},",
			RAWTEXT_EXT = "{state}가 완료 될 까지 {time},({percent})",
>>>>>>> Beta_1.2.8
		},

		STEAMPRESSURE =
		{
<<<<<<< HEAD
			RAWTEXT = "<color=#D4D4D4>증기</color>가 {percent}, 충전됨",
			RAWTEXT_EXT = "<color=#D4D4D4>증기</color>가 {percent},(<color=#D4D4D4>{cur},/{max},</color>) 충전됨",
			RAWTEXT_TIME = "<color=#D4D4D4>증기</color>가 완충 될 때까지 {time},({percent},)",
			RAWTEXT_TIME_EXT = "<color=#D4D4D4>증기</color>가 완충됨 {time},({percent},)[<color=#D4D4D4>{cur},/{max},</color>]",
=======
			RAWTEXT = "<color=#D4D4D4>증기</color>가 {percent}% 충전됨",
			RAWTEXT_EXT = "<color=#D4D4D4>증기</color>가 {percent}%,(<color=#D4D4D4>{cur}/{max}</color>) 충전됨",
			RAWTEXT_TIME = "<color=#D4D4D4>증기</color>가 완충 될 때까지 {time}({percent}%)",
			RAWTEXT_TIME_EXT = "<color=#D4D4D4>증기</color>가 완충 될 때까지 {time}({percent}%)[<color=#D4D4D4>{cur}/{max}</color>]",
>>>>>>> Beta_1.2.8
		},

		WATERINGSTRUCTURE =
		{
<<<<<<< HEAD
			RAWTEXT = "<color=#D4D4D4>증기</color>가 {percent}, 충전됨",
			RAWTEXT_EXT = "<color=#D4D4D4>증기</color>가 {percent},(<color=#D4D4D4>{cur},/{max},</color>) 충전됨",
			RAWTEXT_TIME = "<color=#D4D4D4>증기</color>가 완충 될 때까지 {time},({percent},)",
			RAWTEXT_TIME_EXT = "<color=#D4D4D4>증기</color>가 완충됨 {time},({percent},)[<color=#D4D4D4>{cur},/{max},</color>]",
=======
			RAWTEXT = "물통 : {bucket}\n물의 상태 : {state}",
			RAWTEXT_EXT = "물통 : {bucket} / 내구도 {percent},({cur}/{max})\n물의 상태 : {state}(수량 : {amount})",
			RAWTEXT_TIME = "물통 : {bucket}\n물의 상태 : {state}\n{n_state} 까지 {time}",
			RAWTEXT_TIME_EXT = "물통 : {bucket} / 내구도 {percent},({cur}/{max})\n물의 상태 : {state}(수량 : {amount})\n{n_state} 까지 {time}",
>>>>>>> Beta_1.2.8
		},


		WATERINGTOOL =
		{
<<<<<<< HEAD
			RAWTEXT_GAIN_LOSS= "물 %s 까지 %s",
=======
			RAWTEXT_GAIN_LOSS= "%s %s 까지 %s",
>>>>>>> Beta_1.2.8
			RAWTEXT_TIME = "물의 상태 : %s / %s 까지 %s",
			RAWTEXT_TIME_EXT = "물의 상태 : %s(수량 : %s) / %s 까지 %s",
			RAWTEXT = "물의 상태 : %s",
			RAWTEXT_EXT = "물의 상태 : %s(수량 : %s)",
		},

<<<<<<< HEAD
		SALTMAKER =
		{
			RAWTEXT = "<color=#E0E0E0>소금</color> 저장량 <color=#E0E0E0>%s/%s</color>",
			RAWTEXT_EXT = "<color=#E0E0E0>소금</color> 저장 <color=#E0E0E0>%s/%s</color> (<color=#E0E0E0>%s/%s</color>)",
=======
		DESALINATIORABLE =
		{
			RAWTEXT = "%s 저장량 %s%s/%s</color>",
			RAWTEXT_EXT = "%s 저장 %s%s/%s</color> (%s%s/%s</color>)",
>>>>>>> Beta_1.2.8
		},

		EDIBLE =
		{
			RAWTEXT =
			{
				LONG = "<color=#2F70C0>수분</color>: <color=#2F70C0>%s</color>",
				SHORT = "<color=#2F70C0>%s</color>",
			},
		},

		THIRST =
		{
			REWTEXT = "<color=#2F70C0>수분</color>: <color=#2F70C0>%s</color> / <color=#2F70C0>%s</color>",
			REWTEXT_BURN = "<color=#2F70C0>증발중</color>: <color=#2F70C0>%+d/day</color> (<color=#2F70C0>%s/s</color>)",
			REWTEXT_PAUSED = "<color=#2F70C0>수분</color> 증발이 멈춤.",
		},
	},
}