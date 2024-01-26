const { ref } = Vue;

class WaveCurve {
    constructor(opt) {
        this.opt = opt || {};
        this.controller = opt.controller;
        this.color = opt.color;
        this.tick = 0;

        this.respawn = this.respawn.bind(this);
        this.equation = this.equation.bind(this);
        this.drawAlt = this.equation.bind(this);
        this.draw = this.draw.bind(this);

        this.respawn();
    }

    respawn() {
        this.amplitude = 0.3 + Math.random() * 0.7;
        this.seed = Math.random();
        this.open_class = 2 + Math.random() * 3 || 0;
    }

    equation(i) {
        const p = this.tick;
        const y = -1 * Math.abs(Math.sin(p)) * (this.controller.amplitude * this.amplitude) * this.controller.MAX * (1 / (1 + (this.open_class * i) ** 2) ** 2);
        if (Math.abs(y) < 0.001) {
            this.respawn();
        }
        return y;
    }

    dram(m) {
        this.tick += this.controller.speed * (1 - 0.5 * Math.sin(this.seed * Math.PI));
        const ctx = this.controller.ctx;
        ctx.beginPath();
        const xBase = this.controller.width / 2 + (-this.controller.width / 4 + this.seed * (this.controller.width / 2));
        const yBase = this.controller.height / 2;
        let x;
        let y;
        let xInit;
        let i = -3;
        while (i <= 3) {
            x = xBase + (i * this.controller.width) / 4;
            y = yBase + m * this.equation(i);
            xInit = xInit || x;
            ctx.lineTo(x, y);
            i += 0.01;
        }
        const h = Math.abs(this.equation(0));
        const gradient = ctx.createRadialGradient(xBase, yBase, h * 1.15, xBase, yBase, h * 0.3);
        gradient.addColorStop(0, `rgba(${this.color.join(",")},0.4)`);
        gradient.addColorStop(1, `rgba(${this.color.join(",")},0.2)`);
        ctx.fillStyle = gradient;
        ctx.lineTo(xInit, yBase);
        ctx.closePath();
        ctx.fill();
    }

    draw() {
        this.dram(-1);
        this.dram(1);
    }
}

class VoiceWaves {
    constructor(opt) {
        this.opt = opt || {};
        this.tick = 0;
        this.run = false;
        // UI vars
        this.ratio = this.opt.ratio || window.devicePixelRatio || 1;
        this.width = this.ratio * (this.opt.width || 320);
        this.height = this.ratio * (this.opt.height || 100);
        this.MAX = this.height / 2;
        this.speed = 0.1;
        this.amplitude = this.opt.amplitude || 1;
        // Canvas
        this.canvas = document.createElement("canvas");
        this.canvas.width = this.width;
        this.canvas.height = this.height;
        this.canvas.style.width = `${this.width / this.ratio}px`;
        this.canvas.style.height = `${this.height / this.ratio}px`;
        this.container = this.opt.container || document.body;
        this.container.appendChild(this.canvas);
        this.ctx = this.canvas.getContext("2d");
        // Create curves
        this.curves = [];
        // Colors
        this.colors = [
            [223, 246, 255],
            [19, 99, 223],
            [71, 181, 255],
        ];
        this.init = this.init.bind(this);
        this.clear = this.clear.bind(this);
        this.draw = this.draw.bind(this);
        this.start = this.start.bind(this);
        this.stop = this.stop.bind(this);

        this.init();
    }

    init() {
        const vm = this;
        for (let i = 0; i < vm.colors.length; i += 1) {
            const color = vm.colors[i];
            for (let j = 0; j < 3 * Math.random() || 0; j += 1) {
                vm.curves.push(
                    new WaveCurve({
                        controller: vm,
                        color,
                    })
                );
            }
        }
        if (vm.opt.autostart) {
            vm.start();
        }
    }

    clear() {
        this.ctx.globalCompositeOperation = "destination-out";
        this.ctx.fillRect(0, 0, this.width, this.height);
        this.ctx.globalCompositeOperation = "lighter";
    }

    draw() {
        if (this.run === false) return;
        this.clear();
        const len = this.curves.length;
        for (let i = 0; i < len; i += 1) {
            this.curves[i].draw();
        }
        requestAnimationFrame(this.draw.bind(this));
    }

    start() {
        this.tick = 0;
        this.run = true;
        this.draw();
    }

