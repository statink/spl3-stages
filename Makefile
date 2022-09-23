MAP_KEYS := amabi chozame gonzui kinmedai mahimahi masaba mategai namero sumeshi yagara yunohana zatou

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
	convert $< -resize $(IMAGE_SIZE)^ -blur 2x2 -quality $(JPEG_QUALITY) $@
	jpegoptim --strip-all --all-progressive $@

images/gray-normal/%.jpg: src/%.png
	convert $< -resize $(IMAGE_SIZE)^ -fx 'r*0.299+g*0.587+b*0.114' -colorspace Gray -quality $(JPEG_QUALITY) $@
	jpegoptim --strip-all --all-progressive $@
                                
images/gray-blur/%.jpg: src/%.png
	convert $< -resize $(IMAGE_SIZE)^ -blur 2x2 -fx 'r*0.299+g*0.587+b*0.114' -colorspace Gray -quality $(JPEG_QUALITY) $@
	jpegoptim --strip-all --all-progressive $@

src/amabi.png:
	curl -fsSL 'https://cdn.wikimg.net/en/splatoonwiki/images/9/9e/S3_Inkblot_Art_Academy.jpeg' | convert - 'src/amabi.png'

src/chozame.png:
	curl -fsSL 'https://cdn.wikimg.net/en/splatoonwiki/images/a/a5/S3_Sturgeon_Shipyard.jpg' | convert - 'src/chozame.png'

src/gonzui.png:
	curl -fsSL 'https://cdn.wikimg.net/en/splatoonwiki/images/8/84/S3_promo_screenshot_Eeltail_Alley_00.jpg' | convert - 'src/gonzui.png'

src/kinmedai.png:
	curl -fsSL 'https://cdn.wikimg.net/en/splatoonwiki/images/2/2c/S3_Stage_Museum_d%27Alfonsino_Promo_1.jpg' | convert - 'src/kinmedai.png'

src/mahimahi.png:
	curl -fsSL 'https://cdn.wikimg.net/en/splatoonwiki/images/b/b7/S3MahiMahiResortIcon.jpeg' | convert - 'src/mahimahi.png'

src/masaba.png:
	curl -fsSL 'https://cdn.wikimg.net/en/splatoonwiki/images/2/24/S3HammerheadBridgeIcon.jpeg' | convert - 'src/masaba.png'

src/mategai.webp:
	curl -fsSL -o $@ 'https://cdn.wikimg.net/en/splatoonwiki/images/f/f2/S3UndertowSpillwayIcon.webp'

src/mategai.png: src/mategai.webp
	dwebp -mt $< -o $@

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

