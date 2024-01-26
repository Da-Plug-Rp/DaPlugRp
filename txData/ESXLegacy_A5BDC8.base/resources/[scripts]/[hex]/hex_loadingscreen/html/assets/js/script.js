const app = new Vue({
    el: '.lscr',
    data: {
        loadingPercent: 50,
        volume: Config.YOUTUBE.volume
    },
    methods: {
        getColor(index) {
            return Config.COLORs[index] || "#fff";
        },
        getUrl(index) {
            return Config.URLs[index] || "https://google.com/";
        },
        getText(index) {
            return Config.TEXTs[index] || "Undefined";
        },
        toLink(index) {
            const url = this.getUrl(index);
            window.invokeNative('openUrl', url);
        },
        setVolume(value) {
            this.volume = value
            this.$refs.youtube.player.setVolume(this.volume)
        },
        getYoutube(index) {
            return Config.YOUTUBE[index]
        }
    },
    watch: {
        volume(newValue) {
            let val = newValue
            this.volume = val
            this.$refs.youtube.player.setVolume(this.volume)
            this.$refs.rangeSlider.style.backgroundImage = `-webkit-gradient(linear, left top, right top, color-stop(${val / 100}, #FF2E3A), color-stop(${val / 100}, rgba(255,255,255,0.3)))`
        }
    },
    computed: {
        USERs() {
            return Config.USERs;
        }
    },
    mounted() {
        window.addEventListener("message", (event) => {
            if (event.data.eventName == 'loadProgress') {
                this.loadingPercent = parseInt(event.data.loadFraction * 100)
            }
        })

        this.$refs.rangeSlider.style.backgroundImage = `-webkit-gradient(linear, left top, right top, color-stop(${this.volume / 100}, #FF2E3A), color-stop(${this.volume / 100}, rgba(255,255,255,0.3)))`
        this.$refs.youtube.player.setVolume(this.volume)
    }
})