    stop() {
        this.tick = 0;
        this.run = false;
    }
}

let opt;
let voicewaves;


const app = Vue.createApp({
    data() {
        return {
            showModal: false,
            alwaysOnMap: this.initializeAlwaysOnMap(),
            timeAboveMap: this.initializeTimeAboveMap(),
            streetAboveMap: this.initializeStreetAboveMap(),
            showBodyHealth: this.initializeshowBodyHealth(),
            showCompass: this.initializeshowCompass(),
            showRadioPlayers: this.initializeShowRadioPlayers(),
            showMoney: this.initializeShowMoney(),
            showStreet: this.initializeShowStreet(),
            showLogoLink: this.initializeShowLogoLink(),
            mainColor: this.initializeMainColor(),
        };
    },
    mounted() {
        window.addEventListener('keydown', this.handleKeyDown);

        this.listener = window.addEventListener("message", (event) => {
            if (event.data.type === "hud_settings") {
                if (event.data.action == "open") {
                    this.openSettings();
                } else if (event.data.action == "close") {
                    this.closeSettings();
                } else if (event.data.action == "setSetting") {
                    eval(`this.${event.data.setting} = "${event.data.value}"`);
                }
            }
        });
    },
    methods: {
        handleKeyDown(event) {
            if (event.key == "Escape") {
                if (this.showModal) {
                    this.closeSettings();
                }
            }
        },
        openSettings() {
            $("#settings-modal").modal('show');
        },
        closeSettings() {
            $("#settings-modal").modal("hide");
            $.post('https://complete_hud/closeSettings');
        },
        resetHud() {
            $.post('https://complete_hud/resetHud');
        },
        initializeAlwaysOnMap() {
            const value = localStorage.getItem("alwaysOnMap");
            if (value === null) {
                return false;
            } else {
                return value == "true";
            }
        },
        initializeTimeAboveMap() {
            const value = localStorage.getItem("timeAboveMap");
            if (value === null) {
                return false;
            } else {
                return value == "true";
            }
        },
        initializeStreetAboveMap() {
            const value = localStorage.getItem("streetAboveMap");
            if (value === null) {
                return false;
            } else {
                return value == "true";
            }
        },
        initializeshowBodyHealth() {
            const value = localStorage.getItem("showBodyHealth");
            if (value === null) {
                return false;
            } else {
                return value == "true";
            }
        },
        initializeshowCompass() {
            const value = localStorage.getItem("showCompass");
            if (value === null) {
                return false;
            } else {
                return value == "true";
            }
        },
        initializeShowRadioPlayers() {
            const value = localStorage.getItem("showRadioPlayers");
            if (value === null) {
                return false;
            } else {
                return value == "true";
            }
        },
        initializeShowMoney() {
            const value = localStorage.getItem("showMoney");
            if (value === null) {
                return false;
            } else {
                return value == "true";
            }
        },
        initializeShowStreet() {
            const value = localStorage.getItem("showStreet");
            if (value === null) {
                return false;
            } else {
                return value == "true";
            }
        },
        initializeShowLogoLink() {
            const value = localStorage.getItem("showLogoLink");
            if (value === null) {
                return false;
            } else {
                return value == "true";
            }
        },
        initializeMainColor() {
            const value = localStorage.getItem("mainColor");
            if (value === null) {
                return "#0099e1";
            } else {
                return value;
            }
        },
        alwaysOnMapHandler() {
            $.post('https://complete_hud/alwaysOnMap');
        },
        timeAboveMapHandler() {
            $.post('https://complete_hud/timeAboveMap');
        },
        streetAboveMapHandler() {
            $.post('https://complete_hud/streetAboveMap');
        },
        showBodyHealthHandler() {
            $.post('https://complete_hud/showBodyHealth');
        },
        showCompassHandler() {
            $.post('https://complete_hud/showCompass');
        },
        showRadioPlayersHandler() {
            $.post('https://complete_hud/showRadioPlayers');
        },
        showMoneyHandler() {
            $.post('https://complete_hud/showMoney');
        },
        showStreetHandler() {
            $.post('https://complete_hud/showStreet');
        },
        showLogoLinkHandler() {
            $.post('https://complete_hud/showLogoLink');
        },
        mainColorHandler() {
            $.post('https://complete_hud/mainColor', JSON.stringify({
                color: this.mainColor
            }));
        },
    },
    watch: {
        alwaysOnMap: function () {            
            localStorage.setItem("alwaysOnMap", this.alwaysOnMap);
        },
        timeAboveMap: function () {
            localStorage.setItem("timeAboveMap", this.timeAboveMap);
        },
        streetAboveMap: function () {
            localStorage.setItem("streetAboveMap", this.streetAboveMap);
        },
        showBodyHealth: function () {
            localStorage.setItem("showBodyHealth", this.showBodyHealth);
        },
        showCompass: function () {
            localStorage.setItem("showCompass", this.showCompass);
        },
        showRadioPlayers: function () {
            localStorage.setItem("showRadioPlayers", this.showRadioPlayers);
        },
        showMoney: function () {
            localStorage.setItem("showMoney", this.showMoney);
        },
        showStreet: function () {
            localStorage.setItem("showStreet", this.showStreet);
        },
        showLogoLink: function () {
            localStorage.setItem("showLogoLink", this.showLogoLink);
        },
        mainColor: function () {
            localStorage.setItem("mainColor", this.mainColor);
        },
    }
});

