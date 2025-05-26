/particles/musk
	icon = 'icons/effects/particles/smoke.dmi'
	icon_state = list(
		"steam_cloud_1" = 1,
		"steam_cloud_2" = 1,
		"steam_cloud_3" = 1,
		"steam_cloud_4" = 1,
		"steam_cloud_5" = 1,
	)
	width = 48 // the icon_states are quite large, they tend to get cut off in 32x32
	height = 48
	count = 6
	spawning = 0.05
	lifespan = 4 SECONDS
	fadein = 1 SECONDS
	fade = 2 SECONDS
	color = "#ffffff54"
	spin = generator(GEN_NUM, 1, -1)
	position = generator(GEN_BOX, list(-9,-9,0), list(9,18,0), NORMAL_RAND)
	scale = generator(GEN_VECTOR, list(0.9,0.9), list(1.1,1.1), NORMAL_RAND)
	gravity = list(0, -0.01)

/particles/musk/strong
	count = 64
	spawning = 0.4
	color = "#ffffff23"
