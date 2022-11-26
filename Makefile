MAP_KEYS := \
	amabi \
	aramaki \
	chozame \
	dam \
	donburako \
	gonzui \
	hirame \
	kinmedai \
	kusaya \
	mahimahi \
	masaba \
	mategai \
	meuniere \
	namero \
	sumeshi \
	yagara \
	yunohana \
	zatou

SRC_FILES := $(addprefix src/,$(addsuffix .png,$(MAP_KEYS)))

COLOR_NORMAL_IMAGE_FILES := $(addprefix images/color-normal/,$(addsuffix .jpg,$(MAP_KEYS)))
COLOR_BLUR_IMAGE_FILES := $(addprefix images/color-blur/,$(addsuffix .jpg,$(MAP_KEYS)))
GRAY_NORMAL_IMAGE_FILES := $(addprefix images/gray-normal/,$(addsuffix .jpg,$(MAP_KEYS)))
GRAY_BLUR_IMAGE_FILES := $(addprefix images/gray-blur/,$(addsuffix .jpg,$(MAP_KEYS)))
TARGET_IMAGE_FILES := $(COLOR_NORMAL_IMAGE_FILES) $(COLOR_BLUR_IMAGE_FILES) $(GRAY_NORMAL_IMAGE_FILES) $(GRAY_BLUR_IMAGE_FILES)

IMAGE_SIZE := 480x270
JPEG_QUALITY = 85

.PHONY: all
all: $(TARGET_IMAGE_FILES)

.PHONY: clean
clean:
	rm -f $(TARGET_IMAGE_FILES)

.PHONY: dist-clean
	rm -f $(TARGET_IMAGE_FILES) $(SRC_FILES)

images/color-normal/%.jpg: src/%.png
	convert $< -resize $(IMAGE_SIZE)^ -quality $(JPEG_QUALITY) $@
	jpegoptim --strip-all --all-progressive $@

images/color-blur/%.jpg: src/%.png
	convert $< -resize $(IMAGE_SIZE)^ -blur 3x3 -quality $(JPEG_QUALITY) $@
	jpegoptim --strip-all --all-progressive $@

images/gray-normal/%.jpg: src/%.png
	convert $< -resize $(IMAGE_SIZE)^ -fx 'r*0.299+g*0.587+b*0.114' -colorspace Gray -quality $(JPEG_QUALITY) $@
	jpegoptim --strip-all --all-progressive $@
                                
images/gray-blur/%.jpg: src/%.png
	convert $< -resize $(IMAGE_SIZE)^ -blur 3x3 -fx 'r*0.299+g*0.587+b*0.114' -colorspace Gray -quality $(JPEG_QUALITY) $@
	jpegoptim --strip-all --all-progressive $@

src/amabi.png:
	curl -fsSL 'https://cdn.wikimg.net/en/splatoonwiki/images/9/9e/S3_Inkblot_Art_Academy.jpeg' | convert - 'src/amabi.png'

src/aramaki.png:
	curl -fsSL 'https://splatoon3.ink/assets/splatnet/stage_img/icon/high_resolution/3418d2d89ef84288c78915b9acb63b4ad48df7bfcb48c27d6597920787e147ec_0.png' | convert - 'src/aramaki.png'

src/chozame.png:
	curl -fsSL 'https://cdn.wikimg.net/en/splatoonwiki/images/a/a5/S3_Sturgeon_Shipyard.jpg' | convert - 'src/chozame.png'

src/dam.png:
	curl -fsSL 'https://splatoon3.ink/assets/splatnet/stage_img/icon/high_resolution/be584c7c7f547b8cbac318617f646680541f88071bc71db73cd461eb3ea6326e_0.png' | convert - 'src/dam.png'

src/donburako.png:
	curl -fsSL -o $@ 'https://cdn.wikimg.net/en/splatoonwiki/images/0/01/S3_Stage_Marooner%27s_Bay.png'

src/gonzui.png:
	curl -fsSL 'https://cdn.wikimg.net/en/splatoonwiki/images/8/84/S3_promo_screenshot_Eeltail_Alley_00.jpg' | convert - 'src/gonzui.png'

src/hirame.png:
	curl -fsSL 'https://cdn.wikimg.net/en/splatoonwiki/images/2/24/S3_Flounder_Heights.jpg' | convert - 'src/hirame.png'

src/kinmedai.png:
	curl -fsSL 'https://cdn.wikimg.net/en/splatoonwiki/images/2/2c/S3_Stage_Museum_d%27Alfonsino_Promo_1.jpg' | convert - 'src/kinmedai.png'

src/kusaya.png:
	curl -fsSL -o $@ 'https://cdn.wikimg.net/en/splatoonwiki/images/b/bf/S3_Brinewater_Springs.png'

src/mahimahi.png:
	curl -fsSL 'https://cdn.wikimg.net/en/splatoonwiki/images/b/b7/S3MahiMahiResortIcon.jpeg' | convert - 'src/mahimahi.png'

src/masaba.png:
	curl -fsSL 'https://cdn.wikimg.net/en/splatoonwiki/images/2/24/S3HammerheadBridgeIcon.jpeg' | convert - 'src/masaba.png'

src/mategai.webp:
	curl -fsSL -o $@ 'https://cdn.wikimg.net/en/splatoonwiki/images/f/f2/S3UndertowSpillwayIcon.webp'

src/mategai.png: src/mategai.webp
	dwebp -mt $< -o $@

src/meuniere.png:
	curl -fsSL 'https://splatoon3.ink/assets/splatnet/stage_img/icon/high_resolution/f1e4df4cff1dc5e0acc66a9654fecf949224f7e4f6bd36305d4600ac3fa3db7b_0.png' | convert - 'src/meuniere.png'

src/namero.webp:
	curl -fsSL -o $@ 'https://cdn.wikimg.net/en/splatoonwiki/images/a/a8/S3MincemeatMetalworksIcon.webp'

src/namero.png: src/namero.webp
	dwebp -mt $< -o $@

src/sumeshi.png:
	curl -fsSL 'https://cdn.wikimg.net/en/splatoonwiki/images/5/53/S3_Wahoo_World.jpg' | convert - 'src/sumeshi.png'

src/yagara.webp:
	curl -fsSL -o $@ 'https://cdn.wikimg.net/en/splatoonwiki/images/2/2e/S3HagglefishMarketIcon.webp'

src/yagara.png: src/yagara.webp
	dwebp -mt $< -o $@

src/yunohana.png:
	curl -fsSL 'https://cdn.wikimg.net/en/splatoonwiki/images/c/c2/S3_promo_screenshot_Scorch_Gorge_00.jpg' | convert - 'src/yunohana.png'

src/zatou.png:
	curl -fsSL 'https://cdn.wikimg.net/en/splatoonwiki/images/a/ac/S3_Mako_Mart.jpg' | convert - 'src/zatou.png'