app.mount("#settings-app");


const app2 = Vue.createApp({
    data() {
        return {
            hud_initialized: false,
            alwaysOnMap: true,
            timeAboveMap: true,
            streetAboveMap: true,
            showBodyHealth: true,
            showCompass: false,
            showRadioPlayers: true,
            showMoney: true,
            showStreet: true,
            showLogoLink: true,
            showBodyHealth: true,
            display_money: true,
            display_minimap: true,
            display_key: false,
            display_pause: false,
            display_body: true,
            id: 0,
            total_players: 0,
            server_text: "",
            logo_img: "",
            money: null,
            time: "",
            day: "",
            health: 0,
            armor: 0,
            hunger: 0,
            thirst: 0,
            last_value: 0,
            last_value_icon: "",
            talking: false,
            voice_level: 0,
            weapon_name: null,
            weapon_loaded_ammo: 0,
            weapon_total_ammo: 0,
            current_street: "",
            current_direction: "",
            name: "",
            pause_info1: [],
            pause_info2: [],
            pause_info3: [],
            pause_info4: [],
            pause_info5: [],
            pause_info6: [],
            pause_cards: [],
            radio_hz: 0,
            head: false,
            chest: false,
            left_arm: false,
            left_leg: false,
            left_hand: false,
            left_foot: false,
            right_arm: false,
            right_leg: false,
            right_hand: false,
            right_foot: false,
            current_degrees: 0,
            ping: 0,
            money_number: 0,
            stat: null,
            body_damage_on_hurted: false,
        };
    },
    mounted() {
        window.addEventListener('keydown', this.handleKeyDown);

        this.listener = window.addEventListener("message", (event) => {
            const data = event.data;
            if (data.type === "network_stats") {
                this.id = data.id;
                this.total_players = data.total_players;
                this.server_text = data.server_text;
                this.logo_img = data.logo_img;
            } else if (data.type === "initialize_hud") {
                this.hud_initialized = true;

                this.name = data.name
                this.currency = data.currency
                this.pause_info1 = data.info1
                this.pause_info2 = data.info2
                this.pause_info3 = data.info3
                this.pause_info4 = data.info4
                this.pause_info5 = data.info5
                this.pause_info6 = data.info6
                this.pause_cards = data.cards

                this.body_damage_on_hurted = data.body_damage
                if (this.body_damage_on_hurted) {
                    this.display_body = false
                }

                const keys = JSON.parse(data.keys)
                this.last_value_icon = data.last_value;
                
                // wait until document.getElementById("compass") is not null
                var interval = setInterval(function () {
                    if (document.getElementById("compass") != null) {
                        clearInterval(interval);
                        this.current_degrees = "0";

                        var degrees = document.getElementById("degrees");
                        degrees.setAttribute("viewBox", "" + (this.current_degrees - 90) + " 0 180 2.5");

                        var compass = document.getElementById("compass");
                        compass.setAttribute("viewBox", "" + (this.current_degrees - 90) + " 0 180 1.5");
                    }
                }, 100);

                setTimeout(function () {
                    document.getElementById('key_list').innerHTML = ''
                    for (var key in keys) {
                        var li = `<li class="" style="display: flex; align-items: baseline; justify-content: flex-end;">
                            <strong style="margin-right: 0.5rem; font-size: 14px; color: #ebebeb; line-height: 18px; margin-bottom: 5px; font-weight: 600;">${keys[key]}</strong>
                            <span class="text-white avatar" style="border-radius: 35px; background-color: #000000a1; font-size: 20px;">
                            <div style="margin-right: 1px">${key}</div>
                            </span>
                        </li>`;
                        $("#key_list").append(li);    
                    }
                }, 1000);
            } else if (data.type == "date_time") {
                this.time = data.time
                this.day = data.day
            } else if (data.type == "change_status") {
                this.health = data.health 
                this.armor = data.armor 
                this.hunger = data.food 
                this.thirst = data.thirst
                this.last_value = data.last_value 
                this.talking = data.talking 
                this.voice_level = data.voice_level 
                this.id = data.id 
                this.total_players = data.total_players
                this.current_street = data.street
                this.ping = data.ping

                if (!this.display_pause) {
                    if (this.money == null) {
                        this.setupMoney(data.money);
                    } else {
                        if (this.money != data.money) {
                            this.updateMoney(data.money);
                        }
                    }

                    this.money = data.money

                    var microphone_div = document.getElementById('microphone_activity')
                    if (microphone_div && microphone_div.innerHTML) {
                        if (this.talking == true) {
                            voicewaves.amplitude = this.voice_level
                        } else {
                            voicewaves.amplitude = 0.03
                        }
                    } else {
                        if (microphone_div) {
                            microphone_div.innerHTML = ''
                        }
                        opt = {
                            width: 90,
                            height: 30,
                            speed: 0.2,
                            amplitude: 0.1,
                            container: document.getElementById("microphone_activity"),
                            autostart: true,
                        };
                        voicewaves = new VoiceWaves(opt);
                    }
                }


                this.alwaysOnMap = data.alwaysOnMap
                this.timeAboveMap = data.timeAboveMap
                this.streetAboveMap = data.streetAboveMap
                this.showBodyHealth = data.showBodyHealth
                this.showCompass = data.showCompass
                this.showRadioPlayers = data.showRadioPlayers
                this.showMoney = data.showMoney
                this.showStreet = data.showStreet
                this.showLogoLink = data.showLogoLink
                this.mainColor = data.mainColor
        
                this.setCircleStatus(this.health, 'status_healt')
                this.setCircleStatus(this.armor, 'status_armor')
                this.setCircleStatus(this.hunger, 'status_hunger')
                this.setCircleStatus(this.thirst, 'status_thirst')
                this.setCircleStatus(this.last_value, 'status_last')
            } else if (data.type == "show_ui") {
                $("#main_hud").fadeIn();
            } else if (data.type == "hide_ui") {
                $("#main_hud").fadeOut();
            } else if (data.type == "show_weapon") {
                var group = data.group 
                var name = data.name 
                this.weapon_loaded_ammo = data.current_ammo
                this.weapon_total_ammo = data.total_ammo 
                
                if (this.weapon_name != name) {
                    if (group != "melee") {                
                        if (group == "pistol") {
                            $('#weapon_ammo_container').css('right', '4.0%');
                        } else {
                            $('#weapon_ammo_container').css('right', '6.5%');
                        }

                        if (document.getElementById("weapon_img")) {
                            document.getElementById("weapon_img").src = "./img/weapons/" + name
                        }
                        
                        $('#weapon_img_container').toggleClass('animate__fadeOutRight animate__fadeInRight');
                        $('#weapon_ammo_container').toggleClass('animate__fadeOutRight animate__fadeInRight');
                        $("#weapon_img_container").fadeIn();
                        $("#weapon_ammo_container").fadeIn();
                    } else {
                        $('#weapon_img_container').toggleClass('animate__fadeInRight animate__fadeOutRight');
                        $('#weapon_ammo_container').toggleClass('animate__fadeInRight animate__fadeOutRight');
                        $("#weapon_img_container").fadeOut();
                        $("#weapon_ammo_container").fadeOut();
                    }
                    
                    this.weapon_name = name
                }
            } else if (data.type == "hide_weapon") {
                if (this.weapon_name != null) {
                    $('#weapon_img_container').toggleClass('animate__fadeInRight animate__fadeOutRight');
                    $('#weapon_ammo_container').toggleClass('animate__fadeInRight animate__fadeOutRight');
                    this.weapon_name = null
                }
            } else if (data.type == "show_mimimap") {
                this.display_minimap = true
                $("#time_div_moved").fadeOut();
                $("#time_div").fadeIn();
                $("#status_div").removeClass('minimap-close');
                $("#status_div").addClass('minimap-open');
                $("#mimimap_outline").fadeIn();
            } else if (data.type == "hide_mimimap") {
                this.display_minimap = false
                $("#mimimap_outline").fadeOut();
                $("#time_div").fadeOut();
                $("#time_div_moved").fadeIn();
                $("#status_div").removeClass('minimap-open');
                $("#status_div").addClass('minimap-close');
            } else if (data.type == "radio") {
                const radio_players = data.players
                const talking_radio_players = data.talking_players
                var hz = data.hz
                if (!this.display_pause) {                    
                    if (data.hz == "OFF") {
                        if (!$("#radio_status").hasClass("status-red")) {
                            $("#radio_status").toggleClass("status-green status-red");
            
                            $('#radio_players_list .animate__fadeInLeft').toggleClass('animate__fadeInLeft animate__fadeOutLeft');
                            setTimeout(function () {
                                if (document.getElementById("radio_players_list")) {
                                    document.getElementById("radio_players_list").innerHTML = ""
                                }
                            }, 2000);
                        }
                    } else {
                        hz = hz + " Hz"
                        if (!$("#radio_status").hasClass("status-green")) {
                            $("#radio_status").toggleClass("status-red status-green");
                        }
            
                        for (let i = 0; i < radio_players.length; i++) {
                            const player = radio_players[i];
                            const is_talking = talking_radio_players.includes(player);
                            if (document.getElementById(player) == null) {
                                const talking_strong_class = is_talking ? 'talking-player' : '';
                                const talking_radio_class = is_talking ? 'radio-icon-active' : '';
                                var player_div = `<li id="${player}" class="mb-1 animate__animated animate__fadeInLeft" style="display: flex; align-items: center">
                                    <i class="fa-solid fa-volume-high radio-icon ${talking_radio_class}" style="color: rgba(255, 255, 255, 0.55) !important;"></i>
                                    <strong style="margin-left: 0.5rem" class="${talking_strong_class}">${player}</strong>
                                </li>`
                                $("#radio_players_list").append(player_div);
                            } else {
                                var found = false
                                for (let j = 0; j < radio_players.length; j++) {
                                    const player2 = radio_players[j];
                                    if (player == player2) {
                                        found = true
                                    }
                                }
                                if (found == false) {
                                    document.getElementById(player).remove()
                                } else {
                                    var radio_icon = document.getElementById(player).getElementsByClassName("radio-icon")[0];
                                    var talking_strong = document.getElementById(player).getElementsByClassName("talking-player")[0];
                                    if (is_talking) {
                                        if (radio_icon && !radio_icon.classList.contains("radio-icon-active")) {
                                            radio_icon.classList.add("radio-icon-active");
                                        }
                                        if (talking_strong && !talking_strong.classList.contains("talking-player")) {
                                            talking_strong.classList.add("talking-player");
                                        }
                                    } else {
                                        if (radio_icon && radio_icon.classList.contains("radio-icon-active")) {
                                            radio_icon.classList.remove("radio-icon-active");
                                        }
                                        if (talking_strong && talking_strong.classList.contains("talking-player")) {
                                            talking_strong.classList.remove("talking-player");
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
        
                this.radio_hz = hz
            } else if (data.type == "server_announcement") {
                this.createAnnouncement(data.title, data.text, data.time)
            } else if (data.type == "show_key_menu") {
                if (this.display_key == false) {
                    this.display_key = true
                    $('#key_container').toggleClass('animate__fadeOutRight animate__fadeInRight');
                    $("#key_container").fadeIn();
                    setTimeout(function () {
                        $('#key_container').toggleClass('animate__fadeInRight animate__fadeOutRight');
                        $("#key_container").fadeOut();
                        this.display_key = false
                    }, 6000);
                }
            } else if (data.type == "pause_menu") {
                this.display_pause = true
            } else if (data.type == "body_damage") {
                if (data.action == "add") {
                    eval(`this.${event.data.part} = true`);

                    if (this.body_damage_on_hurted) {
                        this.display_body = true
                    }
                } else if (data.action == "reset") {
                    this.head = false
                    this.chest = false
                    this.left_arm = false
                    this.left_leg = false
                    this.left_hand = false
                    this.left_foot = false
                    this.right_arm = false
                    this.right_leg = false
                    this.right_hand = false
                    this.right_foot = false

                    if (this.body_damage_on_hurted) {
                        this.display_body = false
                    }
                }
            } else if (data.type == "compass") {
                this.current_degrees = data.degree;
                this.changeCompass();
            } else if (data.type == "reset_money") {
                this.setupMoney(this.money);
            }
        });
    },
    beforeDestroy() {
        document.getElementById('microphone_activity').innerHTML = '';

        window.removeEventListener('keydown', this.handleKeyDown);
        
        if (this.listener) {
            window.removeEventListener("message", this.listener);
        }
    },
    methods: {
        handleKeyDown(event) {
            if (event.key == "Escape") {
                if (this.display_pause) {
                    this.closePauseMenu();
                }
            }
        },
        setCircleStatus(perc, element_id) {
            if (perc < 0) {
                perc = 0
            }
            var stroke, stroke_dasharray, stroke_id, icon_id
            stroke = (185 * perc) / 100;
            stroke_id = element_id + "_stroke"
            icon_id = element_id + "_icon"
        
            if (document.getElementById(stroke_id) != null) {
                if (perc == 0) {
                    document.getElementById(stroke_id).setAttribute('stroke-width', '0');
                } else {
                    document.getElementById(stroke_id).setAttribute('stroke-width', '5');
                }
        
                stroke_dasharray = stroke.toString() + " 1000";
                document.getElementById(stroke_id).setAttribute('stroke-dasharray', stroke_dasharray);
                
                if (icon_id == "status_healt_icon") {
                    if (perc <= 20 && perc > 0) {
                        if (!$(`#${icon_id}`).hasClass("fa-beat")) {
                            $(`#${icon_id}`).addClass('fa-beat');
                        }
                        $(`#${icon_id}`).css('--fa-animation-duration', '0.4s');
                    } else if (perc > 20) {
                        if (!$(`#${icon_id}`).hasClass("fa-beat")) {
                            $(`#${icon_id}`).addClass('fa-beat');
                        }
                        $(`#${icon_id}`).css('--fa-animation-duration', '1.5s');
                    } else if (perc == 0) {
                        if ($(`#${icon_id}`).hasClass("fa-beat")) {
                            $(`#${icon_id}`).removeClass('fa-beat');
                        }
                    }
                } else {
                    if (perc <= 15 && perc > 0 && icon_id != "status_last_icon") {
                        $(`#${icon_id}`).addClass('fa-fade');
                    } else if (perc > 15 && icon_id != "status_last_icon") {
                        $(`#${icon_id}`).removeClass('fa-fade');
                    } else if (perc == 0) {
                        if ($(`#${icon_id}`).hasClass("fa-fade")) {
                            $(`#${icon_id}`).removeClass('fa-fade');
                        }
                    }
                }
            }
        },
        closePauseMenu() {
            this.display_pause = false
            $.post('https://complete_hud/close');
            $("#main_pause_menu").fadeOut();
            document.getElementById("main_pause_menu").style.background = "rgba(0, 0, 0, 0)";
            $("#pause_menu_page").html("");
        },
        disconnect() {
            $.post('https://complete_hud/disconnect');
        },
        openCard(number) {
            this.closePauseMenu();
            $.post('https://complete_hud/open-card', JSON.stringify({
                number: number
            }));
        },
        changeCompass() {
            if (document.getElementById("degrees") == null || document.getElementById("compass") == null) {
                return;
            }
            var degrees = document.getElementById("degrees");
            degrees.setAttribute("viewBox", "" + (this.current_degrees - 90) + " 0 180 2.5");

            var compass = document.getElementById("compass");
            compass.setAttribute("viewBox", "" + (this.current_degrees - 90) + " 0 180 1.5");
        },
        createAnnouncement(title, text, time) {
            if (!title) {
                title = "Announcement";
            }
            if (!text) {
                text = "There was an error with the announcement.";
            }
            if (!time) {
                time = 5000;
            }
            time = parseInt(time);

            var announcement_div = `
            <div id="server_announcement" class="animate__animated animate__fadeInDownBig mb-3" style="width: 375px; height: auto; background-color: #1f1f1f; border-radius: 15px; --animate-duration: 2s;">
                <div class="p-3" style="background: linear-gradient(145deg, rgb(167 40 40 / 30%) 0%, #1f1f1f 40%) !important; border-radius: 15px;">
                    <div class="row">
                        <div class="col-3" style="display: flex; align-items: center; justify-content: center;">
                            <div style="display: flex; align-items: center; justify-content: center;">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 254 254" width="100%" style="height: 60px; width: 60px;" preserveAspectRatio="xMidYMid meet" role="img">
                                    <circle
                                        fill="#a72828b6"
                                        cx="50%"
                                        cy="50%"
                                        r="100"
                                        style="opacity: 1; transition: all 0.2s cubic-bezier(0.57, 0.13, 0.18, 0.98) 0s;"
                                    ></circle>
                                </svg>
                                <i style="position: absolute; margin-top: 0px; color: #ebebeb;" class="fa-solid fa-xl fa-bell fa-shake"></i>
                            </div>
                        </div>
                        <div class="col-9">
                            <h4 class="alert-title" style="font-size: 1.075rem !important; font-weight: 700;">${title}</h4>
                            <div style="font-weight: 400; opacity: 0.8;">${text}</div>
                        </div>
                    </div>
                </div>
            </div>`;

            $("#server_announcements_container").append(announcement_div);

            setTimeout(function () {
                $('#server_announcement').toggleClass('animate__fadeInDown animate__fadeOutUp');
                setTimeout(function () {
                    $('#server_announcement').remove();
                }, 2000);
            }, time);
        },
        setupMoney(startNum) {
            this.stat = document.querySelector('#money_container')
            this.money_number = startNum
            const digits = startNum.toString().split('')
        
            for (let i = 0; i < digits.length; i++) {
                this.addDigit('0', true)
            }
        
            this.scrollNumber(['0'])
        
            setTimeout(() => this.scrollNumber(digits), 2000)
        },
        updateMoney(num) {
            if (!num) {
                num = 0
            }

            if (document.getElementById("money_h4") != null) {          
                if (num < this.money_number) {
                    document.getElementById("money_h4").classList.add("money_red");
                    setTimeout(function () {
                        document.getElementById("money_h4").classList.remove("money_red");
                    }, 2000);
                } else if (num > this.money_number) {
                    document.getElementById("money_h4").classList.add("money_green");
                    setTimeout(function () {
                        document.getElementById("money_h4").classList.remove("money_green");
                    }, 2000);
                }
            }

            const toDigits = num.toString().split('')
            const fromDigits = this.money_number.toString().split('')
        
            for (let i = fromDigits.length - toDigits.length; i > 0; i--) {
                this.removeDigit()
            }
            for (let i = toDigits.length - fromDigits.length; i > 0; i--) {
                this.addDigit(toDigits[i]);
            }
        
            this.scrollNumber(toDigits)
            this.money_number = num
        },
        scrollNumber(digits) {
            if (this.stat != null) {                
                this.stat.querySelectorAll('span[data-value]').forEach((tick, i) => {
                    tick.style.transform = `translateY(-${100 * parseInt(digits[i])}%)`;
                })
                setTimeout(() => {
                    this.stat.style.width = `${digits.length * 18}px`;
                }, 100)
            }
        },
        addDigit(digit, fresh) {
            const spanList = Array(10).join(0).split(0).map((x, j) => `<span>${j}</span>`).join('')
            
            if (this.stat != null) {                
                this.stat.insertAdjacentHTML(
                    "beforeend",
                    `<span style="transform: translateY(-1000%)" data-value="${digit}">
                    ${spanList}
                </span>`)

                const firstDigit = this.stat.lastElementChild
            
                setTimeout(() => {
                    firstDigit.className = "visible";
                }, fresh ? 0 : 2000);
            }
        },
        removeDigit() {
            const firstDigit = this.stat.lastElementChild
            firstDigit.classList.remove("visible");
            setTimeout(() => {
                firstDigit.remove();
            }, 2000);
        }, 
        rollToNumber(num) {
            el.style.transform = `translateY(-${100 - num * 10}%)`;
        } 
    }  
});

app2.mount("#hud-app");